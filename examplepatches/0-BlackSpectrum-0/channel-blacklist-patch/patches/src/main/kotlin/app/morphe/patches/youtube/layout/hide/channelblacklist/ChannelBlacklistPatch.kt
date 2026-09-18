/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.layout.hide.channelblacklist

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.patches.shared.misc.fix.proto.fixProtoLibraryPatch
import app.morphe.patches.shared.misc.litho.filter.addLithoFilter
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceCategory
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference.Sorting
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.patches.shared.misc.settings.preference.TextPreference
import app.morphe.patches.youtube.layout.flyout.addToQueuePatch
import app.morphe.patches.youtube.misc.litho.filter.lithoFilterPatch
import app.morphe.patches.youtube.misc.navigation.navigationBarHookPatch
import app.morphe.patches.youtube.misc.playservice.versionCheckPatch
import app.morphe.patches.youtube.misc.settings.PreferenceScreen
import app.morphe.patches.youtube.misc.settings.settingsPatch
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

private const val CHANNEL_BLACKLIST_FILTER =
    "Lapp/morphe/extension/youtube/patches/components/ChannelBlacklistFilter;"

val channelBlacklistPatch = bytecodePatch(
    name = "Channel blacklist",
    description = "Filter and hide videos from blacklisted channels across YouTube feeds, search results, subscriptions, and comments."
) {
    dependsOn(
        lithoFilterPatch,
        settingsPatch,
        navigationBarHookPatch,
        versionCheckPatch,
        resourceMappingPatch,
        fixProtoLibraryPatch,
        addToQueuePatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.FEED.addPreferences(
            PreferenceScreenPreference(
                key = "morphe_hide_channel_blacklist_screen",
                sorting = Sorting.UNSORTED,
                preferences = setOf(
                    SwitchPreference("morphe_hide_channel_blacklist_home"),
                    SwitchPreference("morphe_hide_channel_blacklist_search"),
                    SwitchPreference("morphe_hide_channel_blacklist_subscriptions"),
                    SwitchPreference("morphe_hide_channel_blacklist_comments"),
                    TextPreference("morphe_hide_channel_blacklist_channels", inputType = InputType.TEXT_MULTI_LINE),
                    SwitchPreference("morphe_channel_blacklist_flyout_menu", summary = true),
                    PreferenceCategory(
                        key = "morphe_hide_channel_blacklist_stats_category",
                        titleKey = "morphe_hide_stats_category_title",
                        sorting = Sorting.UNSORTED,
                        preferences = emptySet(),
                        tag = "app.morphe.extension.youtube.settings.preference.ChannelBlacklistStatsPreferenceCategory"
                    ),
                    PreferenceCategory(
                        key = "morphe_hide_channel_blacklist_about_category",
                        titleKey = "morphe_hide_about_category_title",
                        sorting = Sorting.UNSORTED,
                        preferences = setOf(
                            NonInteractivePreference(
                                key = "morphe_hide_channel_blacklist_about",
                                titleKey = "morphe_hide_channel_blacklist_screen_title",
                                tag = "app.morphe.extension.shared.settings.preference.BulletPointPreference"
                            )
                        )
                    )
                )
            )
        )

        addLithoFilter(CHANNEL_BLACKLIST_FILTER)
    }
}
