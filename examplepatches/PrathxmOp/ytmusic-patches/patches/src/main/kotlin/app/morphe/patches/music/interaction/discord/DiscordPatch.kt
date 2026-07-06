/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.music.interaction.discord

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.misc.extension.sharedExtensionPatch
import app.morphe.patches.music.misc.settings.prathxm.PreferenceScreen
import app.morphe.patches.music.misc.settings.prathxm.prathxmSettingsPatch
import app.morphe.patches.music.misc.settings.manifest.ytMusicSettingsManifestPatch
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/prathxmpatches/discord/DiscordPatch;"

private object VideoIdParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "[L",
    parameters = listOf("L"),
    filters = listOf(
        literal(524288L)
    )
)

private object VideoIdFingerprint : Fingerprint(
    classFingerprint = VideoIdParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, returnType = "Ljava/lang/String;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()), // videoId
        methodCall(
            smali = "Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            location = MatchAfterWithin(6)
        ),
        opcode(Opcode.RETURN_VOID, location = MatchAfterImmediately())
    )
)

private object VideoIdBackgroundPlayFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.DECLARED_SYNCHRONIZED, AccessFlags.FINAL, AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(returnType = "Ljava/lang/String;"),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.IPUT_OBJECT),
        opcode(Opcode.MONITOR_EXIT),
        opcode(Opcode.RETURN_VOID),
        opcode(Opcode.MONITOR_EXIT),
        opcode(Opcode.RETURN_VOID)
    )
)

@Suppress("unused")
val discordRpcPatch = bytecodePatch(
    name = "Discord Rich Presence",
    description = "Displays the currently playing track on your Discord profile.",
) {
    dependsOn(
        sharedExtensionPatch,
        prathxmSettingsPatch,
        ytMusicSettingsManifestPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        var isMainRepoDiscordPresent = false
        classDefForEach { classDef ->
            if (classDef.type == "Lapp/morphe/extension/music/discord/DiscordPatch;") {
                isMainRepoDiscordPresent = true
            }
        }
        if (isMainRepoDiscordPresent) {
            return@execute
        }

        PreferenceScreen.DISCORD_RPC.addPreferences(
            NonInteractivePreference(
                key = "morphe_music_discord_rpc_about",
                titleKey = "morphe_music_discord_rpc_about_title",
                summaryKey = "morphe_music_discord_rpc_about_summary"
            ),
            SwitchPreference("morphe_music_discord_rpc_enabled", summary = true),
            PreferenceCategory(
                key = "morphe_music_discord_rpc_account_category",
                titleKey = "morphe_music_discord_rpc_token_title",
                preferences = setOf(
                    NonInteractivePreference(
                        key = "morphe_music_discord_rpc_token",
                        titleKey = "morphe_music_discord_rpc_token_title",
                        summaryKey = null,
                        tag = "app.morphe.extension.prathxmpatches.settings.preference.DiscordTokenPreference",
                        selectable = true
                    )
                )
            ),
            PreferenceCategory(
                key = "morphe_music_discord_rpc_customization_category",
                titleKey = "morphe_music_discord_rpc_customization_title",
                preferences = setOf(
                    TextPreference(
                        key = "morphe_music_discord_rpc_state_template",
                        titleKey = "morphe_music_discord_rpc_state_template_title",
                        summaryKey = "morphe_music_discord_rpc_state_template_summary"
                    ),
                    TextPreference(
                        key = "morphe_music_discord_rpc_details_template",
                        titleKey = "morphe_music_discord_rpc_details_template_title",
                        summaryKey = "morphe_music_discord_rpc_details_template_summary"
                    )
                )
            )
        )

        MediaSessionSetPlaybackStateFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.first().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerD
                addInstruction(
                    index,
                    "invoke-static { v$register }, $EXTENSION_CLASS->" +
                            "onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
                )
            }
        }

        MediaSessionSetMetadataFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.first().index
                val sessionRegister = getInstruction<FiveRegisterInstruction>(index).registerC
                val metadataRegister = getInstruction<FiveRegisterInstruction>(index).registerD
                addInstruction(
                    index,
                    "invoke-static { v$sessionRegister, v$metadataRegister }, $EXTENSION_CLASS->" +
                            "onSetMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V"
                )
            }
        }

        MediaSessionSetQueueFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.first().index
                val sessionRegister = getInstruction<FiveRegisterInstruction>(index).registerC
                val queueRegister = getInstruction<FiveRegisterInstruction>(index).registerD
                addInstruction(
                    index,
                    "invoke-static { v$sessionRegister, v$queueRegister }, $EXTENSION_CLASS->" +
                            "onSetQueue(Landroid/media/session/MediaSession;Ljava/util/List;)V"
                )
            }
        }

        VideoIdFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches[1].index
                val videoIdRegister = getInstruction<OneRegisterInstruction>(index).registerA
                addInstruction(
                    index + 1,
                    "invoke-static { v$videoIdRegister }, $EXTENSION_CLASS->setVideoId(Ljava/lang/String;)V"
                )
            }
        }

        try {
            VideoIdBackgroundPlayFingerprint.let {
                it.method.apply {
                    val index = it.instructionMatches.first().index
                    val videoIdRegister = getInstruction<OneRegisterInstruction>(index + 1).registerA
                    addInstruction(
                        index + 2,
                        "invoke-static { v$videoIdRegister }, $EXTENSION_CLASS->setVideoId(Ljava/lang/String;)V"
                    )
                }
            }
        } catch (e: Throwable) {
            // VideoIdBackgroundPlay fingerprint failed to match (optional)
        }
    }
}