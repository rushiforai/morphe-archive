package app.template.extension.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.net.URL;
import java.util.Locale;

/**
 * Serves precipitation radar tiles from RainViewer when Flightradar24 has no weather
 * credentials for its own tile provider.
 *
 * The app builds every weather layer as a TMS template of the form
 * {@code https://<endpoint>/v1/<key>/tms/1.0.0/<layer>+Standard-Mercator+<date>/@.png?<signature>}
 * where endpoint, key and signature come from a server call that non-subscribers never
 * receive, leaving the template as {@code https:///v1//tms/...}. The patch routes the
 * template through {@link #rewriteTemplate} when the tile provider is created and
 * replaces the provider's URL method with {@link #tileUrl}, which reproduces the app's
 * own TMS formatting for every template it does not handle itself. Only radar layers
 * are replaced, and only when the original template is unusable.
 */
public final class Fr24Weather {
    private static final String TAG = "Fr24Weather";
    private static final String MARKER = "fr24opendata:radar";
    private static final String INDEX_URL = "https://api.rainviewer.com/public/weather-maps.json";
    private static final long INDEX_TTL_MS = 5 * 60 * 1000L;
    private static final int MAX_ZOOM = 14;
    private static final int APP_MAX_ZOOM = 14;

    private static final Object lock = new Object();
    private static String radarHost;
    private static String radarPath;
    private static long indexFetchedAt;

    private Fr24Weather() {
    }

    /** Replaced by the patch when the radarIndexUrl option is set. */
    public static String getRadarIndexUrl() {
        return INDEX_URL;
    }

    /** Called from the weather tile provider constructor with the app's TMS template. */
    public static String rewriteTemplate(String template) {
        try {
            if (template == null || !template.startsWith("https:///")) {
                return template;
            }
            boolean radar = template.contains("C09-0x0374-0")
                || template.contains("north-american-radar")
                || template.contains("C50-0x030F-0");
            if (radar) {
                Log.i(TAG, "Serving radar layer from RainViewer");
                return MARKER;
            }
            Log.i(TAG, "No open source for weather layer template " + template);
        } catch (Throwable t) {
            Log.w(TAG, "rewriteTemplate failed", t);
        }
        return template;
    }

    /**
     * Replacement body of the weather tile provider's URL method. Receives the provider
     * instance and the XYZ tile coordinates in the app's own argument order (x, y, zoom).
     */
    public static URL tileUrl(Object provider, int x, int y, int zoom) {
        try {
            String template = provider == null ? null : templateOf(provider);
            if (template == null) {
                return null;
            }
            if (Log.isLoggable(TAG, Log.DEBUG)) {
                Log.d(TAG, "tile request z" + zoom + " " + x + "," + y + " for " + template);
            }
            if (MARKER.equals(template)) {
                return radarUrl(x, y, zoom);
            }
            if (zoom > APP_MAX_ZOOM) {
                return null;
            }
            String tms = zoom + "/" + x + "/" + (((1 << zoom) - y) - 1);
            return new URL(template.replace("@", tms));
        } catch (Throwable t) {
            Log.w(TAG, "tileUrl failed", t);
            return null;
        }
    }

    private static URL radarUrl(int x, int y, int zoom) throws Exception {
        if (zoom > MAX_ZOOM || zoom < 0) {
            return null;
        }
        String host;
        String path;
        synchronized (lock) {
            if (radarPath == null || System.currentTimeMillis() - indexFetchedAt > INDEX_TTL_MS) {
                refreshIndex();
            }
            host = radarHost;
            path = radarPath;
        }
        if (host == null || path == null) {
            return null;
        }
        URL url = new URL(String.format(Locale.US, "%s%s/256/%d/%d/%d/2/1_1.png", host, path, zoom, x, y));
        Log.d(TAG, "radar tile " + url);
        return url;
    }

    /**
     * Replacement for the app's weather credential parser. The original returns false when
     * the response carries no credentials, which stops the app from creating any weather
     * overlay at startup. This version stores whatever the response contains and reports
     * success, so layers with an open source are created even without credentials.
     */
    public static boolean storeWeatherAuth(Object preferences, String body) {
        try {
            if (!(preferences instanceof android.content.SharedPreferences)) {
                return true;
            }
            android.content.SharedPreferences.Editor editor = ((android.content.SharedPreferences) preferences).edit();
            JSONObject data = new JSONObject(body).getJSONObject("data");
            editor.putString("prefWxEndpoint", data.getJSONArray("endpoints").getString(0));
            editor.putString("prefWxLightningApiKey", data.getString("key"));
            editor.putString("prefWxLightningApiSignature", data.getString("signature"));
            JSONObject metadates = data.optJSONObject("metadates");
            if (metadates != null) {
                storeMetaDate(editor, metadates.optJSONObject("C09-0x0316-0"), "prefWxC316MetaDate", null, null);
                storeMetaDate(editor, metadates.optJSONObject("C09-0x0374-0"), "prefWxC374MetaDate", null, null);
                storeMetaDate(editor, metadates.optJSONObject("sigwx-high"), "prefWxSigWxMetaDate", "prefWxSigWxValidTimes", null);
                storeMetaDate(editor, metadates.optJSONObject("airmets-and-sigmets"), "prefWxAirmetSigmetMetaDate", null, null);
                storeMetaDate(editor, metadates.optJSONObject("gfs-halfdeg-windvector-1kft-msl"), "prefWxWindMetaDate", "prefWxWindValidTimes", null);
                storeMetaDate(editor, metadates.optJSONObject("gfs-halfdeg-windspeed-kts-1kft-msl"), "prefWxWindSpeedMetaDate", "prefWxWindSpeedValidTimes", null);
                storeMetaDate(editor, metadates.optJSONObject("gfs-preciprate-inph-surface"), "prefWxPrecipTotalMetaDate", "prefWxPrecipTotalValidTimes", null);
                storeMetaDate(editor, metadates.optJSONObject("wafs-hires-icing-fl060"), "prefWxIceMetaDate", "prefWxIceValidTimes", null);
                storeMetaDate(editor, metadates.optJSONObject("wafs-hires-turbulence-fl100"), "prefWxIctMetaDate", "prefWxIctValidTimes", null);
                storeMetaDate(editor, metadates.optJSONObject("north-american-radar"), "prefWxUsaRdrMetaDate", null, "prefWxUsaRdrRefresh");
                storeMetaDate(editor, metadates.optJSONObject("C50-0x030F-0"), "prefWxAusRdrMetaDate", null, "prefWxAusRdrRefresh");
            }
            editor.apply();
            Log.i(TAG, "Stored weather credentials from the server");
        } catch (Throwable t) {
            Log.i(TAG, "No weather credentials in the server response, continuing without them");
        }
        return true;
    }

    private static void storeMetaDate(android.content.SharedPreferences.Editor editor, JSONObject layer, String dateKey, String validTimesKey, String refreshKey) {
        if (layer == null) {
            return;
        }
        if (layer.has("metaDate") && !layer.isNull("metaDate")) {
            editor.putString(dateKey, layer.optString("metaDate"));
        }
        if (validTimesKey != null && layer.has("validTimes") && !layer.isNull("validTimes")) {
            Object validTimes = layer.opt("validTimes");
            editor.putString(validTimesKey, validTimes instanceof JSONArray ? validTimes.toString() : String.valueOf(validTimes));
        }
        if (refreshKey != null && layer.has("refreshRate") && !layer.isNull("refreshRate")) {
            Object refresh = layer.opt("refreshRate");
            if (refresh instanceof Number) {
                editor.putInt(refreshKey, ((Number) refresh).intValue());
            }
        }
    }

    private static void refreshIndex() {
        try {
            String body = Fr24OpenData.httpGetPublic(getRadarIndexUrl());
            if (body == null) {
                return;
            }
            JSONObject root = new JSONObject(body);
            JSONArray past = root.getJSONObject("radar").getJSONArray("past");
            if (past.length() == 0) {
                return;
            }
            JSONObject latest = past.getJSONObject(past.length() - 1);
            radarHost = root.getString("host");
            radarPath = latest.getString("path");
            indexFetchedAt = System.currentTimeMillis();
        } catch (Throwable t) {
            Log.w(TAG, "radar index refresh failed: " + t);
        }
    }

    private static String templateOf(Object provider) throws Exception {
        for (Field field : provider.getClass().getDeclaredFields()) {
            if (field.getType() == String.class) {
                field.setAccessible(true);
                Object value = field.get(provider);
                return value == null ? null : value.toString();
            }
        }
        return null;
    }
}
