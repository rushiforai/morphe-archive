/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.syncforreddit;

import androidx.annotation.NonNull;

import java.io.IOException;
import java.net.HttpURLConnection;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.fixes.redgifs.BaseFixRedgifsApiPatch;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * @noinspection unused
 */
public class FixRedgifsApiPatch extends BaseFixRedgifsApiPatch {
    /**
     * The first request Sync makes when opening a RedGifs link. It used to return the caller's
     * public address, which Sync passes along as the {@code user-addr} query parameter.
     * RedGifs removed the endpoint and it now returns 404, which aborts the whole flow before
     * the token and gif requests are ever made.
     */
    private static final String REMOTE_ADDRESS_PATH = "/info";

    /**
     * Sync parses this as JSON and reads {@code remote-addr} out of it.
     * The value is only used for the {@code user-addr} query parameter, which the v2 API
     * ignores, so an empty address is enough to let the flow continue.
     */
    private static final String REMOTE_ADDRESS_BODY = "{\"remote-addr\":\"\"}";

    static {
        INSTANCE = new FixRedgifsApiPatch();
    }

    public String getDefaultUserAgent() {
        // To be filled in by patch
        return "";
    }

    public static OkHttpClient install(OkHttpClient.Builder builder) {
        return builder.addInterceptor(INSTANCE).build();
    }

    @NonNull
    @Override
    public Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();

        if (request.url().host().equals("api.redgifs.com")
                && request.url().encodedPath().equals(REMOTE_ADDRESS_PATH)) {
            Logger.printDebug(() -> "Emulating removed RedGifs " + REMOTE_ADDRESS_PATH + " endpoint");
            return emulateRemoteAddressResponse(request);
        }

        return super.doIntercept(chain);
    }

    private static Response emulateRemoteAddressResponse(Request request) {
        return new Response.Builder()
                .message("OK")
                .code(HttpURLConnection.HTTP_OK)
                .protocol(Protocol.HTTP_1_1)
                .request(request)
                .header("Content-Type", "application/json")
                .body(ResponseBody.create(
                        REMOTE_ADDRESS_BODY, MediaType.get("application/json")))
                .build();
    }
}
