package app.morphe.patches.viber.secondary

import app.morphe.patcher.Fingerprint

/**
 * Matches Viber's tablet check method (checks smallestScreenWidthDp >= 600 or R.bool.is_tablet).
 */
internal object IsTabletCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("is_tablet", "tablet_configuration")
)

/**
 * Matches Viber's registration device type payload constructor or resolver.
 */
internal object DeviceTypeResolverFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    strings = listOf("device_type", "secondary_device")
)

/**
 * Matches the dual-pane tablet layout configuration decider.
 */
internal object SplitLayoutDeciderFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("split_pane", "dual_pane_layout")
)
