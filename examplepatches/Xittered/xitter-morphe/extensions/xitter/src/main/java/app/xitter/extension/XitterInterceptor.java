package app.xitter.extension;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * First interceptor of every OkHttp client in the app. Requests for X go to the instance, signed
 * in the way Xitter expects (its session cookie and csrf header rather than X's OAuth 1.0a);
 * requests the guard refuses fail before any connection is made.
 */
final class XitterInterceptor implements Interceptor {
    private static final Pattern OAUTH_TOKEN = Pattern.compile("oauth_token=\"([^\"]*)\"");
    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();
        String host = url.host();
        boolean x = XitterNetwork.isXHost(host);
        if (!x && !XitterNetwork.isInstanceHost(host)) {
            if (!XitterNetwork.isAllowed(host)) {
                XitterNetwork.blocked(url.scheme() + "://" + host + url.encodedPath());
                throw new IOException("Blocked by Xitter: " + host);
            }
            return chain.proceed(request); // a third-party host the options allow
        }

        String path = url.encodedPath();
        // analytics; nothing on the instance wants them
        if (isTelemetry(path)) return empty(request, "{}");

        HttpUrl target = x ? HttpUrl.get(XitterNetwork.rewrite(url.toString())) : url;
        Request.Builder out = request.newBuilder().url(target);

        // X's sign-in and sign-up screens, answered on the device with the instance's sign-in
        if (LoginShim.handles(url)) return LoginShim.handle(chain, request, target);

        sign(request, out);
        return chain.proceed(out.build());
    }

    /** Replaces X's OAuth signature with the Xitter session the token stands for. */
    static void sign(Request request, Request.Builder out) {
        String authorization = request.header("Authorization");
        out.removeHeader("Authorization");
        out.removeHeader("X-Guest-Token");
        out.removeHeader("Cookie");
        String token = null;
        if (authorization != null && authorization.startsWith("OAuth ")) {
            Matcher m = OAUTH_TOKEN.matcher(authorization);
            if (m.find()) token = m.group(1);
        }
        Session s = Session.fromOAuthToken(token);
        if (s != null) {
            out.header("Cookie", "auth_token=" + s.authToken + "; ct0=" + s.csrf);
            out.header("x-csrf-token", s.csrf);
            out.header("x-twitter-auth-type", "OAuth2Session");
        } else {
            out.removeHeader("x-csrf-token");
        }
        String app = XitterConfig.clientToken();
        if (app != null && !app.trim().isEmpty()) out.header("Authorization", "Bearer " + app.trim());
    }

    private static boolean isTelemetry(String path) {
        return path.startsWith("/1.1/jot/") || path.startsWith("/i/jot") || path.contains("/scribe")
                || path.endsWith("/client_event.json") || path.startsWith("/1.1/attribution/");
    }

    static Response empty(Request request, String json) {
        return new Response.Builder()
                .request(request)
                .protocol(Protocol.HTTP_1_1)
                .code(200)
                .message("OK")
                .body(ResponseBody.create(json, JSON))
                .build();
    }

    static Response json(Request request, int code, String json) {
        return new Response.Builder()
                .request(request)
                .protocol(Protocol.HTTP_1_1)
                .code(code)
                .message(code == 200 ? "OK" : "Error")
                .body(ResponseBody.create(json, JSON))
                .build();
    }
}
