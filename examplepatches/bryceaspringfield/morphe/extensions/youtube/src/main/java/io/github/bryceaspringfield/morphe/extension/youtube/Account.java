package io.github.bryceaspringfield.morphe.extension.youtube;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.innertube.utils.AuthUtils;

/**
 * InnerTube requests as the signed-in user, with the Authorization and visitor headers Morphe's auth hook saves
 * from the app's own requests (AuthUtils), sent as the Android client the token belongs to.
 */
final class Account {

    private static final String CLIENT_VERSION = "21.44.528";

    private Account() {
    }

    static boolean signedIn() {
        try {
            return !AuthUtils.isNotLoggedIn();
        } catch (Throwable t) {
            return false;
        }
    }

    static JSONObject post(String endpoint, JSONObject body) {
        try {
            Locale l = Locale.getDefault();
            body.put("context", new JSONObject().put("client", new JSONObject()
                    .put("clientName", "ANDROID")
                    .put("clientVersion", CLIENT_VERSION)
                    .put("androidSdkVersion", android.os.Build.VERSION.SDK_INT)
                    .put("hl", l.getLanguage())
                    .put("gl", l.getCountry().isEmpty() ? "US" : l.getCountry())));
            Map<String, String> headers = new HashMap<>();
            for (Map.Entry<String, String> h : AuthUtils.getRequestHeader().entrySet()) {
                if (h.getValue() != null && !h.getValue().isEmpty()) headers.put(h.getKey(), h.getValue());
            }
            headers.put("User-Agent", "com.google.android.youtube/" + CLIENT_VERSION + " (Linux; U; Android "
                    + android.os.Build.VERSION.RELEASE + ") gzip");
            headers.put("X-Youtube-Client-Name", "3");
            headers.put("X-Youtube-Client-Version", CLIENT_VERSION);
            return Http.innertube(endpoint, body, headers);
        } catch (Exception e) {
            Logger.printDebug(() -> "YouTube Extras: " + endpoint + " as the user failed: " + e);
            return null;
        }
    }
}
