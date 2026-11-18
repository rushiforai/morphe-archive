// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import java.util.Map;
import java.util.TreeMap;

/**
 * Runs first in Volley's {@code BasicNetwork.performRequest}, on Volley's network threads. A handler a patch turned
 * on answers the requests it owns, failures included; for every other request it returns null and the app sends its
 * own request as before.
 */
public final class VolleyHook {
    static final String TAG = "edbfi";

    private VolleyHook() {}

    public static NetworkResponse perform(Request<?> request) {
        String url = request.getUrl();
        if (Redgifs.isEnabled() && Redgifs.handles(url)) return Redgifs.answer(url);
        if (MoreComments.isEnabled() && MoreComments.handles(url)) return MoreComments.answer(request);
        if (Galleries.isEnabled() && Galleries.handles(url)) return Galleries.answer(request);
        if (Imgur.isEnabled() && Imgur.handles(url)) return Imgur.answer(request);
        return null;
    }

    static NetworkResponse response(Http.Reply reply) {
        return new NetworkResponse(reply.status, reply.body, reply.headers, false, 0);
    }

    /** A response the extension made itself. */
    static NetworkResponse json(int status, byte[] body) {
        return response(new Http.Reply(status, body, jsonHeaders()));
    }

    static Map<String, String> jsonHeaders() {
        Map<String, String> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        headers.put("Content-Type", "application/json");
        return headers;
    }
}
