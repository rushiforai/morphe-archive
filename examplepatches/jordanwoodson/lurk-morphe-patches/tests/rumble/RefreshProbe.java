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
 * Only the platform and player edges are doubles: the Composer, ExoPlayer, Compose state and the player's logger.
 */
public final class RefreshProbe {
    private static final String EXT = "io.github.jordanwoodson.extension.shared.rumble.RumblePlayer";
    private static final String FUNCTION0 = "kotlin.jvm.functions.Function0";
    private static final String FUNCTION2 = "kotlin.jvm.functions.Function2";
    private static final String EXO_PLAYER = "androidx.media3.exoplayer.ExoPlayer";
    private static final String SOURCE_URL = "https://example.invalid/refresh.m3u8";

    // The player class, its quality switch, video load, start-source chooser, error panel and current source come
    // from the patch's locators. The doubles are found by type: ExoPlayer and Kotlin's function interfaces keep
    // their names, Compose state by its getValue, the Composer and the panel's arguments from the panel's
    // parameters. ExoPlayer's renamed methods are told apart by signature, so nothing here pins an R8 name.
    private static Class<?> playerType;
    private static Class<?> videoType;
    private static Class<?> sourceType;
    private static Class<?> chooserType;
    private static Method qualitySwitch;
    private static Method videoLoad;
    private static Method errorView;
    private static String sourceField;

    public static void main(String[] args) {
        ProbeSupport.run("actual refresh click, stock seek and reload failures", RefreshProbe::run);
    }

    private static void run() throws Exception {
        locate();
        if (Looper.myLooper() == null) Looper.prepareMainLooper();

        // No registered player is harmless, including the actual click lambda.
        Object empty = ext("refreshable", new Class<?>[]{Object.class, Object.class}, modifierCompanion(), null);
        invoke0(onClick(empty));

        for (long position : new long[]{0, 123456, 4294967400L}) {
            reloadsAt(position);
        }
        exceptions();

        Fixture fixture = new Fixture(123456);
        Object modifier = modifierCompanion();
        ProbeSupport.setting("refresh_stream", "false");
        ProbeSupport.check(ext("refreshable", new Class<?>[]{Object.class, Object.class}, modifier, fixture.video) == modifier,
                "off preserves exact modifier");
        ProbeSupport.check(errorModifier(modifier, fixture.video) == modifier, "off emitted error panel has no refresh click");
    }

    private static void locate() throws Exception {
        playerType = ProbeSupport.type("rumble.refresh_stream.player", "Lcom/rumble/videoplayer/player/a;");
        qualitySwitch = ProbeSupport.method("rumble.refresh_stream.quality_switch",
                "Lcom/rumble/videoplayer/player/a;->P4(LWg/m;)V");
        videoLoad = ProbeSupport.method("rumble.refresh_stream.video_load",
                "Lcom/rumble/videoplayer/player/a;->F4(LUg/s;)LWg/m;");
        chooserType = ProbeSupport.method("rumble.refresh_stream.chooser", "LTg/g;->c(Ljava/util/List;IZZ)LWg/m;")
                .getDeclaringClass();
        errorView = ProbeSupport.method("rumble.refresh_stream.error_view",
                "LZg/M;->b(Ls1/o;LUg/s;LYg/S;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;LY0/r;II)V");
        sourceField = ProbeSupport.fieldName("rumble.refresh_stream.current_source",
                "Lcom/rumble/videoplayer/player/a;->y0:LWg/m;");
        videoType = videoLoad.getParameterTypes()[0];
        sourceType = qualitySwitch.getParameterTypes()[0];
    }

    /** Two players, a tap on one's error panel: it alone reloads, at the same full position, once per tap. */
    private static void reloadsAt(long position) throws Exception {
        Fixture a = new Fixture(position);
        Fixture b = new Fixture(42);
        a.click();
        a.retained();
        ProbeSupport.check(a.position == position, "reload restores full long position " + position);
        ProbeSupport.check(a.events.equals(Arrays.asList("load", "prepare", "play", "seek")), "stock reload order " + a.events);
        ProbeSupport.check(b.events.isEmpty(), "video selects its player despite lastPlayer pointing elsewhere");
        ProbeSupport.check(a.playing(), "the player's status becomes Playing (buffering)");
        a.events.clear();
        a.click();
        a.retained();
        ProbeSupport.check(a.events.size() == 4, "repeated tap reloads once");
    }

    /** A null source, the stock catch, and an escaping logger failure or Error: each reaches the caller as itself. */
    private static void exceptions() throws Exception {
        Fixture f = new Fixture(123456);
        ProbeSupport.set(f.player, sourceField, null);
        f.reload();
        ProbeSupport.check(f.events.isEmpty() && f.logs == 0, "null source is a no-op");
        ProbeSupport.set(f.player, sourceField, f.source);

        f.fail = new IllegalStateException("player boundary failure");
        f.reload();
        f.retained();
        ProbeSupport.check(f.logs == 1, "stock Exception catch control");

        f.loggerFailure = new IllegalStateException("logger sentinel");
        try {
            f.reload();
            throw new AssertionError("logger failure must escape");
        } catch (IllegalStateException e) {
            ProbeSupport.check(e == f.loggerFailure, "original logger failure preserved");
        }
        f.retained();

        f.fail = new AssertionError("Exo Error sentinel");
        try {
            f.reload();
            throw new AssertionError("Error must escape");
        } catch (AssertionError e) {
            ProbeSupport.check(e == f.fail, "original Error preserved");
        }
        f.retained();
    }

    /** A player with a loaded video and a playing source, its ExoPlayer, Compose state and logger replaced by doubles. */
    static final class Fixture {
        private static long videoId;

        final Object player;
        final Object source;
        final Object video;
        final List<String> events = new ArrayList<>();
        final List<Object[]> states = new ArrayList<>();
        long position;
        int logs;
        Throwable fail;
        RuntimeException loggerFailure;

        Fixture(long position) throws Exception {
            this.position = position;
            player = ProbeSupport.allocate(playerType);
            video = ProbeSupport.allocate(videoType);
            // The video's equals and hashCode compare its ID, the first of its long fields.
            long id = ++videoId;
            for (Field f : videoType.getDeclaredFields()) {
                if (!Modifier.isStatic(f.getModifiers()) && f.getType() == long.class) {
                    f.setAccessible(true);
                    f.set(video, id);
                }
            }
            source = sourceType.getConstructor(String.class, String.class, int.class, int.class, String.class,
                    String.class, boolean.class).newInstance(SOURCE_URL, "hls", 720, 1234, "720p", "", true);
            Object exo = proxy(EXO_PLAYER, this::exoPlayer);
            Object logger = proxy(FUNCTION2, (m, a) -> {
                logs++;
                if (loggerFailure != null) throw loggerFailure;
                if (fail == null) throw new AssertionError("unexpected stock reload exception", (Throwable) a[1]);
                return null;
            });
            for (Field f : playerType.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                Class<?> type = f.getType();
                f.setAccessible(true);
                if (type.getName().equals(EXO_PLAYER)) {
                    f.set(player, exo);
                } else if (type.getName().equals(FUNCTION2)) {
                    f.set(player, logger);
                } else if (type == chooserType) {
                    f.set(player, ProbeSupport.allocate(chooserType));
                } else if (type.isInterface() && hasGetter(type)) {
                    Object[] value = {Boolean.FALSE};
                    states.add(value);
                    f.set(player, state(type, value));
                } else if (type.isEnum()) {
                    // The player's screen: IN_LIST keeps the switch's progress report to the position.
                    for (Object constant : type.getEnumConstants()) {
                        if (((Enum<?>) constant).name().equals("IN_LIST")) f.set(player, constant);
                    }
                }
            }
            // Execute the injected video-registration hooks through the stock chooser entry.
            invoke(videoLoad, player, video);
            ProbeSupport.set(player, sourceField, source);
        }

        /** ExoPlayer's methods are renamed, so they are told apart by what the quality switch passes them. */
        private Object exoPlayer(Method m, Object[] a) throws Throwable {
            Class<?>[] p = m.getParameterTypes();
            Class<?> r = m.getReturnType();
            if (r == long.class && p.length == 0) return position; // currentPosition
            if (r == void.class && p.length == 1 && !p[0].isPrimitive()) { // setMediaItem
                events.add("load");
                ProbeSupport.check(holds(a[0], SOURCE_URL, 3), "real media item retains source URL");
                if (fail != null) throw fail;
                position = 0;
                return null;
            }
            if (r == void.class && p.length == 0) { // prepare
                events.add("prepare");
                return null;
            }
            if (r == void.class && p.length == 1 && p[0] == boolean.class) { // setPlayWhenReady
                ProbeSupport.check(Boolean.TRUE.equals(a[0]), "playWhenReady true");
                events.add("play");
                return null;
            }
            if (r == void.class && p.length == 1 && p[0] == long.class) { // seekTo
                position = (Long) a[0];
                events.add("seek");
                return null;
            }
            throw new AssertionError("unexpected Exo boundary " + m);
        }

        void reload() throws Exception {
            call(playerType, "lurkReload", new Class<?>[]{Object.class}, player);
        }

        void retained() throws Exception {
            ProbeSupport.check(ProbeSupport.get(player, sourceField) == source, "original source retained");
        }

        /** Whether the switch set one of the player's states to Playing while buffering (Rumble's toString). */
        boolean playing() {
            for (Object[] value : states) {
                if (String.valueOf(value[0]).equals("Playing(isBuffering=true)")) return true;
            }
            return false;
        }

        void click() throws Exception {
            invoke0(onClick(errorModifier(modifierCompanion(), video)));
        }
    }

    /** Runs the actual error-panel prefix, stopping at the first Composer observation of its modifier. */
    static Object errorModifier(Object modifier, Object video) throws Exception {
        Class<?>[] parameters = errorView.getParameterTypes();
        Class<?> composerType = parameters[5];
        Object[] composer = {null};
        Object[] captured = {null};
        RuntimeException stop = new RuntimeException("stop before Compose rendering");
        composer[0] = proxy(composerType.getName(), (m, a) -> {
            if (m.getReturnType() == composerType) return composer[0]; // startRestartGroup
            if (m.getReturnType() == boolean.class && Arrays.equals(m.getParameterTypes(), new Class<?>[]{Object.class})) {
                captured[0] = a[0]; // changed(modifier)
                throw stop;
            }
            throw new AssertionError("unexpected Composer prefix call " + m);
        });
        Object fn = proxy(FUNCTION0, (m, a) -> null);
        Object screen = parameters[2].getEnumConstants()[0];
        try {
            invoke(errorView, null, modifier, video, screen, fn, fn, composer[0], 0, 0);
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

    /** The onClick of a clickable modifier: its one Function0 field. */
    private static Object onClick(Object modifier) throws Exception {
        Class<?> function0 = Class.forName(FUNCTION0);
        Object found = null;
        for (Class<?> c = modifier.getClass(); c != null; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getType() != function0) continue;
                if (found != null) throw new AssertionError("several Function0 fields in " + modifier.getClass());
                f.setAccessible(true);
                found = f.get(modifier);
            }
        }
        if (found == null) throw new AssertionError("no onClick in " + modifier.getClass());
        return found;
    }

    /** Calls a Function0 through its one method, whatever R8 named it. */
    private static void invoke0(Object function) throws Exception {
        Method[] methods = Class.forName(FUNCTION0).getMethods();
        ProbeSupport.check(methods.length == 1, "Function0 has one method");
        invoke(methods[0], function);
    }

    private static boolean hasGetter(Class<?> type) {
        for (Method m : type.getMethods()) {
            if (m.getName().equals("getValue") && m.getParameterCount() == 0) return true;
        }
        return false;
    }

    /** Whether {@code value} or an object it holds (up to {@code depth} fields down) is {@code url}. */
    private static boolean holds(Object value, String url, int depth) throws Exception {
        if (value == null) return false;
        if ((value instanceof String || value instanceof android.net.Uri) && url.equals(value.toString())) return true;
        if (depth == 0 || value.getClass().isPrimitive() || value.getClass().getName().startsWith("java.")) return false;
        for (Class<?> c = value.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                f.setAccessible(true);
                if (holds(f.get(value), url, depth - 1)) return true;
            }
        }
        return false;
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

    /** A Compose state double of {@code type} holding value[0]. */
    static Object state(Class<?> type, Object[] value) throws Exception {
        return proxy(type.getName(), (m, a) -> {
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
