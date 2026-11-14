package app.morphe.extension.chmate;

import android.content.Context;
import android.os.SystemClock;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/** The same ChMate image cache/network route used by PatrolImages, including its VPN settings. */
final class RegisteredImageNativeCache {
    private final Object manager;
    private final Method info, stream, request;
    private final String state, code, type;

    RegisteredImageNativeCache(Context context) throws Exception {
        String[] profile = PatrolImages.bindings().split(";", -1);
        if (profile.length != 10) throw new IllegalStateException("Native image cache binding unavailable");
        Class<?> owner = Class.forName(profile[2], true, context.getClassLoader());
        Method factory = owner.getDeclaredMethod(profile[3], Context.class);
        factory.setAccessible(true);
        manager = factory.invoke(null, context);
        info = owner.getDeclaredMethod(profile[4], String.class);
        stream = owner.getDeclaredMethod(profile[5], String.class);
        info.setAccessible(true); stream.setAccessible(true);
        Method found = null;
        for (Method method : owner.getDeclaredMethods()) {
            Class<?>[] p = method.getParameterTypes();
            if (method.getReturnType() == boolean.class && p.length == 8 && p[0] == String.class
                    && p[1] == int.class && p[2] == int.class && p[3] == boolean.class
                    && p[4] == boolean.class && p[5] == boolean.class && p[6] == boolean.class) {
                found = method; break;
            }
        }
        if (found == null) throw new NoSuchMethodException("Native image request");
        request = found; request.setAccessible(true);
        state = profile[6]; code = profile[7]; type = profile[8];
    }

    InputStream await(String url, long deadline) throws Exception {
        Object data = info.invoke(manager, url);
        if (ready(data)) return (InputStream) stream.invoke(manager, url);
        if (SystemClock.elapsedRealtime() >= deadline) return null;
        Class<?> requestType = request.getParameterTypes()[7];
        Object requestInfo;
        try {
            Constructor<?> ctor = requestType.getDeclaredConstructor(String.class);
            ctor.setAccessible(true); requestInfo = ctor.newInstance(url);
        } catch (NoSuchMethodException ignored) {
            Constructor<?> ctor = requestType.getDeclaredConstructor();
            ctor.setAccessible(true); requestInfo = ctor.newInstance();
        }
        request.invoke(manager, url, 0, 0, true, false, false, false, requestInfo);
        while (!Thread.currentThread().isInterrupted() && SystemClock.elapsedRealtime() < deadline) {
            data = info.invoke(manager, url);
            if (ready(data)) return (InputStream) stream.invoke(manager, url);
            if (data != null && ((Number) ResponseArchiveEntry.field(data, state)).intValue() == 1
                    && ((Number) ResponseArchiveEntry.field(data, code)).intValue() >= 400) break;
            try { Thread.sleep(150); } catch (InterruptedException stop) {
                Thread.currentThread().interrupt(); break;
            }
        }
        return null;
    }
    InputStream cachedOnly(String url) throws Exception {
        return ready(info.invoke(manager,url))?(InputStream)stream.invoke(manager,url):null;
    }

    private boolean ready(Object data) throws Exception {
        if (data == null) return false;
        int s = ((Number) ResponseArchiveEntry.field(data, state)).intValue();
        int c = ((Number) ResponseArchiveEntry.field(data, code)).intValue();
        int t = ((Number) ResponseArchiveEntry.field(data, type)).intValue();
        return s == 1 && c / 100 == 2 && (t == 2 || t == 3 || t == 4 || t == 7 || t == 8);
    }
}
