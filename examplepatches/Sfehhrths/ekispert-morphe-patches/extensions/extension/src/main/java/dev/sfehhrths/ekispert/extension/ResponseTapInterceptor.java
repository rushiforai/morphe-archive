package dev.sfehhrths.ekispert.extension;

import android.util.Log;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Application-level OkHttp interceptor. Lets the request through untouched, then, if the
 * host is one we care about, copies the response body (via {@link Response#peekBody(long)},
 * which leaves the original body readable for the app) and hands it to {@link ResponseSink}.
 */
public final class ResponseTapInterceptor implements Interceptor {

    private static final String TAG = ResponseTapPatch.TAG;

    /** Hosts whose responses are forwarded. Extend here when adding delay / realtime info. */
    static final Set<String> TARGET_HOSTS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            // 経路検索・駅情報・運行情報 (XML)
            "android-inhouse-api.ekispert.jp",
            // リアルタイム列車位置・遅延 realtime/trip (JSON)。経路詳細を開いている間 60 秒ごと
            "mixway.ekispert.jp"
            // 未使用 (時刻表タブ専用):
            // , "d24aul6ejje7q8.cloudfront.net" // 時刻表遅延情報 (JSON)
            // , "private-traininfo.val.jp"      // 運行情報 (レスキューナウ, My路線)
    )));

    /** Upper bound for the peeked copy; route search XML is well under this. */
    private static final long MAX_PEEK_BYTES = 8L * 1024 * 1024;

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        try {
            tap(request, response);
        } catch (Throwable t) {
            // The tap must never affect the app; swallow everything.
            Log.w(TAG, "tap failed: " + t, t);
        }
        return response;
    }

    private static void tap(Request request, Response response) throws IOException {
        HttpUrl url = request.url();
        if (!TARGET_HOSTS.contains(url.host())) {
            return;
        }
        ResponseBody peeked = response.peekBody(MAX_PEEK_BYTES);
        MediaType mediaType = peeked.contentType();
        String body = peeked.string();
        ResponseSink.deliver(url, response.code(), mediaType != null ? mediaType.toString() : null, body);
    }
}
