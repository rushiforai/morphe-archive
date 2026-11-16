package app.morphed.patches.twitch.ad.stream

import app.morphe.patcher.Fingerprint

/** The surface an IVS player draws its video on. */
object CorePlayerImplSetSurfaceFingerprint : Fingerprint(
    definingClass = "Lcom/amazonaws/ivs/player/CorePlayerImpl;",
    name = "setSurface",
    returnType = "V",
    parameters = listOf("Landroid/view/Surface;"),
)

/** The IVS player constructor the Twitch app uses. */
object CorePlayerImplConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/amazonaws/ivs/player/CorePlayerImpl;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Lcom/amazonaws/ivs/player/Configuration;"),
)
