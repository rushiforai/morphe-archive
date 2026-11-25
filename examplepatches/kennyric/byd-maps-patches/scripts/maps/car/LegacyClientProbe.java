package nl.johninnl.mapsprojectionprobe;

import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;

/** Verifies the emitted original SDK token stays disconnected for the denied optional client. */
public final class LegacyClientProbe extends Instrumentation {
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    private static Object field(Object target, String name) throws Exception {
        Field member = target.getClass().getDeclaredField(name); member.setAccessible(true); return member.get(target);
    }
    private static Object listener(ClassLoader loader, Class<?> type) {
        return Proxy.newProxyInstance(loader, new Class<?>[]{type}, (proxy, method, arguments) -> {
            if (method.getReturnType() == boolean.class) return false;
            if (method.getReturnType() == int.class) return 0;
            return null;
        });
    }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            ClassLoader loader = getTargetContext().getClassLoader();
            Class<?> owner = loader.loadClass("pwx"), callback = loader.loadClass("pww");
            Constructor<?> factory = callback.getDeclaredConstructor(owner); factory.setAccessible(true);
            Object optional = factory.newInstance(new Object[]{null});
            Class<?> success = loader.loadClass("bejr"), failure = loader.loadClass("bejt"), events = loader.loadClass("bejy");
            Class<?> tokenType = loader.loadClass("beil");
            Object token = tokenType.getConstructor(Context.class, success, failure, events, Looper.class).newInstance(
                    getTargetContext(), listener(loader, success), listener(loader, failure), optional, Looper.getMainLooper());
            Object future = field(token, "h");
            tokenType.getMethod("e").invoke(token);
            tokenType.getMethod("e").invoke(token);
            if ((Integer) field(token, "i") != 0) throw new AssertionError("Denied optional client attempted a real AA connection");
            if (field(token, "h") != future) throw new AssertionError("Denied optional client replaced its disconnected future");
            if ((Boolean) tokenType.getMethod("a").invoke(token)) throw new AssertionError("Unavailable vehicle data was marked connected");
            result.putString("result", "PASS 3 emitted-DEX optional private-client checks; native renderer is verified separately");
        } catch (Throwable error) { result.putString("result", "FAIL " + android.util.Log.getStackTraceString(error)); }
        finish(-1, result);
    }
}
