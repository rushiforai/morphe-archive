import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.lang.reflect.*;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import io.github.jordanwoodson.extension.shared.twitch.*;

/** 7TV badges: event parsing, the badge pipeline, and the WebSocket client against a local server. */
public class TwitchSevenTvBadgesProbe {
    static final String ROOT = "io.github.jordanwoodson.extension.shared.twitch.";
    static void check(boolean ok, String why) { if (!ok) throw new AssertionError(why); }

    static Class<?> cls() throws Exception { return Class.forName(ROOT + "TwitchSevenTvBadges"); }
    static Object call(String name, Class<?>[] types, Object... args) throws Exception {
        Method m = cls().getDeclaredMethod(name, types); m.setAccessible(true);
        try { return m.invoke(null, args); } catch (InvocationTargetException e) { throw (Exception) e.getCause(); }
    }
    static List<?> rn(String userId) throws Exception {
        Method m = TwitchBadges.class.getDeclaredMethod("cachedRn", String.class); m.setAccessible(true); return (List<?>) m.invoke(null, userId);
    }
    static String[] describeBadge(String url) throws Exception {
        Method m = TwitchBadges.class.getDeclaredMethod("describe", String.class); m.setAccessible(true); return (String[]) m.invoke(null, url);
    }
    static boolean handle(String json) throws Exception { return (Boolean) call("handle", new Class[]{String.class}, json); }
    static Map<?,?> map(String field) throws Exception { Field f = cls().getDeclaredField(field); f.setAccessible(true); return (Map<?,?>) f.get(null); }
    static void set(String field, Object value) throws Exception { Field f = cls().getDeclaredField(field); f.setAccessible(true); f.set(null, value); }
    interface Opener { Socket open(String host) throws IOException; }
    /** The package-private Transport interface, implemented through a proxy. */
    static void transport(Opener opener) throws Exception {
        Class<?> type = Class.forName(ROOT + "TwitchSevenTvBadges$Transport");
        set("transport", java.lang.reflect.Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type},
            (proxy, method, a) -> method.getName().equals("open") ? opener.open((String) a[0]) : null));
    }

    static String cosmetic(String type, String id, String tooltip, String files) {
        return "{\"op\":0,\"d\":{\"type\":\"" + type + "\",\"body\":{\"id\":\"" + id + "\",\"kind\":10,\"object\":{\"id\":\"" + id
            + "\",\"kind\":\"BADGE\",\"data\":{\"id\":\"" + id + "\",\"name\":\"n\",\"tooltip\":\"" + tooltip
            + "\",\"host\":{\"url\":\"//cdn.7tv.app/badge/" + id + "\",\"files\":[" + files + "]}}}}}}";
    }
    static String file(String name, int width, int frames) {
        return "{\"name\":\"" + name + "\",\"static_name\":\"" + name.replace(".webp", "_static.webp") + "\",\"width\":" + width
            + ",\"height\":" + width + ",\"frame_count\":" + frames + ",\"format\":\"WEBP\"}";
    }
    static String entitlement(String type, String badge, String twitchId) {
        return "{\"op\":0,\"d\":{\"type\":\"" + type + "\",\"body\":{\"id\":\"0\",\"kind\":10,\"object\":{\"id\":\"0\",\"kind\":\"BADGE\",\"ref_id\":\""
            + badge + "\",\"user\":{\"id\":\"u\",\"username\":\"x\",\"connections\":[{\"id\":\"7426574\",\"platform\":\"KICK\"},{\"id\":\""
            + twitchId + "\",\"platform\":\"TWITCH\",\"username\":\"x\"}]}}}}}";
    }

    /** A badge model double: Twitch's (name, url) constructor. */
    public static final class Model { public final String name, url; Model(String n, String u) { name = n; url = u; } }

    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "events": {
                Settings.values.put("badges_7tv", "true");
                String files = file("1x.webp", 18, 1) + "," + file("2x.webp", 36, 1) + "," + file("3x.webp", 54, 4) + "," + file("4x.webp", 72, 1);
                check(handle(cosmetic("cosmetic.create", "01BADGE", "Sub tier 3", files)), "cosmetic handled");
                check(handle("not json") && handle("{\"op\":2}") && handle("{\"op\":1,\"d\":{}}"), "noise ignored");
                check(!handle("{\"op\":4}") && !handle("{\"op\":7}"), "reconnect requests end the session");
                check(handle(entitlement("entitlement.create", "01BADGE", "123456789")), "entitlement handled");
                check(handle(entitlement("entitlement.create", "01UNKNOWN", "555")), "unknown badge kept until its cosmetic arrives");
                // Non-badge cosmetics and entitlements (paints, emote sets) and odd shapes are ignored.
                check(handle("{\"op\":0,\"d\":{\"type\":\"entitlement.create\",\"body\":{\"object\":{\"kind\":\"EMOTE_SET\",\"ref_id\":\"x\",\"user\":{\"connections\":[{\"id\":\"9\",\"platform\":\"TWITCH\"}]}}}}}"), "emote set ignored");
                check(handle("{\"op\":0,\"d\":{\"type\":\"cosmetic.create\",\"body\":{\"object\":{\"kind\":\"PAINT\",\"data\":{\"id\":\"p\"}}}}}"), "paint ignored");
                check(handle(cosmetic("cosmetic.create", "01EVIL", "evil", "{\"name\":\"../x.webp\",\"width\":18}")) &&
                    handle("{\"op\":0,\"d\":{\"type\":\"cosmetic.create\",\"body\":{\"object\":{\"kind\":\"BADGE\",\"data\":{\"id\":\"01OFF\",\"host\":{\"url\":\"//evil.example/b\",\"files\":[" + file("1x.webp", 18, 1) + "]}}}}}}"),
                    "bad hosts and names handled");
                check(!map("BADGES").containsKey("01EVIL") && !map("BADGES").containsKey("01OFF"), "only cdn.7tv.app files with plain names are kept");
                check(map("USERS").get(9L) == null, "emote set entitlement adds no badge");
                List<?> badges = rn("123456789");
                check(badges != null && badges.size() == 1, "RN snapshot has the 7TV badge: " + badges);
                String[] rn = (String[]) badges.get(0);
                check(rn[0].equals("Sub tier 3") && rn[1].equals("https://cdn.7tv.app/badge/01BADGE/3x_static.webp"), "largest file up to 3x, its still copy when animated: " + rn[1]);
                check(rn("555").isEmpty(), "no badge without its cosmetic");
                String[] described = describeBadge(rn[1]);
                check(described != null && described[0].equals("7TV badge") && described[1].equals("Sub tier 3"), "describe: " + Arrays.toString(described));
                // Native chat line: appended after Twitch's own badges, through the model constructor.
                Object user = new Object() { final Object tuid = null; };
                List stock = new ArrayList(List.of("twitch-badge"));
                Field u = cls().getDeclaredField("USERS"); u.setAccessible(true);
                List out = (List) call("add", new Class[]{List.class, List.class, long.class, Class.class}, null, stock, 123456789L, Model.class);
                check(out != null && out.size() == 2 && ((Model) out.get(1)).url.equals(rn[1]) && ((Model) out.get(1)).name.equals("7tv-01badge"), "native badge model");
                check(call("add", new Class[]{List.class, List.class, long.class, Class.class}, null, stock, 42L, Model.class) == null, "no badge, list untouched");
                // A changed badge replaces; delete removes; the switch off hides everything without clearing.
                check(handle(entitlement("entitlement.create", "01OTHER", "123456789")) && handle(cosmetic("cosmetic.create", "01OTHER", "Other", file("2x.webp", 36, 1))), "replace");
                check(((String[]) rn("123456789").get(0))[0].equals("Other"), "replaced badge");
                check(handle(entitlement("entitlement.delete", "01OTHER", "123456789")), "delete handled");
                check(rn("123456789").isEmpty(), "deleted");
                check(handle(entitlement("entitlement.create", "01BADGE", "123456789")), "re-add");
                Settings.values.put("badges_7tv", "false");
                check(rn("123456789").isEmpty(), "off: nothing shown");
                check(!map("USERS").isEmpty(), "off: nothing forgotten");
                // Bounded: the oldest holders go first.
                Settings.values.put("badges_7tv", "true");
                for (int i = 0; i < 20_010; i++) handle(entitlement("entitlement.create", "01BADGE", String.valueOf(1_000_000 + i)));
                check(map("USERS").size() == 20_000, "bounded holders: " + map("USERS").size());
                check(map("USERS").get(1_000_000L) == null && map("USERS").get(1_020_009L) != null, "oldest dropped");
                break;
            }
            case "socket": {
                // A tiny RFC 6455 server on localhost: handshake, three message sizes, a ping, a fragmented
                // message, then the client's subscriptions are checked and the socket is closed by the server.
                ServerSocket server = new ServerSocket(0, 1, InetAddress.getLoopbackAddress());
                BlockingQueue<String> received = new LinkedBlockingQueue<>();
                CountDownLatch closedByClient = new CountDownLatch(1);
                AtomicReference<Throwable> serverFailure = new AtomicReference<>();
                Thread serverThread = new Thread(() -> {
                    try (Socket s = server.accept()) {
                        InputStream in = new BufferedInputStream(s.getInputStream()); OutputStream out = s.getOutputStream();
                        String headers = readHeaders(in);
                        check(headers.startsWith("GET /v3 HTTP/1.1") && headers.contains("User-Agent: Lurk (") && !headers.toLowerCase().contains("cookie"), "client handshake: " + headers);
                        String key = headers.replaceAll("(?s).*Sec-WebSocket-Key: ([^\\r]+).*", "$1");
                        String accept = Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-1").digest((key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").getBytes(StandardCharsets.US_ASCII)));
                        out.write(("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: " + accept + "\r\n\r\n").getBytes(StandardCharsets.US_ASCII));
                        out.flush();
                        // The client subscribes twice before reading.
                        received.add(readMasked(in)); received.add(readMasked(in));
                        sendText(out, "{\"op\":1,\"d\":{\"heartbeat_interval\":30000}}", 0x81);
                        sendText(out, cosmetic("cosmetic.create", "01SOCK", "Socket badge", file("2x.webp", 36, 1)), 0x81);
                        String big = entitlement("entitlement.create", "01SOCK", "777").replace("\"username\":\"x\"", "\"username\":\"" + "y".repeat(70_000) + "\"");
                        sendText(out, big, 0x81);
                        // Ping: the client must answer with a pong carrying the payload.
                        out.write(new byte[]{(byte) 0x89, 3, 'h', 'i', '!'}); out.flush();
                        byte[] pong = readFrame(in);
                        check(pong[0] == (byte) 0x8a && new String(pong, 2 + 4, 3, StandardCharsets.US_ASCII).equals("hi!") || unmask(pong).equals("hi!"), "pong echoes the ping payload");
                        // Fragmented text: two frames.
                        String frag = entitlement("entitlement.create", "01SOCK", "778");
                        sendText(out, frag.substring(0, 20), 0x01); sendText(out, frag.substring(20), 0x80);
                        // A reconnect to another channel: expect two unsubscribes and two subscribes.
                        received.add("MARK");
                        for (int i = 0; i < 4; i++) received.add(readMasked(in));
                        // Server close.
                        out.write(new byte[]{(byte) 0x88, 0}); out.flush();
                        byte[] close = readFrame(in);
                        check((close[0] & 0x0f) == 8, "client answers close");
                        closedByClient.countDown();
                    } catch (Throwable t) { serverFailure.set(t); closedByClient.countDown(); }
                }, "fake-7tv");
                serverThread.setDaemon(true); serverThread.start();
                int port = server.getLocalPort();
                transport(host -> { check(host.equals("events.7tv.io"), "host"); return new Socket(InetAddress.getLoopbackAddress(), port); });
                Settings.values.put("badges_7tv", "true");
                call("onChannel", new Class[]{String.class}, "71092938");
                call("ensure", new Class[]{});
                String sub1 = received.poll(5, TimeUnit.SECONDS), sub2 = received.poll(5, TimeUnit.SECONDS);
                check(sub1 != null && sub1.contains("\"op\":35") && sub1.contains("\"type\":\"entitlement.*\"") && sub1.contains("\"id\":\"71092938\"") && sub1.contains("\"ctx\":\"channel\"") && sub1.contains("\"platform\":\"TWITCH\""), "entitlement subscription: " + sub1);
                check(sub2 != null && sub2.contains("\"type\":\"cosmetic.*\""), "cosmetic subscription: " + sub2);
                long t0 = System.nanoTime();
                while (map("USERS").get(778L) == null && System.nanoTime() - t0 < 5_000_000_000L) Thread.sleep(20);
                check("01SOCK".equals(map("USERS").get(777L)), "large frame (70 KB, 8-byte length) parsed");
                check("01SOCK".equals(map("USERS").get(778L)), "fragmented message parsed");
                check(map("BADGES").containsKey("01SOCK"), "medium frame (2-byte length) parsed");
                call("onChannel", new Class[]{String.class}, "12345");
                String mark = received.poll(5, TimeUnit.SECONDS); check("MARK".equals(mark), "mark: " + mark);
                List<String> resub = new ArrayList<>(); for (int i = 0; i < 4; i++) resub.add(received.poll(5, TimeUnit.SECONDS));
                check(resub.stream().filter(m -> m != null && m.contains("\"op\":36") && m.contains("71092938")).count() == 2, "two unsubscribes: " + resub);
                check(resub.stream().filter(m -> m != null && m.contains("\"op\":35") && m.contains("12345")).count() == 2, "two subscribes: " + resub);
                check(closedByClient.await(5, TimeUnit.SECONDS), "server saw the close");
                if (serverFailure.get() != null) throw new AssertionError("server side", serverFailure.get());
                Thread.sleep(100);
                Field cur = cls().getDeclaredField("current"); cur.setAccessible(true);
                Object connection = cur.get(null);
                Method alive = connection == null ? null : connection.getClass().getDeclaredMethod("alive");
                if (alive != null) alive.setAccessible(true);
                check(alive == null || !(Boolean) alive.invoke(connection), "connection ended");
                server.close();
                break;
            }
            case "off": {
                AtomicInteger attempts = new AtomicInteger();
                transport(host -> { attempts.incrementAndGet(); throw new IOException("no"); });
                Settings.values.put("badges_7tv", "false");
                call("onChannel", new Class[]{String.class}, "1");
                call("ensure", new Class[]{});
                call("requestRn", new Class[]{String.class, java.util.function.BooleanSupplier.class}, "1", (java.util.function.BooleanSupplier) () -> true);
                Settings.values.remove("badges_7tv");
                List out = TwitchBadges.badges(new ArrayList(List.of("x")), new Object(), Model.class);
                Thread.sleep(200);
                check(attempts.get() == 0, "no connection while off or unregistered");
                check(out.size() == 1, "stock badges untouched");
                // Registered and on, but no channel yet: still nothing to connect to.
                Settings.values.put("badges_7tv", "true");
                set("channel", null);
                call("ensure", new Class[]{});
                Thread.sleep(200);
                check(attempts.get() == 0, "no channel, no connection");
                // With a channel, a failing transport is retried only after the retry delay.
                call("onChannel", new Class[]{String.class}, "1");
                call("ensure", new Class[]{});
                Thread.sleep(300);
                call("ensure", new Class[]{});
                Thread.sleep(300);
                check(attempts.get() == 1, "one attempt, then a retry delay: " + attempts.get());
                break;
            }
            default: throw new AssertionError(args[0]);
        }
        System.out.println("PASS " + args[0]);
    }

    static String readHeaders(InputStream in) throws IOException {
        ByteArrayOutputStream b = new ByteArrayOutputStream(); int m = 0;
        while (m < 4) { int c = in.read(); if (c < 0) throw new EOFException(); b.write(c); m = c == "\r\n\r\n".charAt(m) ? m + 1 : c == '\r' ? 1 : 0; }
        return b.toString("ISO-8859-1");
    }
    static byte[] readFrame(InputStream in) throws IOException {
        int first = in.read(), second = in.read(); long len = second & 0x7f; int extra = len == 126 ? 2 : len == 127 ? 8 : 0;
        byte[] ext = in.readNBytes(extra);
        if (extra == 2) len = ((ext[0] & 0xff) << 8) | (ext[1] & 0xff); else if (extra == 8) { len = 0; for (byte x : ext) len = (len << 8) | (x & 0xff); }
        byte[] mask = (second & 0x80) != 0 ? in.readNBytes(4) : new byte[0];
        byte[] payload = in.readNBytes((int) len);
        ByteArrayOutputStream b = new ByteArrayOutputStream(); b.write(first); b.write(second); b.write(ext); b.write(mask); b.write(payload);
        return b.toByteArray();
    }
    static String unmask(byte[] frame) {
        int second = frame[1] & 0xff; long len = second & 0x7f; int extra = len == 126 ? 2 : len == 127 ? 8 : 0; int at = 2 + extra;
        byte[] mask = Arrays.copyOfRange(frame, at, at + 4); byte[] p = Arrays.copyOfRange(frame, at + 4, frame.length);
        for (int i = 0; i < p.length; i++) p[i] ^= mask[i & 3];
        return new String(p, StandardCharsets.UTF_8);
    }
    static String readMasked(InputStream in) throws IOException {
        byte[] f = readFrame(in); check((f[1] & 0x80) != 0 && (f[0] & 0x0f) == 1, "client frames are masked text"); return unmask(f);
    }
    static void sendText(OutputStream out, String text, int first) throws IOException {
        byte[] p = text.getBytes(StandardCharsets.UTF_8); out.write(first);
        if (p.length < 126) out.write(p.length); else if (p.length < 65536) { out.write(126); out.write(p.length >>> 8); out.write(p.length); }
        else { out.write(127); for (int s = 56; s >= 0; s -= 8) out.write((int) ((long) p.length >>> s)); }
        out.write(p); out.flush();
    }
}
