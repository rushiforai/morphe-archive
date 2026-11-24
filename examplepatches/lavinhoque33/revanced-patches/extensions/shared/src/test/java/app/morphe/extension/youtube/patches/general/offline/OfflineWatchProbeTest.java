/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

import okhttp3.Call;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

import org.junit.Test;

public class OfflineWatchProbeTest {
    @Test
    public void noContentResponseAllowsWatchPlayer() {
        assertTrue(OfflineWatchProbe.isReachable(response(204)));
    }

    @Test
    public void portalPagesRedirectsAndHttpErrorsUseBuiltInPlayer() {
        for (int code : new int[]{200, 302, 403, 503}) {
            assertFalse("HTTP " + code, OfflineWatchProbe.isReachable(response(code)));
        }
    }

    @Test
    public void failedDnsAndTimeoutUseBuiltInPlayer() {
        assertFalse(OfflineWatchProbe.isReachable(call(chain -> {
            throw new UnknownHostException("App DNS blocked");
        })));
        assertFalse(OfflineWatchProbe.isReachable(call(chain -> {
            throw new SocketTimeoutException();
        })));
    }

    private static Call response(int code) {
        return call(chain -> new Response.Builder()
                .request(chain.request())
                .protocol(Protocol.HTTP_1_1)
                .code(code)
                .message("Test response")
                .body(ResponseBody.create(new byte[0], null))
                .build());
    }

    private static Call call(Interceptor interceptor) {
        return new OkHttpClient.Builder().addInterceptor(interceptor).build()
                .newCall(new Request.Builder().url("https://www.youtube.com/generate_204").build());
    }
}
