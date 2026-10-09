/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.interaction.videooverlays

import app.morphe.util.addInstruction
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.inbox.MainActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.misc.theme.declaredVersions
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.patches.tiktok.shared.requireLocals

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/feed/VideoOverlayHider;"

private object FullscreenEntranceFingerprint : Fingerprint(
    definingClass = FULLSCREEN_COMPONENT,
    custom = { method, _ -> isFullscreenBind(method) },
)
private object LocationCardFingerprint : Fingerprint(
    strings = listOf("PoiAnchorView2", "bindData"),
    custom = { method, _ -> isLocationCardBind(method, "PoiAnchorView2") },
)
private object LocationDealCardFingerprint : Fingerprint(
    strings = listOf("PoiDealAnchorView", "bindData"),
    custom = { method, _ -> isLocationCardBind(method, "PoiDealAnchorView") },
)
private object LocationBadgeListFingerprint : Fingerprint(
    custom = { method, _ -> isLocationBadgeListFactory(method) },
)
private object FeedReportButtonGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(FEED_REPORT_GATE_KEY),
    custom = { method, _ -> isFeedReportButtonGate(method) },
)

private const val PATCH_NAME = "Hide video overlays"

@Suppress("unused")
val hideVideoOverlaysPatch = bytecodePatch(
    name = "Hide video overlays",
    description = "Hides the visual search prompt TikTok lays over videos, the LIVE " +
        "entrance in the top left corner, caption and music text, selected action buttons or " +
        "their counts in the right column, survey cards, Footnotes and the status bar, on the feed and on videos " +
        "opened from a profile, a hashtag, a sound or search. The status bar can also be hidden only " +
        "while a LIVE room is open. Separate switches hide the Full screen " +
        "button, location labels, the effect, template and CapCut tags above descriptions, and the Report " +
        "button some regions get above the creator's picture, without removing videos or changing location permissions. " +
        "One more takes the Add comment bar off those opened videos so they fill the screen, and another " +
        "clears the close button, progress bar and pause and speed buttons Clear display leaves at the bottom. Swipe for brightness and volume turns a vertical drag along the left or right edge of a video into screen brightness, volume or, with Playback speed in the bundle, the video's speed. " +
        "Switches: Hushfeed settings > Feed screen, and App for the status bar.",
    default = false,
) {
    category("Feed")
    dependsOn(settingsPatch, sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        val status = SettingsStatusLoadFingerprint.method
        val activity = MainActivityOnCreateFingerprint.method
        val controls = resolveFeedOverlayControls(
            FullscreenEntranceFingerprint.method,
            listOf("PoiAnchorView2" to LocationCardFingerprint.method,
                "PoiDealAnchorView" to LocationDealCardFingerprint.method),
        ) { classDefByOrNull(it) }
        val badgeList = LocationBadgeListFingerprint.method.resolveLocationBadgeList()
        val reportGate = FeedReportButtonGateFingerprint.method
        // The Footnotes banner's gate is required on a declared build, where
        // FootnoteBannerAnchorsTest holds it, and left out with a note on any other, so one
        // renamed gate does not take the rest of the overlay switches down with it.
        val footnoteGate = try {
            FootnoteBannerGateFingerprint.method.also { it.requireLocals(PATCH_NAME, 1) }
        } catch (problem: Exception) {
            if (packageMetadata.versionName in declaredVersions()) throw problem
            println("[$PATCH_NAME] Left out Hide Footnotes on ${packageMetadata.versionName}: ${problem.message}")
            null
        }
        // A missing new control must not leave an otherwise failed patch partly applied.
        controls()
        badgeList()
        // The regional Report button above the creator's avatar (issue #21). Answering false is
        // the state every region without the button already runs in.
        reportGate.guardAtEntry(
            PATCH_NAME,
            "invoke-static {}, Lapp/morphe/extension/tiktok/feed/FeedOverlayControls;->shouldHideReportButton()Z",
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        // Footnotes. The banner's two components both ask this one gate before they build
        // anything, and false is the answer a video without a note already gets.
        if (footnoteGate != null) {
            footnoteGate.hideFootnoteBanner(PATCH_NAME)
            SettingsStatusLoadFingerprint.method.addInstruction(
                0,
                "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableFootnotes()V",
            )
        }
        status.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableVideoOverlays()V",
        )

        // p0 is the activity. /range because a parameter register is usually above v15.
        activity.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->install(Landroid/app/Activity;)V",
        )
    }
}
