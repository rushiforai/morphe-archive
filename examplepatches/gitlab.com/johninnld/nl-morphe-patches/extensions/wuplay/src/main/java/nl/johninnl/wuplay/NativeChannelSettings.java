package nl.johninnl.wuplay;

import android.content.Context;
import android.content.Intent;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** Append one native Compose row to the checked Wuplay Catalogs settings builder. */
public final class NativeChannelSettings {
    private NativeChannelSettings() {}

    public static void appendRow(Object scope, Object onBack) {
        try {
            Class<?> function3 = Class.forName("kotlin.jvm.functions.Function3");
            Object content = Proxy.newProxyInstance(function3.getClassLoader(), new Class<?>[]{function3}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) return objectMethod(proxy, method, args);
                render(args[1], onBack);
                return unit();
            });
            Class.forName("androidx.compose.foundation.lazy.LazyListIntervalContent")
                .getMethod("item", Object.class, String.class, function3)
                .invoke(scope, "morphe-wuplay-tv-channels", "morphe-settings", content);
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Wuplay Catalogs settings ABI changed", failure);
        }
    }

    private static void render(Object composer, Object onBack) throws ReflectiveOperationException {
        Class<?> composerType = Class.forName("androidx.compose.runtime.GapComposer");
        Class<?> localType = Class.forName("androidx.compose.runtime.ProvidableCompositionLocal");
        Object localContext = Class.forName("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt")
            .getField("LocalContext").get(null);
        Context context = (Context) composerType.getMethod("consume", localType).invoke(composer, localContext);
        Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0");
        Object click = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) return objectMethod(proxy, method, args);
            context.startActivity(new Intent(context, CatalogSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return unit();
        });
        Class.forName("app.wuplay.androidtv.ui.screens.settings.SettingRowKt").getMethod("SettingRow",
            String.class, String.class, function0, Class.forName("androidx.compose.ui.Modifier"), String.class,
            Class.forName("androidx.compose.ui.focus.FocusRequester"), function0, function0,
            boolean.class, boolean.class, composerType, int.class, int.class)
            .invoke(null, "TV channels", "Home catalogs", click, null,
                "Choose which Home catalogs are published to your TV", null, onBack, null,
                false, true, composer, 0, 8);
    }

    private static Object unit() throws ReflectiveOperationException {
        return Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
    }

    private static Object objectMethod(Object proxy, Method method, Object[] args) {
        if (method.getName().equals("equals")) return proxy == args[0];
        if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
        return "Wuplay TV channels setting";
    }
}
