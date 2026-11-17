package app.bin0culars.patches.reddit.misc.sharecontent

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.registersUsed
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/ShareContentPatch;"

@Suppress("unused")
val shareContentPatch =
    patch(
        name = "Share post content",
        description = "App shortcuts and \"Share via…\" in the share sheet send the post's image, video or text instead of its link.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "share_post_content",
                    section = BinocularsModsSection.LINKS,
                    title = "Share post content",
                    summary = "App icons and \"Share via…\" in the share sheet send the image, video or text of a post instead of its link. Copy link still copies the link.",
                    default = true,
                ),
            )

            val subjectMethod = ShareSubjectFingerprint.method
            val subjectInstructions = subjectMethod.instructions
            val checkCastIndex = subjectInstructions.indexOfFirst {
                it.opcode == Opcode.CHECK_CAST &&
                    ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lcom/reddit/domain/model/Link;"
            }
            if (checkCastIndex == -1) {
                throw PatchException("Could not find check-cast to Lcom/reddit/domain/model/Link; in ShareSubjectFingerprint")
            }
            val checkCastInstruction = subjectInstructions[checkCastIndex]
            val linkRegister = (checkCastInstruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("check-cast instruction is not a OneRegisterInstruction")
            if (linkRegister >= 16) {
                throw PatchException("Link register v$linkRegister is >= 16 in ${subjectMethod.name}")
            }
            subjectMethod.addInstructions(
                checkCastIndex + 1,
                "invoke-static { v$linkRegister }, $EXTENSION_CLASS->setLink(Ljava/lang/Object;)V",
            )

            val targetMethod = ShareAppTargetFingerprint.method
            val targetInstructions = targetMethod.instructions
            val matchingIndices = mutableListOf<Int>()
            for (i in targetInstructions.indices) {
                val instruction = targetInstructions[i]
                if (instruction.opcode == Opcode.INVOKE_VIRTUAL) {
                    val methodRef = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (methodRef != null &&
                        methodRef.returnType == "V" &&
                        methodRef.parameterTypes.map { it.toString() } == listOf(
                            "Landroid/content/Context;",
                            "Landroid/content/Intent;",
                            "Ljava/lang/String;",
                        )
                    ) {
                        matchingIndices.add(i)
                    }
                }
            }
            if (matchingIndices.isEmpty()) {
                throw PatchException("Could not find INVOKE_VIRTUAL with (Context, Intent, String) -> V in ShareAppTargetFingerprint")
            }

            for (callIndex in matchingIndices.asReversed()) {
                val callInstruction = targetMethod.instructions[callIndex]
                val regs = callInstruction.registersUsed
                if (regs.size != 4) {
                    throw PatchException("Expected 4 registers on INVOKE_VIRTUAL at index $callIndex, found ${regs.size}")
                }
                val c = regs[0]
                val d = regs[1]
                val e = regs[2]
                val f = regs[3]

                val sgetIndex = callIndex + 1
                val returnIndex = callIndex + 2
                val sgetInstruction = targetMethod.instructions.getOrNull(sgetIndex)
                val returnInstruction = targetMethod.instructions.getOrNull(returnIndex)

                if (sgetInstruction?.opcode != Opcode.SGET_OBJECT) {
                    throw PatchException("Instruction at $sgetIndex is not SGET_OBJECT in ${targetMethod.name}")
                }
                val fieldRef = (sgetInstruction as? ReferenceInstruction)?.reference as? FieldReference
                if (fieldRef?.type != "Lkotlin/Unit;") {
                    throw PatchException("SGET_OBJECT at $sgetIndex does not have type Lkotlin/Unit; (found ${fieldRef?.type})")
                }
                if (returnInstruction?.opcode != Opcode.RETURN_OBJECT) {
                    throw PatchException("Instruction at $returnIndex is not RETURN_OBJECT in ${targetMethod.name}")
                }

                val s = (0..15).firstOrNull { it !in listOf(c, d, e, f) }
                    ?: throw PatchException("Could not find a 4-bit scratch register in ${targetMethod.name}")

                if (d >= 16 || e >= 16 || s >= 16) {
                    throw PatchException("Register index >= 16: D=$d, E=$e, S=$s in ${targetMethod.name}")
                }

                targetMethod.addInstructionsWithLabels(
                    callIndex,
                    """
                        invoke-static { v$d, v$e }, $EXTENSION_CLASS->onShare(Landroid/content/Context;Landroid/content/Intent;)Z
                        move-result v$s
                        if-nez v$s, :handled
                    """,
                    ExternalLabel("handled", sgetInstruction),
                )
            }
        }

        finalize {
            resourceXml("res/values/strings.xml").use { strings ->
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_share_preparing")
                    text = "Preparing to share…"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_share_failed")
                    text = "Couldn't share the media, sharing the link instead"
                }
            }
        }
    }
