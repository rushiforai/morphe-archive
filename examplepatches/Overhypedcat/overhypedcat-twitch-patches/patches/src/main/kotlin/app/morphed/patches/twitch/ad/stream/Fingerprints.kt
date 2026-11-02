package app.morphed.patches.twitch.ad.stream

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Amazon IVS creates every HTTP client its native player uses through this factory,
 * including the one that fetches the HLS playlists.
 */
object HttpClientFactoryCreateFingerprint : Fingerprint(
    definingClass = "Lcom/amazonaws/ivs/net/HttpClientFactory;",
    name = "create",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/amazonaws/ivs/net/HttpClient;",
    parameters = listOf(),
)

/**
 * The IVS player constructor the Twitch app uses.
 */
object CorePlayerImplSetSurfaceFingerprint : Fingerprint(
    definingClass = "Lcom/amazonaws/ivs/player/CorePlayerImpl;",
    name = "setSurface",
    returnType = "V",
    parameters = listOf("Landroid/view/Surface;"),
)

object CorePlayerImplConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/amazonaws/ivs/player/CorePlayerImpl;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Lcom/amazonaws/ivs/player/Configuration;"),
)
