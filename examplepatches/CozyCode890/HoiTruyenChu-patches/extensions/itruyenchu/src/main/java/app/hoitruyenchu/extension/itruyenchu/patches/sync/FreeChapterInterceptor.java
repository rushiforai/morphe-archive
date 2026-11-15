package app.hoitruyenchu.extension.itruyenchu.patches.sync;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;

import okhttp3.Interceptor;

/**
 * <ul>
 *   <li>Notices when the app downloads a free chapter ({@code STATIC_URL/free/{slug}/chuong-{n}.txt},
 *       chapters 1-50), which the server never sees, and lets {@link AutoSyncPatch} record it.
 *       The request itself is not changed.</li>
 *   <li>The "Đồng bộ" button of the history screen posts the local history to
 *       {@code POST /users/sync-books}, which now always fails with HTTP 500. The request is sent to
 *       {@code POST /users/sync-books-new} instead and the answer is turned into what the button
 *       expects (see {@link AutoSyncPatch#onSyncButton}).</li>
 * </ul>
 */
final class FreeChapterInterceptor implements Interceptor {
    private static final String TAG = "HTC-Sync";
    private static final Pattern FREE_CHAPTER = Pattern.compile("^/free/([^/]+)/chuong-(\\d+)\\.txt$");
    private static final String SYNC_BUTTON_PATH = "/users/sync-books";
    private static final String PULL_PATH = "/users/sync-books-new";

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        String path = request.url().encodedPath();
        if ("POST".equals(request.method()) && SYNC_BUTTON_PATH.equals(path)) {
            Response replaced = syncButton(chain, request);
            if (replaced != null) return replaced;
        }
        Response response = chain.proceed(request);
        try {
            if ("GET".equals(request.method()) && response.isSuccessful()) {
                Matcher matcher = FREE_CHAPTER.matcher(path);
                if (matcher.matches()) {
                    AutoSyncPatch.onFreeChapterLoaded(matcher.group(1), Integer.parseInt(matcher.group(2)));
                }
            }
        } catch (Throwable ignored) {
            // Never break the app's request.
        }
        return response;
    }

    /** @return the answer for the sync button, or null to send the original request. */
    private static Response syncButton(Chain chain, Request request) throws IOException {
        JSONArray local;
        Request pull;
        MediaType json = MediaType.parse("application/json; charset=utf-8");
        try {
            local = new JSONObject(bodyOf(request)).optJSONArray("recentReads");
            if (local == null) return null;
            String url = request.url().toString();
            int index = url.indexOf(SYNC_BUTTON_PATH);
            if (index < 0) return null;
            pull = request.newBuilder()
                    .url(url.substring(0, index) + PULL_PATH + url.substring(index + SYNC_BUTTON_PATH.length()))
                    .post(RequestBody.create(json, "{}"))
                    .build();
        } catch (Throwable t) {
            Log.w(TAG, "sync button: request not changed: " + t);
            return null;
        }
        Response response = chain.proceed(pull);
        if (!response.isSuccessful()) return response; // the app shows the error
        ResponseBody body = response.body();
        String pulled = body == null ? "" : body.string();
        String answer = null;
        try {
            answer = AutoSyncPatch.onSyncButton(local, pulled, request.header("Authorization"));
        } catch (Throwable t) {
            Log.w(TAG, "sync button failed", t);
        }
        if (answer == null) {
            // The app keeps its history and shows the message.
            answer = "{\"message\":\"Không đồng bộ được, hãy thử lại\"}";
        }
        return response.newBuilder().body(ResponseBody.create(json, answer)).build();
    }

    private static String bodyOf(Request request) throws IOException {
        RequestBody body = request.body();
        if (body == null) return "{}";
        Buffer buffer = new Buffer();
        body.writeTo(buffer);
        return buffer.readUtf8();
    }
}
