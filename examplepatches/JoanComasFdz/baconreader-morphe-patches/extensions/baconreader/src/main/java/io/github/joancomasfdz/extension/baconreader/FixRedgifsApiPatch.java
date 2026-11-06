// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader;

import androidx.annotation.NonNull;

import org.json.JSONException;

import java.io.IOException;
import java.net.HttpURLConnection;

import app.morphe.extension.shared.Logger;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * @noinspection unused
 */
public class FixRedgifsApiPatch implements Interceptor {
    private static final FixRedgifsApiPatch INSTANCE = new FixRedgifsApiPatch();

    // BaconReader uses a static user agent for Redgifs API calls.
    private static final String DEFAULT_USER_AGENT = "BaconReader";

    /**
     * Injection point. Replaces the OkHttpClient.Builder.build() call in RedGifsManager.getOkhttpClient().
     */
    public static OkHttpClient install(OkHttpClient.Builder builder) {
        return builder.addInterceptor(INSTANCE).build();
    }

    @NonNull
    @Override
    public Response intercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        if (!request.url().host().equals("api.redgifs.com")) {
            return chain.proceed(request);
        }

        String userAgent = DEFAULT_USER_AGENT;
        boolean forceTokenRefresh = false;

        if (request.header("Authorization") != null) {
            Response response = chain.proceed(request.newBuilder().header("User-Agent", userAgent).build());
            if (response.isSuccessful()) {
                return response;
            }
            // It's possible that the user agent is being overwritten later down in the interceptor
            // chain, so make sure we grab the new user agent from the request headers.
            userAgent = response.request().header("User-Agent");
            response.close();
            // A token can stop working before it expires, after an IP change or a Redgifs error.
            forceTokenRefresh = true;
        }

        try {
            RedgifsTokenManager.RedgifsToken token = RedgifsTokenManager.refreshToken(userAgent, forceTokenRefresh);

            // Emulate response for old OAuth endpoint.
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

            Response response = chain.proceed(withToken(request, token, userAgent));
            if (response.code() != HttpURLConnection.HTTP_UNAUTHORIZED) {
                return response;
            }
            // Redgifs ties a token to the address it was given to: after the phone's address
            // changes, it refuses the cached one (401 WrongSender) until a new one is asked for.
            // BaconReader's own requests carry no token, so the refresh above never runs for them.
            response.close();
            return chain.proceed(withToken(request, RedgifsTokenManager.refreshToken(userAgent, true), userAgent));
        } catch (JSONException ex) {
            Logger.printException(() -> "Could not parse Redgifs response", ex);
            throw new IOException(ex);
        }
    }

    private static Request withToken(Request request, RedgifsTokenManager.RedgifsToken token, String userAgent) {
        return request.newBuilder()
                .header("Authorization", "Bearer " + token.getAccessToken())
                .header("User-Agent", userAgent)
                .build();
    }
}
