package software.santodan.extension.nuviomenu;

import software.santodan.nuvio.NuvioNative;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** A shared native Layout section; optional runtime bridges are discovered independently. */
public final class NuvioSettingsMenu {
    private static final String TAG = "SantodanSettings";
    private static final String[] BRIDGES = {
        "software.santodan.extension.nuviomerged.NuvioMergedProgress",
        "software.santodan.extension.nuvioremaining.NuvioRemainingEpisodes",
        "software.santodan.extension.nuvioairing.NuvioAiringSeries",
        "software.santodan.extension.nuviofinale.NuvioFinaleDates",
        "software.santodan.extension.nuviomovierelease.NuvioMovieReleaseDates",
        "software.santodan.extension.nuviocwstreams.NuvioContinueWatchingStreams",
        "software.santodan.extension.nuviodetailstreams.NuvioDetailStreams",
        "software.santodan.extension.nuvionextstreams.NuvioNextEpisodeStreams",
        "software.santodan.extension.nuviocurrentstream.NuvioCurrentStream",
        "software.santodan.extension.nuviopreferred.NuvioPreferredAddon",
        "software.santodan.extension.nuviolauncher.NuvioLauncherChannels",
        "software.santodan.extension.nuviobuttons.NuvioPlaybackButtons",
        "software.santodan.extension.nuviointro.NuvioIntroDb"
    };
    private static volatile Object expandedState;
    private NuvioSettingsMenu() {}

    public static void addMenu(Object lazyScope) {
        try {
            ClassLoader loader = lazyScope.getClass().getClassLoader();
            Object key = callback(loader, "Function1", args -> "Santodan-Patches");
            Object type = callback(loader, "Function1", args -> "santodan-settings");
            Object content = composable(loader, "Function4", 0x53414e54, args -> {
                renderMenu(args[2]);
                return unit(loader);
            });
            method(lazyScope.getClass(), "q", 4).invoke(lazyScope, 1, key, type, content);
        } catch (Throwable error) { Log.e(TAG, "Layout menu insertion failed", error); }
    }

    public static void renderMenu(Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object state = expandedState(loader);
            boolean expanded = (Boolean) method(state.getClass(), "getValue", 0).invoke(state);
            Object toggle = callback(loader, "Function0", args -> {
                boolean value = (Boolean) method(state.getClass(), "getValue", 0).invoke(state);
                method(state.getClass(), "setValue", 1).invoke(state, !value);
                return unit(loader);
            });
            Object noop = callback(loader, "Function0", args -> unit(loader));
            Object content = composable(loader, "Function3", 0x53414e55, args -> {
                renderInstalled(args[1]);
                return unit(loader);
            });
            Field modifier = Class.forName(NuvioNative.EMPTY_MODIFIER_NAME, false, loader).getDeclaredField("b");
            modifier.setAccessible(true);
            method(Class.forName(NuvioNative.SETTINGS_SECTION_NAME, false, loader), "a", 11).invoke(null,
                "Santodan-Patches", "Settings for installed Santodan patches", expanded,
                toggle, modifier.get(null), null, null, noop, content, composer, 0);
        } catch (Throwable error) { Log.e(TAG, "Layout menu rendering failed", error); }
    }

    private static void renderInstalled(Object composer) {
        ClassLoader loader = composer.getClass().getClassLoader();
        renderGroup(composer, loader, "Continue Watching", 0, 3);
        renderGroup(composer, loader, "UI", 3, 5);
        for (int index = 2; index < 5; index++) {
            try {
                Class.forName(BRIDGES[index], false, loader);
                NuvioDateLabelStyle.renderSettings(composer, "", "Date label appearance");
                break;
            } catch (ClassNotFoundException absent) {
                // Show appearance controls only when at least one date-label patch is installed.
            } catch (Throwable error) { Log.e(TAG, "Date label settings failed", error); break; }
        }
        renderGroup(composer, loader, "Streams", 5, 10);
        renderGroup(composer, loader, "Android TV launcher", 10, 11);
        renderGroup(composer, loader, "Playback", 11, BRIDGES.length);
        try {
            Class.forName("software.santodan.extension.nuviomenu.SettingsTransferActivity", false, loader)
                .getMethod("renderSettings", Object.class).invoke(null, composer);
        } catch (ClassNotFoundException absent) {
            // Optional in host fixtures; the side-by-side patch registers the activity.
        } catch (Throwable error) { Log.e(TAG, "Settings transfer rendering failed", error); }
    }

    private static void renderGroup(Object composer, ClassLoader loader, String label, int start, int end) {
        boolean labelled = false;
        for (int index = start; index < end; index++) {
            String bridge = BRIDGES[index];
            try {
                Method render = Class.forName(bridge, false, loader).getMethod("renderSettings", Object.class);
                if (!labelled) {
                    // Native SettingsSectionLabel: non-focusable text with the app's spacing and typography.
                    Field modifier = Class.forName(NuvioNative.EMPTY_MODIFIER_NAME, false, loader).getDeclaredField("b");
                    modifier.setAccessible(true);
                    method(Class.forName(NuvioNative.SETTINGS_SECTION_NAME, false, loader), "e", 6)
                        .invoke(null, 0, 4, composer, label, null, modifier.get(null));
                    labelled = true;
                }
                render.invoke(null, composer);
            } catch (ClassNotFoundException absent) {
                // A patch can be selected independently; absent patches have no settings.
            } catch (Throwable error) { Log.e(TAG, "Patch settings failed: " + bridge, error); }
        }
    }

    private static synchronized Object expandedState(ClassLoader loader) throws Exception {
        if (expandedState == null) {
            Method factory = Class.forName(NuvioNative.COMPOSE_FACTORY_NAME, false, loader).getDeclaredMethod(NuvioNative.STATE_FACTORY_METHOD, Object.class);
            factory.setAccessible(true);
            expandedState = factory.invoke(null, false);
        }
        return expandedState;
    }

    private interface Callback { Object invoke(Object[] args) throws Exception; }
    private static Object callback(ClassLoader loader, String name, Callback callback) throws Exception {
        Class<?> contract = Class.forName("kotlin.jvm.functions." + name, false, loader);
        return Proxy.newProxyInstance(loader, new Class<?>[]{contract}, (proxy, called, args) -> {
            if ("invoke".equals(called.getName())) return callback.invoke(args);
            if ("hashCode".equals(called.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(called.getName())) return proxy == args[0];
            if ("toString".equals(called.getName())) return "SantodanSettingsCallback";
            return null;
        });
    }
    private static Object composable(ClassLoader loader, String function, int key, Callback content) throws Exception {
        return Class.forName(NuvioNative.COMPOSABLE_LAMBDA_NAME, false, loader).getDeclaredConstructor(int.class, Object.class, boolean.class)
            .newInstance(key, callback(loader, function, content), true);
    }
    private static Object unit(ClassLoader loader) throws Exception {
        Class<?> unit = Class.forName("kotlin.Unit", false, loader);
        try { return unit.getField("INSTANCE").get(null); }
        catch (NoSuchFieldException renamed) { return unit.getField("a").get(null); }
    }
    private static Method method(Class<?> owner, String name, int parameters) throws NoSuchMethodException {
        for (Method method : owner.getDeclaredMethods()) {
            if (name.equals(method.getName()) && method.getParameterCount() == parameters) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new NoSuchMethodException(owner.getName() + '.' + name + '/' + parameters);
    }
}
