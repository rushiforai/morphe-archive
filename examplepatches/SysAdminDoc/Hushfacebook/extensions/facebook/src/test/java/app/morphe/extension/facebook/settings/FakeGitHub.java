/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Deque;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentLinkedDeque;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Supplier;

/**
 * GitHub as a test answers it, so no test goes online: each request takes the next reply, and every
 * request is kept with the headers it carried.
 */
final class FakeGitHub implements ReleaseCheck.Transport {
    /** Every address asked, in order. */
    final List<URL> asked = new CopyOnWriteArrayList<>();
    /** What each request carried besides its address. */
    final List<Map<String, String>> sent = new CopyOnWriteArrayList<>();
    /** Runs as each request arrives, on the thread that made it, before the reply. */
    volatile Runnable onRequest;

    private final Deque<Reply> replies = new ConcurrentLinkedDeque<>();
    private volatile Reply always;

    /** The next request gets [reply]. */
    FakeGitHub then(Reply reply) {
        replies.add(reply);
        return this;
    }

    /** Every request once the queued replies are used gets [reply]. */
    FakeGitHub always(Reply reply) {
        always = reply;
        return this;
    }

    @Override
    public ReleaseCheck.Exchange get(URL url, Map<String, String> headers) throws IOException {
        asked.add(url);
        sent.add(new LinkedHashMap<>(headers));
        Runnable hook = onRequest;
        if (hook != null) hook.run();
        Reply reply = replies.poll();
        if (reply == null) reply = always;
        if (reply == null) throw new AssertionError("asked once more than the test expected: " + url);
        return reply.open();
    }

    /** A release as GitHub's API gives it: tag, notes, flags and one asset with its uploader. */
    static String release(String tag, String notes) {
        try {
            JSONObject uploader = new JSONObject().put("login", "SysAdminDoc").put("id", 54586742)
                    .put("site_admin", false);
            JSONObject asset = new JSONObject().put("name", "patches-" + tag + ".mpp").put("size", 1148937)
                    .put("uploader", uploader).put("label", "");
            return new JSONObject()
                    .put("url", "https://api.github.com/repos/SysAdminDoc/Hushfacebook/releases/397383571")
                    .put("tag_name", tag)
                    .put("name", tag)
                    .put("draft", false)
                    .put("prerelease", false)
                    .put("assets", new JSONArray().put(asset))
                    .put("body", notes == null ? JSONObject.NULL : notes)
                    .put("reactions", new JSONObject().put("total_count", 5).put("+1", 1))
                    .toString();
        } catch (JSONException impossible) {
            throw new AssertionError(impossible);
        }
    }

    /** One reply: a status, headers and a body, or a failure before any of them. */
    static final class Reply {
        private int status = 200;
        private final Map<String, String> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        private long length = -1;
        private Supplier<InputStream> body;
        private IOException thrown;
        private final AtomicBoolean bodyOpened = new AtomicBoolean();
        private final AtomicBoolean closed = new AtomicBoolean();

        /** A 200 with [tag]'s release. */
        static Reply release(String tag, String notes) {
            return json(FakeGitHub.release(tag, notes));
        }

        /** A 200 carrying [text] as it is. */
        static Reply json(String text) {
            byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
            Reply reply = new Reply();
            reply.headers.put("Content-Type", "application/json; charset=utf-8");
            reply.body = () -> new ByteArrayInputStream(bytes);
            return reply;
        }

        /** A 200 whose body is whatever [stream] gives, announced or not. */
        static Reply streaming(Supplier<InputStream> stream) {
            Reply reply = new Reply();
            reply.body = stream;
            return reply;
        }

        /** An answer with [status] and no body. */
        static Reply status(int status) {
            Reply reply = new Reply();
            reply.status = status;
            reply.body = () -> new ByteArrayInputStream(new byte[0]);
            return reply;
        }

        /** No answer at all: the request fails with [failure]. */
        static Reply failing(IOException failure) {
            Reply reply = new Reply();
            reply.thrown = failure;
            return reply;
        }

        Reply header(String name, String value) {
            headers.put(name, value);
            return this;
        }

        /** Announces [bytes] as the body's length, whatever the body is. */
        Reply announcing(long bytes) {
            length = bytes;
            return this;
        }

        boolean bodyOpened() {
            return bodyOpened.get();
        }

        boolean closed() {
            return closed.get();
        }

        ReleaseCheck.Exchange open() throws IOException {
            if (thrown != null) throw thrown;
            return new ReleaseCheck.Exchange() {
                @Override
                public int status() {
                    return status;
                }

                @Override
                public String header(String name) {
                    return headers.get(name);
                }

                @Override
                public long length() {
                    return length;
                }

                @Override
                public InputStream body() {
                    bodyOpened.set(true);
                    if (body == null) throw new AssertionError("this reply has no body");
                    return body.get();
                }

                @Override
                public void close() {
                    closed.set(true);
                }
            };
        }
    }
}
