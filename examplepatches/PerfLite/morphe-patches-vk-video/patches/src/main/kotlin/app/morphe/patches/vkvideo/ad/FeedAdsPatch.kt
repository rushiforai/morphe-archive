package app.morphe.patches.vkvideo.ad

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val AD_ENTRY_TYPE = "Lcom/vk/dto/newsfeed/entries/MyTargetNativeAdEntry;"
private const val BUILDER_SOURCE = "PostDisplayItemsBuilder.kt"

@Suppress("unused")
val feedAdsPatch = bytecodePatch(
    name = "Feed ad-block",
    description = "Removes MyTarget native ad cards from the recommendations list on the video page.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    execute {
        var neutralized = 0

        classDefForEach { classDef ->
            if (classDef.sourceFile != BUILDER_SOURCE) return@classDefForEach

            for (method in mutableClassDefBy(classDef).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.INSTANCE_OF) return@forEachIndexed
                    val reference = (instruction as ReferenceInstruction).reference as? TypeReference ?: return@forEachIndexed
                    if (reference.type != AD_ENTRY_TYPE) return@forEachIndexed

                    // const/16 is the same four bytes as instance-of, so every branch offset in the
                    // method stays valid. The following if-eqz then takes the "not an ad entry" path
                    // and skips the whole MyTarget block, including its display item creation.
                    val register = (instruction as TwoRegisterInstruction).registerA
                    method.replaceInstruction(index, "const/16 v$register, 0x0")
                    neutralized++
                }
            }
        }

        if (neutralized == 0) {
            println("WARNING: $BUILDER_SOURCE has no $AD_ENTRY_TYPE check - feed ads are not blocked")
        } else {
            println("FeedAdsPatch: neutralized $neutralized MyTarget ad entry check(s) in $BUILDER_SOURCE")
        }
    }
}
