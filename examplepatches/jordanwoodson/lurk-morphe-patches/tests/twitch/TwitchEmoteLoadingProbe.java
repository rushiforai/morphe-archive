import io.github.jordanwoodson.extension.shared.settings.Settings;
import io.github.jordanwoodson.extension.shared.twitch.TwitchEmotes;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.util.function.BooleanSupplier;

/**
 * How emote lists load when a service fails (issues 97 and 100), with the production loader, controlled HTTPS
 * answers per URL and a clock the probe moves. No traffic to the services.
 */
public final class TwitchEmoteLoadingProbe {
    static final String ROOT = "io.github.jordanwoodson.extension.shared.twitch.";
    static final String FFZ_ROOM = "https://api.frankerfacez.com/v1/room/id/";
    static final String FFZ_GLOBAL = "https://api.frankerfacez.com/v1/set/global";
    static final String COPY_USER = "https://api.betterttv.net/3/cached/frankerfacez/users/twitch/";
    static final String COPY_GLOBAL = "https://api.betterttv.net/3/cached/frankerfacez/emotes/global";
    // BetterTTV's copy as it answered on 2026-11-20 (one static, one animated, one modifier).
    static final String COPY_BODY = "[{\"id\":246878,\"user\":{\"id\":54361,\"name\":\"fabulouspotato69\",\"displayName\":\"FabulousPotato69\"},"
        + "\"code\":\"WideHard\",\"images\":{\"1x\":\"https://cdn.betterttv.net/frankerfacez_emote/246878/1\",\"2x\":\"https://cdn.betterttv.net/frankerfacez_emote/246878/2\","
        + "\"4x\":\"https://cdn.betterttv.net/frankerfacez_emote/246878/4\"},\"imageType\":\"png\",\"animated\":false,\"modifier\":false},"
        + "{\"id\":739826,\"user\":{\"id\":6049,\"name\":\"serapollyon\",\"displayName\":\"SerApollyon\"},\"code\":\"fallDamage\",\"images\":{"
        + "\"1x\":\"https://cdn.betterttv.net/frankerfacez_emote/739826/animated/1\",\"1x_static\":\"https://cdn.betterttv.net/frankerfacez_emote/739826/1\"},"
        + "\"imageType\":\"gif\",\"animated\":true,\"modifier\":false},"
        + "{\"id\":720507,\"user\":{\"id\":1,\"name\":\"x\",\"displayName\":\"X\"},\"code\":\"ffzW\",\"images\":{},\"imageType\":\"png\",\"animated\":false,\"modifier\":true}]";
    static final String COPY_GLOBAL_BODY = "[{\"id\":9,\"user\":{\"id\":2,\"name\":\"dansalvato\",\"displayName\":\"dansalvato\"},\"code\":\"ZrehplaR\","
        + "\"images\":{},\"imageType\":\"png\",\"animated\":false,\"modifier\":false}]";
    static final String FFZ_BODY = "{\"room\":{\"twitch_id\":789},\"sets\":{\"1\":{\"emoticons\":[{\"id\":246878,\"name\":\"WideHard\",\"width\":50,\"height\":20,"
        + "\"animated\":null,\"modifier\":false,\"owner\":{\"display_name\":\"FabulousPotato69\"}}]}}}";
    static final String SEVENTV_USER = "{\"emote_set\":{\"emotes\":[{\"id\":\"abc123\",\"name\":\"Channel7\",\"data\":{\"animated\":false}}]}}";
    static final String SEVENTV_GLOBAL = "{\"emotes\":[{\"id\":\"glob7\",\"name\":\"Global7\",\"data\":{\"animated\":false}}]}";
    static final String BTTV_USER = "{\"channelEmotes\":[{\"id\":\"bttv1\",\"code\":\"ChannelB\"}],\"sharedEmotes\":[]}";
    static final String BTTV_GLOBAL = "[{\"id\":\"bttvg\",\"code\":\"GlobalB\"}]";

    /** An answer: an HTTP status and body, or an exception, or blocking until released (a hanging service). */
    interface Answer { Object answer(String url) throws IOException; }
    static final Map<String, Answer> ANSWERS = new ConcurrentHashMap<>();
    static final Map<String, AtomicInteger> CALLS = new ConcurrentHashMap<>();

    static int calls(String url) { AtomicInteger n = CALLS.get(url); return n == null ? 0 : n.get(); }
    static void answer(String url, int status, String body) { ANSWERS.put(url, u -> new Object[]{status, body}); }

    static void install() {
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
            protected URLConnection openConnection(URL url) {
                String key = url.toString();
                CALLS.computeIfAbsent(key, k -> new AtomicInteger()).incrementAndGet();
                return new HttpURLConnection(url) {
                    Object[] result;
                    public void connect() {} public void disconnect() {} public boolean usingProxy() { return false; }
                    Object[] result() throws IOException {
                        if (result == null) {
                            Answer answer = ANSWERS.get(key);
                            if (answer == null) throw new AssertionError("unexpected request " + key);
                            result = (Object[]) answer.answer(key);
                        }
                        return result;
                    }
                    public int getResponseCode() throws IOException { return (Integer) result()[0]; }
                    public InputStream getInputStream() throws IOException {
                        return new ByteArrayInputStream(((String) result()[1]).getBytes(StandardCharsets.UTF_8));
                    }
                };
            }
        } : null);
    }

    static Object field(String type, String name) throws Exception {
        Field f = Class.forName(ROOT + type).getDeclaredField(name); f.setAccessible(true); return f.get(null);
    }
    static void setField(String type, String name, Object value) throws Exception {
        Field f = Class.forName(ROOT + type).getDeclaredField(name); f.setAccessible(true); f.set(null, value);
    }
    static Object call(String name, Class<?>[] types, Object... args) throws Exception {
        Method m = TwitchEmotes.class.getDeclaredMethod(name, types); m.setAccessible(true);
        try { return m.invoke(null, args); } catch (InvocationTargetException e) { throw (Exception) e.getCause(); }
    }
    static void check(boolean value, String why) { if (!value) throw new AssertionError(why); }
    @SuppressWarnings("unchecked") static Map<String, Object> sets() throws Exception { return (Map<String, Object>) field("TwitchEmotes", "SETS"); }
    static Object entry(String key) throws Exception { return sets().get(key); }
    static Object entryField(Object entry, String name) throws Exception {
        Field f = entry.getClass().getDeclaredField(name); f.setAccessible(true); return f.get(entry);
    }
    static List<String> ids(String key) throws Exception {
        Object entry = entry(key);
        List<String> out = new ArrayList<>();
        if (entry == null) return out;
        Object emotes = entryField(entry, "emotes");
        for (int i = 0; i < Array.getLength(emotes); i++) {
            Object emote = Array.get(emotes, i);
            Field id = emote.getClass().getDeclaredField("id"); id.setAccessible(true);
            out.add((String) id.get(emote));
        }
        return out;
    }
    static Map<?, ?> resolved(String channel) throws Exception {
        int mask = 0;
        String[] keys = {"emotes_7tv", "emotes_bttv", "emotes_ffz"};
        for (int i = 0; i < keys.length; i++) if (Settings.isEnabled(keys[i])) mask |= 1 << i;
        Object resolved = call("resolve", new Class<?>[]{String.class, int.class}, channel, mask);
        Field byCode = resolved.getClass().getDeclaredField("byCode"); byCode.setAccessible(true);
        return (Map<?, ?>) byCode.get(resolved);
    }
    /** Waits until no list is loading (all three lanes idle). */
    static void settle() throws Exception {
        Set<?> loading = (Set<?>) field("TwitchEmotes", "LOADING");
        long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (!loading.isEmpty()) {
            if (System.nanoTime() > end) throw new AssertionError("still loading: " + loading);
            Thread.sleep(10);
        }
    }
    static void waitFor(BooleanSupplier condition, String why) throws Exception {
        long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (!condition.getAsBoolean()) {
            if (System.nanoTime() > end) throw new AssertionError("timed out: " + why);
            Thread.sleep(10);
        }
    }
    static boolean has(String key) {
        try { return entry(key) != null; } catch (Exception e) { throw new AssertionError(e); }
    }
    static void advance(long millis) { android.os.SystemClock.offset += millis; }
    static String url(String id, String variant) { return TwitchEmotes.url("https://static-cdn.jtvnw.net/emoticons/v2/" + id + "/" + variant + "/dark/2.0"); }

    public static void main(String[] args) throws Exception {
        install();
        switch (args[0]) {
            case "ffz-fallback": {
                Settings.values.put("emotes_ffz", "true");
                // FrankerFaceZ's origin down: Cloudflare answers 522.
                ANSWERS.put(FFZ_ROOM + "123", u -> new Object[]{522, ""});
                ANSWERS.put(FFZ_GLOBAL, u -> new Object[]{522, ""});
                answer(COPY_USER + "123", 200, COPY_BODY);
                answer(COPY_GLOBAL, 200, COPY_GLOBAL_BODY);
                TwitchEmotes.onChatChannel("123");
                settle();
                check(ids("f:123").equals(List.of("lurkzs_246878", "lurkza_739826")), "channel list from BetterTTV's copy, modifier left out: " + ids("f:123"));
                check(ids("f:global").equals(List.of("lurkzs_9")), "global list from BetterTTV's copy: " + ids("f:global"));
                check(calls(FFZ_ROOM + "123") == 1 && calls(COPY_USER + "123") == 1, "FrankerFaceZ asked first, then the copy");
                check("lurkzs_246878".equals(resolved("123").get("WideHard")), "chat matches the copy's emotes");
                // Images from BetterTTV's copy of FrankerFaceZ's CDN, with FrankerFaceZ's paths.
                check("https://cdn.betterttv.net/frankerfacez_emote/246878/2".equals(url("lurkzs_246878", "default")), "static image " + url("lurkzs_246878", "default"));
                check("https://cdn.betterttv.net/frankerfacez_emote/739826/animated/2.gif".equals(url("lurkza_739826", "default")), "animated image");
                check("https://cdn.betterttv.net/frankerfacez_emote/739826/2".equals(url("lurkza_739826", "static")), "animated emote with animation off");
                check("https://cdn.frankerfacez.com/emote/246878/2".equals(url("lurkfs_246878", "default")), "FrankerFaceZ's own IDs keep its CDN");
                String[] described = (String[]) call("describe", new Class<?>[]{String.class}, "https://cdn.betterttv.net/frankerfacez_emote/246878/4");
                check("FrankerFaceZ".equals(described[0]) && "channel".equals(described[1]) && "FabulousPotato69".equals(described[2]),
                    "Emote and badge info names the copy's emotes FrankerFaceZ's: " + Arrays.toString(described));
                check(call("describe", new Class<?>[]{String.class}, "https://cdn.betterttv.net/emote/246878/2x.png") != null, "BetterTTV's own CDN still BetterTTV");

                // While FrankerFaceZ counts as down, the next channel goes to the copy first: no 8 s wait per channel.
                answer(COPY_USER + "456", 200, "[]");
                ANSWERS.put(FFZ_ROOM + "456", u -> { throw new AssertionError("FrankerFaceZ asked while down"); });
                TwitchEmotes.onChatChannel("456");
                settle();
                check(has("f:456") && ids("f:456").isEmpty() && calls(COPY_USER + "456") == 1, "copy first while down");

                // Ten minutes later FrankerFaceZ is asked first again, and answers: its own IDs and sizes.
                advance(10 * 60_000L + 1);
                answer(FFZ_ROOM + "789", 200, FFZ_BODY);
                ANSWERS.put(COPY_USER + "789", u -> { throw new AssertionError("copy asked while FrankerFaceZ answers"); });
                answer(FFZ_GLOBAL, 200, "{\"default_sets\":[3],\"sets\":{}}");
                TwitchEmotes.onChatChannel("789");
                settle();
                check(ids("f:789").equals(List.of("lurkfs_246878")), "FrankerFaceZ's own list once it answers: " + ids("f:789"));
                Float ratio = (Float) call("ratio", new Class<?>[]{String.class}, "https://cdn.betterttv.net/frankerfacez_emote/246878/2");
                check(ratio != null && Math.abs(ratio - 2.5f) < 0.01f, "a width FrankerFaceZ gave applies to the copy's image too: " + ratio);

                // A 404 is FrankerFaceZ's answer for a channel it doesn't know, not an outage.
                answer(FFZ_ROOM + "404", 404, "");
                ANSWERS.put(COPY_USER + "404", u -> { throw new AssertionError("copy asked after a 404"); });
                TwitchEmotes.onChatChannel("404");
                settle();
                check(has("f:404") && ids("f:404").isEmpty(), "404 is an empty list");

                // Both failing: a failure like any other, retried soon, nothing kept from before.
                ANSWERS.put(FFZ_ROOM + "500", u -> { throw new SocketTimeoutException("timeout"); });
                answer(COPY_USER + "500", 503, "");
                TwitchEmotes.onChatChannel("500");
                settle();
                check((Integer) entryField(entry("f:500"), "failures") == 1, "both failing counts as one failure");
                break;
            }
            case "independent": {
                // One service hanging (FrankerFaceZ's origin, until the read timeout) must not hold up the others'
                // channel lists, nor may the shared pool being busy (badge lists, images).
                Settings.values.put("emotes_7tv", "true");
                Settings.values.put("emotes_bttv", "true");
                Settings.values.put("emotes_ffz", "true");
                CountDownLatch hang = new CountDownLatch(1);
                Answer hanging = u -> {
                    try { hang.await(); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                    throw new SocketTimeoutException("timeout");
                };
                ANSWERS.put(FFZ_ROOM + "123", hanging);
                ANSWERS.put(FFZ_GLOBAL, hanging);
                ANSWERS.put(FFZ_ROOM + "456", hanging);
                answer(COPY_USER + "123", 200, COPY_BODY);
                answer(COPY_USER + "456", 200, "[]");
                answer(COPY_GLOBAL, 200, COPY_GLOBAL_BODY);
                answer("https://7tv.io/v3/users/twitch/123", 200, SEVENTV_USER);
                answer("https://7tv.io/v3/users/twitch/456", 200, SEVENTV_USER);
                answer("https://7tv.io/v3/emote-sets/global", 200, SEVENTV_GLOBAL);
                answer("https://api.betterttv.net/3/cached/users/twitch/123", 200, BTTV_USER);
                answer("https://api.betterttv.net/3/cached/users/twitch/456", 200, BTTV_USER);
                answer("https://api.betterttv.net/3/cached/emotes/global", 200, BTTV_GLOBAL);
                ThreadPoolExecutor shared = (ThreadPoolExecutor) field("TwitchThirdParty", "POOL");
                CountDownLatch busy = new CountDownLatch(shared.getMaximumPoolSize());
                for (int i = 0; i < shared.getMaximumPoolSize(); i++) shared.execute(() -> {
                    busy.countDown();
                    try { hang.await(); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                });
                check(busy.await(2, TimeUnit.SECONDS), "shared pool busy");
                TwitchEmotes.onChatChannel("123");
                // A second channel right after: its lists don't wait for the first one's hanging request either.
                TwitchEmotes.onChatChannel("456");
                waitFor(() -> has("7:123") && has("b:123") && has("7:global") && has("b:global") && has("7:456") && has("b:456"),
                    "7TV and BetterTTV lists while FrankerFaceZ hangs");
                Map<?, ?> codes = resolved("123");
                check(codes.containsKey("Channel7") && codes.containsKey("ChannelB") && codes.containsKey("Global7")
                    && codes.containsKey("GlobalB") && !codes.containsKey("WideHard"), "channel and global emotes of the services that answered: " + codes.keySet());
                check(!has("f:123"), "FrankerFaceZ still loading");
                hang.countDown();
                settle();
                check(resolved("123").containsKey("WideHard") && resolved("123").containsKey("ZrehplaR"), "FrankerFaceZ's lists from the copy once its request timed out");
                check(ids("7:123").equals(List.of("lurk7s_abc123")), "7TV untouched by FrankerFaceZ's failure");
                break;
            }
            case "retry": {
                // A channel list that fails on joining is tried again within seconds, not after a minute, and a list
                // that had emotes keeps them while it fails.
                Settings.values.put("emotes_7tv", "true");
                answer("https://7tv.io/v3/emote-sets/global", 200, SEVENTV_GLOBAL);
                AtomicInteger attempt = new AtomicInteger();
                ANSWERS.put("https://7tv.io/v3/users/twitch/123", u -> attempt.incrementAndGet() == 1
                    ? new Object[]{503, ""} : new Object[]{200, SEVENTV_USER});
                TwitchEmotes.onChatChannel("123");
                settle();
                check(resolved("123").keySet().equals(Set.of("Global7")), "only the global emotes after the failure");
                check((Integer) entryField(entry("7:123"), "failures") == 1, "one failure counted");
                settle();
                check(calls("https://7tv.io/v3/users/twitch/123") == 1, "not asked again at once");
                advance(4_000);
                resolved("123");
                settle();
                check(calls("https://7tv.io/v3/users/twitch/123") == 1, "not before the first retry time");
                advance(1_001);
                resolved("123");
                settle();
                check(calls("https://7tv.io/v3/users/twitch/123") == 2, "asked again after five seconds");
                check(resolved("123").containsKey("Channel7"), "channel emotes after the retry");
                check((Integer) entryField(entry("7:123"), "failures") == 0, "an answer clears the failures");

                // Failing again later keeps the emotes it had; the retry times grow.
                advance(10 * 60_000L + 1);
                ANSWERS.put("https://7tv.io/v3/users/twitch/123", u -> { throw new SocketTimeoutException("timeout"); });
                resolved("123");
                settle();
                check(resolved("123").containsKey("Channel7"), "a list that fails keeps its emotes");
                advance(5_001);
                resolved("123");
                settle();
                check((Integer) entryField(entry("7:123"), "failures") == 2 && calls("https://7tv.io/v3/users/twitch/123") == 4, "second failure");
                advance(6_000);
                resolved("123");
                settle();
                check(calls("https://7tv.io/v3/users/twitch/123") == 4, "the second retry waits fifteen seconds");
                // Joining the channel again tries a failed list at once.
                TwitchEmotes.onChatChannel("123");
                settle();
                check(calls("https://7tv.io/v3/users/twitch/123") == 5, "joining the channel tries again");
                TwitchEmotes.onChatChannel("123");
                settle();
                check(calls("https://7tv.io/v3/users/twitch/123") == 5, "but not right after a failure");
                check((Integer) entryField(entry("7:123"), "failures") == 3, "third failure");
                break;
            }
            case "cancelled": {
                // A request given up because its React Native rows went away (the worker's owner check failing as
                // the request opens) is not a failure: nothing is stored, and the next caller loads the list at once
                // instead of a minute later.
                Settings.values.put("emotes_7tv", "true");
                answer("https://7tv.io/v3/users/twitch/123", 200, SEVENTV_USER);
                answer("https://7tv.io/v3/emote-sets/global", 200, SEVENTV_GLOBAL);
                @SuppressWarnings("unchecked") ThreadLocal<BooleanSupplier> owner =
                    (ThreadLocal<BooleanSupplier>) field("TwitchThirdParty", "ACTIVE_REQUEST");
                owner.set(() -> false);
                call("load", new Class<?>[]{int.class, String.class, String.class}, 0, "123", "7:123");
                owner.remove();
                check(!has("7:123"), "a cancelled load stores nothing");
                check(calls("https://7tv.io/v3/users/twitch/123") == 0, "and makes no request");
                resolved("123");
                settle();
                check(ids("7:123").equals(List.of("lurk7s_abc123")), "the next caller loads it at once");
                break;
            }
            default: throw new AssertionError(args[0]);
        }
        System.out.println("PASS emote loading " + args[0]);
    }
}
