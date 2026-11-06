package app.gonzo.patches.ads

import app.morphe.patcher.Fingerprint

/**
 * TizenTube Cobalt is not obfuscated: Cobalt's own "coat" layer keeps its upstream names.
 * `dev.cobalt.app.MainActivity` (the launcher activity) extends `dev.cobalt.coat.CobaltActivity`.
 */
private const val COBALT_ACTIVITY = "Ldev/cobalt/coat/CobaltActivity;"

/**
 * `CobaltActivity.onCreate(Bundle)`: runs before the engine starts, injection point
 * for scheduling the userscript.
 */
object CobaltActivityOnCreateFingerprint : Fingerprint(
    definingClass = COBALT_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * `CobaltActivity.getActiveWebContents()`: the handle to the live page.
 * Not modified; it is resolved by the patch only to fail loudly if the seam disappears,
 * because the extension calls it by reflection at runtime.
 */
object GetActiveWebContentsFingerprint : Fingerprint(
    definingClass = COBALT_ACTIVITY,
    name = "getActiveWebContents",
)
