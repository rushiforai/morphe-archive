package software.santodan.extension.nuviomenu;

import software.santodan.nuvio.NuvioNative;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Native TV settings and reflection-only Compose rendering shared by every date-label patch. */
public final class NuvioDateLabelStyle {
    private static final String PREFS = "santodan_nuvio_date_label_style";
    private static final Map<String, Object> STATES = new ConcurrentHashMap<>();
    private NuvioDateLabelStyle() {}

    public static void renderSettings(Object composer, String ignored, String title) throws Exception {
        String scope = PREFS;
        ClassLoader loader = composer.getClass().getClassLoader();
        Object expanded = state(loader, scope + ":expanded", false);
        Object dialog = state(loader, scope + ":dialog", -1);
        subscribe(loader, scope);
        Object toggle = callback(loader, "Function0", args -> {
            set(expanded, !((Boolean) get(expanded))); return unit(loader);
        });
        Object noop = callback(loader, "Function0", args -> unit(loader));
        Object body = Class.forName(NuvioNative.COMPOSABLE_LAMBDA_NAME, false, loader).getDeclaredConstructor(int.class, Object.class, boolean.class)
            .newInstance(scope.hashCode(), callback(loader, "Function3", args -> {
                renderRows(args[1], scope, dialog); return unit(loader);
            }), true);
        method(Class.forName(NuvioNative.SETTINGS_SECTION_NAME, false, loader), "a", 11).invoke(null,
            title, "Position, label size and color, font size and color", get(expanded),
            toggle, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), null, null, noop, body, composer, 0);
        int property = ((Number) get(dialog)).intValue();
        if (property < 0 || property >= DateLabelStyle.KEYS.length) return;
        if (property == 2 || property == 4) {
            renderColorDialog(composer, scope, property, dialog);
            return;
        }
        String[] choices = DateLabelStyle.choices(property);
        java.util.ArrayList<Object> options = new java.util.ArrayList<>();
        Class<?> optionType = Class.forName(NuvioNative.SETTINGS_ROWS_NAME.equals(rowsOwner()) ? NuvioNative.SETTINGS_PICKER_NAME : NuvioNative.SETTINGS_PICKER_NAME, false, loader);
        java.lang.reflect.Constructor<?> option = Arrays.stream(optionType.getDeclaredConstructors())
            .filter(value -> value.getParameterCount() == 6).findFirst().orElseThrow();
        option.setAccessible(true);
        for (String value : choices) options.add(option.newInstance(value, value, null, null, null, 28));
        Object select = callback(loader, "Function1", args -> {
            int value = Arrays.asList(choices).indexOf(args[0]);
            if (value >= 0) {
                preferences(scope).edit().putInt(key(property), value).apply();
                Object revision = state(loader, scope + ":revision", 0);
                set(revision, ((Number) get(revision)).intValue() + 1);
            }
            set(dialog, -1); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(dialog, -1); return unit(loader); });
        method(Class.forName(rowsOwner(), false, loader), "j", 11).invoke(null,
            DateLabelStyle.TITLES[property], options, choices[choice(scope, property)],
            // R8 removes the width/height default branches; supply real dp values.
            select, dismiss, null, 420f, 320f, composer, 0, 32);
    }

    private static void renderRows(Object composer, String scope, Object dialog) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        for (int property = 0; property < DateLabelStyle.KEYS.length; property++) {
            final int selected = property;
            Object noop = callback(loader, "Function0", args -> unit(loader));
            if (property == 1 || property == 3) {
                int percent = percent(scope, property);
                Object change = callback(loader, "Function1", args -> {
                    preferences(scope).edit().putInt(percentKey(selected), ((Number) args[0]).intValue()).apply();
                    revise(loader, scope); return unit(loader);
                });
                method(Class.forName(playbackOwner(), false, loader), "h", 14).invoke(null,
                    DateLabelStyle.TITLES[property], percent, percent + "%", 50, 200, 10, change,
                    null, noop, true, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), composer, 0, 128);
                continue;
            }
            Object click = callback(loader, "Function0", args -> { set(dialog, selected); return unit(loader); });
            if (property == 2 || property == 4) {
                long color = color(scope, property);
                method(Class.forName(playbackOwner(), false, loader), "c", 9).invoke(null,
                    DateLabelStyle.TITLES[property], color, property == 2 && color == 0L,
                    click, noop, true, composer, 0, 0);
            } else {
                method(Class.forName(rowsOwner(), false, loader), "a", 18).invoke(null,
                    DateLabelStyle.TITLES[property], null, DateLabelStyle.choices(property)[choice(scope, property)],
                    click, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
            }
        }
        Object reset = callback(loader, "Function0", args -> {
            SharedPreferences.Editor editor = preferences(scope).edit();
            for (int property = 0; property < DateLabelStyle.KEYS.length; property++) {
                editor.remove(key(property)).remove(percentKey(property)).remove(colorKey(property));
            }
            editor.apply();
            Object revision = state(loader, scope + ":revision", 0);
            set(revision, ((Number) get(revision)).intValue() + 1);
            return unit(loader);
        });
        Object noop = callback(loader, "Function0", args -> unit(loader));
        method(Class.forName(rowsOwner(), false, loader), "a", 18).invoke(null,
            "Reset date label appearance", "Restore the default style for all date labels.", null,
            reset, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
    }

    /** Returns modifier, foreground Color, font TextUnit and native TextStyle. */
    public static Object[] build(ClassLoader loader, Object boxScope, Object composer, String shapeOwner, String ignored) throws Exception {
        String scope = PREFS;
        subscribe(loader, scope);
        Object typography = method(composer.getClass(), "j", 1).invoke(composer, staticValue(loader, NuvioNative.TEXT_STYLE_LOCAL_NAME, "a"));
        Object textStyle = field(typography.getClass(), "o").get(typography);
        Object modifier = staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b");
        modifier = method(boxScope.getClass(), "a", 2).invoke(boxScope, modifier,
            staticValue(loader, NuvioNative.ALIGNMENTS_NAME, DateLabelStyle.alignment(choice(scope, 0))));
        Class<?> modifierType = Class.forName(NuvioNative.MODIFIER_NAME, false, loader);
        java.lang.reflect.Constructor<?> layer = Class.forName(NuvioNative.GRAPHICS_MODIFIER_NAME, false, loader).getDeclaredConstructor(float.class);
        layer.setAccessible(true);
        modifier = modifierType.getMethod("d", modifierType).invoke(modifier, layer.newInstance(10f));
        // Fixed inset from the card edge; only inner padding changes label size.
        modifier = method(Class.forName("e0.b", false, loader), "u", 2).invoke(null, modifier, 6f);
        modifier = method(Class.forName("b2.j", false, loader), "b", 2).invoke(null, modifier, staticValue(loader, shapeOwner, "a"));
        modifier = method(Class.forName("y.m", false, loader), "g", 3).invoke(null, modifier,
            color(scope, 2), staticValue(loader, "e2.i0", "b"));
        float scale = percent(scope, 1) / 100f;
        Object spacing = staticValue(loader, NuvioNative.NATIVE_SPACING_LOCAL_NAME, "a");
        float horizontal = field(spacing.getClass(), "e").getFloat(spacing);
        float vertical = field(spacing.getClass(), "d").getFloat(spacing);
        Object span = field(textStyle.getClass(), "a").get(textStyle);
        long nativeFont = field(span.getClass(), "b").getLong(span);
        float font = Float.intBitsToFloat((int) nativeFont) * percent(scope, 3) / 100f;
        long fontSize = (nativeFont & 0xffffffff00000000L) | (Float.floatToRawIntBits(font) & 0xffffffffL);
        modifier = method(Class.forName("e0.b", false, loader), "v", 3).invoke(null, modifier,
            horizontal * scale, vertical * scale);
        return new Object[]{modifier, color(scope, 4), fontSize, textStyle};
    }

    private static String playbackOwner() { return NuvioNative.SETTINGS_STYLE_NAME; }
    private static String percentKey(int property) { return "date_label_" + DateLabelStyle.KEYS[property] + "_percent"; }
    private static String colorKey(int property) { return "date_label_" + DateLabelStyle.KEYS[property] + "_color"; }
    private static int percent(String scope, int property) throws Exception {
        int value = preferences(scope).getInt(percentKey(property), 100);
        return value >= 50 && value <= 200 && value % 10 == 0 ? value : 100;
    }
    private static long color(String scope, int property) throws Exception {
        return preferences(scope).getLong(colorKey(property), DateLabelStyle.color(property, choice(scope, property)));
    }
    private static void revise(ClassLoader loader, String scope) throws Exception {
        Object revision = state(loader, scope + ":revision", 0);
        set(revision, ((Number) get(revision)).intValue() + 1);
    }
    private static void renderColorDialog(Object composer, String scope, int property, Object dialog) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        int[] palette = new int[]{0xffffffff, 0xffd9d9d9, 0xffffff00, 0xff00ffff, 0xff00ff00,
                0xffff00ff, 0xffff6b6b, 0xffffa500, 0xff90ee90};
        java.lang.reflect.Constructor<?> box = Class.forName(NuvioNative.COLOR_NAME, false, loader).getDeclaredConstructor(long.class);
        box.setAccessible(true);
        java.util.ArrayList<Object> colors = new java.util.ArrayList<>();
        if (property == 2) colors.add(box.newInstance(0L));
        for (int value : palette) colors.add(box.newInstance(((long) value) << 32));
        Object select = callback(loader, "Function1", args -> {
            long packed = field(args[0].getClass(), "a").getLong(args[0]);
            preferences(scope).edit().putLong(colorKey(property), packed).apply();
            revise(loader, scope); set(dialog, -1); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(dialog, -1); return unit(loader); });
        method(Class.forName(playbackOwner(), false, loader), "b", 9).invoke(null,
            DateLabelStyle.TITLES[property], colors, color(scope, property), property == 2,
            select, dismiss, composer, 0, 0);
    }

    private static String key(int property) { return "date_label_" + DateLabelStyle.KEYS[property]; }
    private static int choice(String scope, int property) throws Exception {
        return DateLabelStyle.valid(property, preferences(scope).getInt(key(property), DateLabelStyle.defaultChoice(property)));
    }
    private static void subscribe(ClassLoader loader, String scope) throws Exception { get(state(loader, scope + ":revision", 0)); }
    private static synchronized Object state(ClassLoader loader, String key, Object initial) throws Exception {
        Object state = STATES.get(key);
        if (state == null) { state = method(Class.forName(NuvioNative.COMPOSE_FACTORY_NAME, false, loader), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, initial); STATES.put(key, state); }
        return state;
    }
    private static Object get(Object state) throws Exception { return method(state.getClass(), "getValue", 0).invoke(state); }
    private static void set(Object state, Object value) throws Exception { method(state.getClass(), "setValue", 1).invoke(state, value); }
    private static Application application() throws Exception { return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null); }
    private static SharedPreferences preferences(String scope) throws Exception { return application().getSharedPreferences(scope, Context.MODE_PRIVATE); }
    private static String rowsOwner() { return NuvioNative.SETTINGS_ROWS_NAME; }
    private interface Callback { Object invoke(Object[] args) throws Exception; }
    private static Object callback(ClassLoader loader, String type, Callback action) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{Class.forName("kotlin.jvm.functions." + type, false, loader)}, (proxy, method, args) -> {
            if ("invoke".equals(method.getName())) return action.invoke(args);
            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(method.getName())) return proxy == args[0];
            return "DateLabelSettingsCallback";
        });
    }
    private static Object unit(ClassLoader loader) throws Exception {
        Class<?> unit = Class.forName("kotlin.Unit", false, loader);
        try { return unit.getField("INSTANCE").get(null); } catch (NoSuchFieldException ignored) { return unit.getField("a").get(null); }
    }
    private static Object staticValue(ClassLoader loader, String owner, String name) throws Exception { return field(Class.forName(owner, false, loader), name).get(null); }
    private static Field field(Class<?> owner, String name) throws Exception { Field field = owner.getDeclaredField(name); field.setAccessible(true); return field; }
    private static Method method(Class<?> owner, String name, int count) throws Exception {
        for (Method method : owner.getDeclaredMethods()) if (method.getName().equals(name) && method.getParameterCount() == count) { method.setAccessible(true); return method; }
        throw new NoSuchMethodException(owner.getName() + '.' + name);
    }
}
