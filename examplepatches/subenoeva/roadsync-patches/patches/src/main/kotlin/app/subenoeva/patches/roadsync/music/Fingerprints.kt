package app.subenoeva.patches.roadsync.music

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Builds the set of package names that are allowed to expose a `MediaBrowserService` to RoadSync.
 *
 * RoadSync bundles the Drivemode music SDK, which resolves music apps in three ways:
 *
 * - `supported`: a hardcoded set of `Resolvable` implementations (Spotify, YouTube Music, VLC, ...).
 * - `generic`: any installed app declaring an `android.intent.action.MEDIA_BUTTON` receiver that is
 *   not blacklisted, wrapped in a `GenericMusicApp`.
 * - `mediaBrowserWhitelist`: the set matched by this fingerprint. Only apps listed here get their
 *   `android.media.browse.MediaBrowserService` bound, which is what enables library browsing
 *   instead of plain transport control.
 *
 * The method is a private static Kotlin lambda body with no parameters returning a `Set`, holding
 * the package literals below. Class and package names of the SDK are not obfuscated, but member
 * names are, so the match relies on the string literals rather than on the method name.
 */
internal object MediaBrowserWhitelistFingerprint : Fingerprint(
    definingClass = "Lcom/drivemode/sdk/music/provider/impl/MusicAppProviderImpl;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/Set;",
    parameters = emptyList(),
    // Unordered on purpose: the order the literals are emitted in depends on register allocation
    // and is not stable between builds.
    strings = listOf(
        "org.videolan.vlc",
        "com.example.android.mediasession",
        "com.drivemode.android.music",
    ),
)
