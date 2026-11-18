@file:Suppress("unused")

package io.github.sabopura.morphe.patches.twitch

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_ADS
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.app.autoDropsHook
import io.github.sabopura.morphe.patches.twitch.app.backgroundAudioHook
import io.github.sabopura.morphe.patches.twitch.app.cleanShareLinksHook
import io.github.sabopura.morphe.patches.twitch.app.defaultQualityHook
import io.github.sabopura.morphe.patches.twitch.app.disableAnalyticsHook
import io.github.sabopura.morphe.patches.twitch.app.hideUpsellsHook
import io.github.sabopura.morphe.patches.twitch.app.loginFixHook
import io.github.sabopura.morphe.patches.twitch.app.normalLatencyHook
import io.github.sabopura.morphe.patches.twitch.app.officialStatsHook
import io.github.sabopura.morphe.patches.twitch.app.playerPresenterHook
import io.github.sabopura.morphe.patches.twitch.app.startupTabHook
import io.github.sabopura.morphe.patches.twitch.app.stuckStartHook
import io.github.sabopura.morphe.patches.twitch.app.updatePromptsHook
import io.github.sabopura.morphe.patches.twitch.app.watchSignedOutHook
import io.github.sabopura.morphe.patches.twitch.player.ivsPlayerHooks
import io.github.sabopura.morphe.patches.twitch.player.pipShrinkHook
import io.github.sabopura.morphe.patches.twitch.support.twitchFeaturePatch
import io.github.sabopura.morphe.patches.twitch.ui.playerMenuResourcePatch
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import io.github.sabopura.morphe.patches.twitch.notifications.fixNotificationsPatch
import app.morphe.patcher.patch.stringOption

val disableUpdatePromptsPatch = twitchFeaturePatch(
    "Interface: Disable update prompts",
    "Stops the in-app Play Store update prompts, which cannot install over a patched app. Switch it on in the settings.",
    "DISABLE_UPDATE_PROMPTS", updatePromptsHook, playerMenuResourcePatch,
)

val fixLoginCrashPatch = bytecodePatch(
    name = "Fix login crash",
    description = "Stops sign-in from failing when Twitch's login page sends a field the app does not know.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    dependsOn(loginFixHook)
}

val fixPipLinksPatch = bytecodePatch(
    name = "Fix links during picture-in-picture",
    description = "Opens the stream or video of a link that arrives while another one plays in picture-in-picture. " +
        "Twitch sometimes brought the old one back full screen instead.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    dependsOn(pipShrinkHook)
}

val fixStuckStartPatch = twitchFeaturePatch(
    "Startup: Fix stuck start screen",
    "Opens Twitch if its start screen is still waiting after 5 seconds, which can happen when Branch's link lookup never answers.",
    "FIX_STUCK_START", stuckStartHook, playerMenuResourcePatch,
)

val startupTabPatch = twitchFeaturePatch(
    "Startup: Default startup tab",
    "Chooses the screen Twitch opens on. Links and notifications still open what they point to.",
    "STARTUP_TAB", startupTabHook, playerMenuResourcePatch,
)

val defaultQualityPatch = twitchFeaturePatch(
    "Player: Default video quality",
    "Starts playback at a quality you choose, with a separate choice for metered networks. A quality you saved in the player still wins.",
    "DEFAULT_QUALITY", defaultQualityHook, playerMenuResourcePatch,
)

val normalLatencyPatch = twitchFeaturePatch(
    "Player: Normal latency",
    "Turns off the player's low-latency mode, which adds a few seconds of delay but rebuffers less on a weak connection.",
    "NORMAL_LATENCY", normalLatencyHook, playerMenuResourcePatch,
)

val officialStatsPatch = twitchFeaturePatch(
    "Player: Official stats panel",
    "Shows Twitch's staff-only video stats panel in the player. Nothing leaves the device.",
    "OFFICIAL_STATS", officialStatsHook, playerMenuResourcePatch,
)

val backgroundAudioPatch = twitchFeaturePatch(
    "Player: Background audio default",
    "Changes only the default of Twitch's background audio setting. A choice saved in Twitch's own settings still wins.",
    "BACKGROUND_AUDIO", backgroundAudioHook, playerMenuResourcePatch,
)

val forceLandscapePatch = twitchFeaturePatch(
    "Player: Force landscape on opening",
    "Turns the screen to landscape when a stream or video opens in the full player, and back when it closes. Home previews do not rotate. Switch it on in the settings.",
    "FORCE_LANDSCAPE", playerPresenterHook, playerMenuResourcePatch,
)

val latencyBadgePatch = twitchFeaturePatch(
    "Player: Latency badge",
    "Shows how far a live stream is behind the broadcast on the theatre's player, green under 5 seconds, amber under 10 and red above. Tapping it reloads the stream through Twitch's own Retry. Nothing leaves the device beyond that reload. Switch it on in the settings.",
    "LATENCY_BADGE", ivsPlayerHooks, playerMenuResourcePatch,
)

val amoledBlackPatch = twitchFeaturePatch(
    "Interface: AMOLED black",
    "Turns the dark theme's greys black on screens drawn with Android views. Screens drawn with Compose and pop-up sheets keep their dark grey. Nothing leaves the device. Switch it on in the settings; applies after a restart.",
    "AMOLED_BLACK", playerMenuResourcePatch,
)

val autoDropsPatch = twitchFeaturePatch(
    "Drops: Auto-claim Drops",
    "Presses the Claim button of a channel's drops notification as soon as it shows a claimable drop. Sends the same claim request and event a tap sends, for your signed-in account. Off until you switch it on in the settings.",
    "AUTO_DROPS", autoDropsHook, playerMenuResourcePatch, default = false, compatibility = TWITCH_ADS,
)

val watchSignedOutPatch = twitchFeaturePatch(
    "Account: Watch without signing in",
    "While signed out, opens Twitch's own signed-out mode instead of stopping at the login screen. Account actions still ask you to sign in, signed-in use is unchanged. On once you select it, with a switch in the settings.",
    "WATCH_SIGNED_OUT", watchSignedOutHook, playerMenuResourcePatch, default = false,
)

val hideUpsellsPatch = twitchFeaturePatch(
    "Interface: Hide upsells",
    "Hides subscription discount banners and Twitch's Turbo offers: the startup prompt, the after-signup prompt and the Home tab. The Subscribe button stays unless you hide it separately. Switch it on in the settings.",
    "HIDE_UPSELLS", hideUpsellsHook, playerMenuResourcePatch,
)

val cleanShareLinksPatch = twitchFeaturePatch(
    "Privacy: Clean share links",
    "Removes known tracking parameters from twitch.tv links you share or copy, keeping timestamps and other parameters. Nothing leaves the device. Switch it on in the settings.",
    "CLEAN_SHARE_LINKS", cleanShareLinksHook, playerMenuResourcePatch,
)

val disableAnalyticsPatch = twitchFeaturePatch(
    "Privacy: Disable analytics",
    "Stops Twitch's usage events, Crashlytics, Sentry, Nielsen, Sprig and comScore, and Branch's custom events. Keeps the view-counting events that Drops and streamers' stats rely on, and Branch's start-up session. Switch it on in the settings.",
    "DISABLE_ANALYTICS", disableAnalyticsHook, playerMenuResourcePatch,
)

private val TRACKING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

val removeTrackingPermissionsPatch = resourcePatch(
    name = "Privacy: Remove tracking permissions",
    description = "Removes the advertising ID and Play install-referrer permissions from the manifest, so Twitch and its SDKs cannot read those two identifiers. Google Play services keep working.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            (0 until permissions.length).map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") in TRACKING_PERMISSIONS }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

private const val TWITCH_PACKAGE = "tv.twitch.android.app"
private val PACKAGE_NAME = Regex("[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+")
private val PACKAGE_PART = Regex("(?<=^|\\.)${Regex.escape(TWITCH_PACKAGE)}(?=\\.|$)")

private fun NodeList.elements(): List<Element> = (0 until length).map { item(it) as Element }

val separateAppPatch = resourcePatch(
    name = "Install: Separate app",
    description = "Installs the patched app next to the official Twitch app under its own package name instead of replacing it. Nothing extra leaves the device. Sign in again in the new app.",
    default = false,
) {
    compatibleWith(TWITCH_SUPPORTED)
    dependsOn(fixNotificationsPatch)
    val packageOption by stringOption(
        key = "packageName",
        default = "tv.twitch.android.app.sabopura",
        title = "Package name",
        description = "Package name of the patched app. It must differ from Twitch's.",
        required = true,
    ) { value -> value != null && value != TWITCH_PACKAGE && PACKAGE_NAME.matches(value) }

    // After every other patch, so none of them sees the new name. Twitch and its libraries build the
    // permission and provider names from the package name at run time, so those must follow it.
    finalize {
        val name = packageOption!!
        fun renamed(value: String) = PACKAGE_PART.replace(value, name)
        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("package", name)
            (document.getElementsByTagName("permission").elements() + document.getElementsByTagName("uses-permission").elements())
                .forEach { if (it.hasAttribute("android:name")) it.setAttribute("android:name", renamed(it.getAttribute("android:name"))) }
            document.getElementsByTagName("provider").elements().forEach { provider ->
                provider.setAttribute("android:authorities", provider.getAttribute("android:authorities").split(';').joinToString(";") { renamed(it) })
            }
            // Login with Amazon redirects to amzn://<package name>.
            document.getElementsByTagName("data").elements().filter { it.getAttribute("android:scheme") == "amzn" }
                .forEach { if (it.hasAttribute("android:host")) it.setAttribute("android:host", renamed(it.getAttribute("android:host"))) }
        }
    }
}
