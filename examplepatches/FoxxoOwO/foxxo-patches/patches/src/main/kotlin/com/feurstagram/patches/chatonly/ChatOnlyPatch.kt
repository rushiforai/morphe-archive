package com.feurstagram.patches.chatonly

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.asSequence
import com.feurstagram.patches.display.installSdrDisplay
import com.feurstagram.patches.network.installFeedItemFiltering
import com.feurstagram.patches.network.installLimitFeedToFollowing
import com.feurstagram.patches.network.installNetworkBlocking
import com.feurstagram.patches.settings.installSettingsEntryPoint
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION
import com.feurstagram.patches.signature.installSignatureCheckBypass
import com.feurstagram.patches.ui.installPopupHiding
import org.w3c.dom.Element

private const val PERMISSION = "android.permission.REQUEST_INSTALL_PACKAGES"
private const val RESTART_ACTIVITY = "com.feurstagram.extension.RestartActivity"

/** Its own process is the whole point: see RestartActivity. */
private const val RESTART_PROCESS = ":feurstagram_restart"

private fun permissionManifestPatch(): Patch<*> = resourcePatch(
    name = "Chat only: install-packages permission",
    description = "Declares REQUEST_INSTALL_PACKAGES so the update dialog can download and " +
        "install a new release directly instead of opening the browser.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        // Lets the in-app updater hand a downloaded APK to the system package installer
        // (UpdateChecker uses PackageInstaller) without bouncing through a browser.
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            val alreadyDeclared = manifest.getElementsByTagName("uses-permission")
                .asSequence()
                .map { it as Element }
                .any { it.getAttribute("android:name") == PERMISSION }
            if (alreadyDeclared) return@use

            val element = document.createElement("uses-permission")
            element.setAttribute("android:name", PERMISSION)
            manifest.appendChild(element)
        }
    }
}

private fun restartRelayManifestPatch(): Patch<*> = resourcePatch(
    name = "Chat only: restart relay",
    description = "Declares the one-shot activity Feurstagram runs in its own process to bring " +
        "Instagram back after the cache-clear restart.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        // The cache-clear restart kills every Instagram process, and a process cannot bring
        // itself back: the activity it starts on the way out is dropped by the system ("app
        // died, no saved state"), and one queued for afterwards is refused as a background
        // activity launch. RestartActivity does it from the outside, but only if it is declared
        // to live in a separate process.
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .getElementsByTagName("application")
                .item(0) as? Element ?: return@use

            val alreadyDeclared = application.getElementsByTagName("activity")
                .asSequence()
                .map { it as Element }
                .any { it.getAttribute("android:name") == RESTART_ACTIVITY }
            if (alreadyDeclared) return@use

            val activity = document.createElement("activity")
            activity.setAttribute("android:name", RESTART_ACTIVITY)
            activity.setAttribute("android:process", RESTART_PROCESS)
            activity.setAttribute("android:exported", "false")
            // Its own task, never in Recents, gone as soon as it finishes: the user should never
            // see that a second activity was involved at all.
            activity.setAttribute("android:launchMode", "singleInstance")
            activity.setAttribute("android:excludeFromRecents", "true")
            activity.setAttribute("android:noHistory", "true")
            activity.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            application.appendChild(activity)
        }
    }
}

/**
 * The whole distraction-free experience as a single selectable patch: Instagram launches into
 * Direct and every surface that is not a conversation is stripped out.
 *
 * The individual hooks live in their own files and are installed from one `execute` block, so
 * Morphe shows one entry instead of nine and no half-enabled combination can leave a dangling
 * surface behind. Everything they gate on (feed, stories, explore, reels, ads, suggestions,
 * popups, update check, force-dark) is a runtime toggle in the Feurstagram settings.
 *
 * The two manifest edits cannot be done from a bytecode patch, so they are private dependency
 * patches at the bottom of this file: named for the logs, but invisible to Morphe's patch list
 * because only public Patch fields/methods of the bundle are loaded.
 */
@Suppress("unused")
val chatOnlyPatch = bytecodePatch(
    name = "Chat only",
    description = "Turns Instagram into a chat-only messenger: opens Direct instead of the feed " +
        "and removes the home feed, Reels, Explore, ads and suggestions, while the Stories tray " +
        "stays visible. Long-press any bottom tab (or the Direct title) to open the Feurstagram " +
        "settings.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    dependsOn(
        permissionManifestPatch(),
        restartRelayManifestPatch(),
    )

    execute {
        installNetworkBlocking()
        installFeedItemFiltering()
        installLimitFeedToFollowing()
        installPopupHiding()
        installSignatureCheckBypass()
        installSettingsEntryPoint()
        installSdrDisplay()
    }
}
