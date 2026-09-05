package app.supreme.extension;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Grants Reclub Supporter by rewriting the account payload returned by the API.
 *
 * Reclub sends its own {@code Accept-Encoding}, so OkHttp does not transparently
 * decompress. Bodies must be gunzipped here and re-gzipped after modification,
 * otherwise the payload reaches the app corrupted.
 */
@SuppressWarnings("unused")
public final class EntitlementsInterceptor implements Interceptor {

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);

        String urlLower = request.url().toString().toLowerCase(Locale.US);
        if (!isAccountEndpoint(urlLower) || !response.isSuccessful()) {
            return response;
        }

        ResponseBody body = response.body();
        if (body == null) {
            return response;
        }

        MediaType contentType = body.contentType();
        byte[] raw = body.bytes();
        boolean gzipped = "gzip".equalsIgnoreCase(response.header("Content-Encoding"));

        String text;
        try {
            text = gzipped ? gunzip(raw) : new String(raw, StandardCharsets.UTF_8);
        } catch (IOException e) {
            return withBody(response, raw, contentType);
        }

        String patched = UnlockPremiumHelper.grantPremium(text);
        if (patched.equals(text)) {
            return withBody(response, raw, contentType);
        }

        byte[] out;
        try {
            out = gzipped ? gzip(patched) : patched.getBytes(StandardCharsets.UTF_8);
        } catch (IOException e) {
            return withBody(response, raw, contentType);
        }

        return response.newBuilder()
                .removeHeader("Content-Length")
                .addHeader("Content-Length", String.valueOf(out.length))
                .body(ResponseBody.create(out, contentType))
                .build();
    }

    private static Response withBody(Response response, byte[] bytes, MediaType contentType) {
        return response.newBuilder()
                .body(ResponseBody.create(bytes, contentType))
                .build();
    }

    private static boolean isAccountEndpoint(String urlLower) {
        if (!urlLower.contains("api.reclub.co")) {
            return false;
        }
        return urlLower.contains("/user/sync")
                || urlLower.contains("/user/me")
                || urlLower.contains("entitlement");
    }

    private static String gunzip(byte[] data) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(Math.max(64, data.length * 4));
        try (GZIPInputStream in = new GZIPInputStream(new ByteArrayInputStream(data))) {
            byte[] buf = new byte[8192];
            int read;
            while ((read = in.read(buf)) != -1) {
                out.write(buf, 0, read);
            }
        }
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }

    private static byte[] gzip(String text) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (GZIPOutputStream gz = new GZIPOutputStream(out)) {
            gz.write(text.getBytes(StandardCharsets.UTF_8));
        }
        return out.toByteArray();
    }
}
