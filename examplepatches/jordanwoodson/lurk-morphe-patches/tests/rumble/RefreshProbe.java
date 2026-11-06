import android.content.Context;
import android.os.Looper;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Refresh stream: executes the emitted click and reload bridges and the player's stock quality switch on ART.
 * Only the platform and player edges are doubles: the Composer, ExoPlayer, Compose state and callbacks.
 */
public final class RefreshProbe {
    private static final String EXT = "io.github.jordanwoodson.extension.shared.rumble.RumblePlayer";
    private static final String FUNCTION0 = "kotlin.jvm.functions.Function0";
    private static final String FUNCTION2 = "kotlin.jvm.functions.Function2";
    private static final String SOURCE_URL = "https://example.invalid/refresh.m3u8";

    // The player class, its quality switch, video load, error panel and the fields the patch uses come from the
    // patch's locators. The rest (Compose state, ExoPlayer and Composer methods, the player's other fields) is
    // pinned to the APK this probe was written against.
    private static Class<?> playerType;
    private static Class<?> videoType;
    private static Class<?> sourceType;
    private static Method qualitySwitch;
    private static Method videoLoad;
    private static Method errorView;
    private static String callbackField;
    private static String sourceField;

    public static void main(String[] args) {
        ProbeSupport.run("actual refresh click, stock seek, quality preservation and exceptional restoration",
                RefreshProbe::run);
    }

    private static void run() throws Exception {
        locate();
        if (Looper.myLooper() == null) Looper.prepareMainLooper();
        Object thread = call(Class.forName("android.app.ActivityThread"), "systemMain", new Class<?>[]{});
        Context context = (Context) call(thread, "getSystemContext", new Class<?>[]{});
        // Keep the real audio Context local; extension settings must use registry defaults.
        ProbeSupport.set(thread, "mInitialApplication", null);

        Object noop = ext("noQualityCallback", new Class<?>[]{});
        Class.forName(FUNCTION2).getMethod("r", Object.class, Object.class).invoke(noop, null, false);
        // No registered player is harmless, including the actual click lambda.
        Object empty = ext("refreshable", new Class<?>[]{Object.class, Object.class}, modifierCompanion(), null);
        Class.forName(FUNCTION0).getMethod("invoke").invoke(ProbeSupport.get(empty, "h"));

        for (long position : new long[]{0, 123456, 4294967400L}) {
            reloadsAt(context, position);
        }
        exceptions(context);

        Fixture fixture = new Fixture(context, 123456);
        Object modifier = modifierCompanion();
        ProbeSupport.setting("refresh_stream", "false");
        ProbeSupport.check(ext("refreshable", new Class<?>[]{Object.class, Object.class}, modifier, fixture.video) == modifier,
                "off preserves exact modifier");
        ProbeSupport.check(errorModifier(modifier, fixture.video) == modifier, "off emitted error panel has no refresh click");
    }

    private static void locate() throws Exception {
        playerType = ProbeSupport.type("rumble.refresh_stream.player", "Lcom/rumble/videoplayer/player/a;");
        qualitySwitch = ProbeSupport.method("rumble.refresh_stream.quality_switch",
                "Lcom/rumble/videoplayer/player/a;->x4(LPg/l;)V");
        videoLoad = ProbeSupport.method("rumble.refresh_stream.video_load",
                "Lcom/rumble/videoplayer/player/a;->n4(LNg/o;)LPg/l;");
        errorView = ProbeSupport.method("rumble.refresh_stream.error_view",
                "LSg/E;->b(Lt1/o;LNg/o;LRg/Q;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;LZ0/r;II)V");
        callbackField = fieldName("rumble.refresh_stream.quality_callback",
                "Lcom/rumble/videoplayer/player/a;->f:Lkotlin/jvm/functions/Function2;");
        sourceField = fieldName("rumble.refresh_stream.current_source", "Lcom/rumble/videoplayer/player/a;->y0:LPg/l;");
        videoType = videoLoad.getParameterTypes()[0];
        sourceType = qualitySwitch.getParameterTypes()[0];
    }

    /** The field name in a recorded field reference ("La;->name:Ltype;"). */
    private static String fieldName(String key, String fallback) {
        String reference = ProbeSupport.locate(key, fallback);
        return reference.substring(reference.indexOf("->") + 2, reference.indexOf(':'));
    }

    /** Two players, a tap on one's error panel: it alone reloads, at the same full position, once per tap. */
    private static void reloadsAt(Context context, long position) throws Exception {
        Fixture a = new Fixture(context, position);
        Fixture b = new Fixture(context, 42);
        a.click();
        a.restored();
        ProbeSupport.check(a.position == position, "reload restores full long position " + position);
        ProbeSupport.check(a.events.equals(Arrays.asList("load", "prepare", "play", "seek")), "stock reload order " + a.events);
        ProbeSupport.check(b.events.isEmpty(), "video selects its player despite lastPlayer pointing elsewhere");
        ProbeSupport.check(Class.forName("Pg.j$g").isInstance(a.status[0]), "fatal state becomes loading");
        a.events.clear();
        a.click();
        a.restored();
        ProbeSupport.check(a.events.size() == 4, "repeated tap reloads once");
        invoke(qualitySwitch, a.player, a.source);
        ProbeSupport.check(a.saves == 1, "direct stock quality switch calls restored callback");
    }

    /** A null source, the stock catch, and an escaping logger failure or Error: the callback is always restored. */
    private static void exceptions(Context context) throws Exception {
        Fixture f = new Fixture(context, 123456);
        ProbeSupport.set(f.player, sourceField, null);
        f.reload();
        ProbeSupport.check(f.events.isEmpty() && ProbeSupport.get(f.player, callbackField) == f.callback,
                "null source is a no-op");
        ProbeSupport.set(f.player, sourceField, f.source);

        f.fail = new IllegalStateException("player boundary failure");
        ProbeSupport.set(f.player, "q", proxy(FUNCTION2, (m, a) -> {
            f.logs++;
            return null;
        }));
        f.reload();
        f.restored();
        ProbeSupport.check(f.logs == 1, "stock Exception catch control");

        f.loggerFailure = new IllegalStateException("logger sentinel");
        ProbeSupport.set(f.player, "q", proxy(FUNCTION2, (m, a) -> {
            throw f.loggerFailure;
        }));
        try {
            f.reload();
            throw new AssertionError("logger failure must escape");
        } catch (IllegalStateException e) {
            ProbeSupport.check(e == f.loggerFailure, "original logger failure preserved");
        }
        f.restored();

        f.fail = new AssertionError("Exo Error sentinel");
        try {
            f.reload();
            throw new AssertionError("Error must escape");
        } catch (AssertionError e) {
            ProbeSupport.check(e == f.fail, "original Error preserved");
        }
        f.restored();
    }

    /** A player with a loaded video and a playing source, its ExoPlayer and Compose state replaced by doubles. */
    static final class Fixture {
        private static long videoId;

        final Object player;
        final Object source;
        final Object video;
        final Object callback;
        final List<String> events = new ArrayList<>();
        final Object[] status;
        long position;
        int saves;
        int logs;
        Throwable fail;
        RuntimeException loggerFailure;

        Fixture(Context context, long position) throws Exception {
            this.position = position;
            player = ProbeSupport.allocate(playerType);
            video = ProbeSupport.allocate(videoType);
            ProbeSupport.set(video, "a", ++videoId);
            source = sourceType.getConstructor(String.class, String.class, int.class, int.class, String.class,
                    String.class, boolean.class).newInstance(SOURCE_URL, "hls", 720, 1234, "720p", "", true);
            callback = proxy(FUNCTION2, (m, a) -> {
                saves++;
                return null;
            });
            status = new Object[]{Class.forName("Pg.j$a").getConstructor(boolean.class).newInstance(false)};
            ProbeSupport.set(player, callbackField, callback);
            ProbeSupport.set(player, "q", proxy(FUNCTION2, (m, a) -> {
                logs++;
                if (loggerFailure != null) throw loggerFailure;
                throw new AssertionError("unexpected stock reload exception", (Throwable) a[1]);
            }));
            ProbeSupport.set(player, "l1", state("Z0.G2", status));
            ProbeSupport.set(player, "k1", state("Z0.a1", status));
            ProbeSupport.set(player, "H1", state("Z0.G2", new Object[]{ProbeSupport.field(Class.forName("Pg.k"), "d").get(null)}));
            ProbeSupport.set(player, "I1", state("Z0.a1", new Object[]{false}));
            ProbeSupport.set(player, "x0", ProbeSupport.field(Class.forName("Pg.i"), "F").get(null));
            ProbeSupport.set(player, "e0", Class.forName("Mg.a").getConstructor(Context.class).newInstance(context));
            ProbeSupport.set(player, "x", proxy("androidx.media3.exoplayer.ExoPlayer", this::exoPlayer));
            // Execute the injected video-registration hook through the stock chooser entry.
            ProbeSupport.set(player, "h0", ProbeSupport.allocate(Class.forName("Mg.e")));
            invoke(videoLoad, player, video);
            ProbeSupport.set(player, sourceField, source);
        }

        private Object exoPlayer(Method m, Object[] a) throws Throwable {
            switch (m.getName()) {
                case "M1": // currentPosition
                    return position;
                case "I0": // setMediaItem
                    events.add("load");
                    Object url = ProbeSupport.get(ProbeSupport.get(a[0], "b"), "a");
                    ProbeSupport.check(SOURCE_URL.equals(url.toString()), "real media item retains source URL");
                    if (fail != null) throw fail;
                    position = 0;
                    return null;
                case "y": // prepare
                    events.add("prepare");
                    return null;
                case "w0": // setPlayWhenReady
                    ProbeSupport.check(Boolean.TRUE.equals(a[0]), "playWhenReady true");
                    events.add("play");
                    return null;
                case "b0": // seekTo
                    position = (Long) a[0];
                    events.add("seek");
                    return null;
                default:
                    throw new AssertionError("unexpected Exo boundary " + m);
            }
        }

        void reload() throws Exception {
            call(playerType, "lurkReload", new Class<?>[]{Object.class}, player);
        }

        void restored() throws Exception {
            ProbeSupport.check(ProbeSupport.get(player, callbackField) == callback, "original quality callback restored after reload");
            ProbeSupport.check(saves == 0, "refresh does not persist a quality selection");
            ProbeSupport.check(ProbeSupport.get(player, sourceField) == source, "original source retained");
        }

        void click() throws Exception {
            Object modifier = errorModifier(modifierCompanion(), video);
            Object onClick = ProbeSupport.get(modifier, "h");
            Class.forName(FUNCTION0).getMethod("invoke").invoke(onClick);
        }
    }

    /** Runs the actual error-panel prefix, stopping at the first Composer observation of its modifier. */
    static Object errorModifier(Object modifier, Object video) throws Exception {
        Object[] composer = {null};
        Object[] captured = {null};
        RuntimeException stop = new RuntimeException("stop before Compose rendering");
        composer[0] = proxy("Z0.r", (m, a) -> {
            if (m.getName().equals("j")) return composer[0];
            if (m.getName().equals("Z")) {
                captured[0] = a[0];
                throw stop;
            }
            throw new AssertionError("unexpected Composer prefix call " + m);
        });
        Object fn = proxy(FUNCTION0, (m, a) -> null);
        Class<?> screen = errorView.getParameterTypes()[2];
        try {
            invoke(errorView, null, modifier, video, ProbeSupport.field(screen, "B").get(null), fn, fn, composer[0], 0, 0);
            throw new AssertionError("error panel did not reach Composer boundary");
        } catch (RuntimeException e) {
            if (e != stop) throw e;
        }
        ProbeSupport.check(captured[0] != null, "error panel passes modified parameter to Composer");
        return captured[0];
    }

    private static Object modifierCompanion() throws Exception {
        Class<?> modifier = errorView.getParameterTypes()[0];
        for (Field f : modifier.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) && modifier.isAssignableFrom(f.getType())) {
                f.setAccessible(true);
                return f.get(null);
            }
        }
        throw new AssertionError("no Modifier companion");
    }

    interface Body {
        Object call(Method m, Object[] args) throws Throwable;
    }

    /** A double for an interface: equals, hashCode and toString answered here, everything else by {@code body}. */
    static Object proxy(String type, Body body) throws Exception {
        Class<?> c = Class.forName(type);
        return Proxy.newProxyInstance(c.getClassLoader(), new Class<?>[]{c}, (p, m, a) -> {
            switch (m.getName()) {
                case "equals":
                    return p == a[0];
                case "hashCode":
                    return System.identityHashCode(p);
                case "toString":
                    return "RefreshProbe boundary " + type;
                default:
                    return body.call(m, a);
            }
        });
    }

    /** A Compose state double holding value[0]. */
    static Object state(String type, Object[] value) throws Exception {
        return proxy(type, (m, a) -> {
            if (m.getName().equals("getValue")) return value[0];
            if (m.getName().equals("setValue")) {
                value[0] = a[0];
                return null;
            }
            throw new AssertionError("unexpected state call " + m);
        });
    }

    static Object call(Object target, String name, Class<?>[] types, Object... args) throws Exception {
        Class<?> owner = target instanceof Class ? (Class<?>) target : target.getClass();
        Method m = owner.getDeclaredMethod(name, types);
        return invoke(m, target instanceof Class ? null : target, args);
    }

    /** Invokes {@code m}, rethrowing what it throws as itself. */
    static Object invoke(Method m, Object target, Object... args) throws Exception {
        m.setAccessible(true);
        try {
            return m.invoke(target, args);
        } catch (InvocationTargetException e) {
            Throwable t = e.getCause();
            if (t instanceof Error) throw (Error) t;
            if (t instanceof Exception) throw (Exception) t;
            throw e;
        }
    }

    static Object ext(String name, Class<?>[] types, Object... args) throws Exception {
        return call(Class.forName(EXT), name, types, args);
    }
}
