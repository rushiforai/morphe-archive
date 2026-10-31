package com.feurstagram.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION

private const val SHARE_LINKS = "Lcom/feurstagram/extension/ShareLinks;"

/** Framework calls that put text on the clipboard -> our static replacement (same arguments). */
private val CLIPBOARD_REDIRECTS = mapOf(
    "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;"
        to "$SHARE_LINKS->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;",
    "Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V"
        to "$SHARE_LINKS->setText(Landroid/text/ClipboardManager;Ljava/lang/CharSequence;)V",
    "Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V"
        to "$SHARE_LINKS->setText(Landroid/text/ClipboardManager;Ljava/lang/CharSequence;)V",
)

private fun MethodReference.key() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Instruction.registerList(): String = when (this) {
    is RegisterRangeInstruction -> "v$startRegister .. v${startRegister + registerCount - 1}"
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).joinToString { "v$it" }
    else -> throw PatchException("Unexpected invoke format $opcode")
}

/** p-register of parameter [index], counting `this` and wide types. */
private fun Method.pOf(index: Int): Int =
    (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) +
        parameterTypes.take(index).sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

// ShareUtil's intent builder: every "share to app" path ends here with the text in a Bundle.
internal object ShareIntentBundleFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("android.intent.extra.EXCLUDE_COMPONENTS", "image/jpeg"),
    custom = { method, _ -> method.parameterTypes.any { it.toString() == "Landroid/os/Bundle;" } },
)

// ShareUtil's video branch, which takes the link as a String (second-to-last String parameter
// since Instagram 453; the last one before that).
internal object ShareVideoIntentFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("android.intent.extra.TEXT", "media_id", "ranking_token"),
)

@Suppress("unused")
val cleanLinksPatch = bytecodePatch(
    name = "Clean share links",
    description = "Strips Instagram's tracking parameters (igsh, utm_*...) from links you copy or share.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        var redirected = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/feurstagram/")) return@classDefForEach
            val hits = classDef.methods.any { m ->
                m.implementation?.instructions?.any { it.getReference<MethodReference>()?.key() in CLIPBOARD_REDIRECTS } == true
            }
            if (!hits) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                val insns = method.implementation?.instructions?.toList() ?: return@forEach
                insns.forEachIndexed { index, insn ->
                    val target = insn.getReference<MethodReference>()?.key()?.let(CLIPBOARD_REDIRECTS::get) ?: return@forEachIndexed
                    val range = insn.opcode.name.endsWith("_RANGE")
                    method.replaceInstruction(
                        index,
                        "invoke-static${if (range) "/range" else ""} { ${insn.registerList()} }, $target",
                    )
                    redirected++
                }
            }
        }
        if (redirected == 0) throw PatchException("No clipboard call sites found")

        ShareIntentBundleFingerprint.method.apply {
            val p = pOf(parameterTypes.indexOfFirst { it.toString() == "Landroid/os/Bundle;" })
            addInstructions(0, "invoke-static/range { p$p .. p$p }, $SHARE_LINKS->cleanBundle(Landroid/os/Bundle;)V")
        }
        ShareVideoIntentFingerprint.method.apply {
            // The link is the second-to-last String parameter (the last is not the link).
            val stringParams = parameterTypes.indices.filter { parameterTypes[it].toString() == "Ljava/lang/String;" }
            if (stringParams.size < 2) throw PatchException("Share video intent: link parameter not found")
            val index = stringParams[stringParams.size - 2]
            val p = pOf(index)
            addInstructions(
                0,
                """
                    invoke-static/range { p$p .. p$p }, $SHARE_LINKS->clean(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p$p
                """,
            )
        }
    }
}
