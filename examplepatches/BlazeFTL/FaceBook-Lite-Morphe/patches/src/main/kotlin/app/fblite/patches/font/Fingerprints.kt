package app.fblite.patches.font

import app.morphe.patcher.Fingerprint

/**
 * Application entry point. It lives in the primary dex, unlike the font loader,
 * which is in the superpack-compressed secondary dex the patcher cannot reach.
 */
object AttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/lite/ClientApplicationSplittedShell;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
