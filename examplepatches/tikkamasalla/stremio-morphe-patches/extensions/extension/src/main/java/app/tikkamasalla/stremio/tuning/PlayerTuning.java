package app.tikkamasalla.stremio.tuning;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

import app.tikkamasalla.stremio.introskip.IntroSkipPrefs;

/**
 * Smoother playback for Stremio's own (Media3) player: frame-rate matching mode and a larger network buffer.
 * Called from patched Stremio bytecode; every hook fails soft and returns the stock value on any problem.
 * Media3 and Stremio-core classes are reached by name only (they are renamed by R8 in some builds, and the
 * extension does not compile against media3-exoplayer).
 */
public final class PlayerTuning {
    private static final String TAG = "PlayerTuning";
    /** Media3 C.VIDEO_CHANGE_FRAME_RATE_STRATEGY_OFF / _ONLY_IF_SEAMLESS in the Media3 versions Stremio ships (1.6.12 .. 2.5.0). */
    private static final int STRATEGY_OFF = Integer.MIN_VALUE;
    private static final int STRATEGY_SEAMLESS = 0;

    static final int MIN_BUFFER_MS = 50000;
    static final int MAX_BUFFER_MS = 120000;
    static final int MIN_AFTER_REBUFFER_MS = 5000;
    static final int DEFAULT_PLAY_MS = 1000;
    /** Media3's own muxed default (131 MB video + 13 MB audio): never go below what stock already holds. */
    static final long MIN_TARGET_BYTES = 144310272L;
    static final long MAX_TARGET_BYTES = 268435456L;

    private static final String STRATEGY_PACKAGE = "com.stremio.core.types.profile.Profile$FrameRateMatchingStrategy$";

    private PlayerTuning() {
    }

    /** The Application never changes during the process: look it up once (the strategy getter is called often). */
    private static volatile Context appContext;

    static Context app() {
        Context cached = appContext;
        if (cached != null) return cached;
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Method current = thread.getMethod("currentApplication");
            cached = (Application) current.invoke(null);
            appContext = cached;
            return cached;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** The mode of a user who never chose one: Always where the silent switch exists, Seamless only elsewhere. */
    static String defaultMatch() {
        return FrameRateModes.supported() ? IntroSkipPrefs.MATCH_ALWAYS : IntroSkipPrefs.MATCH_SEAMLESS;
    }

    /** Stored mode, normalized; the default when unset; "seamless" when unreadable. */
    public static String matchMode() {
        try {
            Context context = app();
            if (context == null) return IntroSkipPrefs.MATCH_SEAMLESS;
            String stored = context.getSharedPreferences(IntroSkipPrefs.FILE, Context.MODE_PRIVATE)
                    .getString(IntroSkipPrefs.KEY_MATCH_FPS, null);
            return stored == null ? defaultMatch() : normalizeMatch(stored);
        } catch (Throwable ignored) {
            return IntroSkipPrefs.MATCH_SEAMLESS;
        }
    }

    static String normalizeMatch(String raw) {
        if (IntroSkipPrefs.MATCH_ALWAYS.equals(raw)) return IntroSkipPrefs.MATCH_ALWAYS;
        if (IntroSkipPrefs.MATCH_OFF.equals(raw)) return IntroSkipPrefs.MATCH_OFF;
        return IntroSkipPrefs.MATCH_SEAMLESS;
    }

    static boolean bigBuffer() {
        try {
            Context context = app();
            if (context == null) return true;
            return context.getSharedPreferences(IntroSkipPrefs.FILE, Context.MODE_PRIVATE)
                    .getBoolean(IntroSkipPrefs.KEY_BIG_BUFFER, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    // ---- frame rate -------------------------------------------------------------------------------------------

    /**
     * Media3 hint (Surface.setFrameRate, seamless only). Seamless and Always ask for the content frame rate;
     * Off does not. Any other mode value keeps the stock strategy.
     */
    static int exoStrategy(String mode, int stock) {
        if (IntroSkipPrefs.MATCH_SEAMLESS.equals(mode) || IntroSkipPrefs.MATCH_ALWAYS.equals(mode)) return STRATEGY_SEAMLESS;
        if (IntroSkipPrefs.MATCH_OFF.equals(mode)) return STRATEGY_OFF;
        return stock;
    }

    /** Hook: the strategy int right before Stremio hands it to ExoPlayer.setVideoChangeFrameRateStrategy. */
    public static int exoStrategy(int stock) {
        try {
            return exoStrategy(matchMode(), stock);
        } catch (Throwable ignored) {
            return stock;
        }
    }

    /**
     * Stremio's profile strategy (simple class names DISABLED / FRAME_RATE_ONLY / FRAME_RATE_AND_RESOLUTION) as the
     * display matcher should see it. Seamless and Off turn the matcher off, so Stremio never makes its non-seamless
     * display mode switch (blank screen plus the TV's popup); Seamless keeps the Media3 hint through exoStrategy.
     * Always turns a disabled matcher on (same resolution, display mode switch) and keeps an enabled one.
     */
    static String matcherName(String mode, String stockName) {
        if (stockName == null) return null;
        boolean known = "DISABLED".equals(stockName) || "FRAME_RATE_ONLY".equals(stockName)
                || "FRAME_RATE_AND_RESOLUTION".equals(stockName);
        if (!known) return stockName;
        if (IntroSkipPrefs.MATCH_ALWAYS.equals(mode)) return "DISABLED".equals(stockName) ? "FRAME_RATE_ONLY" : stockName;
        if (IntroSkipPrefs.MATCH_SEAMLESS.equals(mode) || IntroSkipPrefs.MATCH_OFF.equals(mode)) return "DISABLED";
        return stockName;
    }

    /** Hook: return value of Profile.Settings.getFrameRateMatchingStrategy() (read by the Media3 hint and the display matcher). */
    public static Object matchStrategy(Object stock) {
        try {
            return matchStrategy(FrameRateSwitch.matcherMode(matchMode()), stock);
        } catch (Throwable ignored) {
            return stock;
        }
    }

    static Object matchStrategy(String mode, Object stock) {
        if (stock == null) return null;
        try {
            // Not getSimpleName(): it throws on nested classes whose InnerClasses data R8 dropped.
            String full = stock.getClass().getName();
            String name = full.substring(full.lastIndexOf('$') + 1);
            String wanted = matcherName(mode, name);
            if (wanted == null || wanted.equals(name)) return stock;
            Object instance = Class.forName(STRATEGY_PACKAGE + wanted).getField("INSTANCE").get(null);
            return instance != null ? instance : stock;
        } catch (Throwable ignored) {
            return stock;
        }
    }

    // ---- buffer -----------------------------------------------------------------------------------------------

    static final class BufferParams {
        final int minMs;
        final int maxMs;
        final int playMs;
        final int afterRebufferMs;
        final int targetBytes;
        final boolean prioritizeTimeOverSize;

        BufferParams(int minMs, int maxMs, int playMs, int afterRebufferMs, int targetBytes, boolean prioritizeTimeOverSize) {
            this.minMs = minMs;
            this.maxMs = maxMs;
            this.playMs = playMs;
            this.afterRebufferMs = afterRebufferMs;
            this.targetBytes = targetBytes;
            this.prioritizeTimeOverSize = prioritizeTimeOverSize;
        }
    }

    /**
     * Start threshold stays at the stock value (first frame not later than stock); a stall resumes only after at
     * least 5 s (stock 2 s resumes into the next stall); 50 s refill point / 120 s ceiling; the byte target is
     * 40 percent of the Java heap, never below stock and never above 256 MiB; time never overrides the byte target
     * (an 80 Mbps remux would otherwise need 750 MB to hold 75 s).
     */
    static BufferParams bufferParams(int stockPlayMs, int stockAfterRebufferMs, long maxHeapBytes) {
        int play = stockPlayMs > 0 ? stockPlayMs : DEFAULT_PLAY_MS;
        int after = Math.max(stockAfterRebufferMs, MIN_AFTER_REBUFFER_MS);
        long bytes = maxHeapBytes * 40L / 100L;
        if (bytes < MIN_TARGET_BYTES) bytes = MIN_TARGET_BYTES;
        if (bytes > MAX_TARGET_BYTES) bytes = MAX_TARGET_BYTES;
        return new BufferParams(MIN_BUFFER_MS, MAX_BUFFER_MS, play, after, (int) bytes, false);
    }

    /**
     * Hook: the LoadControl handed to Stremio's ExoPlayer wrapper. Only the stock DefaultLoadControl is replaced
     * (a wrapper that already got a custom one is left alone). Builds a new one with Media3's own Builder.
     */
    public static Object loadControl(Object stock) {
        try {
            if (stock == null || !bigBuffer()) return stock;
            Class<?> loadControlClass = stock.getClass();
            if (!"androidx.media3.exoplayer.DefaultLoadControl".equals(loadControlClass.getName())) return stock;
            int play = loadControlClass.getField("DEFAULT_BUFFER_FOR_PLAYBACK_MS").getInt(null);
            int after = loadControlClass.getField("DEFAULT_BUFFER_FOR_PLAYBACK_AFTER_REBUFFER_MS").getInt(null);
            BufferParams p = bufferParams(play, after, Runtime.getRuntime().maxMemory());
            Class<?> builderClass = Class.forName("androidx.media3.exoplayer.DefaultLoadControl$Builder");
            Constructor<?> constructor = builderClass.getConstructor();
            Object builder = constructor.newInstance();
            builderClass.getMethod("setBufferDurationsMs", int.class, int.class, int.class, int.class)
                    .invoke(builder, p.minMs, p.maxMs, p.playMs, p.afterRebufferMs);
            builderClass.getMethod("setTargetBufferBytes", int.class).invoke(builder, p.targetBytes);
            builderClass.getMethod("setPrioritizeTimeOverSizeThresholds", boolean.class).invoke(builder, p.prioritizeTimeOverSize);
            Object built = builderClass.getMethod("build").invoke(builder);
            if (built == null) return stock;
            Log.i(TAG, "buffer min=" + p.minMs + " max=" + p.maxMs + " play=" + p.playMs + " afterRebuffer="
                    + p.afterRebufferMs + " bytes=" + p.targetBytes);
            return built;
        } catch (Throwable t) {
            Log.w(TAG, "stock buffer kept: " + t);
            return stock;
        }
    }
}
