/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23
 */

package app.morphe.patches.youtube.feed.channelnames

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.Constants.FEED_PATH
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.navigation.addBrowseIdHook
import app.morphe.patches.youtube.utils.navigation.addSearchResultsHook
import app.morphe.patches.youtube.utils.navigation.browseIdHookPatch
import app.morphe.patches.youtube.utils.navigation.navigationBarHookPatch
import app.morphe.patches.youtube.utils.patch.PatchList.HOME_FEED_CHANNEL_NAMES
import app.morphe.patches.youtube.utils.playservice.is_20_05_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.proto.elementProtoParserHookPatch
import app.morphe.patches.youtube.utils.proto.hookElement
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn

private const val EXTENSION_CLASS = "$FEED_PATH/HomeFeedChannelNamesPatch;"

@Suppress("unused")
val homeFeedChannelNamesPatch = bytecodePatch(
    name = HOME_FEED_CHANNEL_NAMES.title,
    description = HOME_FEED_CHANNEL_NAMES.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        versionCheckPatch,
        settingsPatch,
        browseIdHookPatch,
        navigationBarHookPatch,
        elementProtoParserHookPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        if (!is_20_05_or_greater) {
            printWarn("Home feed channel names: unsupported YouTube version; keeping the original attribution.")
            return@execute
        }

        addBrowseIdHook("$EXTENSION_CLASS->setBrowseId(Ljava/lang/String;)V")
        addSearchResultsHook("$EXTENSION_CLASS->clearBrowseId()V")
        hookElement("$EXTENSION_CLASS->onElementLoaded([B)[B")

        addPreference(
            arrayOf("PREFERENCE_SCREEN: FEED", "SETTINGS: HOME_FEED_CHANNEL_NAMES"),
            HOME_FEED_CHANNEL_NAMES,
        )
    }
}
