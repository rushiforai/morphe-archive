package app.wordfeudwordfinder.extension.hooks;

import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/** Observes Flutter platform messages (route, theme, banner state). Thread-safe; never throws. */
public final class RouteTap {
    private static volatile Long gameId;
    /** The last route seen (see {@link PlatformMessages#routeFromNavigation}), for Copy details. */
    private static volatile String route;
    private static volatile boolean dark = true;
    private static volatile boolean banner;
    private static final List<Runnable> LISTENERS = new CopyOnWriteArrayList<>();
    /** Debug only (V4): receives each distinct channel name once. Null in normal use: nothing is recorded. */
    private static volatile ChannelLogger channelLogger;
    private static final Set<String> SEEN_CHANNELS = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private static final int MAX_SEEN_CHANNELS = 256;
    /**
     * The FlutterJNI instance that delivered the latest platform message (V4: second send path, see FlutterBridge).
     * Weak, so a destroyed engine is not kept alive; replaced only when a different instance shows up.
     */
    private static volatile WeakReference<Object> flutterJni;

    /** Receives channel names only, never message contents. */
    public interface ChannelLogger {
        void seen(String channel);
    }

    private RouteTap() {
    }

    public static void addListener(Runnable r) {
        if (r != null) LISTENERS.add(r);
    }

    /**
     * Debug only: set when {@code wfwf/debug_refresh_order.txt} exists (FlutterBridge), so the channel names used by
     * Wordfeud can be read from logcat for the V4 test. Null switches it off. Resets the set of names already seen.
     */
    public static void setChannelLogger(ChannelLogger l) {
        SEEN_CHANNELS.clear();
        channelLogger = l;
    }

    public static Long currentGameId() {
        return gameId;
    }

    /** The last route as received (query/fragment masked), or null when none was seen yet. */
    public static String lastRoute() {
        return route;
    }

    public static boolean isDark() {
        return dark;
    }

    public static boolean bannerVisible() {
        return banner;
    }

    /** The FlutterJNI instance seen last, or null (none seen yet, or already collected). */
    public static Object flutterJni() {
        WeakReference<Object> r = flutterJni;
        return r == null ? null : r.get();
    }

    /**
     * Hook entry point (FlutterJNI.handlePlatformMessage, {@code jni} = the FlutterJNI instance). Remembers {@code jni}
     * weakly (no reflection, no allocation unless the instance changed), then handles the message like
     * {@link #onPlatformMessage(String, ByteBuffer)}.
     */
    public static void onPlatformMessage(Object jni, String channel, ByteBuffer msg) {
        try {
            if (jni != null) {
                WeakReference<Object> r = flutterJni;
                if (r == null || r.get() != jni) flutterJni = new WeakReference<>(jni);
            }
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
        onPlatformMessage(channel, msg);
    }

    /** Message handling without the FlutterJNI instance (tests; earlier hook). Does not alter position/limit. */
    public static void onPlatformMessage(String channel, ByteBuffer msg) {
        try {
            if (channel == null || msg == null) return;
            ChannelLogger cl = channelLogger;
            if (cl != null && SEEN_CHANNELS.size() < MAX_SEEN_CHANNELS && SEEN_CHANNELS.add(channel)) {
                try {
                    cl.seen(channel);
                } catch (Throwable ignored) {
                    // debug logging must not affect the app
                }
            }
            boolean changed = false;
            if ("flutter/navigation".equals(channel)) {
                String json = readJson(msg);
                if (json != null && json.contains("routeInformationUpdated")) {
                    String r = PlatformMessages.routeFromNavigation(json);
                    if (r != null) route = r;
                    Long id = PlatformMessages.gameIdFromNavigation(json);
                    Long old = gameId;
                    gameId = id;
                    changed = old == null ? id != null : !old.equals(id);
                }
            } else if ("flutter/platform".equals(channel)) {
                String json = readJson(msg);
                if (json != null && json.contains("SystemChrome.setSystemUIOverlayStyle")) {
                    Boolean d = PlatformMessages.darkFromOverlayStyle(json);
                    if (d != null && d.booleanValue() != dark) {
                        dark = d.booleanValue();
                        changed = true;
                    }
                }
            } else if (channel.endsWith(".AdApi.setBannerVisible")) {
                Boolean v = PlatformMessages.bannerVisible(readBytes(msg));
                if (v != null && v.booleanValue() != banner) {
                    banner = v.booleanValue();
                    changed = true;
                }
            }
            if (changed) {
                for (Runnable r : LISTENERS) {
                    try {
                        r.run();
                    } catch (Throwable ignored) {
                        // listener failure must not affect the app
                    }
                }
            }
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    private static byte[] readBytes(ByteBuffer msg) {
        ByteBuffer d = msg.duplicate();
        byte[] out = new byte[d.remaining()];
        d.get(out);
        return out;
    }

    private static String readJson(ByteBuffer msg) {
        byte[] b = readBytes(msg);
        return b.length == 0 ? null : new String(b, StandardCharsets.UTF_8);
    }
}
