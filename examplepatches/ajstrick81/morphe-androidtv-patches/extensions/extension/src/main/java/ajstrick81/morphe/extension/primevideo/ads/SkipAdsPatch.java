package ajstrick81.morphe.extension.primevideo.ads;

import android.util.Log;
import com.android.volley.NoConnectionError;
import com.android.volley.Request;
import com.google.common.collect.ImmutableMap;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

/**
 * Prime Video ATV — ad suppression extension.
 *
 * Entry points called from patched bytecode:
 *
 *   skipAllMedia3AdGroups — strips ad schedule from media3 AdPlaybackState map
 *   skipAllExo2AdGroups   — same for ExoPlayer2 / GMS Ads variant
 *   enforceAdBlock        — Volley BasicNetwork.performRequest() host filter
 *
 * Note: Hook 3 (MetricsTransporter.transmit) uses pure inline smali to
 * construct a fake UploadResult("SUCCESS", "ok") directly — no Java extension
 * method needed since UploadResult lives in the app's own DEX.
 *
 * --- AdPlaybackState suppression (Hooks 1 & 2) ---
 *
 * withRemovedAdGroupCount(adGroupCount) physically removes all ad groups
 * from the AdPlaybackState before ExoPlayer sees the map. Operates at the
 * SSAI schedule layer — primary suppression for standard ad delivery.
 *
 * Confirmed via dex disassembly that there is no separate Java-level
 * pipeline for the WASM-rendered Ignite UI layer (pause overlays, promo
 * panels, etc.) — that UI is driven entirely by Amazon's native/WASM
 * IgniteRenderer via an opaque message bus (GMBMessageProcessor), with no
 * discrete interceptable class. Any ad content rendered through that path
 * is out of scope for bytecode hooking.
 *
 * --- Volley network-layer filtering (Hook 4) ---
 *
 * Prime Video has zero OkHttp classes anywhere in its dex set; its
 * app-layer HTTP client is Volley, wired by Amazon's own VolleyModule
 * (com.amazon.ignitionshared.network.VolleyModule) through a HurlStack
 * wrapped in BasicNetwork — the sole implementation of Volley's Network
 * interface in the app, with no app-specific subclass. enforceAdBlock()
 * runs at the top of BasicNetwork.performRequest(Request) and rejects
 * known ad-decisioning/ad-tracking hosts before any HTTP work happens.
 *
 * Throwing a real NoConnectionError (rather than faking a successful
 * response) matters: Volley's own RetryPolicy/NetworkDispatcher already
 * knows how to handle this exception type for genuine connectivity
 * failures, so the request fails the same way it would on a real network
 * error — no faked contract, no risk of hanging a caller that expects a
 * specific response shape.
 *
 * This hook does NOT suppress mid-roll ad segments — those are fetched by
 * ExoPlayer/media3's own DefaultHttpDataSource, a completely separate HTTP
 * stack that never touches Volley.
 *
 * All methods wrapped in try/catch — failures are logged to TAG below instead
 * of silently swallowed, so logcat can confirm whether the hook fired and
 * whether the strip actually took effect.
 */
@SuppressWarnings({"unused", "unchecked", "rawtypes"})
public class SkipAdsPatch {

    private static final String TAG = "SkipAdsPatch";

    // ── AdPlaybackState suppression ───────────────────────────────────────────

    /**
     * Transforms an AdPlaybackState map for the media3 SSAI pipeline.
     *
     * Called at index 0 of:
     *   androidx.media3.exoplayer.source.ads.ServerSideAdInsertionMediaSource
     *       .setAdPlaybackStates(ImmutableMap, Timeline)
     */
    public static ImmutableMap skipAllMedia3AdGroups(ImmutableMap adPlaybackStates) {
        try {
            ImmutableMap.Builder builder = ImmutableMap.builder();
            int strippedGroups = 0;
            for (Object o : adPlaybackStates.entrySet()) {
                Map.Entry entry = (Map.Entry) o;
                Object key = entry.getKey();
                androidx.media3.common.AdPlaybackState state =
                        (androidx.media3.common.AdPlaybackState) entry.getValue();
                if (state.adGroupCount > state.removedAdGroupCount) {
                    strippedGroups += state.adGroupCount - state.removedAdGroupCount;
                    state = state.withRemovedAdGroupCount(state.adGroupCount);
                }
                builder.put(key, state);
            }
            Log.i(TAG, "skipAllMedia3AdGroups: entries=" + adPlaybackStates.size()
                    + " strippedGroups=" + strippedGroups);
            return builder.build();
        } catch (Exception e) {
            Log.e(TAG, "skipAllMedia3AdGroups failed", e);
            return adPlaybackStates;
        }
    }

    /**
     * Transforms an AdPlaybackState map for the ExoPlayer2 SSAI pipeline
     * bundled inside the Google Mobile Ads SDK (classes4.dex).
     *
     * Called at index 0 of:
     *   com.google.android.exoplayer2.source.ads.ServerSideAdInsertionMediaSource
     *       .setAdPlaybackStates(ImmutableMap)
     */
    public static ImmutableMap skipAllExo2AdGroups(ImmutableMap adPlaybackStates) {
        try {
            ImmutableMap.Builder builder = ImmutableMap.builder();
            int strippedGroups = 0;
            for (Object o : adPlaybackStates.entrySet()) {
                Map.Entry entry = (Map.Entry) o;
                Object key = entry.getKey();
                com.google.android.exoplayer2.source.ads.AdPlaybackState state =
                        (com.google.android.exoplayer2.source.ads.AdPlaybackState) entry.getValue();
                if (state.adGroupCount > state.removedAdGroupCount) {
                    strippedGroups += state.adGroupCount - state.removedAdGroupCount;
                    state = state.withRemovedAdGroupCount(state.adGroupCount);
                }
                builder.put(key, state);
            }
            Log.i(TAG, "skipAllExo2AdGroups: entries=" + adPlaybackStates.size()
                    + " strippedGroups=" + strippedGroups);
            return builder.build();
        } catch (Exception e) {
            Log.e(TAG, "skipAllExo2AdGroups failed", e);
            return adPlaybackStates;
        }
    }

    // ── Volley network-layer filtering ────────────────────────────────────────

    /**
     * Called at index 0 of:
     *   com.android.volley.toolbox.BasicNetwork.performRequest(Request)
     *
     * Rejects requests to known ad-decisioning/ad-tracking hosts before any
     * HTTP work happens, by throwing a real NoConnectionError — the same
     * exception type Volley already raises for genuine connectivity
     * failures, so its RetryPolicy/NetworkDispatcher handle it exactly as
     * they would a real network outage.
     */
    public static void enforceAdBlock(Request<?> request) throws NoConnectionError {
        try {
            String url = request.getUrl();
            if (url == null) return;
            String host = new URI(url).getHost();
            if (host == null) return;
            host = host.toLowerCase();

            boolean blocked = host.equals("amazon-adsystem.com")
                    || host.endsWith(".amazon-adsystem.com")
                    || host.matches("ters-[a-z0-9]+\\.[a-z]{2}-[a-z]+-[0-9]\\.aiv-delivery\\.net");

            if (blocked) {
                Log.i(TAG, "enforceAdBlock: blocking " + host);
                throw new NoConnectionError(new IOException("ads_blocked: " + host));
            }
        } catch (URISyntaxException e) {
            // malformed URL — let it through, not our concern
        }
    }

}
