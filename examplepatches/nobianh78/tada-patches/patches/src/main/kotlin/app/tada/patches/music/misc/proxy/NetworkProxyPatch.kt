/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/1823
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.misc.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.tada.patches.music.misc.extension.hooks.YouTubeMusicApplicationInitFingerprint
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_20_or_greater
import app.tada.patches.music.misc.playservice.versionCheckPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.shared.MusicActivityOnCreateFingerprint
import app.tada.patches.shared.misc.proxy.EXTENSION_CLASS
import app.tada.patches.shared.misc.proxy.baseNetworkProxyPatch

@Suppress("unused")
val networkProxyPatch = baseNetworkProxyPatch(
    preferenceScreen = PreferenceScreen.MISC,
    targetUsesProxyListInt = {
        is_9_20_or_greater
    },
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            versionCheckPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },
    executeBlock = {
        arrayOf(
            YouTubeMusicApplicationInitFingerprint,
            MusicActivityOnCreateFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.addInstruction(
                0,
                "invoke-static { }, $EXTENSION_CLASS->initialize()V"
            )
        }
    }
)
