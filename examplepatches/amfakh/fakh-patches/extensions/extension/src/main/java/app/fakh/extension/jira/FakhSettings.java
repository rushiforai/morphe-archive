/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.jira;

import android.app.Activity;
import android.content.Context;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RestartBar;

/**
 * The Fakh Patches card of Jira's Account screen, under the card of Notification settings and Settings: one row, drawn
 * with the screen's own card and row composables by reflection, that opens {@link FakhPatchesActivity}.
 */
public final class FakhSettings {
    private static WeakReference<Activity> current = new WeakReference<>(null);

    private FakhSettings() {
    }

    /** Keeps the activity that is in front, for the Account card's click. */
    static void remember(Activity activity) {
        current = new WeakReference<>(activity);
    }

    /**
     * Injected after the card of Notification settings and Settings in the Account screen: draws the Fakh Patches card
     * with the screen's own card composable and its row of a title and an icon.
     *
     * @param composer the Compose composer of the screen, which is only read
     */
    public static void addCard(Object composer) {
        try {
            Context context = AppRuntime.application();
            if (context == null) return;
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> items = Class.forName(
                    "com.atlassian.jira.infrastructure.designsystem.components.molecules.listitem.JiraSectionColumnKt", true, loader);
            Class<?> screen = Class.forName("com.atlassian.jira.feature.profile.impl.view.ProfileScreenKt", true, loader);
            Class<?> function1 = Class.forName("kotlin.jvm.functions.Function1", true, loader);
            Method card = null;
            for (Method method : items.getDeclaredMethods()) {
                if (method.getName().equals("a") && method.getParameterTypes().length == 7) card = method;
            }
            Method row = null;
            for (Method method : screen.getDeclaredMethods()) {
                Class<?>[] types = method.getParameterTypes();
                if (types.length == 4 && types[1] == int.class && types[2] == int.class && types[3].isInterface()) row = method;
            }
            if (card == null || row == null) return;
            int title = context.getResources().getIdentifier("fakh_patches", "string", context.getPackageName());
            int icon = context.getResources().getIdentifier("fakh_ic_patches", "drawable", context.getPackageName());
            Class<?> clickType = row.getParameterTypes()[3];
            Object click = Proxy.newProxyInstance(loader, new Class<?>[] {clickType}, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    // Compose also calls hashCode, equals and toString on a lambda.
                    if (method.getDeclaringClass() == Object.class) return MaterialYou.objectMethod(proxy, method, args);
                    Activity activity = current.get();
                    FakhPatchesActivity.open(activity != null ? activity : AppRuntime.application());
                    return null;
                }
            });
            final Method rowMethod = row;
            Object builder = Proxy.newProxyInstance(loader, new Class<?>[] {function1}, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if (args == null || args.length != 1) return MaterialYou.objectMethod(proxy, method, args);
                    rowMethod.invoke(null, args[0], title, icon, click);
                    return null;
                }
            });
            // Title, modifier and gap are the card's own defaults.
            card.invoke(null, null, null, 0f, builder, composer, 0, 1 | 2 | 4);
        } catch (Throwable error) {
            android.util.Log.w("FakhPatches", "Account card", error);
        }
    }

    /** The switches of the bottom bar's tabs, Home aside, in the order the sheet lists them. */
    static List<Features.Feature> tabs() {
        List<Features.Feature> tabs = new ArrayList<>();
        for (Features.Feature feature : Features.all()) {
            if (feature.section.equals(MaterialYou.TABS_SECTION)) tabs.add(feature);
        }
        return tabs;
    }

    /** How many of the bottom bar's tabs are shown, Home included, as the tab row's summary. */
    static String tabsSummary(Context context) {
        int shown = 1;
        List<Features.Feature> tabs = tabs();
        for (Features.Feature tab : tabs) {
            if (Features.saved(tab.id)) shown++;
        }
        return GlassTabs.summary(shown, tabs.size() + 1);
    }

    /**
     * Jira's own multi-select picker sheet, the one of "Filter by priority", with one check row per bottom bar tab:
     * the modal bottom sheet and picker composables in Jira's theme, called with the colors the priority sheet uses.
     * Home is always shown: its row stays in the selected ones, unchecking it puts it back. Closing the sheet offers the
     * restart when a tab was changed.
     *
     * @param activity the page that shows the sheet
     * @param closed run when the sheet is closed after a change, to show the new summary
     */
    static void showSheet(Activity activity, Runnable closed) {
        try {
            ClassLoader loader = activity.getClassLoader();
            Class<?> contextUtils = Class.forName("com.atlassian.jira.infrastructure.ui.util.ContextUtilsKt", true, loader);
            Context themed = (Context) contextUtils.getMethod("a", Context.class, boolean.class).invoke(null, activity, false);
            Class<?> picker = Class.forName("com.atlassian.jira.infrastructure.compose.ui.search.JiraSearchMultiSelectPickerKt", true, loader);
            Class<?> modelClass = Class.forName("com.atlassian.jira.infrastructure.compose.ui.search.MultiSelectModel", true, loader);
            // The loading and error slots of the priority picker, which show nothing of a priority.
            Class<?> slots = Class.forName("com.atlassian.jira.feature.issue.search.impl.priority.ComposableSingletons$PriorityPickerKt", true, loader);
            Class<?> theme = Class.forName("com.atlassian.jira.infrastructure.designsystem.foundation.JiraTheme", true, loader);
            Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2", true, loader);
            Method pickerMethod = null;
            for (Method method : picker.getDeclaredMethods()) {
                Class<?>[] types = method.getParameterTypes();
                if (types.length == 14 && types[1] == modelClass) pickerMethod = method;
            }
            Method themeMethod = themeMethod(theme);
            // The text of a row: the composable Jira's search title draws its text with.
            Method textMethod = composable(loader, textComposable(), 20);
            // The modal bottom sheet the priority sheet sits in, and the two colors it is given.
            Method sheetMethod = composable(loader, sheetComposable(), 18);
            Method containerMethod = composable(loader, containerColorComposable(), 2);
            final Method sheetCall = sheetMethod;
            final Method containerColor = containerMethod;
            final Method scrimColor = Class.forName("com.atlassian.jira.infrastructure.compose.ui.fields.FieldDefaults", true, loader)
                    .getMethod("b", sheetMethod.getParameterTypes()[14]);
            final java.lang.reflect.Constructor<?> makeLambda = lambdaConstructor(loader);
            final Class<?> function3 = pickerMethod.getParameterTypes()[8];
            final Method pickerCall = pickerMethod;
            final Method themeCall = themeMethod;
            final Method textCall = textMethod;
            final Object themeInstance = theme.getField("INSTANCE").get(null);
            Class<?>[] pickerTypes = pickerMethod.getParameterTypes();
            final Object loading = slots.getMethod("b").invoke(null);
            final Object error = slots.getMethod("a").invoke(null);
            final java.lang.reflect.Constructor<?> makeModel = modelClass.getConstructor(String.class, boolean.class,
                    List.class, List.class, boolean.class, Throwable.class, int.class);

            final List<Features.Feature> tabs = tabs();
            final boolean[] changed = {false};
            final List<Integer> all = new ArrayList<>();
            final List<Integer> selected = new ArrayList<>();
            // The rows are the tabs' numbers in tabs(); Home, which has no switch, is -1.
            final int home = -1;
            all.add(home);
            selected.add(home);
            for (int key = 0; key < tabs.size(); key++) {
                all.add(key);
                if (Features.saved(tabs.get(key).id)) selected.add(key);
            }
            final String title = I18n.tr("Navigation bar tabs");
            // The theme's text color at 38%, packed the way Compose stores an sRGB Color.
            android.content.res.TypedArray colors = themed.obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
            int primary = colors.getColor(0, 0xff000000);
            colors.recycle();
            final long dimmed = (((long) ((primary & 0xffffff) | (0x61 << 24))) & 0xffffffffL) << 32;

            final InvocationHandlerFactory handlers = new InvocationHandlerFactory();
            final Object row = handlers.of(loader, pickerTypes[8], args -> {
                try {
                    int key = (Integer) args[0];
                    // Home is the one row that cannot be changed, so its text is dimmed like a disabled item.
                    boolean fixed = key == home;
                    textCall.invoke(null, I18n.tr(fixed ? "Home" : tabs.get(key).title), null, fixed ? dimmed : 0L, null, 0L, null, null, 0L,
                            null, null, 0L, 0, false, 0, 0, null, args[1], 0, 0, fixed ? 0x3fffa : 0x3fffe);
                } catch (ReflectiveOperationException failure) {
                    throw new IllegalStateException(failure);
                }
                return null;
            });
            // A tab has no icon: the slot before a row's text draws nothing.
            final Object noIcon = handlers.of(loader, pickerTypes[9], args -> null);
            Class<?> viewClass = Class.forName("androidx.compose.ui.platform.ComposeView", true, loader);
            final View view = (View) viewClass.getConstructor(Context.class).newInstance(themed);
            final android.view.ViewGroup host = activity.findViewById(android.R.id.content);
            final boolean[] open = {true};
            final Object dismiss = handlers.of(loader, sheetMethod.getParameterTypes()[0], args -> {
                open[0] = false;
                view.post(() -> host.removeView(view));
                if (changed[0]) {
                    RestartBar.show(activity, 0, MaterialYou.materialYou(activity));
                    closed.run();
                }
                return null;
            });
            // The sheet's content reads the selection each time it is drawn; a change redraws it in place.
            final Object[] content = new Object[1];
            final Object onChange = handlers.of(loader, pickerTypes[4], args -> {
                selected.clear();
                selected.add(home);
                for (Object key : (List<?>) args[0]) {
                    if ((Integer) key != home) selected.add((Integer) key);
                }
                for (int key = 0; key < tabs.size(); key++) Features.set(tabs.get(key).id, selected.contains(key));
                changed[0] = true;
                invalidate(content[0]);
                return null;
            });
            content[0] = makeLambda.newInstance(0x7b9d2be8, true, handlers.of(loader, function3, args -> {
                try {
                    Object model = makeModel.newInstance("", false, new ArrayList<>(selected), all, false, null, Integer.MAX_VALUE);
                    // Modifier, search, item key and the first slot are the picker's own defaults.
                    pickerCall.invoke(null, null, model, title, null, onChange, null, loading, error, row, noIcon,
                            args[1], 0, 0, 0x69);
                } catch (ReflectiveOperationException failure) {
                    throw new IllegalStateException(failure);
                }
                return null;
            }));
            final Object sheetContent = handlers.of(loader, function2, args -> {
                if (!open[0]) return null;
                try {
                    sheetCall.invoke(null, dismiss, null, null, 0f, false, null,
                            containerColor.invoke(null, themeInstance, args[0]), 0L, 0f, scrimColor.invoke(null, args[0]),
                            null, null, null, content[0], args[0], 6, 0xc00, 0x1dbe);
                } catch (ReflectiveOperationException failure) {
                    throw new IllegalStateException(failure);
                }
                return null;
            });
            viewClass.getMethod("setContent", function2).invoke(view, handlers.of(loader, function2, args -> {
                try {
                    themeCall.invoke(themeInstance, null, false, null, null, null, null, sheetContent, args[0], 0, 0x3f);
                } catch (ReflectiveOperationException failure) {
                    throw new IllegalStateException(failure);
                }
                return null;
            }));

            // The sheet opens its own window; the view only hosts its composition.
            host.addView(view, 0, 0);
        } catch (Throwable failure) {
            android.util.Log.w("FakhPatches", "Tab sheet", failure);
        }
    }

    /**
     * The Compose Text that Jira's search title calls, as "class.method". R8 renames it every release, so the patch
     * reads it from DefaultSearchTitleKt and returns it here.
     */
    static String textComposable() {
        return "";
    }

    /** The modal bottom sheet that the priority sheet sits in, as "class.method"; the patch returns it here. */
    static String sheetComposable() {
        return "";
    }

    /** The container color the priority sheet gives its sheet, as "class.method"; the patch returns it here. */
    static String containerColorComposable() {
        return "";
    }

    /** The method a "class.method" name points at that takes this many parameters. */
    private static Method composable(ClassLoader loader, String name, int parameters) throws ClassNotFoundException {
        int dot = name.lastIndexOf('.');
        for (Method method : Class.forName(name.substring(0, dot), true, loader).getDeclaredMethods()) {
            if (method.getName().equals(name.substring(dot + 1)) && method.getParameterTypes().length == parameters) return method;
        }
        throw new IllegalStateException("No " + name + " with " + parameters + " parameters");
    }

    /** JiraTheme's composable that puts content in the app's theme: its one method with ten parameters. */
    static Method themeMethod(Class<?> theme) {
        for (Method method : theme.getDeclaredMethods()) {
            if (method.getParameterTypes().length == 10) return method;
        }
        throw new IllegalStateException("JiraTheme");
    }

    /**
     * The constructor of Compose's composable lambda (key, tracked, block), the type of the modal bottom sheet's content.
     */
    static java.lang.reflect.Constructor<?> lambdaConstructor(ClassLoader loader) throws ReflectiveOperationException {
        return composable(loader, sheetComposable(), 18).getParameterTypes()[13]
                .getConstructor(int.class, boolean.class, Object.class);
    }

    /**
     * Redraws where a composable lambda is drawn, as its update does: invalidates the recompose scopes it keeps (one,
     * and a list once it is drawn in more than one place).
     */
    static void invalidate(Object lambda) {
        try {
            for (java.lang.reflect.Field field : lambda.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(lambda);
                if (value == null) continue;
                if (value instanceof java.util.Collection) {
                    for (Object scope : (java.util.Collection<?>) value) {
                        if (scope != null) scope.getClass().getMethod("b").invoke(scope);
                    }
                } else if (field.getType() != Object.class && hasInvalidate(value)) {
                    value.getClass().getMethod("b").invoke(value);
                }
            }
        } catch (ReflectiveOperationException failure) {
            android.util.Log.w("FakhPatches", "Tab sheet redraw", failure);
        }
    }

    /** Whether a field of the lambda holds its recompose scope: the one with a no-argument void b(), its invalidate. */
    private static boolean hasInvalidate(Object value) {
        try {
            Method method = value.getClass().getMethod("b");
            return method.getReturnType() == void.class && method.getParameterTypes().length == 0;
        } catch (NoSuchMethodException none) {
            return false;
        }
    }

    /** One call a proxied Kotlin function makes: its arguments in, its result out. */
    private interface Call {
        Object run(Object[] args);
    }

    /** Builds proxies of Kotlin function interfaces from {@link Call}s. */
    private static final class InvocationHandlerFactory {
        Object of(ClassLoader loader, Class<?> type, Call call) {
            return Proxy.newProxyInstance(loader, new Class<?>[] {type}, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    if (method.getDeclaringClass() == Object.class) return MaterialYou.objectMethod(proxy, method, args);
                    // A function of no arguments, such as the sheet's dismiss request, is called with none.
                    return call.run(args != null ? args : new Object[0]);
                }
            });
        }
    }
}
