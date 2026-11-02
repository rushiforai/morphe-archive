package app.morphe.extension.facebook.marketplace;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.Collection;

/**
 * Adds an "About" row to the menu that opens from the top-right nav bar button (the one whose
 * content description is "Tap to view your Marketplace account") in Facebook 582.0.0.50.54.
 *
 * How that menu works (all names are the Redex-obfuscated ones of this build):
 *  - the button click goes {@code X.2Cl.onClick} (analytics "tap_top_right_nav") -> the listener built in
 *    {@code X.CNM.A02}, {@code X.D5M.onClick} case "tab_bar_you";
 *  - with MobileConfig flag 72339197887185287 on it calls
 *    {@code X.CNM.buildMarketplaceSurfaceMenuItems(FbUserSession, Context)List} and shows the result with
 *    {@code X.OXT.A00(View, FbUserSession, Integer, "marketplace", List)};
 *  - every entry is an {@code X.OlL(X.1UM icon, String label, String id, kotlin Function0 onClick, int badge)}.
 *
 * The patch inserts a call to {@link #addAboutItem(Object, Object)} right before the builder hands its
 * list back ({@code X.0s1.A1j(list)}). Everything is reflection: the extension is compiled without
 * Facebook's classes or Kotlin, so this file also runs on a plain JVM (see tests/). Any mismatch simply
 * leaves the menu as Facebook built it.
 */
@SuppressWarnings("unused")
public final class AboutMenu {

    static final String LABEL = "About";
    static final String ITEM_ID = "marketplace_about";
    /** Name of the X.1UM icon enum constant (the enum keeps readable names, the fields are A8B, AC0, ...). */
    static final String ICON_NAME = "INFO_CIRCLE";

    /** Not final only so tests can point it at a stand-in: "X.1UM" can't be written as a Java class name. */
    private static volatile String iconClassName = "X.1UM";
    private static final String ITEM_CLASS = "X.OlL";
    private static final String FUNCTION0_CLASS = "kotlin.jvm.functions.Function0";
    private static final String DIALOG_CLASS = "app.morphe.extension.facebook.about.AboutDialog";

    private AboutMenu() {
    }

    /** Test hook: the binary name of the icon enum class (see {@link #iconClassName}). */
    public static void setIconClassNameForTesting(String name) {
        iconClassName = name;
    }

    /**
     * @param items   the {@code X.0CS} list being built (a {@link Collection})
     * @param context the Context the menu was built for (normally the activity)
     */
    public static void addAboutItem(Object items, Object context) {
        try {
            if (!(items instanceof Collection)) return;
            ClassLoader loader = AboutMenu.class.getClassLoader();

            Class<?> iconClass = Class.forName(iconClassName, false, loader);
            Class<?> itemClass = Class.forName(ITEM_CLASS, false, loader);
            Class<?> function0 = Class.forName(FUNCTION0_CLASS, false, loader);

            Object icon = findIcon(iconClass, ICON_NAME);
            if (icon == null) return;

            Constructor<?> constructor = itemClass.getDeclaredConstructor(
                    iconClass, String.class, String.class, function0, int.class);
            constructor.setAccessible(true);

            Object onClick = Proxy.newProxyInstance(loader, new Class<?>[]{function0},
                    new ClickHandler(context, loader));
            Object item = constructor.newInstance(icon, LABEL, ITEM_ID, onClick, 0);

            @SuppressWarnings("unchecked")
            Collection<Object> list = (Collection<Object>) items;
            list.add(item);
        } catch (Throwable ignored) {
            // Never break the menu: without the row it is exactly Facebook's own.
        }
    }

    /** The enum constant of {@code enumClass} named {@code name}, or null. Scans static fields by Enum.name(). */
    static Object findIcon(Class<?> enumClass, String name) throws IllegalAccessException {
        for (Field field : enumClass.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != enumClass) continue;
            field.setAccessible(true);
            Object value = field.get(null);
            if (value instanceof Enum && name.equals(((Enum<?>) value).name())) return value;
        }
        return null;
    }

    /** Implements kotlin.jvm.functions.Function0.invoke() (and the three java.lang.Object methods). */
    private static final class ClickHandler implements InvocationHandler {
        private final Object context;
        private final ClassLoader loader;

        ClickHandler(Object context, ClassLoader loader) {
            this.context = context;
            this.loader = loader;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            if (name.equals("hashCode")) return System.identityHashCode(proxy);
            if (name.equals("equals")) return args != null && args.length == 1 && proxy == args[0];
            if (name.equals("toString")) return "AboutMenu.onClick";
            if (name.equals("invoke")) {
                try {
                    Class.forName(DIALOG_CLASS, true, loader)
                            .getMethod("show", Object.class)
                            .invoke(null, context);
                } catch (Throwable ignored) {
                    // nothing sensible to do if the dialog can't be shown
                }
                return unit();
            }
            return null;
        }

        /**
         * Function0<Unit> callers may expect Unit back rather than null. In this build kotlin.Unit is renamed:
         * the existing row callbacks (X.Clo.invoke) end with {@code sget-object X.0MO.A00}, a singleton with no
         * other members, so try the real name first and that one second.
         */
        private Object unit() {
            String[][] candidates = {{"kotlin.Unit", "INSTANCE"}, {"X.0MO", "A00"}};
            for (String[] candidate : candidates) {
                try {
                    Field field = Class.forName(candidate[0], false, loader).getDeclaredField(candidate[1]);
                    field.setAccessible(true);
                    return field.get(null);
                } catch (Throwable ignored) {
                    // try the next one
                }
            }
            return null;
        }
    }
}
