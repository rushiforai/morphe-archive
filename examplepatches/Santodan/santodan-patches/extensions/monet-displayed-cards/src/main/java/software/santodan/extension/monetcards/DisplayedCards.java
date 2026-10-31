package software.santodan.extension.monetcards;

import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.Map;
import java.util.IdentityHashMap;
import java.util.WeakHashMap;

/** Adds controls through Monet's own themed Compose button renderer inside its original picker. */
public final class DisplayedCards {
    private static final Map<Object, WeakReference<Controls>> CONTROLS = new WeakHashMap<>();
    private static final Map<Object, WeakReference<Controls>> FOOTERS = new WeakHashMap<>();
    private static Bridge bridge;
    private static final ThreadLocal<String> FOOTER_TITLE = new ThreadLocal<>();
    private DisplayedCards() {}

    public static void buttons(String label, boolean enabled, Object focus, Object style, Object click,
            Object left, Object right, Object down, Object composer, int flags, int defaults,
            Object state, int minimum, int maximum) {
        try {
            Bridge api = api();
            if (!CardLimit.isCardPicker(minimum, maximum)) {
                api.render(label, enabled, focus, style, click, left, right, down, composer, flags, defaults);
                return;
            }
            boolean plus = "+".equals(label);
            api.begin.invoke(composer, plus ? 0x53444311 : 0x53444310);
            try {
                Object remembered = api.remember.invoke(composer);
                Controls controls = remembered == api.empty ? null : (Controls) remembered;
                if (controls == null || controls.state != state) {
                    WeakReference<Controls> reference = CONTROLS.get(state);
                    controls = reference == null ? null : reference.get();
                    if (controls == null) controls = new Controls(api, state);
                    api.save.invoke(composer, controls);
                }
                CONTROLS.put(state, new WeakReference<>(controls));
                if (!plus) {
                    controls.minus = focus; controls.plus = right; controls.down = down;
                    api.render("\u221210", enabled, controls.minusTen, style, controls.minusTenClick,
                        null, focus, controls.max, composer, 0, 0);
                    api.render(label, enabled, focus, style, controls.minusClick,
                        controls.minusTen, right, controls.max, composer, 0, 0);
                } else {
                    controls.minus = left; controls.plus = focus; controls.down = down;
                    api.render(label, enabled, focus, style, controls.plusClick,
                        left, controls.plusTen, controls.max, composer, 0, 0);
                    api.render("+10", enabled, controls.plusTen, style, controls.plusTenClick,
                        focus, null, controls.max, composer, 0, 0);
                }
            } finally { api.end.invoke(composer, false); }
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Monet native displayed cards control contract changed", failure);
        }
    }
    /** The original footer Row already supplies its spacing/alignment and Apply styling. */
    public static void footer(String label, Object apply, Object focus, Object up, Object composer,
            int flags, Object state, int minimum, int maximum) {
        try {
            Bridge api = api();
            if (!CardLimit.isCardPicker(minimum, maximum)) {
                api.renderFooter(label, apply, focus, up, composer, flags);
                return;
            }
            api.begin.invoke(composer, 0x53444312);
            try {
                Object remembered = api.remember.invoke(composer);
                Controls controls = remembered == api.empty ? null : (Controls) remembered;
                if (controls == null || controls.state != state) {
                    WeakReference<Controls> reference = CONTROLS.get(state);
                    controls = reference == null ? null : reference.get();
                    if (controls == null) controls = new Controls(api, state);
                    api.save.invoke(composer, controls);
                }
                controls.down = focus;
                FOOTERS.put(focus, new WeakReference<>(controls));
                FOOTERS.put(controls.max, new WeakReference<>(controls));
                api.renderFooter("Max", controls.maxClick, controls.max, controls.minusTen, composer, 0);
                api.renderFooter(label, apply, focus, up, composer, flags);
            } finally { api.end.invoke(composer, false); }
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Monet native displayed cards footer contract changed", failure);
        }
    }

    /** 1.1.0 specializes Apply's label away; preserve its native renderer and callback. */
    public static void footer110(int flags, Object focus, Object up, Object apply, Object composer,
            Object state, int minimum, int maximum) {
        footer("", apply, focus, up, composer, flags, state, minimum, maximum);
    }

    /** Remember within the native text group's own composition, including independent restarts. */
    public static String text(String original, Object composer) {
        try {
            Bridge api = api();
            api.begin.invoke(composer, 0x53444313);
            try {
                Object remembered = api.remember.invoke(composer);
                String scoped = FOOTER_TITLE.get();
                String title = scoped != null ? scoped : remembered instanceof String ? (String) remembered : "";
                if (!title.equals(remembered)) api.save.invoke(composer, title);
                return title.isEmpty() ? original : title;
            } finally { api.end.invoke(composer, false); }
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Monet native footer title contract changed", failure);
        }
    }

    /** Keep footer navigation within the picker and never target a disabled count button. */
    public static Object properties(Object nativeProperties, Object focus) {
        WeakReference<Controls> reference = FOOTERS.get(focus);
        Controls controls = reference == null ? null : reference.get();
        if (controls == null) return nativeProperties;
        Object[] cached = controls.properties.get(focus);
        if (cached != null && cached[0] == nativeProperties) return cached[1];
        Bridge api = controls.api;
        Object wrapped = Proxy.newProxyInstance(api.property.getClassLoader(), new Class<?>[]{api.property}, (proxy, method, args) -> {
            if (method.getName().equals("equals")) return proxy == args[0];
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("toString")) return "Monet card footer focus";
            if (!method.getName().equals("a") || method.getParameterCount() != 1)
                throw new UnsupportedOperationException(method.getName());
            Object result = api.configure.invoke(nativeProperties, args[0]);
            int value = (int) api.get.invoke(controls.state);
            if (focus == controls.max) {
                api.right.invoke(args[0], controls.down);
                api.up.invoke(args[0], value > CardLimit.MIN ? controls.minusTen : controls.plus);
            } else {
                api.left.invoke(args[0], controls.max);
                api.up.invoke(args[0], value < CardLimit.MAX ? controls.plus : controls.minus);
            }
            return result;
        });
        controls.properties.put(focus, new Object[]{nativeProperties, wrapped});
        return wrapped;
    }

    private static Bridge api() throws ReflectiveOperationException {
        if (bridge == null) bridge = new Bridge(); // Called only by native Compose/UI callbacks.
        return bridge;
    }
    private static final class Controls {
        final Bridge api;
        final Object state, minusTen, plusTen, max;
        final Object minusTenClick, minusClick, plusClick, plusTenClick, maxClick;
        Object minus, plus, down;
        final Map<Object, Object[]> properties = new IdentityHashMap<>();
        int finite;
        Controls(Bridge api, Object state) throws ReflectiveOperationException {
            this.api = api; this.state = state;
            int initial = (int) api.get.invoke(state);
            finite = initial == CardLimit.MAX ? 20 : Math.max(CardLimit.MIN, initial);
            minusTen = api.focus.newInstance(); plusTen = api.focus.newInstance(); max = api.focus.newInstance();
            minusTenClick = action(-10); minusClick = action(-1); plusClick = action(1);
            plusTenClick = action(10); maxClick = action(0);
        }
        Object action(int delta) {
            return Proxy.newProxyInstance(api.click.getClassLoader(), new Class<?>[]{api.click}, (proxy, method, args) -> {
                if (method.getName().equals("equals")) return proxy == args[0];
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("toString")) return "Monet card count action";
                if (!method.getName().equals("b") || method.getParameterCount() != 0)
                    throw new UnsupportedOperationException(method.getName());
                int current = (int) api.get.invoke(state);
                if (current != CardLimit.MAX) finite = Math.max(CardLimit.MIN, current);
                int next = delta == 0 ? CardLimit.MAX : CardLimit.step(current, delta, finite);
                if (next != CardLimit.MAX) finite = next;
                api.set.invoke(state, next);
                return api.unit;
            });
        }
    }
    private static final class Bridge {
        final Class<?> click, property;
        final Constructor<?> focus;
        final Method button, footer, configure, left, right, up, get, set, begin, remember, save, end;
        final Object empty, unit;
        Bridge() throws ReflectiveOperationException {
            boolean modern = NativeLayout.modern;
            Class<?> focusType = Class.forName(modern ? "a.wp1" : "a.cm1"), composerType = Class.forName(modern ? "a.jw1" : "a.yr1");
            click = Class.forName(modern ? "a.uu1" : "a.iq1");
            property = Class.forName(modern ? "a.wu1" : "a.kq1");
            configure = property.getMethod("a", Object.class);
            Class<?> properties = Class.forName(modern ? "a.qp1" : "a.wl1");
            left = properties.getMethod("e", focusType); right = properties.getMethod("k", focusType);
            up = properties.getMethod("j", focusType);
            footer = modern ? Class.forName("a.ux2").getMethod("B0", int.class, focusType, focusType, click, composerType)
                : Class.forName("a.mq2").getMethod("L0", String.class, click, focusType, focusType, composerType, int.class);
            focus = focusType.getConstructor();
            button = Class.forName(modern ? "a.ux2" : "a.mq2").getMethod(modern ? "C0" : "M0", String.class, boolean.class, focusType,
                Class.forName(modern ? "a.y95" : "a.zz4"), click, focusType, focusType, focusType, composerType, int.class, int.class);
            Class<?> state = Class.forName(modern ? "a.xb5" : "a.q15");
            get = state.getMethod("g"); set = state.getMethod("i", int.class);
            begin = composerType.getMethod(modern ? "h0" : "g0", int.class); remember = composerType.getMethod(modern ? "T" : "S");
            save = composerType.getMethod(modern ? "r0" : "q0", Object.class); end = composerType.getMethod(modern ? "r" : "q", boolean.class);
            empty = Class.forName(modern ? "a.pp0" : "a.am0").getField("a").get(null);
            unit = Class.forName(modern ? "a.lo7" : "a.s67").getField("a").get(null);
        }
        void renderFooter(String label, Object apply, Object focus, Object up, Object composer, int flags) throws ReflectiveOperationException {
            if (!NativeLayout.modern) {
                footer.invoke(null, label, apply, focus, up, composer, flags);
                return;
            }
            String previous = FOOTER_TITLE.get();
            FOOTER_TITLE.set("Max".equals(label) ? "Max" : "");
            try { footer.invoke(null, flags, focus, up, apply, composer); }
            finally {
                if (previous == null) FOOTER_TITLE.remove(); else FOOTER_TITLE.set(previous);
            }
        }
        void render(String label, boolean enabled, Object focus, Object style, Object click,
                Object left, Object right, Object down, Object composer, int flags, int defaults) throws ReflectiveOperationException {
            button.invoke(null, label, enabled, focus, style, click, left, right, down, composer, flags, defaults);
        }
    }
}
