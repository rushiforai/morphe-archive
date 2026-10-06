/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.patcher.Fingerprint

/** What the tab bar's pager controller logs when it's asked for a tab past its pages. */
internal const val TAB_OUT_OF_BOUNDS_LOG = "Trying to get item out of bounds from visibleTabTags (item: "

/** What the sliding panel logs when it's asked for a panel it doesn't hold. */
internal const val PANEL_NOT_FOUND_LOG = "Can't find a panel view with id "

/**
 * The tab bar's pager controller showing the tab at a position. It jumps the pager to the tab's
 * page, then slides the old and new page past each other unless the style it was handed says not
 * to. The class and method are Redex names (`LX/299;->A06` on 577, `LX/24b;->A06` on 580,
 * `LX/270;->A06` on 581), and the log line is in this one method on each.
 */
internal object ShowTabFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(TAB_OUT_OF_BOUNDS_LOG),
)

/**
 * SlidingPanelScrollView's snapToPanel(panel, reason, animate). On accounts with the Menu button at
 * the top, the Menu is a panel beside the tabs in one horizontal scroller, and this scrolls to the
 * panel asked for. A second method logs under the same name and does the scrolling; this is the
 * one a tap goes through, and the only one holding the log line (`LX/1sm;->A0E` on 577,
 * `LX/3I4;->A0D` on 580, `LX/3q0;->A0F` on 581).
 */
internal object SnapToPanelFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"),
    strings = listOf(PANEL_NOT_FOUND_LOG),
)
