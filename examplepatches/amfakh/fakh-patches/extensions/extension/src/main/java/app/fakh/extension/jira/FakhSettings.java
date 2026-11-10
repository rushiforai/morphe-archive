package app.fakh.extension.jira;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RestartBar;
import app.fakh.extension.shared.TabSheet;

/**
 * The Fakh Patches category of Jira's Settings: a card of switch rows between the Language/Theme card and the Quick
 * Lock card, built from the app's own composables by reflection so the rows look like its own. Changing a switch
 * saves it and offers a restart in a snackbar, since the palettes and the bar are built once.
 */
public final class FakhSettings {
    /** Keys of the rows' content items, which only have to differ from each other. */
    private static final int ROW_KEY = 0x46414B30;
    private static final int CARD_KEY = 0x46414B3F;
    /** Number of the first switch that belongs to a tab, and the number of the row that opens the tab sheet. */
    private static final int FIRST_TAB = 4;
    private static final int TABS_ROW = 4;

    private static WeakReference<Activity> current = new WeakReference<>(null);
    /** A Compose state that counts the switches flipped, so the rows are drawn again when one is. */
    private static Object version;

    private FakhSettings() {
    }

    /** Keeps the activity that is being created, for the snackbar. */
    static void remember(Activity activity) {
        current = new WeakReference<>(activity);
    }

    /**
     * Injected after the Language/Theme card of the main Settings list: draws the Fakh Patches card with the app's own
     * card composable.
     *
     * @param composer the Compose composer of the screen, which is only read
     */
    public static void addCard(Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> items = Class.forName("com.atlassian.jira.infrastructure.compose.ui.SpacedItemsKt", true, loader);
            Class<?> function1 = Class.forName("kotlin.jvm.functions.Function1", true, loader);
            Method card = null;
            for (Method method : items.getDeclaredMethods()) {
                if (method.getName().equals("a") && method.getParameterTypes().length == 7) card = method;
            }
            if (card == null) return;
            version = remember(composer, loader);
            Object builder = Proxy.newProxyInstance(loader, new Class<?>[] {function1}, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    if (args == null || args.length != 1) return MaterialYou.objectMethod(proxy, method, args);
                    addRows(args[0]);
                    return null;
                }
            });
            // Modifier, gap and shape are the card's own defaults.
            card.invoke(null, null, 0f, null, builder, composer, 0, 1 | 2 | 4);
        } catch (Throwable error) {
            android.util.Log.w("FakhPatches", "Settings card", error);
        }
    }

    /** A Compose state kept across recompositions of the screen, made through the composer's remember slots. */
    private static Object remember(Object composer, ClassLoader loader) throws ReflectiveOperationException {
        Class<?> composerType = composer.getClass();
        Method read = null;
        Method write = null;
        for (Method method : composerType.getMethods()) {
            if (method.getName().equals("m0") && method.getParameterTypes().length == 0) read = method;
            if (method.getName().equals("P0") && method.getParameterTypes().length == 1) write = method;
        }
        if (read == null || write == null) return null;
        Object empty = Class.forName("oy3", true, loader).getField("b").get(null);
        Object cached = read.invoke(composer);
        if (cached != empty) return cached;
        Object policy = Class.forName("wzd", true, loader).getField("e").get(null);
        Object state = null;
        for (Method make : Class.forName("apn", true, loader).getDeclaredMethods()) {
            Class<?>[] types = make.getParameterTypes();
            if (make.getName().equals("a") && types.length == 2 && types[0] == Object.class && types[1].isInstance(policy)) {
                state = make.invoke(null, 0, policy);
                break;
            }
        }
        if (state == null) throw new NoSuchMethodException("mutableStateOf");
        write.invoke(composer, state);
        return state;
    }

    /** Adds every Fakh Patches row to the card's list scope. */
    private static void addRows(Object scope) {
        try {
            ClassLoader loader = scope.getClass().getClassLoader();
            Class<?> items = Class.forName("com.atlassian.jira.infrastructure.compose.ui.SpacedItemsKt", true, loader);
            Class<?> wrapper = Class.forName("ta4", true, loader);
            Class<?> rowType = Class.forName("com.atlassian.jira.feature.settings.impl.SettingsKt", true, loader);
            Class<?> lambdaType = Class.forName("kotlin.jvm.functions.Function2", true, loader);
            Method add = null;
            for (Method method : items.getDeclaredMethods()) {
                if (method.getName().equals("b") && method.getParameterTypes().length == 5) add = method;
            }
            Constructor<?> create = wrapper.getConstructor(int.class, boolean.class, Object.class);
            if (add == null) return;
            for (int which = 0; which <= TABS_ROW; which++) {
                Object content = create.newInstance(ROW_KEY + which, true, row(lambdaType, rowType, which));
                // Scope, modifier (default), click (none), content, defaults.
                add.invoke(null, scope, null, null, content, 7);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
        }
    }

    /** The composable lambda of one row, as an instance of the app's lambda interface. */
    private static Object row(Class<?> lambdaType, final Class<?> rowType, final int which) {
        return Proxy.newProxyInstance(lambdaType.getClassLoader(), new Class<?>[] {lambdaType}, new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                if (args == null || args.length != 2) return MaterialYou.objectMethod(proxy, method, args);
                for (Method row : rowType.getDeclaredMethods()) {
                    Class<?>[] types = row.getParameterTypes();
                    if (!row.getName().equals("e") || types.length != 8 || types[0] != String.class || types[1] != boolean.class) continue;
                    Context context = AppRuntime.application();
                    if (context == null) return null;
                    // Reading the state makes this row draw again when a switch is flipped.
                    readVersion();
                    if (which == TABS_ROW) {
                        tabsRow(args[0]);
                        break;
                    }
                    boolean selected = MaterialYou.prefs(context).getBoolean(MaterialYou.KEYS[which], MaterialYou.DEFAULTS[which]);
                    // Label, checked, onChange, subtitle (none), enabled (default), composer, changed, defaults.
                    row.invoke(null, I18n.tr(MaterialYou.LABELS[which]), selected, toggle(types[2], which), null, false, args[0], 0, 24);
                    break;
                }
                return null;
            }
        });
    }

    private static void readVersion() {
        try {
            if (version != null) version.getClass().getMethod("getValue").invoke(version);
        } catch (ReflectiveOperationException ignored) {
        }
    }

    private static void bumpVersion() {
        try {
            if (version == null) return;
            Object now = version.getClass().getMethod("getValue").invoke(version);
            version.getClass().getMethod("setValue", Object.class).invoke(version, ((Integer) now) + 1);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
        }
    }

    /** The change callback of a row: flips its switch, saves it, redraws the rows and offers a restart. */
    private static Object toggle(Class<?> type, final int which) {
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {type}, new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) {
                if (args == null || args.length != 1 || !(args[0] instanceof Boolean)) return MaterialYou.objectMethod(proxy, method, args);
                Context context = AppRuntime.application();
                if (context == null) return null;
                SharedPreferences prefs = MaterialYou.prefs(context);
                prefs.edit().putBoolean(MaterialYou.KEYS[which], !prefs.getBoolean(MaterialYou.KEYS[which], MaterialYou.DEFAULTS[which])).commit();
                bumpVersion();
                showSnackbar();
                return null;
            }
        });
    }

    /** The row that opens the tab sheet: the app's selectable row, with a summary of the tabs shown. */
    private static void tabsRow(Object composer) throws ReflectiveOperationException {
        Context context = AppRuntime.application();
        if (context == null) return;
        ClassLoader loader = composer.getClass().getClassLoader();
        Class<?> rowType = Class.forName("com.atlassian.jira.feature.settings.impl.SelectableRowKt", true, loader);
        for (Method row : rowType.getDeclaredMethods()) {
            Class<?>[] types = row.getParameterTypes();
            if (!row.getName().equals("a") || types.length != 8 || types[0] != String.class || types[1] != boolean.class) continue;
            int shown = 1;
            for (int i = FIRST_TAB; i < MaterialYou.KEYS.length; i++) {
                if (MaterialYou.prefs(context).getBoolean(MaterialYou.KEYS[i], MaterialYou.DEFAULTS[i])) shown++;
            }
            Object click = Proxy.newProxyInstance(loader, new Class<?>[] {types[2]}, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    // Compose also calls hashCode, equals and toString on a lambda.
                    if (method.getDeclaringClass() == Object.class) return MaterialYou.objectMethod(proxy, method, args);
                    showSheet();
                    return null;
                }
            });
            String summary = GlassTabs.summary(shown, MaterialYou.KEYS.length - FIRST_TAB + 1);
            // Label, selected (no check), click, modifier (default), subtitle, composer, changed, defaults.
            row.invoke(null, I18n.tr("Navigation bar tabs"), false, click, null, summary, composer, 0, 8);
            return;
        }
    }

    /** A bottom sheet with one check row per bottom bar tab; closing it offers the restart when a tab was changed. */
    private static void showSheet() {
        final Activity activity = current.get();
        if (activity == null) return;
        final ViewGroup root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        int text = app.fakh.extension.shared.MaterialYou.sheetText(activity);
        int accent = app.fakh.extension.shared.MaterialYou.accent(activity, true, 0xFF6750A4, 0xFFD0BCFF);
        final boolean[] changed = {false};
        final Context context = AppRuntime.application();
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        // Home is always shown: its row is checked and dimmed, and does nothing.
        for (int i = FIRST_TAB - 1; i < MaterialYou.KEYS.length; i++) {
            final int which = i;
            boolean fixed = i < FIRST_TAB;
            String label = I18n.tr(fixed ? "Home" : MaterialYou.LABELS[i]);
            boolean on = fixed || MaterialYou.prefs(context).getBoolean(MaterialYou.KEYS[i], MaterialYou.DEFAULTS[i]);
            rows.addView(TabSheet.checkRow(activity, label, on, !fixed, text, accent, checked -> {
                MaterialYou.prefs(context).edit().putBoolean(MaterialYou.KEYS[which], checked).commit();
                changed[0] = true;
                bumpVersion();
            }));
        }
        TabSheet.show(activity, root, I18n.tr("Navigation bar tabs"), null, app.fakh.extension.shared.MaterialYou.sheetSurface(activity),
                text, text, rows, () -> {
                    if (changed[0]) showSnackbar();
                });
    }

    /** A snackbar at the bottom of the screen that offers to restart the app, which the changes need. */
    private static void showSnackbar() {
        final Activity activity = current.get();
        if (activity == null) return;
        // Clear of the glass navigation bar.
        RestartBar.show(activity, Math.round(56 * activity.getResources().getDisplayMetrics().density));
    }
}
