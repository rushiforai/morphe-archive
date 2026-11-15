package app.hoitruyenchu.extension.itruyenchu.patches.titles;

import android.net.Uri;
import android.util.Log;

import java.io.IOException;
import java.util.regex.Matcher;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Puts the real chapter titles into the chapter list ({@code STATIC_URL/chapters/{slug}.json.gz})
 * the app downloads. See {@link ChapterTitlesPatch}.
 */
final class ChapterListInterceptor implements Interceptor {
    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        if (!"GET".equals(request.method()) || !response.isSuccessful()) return response;
        Matcher matcher = ChapterTitlesPatch.LIST_PATH.matcher(request.url().encodedPath());
        if (!matcher.matches()) return response;
        ResponseBody body = response.body();
        if (body == null) return response;

        byte[] raw = body.bytes(); // the original body is consumed: always answer with a new one
        byte[] result = null;
        try {
            result = ChapterTitlesPatch.onChapterList(Uri.decode(matcher.group(1)), raw);
        } catch (Throwable t) {
            Log.w(ChapterTitlesPatch.TAG, "chapter list not changed: " + t);
        }
        return response.newBuilder()
                .removeHeader("Content-Length")
                .body(ResponseBody.create(body.contentType(), result != null ? result : raw))
                .build();
    }
}
