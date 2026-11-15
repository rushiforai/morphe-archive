package app.hoitruyenchu.extension.itruyenchu.patches.media;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.zip.GZIPInputStream;

import app.hoitruyenchu.extension.itruyenchu.patches.tts.ReadingProgress;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Hands every chapter text the app downloads to {@link ReadingProgress}, so the widget can show
 * where the reading is. Chapters come as plain text or gzip (free / preview chapters, and the
 * file the API points to); the response itself is not changed.
 */
final class ChapterTextInterceptor implements Interceptor {
    private static final long MAX_BYTES = 4L * 1024 * 1024;

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        try {
            if ("GET".equals(request.method()) && response.isSuccessful() && mayBeChapter(request, response)) {
                ResponseBody peek = response.peekBody(MAX_BYTES);
                String text = decode(peek.bytes());
                if (text != null) ReadingProgress.onChapterText(text);
            }
        } catch (Throwable ignored) {
            // Never break the app's request.
        }
        return response;
    }

    private static boolean mayBeChapter(Request request, Response response) {
        String path = request.url().encodedPath().toLowerCase(Locale.ROOT);
        if (path.endsWith(".json") || path.endsWith(".json.gz") || path.endsWith(".png")
                || path.endsWith(".jpg") || path.endsWith(".jpeg") || path.endsWith(".webp")
                || path.endsWith(".mp3") || path.endsWith(".js")) {
            return false;
        }
        String type = response.header("Content-Type");
        if (type == null) return true;
        type = type.toLowerCase(Locale.ROOT);
        return type.startsWith("text/plain") || type.contains("octet-stream") || type.contains("gzip");
    }

    private static String decode(byte[] bytes) throws IOException {
        if (bytes == null || bytes.length < 10) return null;
        if ((bytes[0] & 0xff) == 0x1f && (bytes[1] & 0xff) == 0x8b) {
            try (InputStream in = new GZIPInputStream(new ByteArrayInputStream(bytes))) {
                ByteArrayOutputStream out = new ByteArrayOutputStream(bytes.length * 4);
                byte[] buffer = new byte[16384];
                int n;
                while ((n = in.read(buffer)) > 0) {
                    out.write(buffer, 0, n);
                    if (out.size() > MAX_BYTES * 4) return null;
                }
                bytes = out.toByteArray();
            }
        }
        // Binary data is not a chapter.
        int zeros = 0;
        for (int i = 0; i < Math.min(bytes.length, 2048); i++) if (bytes[i] == 0) zeros++;
        if (zeros > 0) return null;
        return new String(bytes, StandardCharsets.UTF_8);
    }
}
