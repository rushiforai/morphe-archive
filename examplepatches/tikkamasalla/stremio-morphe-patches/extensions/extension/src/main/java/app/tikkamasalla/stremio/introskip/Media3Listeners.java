package app.tikkamasalla.stremio.introskip;

import androidx.media3.common.Player;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Builds an androidx.media3 {@link Player.Listener} as a reflective proxy instead of an anonymous
 * class. An anonymous implementation is desugared by D8: every default method of the interface gets a
 * forwarder to the companion class {@code Player$Listener$-CC}, which the target app's Media3 does not
 * always ship (Stremio 1.10.4 crashed with NoClassDefFoundError on the first onTimelineChanged). A
 * proxy implements whatever methods the running Media3 declares, so no companion class is referenced
 * and no method of a newer or older Media3 can be missing. Unhandled callbacks are no-ops.
 */
public final class Media3Listeners {

    /** Receives every callback by name; the sink picks what it needs by name and argument types. */
    public interface Sink {
        void onEvent(String name, Object[] args);
    }

    private static final Object[] NO_ARGS = new Object[0];

    private Media3Listeners() {
    }

    public static Player.Listener create(final Sink sink) {
        InvocationHandler handler = new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) {
                String name = method.getName();
                if (method.getDeclaringClass() == Object.class) {
                    if ("equals".equals(name)) return Boolean.valueOf(args != null && args.length == 1 && proxy == args[0]);
                    if ("hashCode".equals(name)) return Integer.valueOf(System.identityHashCode(proxy));
                    return "Media3Listeners.Proxy";
                }
                try {
                    sink.onEvent(name, args == null ? NO_ARGS : args);
                } catch (Throwable ignored) {
                    // A listener must never break playback.
                }
                return neutral(method.getReturnType());
            }
        };
        return (Player.Listener) Proxy.newProxyInstance(Player.Listener.class.getClassLoader(),
                new Class<?>[]{Player.Listener.class}, handler);
    }

    private static Object neutral(Class<?> type) {
        if (!type.isPrimitive() || type == Void.TYPE) return null;
        if (type == Boolean.TYPE) return Boolean.FALSE;
        if (type == Long.TYPE) return Long.valueOf(0L);
        if (type == Float.TYPE) return Float.valueOf(0f);
        if (type == Double.TYPE) return Double.valueOf(0d);
        if (type == Character.TYPE) return Character.valueOf((char) 0);
        if (type == Byte.TYPE) return Byte.valueOf((byte) 0);
        if (type == Short.TYPE) return Short.valueOf((short) 0);
        return Integer.valueOf(0);
    }
}
