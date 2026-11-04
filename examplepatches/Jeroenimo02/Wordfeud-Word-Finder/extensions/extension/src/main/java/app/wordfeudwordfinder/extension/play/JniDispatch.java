package app.wordfeudwordfinder.extension.play;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.ByteBuffer;

/**
 * Second send path (V4 testbuild 3): Flutter's {@code FlutterJNI.dispatchPlatformMessage(String channel, ByteBuffer
 * message, int position, int responseId)}, called by reflection on the FlutterJNI instance that RouteTap captured from
 * {@code handlePlatformMessage}. FlutterJNI's names survive minification because they are bound to native code.
 * This is what {@code DartMessenger.send} calls itself; {@code responseId} 0 means "no reply expected".
 * Must be called on the main thread (FlutterJNI checks that).
 */
final class JniDispatch {
    static final String METHOD = "dispatchPlatformMessage";
    private static final Class<?>[] PARAMS = {String.class, ByteBuffer.class, int.class, int.class};

    /** A found method and how it was found (for the diagnostic). */
    static final class Lookup {
        final Class<?> owner;
        final Method method;
        final String how;

        Lookup(Class<?> owner, Method method, String how) {
            this.owner = owner;
            this.method = method;
            this.how = how;
        }
    }

    private static volatile Lookup cached;

    private JniDispatch() {}

    /** The lookup for {@code c}, cached per class. Null when {@code c} has no such method. */
    static Lookup lookup(Class<?> c) {
        Lookup l = cached;
        if (l != null && l.owner == c) return l;
        l = find(c);
        if (l != null) cached = l;
        return l;
    }

    /** {@code getMethod} first (public, also inherited), then {@code getDeclaredMethod} up the class hierarchy. */
    static Lookup find(Class<?> c) {
        if (c == null) return null;
        try {
            Method m = c.getMethod(METHOD, PARAMS);
            return new Lookup(c, m, "getMethod");
        } catch (Throwable ignored) {
            // not public: search declared methods
        }
        for (Class<?> k = c; k != null; k = k.getSuperclass()) {
            try {
                Method m = k.getDeclaredMethod(METHOD, PARAMS);
                if (Modifier.isStatic(m.getModifiers())) continue;
                m.setAccessible(true);
                return new Lookup(c, m, "getDeclaredMethod on " + k.getSimpleName());
            } catch (NoSuchMethodException ignored) {
                // look in the super class
            } catch (Throwable t) {
                return null; // e.g. setAccessible refused
            }
        }
        return null;
    }

    /** Sends {@code message} on {@code channel}; a direct buffer whose position is the size, no reply. */
    static void dispatch(Lookup l, Object jni, String channel, byte[] message) throws Exception {
        ByteBuffer buf = ByteBuffer.allocateDirect(message.length);
        buf.put(message);
        l.method.invoke(jni, channel, buf, buf.position(), 0);
    }
}
