// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixvideodownloads

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.string
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// The app tests each AdaptationSet's text twice: contains("DASH_audio"), then contains("audio").
private val AUDIO_CHECKS = mapOf("DASH_audio" to Opcode.IF_NEZ, "audio" to Opcode.IF_EQZ)

@Suppress("unused")
val fixVideoDownloadsPatch =
    bytecodePatch(
        name = "Fix video downloads",
        description = "Fixes downloaded Reddit videos having only audio.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(extensionPatch)

        apply {
            val method = manifestParserMethod()
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
                    if (text?.methodReference?.name != "getTextContent" ||
                        textResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
                        code.getOrNull(at + 1)?.methodReference?.name != "contains" ||
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
