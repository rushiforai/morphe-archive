package app.morphe.patches.vk.music

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.patches.vk.shared.references

/**
 * MusicSubscriptionProviderImpl — c() is hasMusicSubscription() (the name is obfuscated,
 * so it is found by the AUDIO_SUBSCRIPTION_STORAGE toggle it checks).
 * Every native download entry point (the player download icon via the offline
 * manager, and the "download" action via the interactor / bottom-sheet model)
 * gates on this single boolean before delegating to the real worker
 * MusicDownloadInteractorImpl.m(track). Forcing it to true lets the native
 * offline downloader run without a subscription, so pressed tracks land in
 * VK's encrypted offline cache and appear in the "Downloaded" section.
 */
internal object MusicSubscriptionProviderHasSubscriptionFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "MusicSubscriptionProviderImpl.kt" &&
            !classDef.type.contains("\$") &&
            method.references("MusicFeatures;->AUDIO_SUBSCRIPTION_STORAGE:")
    },
    returnType = "Z",
    parameters = emptyList()
)

/**
 * PrefetchConfig.Disabled (com.vk.music.player.cache.a$b) — returned instead of
 * the Default config when the video-based music player toggle is active, which
 * disables the whole music SimpleCache. Forcing Default values re-enables
 * cache writes and prefetch of upcoming tracks.
 */
internal object PrefetchConfigDisabledAFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/player/cache/a\$b;",
    name = "a",
    returnType = "I",
    parameters = emptyList()
)

internal object PrefetchConfigDisabledBFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/player/cache/a\$b;",
    name = "b",
    returnType = "I",
    parameters = emptyList()
)

internal object PrefetchConfigDisabledCFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/player/cache/a\$b;",
    name = "c",
    returnType = "I",
    parameters = emptyList()
)

internal object PrefetchConfigDisabledDFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/player/cache/a\$b;",
    name = "d",
    returnType = "I",
    parameters = emptyList()
)

internal object PrefetchConfigDisabledEFingerprint : Fingerprint(
    definingClass = "Lcom/vk/music/player/cache/a\$b;",
    name = "e",
    returnType = "I",
    parameters = emptyList()
)

@Suppress("unused")
val musicCachePatch = bytecodePatch(
    name = "Unlock offline music downloads",
    description = "Makes the native download buttons (player icon and the \"download\" menu action) " +
        "work without a VK Music subscription, so tracks are saved to VK's offline cache and " +
        "appear in the \"Downloaded\" section for offline listening. Also re-enables the music player disk cache.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    execute {
        // Pretend the account always has an active music subscription so every
        // download gate routes straight to the native offline downloader.
        MusicSubscriptionProviderHasSubscriptionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Turn PrefetchConfig.Disabled into the Default config:
        //   a() = prefetchTracksCount      = 1
        //   b() = cacheSizeMb               = 50
        //   c() = firstPhasePrefetchDurSec  = 5
        //   d() = secondPhasePrefetchDurMin = 6
        //   e() = firstPhasePrefetchTracks  = 5
        PrefetchConfigDisabledAFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        PrefetchConfigDisabledBFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x32
                return v0
            """
        )
        PrefetchConfigDisabledCFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x5
                return v0
            """
        )
        PrefetchConfigDisabledDFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x6
                return v0
            """
        )
        PrefetchConfigDisabledEFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x5
                return v0
            """
        )
    }
}
