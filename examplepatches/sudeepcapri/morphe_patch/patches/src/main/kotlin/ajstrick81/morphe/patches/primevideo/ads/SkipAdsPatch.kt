package ajstrick81.morphe.patches.primevideo.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import ajstrick81.morphe.patches.primevideo.misc.extension.primeVideoExtensionPatch
import ajstrick81.morphe.patches.primevideo.shared.Constants

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Multi-layer ad suppression targeting the SSAI schedule, impression reporting, and the Volley network chokepoint.",
) {
    // 6.24.5 repackages the Java dependencies with R8. These four named Java
    // seams no longer exist there; native libignite suppression remains the
    // complete ad-blocking implementation for that version.
    compatibleWith(Constants.COMPATIBILITY_6_23)

    dependsOn(primeVideoExtensionPatch)

    execute {

        // ─────────────────────────────────────────────────────────────────────
        // Hook 1 — media3 ServerSideAdInsertionMediaSource.setAdPlaybackStates()
        //
        // Strips all AdGroups from the incoming SSAI ad schedule before
        // ExoPlayer sees it. Absent entirely from 6.24.5.
        // ─────────────────────────────────────────────────────────────────────
        SetAdPlaybackStatesMedia3Fingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p1}, Lajstrick81/morphe/extension/primevideo/ads/SkipAdsPatch;->skipAllMedia3AdGroups(Lcom/google/common/collect/ImmutableMap;)Lcom/google/common/collect/ImmutableMap;
                move-result-object p1
            """
        )

        // ─────────────────────────────────────────────────────────────────────
        // Hook 2 — ExoPlayer2 ServerSideAdInsertionMediaSource.setAdPlaybackStates()
        //
        // Same strategy for the GMS Ads SDK ExoPlayer2 variant.
        // ─────────────────────────────────────────────────────────────────────
        SetAdPlaybackStatesExo2Fingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p1}, Lajstrick81/morphe/extension/primevideo/ads/SkipAdsPatch;->skipAllExo2AdGroups(Lcom/google/common/collect/ImmutableMap;)Lcom/google/common/collect/ImmutableMap;
                move-result-object p1
            """
        )

        // ─────────────────────────────────────────────────────────────────────
        // Hook 3 — MetricsTransporter.transmit(SerializedBatch)
        //
        // Returns a fake SUCCESS UploadResult without making any network
        // request, so Amazon receives no impression delivery data.
        //
        // Inline smali constructs UploadResult("SUCCESS", "ok") directly —
        // no extension class needed since UploadResult is in the app's own DEX.
        // ─────────────────────────────────────────────────────────────────────
        MetricsTransporterTransmitFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/amazon/minerva/client/thirdparty/transport/UploadResult;
                const-string v1, "SUCCESS"
                const-string v2, "ok"
                invoke-direct {v0, v1, v2}, Lcom/amazon/minerva/client/thirdparty/transport/UploadResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                return-object v0
            """
        )

        // ─────────────────────────────────────────────────────────────────────
        // Hook 4 — Volley BasicNetwork.performRequest(Request)
        //
        // Rejects known ad-decisioning / ad-tracking hosts with a real
        // NoConnectionError before any HTTP work happens. Verified firing on
        // 6.23.23, where it blocked threeplr-*.api.amazonvideo.com.
        //
        // It never sees /cdp/getVideoAds: Ignite fetches ad decisions through
        // libcurl, which never touches Volley. That call is handled by the
        // native hook instead.
        // ─────────────────────────────────────────────────────────────────────
        BasicNetworkPerformRequestFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, Lajstrick81/morphe/extension/primevideo/ads/SkipAdsPatch;->enforceAdBlock(Lcom/android/volley/Request;)V
            """
        )
    }
}
