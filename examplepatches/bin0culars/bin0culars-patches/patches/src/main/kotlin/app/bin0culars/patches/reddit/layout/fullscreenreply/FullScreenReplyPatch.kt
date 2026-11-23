package app.bin0culars.patches.reddit.layout.fullscreenreply

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.POSTS
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/FullScreenReplyPatch;"

@Suppress("unused")
val fullScreenReplyPatch =
    patch(
        name = "Full-screen reply",
        description = "Opens replies in the older full-screen editor that shows the comment you're replying to, so you can select and quote its text. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "full_screen_reply",
                    section = POSTS,
                    title = "Full-screen reply",
                    summary =
                    "Replies open in the older full-screen editor that shows the comment you're replying to, so you can select and quote its text. Image cropping isn't available there. Restart Reddit after changing this.",
                    default = false,
                ),
            )

            val constructorMethod = ModernComposerFlagsConstructorFingerprint.method
            val instructions = constructorMethod.instructions
            val constStringIndex = instructions.indexOfFirst { instruction ->
                (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "android_modern_comment_composer"
            }
            if (constStringIndex == -1) {
                throw PatchException("Could not find const-string 'android_modern_comment_composer' in ${constructorMethod.name}")
            }

            var composerField: FieldReference? = null
            for (i in constStringIndex + 1 until instructions.size) {
                val instruction = instructions[i]
                if (instruction.opcode == Opcode.IPUT_OBJECT) {
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    if (fieldRef != null) {
                        composerField = fieldRef
                        break
                    }
                }
            }
            val field = composerField
                ?: throw PatchException("Could not find iput-object after 'android_modern_comment_composer'")

            val getterMethods = ModernComposerFlagsConstructorFingerprint.classDef.methods.filter { method ->
                method.returnType == "Z" &&
                    method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any { instr ->
                        instr.opcode == Opcode.IGET_OBJECT &&
                            ((instr as? ReferenceInstruction)?.reference as? FieldReference)?.let { fieldRef ->
                                fieldRef.definingClass == field.definingClass &&
                                    fieldRef.name == field.name &&
                                    fieldRef.type == field.type
                            } == true
                    } == true
            }
            if (getterMethods.size != 1) {
                throw PatchException("Expected exactly one getter method reading ${field.definingClass}->${field.name}, found ${getterMethods.size}")
            }

            val smali =
                """
                    invoke-static {}, $EXTENSION_CLASS->isEnabled()Z
                    move-result v0
                    if-eqz v0, :reddit_default
                    const/4 v0, 0x0
                    return v0
                    :reddit_default
                    nop
                """.trimIndent()

            getterMethods.single().addInstructionsWithLabels(0, smali)
        }
    }
