package app.yydarlinker.aicaptions;

import org.json.*;

import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * Streamed Chat Completions transport for the pinned protocol. The finished stream is rebuilt into
 * the same response object a non-streamed call returns, so parsing, validation, repair and cache
 * are unchanged. While the reply arrives, each completed event object is offered to a listener in
 * order.
 *
 * <p>Only providers whose streaming was verified with the pinned request options are streamed; any
 * other endpoint keeps the non-streamed request. A rejected streamed request falls back once.
 */
final class RebuildStream {
    interface Listener {
        void onEvents(JSONArray events);
    }

    /** A request control that can display validated leading events before the reply completes. */
    interface Early {
        void onProvisional(RebuildProtocol.Plan prefix);
    }

    private static final Set<String> rejected = Collections.synchronizedSet(new HashSet<>());

    /** Test fixtures only; production never sets it. */
    static volatile String fixtureHost = "";

    private RebuildStream() {}

    static boolean wanted(TranslationSettings cfg, String identity) {
        String host = ProviderEndpoint.host(cfg.baseUrl);
        return !rejected.contains(identity)
                && ("api.deepseek.com".equals(host)
                        || ProviderEndpoint.bailian(host)
                        || !fixtureHost.isEmpty() && fixtureHost.equals(host));
    }

    static void enable(JSONObject request) throws JSONException {
        request.put("stream", true)
                .put("stream_options", new JSONObject().put("include_usage", true));
    }

    /**
     * The provider refused the streamed form: use the portable non-streamed request from now on.
     */
    static void reject(JSONObject request, String identity) {
        if (rejected.size() > 128) rejected.clear();
        rejected.add(identity);
        disable(request);
    }

    /** True when the stream was cut by a provider error event: the request is then made plain. */
    static boolean cut(Reader reader, JSONObject request) {
        if (reader == null || reader.error().isEmpty()) return false;
        disable(request);
        return true;
    }

    /** The same request once, without streaming; later requests still stream. */
    static void disable(JSONObject request) {
        try {
            request.put("stream", false);
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
        request.remove("stream_options");
    }

    static void reset() {
        rejected.clear();
    }

    /**
     * Validates each longer prefix with the full parse's per-event checks and hands it to the job.
     * The first prefix that fails stops early display; the complete reply is still parsed normally.
     */
    static Listener provisional(
            CaptionApiClient.RequestControl control,
            RebuildSource source,
            RebuildPlanner.Block block,
            CaptionLanguageContext context) {
        if (!(control instanceof Early)) return null;
        Early job = (Early) control;
        boolean[] stopped = {false};
        return events -> {
            if (stopped[0]) return;
            try {
                String reply =
                        new JSONObject().put("block", block.id()).put("events", events).toString();
                job.onProvisional(RebuildProtocol.parsePrefix(reply, source, block, context));
            } catch (Exception invalid) {
                stopped[0] = true;
            }
        };
    }

    /** Server-sent events in, assistant content and a non-streamed response object out. */
    static final class Reader {
        private final Listener listener;
        private final StringBuilder pending = new StringBuilder(), content = new StringBuilder();
        private final java.io.ByteArrayOutputStream line = new java.io.ByteArrayOutputStream();
        private String finish = "", model = "", error = "";
        private JSONObject usage;
        private boolean streamed;
        private int offered;

        Reader(Listener listener) {
            this.listener = listener;
        }

        void feed(byte[] buffer, int offset, int length) {
            for (int i = offset; i < offset + length; i++) {
                if (buffer[i] != '\n') {
                    line.write(buffer[i]);
                    continue;
                }
                accept(new String(line.toByteArray(), StandardCharsets.UTF_8).trim());
                line.reset();
            }
        }

        private void accept(String value) {
            if (!value.startsWith("data:")) return;
            String data = value.substring(5).trim();
            if (data.isEmpty() || data.equals("[DONE]")) return;
            JSONObject chunk;
            try {
                chunk = new JSONObject(data);
            } catch (JSONException malformed) {
                return;
            }
            streamed = true;
            // A provider may cut the stream with an error event (Bailian output inspection); what
            // was
            // streamed so far is then only a prefix.
            JSONObject failure = chunk.optJSONObject("error");
            if (failure != null) {
                error = failure.optString("code", "").replaceAll("[^A-Za-z0-9_.-]", "_");
                if (error.isEmpty()) error = "error";
                return;
            }
            if (chunk.optJSONObject("usage") != null) usage = chunk.optJSONObject("usage");
            if (!chunk.optString("model").isEmpty()) model = chunk.optString("model");
            JSONArray choices = chunk.optJSONArray("choices");
            if (choices == null || choices.length() == 0) return;
            JSONObject choice = choices.optJSONObject(0);
            if (choice == null) return;
            if (!choice.isNull("finish_reason") && !choice.optString("finish_reason").isEmpty())
                finish = choice.optString("finish_reason");
            JSONObject delta = choice.optJSONObject("delta");
            String text =
                    delta == null || delta.isNull("content") ? "" : delta.optString("content");
            if (text.isEmpty()) return;
            content.append(text);
            offer();
        }

        /**
         * Completed objects of the top-level "events" array, in order; partial objects are ignored.
         */
        private void offer() {
            if (listener == null) return;
            List<String> objects = completedEvents(content);
            if (objects.size() <= offered) return;
            JSONArray events = new JSONArray();
            try {
                for (String object : objects) events.put(new JSONObject(object));
            } catch (JSONException malformed) {
                return;
            }
            offered = objects.size();
            listener.onEvents(events);
        }

        boolean streamed() {
            return streamed;
        }

        /** The provider's code when the stream was cut by an error event, else empty. */
        String error() {
            if (line.size() > 0) {
                accept(new String(line.toByteArray(), StandardCharsets.UTF_8).trim());
                line.reset();
            }
            return error;
        }

        String content() {
            return content.toString();
        }

        /** The same shape a non-streamed call returns, for the unchanged downstream path. */
        JSONObject response() throws JSONException {
            if (line.size() > 0) {
                accept(new String(line.toByteArray(), StandardCharsets.UTF_8).trim());
                line.reset();
            }
            JSONObject choice =
                    new JSONObject()
                            .put(
                                    "message",
                                    new JSONObject()
                                            .put("role", "assistant")
                                            .put("content", content.toString()))
                            .put("finish_reason", finish.isEmpty() ? JSONObject.NULL : finish);
            JSONObject root = new JSONObject().put("choices", new JSONArray().put(choice));
            if (!model.isEmpty()) root.put("model", model);
            if (usage != null) root.put("usage", usage);
            return root;
        }
    }

    /** Scans possibly incomplete JSON text for completed elements of the root object's "events". */
    static List<String> completedEvents(CharSequence text) {
        List<String> out = new ArrayList<>();
        int depth = 0, eventsDepth = -1, start = -1;
        boolean string = false, escape = false, expectEvents = false;
        StringBuilder key = null;
        String lastKey = "";
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (string) {
                if (escape) {
                    escape = false;
                    if (key != null) key.append(c);
                } else if (c == '\\') escape = true;
                else if (c == '"') {
                    string = false;
                    if (key != null) {
                        lastKey = key.toString();
                        key = null;
                    }
                } else if (key != null) key.append(c);
                continue;
            }
            switch (c) {
                case '"':
                    string = true;
                    key = depth == 1 && eventsDepth < 0 ? new StringBuilder() : null;
                    break;
                case ':':
                    expectEvents = depth == 1 && lastKey.equals("events");
                    break;
                case '[':
                    depth++;
                    if (expectEvents && depth == 2) eventsDepth = 2;
                    expectEvents = false;
                    break;
                case '{':
                    depth++;
                    if (eventsDepth == 2 && depth == 3) start = i;
                    break;
                case '}':
                    if (eventsDepth == 2 && depth == 3 && start >= 0) {
                        out.add(text.subSequence(start, i + 1).toString());
                        start = -1;
                    }
                    depth--;
                    break;
                case ']':
                    if (depth == eventsDepth) return out;
                    depth--;
                    break;
                case ',':
                    expectEvents = false;
                    break;
                default:
                    break;
            }
        }
        return out;
    }
}
