// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixvideodownloads

import app.edbfi.patches.shared.string
import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// The app tests each AdaptationSet's text twice: contains("DASH_audio"), then contains("audio").
private val AUDIO_CHECKS = mapOf("DASH_audio" to Opcode.IF_NEZ, "audio" to Opcode.IF_EQZ)

@Suppress("unused")
val fixVideoDownloadsPatch =
    patch(
        name = "Fix video downloads",
        description = "Fixes downloaded Reddit videos having only audio.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(extensionPatch)

        execute {
            val method = ManifestParserFingerprint.matchSingle().method
            val code = method.instructions
            // Each check is getTextContent() on the set; contains(<literal>); move-result vX; if-<z> vX. v.redd.it now names its
            // audio files CMAF_AUDIO_*.mp4, so neither matches and the audio set is read as the video. Both branches
            // now follow the manifest's own contentType or mimeType.
            val branches =
                AUDIO_CHECKS.map { (literal, branchOpcode) ->
                    val at = code.indices.singleOrNull { code[it].string == literal }
                        ?: throw PatchException("Expected one \"$literal\" literal in ${method.name}")
                    val text = code.getOrNull(at - 2)
                    val textResult = code.getOrNull(at - 1)
                    val result = code.getOrNull(at + 2)
                    val branch = code.getOrNull(at + 3)
                    if (text?.getReference<MethodReference>()?.name != "getTextContent" ||
                        textResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
                        code.getOrNull(at + 1)?.getReference<MethodReference>()?.name != "contains" ||
                        result?.opcode != Opcode.MOVE_RESULT ||
                        branch?.opcode != branchOpcode ||
                        branch.location.labels.isNotEmpty() ||
                        // Nothing between getTextContent and the branch may overwrite the set's register.
                        listOf(textResult, code[at], result).any {
                            (it as OneRegisterInstruction).registerA == (text as FiveRegisterInstruction).registerC
                        }
                    ) {
                        throw PatchException("The \"$literal\" check in ${method.name} has changed")
                    }
                    Triple(at + 3, (text as FiveRegisterInstruction).registerC, (result as OneRegisterInstruction).registerA)
                }
            // Insert from the end so the earlier index stays valid.
            branches.sortedByDescending { it.first }.forEach { (branch, set, isAudio) ->
                method.addInstructions(
                    branch,
                    """
                        invoke-static/range { v$set .. v$set }, $EXTENSION/Mpd;->isAudio(Lorg/w3c/dom/Element;)Z
                        move-result v$isAudio
                    """,
                )
            }
        }
    }
