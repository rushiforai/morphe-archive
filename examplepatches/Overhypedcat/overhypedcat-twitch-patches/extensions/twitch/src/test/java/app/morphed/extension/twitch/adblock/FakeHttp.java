package app.morphed.extension.twitch.adblock;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Answers requests whose URL (or POST body) contains a registered key.
 */
final class FakeHttp implements Http {
    final Map<String, String> getResponses = new LinkedHashMap<>();
    final Map<String, String> postResponses = new LinkedHashMap<>();
    // Backup player types are requested in parallel.
    final List<String> requests = Collections.synchronizedList(new ArrayList<>());

    @Override
    public Response get(String url, Map<String, String> headers) throws IOException {
        requests.add("GET " + url);
        return find(getResponses, url);
    }

    @Override
    public Response post(String url, Map<String, String> headers, String body) throws IOException {
        requests.add("POST " + body);
        return find(postResponses, body);
    }

    long count(String prefix) {
        synchronized (requests) {
            return requests.stream().filter(request -> request.startsWith(prefix)).count();
        }
    }

    /** Requests whose URL contains a key take this many milliseconds. */
    final Map<String, Long> delays = new LinkedHashMap<>();

    private Response find(Map<String, String> responses, String key) throws IOException {
        for (Map.Entry<String, Long> delay : delays.entrySet()) {
            if (!key.contains(delay.getKey())) continue;
            try {
                Thread.sleep(delay.getValue());
            } catch (InterruptedException e) {
                throw new IOException("interrupted");
            }
        }
        for (Map.Entry<String, String> entry : responses.entrySet()) {
            if (key.contains(entry.getKey())) return new Response(200, entry.getValue());
        }
        throw new IOException("No fake response for " + key);
    }

    static String tokenResponse(String playerType) {
        return "{\"data\":{\"streamPlaybackAccessToken\":{\"value\":\"{\\\"player_type\\\":\\\"" + playerType
                + "\\\"}\",\"signature\":\"sig-" + playerType + "\",\"__typename\":\"PlaybackAccessToken\"}}}";
    }
}
