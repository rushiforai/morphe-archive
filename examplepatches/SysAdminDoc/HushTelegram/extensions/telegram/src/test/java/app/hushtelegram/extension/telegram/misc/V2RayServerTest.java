/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.Fake;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.Heard;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.BooleanSupplier;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;

/** The SOCKS5 side Telegram talks to, carried through a fake VLESS server on 127.0.0.1. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class V2RayServerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ID = "b831381d-6324-4d53-ad4f-8cda48b30811";
    private static final String USER = "hush";
    private static final String PASS = "local-only-word";
    private static final byte[] DC = {(byte) 149, (byte) 154, (byte) 167, 51};
    private static final byte[] DC_V6 = {0x20, 0x01, 0x06, 0x7c, 0x04, (byte) 0xe8, (byte) 0xf0, 0x04,
            0, 0, 0, 0, 0, 0, 0, 0x0a};

    private final List<Closeable> open = new ArrayList<>();
    private final List<V2RayLinks.Server> servers = new CopyOnWriteArrayList<>();
    private V2RayServer server;
    private Fake fake;

    @Before
    public void startTheProxy() throws Exception {
        fake = new Fake(V2RayLinks.VLESS, ID, "", false, false);
        open.add(fake);
        servers.add(vless(fake.port()));
        server = new V2RayServer(() -> new ArrayList<>(servers));
        server.start(0, USER, PASS);
    }

    @After
    public void stopTheProxy() {
        server.stop();
        BaseSettings.DEBUG.resetToDefault();
        for (Closeable closeable : open) {
            try {
                closeable.close();
            } catch (IOException ignored) {
                // Already gone.
            }
        }
    }

    @Test
    public void itListensOnAPortOfItsOwn() {
        assertTrue(server.running());
        assertTrue(server.port() > 0);
        assertEquals(0, new V2RayServer(Collections::emptyList).port());
    }

    @Test
    public void connectCarriesEachAddressTypeThroughTheServer() throws Exception {
        byte[] name = "venus.web.telegram.org".getBytes(StandardCharsets.US_ASCII);
        Object[][] cases = {{V2RayTunnels.Target.IPV4, DC}, {V2RayTunnels.Target.IPV6, DC_V6}, {V2RayTunnels.Target.DOMAIN, name}};
        int seed = 0;
        for (Object[] each : cases) {
            int type = (Integer) each[0];
            byte[] address = (byte[]) each[1];
            Socket socket = signedIn(USER, PASS);
            assertArrayEquals(V2RayServer.reply(0), connect(socket, 1, type, address, 443));
            byte[] data = payload(20_000, ++seed);
            socket.getOutputStream().write(data);
            assertArrayEquals(data, readN(socket.getInputStream(), data.length));
            socket.close();
            Heard heard = fake.next();
            assertNull(String.valueOf(heard.failure), heard.failure);
            assertEquals(type, heard.type);
            assertArrayEquals(address, heard.address);
            assertEquals(443, heard.port);
            assertArrayEquals(data, heard.data());
        }
        waitFor("every connection closed", () -> server.connections() == 0);
    }

    @Test
    public void whatTelegramSendsAtOnceGoesWithTheRequest() throws Exception {
        Socket socket = signedIn(USER, PASS);
        // The request and the first bytes in one write, as a client that doesn't wait might send them.
        ByteArrayOutputStream both = new ByteArrayOutputStream();
        both.write(request(1, V2RayTunnels.Target.IPV4, DC, 80));
        both.write("first".getBytes(StandardCharsets.US_ASCII));
        socket.getOutputStream().write(both.toByteArray());
        assertArrayEquals(V2RayServer.reply(0), readN(socket.getInputStream(), 10));
        assertEquals("first", new String(readN(socket.getInputStream(), 5), StandardCharsets.US_ASCII));
        socket.close();
        assertArrayEquals("first".getBytes(StandardCharsets.US_ASCII), fake.next().data());
    }

    @Test
    public void aWrongPasswordIsTurnedAway() throws Exception {
        for (String[] wrong : new String[][]{{USER, "guess"}, {"someone", PASS}, {"", ""}}) {
            Socket socket = socket();
            InputStream in = socket.getInputStream();
            socket.getOutputStream().write(new byte[]{5, 1, 2});
            assertArrayEquals(new byte[]{5, 2}, readN(in, 2));
            socket.getOutputStream().write(login(wrong[0], wrong[1]));
            assertArrayEquals(new byte[]{1, 1}, readN(in, 2));
            assertEnds(in);
        }
        assertEquals("nothing reached the server", 0, fake.endedCount());
    }

    @Test
    public void aClientWithoutAPasswordIsTurnedAway() throws Exception {
        Socket socket = socket();
        socket.getOutputStream().write(new byte[]{5, 1, 0});
        assertArrayEquals(new byte[]{5, (byte) 0xff}, readN(socket.getInputStream(), 2));
        assertEnds(socket.getInputStream());
        Socket socks4 = socket();
        socks4.getOutputStream().write(new byte[]{4, 1, 0, 80, 1, 2, 3, 4, 0});
        assertEnds(socks4.getInputStream());
    }

    @Test
    public void onlyConnectIsCarried() throws Exception {
        for (int command : new int[]{2, 3}) {
            Socket socket = signedIn(USER, PASS);
            assertArrayEquals("command " + command, V2RayServer.reply(0x07), connect(socket, command, V2RayTunnels.Target.IPV4, DC, 443));
            assertEnds(socket.getInputStream());
        }
        assertEquals(0, fake.endedCount());
    }

    @Test
    public void anAddressTypeSocksDoesntHaveIsRefused() throws Exception {
        Socket socket = signedIn(USER, PASS);
        // The head alone: the proxy answers before reading an address it can't size, and a close with
        // bytes left unread would reset the connection under its answer.
        socket.getOutputStream().write(new byte[]{5, 1, 0, 2});
        assertArrayEquals(V2RayServer.reply(0x08), readN(socket.getInputStream(), 10));
        assertEnds(socket.getInputStream());
    }

    @Test
    public void noServersIsNotAllowed() throws Exception {
        servers.clear();
        Socket socket = signedIn(USER, PASS);
        assertArrayEquals(V2RayServer.reply(0x02), connect(socket, 1, V2RayTunnels.Target.IPV4, DC, 443));
        assertEnds(socket.getInputStream());
    }

    @Test
    public void everyServerDownIsUnreachableAndTheLogNamesNoServer() throws Exception {
        int closed = closedPort();
        servers.clear();
        servers.add(vless(closed));
        // Diagnostic logging on, as for someone sending a report: even then no server is named.
        BaseSettings.DEBUG.save(true);
        ShadowLog.clear();
        Socket socket = signedIn(USER, PASS);
        assertArrayEquals(V2RayServer.reply(0x04), connect(socket, 1, V2RayTunnels.Target.IPV4, DC, 443));
        assertEnds(socket.getInputStream());
        boolean said = false;
        for (ShadowLog.LogItem item : ShadowLog.getLogs()) {
            String text = item.msg + " " + (item.throwable == null ? "" : item.throwable.getMessage());
            said |= text.contains("no server answered of 1");
            assertFalse(text, text.contains(String.valueOf(closed)));
            assertFalse(text, text.contains(ID));
            assertFalse(text, text.contains("127.0.0.1"));
            assertFalse(text, text.contains(PASS));
        }
        assertTrue("the failure is counted in the log", said);
    }

    @Test
    public void aServerThatDoesntAnswerMakesWayForTheNext() throws Exception {
        servers.add(0, vless(closedPort()));
        Socket socket = signedIn(USER, PASS);
        assertArrayEquals(V2RayServer.reply(0), connect(socket, 1, V2RayTunnels.Target.IPV4, DC, 443));
        socket.getOutputStream().write(new byte[]{9});
        assertEquals(9, socket.getInputStream().read());
        socket.close();
        assertNull(fake.next().failure);
    }

    @Test
    public void onlyThreeServersAreTried() throws Exception {
        // A server that speaks plain TCP to a link that wants TLS fails at once.
        V2RayLinks.Server noTls = V2RayLinks.parseLink("vless://" + ID + "@127.0.0.1:" + fake.port() + "?security=tls&sni=hush.test");
        Fake working = new Fake(V2RayLinks.VLESS, ID, "", false, false);
        open.add(working);
        servers.clear();
        servers.addAll(Arrays.asList(noTls, noTls, noTls, vless(working.port())));
        Socket socket = signedIn(USER, PASS);
        assertArrayEquals(V2RayServer.reply(0x04), connect(socket, 1, V2RayTunnels.Target.IPV4, DC, 443));
        for (int i = 0; i < 3; i++) fake.next();
        assertEquals(0, fake.endedCount());
        Thread.sleep(200);
        assertEquals("the fourth was never tried", 0, working.endedCount());
    }

    @Test
    public void theSixtyFifthConnectionIsClosedUntilOneEnds() throws Exception {
        List<Socket> held = new ArrayList<>();
        for (int i = 0; i < V2RayServer.MAX_CONNECTIONS; i++) held.add(socket());
        waitFor("64 connections open", () -> server.connections() == V2RayServer.MAX_CONNECTIONS);
        Socket extra = socket();
        assertEnds(extra.getInputStream());
        assertEquals(V2RayServer.MAX_CONNECTIONS, server.connections());

        held.get(0).close();
        waitFor("one connection ended", () -> server.connections() == V2RayServer.MAX_CONNECTIONS - 1);
        Socket socket = signedIn(USER, PASS);
        assertArrayEquals(V2RayServer.reply(0), connect(socket, 1, V2RayTunnels.Target.IPV4, DC, 443));
    }

    @Test
    public void stopClosesEveryConnectionAndStaysStopped() throws Exception {
        Socket through = signedIn(USER, PASS);
        assertArrayEquals(V2RayServer.reply(0), connect(through, 1, V2RayTunnels.Target.IPV4, DC, 443));
        Socket waiting = socket();
        waitFor("both connections open", () -> server.connections() == 2);
        int port = server.port();
        server.stop();
        assertFalse(server.running());
        assertEnds(through.getInputStream());
        assertEnds(waiting.getInputStream());
        waitFor("no connections", () -> server.connections() == 0);
        assertTrue("the server's side of the tunnel closed too", fake.next() != null);
        try {
            new Socket().connect(new InetSocketAddress("127.0.0.1", port), 2000);
            fail("still listening");
        } catch (IOException expected) {
            // Nothing listens there now.
        }
        try {
            server.start(0, USER, PASS);
            fail("started again");
        } catch (IOException expected) {
            // A stopped server stays stopped.
        }
    }

    @Test
    public void aTakenPortIsReported() throws Exception {
        V2RayServer second = new V2RayServer(Collections::emptyList);
        try {
            second.start(server.port(), USER, PASS);
            fail("two servers on one port");
        } catch (IOException expected) {
            assertFalse(second.running());
        } finally {
            second.stop();
        }
    }

    // ---- Helpers ------------------------------------------------------------------------------------

    private static V2RayLinks.Server vless(int port) throws V2RayLinks.Skipped {
        return V2RayLinks.parseLink("vless://" + ID + "@127.0.0.1:" + port + "?type=tcp&security=none");
    }

    private static int closedPort() throws IOException {
        try (ServerSocket socket = new ServerSocket(0)) {
            return socket.getLocalPort();
        }
    }

    private Socket socket() throws IOException {
        Socket socket = new Socket();
        open.add(socket);
        socket.connect(new InetSocketAddress("127.0.0.1", server.port()), 5000);
        socket.setSoTimeout(20_000);
        return socket;
    }

    private Socket signedIn(String user, String pass) throws IOException {
        Socket socket = socket();
        socket.getOutputStream().write(new byte[]{5, 2, 0, 2});
        assertArrayEquals(new byte[]{5, 2}, readN(socket.getInputStream(), 2));
        socket.getOutputStream().write(login(user, pass));
        assertArrayEquals(new byte[]{1, 0}, readN(socket.getInputStream(), 2));
        return socket;
    }

    private static byte[] login(String user, String pass) {
        byte[] name = user.getBytes(StandardCharsets.UTF_8);
        byte[] word = pass.getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(1);
        out.write(name.length);
        out.write(name, 0, name.length);
        out.write(word.length);
        out.write(word, 0, word.length);
        return out.toByteArray();
    }

    private static byte[] request(int command, int type, byte[] address, int port) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(5);
        out.write(command);
        out.write(0);
        out.write(type);
        if (type == V2RayTunnels.Target.DOMAIN) out.write(address.length);
        out.write(address, 0, address.length);
        out.write(port >> 8);
        out.write(port);
        return out.toByteArray();
    }

    private static byte[] connect(Socket socket, int command, int type, byte[] address, int port) throws IOException {
        socket.getOutputStream().write(request(command, type, address, port));
        return readN(socket.getInputStream(), 10);
    }

    private static byte[] readN(InputStream in, int length) throws IOException {
        byte[] bytes = new byte[length];
        V2RayTunnels.readFully(in, bytes, false);
        return bytes;
    }

    /** The proxy closed this connection: it ends, or breaks on a reset. */
    private static void assertEnds(InputStream in) {
        try {
            assertEquals(-1, in.read());
        } catch (IOException fine) {
            // A reset is a close too.
        }
    }

    private static void waitFor(String what, BooleanSupplier done) throws InterruptedException {
        long deadline = System.nanoTime() + 15_000_000_000L;
        while (!done.getAsBoolean()) {
            if (System.nanoTime() > deadline) throw new AssertionError("timed out waiting: " + what);
            Thread.sleep(20);
        }
    }

    private static byte[] payload(int length, int seed) {
        byte[] bytes = new byte[length];
        new Random(seed).nextBytes(bytes);
        return bytes;
    }
}
