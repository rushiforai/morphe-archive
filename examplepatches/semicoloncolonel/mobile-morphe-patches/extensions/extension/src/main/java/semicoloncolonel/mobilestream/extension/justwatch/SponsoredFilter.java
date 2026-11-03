package semicoloncolonel.mobilestream.extension.justwatch;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;

/**
 * "Hide sponsored titles" for JustWatch.
 *
 * Sponsored titles (the "Sponsored" cards and sponsored pre-rolls) come from
 * the getSRCampaign field of JustWatch's GraphQL queries. For every query
 * that asks for it, the field is set to null in the response, which the app
 * treats as "no campaign". Nothing else in the response is changed.
 */
@SuppressWarnings("unused")
public final class SponsoredFilter implements Interceptor {
    private static final String TAG = "MSP-JW";
    private static final String FIELD = "getSRCampaign";
    private static final Pattern ALIAS = Pattern.compile("(\\w+)\\s*:\\s*" + FIELD + "\\b");
    private static final long MAX_BODY = 1024 * 1024;

    private static volatile boolean logged;

    public static void install(OkHttpClient.Builder builder) {
        try {
            for (Interceptor interceptor : builder.interceptors()) {
                if (interceptor instanceof SponsoredFilter) {
                    return;
                }
            }
            builder.interceptors().add(0, new SponsoredFilter());
        } catch (Throwable t) {
            Log.w(TAG, "install failed: " + t);
        }
    }

    /** The response keys of the sponsored field: its aliases, or its own name. */
    private static Set<String> sponsoredKeys(Request request) {
        try {
            RequestBody body = request.body();
            if (body == null || !request.url().host().endsWith("justwatch.com")
                    || body.contentLength() < 0 || body.contentLength() > MAX_BODY) {
                return null;
            }
            Buffer buffer = new Buffer();
            body.writeTo(buffer);
            String text = buffer.readUtf8();
            if (!text.contains(FIELD)) {
                return null;
            }
            Set<String> keys = new HashSet<>();
            keys.add(FIELD);
            Matcher matcher = ALIAS.matcher(text);
            while (matcher.find()) {
                keys.add(matcher.group(1));
            }
            return keys;
        } catch (Throwable t) {
            return null;
        }
    }

    private static void clear(Object node, Set<String> keys) throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> names = object.keys();
            Set<String> found = new HashSet<>();
            while (names.hasNext()) {
                String name = names.next();
                if (keys.contains(name)) {
                    found.add(name);
                } else {
                    clear(object.get(name), keys);
                }
            }
            for (String name : found) {
                object.put(name, JSONObject.NULL);
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                clear(array.get(i), keys);
            }
        }
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Set<String> keys = sponsoredKeys(request);
        Response response = chain.proceed(request);
        if (keys == null) {
            return response;
        }
        ResponseBody body = response.body();
        if (body == null || !response.isSuccessful()) {
            return response;
        }
        MediaType type = body.contentType();
        String text = body.string();
        try {
            JSONObject json = new JSONObject(text);
            Object data = json.opt("data");
            if (data != null) {
                clear(data, keys);
                text = json.toString();
                if (!logged) {
                    logged = true;
                    Log.i(TAG, "removed sponsored titles");
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "filter failed: " + t);
        }
        return response.newBuilder().body(ResponseBody.create(text, type)).build();
    }
}
