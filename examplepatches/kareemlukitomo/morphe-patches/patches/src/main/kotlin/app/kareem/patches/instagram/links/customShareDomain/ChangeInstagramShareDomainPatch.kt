package app.kareem.patches.instagram.links.customShareDomain

import app.kareem.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/kareem/extension/instagram/patches/InstagramShareLinksPatch;"

@Suppress("unused")
val changeInstagramShareDomainPatch =
    bytecodePatch(
        name = "Change Instagram share domain",
        description = "Rewrites generated Instagram share links to kittygram.kareem.one.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        extendWith("extensions/extension.rve")

        execute {
            val transformInstructions =
                """
                invoke-static/range { v%s .. v%s }, $EXTENSION_CLASS_DESCRIPTOR->rewriteShareUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v%s
                """.trimIndent()

            listOf(
                PermalinkResponseJsonParserFingerprint,
                ProfileUrlResponseJsonParserFingerprint,
            ).forEach { fingerprint ->
                val stringIndex = fingerprint.stringMatches[0].index

                fingerprint.method.apply {
                    val putObjectIndex = indexOfFirstInstruction(stringIndex, Opcode.IPUT_OBJECT)
                    val urlRegister = instructions[putObjectIndex].registersUsed[0]

                    addInstructions(
                        putObjectIndex,
                        transformInstructions.format(urlRegister, urlRegister, urlRegister),
                    )
                }
            }

            listOf(
                StoryUrlResponseImplFingerprint,
                LiveUrlResponseImplFingerprint,
            ).forEach { fingerprint ->
                fingerprint.method.apply {
                    val returnInstruction = instructions.last { it.opcode == Opcode.RETURN_OBJECT }
                    val insertIndex = returnInstruction.location.index
                    val urlRegister = returnInstruction.registersUsed[0]

                    addInstructions(
                        insertIndex,
                        transformInstructions.format(urlRegister, urlRegister, urlRegister),
                    )
                }
            }
        }
    }
