package io.github.ilikeadofai.vocacolle.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.view.Menu;
import android.view.MenuItem;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;

/** Entry point called from the patched VocaColle settings menu provider. */
public final class MorpheSettingsLauncher {
    private static final String MORPHE_MENU_TITLE = "Morphe";
    // Reserved programmatic ID used only by the injected VocaColle settings menu item.
    private static final int MORPHE_MENU_ITEM_ID = 0x4d4f5250;
    private static final String FUNCTION_ZERO_CLASS = "Dl.a";
    private static final String KOTLIN_UNIT_CLASS = "nl.L";

    private static volatile Context appContext;
    private static volatile Object clickCallback;
    private static volatile Object kotlinUnit;

    private MorpheSettingsLauncher() {
    }

    @SuppressWarnings("unused")
    public static void initialize(Context context) {
        if (context != null) {
            appContext = context.getApplicationContext();
        }
    }

    @SuppressWarnings("unused")
    public static String menuTitle() {
        Context context = appContext;
        if (context == null) {
            return MorpheSettingsStrings.forCurrentLocale().settingsTitle;
        }
        return MorpheSettingsStrings.resolve(
                SettingsStore.from(context).getDisplayLanguage(),
                Locale.getDefault().getLanguage()
        ).settingsTitle;
    }

    @SuppressWarnings("unused")
    public static Object createClickCallback() {
        Object existing = clickCallback;
        if (existing != null) {
            return existing;
        }

        synchronized (MorpheSettingsLauncher.class) {
            existing = clickCallback;
            if (existing != null) {
                return existing;
            }

            try {
                ClassLoader classLoader = MorpheSettingsLauncher.class.getClassLoader();
                Class<?> functionZero = Class.forName(FUNCTION_ZERO_CLASS, false, classLoader);
                existing = Proxy.newProxyInstance(
                        classLoader,
                        new Class<?>[]{functionZero},
                        MorpheSettingsLauncher::invokeClickCallback
                );
                clickCallback = existing;
                return existing;
            } catch (ClassNotFoundException exception) {
                throw new IllegalStateException("Could not resolve VocaColle click callback interface", exception);
            }
        }
    }

    private static Object invokeClickCallback(
            Object proxy,
            Method method,
            Object[] arguments
    ) throws ReflectiveOperationException {
        switch (method.getName()) {
            case "invoke":
                open(appContext);
                return kotlinUnit();
            case "toString":
                return "MorpheSettingsClickCallback";
            case "hashCode":
                return System.identityHashCode(proxy);
            case "equals":
                return arguments != null && arguments.length == 1 && proxy == arguments[0];
            default:
                return null;
        }
    }

    private static Object kotlinUnit() throws ReflectiveOperationException {
        Object existing = kotlinUnit;
        if (existing != null) {
            return existing;
        }
        ClassLoader classLoader = MorpheSettingsLauncher.class.getClassLoader();
        Class<?> unitClass = Class.forName(KOTLIN_UNIT_CLASS, false, classLoader);
        existing = unitClass.getField("a").get(null);
        kotlinUnit = existing;
        return existing;
    }

    @SuppressWarnings("unused")
    public static void addMorpheMenuItem(Menu menu) {
        if (menu == null || menu.findItem(MORPHE_MENU_ITEM_ID) != null) {
            return;
        }
        MenuItem item = menu.add(Menu.NONE, MORPHE_MENU_ITEM_ID, Menu.NONE, MORPHE_MENU_TITLE);
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
    }

    @SuppressWarnings("unused")
    public static boolean isMorpheMenuItem(MenuItem item) {
        return item != null && isMorpheMenuItemId(item.getItemId());
    }

    public static boolean isMorpheMenuItemId(int itemId) {
        return itemId == MORPHE_MENU_ITEM_ID;
    }

    @SuppressWarnings("unused")
    public static void open(Context context) {
        if (context == null) {
            return;
        }

        android.content.Intent intent = MorpheSettingsActivity.createIntent(context);
        if (!(context instanceof Activity)) {
            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }
}
