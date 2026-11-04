package semicoloncolonel.mobilestream.extension.fema;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * Saves the images in FEMA's guides as the web view loads them, and serves
 * the saved copy from then on, so guides keep their pictures offline. Images
 * on FEMA's sites rarely change, so a saved copy is used even when online.
 */
@SuppressWarnings("unused")
public final class ImageCache {
    private static final String TAG = OfflineStore.TAG;

    private ImageCache() {
    }

    /**
     * Injection point: BridgeWebViewClient.shouldInterceptRequest, with the
     * response Capacitor chose. Capacitor answers only for the app's own
     * files and returns null for everything else.
     */
    public static WebResourceResponse intercept(Object client, WebResourceResponse response,
                                                WebResourceRequest request) {
        if (response != null || request == null) return response;
        try {
            if (!"GET".equalsIgnoreCase(request.getMethod())) return null;
            Uri uri = request.getUrl();
            if (!OfflineStore.isContentHost(uri.getHost()) || !OfflineStore.isImage(uri)) return null;

            Context context = context(client);
            if (context == null) return null;
            String url = uri.toString();
            File file = OfflineStore.image(context, url);
            if (!file.isFile() && !OfflineStore.fetchImage(context, url)) {
                // Not saved and not reachable: let the web view handle it.
                return null;
            }

            Map<String, String> headers = new HashMap<>();
            headers.put("Access-Control-Allow-Origin", "*");
            headers.put("Cache-Control", "max-age=86400");
            return new WebResourceResponse(OfflineStore.mimeType(uri), null, 200, "OK", headers,
                    new ByteArrayInputStream(OfflineStore.read(file)));
        } catch (Exception ex) {
            Log.w(TAG, "image intercept failure", ex);
            return null;
        }
    }

    // BridgeWebViewClient.bridge.getContext().
    private static Context context(Object client) {
        try {
            java.lang.reflect.Field bridgeField = null;
            // The app may subclass BridgeWebViewClient.
            for (Class<?> type = client.getClass(); type != null && bridgeField == null; type = type.getSuperclass()) {
                try {
                    bridgeField = type.getDeclaredField("bridge");
                } catch (NoSuchFieldException ignored) {
                }
            }
            if (bridgeField == null) return null;
            bridgeField.setAccessible(true);
            Object bridge = bridgeField.get(client);
            return ((Context) bridge.getClass().getMethod("getContext").invoke(bridge)).getApplicationContext();
        } catch (Exception ex) {
            Log.w(TAG, "could not get context", ex);
            return null;
        }
    }
}
