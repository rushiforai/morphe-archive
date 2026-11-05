package app.template.patches.flashscore.misc.promo

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Firebase In-App Messaging's display callback. Its implementation is obfuscated, but it
// implements this kept interface and the interface keeps the method name. Only the display side
// is touched: FIAM's campaign fetching and Firebase Messaging (push) are left alone.
private const val FIAM_DISPLAY = "Lcom/google/firebase/inappmessaging/FirebaseInAppMessagingDisplay;"

/**
 * Makes every FirebaseInAppMessagingDisplay.displayMessage implementation return at once, so
 * server-side In-App Messaging campaigns never render. Skipped when the app does not bundle FIAM;
 * fails when it does but no implementation is found. Mirrors Sofascore's patch.
 */
private fun BytecodePatchContext.blockInAppMessaging() {
    var bundled = false
    val displays = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type == FIAM_DISPLAY) bundled = true
        if (FIAM_DISPLAY in classDef.interfaces) displays += classDef
    }
    if (!bundled) return
    var patched = 0
    for (classDef in displays) {
        mutableClassDefBy(classDef).methods
            .filter { it.name == "displayMessage" && it.returnType == "V" && it.implementation != null }
            .forEach { it.returnEarly(); patched++ }
    }
    if (patched == 0) throw PatchException("No FirebaseInAppMessagingDisplay.displayMessage implementation found")
}

@Suppress("unused")
val blockMarketingPopupsPatch = bytecodePatch(
    name = "Block marketing popups",
    description = "Blocks promo popups.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        // 1. The remote dialog never shows. onResume parses the server dialog into a model stored
        // on the helper, then reads it back and only builds the dialog when it is not null. The
        // value read back is replaced with null, so onResume takes the app's own "no dialog"
        // branch (the one it uses before any dialog is configured) and carries on as before.
        val helper = RemoteDialogHelperFingerprint.classDef.type
        val onResume = RemoteDialogOnResumeFingerprint.method
        val insns = onResume.implementation!!.instructions.toList()
        fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
        val urlIndex = insns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "btnGoUrl"
        }
        // The parsed model is stored on the helper right after the "btnGoUrl" read...
        val storeIndex = (urlIndex + 1 until insns.size).firstOrNull {
            insns[it].opcode == Opcode.IPUT_OBJECT && insns[it].field()?.definingClass == helper
        } ?: throw PatchException("Block marketing popups: onResume stores no dialog model on $helper")
        val model = insns[storeIndex].field()!!
        // ...and read back for the null check that guards the dialog.
        val readIndex = (storeIndex + 1 until insns.size).firstOrNull {
            insns[it].opcode == Opcode.IGET_OBJECT && insns[it].field() == model
        } ?: throw PatchException("Block marketing popups: onResume never reads $model back")
        val register = (insns[readIndex] as TwoRegisterInstruction).registerA
        val checked = insns.subList(readIndex + 1, minOf(readIndex + 4, insns.size)).any {
            (it.opcode == Opcode.IF_NEZ || it.opcode == Opcode.IF_EQZ) && (it as OneRegisterInstruction).registerA == register
        }
        if (!checked) throw PatchException("Block marketing popups: the $model read is not followed by its null check")
        onResume.requireNoBranchTargetAt(readIndex + 1, "remote dialog model")
        onResume.addInstructionChecked(
            readIndex + 1,
            if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0",
        )

        // 2. Firebase In-App Messaging popups.
        blockInAppMessaging()

        // 3. No promo strips are ever parsed from remote config.
        InAppStripParseFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )
    }
}
