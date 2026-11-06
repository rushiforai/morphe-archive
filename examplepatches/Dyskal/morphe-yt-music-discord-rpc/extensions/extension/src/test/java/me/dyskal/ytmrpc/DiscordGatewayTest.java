package me.dyskal.ytmrpc;

import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import org.json.JSONObject;
import org.junit.Test;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.CountDownLatch;

import static org.junit.Assert.*;

public class DiscordGatewayTest {
    private static final String APP = "1559278040175878146";

    @Test public void authenticatesCoalescesRapidUpdatesAndClearsOnClose() throws Exception {
        BlockingQueue<JSONObject> frames = new LinkedBlockingQueue<>();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(frames, true, 60_000));
            try (DiscordGateway gateway = gateway(server, force -> "oauth-access", status -> { })) {
                gateway.update(DiscordPresence.update(new JSONObject().put("name", "first")), "first"); gateway.start();
                assertEquals("Bearer oauth-access", awaitOp(frames, 2, 5).getJSONObject("d").getString("token"));
                assertEquals("first", awaitOp(frames, 3, 5).getJSONObject("d").getJSONArray("activities").getJSONObject(0).getString("name"));
                gateway.update(DiscordPresence.update(new JSONObject().put("name", "intermediate")), "intermediate");
                gateway.update(DiscordPresence.update(new JSONObject().put("name", "latest")), "latest");
                assertEquals("latest", awaitOp(frames, 3, 7).getJSONObject("d").getJSONArray("activities").getJSONObject(0).getString("name"));
                gateway.close();
                assertEquals(0, awaitOp(frames, 3, 5).getJSONObject("d").getJSONArray("activities").length());
            }
        }
    }

    @Test public void missingHeartbeatAckReconnectsAndReplaysLatestPresence() throws Exception {
        BlockingQueue<JSONObject> frames = new LinkedBlockingQueue<>();
        AtomicInteger identifies = new AtomicInteger();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(frames, false, 1000)); server.enqueue(upgrade(frames, true, 60_000));
            try (DiscordGateway gateway = gateway(server, force -> { identifies.incrementAndGet(); return "access"; }, status -> { })) {
                gateway.update(DiscordPresence.update(new JSONObject().put("name", "track")), "track"); gateway.start();
                awaitOp(frames, 3, 5); awaitOp(frames, 1, 3);
                assertEquals("track", awaitOp(frames, 3, 8).getJSONObject("d").getJSONArray("activities").getJSONObject(0).getString("name"));
                assertEquals(2, identifies.get());
            }
        }
    }

    @Test public void closingOneGatewayDoesNotStopAnotherOrPreventRecreation() throws Exception {
        BlockingQueue<JSONObject> firstFrames = new LinkedBlockingQueue<>(), secondFrames = new LinkedBlockingQueue<>(), nextFrames = new LinkedBlockingQueue<>();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(firstFrames, true, 60_000)); server.enqueue(upgrade(secondFrames, true, 60_000));
            server.enqueue(upgrade(nextFrames, true, 60_000));
            try (DiscordGateway first = gateway(server, force -> "first", status -> { });
                 DiscordGateway second = gateway(server, force -> "second", status -> { })) {
                first.start(); awaitOp(firstFrames, 2, 5);
                first.update(DiscordPresence.update(new JSONObject().put("name", "first")), "first");
                awaitOp(firstFrames, 3, 5);
                second.start(); awaitOp(secondFrames, 2, 5);
                first.close(); awaitOp(firstFrames, 3, 5);
                try (DiscordGateway next = gateway(server, force -> "next", status -> { })) {
                    next.start(); assertEquals("Bearer next", awaitOp(nextFrames, 2, 5).getJSONObject("d").getString("token"));
                    second.update(DiscordPresence.update(new JSONObject().put("name", "still playing")), "second");
                    assertEquals("still playing", awaitOp(secondFrames, 3, 5).getJSONObject("d").getJSONArray("activities").getJSONObject(0).getString("name"));
                }
            }
        }
    }

    @Test public void rejectedRefreshGrantStopsInsteadOfRetryingForever() throws Exception {
        BlockingQueue<String> statuses = new LinkedBlockingQueue<>();
        AtomicInteger tokens = new AtomicInteger();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(new LinkedBlockingQueue<>(), true, 60_000));
            try (DiscordGateway gateway = gateway(server, force -> {
                tokens.incrementAndGet(); throw new DiscordFailure(DiscordFailure.Kind.AUTHORIZATION, "Discord OAuth HTTP 400 (invalid_grant)");
            }, statuses::add)) {
                gateway.start(); awaitStatus(statuses, "invalid_grant", 5);
                assertNull(statuses.poll(1500, TimeUnit.MILLISECONDS)); assertEquals(1, tokens.get());
            }
        }
    }

    @Test public void gateway4004RefreshesOnceBeforeReidentification() throws Exception {
        BlockingQueue<JSONObject> frames = new LinkedBlockingQueue<>();
        AtomicInteger forced = new AtomicInteger();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().withWebSocketUpgrade(new WebSocketListener() {
                @Override public void onOpen(WebSocket ws, Response response) { ws.close(4004, "do not display server secrets"); }
            }));
            server.enqueue(upgrade(frames, true, 60_000));
            try (DiscordGateway gateway = gateway(server, force -> {
                if (force) forced.incrementAndGet(); return "refreshed";
            }, status -> { })) {
                gateway.start();
                assertEquals("Bearer refreshed", awaitOp(frames, 2, 6).getJSONObject("d").getString("token"));
                assertEquals(1, forced.get());
            }
        }
    }

    @Test public void forbiddenApplicationIsReportedAsConfigurationFailure() throws Exception {
        BlockingQueue<DiscordFailure> failures = new LinkedBlockingQueue<>();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().setResponseCode(403).setBody("PRIVATE SERVER BODY"));
            DiscordGateway.StatusListener listener = new DiscordGateway.StatusListener() {
                @Override public void changed(String status) { }
                @Override public void failed(DiscordFailure error) { failures.add(error); }
            };
            try (DiscordGateway gateway = gateway(server, force -> "access", listener)) {
                gateway.start();
                DiscordFailure failure = failures.poll(5, TimeUnit.SECONDS);
                assertNotNull(failure); assertEquals(DiscordFailure.Kind.CONFIGURATION, failure.kind);
                assertEquals(403, failure.httpStatus); assertFalse(failure.getMessage().contains("PRIVATE"));
            }
        }
    }

    @Test public void cachedProcessDelayDoesNotProduceHeartbeatCatchupBurst() throws Exception {
        BlockingQueue<JSONObject> frames = new LinkedBlockingQueue<>();
        AtomicInteger delayed = new AtomicInteger();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(frames, true, 1000));
            try (DiscordGateway gateway = gateway(server, force -> "access", status -> {
                if ("Connected to Discord".equals(status) && delayed.getAndIncrement() == 0) {
                    try { Thread.sleep(2250); } catch (InterruptedException error) { Thread.currentThread().interrupt(); }
                }
            })) {
                gateway.start(); awaitOp(frames, 2, 5); awaitOp(frames, 1, 5); awaitOp(frames, 1, 3);
                assertEquals(1, server.getRequestCount());
            }
        }
    }

    @Test public void slowTokenRequestDoesNotBlockHeartbeatAcknowledgements() throws Exception {
        BlockingQueue<JSONObject> frames = new LinkedBlockingQueue<>();
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(frames, true, 1000));
            try (DiscordGateway gateway = gateway(server, force -> { Thread.sleep(2250); return "access"; }, status -> { })) {
                gateway.start(); awaitOp(frames, 1, 3); awaitOp(frames, 2, 4);
                assertEquals(1, server.getRequestCount());
            }
        }
    }

    private static DiscordGateway gateway(MockWebServer server, DiscordGateway.TokenProvider tokens, DiscordGateway.StatusListener listener) {
        return new DiscordGateway(APP, tokens, listener, server.url("/gateway").toString());
    }
    private static MockResponse upgrade(BlockingQueue<JSONObject> frames, boolean ack, long interval) {
        return new MockResponse().withWebSocketUpgrade(new WebSocketListener() {
            @Override public void onOpen(WebSocket ws, Response response) { ws.send("{\"op\":10,\"d\":{\"heartbeat_interval\":" + interval + "}}"); }
            @Override public void onMessage(WebSocket ws, String text) {
                try {
                    JSONObject frame = new JSONObject(text); frames.add(frame);
                    if (frame.getInt("op") == 2) ws.send("{\"op\":0,\"t\":\"READY\",\"s\":1,\"d\":{}}");
                    if (frame.getInt("op") == 1 && ack) ws.send("{\"op\":11,\"d\":null}");
                } catch (Exception error) { throw new AssertionError("Invalid client frame", error); }
            }
            @Override public void onClosing(WebSocket ws, int code, String reason) { ws.close(code, null); }
        });
    }
    private static JSONObject awaitOp(BlockingQueue<JSONObject> frames, int op, int timeout) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(timeout);
        while (System.nanoTime() < deadline) {
            JSONObject frame = frames.poll(Math.max(1, deadline - System.nanoTime()), TimeUnit.NANOSECONDS);
            assertNotNull("Timed out waiting for opcode " + op, frame);
            if (frame.getInt("op") == op) return frame;
        }
        throw new AssertionError("Missing opcode " + op);
    }
    private static void awaitStatus(BlockingQueue<String> statuses, String match, int seconds) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(seconds);
        while (System.nanoTime() < deadline) {
            String status = statuses.poll(Math.max(1, deadline - System.nanoTime()), TimeUnit.NANOSECONDS);
            assertNotNull("Missing status " + match, status);
            if (status.contains(match)) return;
        }
        fail("Missing status " + match);
    }

    @Test public void closeCancelsTokenLookupWithoutSendingAStaleIdentify() throws Exception {
        BlockingQueue<JSONObject> frames = new LinkedBlockingQueue<>();
        CountDownLatch started = new CountDownLatch(1), cancelled = new CountDownLatch(1);
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(upgrade(frames, true, 60_000));
            DiscordGateway.TokenProvider tokens = new DiscordGateway.TokenProvider() {
                @Override public String get(boolean force) throws Exception {
                    started.countDown(); cancelled.await(); return "stale-token";
                }
                @Override public void cancel() { cancelled.countDown(); }
            };
            try (DiscordGateway gateway = gateway(server, tokens, status -> { })) {
                gateway.start(); assertTrue(started.await(5, TimeUnit.SECONDS));
                gateway.close(); assertTrue(cancelled.await(1, TimeUnit.SECONDS));
                Thread.sleep(300);
                for (JSONObject frame : frames) assertNotEquals(2, frame.getInt("op"));
                gateway.update(DiscordPresence.update(null), "clear"); // A late update after close is harmless.
            }
        }
    }
}
