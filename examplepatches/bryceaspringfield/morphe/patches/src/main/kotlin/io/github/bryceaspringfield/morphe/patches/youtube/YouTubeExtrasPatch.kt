package io.github.bryceaspringfield.morphe.patches.youtube

import io.github.bryceaspringfield.morphe.patches.hookReturns
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.bryceaspringfield.morphe.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

private const val EXTENSION = "Lio/github/bryceaspringfield/morphe/extension/youtube"
private const val FILTER_ARRAY = "[Lapp/morphe/extension/shared/patches/components/Filter;"

/** Morphe Patches' classes this bundle hooks, present when Morphe Patches' YouTube patches are selected too. */
private const val MORPHE_LITHO_FILTER = "Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;"
private const val MORPHE_SETTINGS_FRAGMENT =
    "Lapp/morphe/extension/youtube/settings/preference/YouTubePreferenceFragment;"

private const val MORPHE_VIDEO_INFORMATION = "Lapp/morphe/extension/youtube/patches/VideoInformation;"

private val logger = Logger.getLogger("YouTubeExtras")

/**
 * The bundle's extension, its Litho filters added to Morphe's list, and its screen in Settings > Morphe.
 */
internal val youtubeExtrasBasePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/youtube-extras.mpe")

    // Runs after every selected patch of every bundle, so Morphe Patches' classes and settings exist.
    finalize {
        val litho = mutableClassDefByOrNull(MORPHE_LITHO_FILTER)
        val clinit = litho?.methods?.firstOrNull { it.name == "<clinit>" }
        if (clinit == null) {
            logger.warning("Morphe Patches' Litho filter is missing, so the filters are off. Also select Morphe Patches.")
        } else clinit.apply {
            // The static initializer sets the filters field, then registers each filter; ours join before the loop.
            val put = instructions.indexOfFirst {
                it.opcode == Opcode.SPUT_OBJECT && it.getReference<FieldReference>()?.let { f ->
                    f.name == "filters" && f.type == FILTER_ARRAY
                } == true
            }
            if (put < 0) {
                logger.warning("Morphe's filter list was not found, so the filters are off.")
            } else {
                val register = getInstruction<OneRegisterInstruction>(put).registerA
                addInstructions(
                    put,
                    """
                        invoke-static { v$register }, $EXTENSION/XHooks;->addFilters($FILTER_ARRAY)$FILTER_ARRAY
                        move-result-object v$register
                    """
                )
            }
        }

        // Each new video reaches the auto like (and, with Log feed items on, the response dumps).
        mutableClassDefByOrNull(MORPHE_VIDEO_INFORMATION)?.methods?.firstOrNull {
            it.name == "setVideoId" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;")
        }?.addInstruction(0, "invoke-static { p0 }, $EXTENSION/AutoLike;->onVideo(Ljava/lang/String;)V")
            ?: logger.warning("Morphe's VideoInformation.setVideoId is missing, so Like every video is off.")

        val initialize = mutableClassDefByOrNull(MORPHE_SETTINGS_FRAGMENT)?.methods?.firstOrNull {
            it.name == "initialize" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        if (initialize == null) {
            logger.warning("Morphe Patches' settings screen is missing, so the settings cannot be edited.")
        } else initialize.apply {
            hookReturns(Opcode.RETURN_VOID, "invoke-static { }, $EXTENSION/SettingsUi;->addSettings()V")
            addInstruction(0, "invoke-static { p0 }, $EXTENSION/SettingsUi;->setFragment(Ljava/lang/Object;)V")
        }
    }
}

@Suppress("unused")
val youtubeExtrasPatch = bytecodePatch(
    name = "YouTube Extras",
    description = "Adds channel filters, video length, category, and topic filters, playlists on Home, " +
            "live chat on all messages, and the other options of Settings > Morphe > YouTube Extras.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(youtubeExtrasBasePatch)

    execute {
        // Live chat opens on all messages when the option is on: the first request of a chat asks for every message,
        // by rewriting the chat type its continuation states (the request's bytes or its token string).
        LiveChatRequestFingerprint.let { fp ->
            val requestClass = fp.classDef
            val build = requestClass.methods.first { m ->
                m.parameterTypes.isEmpty() && m.name != "<init>" && m.implementation?.instructions?.any {
                    it.opcode == Opcode.INVOKE_STATIC &&
                            it.getReference<MethodReference>()?.let { r -> r.definingClass == "Landroid/text/TextUtils;" && r.name == "isEmpty" } == true
                } == true
            }
            val bytesField = requestClass.fields.first { it.type == "[B" }
            val tokenField = build.implementation!!.instructions.first {
                it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.type == "Ljava/lang/String;"
            }.getReference<FieldReference>()!!
            build.addInstructions(
                0,
                """
                    iget-object v0, p0, ${bytesField.definingClass}->${bytesField.name}:[B
                    invoke-static { v0 }, $EXTENSION/LiveChat;->rewriteBytes([B)[B
                    move-result-object v0
                    iput-object v0, p0, ${bytesField.definingClass}->${bytesField.name}:[B
                    iget-object v0, p0, ${tokenField.definingClass}->${tokenField.name}:${tokenField.type}
                    invoke-static { v0 }, $EXTENSION/LiveChat;->rewriteToken(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    iput-object v0, p0, ${tokenField.definingClass}->${tokenField.name}:${tokenField.type}
                """
            )
        }

        // Older layouts: a Spinner of Top chat and Live chat in the chat's header.
        SortFilterBindFingerprint.let {
            it.method.apply {
                // The last listener set before the offline-key check: the one sending the user's choice.
                val index = instructions.withIndex().filter { (i, ins) ->
                    i < it.instructionMatches.last().index && ins.opcode == Opcode.INVOKE_VIRTUAL &&
                            ins.getReference<MethodReference>()?.name == "setOnItemSelectedListener"
                }.last().index
                val spinner = getInstruction<FiveRegisterInstruction>(index).registerC
                addInstruction(
                    index + 1,
                    "invoke-static { v$spinner }, $EXTENSION/LiveChat;->onSortMenu(Landroid/widget/Spinner;)V"
                )
            }
        }
    }
}
