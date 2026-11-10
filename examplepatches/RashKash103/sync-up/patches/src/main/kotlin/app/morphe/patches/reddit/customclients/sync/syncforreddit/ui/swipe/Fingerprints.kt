package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.swipe

import app.morphe.patcher.Fingerprint

/**
 * Where Sync asks to become translucent, so that the screen behind goes on being drawn while a
 * post is dragged off it.
 *
 * <p>Matched on the name of the call it reaches for rather than on the class, which has no name
 * of its own left. The whole string is written down here, which is what a fingerprint string has
 * to be.
 */
internal val becomeTranslucentFingerprint = Fingerprint(
    parameters = listOf("Landroid/app/Activity;"),
    returnType = "V",
    strings = listOf("convertToTranslucent"),
)

/** The same, where it asks to be an ordinary opaque activity again. */
internal val becomeOpaqueFingerprint = Fingerprint(
    parameters = listOf("Landroid/app/Activity;"),
    returnType = "V",
    strings = listOf("convertFromTranslucent"),
)
