package semicoloncolonel.mobilestream.extension.newsnation;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * NewsNation (phone app) — "Skip ads (phone)".
 *
 * The app builds its screens and articles from NewsNation's WordPress API
 * (newsnationnow.com/wp-json/nxd_app/...). Every screen carries the
 * publisher's own ad switches,
 *   "disabled_ads": {"display", "preroll", "nativo", "taboola", "all"},
 * and the app leaves out the ad slots a switch turns off. Every one of those
 * switches is turned on in each response, so the app builds no ad slots at
 * all and nothing is left blank. Nothing else in the response is changed.
 */
@SuppressWarnings("unused")
public final class AdSwitchFilter implements Interceptor {
    private static final String TAG = "MSP-NewsNation";
    private static final String KEY = "disabled_ads";
    private static final String[] SWITCHES = {"display", "preroll", "nativo", "taboola", "all"};

    private static volatile boolean logged;

    public static void install(OkHttpClient.Builder builder) {
        try {
            for (Interceptor interceptor : builder.interceptors()) {
                if (interceptor instanceof AdSwitchFilter) {
                    return; // newBuilder() copies of a client we already covered
                }
            }
            builder.interceptors().add(0, new AdSwitchFilter());
        } catch (Throwable t) {
            Log.w(TAG, "install failed: " + t);
        }
    }

    private static boolean isAppApi(Request request) {
        try {
            String host = request.url().host();
            return host != null && host.endsWith("newsnationnow.com")
                    && request.url().encodedPath().contains("/wp-json/nxd_app/");
        } catch (Throwable t) {
            return false;
        }
    }

    /** Turns every ad switch on, wherever a disabled_ads object appears. */
    private static int disableAds(Object node) throws Exception {
        int count = 0;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            List<String> names = new ArrayList<>();
            Iterator<String> iterator = object.keys();
            while (iterator.hasNext()) names.add(iterator.next());
            for (String name : names) {
                Object value = object.get(name);
                if (KEY.equals(name) && value instanceof JSONObject) {
                    JSONObject switches = (JSONObject) value;
                    for (String flag : SWITCHES) switches.put(flag, true);
                    Iterator<String> others = switches.keys();
                    List<String> rest = new ArrayList<>();
                    while (others.hasNext()) rest.add(others.next());
                    for (String flag : rest) {
                        if (switches.get(flag) instanceof Boolean) switches.put(flag, true);
                    }
                    count++;
                } else {
                    count += disableAds(value);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) count += disableAds(array.get(i));
        }
        return count;
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        if (!isAppApi(request) || !response.isSuccessful()) {
            return response;
        }
        // Leave bodies we cannot read as text (still compressed) untouched.
        String encoding = response.header("Content-Encoding");
        if (encoding != null && !encoding.equalsIgnoreCase("identity")) {
            return response;
        }
        ResponseBody body = response.body();
        if (body == null) {
            return response;
        }
        MediaType type = body.contentType();
        String text = body.string();
        if (text.contains(KEY)) {
            try {
                Object json = new JSONTokener(text).nextValue();
                if (disableAds(json) > 0) {
                    text = json.toString();
                    if (!logged) {
                        logged = true;
                        Log.i(TAG, "turned off the ad slots");
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "filter failed: " + t);
            }
        }
        return response.newBuilder()
                .removeHeader("Content-Length")
                .body(ResponseBody.create(text, type))
                .build();
    }
}
