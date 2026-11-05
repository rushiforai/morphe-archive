package io.github.jordanwoodson.extension.shared.twitch;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.View;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Ads. "Block display ads" answers Twitch's ad requests with the failures Twitch already handles, and
 * "Mute stitched ads" silences and covers ad breaks the server stitches into a stream. Neither changes
 * anything while its switch is off, and a player is never left muted or covered by Lurk.
 */
@SuppressWarnings("unused")
public final class TwitchAds {
    private static final String BLOCK = "block_display_ads";
    private static final String MUTE = "mute_stitched_ads";
    private static final String PROXY = "playlist_proxy";
    private static final String AD_HOST = "edge.ads.twitch.tv";
    private static final String USHER_HOST = "usher.ttvnw.net";
    private static final Pattern LIVE_CHANNEL = Pattern.compile(
            "/api/(?:v2/)?channel/hls/([A-Za-z0-9_]+)\\.m3u8");

    private TwitchAds() {
    }

    // Block display ads ---------------------------------------------------------------------------

    /**
     * Injection point: each Retrofit AdEdgeApi service right after it is created. Every native ad
     * format is requested through it: stream display ads (squeezeback, lower third), audio and
     * multi-format video pods, the headliner and the feed's display and video ads.
     */
    public static Object wrapAdEdge(Object api) {
        if (api == null) return null;
        try {
            Class<?> type = Class.forName("tv.twitch.android.shared.ad.edge.api.AdEdgeApi", false,
                    TwitchAds.class.getClassLoader());
            if (!type.isInstance(api)) return api;
            return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, new AdEdge(api));
        } catch (ClassNotFoundException | RuntimeException | LinkageError e) {
            Logger.d("ads: AdEdgeApi left as is: " + e);
            return api;
        }
    }

    private static final class AdEdge implements InvocationHandler {
        private final Object api;

        AdEdge(Object api) {
            this.api = api;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals":
                        return proxy == args[0];
                    case "hashCode":
                        return System.identityHashCode(proxy);
                    default:
                        return "Lurk(" + api + ")";
                }
            }
            if (Settings.isEnabled(BLOCK)) {
                Object failed = failedRequest(method.getReturnType());
                if (failed != null) {
                    Logger.blocked("ad request " + method.getName());
                    return failed;
                }
            }
            try {
                return method.invoke(api, args);
            } catch (InvocationTargetException e) {
                throw e.getCause();
            }
        }
    }

    private static Method singleJust;
    private static Method resultError;

    /**
     * What Retrofit's RxJava adapter emits when a request fails on the network: a Single of
     * Result.error(IOException). Every ad caller already treats that as "no ad" without waiting.
     */
    private static synchronized Object failedRequest(Class<?> single) {
        try {
            if (resultError == null) {
                resultError = Class.forName("retrofit2.adapter.rxjava2.Result", false, single.getClassLoader())
                        .getMethod("error", Throwable.class);
            }
            if (singleJust == null || singleJust.getDeclaringClass() != single) singleJust = just(single);
            if (singleJust == null) return null;
            Object error = resultError.invoke(null, new IOException("Lurk: ad request blocked"));
            return singleJust.invoke(null, error);
        } catch (ReflectiveOperationException | RuntimeException e) {
            return null;
        }
    }

    /** RxJava's Single.just. R8 renamed it, but it is Single's only static factory taking an Object. */
    private static Method just(Class<?> single) {
        Method found = null;
        for (Method method : single.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || parameters.length != 1
                    || parameters[0] != Object.class || !single.isAssignableFrom(method.getReturnType())) continue;
            if (found != null) return null;
            found = method;
        }
        return found;
    }

    /**
     * Injection point: React Native's NetworkingModule.sendRequest, before the request is built. An ad
     * server URL becomes one the module can't load, so the request fails inside its own error handling
     * and the JavaScript fetch rejects, which Twitch's ad code treats as no ad. Other URLs pass through.
     */
    public static String rnRequestUrl(String url) {
        if (url == null || !url.contains(AD_HOST) || !isHost(url, AD_HOST) || !Settings.isEnabled(BLOCK)) return url;
        Logger.blocked("React Native ad request");
        return "lurk-blocked://" + AD_HOST + "/";
    }

    private static boolean isHost(String url, String host) {
        try {
            Uri uri = Uri.parse(url);
            String scheme = uri.getScheme();
            return host.equalsIgnoreCase(uri.getHost())
                    && ("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme));
        } catch (RuntimeException e) {
            return false;
        }
    }

    /**
     * Injection point: the React Native video ad player, instead of parsing its VAST response. Reports
     * Twitch's own no-fill error ("noAd") to the ad view, asynchronously like the original parse, unless
     * the player was detached in the meantime.
     */
    public static void declineRnVideoAd(Object player) {
        Logger.blocked("React Native video ad");
        post(() -> {
            try {
                if (field(player, "released").getBoolean(player)) return;
                Object delegate = field(player, "delegate").get(player);
                if (delegate == null) return;
                for (Class<?> type : delegate.getClass().getInterfaces()) {
                    if (!type.getName().equals("com.twitchrn.player.TwitchVideoAdView$Delegate")) continue;
                    type.getMethod("onAdError", String.class, String.class).invoke(delegate, "noAd", "Lurk");
                    return;
                }
            } catch (ReflectiveOperationException | RuntimeException e) {
                Logger.d("ads: no video ad error delivered: " + e);
            }
        });
    }

    private static Field field(Object owner, String name) throws NoSuchFieldException {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /**
     * Injection point: the native feed's brand survey state. A survey takes the place of a feed ad that
     * did not fill, so it's dropped together with the ads.
     */
    public static Object brandSurvey(Object item) {
        if (item == null || !Settings.isEnabled(BLOCK)) return item;
        Logger.blocked("brand survey");
        return null;
    }

    // Mute stitched ads ---------------------------------------------------------------------------

    private static final double DEFAULT_AD_SECONDS = 30;
    private static final double MAX_BREAK_SECONDS = 240;
    private static final double SLACK_SECONDS = 5;

    private static Handler main;
    /** Ad breaks Lurk is handling, by IVS player. Touched on the main thread only. */
    private static final Map<Object, Break> breaks = new WeakHashMap<>();
    private static final Map<View, String> streamUrls = new WeakHashMap<>();
    private static final Map<View, Drawable> coveredOverlays = new WeakHashMap<>();
    private static Method setMuted;
    private static Method isMuted;

    private static final class Break {
        final WeakReference<Object> player;
        final boolean muted;
        final Runnable timeout;
        WeakReference<View> view;
        Drawable foreground;

        Break(Object player, boolean muted) {
            this.player = new WeakReference<>(player);
            this.muted = muted;
            this.timeout = () -> {
                Object current = this.player.get();
                if (current != null && breaks.get(current) == this) {
                    Logger.d("ads: stitched ad break timed out");
                    end(current);
                }
            };
        }
    }

    /** One ad cue from an HLS EXT-X-DATERANGE tag: an ad starts, or the stream comes back. */
    private static final class Cue {
        final boolean start;
        final long timeoutMs;

        private Cue(boolean start, long timeoutMs) {
            this.start = start;
            this.timeoutMs = timeoutMs;
        }

        static Cue of(JSONObject json) {
            String type = json.optString("CLASS");
            if ("twitch-stitched-ad".equals(type)) {
                // Each ad of a pod has its own cue. Allow for the rest of the pod, in case the
                // stream-source cue that ends the break is never seen.
                double duration = number(json.optString("DURATION"), DEFAULT_AD_SECONDS);
                double length = number(json.optString("X-TV-TWITCH-AD-POD-LENGTH"), 1);
                double position = number(json.optString("X-TV-TWITCH-AD-POD-POSITION"), 0);
                double seconds = Math.min(duration * Math.max(1, length - position), MAX_BREAK_SECONDS);
                return new Cue(true, (long) ((seconds + SLACK_SECONDS) * 1000));
            }
            if ("twitch-stream-source".equals(type) && "live".equals(json.optString("X-TV-TWITCH-STREAM-SOURCE"))) {
                return new Cue(false, 0);
            }
            return null;
        }

        private static double number(String value, double fallback) {
            try {
                double parsed = Double.parseDouble(value);
                return parsed > 0 && !Double.isInfinite(parsed) ? parsed : fallback;
            } catch (RuntimeException e) {
                return fallback;
            }
        }
    }

    /** Injection point: the start of the native player's HLS metadata handler. Reads, never changes, the cue. */
    public static void onNativeCue(Object player, JSONObject json) {
        if (player == null || json == null) return;
        Cue cue = Cue.of(json);
        if (cue != null) post(() -> handle(player, null, cue));
    }

    /** Injection point: the native player loading a stream. Whatever break was playing is over. */
    public static void onNativeLoad(Object player) {
        if (player != null) post(() -> end(player));
    }

    /** Injection point: the start of React Native's player view metadata handler, for every player. */
    public static void onRnCue(View view, Object player, String type, ByteBuffer data) {
        if (view == null || player == null || data == null) return;
        if (!"text/json".equals(type) && !"text/plain".equals(type)) return;
        Cue cue;
        try {
            // A copy: the original handler still reads the buffer from its current position.
            ByteBuffer copy = data.duplicate();
            byte[] bytes = new byte[copy.remaining()];
            copy.get(bytes);
            String text = new String(bytes, StandardCharsets.UTF_8);
            if (!text.contains("twitch-")) return;
            cue = Cue.of(new JSONObject(text));
        } catch (JSONException | RuntimeException e) {
            return;
        }
        if (cue != null) post(() -> handle(player, view, cue));
    }

    /** Injection point: React Native's player view getting a stream URL. A new stream ends the break. */
    public static void onRnStreamUrl(View view, String url) {
        if (view == null) return;
        post(() -> {
            String previous = streamUrls.put(view, url);
            if (previous != null && !previous.equals(url)) endView(view);
        });
    }

    /** Injection point: React Native's player view releasing its player, which may go back to a pool. */
    public static void onRnRelease(View view) {
        if (view == null) return;
        post(() -> {
            streamUrls.remove(view);
            endView(view);
        });
    }

    /**
     * Injection point: the native stitched-ad overlay drawing a state. While it shows an ad, its
     * full-size root gets a black background, under Twitch's countdown and links.
     */
    public static void coverNativeAd(View overlay, boolean adPlaying) {
        if (overlay == null) return;
        boolean cover = adPlaying && Settings.isEnabled(MUTE);
        if (cover && !coveredOverlays.containsKey(overlay)) {
            coveredOverlays.put(overlay, overlay.getBackground());
            overlay.setBackground(new AdCover(overlay));
        } else if (!cover && coveredOverlays.containsKey(overlay)) {
            overlay.setBackground(coveredOverlays.remove(overlay));
        }
    }

    private static void handle(Object player, View view, Cue cue) {
        if (!cue.start || !Settings.isEnabled(MUTE)) {
            end(player);
            return;
        }
        Break current = breaks.get(player);
        if (current == null) {
            // Twitch mutes with the volume and never uses the player's mute, so this doesn't touch the
            // user's own mute. A player that is already muted is left to whoever muted it.
            boolean muted = !muted(player) && mute(player, true);
            current = new Break(player, muted);
            breaks.put(player, current);
            Logger.d("ads: stitched ad break" + (muted ? ", muted" : ""));
        }
        if (view != null) cover(current, view);
        handler().removeCallbacks(current.timeout);
        handler().postDelayed(current.timeout, cue.timeoutMs);
    }

    private static void end(Object player) {
        Break ended = breaks.remove(player);
        if (ended == null) return;
        handler().removeCallbacks(ended.timeout);
        if (ended.muted) mute(player, false);
        View view = ended.view == null ? null : ended.view.get();
        if (view != null && view.getForeground() instanceof AdCover) view.setForeground(ended.foreground);
        Logger.d("ads: stitched ad break over");
    }

    private static void endView(View view) {
        for (Map.Entry<Object, Break> entry : new ArrayList<>(breaks.entrySet())) {
            WeakReference<View> covered = entry.getValue().view;
            if (covered != null && covered.get() == view) end(entry.getKey());
        }
    }

    private static void cover(Break current, View view) {
        View previous = current.view == null ? null : current.view.get();
        if (previous == view) return;
        if (previous != null && previous.getForeground() instanceof AdCover) previous.setForeground(current.foreground);
        current.view = new WeakReference<>(view);
        current.foreground = view.getForeground();
        view.setForeground(new AdCover(view));
    }

    private static boolean muted(Object player) {
        try {
            if (isMuted == null) isMuted = ivsPlayer(player).getMethod("isMuted");
            return (Boolean) isMuted.invoke(player);
        } catch (ReflectiveOperationException | RuntimeException e) {
            return false;
        }
    }

    private static boolean mute(Object player, boolean value) {
        try {
            if (setMuted == null) setMuted = ivsPlayer(player).getMethod("setMuted", boolean.class);
            setMuted.invoke(player, value);
            return true;
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("ads: player mute failed: " + e);
            return false;
        }
    }

    private static Class<?> ivsPlayer(Object player) throws ClassNotFoundException {
        return Class.forName("com.amazonaws.ivs.player.Player", false, player.getClass().getClassLoader());
    }

    private static synchronized Handler handler() {
        if (main == null) main = new Handler(Looper.getMainLooper());
        return main;
    }

    private static void post(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else handler().post(action);
    }

    /** Opaque black with a small "Ad" in the middle. */
    private static final class AdCover extends Drawable {
        private final Paint fill = new Paint();
        private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);

        AdCover(View view) {
            fill.setColor(Color.BLACK);
            label.setColor(0x99FFFFFF);
            label.setTextAlign(Paint.Align.CENTER);
            label.setTypeface(Typeface.DEFAULT_BOLD);
            label.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14,
                    view.getResources().getDisplayMetrics()));
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            canvas.drawRect(bounds, fill);
            float baseline = bounds.exactCenterY() - (label.descent() + label.ascent()) / 2;
            canvas.drawText("Ad", bounds.exactCenterX(), baseline, label);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.OPAQUE;
        }
    }

    // Playlist proxy ------------------------------------------------------------------------------

    /**
     * Injection point: a live playlist URL, native (Uri) before the player fetches it. Sent through the
     * proxy from the patch option while its switch is on; anything else is returned as it is.
     */
    public static Uri proxyPlaylist(Uri uri) {
        if (uri == null) return null;
        String proxied = proxyPlaylistUrl(uri.toString());
        return proxied == null || proxied.equals(uri.toString()) ? uri : Uri.parse(proxied);
    }

    /** Injection point: a React Native stream or preload URL. Same rewrite as {@link #proxyPlaylist(Uri)}. */
    public static String proxyPlaylistUrl(String url) {
        String template = proxyTemplate();
        if (url == null || template == null || template.isEmpty() || !url.contains(USHER_HOST)) return url;
        if (!Settings.isEnabled(PROXY)) return url;
        try {
            Uri uri = Uri.parse(url);
            String path = uri.getEncodedPath();
            if (!isHost(url, USHER_HOST) || path == null
                    || !(path.startsWith("/api/channel/hls/") || path.startsWith("/api/v2/channel/hls/"))) return url;
            if (template.contains("{channel}")) {
                // Channel-only proxies obtain their own playback token. Never forward the signed
                // Twitch query, including through a second placeholder for the full URL.
                Matcher channel = LIVE_CHANNEL.matcher(path);
                if (template.contains("{url}") || !channel.matches()) return url;
                return template.replace("{channel}", channel.group(1).toLowerCase(Locale.ROOT));
            }
            if (template.contains("{url}")) return template.replace("{url}", URLEncoder.encode(url, "UTF-8"));
            String base = template.endsWith("/") ? template.substring(0, template.length() - 1) : template;
            String query = uri.getEncodedQuery();
            return base + path + (query == null ? "" : "?" + query);
        } catch (UnsupportedEncodingException | RuntimeException e) {
            return url;
        }
    }

    /** Replaced at patch time with the Playlist proxy patch's URL option. */
    private static String proxyTemplate() {
        return null;
    }
}
