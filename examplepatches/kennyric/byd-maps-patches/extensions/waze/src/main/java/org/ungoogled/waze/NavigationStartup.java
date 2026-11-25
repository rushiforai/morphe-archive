package org.ungoogled.waze;

import android.app.Application;
import java.lang.reflect.Proxy;
import nl.johninnl.navigation.startup.ProviderControlService.ReflectiveOperationExceptionWrapper;

/** Waze 5.26's own headless initializer, also used by its car integration. */
public final class NavigationStartup {
    private NavigationStartup() {}
    public static boolean running() {
        try {
            Class<?> manager = Class.forName("com.waze.NativeManager");
            if (!((Boolean) manager.getMethod("isAppStarted").invoke(null))) return false;
            return (Boolean) manager.getMethod("getInitializedStatus").invoke(manager.getMethod("getInstance").invoke(null));
        } catch (ReflectiveOperationException error) { throw new ReflectiveOperationExceptionWrapper(error); }
    }
    public static void initialize(Application app) throws ReflectiveOperationException {
        Class<?> continuation = Class.forName("g.d.e");
        Object context = Class.forName("g.d.k").getField("a").get(null);
        Object completion = Proxy.newProxyInstance(continuation.getClassLoader(), new Class<?>[]{continuation}, (proxy, method, args) -> {
            switch (method.getName()) {
                case "getContext": return context;
                case "resumeWith": NativeWarnings.prepareControllers();return null;
                case "toString": return "NavigationStartup";
                case "hashCode": return System.identityHashCode(proxy);
                case "equals": return proxy == args[0];
                default: throw new UnsupportedOperationException(method.getName());
            }
        });
        // This calls goOnline()/waitForOnline() and starts WazeAppService with its real session ID.
        // Waze guards concurrent initialization with its own AtomicBoolean.
        Class.forName("com.waze.ls").getMethod("d", continuation).invoke(app, completion);
    }
}
