package app.morphe.extension.shared.fixes.redgifs;

import androidx.annotation.NonNull;

import org.json.JSONException;

import java.io.IOException;
import java.net.HttpURLConnection;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;


public abstract class BaseFixRedgifsApiPatch extends PatchedditInterceptor {
    protected static BaseFixRedgifsApiPatch INSTANCE;
    public abstract String getDefaultUserAgent();

    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    public Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        if (!request.url().host().equals("api.redgifs.com")) {
            return chain.proceed(request);
        }

        String userAgent = getDefaultUserAgent();
        boolean refused = false;

        if (request.header("Authorization") != null) {
            Response response = chain.proceed(request.newBuilder().header("User-Agent", userAgent).build());
            if (response.isSuccessful()) {
                return response;
            }
            // It's possible that the user agent is being overwritten later down in the interceptor
            // chain, so make sure we grab the new user agent from the request headers.
            String rewritten = response.request().header("User-Agent");
            if (rewritten != null) {
                userAgent = rewritten;
            }
            response.close();
            // Whatever token that request carried was turned down, so any token held here for
            // the same user agent is no more likely to be accepted.
            refused = true;
        }

        try {
            RedgifsTokenManager.RedgifsToken token =
                    RedgifsTokenManager.refreshToken(userAgent, refused);

            // Emulate response for old OAuth endpoint
            if (request.url().encodedPath().equals("/v2/oauth/client")) {
                String responseBody = RedgifsTokenManager.getEmulatedOAuthResponseBody(token);
                return new Response.Builder()
                        .message("OK")
                        .code(HttpURLConnection.HTTP_OK)
                        .protocol(Protocol.HTTP_1_1)
                        .request(request)
                        .header("Content-Type", "application/json")
                        .body(ResponseBody.create(
                                responseBody, MediaType.get("application/json")))
                        .build();
            }

            Response response = chain.proceed(authorized(request, token, userAgent));
            if (!worthAnotherToken(response)) {
                return response;
            }
            // A token that has not expired can still be refused, which is what happens after
            // moving between networks: Redgifs ties one to the address it was issued for.
            // Nothing in the token says so, so being turned down is the only way to find out,
            // and restarting the app used to be the only way out of it.
            int refusedWith = response.code();
            Logger.printInfo(() -> "Redgifs answered " + refusedWith + " for " + request.url()
                    + ", asking for another token");
            response.close();

            RedgifsTokenManager.RedgifsToken replacement =
                    RedgifsTokenManager.refreshToken(userAgent, true);
            Response retried = chain.proceed(authorized(request, replacement, userAgent));

            // A token that has just been issued and is refused straight away is not a token
            // that went stale: Redgifs is turning down the request itself.
            if (!retried.isSuccessful()) {
                Logger.printInfo(() -> "Redgifs refused " + request.url() + " with a new token: "
                        + retried.code());
            }
            return retried;
        } catch (JSONException ex) {
            Logger.printException(() -> "Could not parse Redgifs response", ex);
            throw new IOException(ex);
        }
    }

    private static Request authorized(Request request, RedgifsTokenManager.RedgifsToken token,
                                      String userAgent) {
        return request.newBuilder()
                .header("Authorization", "Bearer " + token.getAccessToken())
                .header("User-Agent", userAgent)
                .build();
    }

    /**
     * Redgifs does not say that a token has stopped being usable, and it has not been
     * consistent about how it turns one down, so anything short of success is worth one attempt
     * with a new token. The exception is a gif that is simply not there, which a new token
     * would not conjure up.
     */
    private static boolean worthAnotherToken(Response response) {
        return !response.isSuccessful()
                && response.code() != HttpURLConnection.HTTP_NOT_FOUND;
    }
}
