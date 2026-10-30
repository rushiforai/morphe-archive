import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import org.json.JSONObject;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Executes the patched Twitch ad hooks on ART: the real native metadata handler, stream load, overlay
 * renderer, RN video ad player and brand survey state, plus the extension behind the AdEdgeApi, React
 * Native request, player view and playback session hooks. Owners are left uninitialized, so a switched-off hook (or the
 * original code after a hook) fails with a NullPointerException, which proves execution resumed.
 * CLASSPATH=probe.jar:patched.apk app_process / AdsProbe
 */
public final class AdsProbe {
    private static final Map<String, Boolean> switches = new HashMap<>();
    private static final String ADS = "io.github.jordanwoodson.extension.shared.twitch.TwitchAds";

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe = Class.forName("sun.misc.Unsafe");
        Object instance = unsafe.getMethod("getUnsafe").invoke(null);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(instance, type);
    }

    private static void set(Object owner, Class<?> type, String name, Object value) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        field.set(owner, value);
    }

    private static Object get(Object owner, Class<?> type, String name) throws Exception {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }

    /**
     * Runs a real method; the original code after the hook must fail on the uninitialized owner (a null
     * dependency, or Twitch's crash reporter without Firebase), never inside the extension.
     */
    private static void originalContinues(Method method, Object owner, Object... arguments) throws Exception {
        try {
            method.invoke(owner, arguments);
        } catch (InvocationTargetException expected) {
            Throwable cause = expected.getCause();
            check(cause instanceof NullPointerException || cause instanceof IllegalStateException,
                "Unexpected original failure: " + cause);
            for (StackTraceElement frame : cause.getStackTrace()) {
                check(!frame.getClassName().startsWith(ADS), "Hook failed instead of the original code: " + cause);
            }
            return;
        }
        throw new AssertionError(method.getName() + " did not reach its original code");
    }

    /** Like [originalContinues], but the original may also return normally. */
    private static void originalRuns(Method method, Object owner, Object... arguments) throws Exception {
        try {
            method.invoke(owner, arguments);
        } catch (InvocationTargetException expected) {
            Throwable cause = expected.getCause();
            check(cause instanceof NullPointerException || cause instanceof IllegalStateException,
                "Unexpected original failure: " + cause);
            for (StackTraceElement frame : cause.getStackTrace()) {
                check(!frame.getClassName().startsWith(ADS), "Hook failed instead of the original code: " + cause);
            }
        }
    }

    /**
     * The React Native player view's role for its session: a View that is the session's display, the
     * PlaybackEdge (a PlaybackDisplay) a 31.8.0 playback slot is attached to.
     */
    static final class SessionDisplay extends FrameLayout implements com.twitchrn.player.PlaybackEdge {
        SessionDisplay(Context context) { super(context); }
        @Override public boolean getSurfaceHidesUntilRevealed() { return false; }
        @Override public void hideSurface() {}
        @Override public void onContentSize(int width, int height) {}
        @Override public void onSecureSurfaceRequired(boolean secure) {}
        @Override public void revealSurface(long fadeMs) {}
        @Override public com.facebook.react.bridge.ReactContext getReactContext() { return null; }
        @Override public int getReactTag() { return 0; }
        @Override public void clearEventListener() {}
        @Override public void setEventListener(EventListener listener) {}
    }

    private static void settings() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                if (method.getName().equals("getBoolean")) {
                    return switches.getOrDefault((String) values[0], (Boolean) values[1]);
                }
                if (method.getName().equals("getString")) return values[1];
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        set(null, Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings"), "context", context);
    }

    private static Context systemContext() throws Exception {
        Class<?> threadType = Class.forName("android.app.ActivityThread");
        Constructor<?> constructor = threadType.getDeclaredConstructor();
        constructor.setAccessible(true);
        Object thread = constructor.newInstance();
        set(null, threadType, "sCurrentActivityThread", thread);
        Method context = threadType.getDeclaredMethod("getSystemContext");
        context.setAccessible(true);
        return (Context) context.invoke(thread);
    }

    /** An IVS MediaPlayer that records setMuted. */
    static final class FakePlayer {
        final List<Boolean> mutes = new ArrayList<>();
        boolean muted;
        final Object player;

        FakePlayer() throws Exception {
            Class<?> type = Class.forName("com.amazonaws.ivs.player.MediaPlayer");
            player = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, values) -> {
                switch (method.getName()) {
                    case "setMuted": mutes.add((Boolean) values[0]); muted = (Boolean) values[0]; return null;
                    case "isMuted": return muted;
                    case "hashCode": return System.identityHashCode(proxy);
                    case "equals": return proxy == values[0];
                    default: return null;
                }
            });
        }
    }

    private static JSONObject ad(String duration, String length, String position) throws Exception {
        return new JSONObject().put("CLASS", "twitch-stitched-ad").put("ID", "stitched-ad-1-" + position)
            .put("DURATION", duration).put("X-TV-TWITCH-AD-POD-LENGTH", length)
            .put("X-TV-TWITCH-AD-POD-POSITION", position).put("X-TV-TWITCH-AD-ROLL-TYPE", "MIDROLL")
            .put("X-TV-TWITCH-AD-POD-FILLED-DURATION", duration);
    }

    private static JSONObject live() throws Exception {
        return new JSONObject().put("CLASS", "twitch-stream-source").put("X-TV-TWITCH-STREAM-SOURCE", "live");
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0) ProbeLocators.load(args[0]);
        System.out.println(ProbeLocators.loaded() ? "names from the APK's locators" : "no locators in the APK: 31.7.0 names");
        Looper.prepareMainLooper();
        settings();
        Class<?> ads = Class.forName(ADS);

        // Block display ads: the AdEdgeApi proxy answers with Retrofit's network-failure Result.
        Class<?> edgeType = Class.forName("tv.twitch.android.shared.ad.edge.api.AdEdgeApi");
        final int[] edgeCalls = new int[1];
        final Object original = allocate(Class.forName("io.reactivex.internal.operators.observable.x0"));
        Object edge = Proxy.newProxyInstance(edgeType.getClassLoader(), new Class<?>[]{edgeType}, (proxy, method, values) -> {
            edgeCalls[0]++;
            return original;
        });
        Object wrapped = ads.getMethod("wrapAdEdge", Object.class).invoke(null, edge);
        check(edgeType.isInstance(wrapped) && wrapped != edge, "AdEdgeApi must be wrapped in its own interface");
        Method midFeed = null;
        for (Method method : edgeType.getMethods()) if (method.getName().equals("requestMidFeedAd")) midFeed = method;
        Object[] midFeedArgs = new Object[midFeed.getParameterTypes().length];
        for (int i = 0; i < midFeedArgs.length; i++) if (midFeed.getParameterTypes()[i] == int.class) midFeedArgs[i] = 0;
        switches.put("block_display_ads", true);
        Object single = midFeed.invoke(wrapped, midFeedArgs);
        check(edgeCalls[0] == 0, "Blocked ad request reached the network service");
        Object result = subscribe(single);
        Class<?> resultType = Class.forName("retrofit2.adapter.rxjava2.Result");
        check(resultType.isInstance(result) && (Boolean) resultType.getMethod("isError").invoke(result)
            && resultType.getMethod("error").invoke(result) instanceof IOException, "Blocked ad must be Result.error(IOException)");
        switches.put("block_display_ads", false);
        check(midFeed.invoke(wrapped, midFeedArgs) == original && edgeCalls[0] == 1, "Unblocked request must reach the service");

        // React Native requests: only the ad server, only while the switch is on.
        Method rn = ads.getMethod("rnRequestUrl", String.class);
        String feedAd = "https://edge.ads.twitch.tv/ads/feeds?pid=1";
        String gql = "https://gql.twitch.tv/gql";
        check(feedAd.equals(rn.invoke(null, feedAd)), "RN ad request changed while switched off");
        switches.put("block_display_ads", true);
        String blocked = (String) rn.invoke(null, feedAd);
        check(!blocked.startsWith("http"), "RN ad request must become an unloadable URL");
        check(gql.equals(rn.invoke(null, gql)) && rn.invoke(null, (Object) null) == null
            && "https://notedge.ads.twitch.tv.example/".equals(rn.invoke(null, "https://notedge.ads.twitch.tv.example/")),
            "Other RN requests must pass through");

        // Brand surveys: the real state constructor.
        Class<?> itemType = Class.forName("tv.twitch.android.shared.viewer.pub.FeedItem$BrandSurveyItem");
        Class<?> stateType = Class.forName("tv.twitch.android.shared.viewer.pub.s");
        // The state's second constructor parameter: the survey's completion enum.
        Class<?> completion = null;
        for (Constructor<?> candidate : stateType.getConstructors()) {
            if (candidate.getParameterCount() == 2 && candidate.getParameterTypes()[0] == itemType) completion = candidate.getParameterTypes()[1];
        }
        Object notStarted = completion.getField("NOT_STARTED").get(null);
        Object item = allocate(itemType);
        Constructor<?> state = stateType.getConstructor(itemType, completion);
        check(get(state.newInstance(item, notStarted), stateType, "a") == null, "Brand survey kept while blocked");
        switches.put("block_display_ads", false);
        check(get(state.newInstance(item, notStarted), stateType, "a") == item, "Brand survey dropped while switched off");

        // React Native VAST player: Twitch's own no-fill error instead of a parse.
        Class<?> playerType = Class.forName("tv.twitch.android.feature.discovery.feed.rn.runtime.TwitchRNVideoAdPlayer");
        Class<?> delegateType = Class.forName("com.twitchrn.player.TwitchVideoAdView$Delegate");
        final List<String> errors = new ArrayList<>();
        Object delegate = Proxy.newProxyInstance(delegateType.getClassLoader(), new Class<?>[]{delegateType}, (proxy, method, values) -> {
            if (method.getName().equals("onAdError")) errors.add(values[0] + ":" + values[1]);
            return null;
        });
        Object rnPlayer = allocate(playerType);
        set(rnPlayer, playerType, "delegate", delegate);
        Method parse = playerType.getDeclaredMethod("parseAndBuild");
        parse.setAccessible(true);
        switches.put("block_display_ads", true);
        parse.invoke(rnPlayer);
        check(errors.size() == 1 && errors.get(0).startsWith("noAd:"), "RN video ad must end with one noAd error: " + errors);
        set(rnPlayer, playerType, "released", true);
        parse.invoke(rnPlayer);
        check(errors.size() == 1, "A released RN video ad player must not report");
        switches.put("block_display_ads", false);
        set(rnPlayer, playerType, "released", false);
        originalContinues(parse, rnPlayer);
        check(errors.size() == 1, "Switched-off RN video ad player reported an error");
        System.out.println("PASS: AdEdgeApi Result.error and pass-through, RN ad URL filter, brand survey state, RN VAST noAd/off");

        // Mute stitched ads, native player: the real metadata handler and stream load.
        // Names from the APK's locators; the fallbacks are Twitch 31.7.0's: native player aoa, ad overlay vw
        // with state rw (playing). The hidden state isn't located: pw is Twitch 31.8.0's (sw in 31.7.0).
        Class<?> nativeType = Class.forName(ProbeLocators.type("twitch.match.native_ad_cue", "aoa"));
        Method cue = nativeType.getMethod(ProbeLocators.method("twitch.match.native_ad_cue", "h"), JSONObject.class);
        Method load = null;
        String loadName = ProbeLocators.method("twitch.match.native_player_load", "T");
        for (Method method : nativeType.getMethods()) if (method.getName().equals(loadName) && method.getParameterTypes().length == 2) load = method;
        FakePlayer first = new FakePlayer();
        Object owner = allocate(nativeType);
        set(owner, nativeType, ProbeLocators.field("twitch.mute_stitched_ads.native_player", "t"), first.player);
        switches.put("mute_stitched_ads", false);
        originalContinues(cue, owner, ad("15", "2", "0"));
        check(first.mutes.isEmpty(), "Switched-off native player was muted");
        switches.put("mute_stitched_ads", true);
        originalContinues(cue, owner, ad("15", "2", "0"));
        check(first.mutes.equals(List.of(true)), "Stitched ad must mute the native player: " + first.mutes);
        originalContinues(cue, owner, ad("15", "2", "1"));
        check(first.mutes.equals(List.of(true)), "A second creative must keep the mute: " + first.mutes);
        originalContinues(cue, owner, new JSONObject().put("CLASS", "twitch-ad-quartile").put("X-TV-TWITCH-AD-QUARTILE", "2"));
        originalContinues(cue, owner, live());
        check(first.mutes.equals(List.of(true, false)), "Stream source live must unmute: " + first.mutes);
        originalContinues(cue, owner, live());
        check(first.mutes.size() == 2, "Unmute must happen once");
        originalContinues(cue, owner, ad("15", "1", "0"));
        originalContinues(load, owner, null, null);
        check(first.mutes.equals(List.of(true, false, true, false)), "A new stream load must unmute: " + first.mutes);
        first.muted = true;
        first.mutes.clear();
        originalContinues(cue, owner, ad("15", "1", "0"));
        originalContinues(cue, owner, live());
        check(first.mutes.isEmpty(), "A player muted by someone else must be left alone: " + first.mutes);
        first.muted = false;
        originalContinues(cue, owner, ad("15", "1", "0"));
        switches.put("mute_stitched_ads", false);
        originalContinues(cue, owner, ad("15", "1", "0"));
        check(first.mutes.equals(List.of(true, false)), "Switching off must restore at the next cue: " + first.mutes);

        // Native cover: the real overlay renderer with Twitch's ad-playing and hidden states.
        Context context = systemContext();
        FrameLayout overlay = new FrameLayout(context);
        Class<?> overlayType = Class.forName(ProbeLocators.type("twitch.match.stitched_ad_overlay", "vw"));
        Object renderer = allocate(overlayType);
        set(renderer, Class.forName("tv.twitch.android.core.mvp.viewdelegate.BaseViewDelegate"),
            ProbeLocators.field("twitch.mute_stitched_ads.root_view", "b"), overlay);
        Method render = overlayType.getMethod(ProbeLocators.method("twitch.match.stitched_ad_overlay", "u"),
            Class.forName("tv.twitch.android.core.mvp.viewdelegate.ViewDelegateState"));
        Object playing = allocate(Class.forName(ProbeLocators.type("twitch.match.stitched_ad_playing", "rw")));
        Object hidden = Class.forName("pw").getField("a").get(null);
        check(hidden.getClass().getSuperclass() == playing.getClass().getSuperclass(), "pw is not the overlay's hidden state");
        switches.put("mute_stitched_ads", true);
        originalContinues(render, renderer, playing);
        check(overlay.getBackground() != null && overlay.getBackground().getClass().getName().endsWith("AdCover"),
            "Ad-playing overlay must be covered");
        renderHidden(render, renderer, hidden);
        check(overlay.getBackground() == null, "Hidden overlay must get its own background back");
        switches.put("mute_stitched_ads", false);
        originalContinues(render, renderer, playing);
        check(overlay.getBackground() == null, "Switched-off overlay was covered");

        // React Native player view: the extension behind its metadata, stream URL and release hooks.
        Method rnCue = ads.getMethod("onRnCue", View.class, Object.class, String.class, ByteBuffer.class);
        Method rnUrl = ads.getMethod("onRnStreamUrl", View.class, String.class);
        Method rnRelease = ads.getMethod("onRnRelease", View.class);
        FrameLayout view = new FrameLayout(context);
        FakePlayer pooled = new FakePlayer();
        switches.put("mute_stitched_ads", true);
        rnUrl.invoke(null, view, "https://usher.ttvnw.net/api/v2/channel/hls/a.m3u8");
        ByteBuffer data = ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8));
        rnCue.invoke(null, view, pooled.player, "text/json", data);
        check(data.position() == 0, "The RN handler's buffer must be left unread");
        check(pooled.mutes.equals(List.of(true)) && view.getForeground() != null
            && view.getForeground().getClass().getName().endsWith("AdCover"), "RN stitched ad must mute and cover");
        rnUrl.invoke(null, view, "https://usher.ttvnw.net/api/v2/channel/hls/a.m3u8");
        check(pooled.mutes.size() == 1, "The same stream URL must not end the break");
        rnUrl.invoke(null, view, "https://usher.ttvnw.net/api/v2/channel/hls/b.m3u8");
        check(pooled.mutes.equals(List.of(true, false)) && view.getForeground() == null, "A new stream must unmute and uncover");
        rnCue.invoke(null, view, pooled.player, "text/json", ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8)));
        rnRelease.invoke(null, view);
        check(pooled.mutes.equals(List.of(true, false, true, false)) && view.getForeground() == null, "Release must unmute and uncover");
        rnCue.invoke(null, view, pooled.player, "text/json", ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8)));
        rnCue.invoke(null, view, pooled.player, "text/plain", ByteBuffer.wrap(live().toString().getBytes(StandardCharsets.UTF_8)));
        check(pooled.mutes.size() == 6 && view.getForeground() == null, "RN stream source live must end the break");
        switches.put("mute_stitched_ads", false);
        rnCue.invoke(null, view, pooled.player, "text/json", ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8)));
        check(pooled.mutes.size() == 6 && view.getForeground() == null, "Switched-off RN view was muted or covered");

        // React Native playback session: the real handleMetadata, setStreamUrl and release with their
        // hooks, and the two helpers the patch adds to the session (its display as a View, and the
        // metadata hook with the session's own player). The display is the player view in the app.
        // An allocated session's original code may return early or fail on a null field; both are fine.
        // Names from the APK's locators; the fallbacks are Twitch 31.8.0's (PlaybackSlot, attached to a PlaybackEdge).
        Class<?> sessionType = Class.forName(ProbeLocators.type("twitch.mute_stitched_ads.rn_session",
            "com.twitchrn.player.PlaybackSlot"));
        Class<?> displayType = Class.forName(ProbeLocators.fieldType("twitch.mute_stitched_ads.rn_display",
            "com.twitchrn.player.PlaybackEdge"));
        Class<?> custodyType = Class.forName("com.twitchrn.player.PlayerCustody");
        Object session = allocate(sessionType);
        SessionDisplay display = new SessionDisplay(context);
        FakePlayer sessionPlayer = new FakePlayer();
        Object custody = allocate(custodyType);
        set(custody, custodyType, "player", sessionPlayer.player);
        Field displayField = null;
        for (Field field : sessionType.getDeclaredFields()) {
            field.setAccessible(true);
            if (field.getType() == displayType) { displayField = field; field.set(session, display); }
            if (field.getType() == custodyType) field.set(session, custody);
        }
        check(displayField != null, "Playback session has no display field");
        Method metadata = sessionType.getMethod("handleMetadata", String.class, ByteBuffer.class);
        Method streamUrl = sessionType.getMethod("setStreamUrl", String.class);
        Method release = sessionType.getMethod("release");
        switches.put("mute_stitched_ads", true);
        originalRuns(streamUrl, session, "https://usher.ttvnw.net/api/v2/channel/hls/c.m3u8");
        ByteBuffer sessionData = ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8));
        originalRuns(metadata, session, "text/json", sessionData);
        check(sessionPlayer.mutes.equals(List.of(true)) && display.getForeground() != null
            && display.getForeground().getClass().getName().endsWith("AdCover"),
            "A session cue must mute the session's player and cover its view: " + sessionPlayer.mutes);
        originalRuns(streamUrl, session, "https://usher.ttvnw.net/api/v2/channel/hls/d.m3u8");
        check(sessionPlayer.mutes.equals(List.of(true, false)) && display.getForeground() == null,
            "A new session stream must unmute and uncover: " + sessionPlayer.mutes);
        originalRuns(metadata, session, "text/json",
            ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8)));
        originalRuns(release, session);
        check(sessionPlayer.mutes.equals(List.of(true, false, true, false)) && display.getForeground() == null,
            "Session release must unmute and uncover: " + sessionPlayer.mutes);
        // A display that isn't a View leaves the hooks inert.
        displayField.set(session, Proxy.newProxyInstance(displayType.getClassLoader(), new Class<?>[]{displayType},
            (proxy, method, values) -> null));
        originalRuns(metadata, session, "text/json",
            ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8)));
        check(sessionPlayer.mutes.size() == 4, "A session without a view display was muted");
        displayField.set(session, display);
        switches.put("mute_stitched_ads", false);
        originalRuns(metadata, session, "text/json",
            ByteBuffer.wrap(ad("30", "1", "0").toString().getBytes(StandardCharsets.UTF_8)));
        check(sessionPlayer.mutes.size() == 4 && display.getForeground() == null, "Switched-off session was muted or covered");

        // The fallback timer, from the ad's duration, when no stream-source cue arrives.
        switches.put("mute_stitched_ads", true);
        FakePlayer lost = new FakePlayer();
        Object timed = allocate(nativeType);
        set(timed, nativeType, ProbeLocators.field("twitch.mute_stitched_ads.native_player", "t"), lost.player);
        originalContinues(cue, timed, ad("0.5", "1", "0"));
        check(lost.mutes.equals(List.of(true)), "Timer test break did not start");
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            check(lost.mutes.equals(List.of(true, false)), "The fallback timer must unmute: " + lost.mutes);
            System.out.println("PASS: native cue/load/overlay, RN view cue/URL/release, RN playback session hooks, fallback timer; off switches leave players and views alone");
            System.exit(0);
        }, 7000);
        Looper.loop();
    }

    private static void renderHidden(Method render, Object renderer, Object hidden) throws Exception {
        try {
            render.invoke(renderer, hidden);
        } catch (InvocationTargetException e) {
            check(e.getCause() instanceof NullPointerException, "Unexpected hidden overlay failure: " + e.getCause());
        }
    }

    /** RxJava 2 Single.subscribe(SingleObserver), renamed by R8; returns the success value. */
    private static Object subscribe(Object single) throws Exception {
        Class<?> observerType = Class.forName("io.reactivex.v");
        final Object[] value = new Object[1];
        Object observer = Proxy.newProxyInstance(observerType.getClassLoader(), new Class<?>[]{observerType}, (proxy, method, values) -> {
            if (method.getName().equals("onSuccess")) value[0] = values[0];
            else if (method.getParameterTypes().length == 1 && method.getParameterTypes()[0] == Throwable.class) {
                throw new AssertionError("Single failed: " + values[0]);
            }
            return null;
        });
        Class.forName("io.reactivex.u").getMethod("m", observerType).invoke(single, observer);
        check(value[0] != null, "Single did not emit");
        return value[0];
    }
}
