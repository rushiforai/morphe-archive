/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.layout.hide.blockchannels

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.fix.proto.fixProtoLibraryPatch
import app.morphe.patches.shared.misc.litho.filter.addLithoFilter
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patches.youtube.misc.litho.filter.lithoFilterPatch
import app.morphe.patches.youtube.misc.proto.elementProtoParserHookPatch
import app.morphe.patches.youtube.misc.settings.PreferenceScreen
import app.morphe.patches.youtube.misc.settings.settingsPatch
import app.morphe.patches.youtube.layout.flyout.addToQueuePatch
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

private const val BLOCK_CHANNELS_FILTER =
    "Lapp/morphe/extension/youtube/patches/components/BlockChannelsFilter;"

@Suppress("unused")
val blockChannelsPatch = bytecodePatch(
    name = "Block channels",
    description = "Adds an option to permanently hide content and channel results from specific " +
            "YouTube channels by channel ID, @handle, or channel URL in Home, Subscriptions, Search, " +
            "related videos, Shorts shelves, and comments."
) {
    dependsOn(
        lithoFilterPatch,
        settingsPatch,
        elementProtoParserHookPatch,
        fixProtoLibraryPatch,
        // Provides the channel-page flyout hook and ChannelPageFlyoutFilter used by the button.
        addToQueuePatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.FEED.addPreferences(
            PreferenceScreenPreference(
                key = "morphe_block_channels_screen",
                sorting = Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("morphe_block_channels"),
                    TextPreference("morphe_block_channels_list", inputType = InputType.TEXT_MULTI_LINE),
                    PreferenceCategory(
                        key = "morphe_block_channels_about_category",
                        titleKey = "morphe_hide_about_category_title",
                        sorting = Sorting.UNSORTED,
                        preferences = setOf(
                            NonInteractivePreference(
                                key = "morphe_block_channels_about",
                                titleKey = "morphe_block_channels_screen_title",
                                tag = "app.morphe.extension.shared.settings.preference.BulletPointPreference"
                            )
                        )
                    )
                )
            )
        )

        addLithoFilter(BLOCK_CHANNELS_FILTER)
    }
}
