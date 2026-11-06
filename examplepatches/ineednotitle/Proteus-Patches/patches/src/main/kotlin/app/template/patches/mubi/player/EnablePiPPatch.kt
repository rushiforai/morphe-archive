package app.template.patches.mubi.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import org.w3c.dom.Element

// Enable picture-in-picture for MUBI's phone/tablet player.
//
// MUBI ships separate phone and TV activities in the same package:
//   com.mubi.ui.player.PlayerActivity        (phone/tablet)
//   com.mubi.ui.player.TvPlayerActivity      (leanback)
//   com.mubi.ui.player.trailer.TrailerActivity
//   com.mubi.ui.player.trailer.TvTrailerActivity
//
// The manifest portion marks the phone player and trailer as PiP-capable and
// adds the configuration changes Android requires for PiP
// (orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden),
// preserving any bits the app already declares.
//
// Manifest support alone does not make the player enter PiP, so the bytecode
// portion prepends Activity.enterPictureInPictureMode() to onUserLeaveHint()
// when the player overrides it. onUserLeaveHint is called exactly when the user
// presses Home / switches apps, which is the moment PiP should start.
//
// Fail-safe:
//   • If a player class or onUserLeaveHint is absent, that hook is skipped.
//   • Android 8+ is required for PiP; MUBI 100.0's supported variants are
//     Android 7.0+ (API 24), and enterPictureInPictureMode() exists on API 24+.
//   • TV activities are intentionally not marked as PiP-capable.

private val PIP_ACTIVITIES = setOf(
    "com.mubi.ui.player.PlayerActivity",
    "com.mubi.ui.player.trailer.TrailerActivity",
)

private val PIP_ACTIVITIES_RELATIVE = PIP_ACTIVITIES
    .map { ".${it.removePrefix("com.mubi.")}" }
    .toSet()

private val PIP_PLAYER_CLASSES = listOf(
    "Lcom/mubi/ui/player/PlayerActivity;",
    "Lcom/mubi/ui/player/trailer/TrailerActivity;",
)

/**
 * MUBI uses fully qualified android:name values, but a manifest is also allowed
 * to use the short ".ui.player.PlayerActivity" form, so accept both.
 */
private fun String.matchesAnyActivity(): Boolean =
    this in PIP_ACTIVITIES || this in PIP_ACTIVITIES_RELATIVE

private val REQUIRED_CONFIG_CHANGES = listOf(
    "orientation",
    "screenSize",
    "smallestScreenSize",
    "screenLayout",
    "keyboardHidden",
)

private val enablePiPManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")

            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (!activity.getAttribute("android:name").matchesAnyActivity()) continue

                activity.setAttribute("android:supportsPictureInPicture", "true")
                activity.setAttribute("android:resizeableActivity", "true")

                val existing = activity
                    .getAttribute("android:configChanges")
                    .split("|")
                    .map { it.trim() }
                    .filter { it.isNotEmpty() }
                    .toMutableSet()

                existing.addAll(REQUIRED_CONFIG_CHANGES)
                activity.setAttribute("android:configChanges", existing.joinToString("|"))
            }
        }
    }
}

@Suppress("unused")
val mubiEnablePiPPatch = bytecodePatch(
    name = "Enable picture-in-picture",
    description = "Adds PiP support to MUBI's phone/tablet player: playback continues " +
        "in a floating window when you press Home.",
    default = true,
) {
    compatibleWith(MUBI_COMPATIBILITY)
    dependsOn(enablePiPManifestPatch)

    execute {
        PIP_PLAYER_CLASSES.forEach { className ->
            val playerClass = mutableClassDefByOrNull(className) ?: return@forEach

            playerClass.methods
                .firstOrNull { method ->
                    method.name == "onUserLeaveHint" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V"
                }
                ?.addInstructions(
                    0,
                    "invoke-virtual {p0}, Landroid/app/Activity;->enterPictureInPictureMode()Z",
                )
        }
    }
}
