package app.template.extension.zalo.shared;

import android.app.Activity;
import android.content.Context;

/** Reflection helpers for Zalo's runtime: app context, signed-in account, language, coroutines. */
public final class ZaloEnv {
    private ZaloEnv() { }

    public static void collectNativeFlow(Object flow) throws ReflectiveOperationException {
        Object ioContext = Class.forName("kotlinx.coroutines.scheduling.DefaultIoScheduler")
            .getField("c").get(null);
        Class<?> scopeClass = Class.forName("kotlinx.coroutines.CoroutineScope");
        Object scope = null;
        for (java.lang.reflect.Method method : Class.forName("kotlinx.coroutines.CoroutineScopeKt").getMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (java.lang.reflect.Modifier.isStatic(method.getModifiers()) && types.length == 1
                && types[0].isInstance(ioContext) && scopeClass.isAssignableFrom(method.getReturnType())) {
                scope = method.invoke(null, ioContext);
                break;
            }
        }
        Class<?> flowClass = Class.forName("kotlinx.coroutines.flow.Flow");
        Class<?> flowKtClass = Class.forName("kotlinx.coroutines.flow.FlowKt");
        Class<?> jobClass = Class.forName("kotlinx.coroutines.Job");
        for (java.lang.reflect.Method method : flowKtClass.getMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (scope != null && java.lang.reflect.Modifier.isStatic(method.getModifiers())
                && types.length == 2 && types[0] == flowClass && types[1] == scopeClass
                && jobClass.isAssignableFrom(method.getReturnType())) {
                method.invoke(null, flow, scope);
                return;
            }
        }
        throw new NoSuchMethodException("launchIn");
    }

    public static String currentAccount() {
        try {
            Object account = Class.forName("com.zing.zalocore.CoreUtility").getField("i").get(null);
            return account instanceof String ? (String) account : null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    public static Context appContext() {
        try {
            return (Context) Class.forName("com.zing.zalo.MainApplication")
                .getMethod("getAppContext").invoke(null);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    public static Activity activityOf(Context context) {
        Context current = context;
        while (current instanceof android.content.ContextWrapper) {
            if (current instanceof Activity) return (Activity) current;
            Context base = ((android.content.ContextWrapper) current).getBaseContext();
            if (base == current) break;
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    public static boolean isVietnamese(Context context) {
        try {
            Object language = Class.forName("z0r").getField("b").get(null);
            if ("vi".equals(language)) return true;
            if ("en".equals(language)) return false;
        } catch (ReflectiveOperationException | SecurityException ignored) { }
        return "vi".equals(context.getResources().getConfiguration().locale.getLanguage());
    }
}
