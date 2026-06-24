/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/twitch/ad/embedded/Fingerprints.kt
 */
package app.morphe.patches.twitch.ad.embedded

import app.morphe.patcher.Fingerprint

internal object CreatesUsherClientMethodFingerprint : Fingerprint(
    returnType = "Lokhttp3/OkHttpClient;",
    custom = { method, classDef ->
        method.name == "buildOkHttpClient" && classDef.type.endsWith("OkHttpClientFactory;")
    },
)

