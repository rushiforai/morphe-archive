package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val SHARE_LINKS = "Lapp/tiktoklitepatches/extension/ShareLinks;"

@Suppress("unused")
val cleanShareLinks = bytecodePatch(
    name = "Clean share links",
    description = "Removes known tracking parameters and copies TikTok links without the promotional text.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "TikTok Lite",
        packageName = "com.zhiliaoapp.musically.go",
        targets = listOf(tikTokLite4782Target),
    ))
    dependsOn(tikTokLiteExtension)

    execute {
        for (model in listOf("minilite/feed/model", "feed/model")) {
            val method = Fingerprint(
                definingClass = "Lcom/ss/android/ugc/aweme/$model/Aweme;",
                name = "getShareUrl",
                parameters = emptyList(),
                returnType = "Ljava/lang/String;",
            ).method
            val returns = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.RETURN_OBJECT) {
                    index to (instruction as OneRegisterInstruction).registerA
                } else {
                    null
                }
            }
            check(returns.isNotEmpty()) { "No object returns in $model/Aweme.getShareUrl" }
            for ((index, register) in returns.asReversed()) {
                method.addInstructions(index, """
                    invoke-static/range {v$register .. v$register}, $SHARE_LINKS->clean(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """.trimIndent())
            }
        }

        val clipboard = Fingerprint(
            definingClass = "LX/2nS;",
            name = "invoke",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Ljava/lang/Object;",
            strings = listOf("setPrimaryClip"),
        ).method
        val clipLoad = clipboard.implementation!!.instructions.withIndex().single {
            it.value.opcode == Opcode.IGET_OBJECT &&
                (it.value as ReferenceInstruction)
                    .reference.toString().endsWith(":Landroid/content/ClipData;")
        }
        val clipRegister = (clipLoad.value as TwoRegisterInstruction).registerA
        clipboard.addInstructions(clipLoad.index + 1, """
            invoke-static/range {v$clipRegister .. v$clipRegister}, $SHARE_LINKS->cleanCopiedLink(Landroid/content/ClipData;)Landroid/content/ClipData;
            move-result-object v$clipRegister
        """.trimIndent())
    }
}
