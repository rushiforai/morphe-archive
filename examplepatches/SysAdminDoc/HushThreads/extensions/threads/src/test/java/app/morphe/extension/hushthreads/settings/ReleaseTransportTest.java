/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.HttpCookie;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.Collections;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManagerFactory;

/** Captures the actual TLS request, rather than asking a CookieHandler what it might send. */
public class ReleaseTransportTest {
    private CookieHandler original;
    private SSLContext context;
    private ReleaseTransport transport;

    @Before
    public void prepare() throws Exception {
        original = CookieHandler.getDefault();
        KeyStore keys = KeyStore.getInstance("PKCS12");
        try (InputStream fixture = getClass().getResourceAsStream("/release-loopback.p12")) {
            assertNotNull("the public test-only localhost key fixture", fixture);
            keys.load(fixture, "test-only".toCharArray());
        }
        KeyManagerFactory keyManager = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
        keyManager.init(keys, "test-only".toCharArray());
        TrustManagerFactory trust = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        trust.init(keys);
        context = SSLContext.getInstance("TLS");
        context.init(keyManager.getKeyManagers(), trust.getTrustManagers(), null);
        transport = new ReleaseTransport(context.getSocketFactory());
    }

    @After
    public void restore() {
        CookieHandler.setDefault(original);
    }

    @Test
    public void headerDependentHandlerNeverSeesRequestOrResponse() throws Exception {
        AtomicInteger gets = new AtomicInteger();
        AtomicInteger puts = new AtomicInteger();
        CookieHandler handler = new CookieHandler() {
            @Override public Map<String, List<String>> get(URI uri, Map<String, List<String>> headers) {
                gets.incrementAndGet();
                return headers.isEmpty() ? Collections.emptyMap()
                        : Collections.singletonMap("Cookie", Collections.singletonList("sentinel=private"));
            }
            @Override public void put(URI uri, Map<String, List<String>> headers) { puts.incrementAndGet(); }
        };
        CookieHandler.setDefault(handler);
        try (Server server = new Server("HTTP/1.1 200 OK\r\nSet-Cookie: response=private\r\n"
                + "Set-Cookie2: second=private\r\nVary: Accept\r\nVary: Accept-Encoding\r\nContent-Length: 2\r\n\r\n{}")) {
            try (ReleaseCheck.Exchange answer = get(server)) {
                assertEquals(200, answer.status());
                assertEquals("{}", body(answer));
                assertNull(answer.header("Set-Cookie"));
                assertEquals("Accept, Accept-Encoding", answer.header("Vary"));
            }
            String wire = server.request.get(5, TimeUnit.SECONDS);
            assertTrue(wire.startsWith("GET /latest?value=1 HTTP/1.1\r\n"));
            assertTrue(wire.contains("User-Agent: HushThreads/0.0.12\r\n"));
            assertFalse(wire.toLowerCase().contains("cookie"));
            assertFalse(wire.contains("private"));
            assertSame(handler, CookieHandler.getDefault());
            assertEquals(0, gets.get());
            assertEquals(0, puts.get());
        }
    }

    @Test
    public void concurrentHandlerChangeIsPreserved() throws Exception {
        CookieHandler first = throwingHandler();
        CookieHandler replacement = throwingHandler();
        CookieHandler.setDefault(first);
        try (Server server = new Server("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}",
                () -> CookieHandler.setDefault(replacement), 0)) {
            try (ReleaseCheck.Exchange answer = get(server)) { assertEquals("{}", body(answer)); }
            assertFalse(server.request.get(5, TimeUnit.SECONDS).toLowerCase().contains("cookie"));
            assertSame(replacement, CookieHandler.getDefault());
        }
    }

    @Test
    public void existingCookiesAndHandlerSurviveSuccessAndErrors() throws Exception {
        CookieManager manager = new CookieManager();
        HttpCookie github = new HttpCookie("_gh_sess", "private");
        github.setDomain("api.github.com");
        HttpCookie threads = new HttpCookie("ds_user_id", "private");
        threads.setDomain(".threads.com");
        HttpCookie local = new HttpCookie("local", "private");
        manager.getCookieStore().add(URI.create(ReleaseCheck.LATEST_RELEASE), github);
        manager.getCookieStore().add(URI.create("https://www.threads.com/"), threads);
        manager.getCookieStore().add(URI.create("https://localhost/"), local);
        List<HttpCookie> before = new ArrayList<>(manager.getCookieStore().getCookies());
        CookieHandler.setDefault(manager);
        for (String response : new String[]{
                "HTTP/1.1 200 OK\r\nSet-Cookie: new=private\r\nContent-Length: 2\r\n\r\n{}",
                "HTTP/1.1 500 Error\r\nSet-Cookie: new=private\r\nContent-Length: 0\r\n\r\n",
                "HTTP/1.1 200 OK\r\nSet-Cookie: new=private\r\nContent-Length: 4\r\n\r\n{}",
                "not HTTP\r\n\r\n"}) {
            try (Server server = new Server(response)) {
                try (ReleaseCheck.Exchange answer = get(server)) { body(answer); }
                catch (IOException expectedForMalformedOrTruncated) {
                    assertTrue(response.startsWith("not HTTP") || response.contains("Content-Length: 4"));
                }
                assertFalse(server.request.get(5, TimeUnit.SECONDS).toLowerCase().contains("cookie"));
            }
            assertSame(manager, CookieHandler.getDefault());
            assertEquals(before, manager.getCookieStore().getCookies());
        }
    }

    @Test
    public void chunkedAndCloseDelimitedBodiesAreDecodedWithoutCookies() throws Exception {
        CookieHandler.setDefault(throwingHandler());
        for (String response : new String[]{
                "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n1;part=first\r\n{\r\n1\r\n}\r\n"
                        + "0\r\nSet-Cookie: trailer=private\r\n\r\n",
                "HTTP/1.0 200 OK\r\n\r\n{}"}) {
            try (Server server = new Server(response); ReleaseCheck.Exchange answer = get(server)) {
                assertEquals(-1, answer.length());
                assertEquals("{}", body(answer));
                assertFalse(server.request.get(5, TimeUnit.SECONDS).toLowerCase().contains("cookie"));
            }
        }
    }

    @Test
    public void malformedAndAmbiguousResponsesFailClosed() throws Exception {
        for (String response : new String[]{
                "HTTP/1.1 200 OK\r\nContent-Length: 2\r\nTransfer-Encoding: chunked\r\n\r\n{}",
                "HTTP/1.1 200 OK\r\nContent-Length: 2\r\nContent-Length: 2\r\n\r\n{}",
                "HTTP/1.1 200 OK\r\nContent-Length: -1\r\n\r\n{}",
                "HTTP/1.1 200 OK\r\nContent-Encoding: gzip\r\n\r\n{}",
                "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\nx\r\n{}",
                "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n2\r\n{}x\n0\r\n\r\n",
                "HTTP/1.1 200 OK\r\nX-Large: " + new String(new char[8192]).replace('\0', 'a') + "\r\n\r\n{}",
                "HTTP/1.1 200 OK\r\n folded: invalid\r\n\r\n{}"}) {
            try (Server server = new Server(response)) {
                assertThrows(response, IOException.class, () -> {
                    try (ReleaseCheck.Exchange answer = get(server)) { body(answer); }
                });
            }
        }
    }

    @Test
    public void redirectsAreReturnedToTheExactHostPolicy() throws Exception {
        try (Server server = new Server("HTTP/1.1 302 Found\r\nLocation: https://other.example/\r\n"
                + "Content-Length: 0\r\n\r\n"); ReleaseCheck.Exchange answer = get(server)) {
            assertEquals(302, answer.status());
            assertEquals("https://other.example/", answer.header("Location"));
            assertTrue(ReleaseCheck.refusal(new URL(answer.header("Location"))) != null);
        }
    }

    @Test
    public void trustAndHostnameChecksApplyBeforeRequest() throws Exception {
        try (Server server = new Server("HTTP/1.1 200 OK\r\n\r\n{}")) {
            assertThrows(SSLHandshakeException.class, () -> new ReleaseTransport().get(server.url(), headers(), deadline()));
        }
        try (Server server = new Server("HTTP/1.1 200 OK\r\n\r\n{}")) {
            URL wrongName = new URL(server.url().toString().replace("localhost", "127.0.0.1"));
            assertThrows(SSLHandshakeException.class, () -> transport.get(wrongName, headers(), deadline()));
        }
    }

    @Test
    public void cookieHeadersAndRequestInjectionAreRefusedBeforeConnecting() throws Exception {
        for (String name : new String[]{"Cookie", "Cookie2", "Authorization", "Host", "Connection"}) {
            Map<String, String> unsafe = headers();
            unsafe.put(name, "private");
            assertThrows(ReleaseTransport.Refused.class,
                    () -> transport.get(new URL("https://localhost:1/"), unsafe, deadline()));
        }
        Map<String, String> unsafe = headers();
        unsafe.put("User-Agent", "version\r\nCookie: private");
        assertThrows(ReleaseTransport.Refused.class,
                () -> transport.get(new URL("https://localhost:1/"), unsafe, deadline()));
        assertThrows(ReleaseTransport.Refused.class,
                () -> transport.get(new URL("http://localhost:1/"), headers(), deadline()));
    }

    @Test
    public void bodyReadsHonorTheSharedDeadline() throws Exception {
        try (Server server = new Server("HTTP/1.1 200 OK\r\nContent-Length: 1\r\n\r\n", () -> { }, 2000)) {
            long started = System.nanoTime();
            assertThrows(java.net.SocketTimeoutException.class, () -> {
                try (ReleaseCheck.Exchange answer = transport.get(server.url(), headers(),
                        started + TimeUnit.MILLISECONDS.toNanos(1000))) { body(answer); }
            });
            assertTrue(TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started) < 1800);
        }
    }

    @Test
    public void trickledTlsRecordCannotExtendHandshakeOrSendALateGet() throws Exception {
        CountDownLatch firstRecord = new CountDownLatch(1);
        try (Server server = new Server("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}");
             ServerSocket listener = new ServerSocket(0, 1, InetAddress.getByName("127.0.0.1"))) {
            Thread relay = new Thread(() -> {
                Thread upload = null;
                try (Socket client = listener.accept();
                     Socket upstream = new Socket("127.0.0.1", server.listener.getLocalPort())) {
                    upstream.setSoTimeout(3000);
                    upload = new Thread(() -> {
                        try {
                            byte[] buffer = new byte[4096];
                            int count;
                            while ((count = client.getInputStream().read(buffer)) >= 0) {
                                upstream.getOutputStream().write(buffer, 0, count);
                            }
                        } catch (IOException expectedOnCancellation) { }
                    }, "release-relay-upload");
                    upload.setDaemon(true);
                    upload.start();
                    // SO_TIMEOUT alone restarts at each raw read inside a TLS provider's record loop.
                    for (int i = 0; i < 5; i++) {
                        int octet = upstream.getInputStream().read();
                        if (octet < 0) throw new IOException("missing TLS record");
                        client.getOutputStream().write(octet);
                        client.getOutputStream().flush();
                        firstRecord.countDown();
                        Thread.sleep(180);
                    }
                    byte[] buffer = new byte[4096];
                    int count;
                    while ((count = upstream.getInputStream().read(buffer)) >= 0) {
                        client.getOutputStream().write(buffer, 0, count);
                    }
                } catch (IOException | InterruptedException expectedOnCancellation) {
                    // Both sides close when the deadline ends the client's handshake.
                } finally {
                    if (upload != null) {
                        upload.interrupt();
                        try { upload.join(3000); } catch (InterruptedException ignored) { }
                    }
                }
            }, "release-relay-download");
            relay.setDaemon(true);
            relay.start();
            try {
                long started = System.nanoTime();
                URL address = new URL("https://localhost:" + listener.getLocalPort() + "/latest");
                assertThrows(SocketTimeoutException.class, () -> transport.get(address, headers(),
                        started + TimeUnit.MILLISECONDS.toNanos(500)));
                long elapsed = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started);
                assertTrue("deadline took " + elapsed + "ms", elapsed < 900);
                assertTrue("the fixture reached the TLS record", firstRecord.await(1, TimeUnit.SECONDS));
            } finally {
                listener.close();
                relay.interrupt();
                relay.join(5000);
                assertFalse("relay stopped", relay.isAlive());
            }
            assertThrows("no GET reached the TLS server after expiry", ExecutionException.class,
                    () -> server.request.get(3, TimeUnit.SECONDS));
        }
    }

    @Test
    public void heldDnsReturnsOnDeadlineWithBoundedLeftoverWork() throws Exception {
        CountDownLatch entered = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        AtomicInteger lookups = new AtomicInteger();
        ReleaseTransport held = new ReleaseTransport(context.getSocketFactory(), url -> {
            lookups.incrementAndGet();
            entered.countDown();
            while (release.getCount() != 0) {
                try { release.await(); } catch (InterruptedException ignoredLikeNativeDns) { }
            }
            return new InetSocketAddress("127.0.0.1", url.getPort());
        });
        try (Server server = new Server("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}")) {
            try {
                long started = System.nanoTime();
                assertThrows(SocketTimeoutException.class, () -> held.get(server.url(), headers(),
                        started + TimeUnit.MILLISECONDS.toNanos(300)));
                assertTrue("held lookup returned within budget", TimeUnit.NANOSECONDS.toMillis(
                        System.nanoTime() - started) < 800);
                assertEquals("lookup really entered", 0, entered.getCount());
                for (int i = 0; i < 5; i++) {
                    long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(40);
                    assertThrows(SocketTimeoutException.class, () -> held.get(server.url(), headers(), deadline));
                    assertTrue("expired requests don't accumulate", ReleaseTransport.CONNECTIONS.getQueue().isEmpty());
                }
                assertEquals("only one resolver can remain stuck", 1, lookups.get());
                assertEquals(1, ReleaseTransport.CONNECTIONS.getLargestPoolSize());
            } finally {
                release.countDown();
            }
            // The abandoned lookup cannot connect after it returns. Only this fresh request arrives.
            try (ReleaseCheck.Exchange answer = get(server)) { assertEquals("{}", body(answer)); }
            assertTrue(server.request.get(3, TimeUnit.SECONDS).startsWith("GET "));
        }
    }

    @Test
    public void failedDnsReleasesItsWorkerWithoutChangingCookies() throws Exception {
        CookieHandler handler = throwingHandler();
        CookieHandler.setDefault(handler);
        ReleaseTransport unresolved = new ReleaseTransport(context.getSocketFactory(), url ->
                InetSocketAddress.createUnresolved("release-test.invalid", url.getPort()));
        try (Server server = new Server("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}")) {
            assertThrows(UnknownHostException.class, () -> unresolved.get(server.url(), headers(), deadline()));
            assertSame(handler, CookieHandler.getDefault());
            try (ReleaseCheck.Exchange answer = get(server)) { assertEquals("{}", body(answer)); }
        }
    }

    @Test
    public void refusedOrExpiredRequestsDoNotStartDns() throws Exception {
        AtomicInteger lookups = new AtomicInteger();
        ReleaseTransport counted = new ReleaseTransport(context.getSocketFactory(), url -> {
            lookups.incrementAndGet();
            return new InetSocketAddress("127.0.0.1", url.getPort());
        });
        Map<String, String> unsafe = headers();
        unsafe.put("Cookie", "private");
        URL url = new URL("https://localhost:1/");
        assertThrows(ReleaseTransport.Refused.class, () -> counted.get(url, unsafe, deadline()));
        assertThrows(SocketTimeoutException.class, () -> counted.get(url, headers(), System.nanoTime() - 1));
        assertEquals(0, lookups.get());
    }

    private static CookieHandler throwingHandler() {
        return new CookieHandler() {
            @Override public Map<String, List<String>> get(URI uri, Map<String, List<String>> headers) {
                throw new AssertionError("must not read the shared handler");
            }
            @Override public void put(URI uri, Map<String, List<String>> headers) {
                throw new AssertionError("must not write the shared handler");
            }
        };
    }

    private static Map<String, String> headers() {
        Map<String, String> headers = new LinkedHashMap<>();
        headers.put("Accept", "application/vnd.github+json");
        headers.put("X-GitHub-Api-Version", "2022-11-28");
        headers.put("User-Agent", "HushThreads/0.0.12");
        return headers;
    }

    private static long deadline() { return System.nanoTime() + TimeUnit.SECONDS.toNanos(5); }
    private ReleaseCheck.Exchange get(Server server) throws Exception {
        return transport.get(server.url(), headers(), deadline());
    }
    private static String body(ReleaseCheck.Exchange answer) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int count;
        while ((count = answer.body().read(buffer)) != -1) bytes.write(buffer, 0, count);
        return bytes.toString(StandardCharsets.UTF_8.name());
    }

    private final class Server implements AutoCloseable {
        final SSLServerSocket listener;
        final CompletableFuture<String> request = new CompletableFuture<>();
        final Thread worker;

        Server(String response) throws Exception { this(response, () -> { }, 0); }
        Server(String response, Runnable onRequest, long holdMs) throws Exception {
            listener = (SSLServerSocket) context.getServerSocketFactory().createServerSocket(
                    0, 1, InetAddress.getByName("127.0.0.1"));
            worker = new Thread(() -> {
                try (SSLSocket socket = (SSLSocket) listener.accept()) {
                    socket.setSoTimeout(5000);
                    InputStream in = socket.getInputStream();
                    StringBuilder wire = new StringBuilder();
                    while (!wire.toString().endsWith("\r\n\r\n")) {
                        int c = in.read();
                        if (c < 0 || wire.length() > 4096) throw new IOException("invalid test request");
                        wire.append((char) c);
                    }
                    onRequest.run();
                    request.complete(wire.toString());
                    socket.getOutputStream().write(response.getBytes(StandardCharsets.UTF_8));
                    socket.getOutputStream().flush();
                    if (holdMs > 0) Thread.sleep(holdMs);
                } catch (Exception failure) {
                    request.completeExceptionally(failure);
                }
            }, "release-loopback");
            worker.setDaemon(true);
            worker.start();
        }

        URL url() throws Exception { return new URL("https://localhost:" + listener.getLocalPort() + "/latest?value=1"); }
        @Override public void close() throws Exception {
            listener.close();
            worker.interrupt();
            worker.join(5000);
            assertFalse("the fixture owns and closes its TLS worker", worker.isAlive());
        }
    }
}
