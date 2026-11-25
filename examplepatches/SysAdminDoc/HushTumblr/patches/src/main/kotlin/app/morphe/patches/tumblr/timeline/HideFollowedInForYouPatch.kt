/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.tumblr.rootmute.DASHBOARD_TAB
import app.morphe.patches.tumblr.rootmute.FRAGMENT
import app.morphe.patches.tumblr.rootmute.dashboardPagePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val PATCH = "Hide followed blogs in For you"

/** The arguments a dashboard tab is built with, which name the tab and the address it loads. */
internal const val TAB_LOGGING_ID = "tab_logging_id"
internal const val TAB_TIMELINE_URI = "tab_timeline_uri"

/**
 * Turns on the extension's rule for the For you tab. Tumblr sends each post with whether the
 * signed-in account follows its blog, the state its Follow button starts from, and For you mixes
 * those blogs' posts in with the ones it recommends. The dashboard page hook takes a followed
 * blog's post out of a For you page before Tumblr shows it, and leaves Following, Your tags and the
 * rest of Tumblr alone. The rule is in `DashboardPosts`.
 *
 * The rule tells For you from the dashboard's other tabs by the arguments the tab fragment was
 * built with, read through `Fragment.getArguments()` by name, so this checks that the tab still
 * takes both arguments and that the getter kept its name before it turns the switch on.
 */
@Suppress("unused")
val hideFollowedInForYouPatch = bytecodePatch(
    name = PATCH,
    description = "Takes posts from blogs you follow out of the For you tab as each page loads. Following" +
        " and the rest of Tumblr still show them. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch, tumblrExtensionPatch, timelineListHookPatch, paidPostBridgePatch, dashboardPagePatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideFollowedInForYou")
        requireStatusMethod("followedInForYou")
        requireForYouTab()
        enableCapability("followedInForYou")
        enableStatus("hideFollowedInForYou")
    }
}

/** The tab fragment reads its id and address from its arguments, and a fragment hands them over by name. */
internal fun BytecodePatchContext.requireForYouTab() {
    val created = classDefByOrNull(DASHBOARD_TAB)?.methods?.filter {
        it.name == "onCreate" && it.hasShape(listOf("Landroid/os/Bundle;"), "V") && it.implementation != null
    }.orEmpty()
    requireShape(PATCH, created.size == 1 && created.single().strings().containsAll(listOf(TAB_LOGGING_ID, TAB_TIMELINE_URI)),
        "a dashboard tab no longer reads its id and address from its arguments")
    requireShape(PATCH, classDefByOrNull(FRAGMENT)?.methods?.any {
        it.name == "getArguments" && it.hasShape(emptyList(), "Landroid/os/Bundle;") && !it.isStatic()
            && AccessFlags.PUBLIC.isSet(it.accessFlags)
    } == true, "a fragment's arguments getter changed")
}
