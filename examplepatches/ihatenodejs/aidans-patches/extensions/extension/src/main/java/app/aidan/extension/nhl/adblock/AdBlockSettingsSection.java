package app.aidan.extension.nhl.adblock;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Renders the Aidan's Patches section and Ad Blocker row inside the native NHL Settings composable.
 */
public final class AdBlockSettingsSection {
    private static final String TAG = "AidanAdBlockSection";

    private AdBlockSettingsSection() {}

    public static void render(Context context, Object composer, int changed) {
        if (context == null || composer == null) return;
        try {
            Class<?> composerClass = Class.forName("pn3");
            Class<?> functionClass = Class.forName("kotlin.Function");
            Class<?> function0Class = Class.forName("kotlin.jvm.functions.Function0");
            Class<?> function2Class = Class.forName("kotlin.jvm.functions.Function2");
            Class<?> ptqClass = Class.forName("ptq");
            Class<?> mq8Class = Class.forName("mq8");
            Class<?> bj8Class = Class.forName("bj8");
            Class<?> qtbClass = Class.forName("qtb");
            Class<?> wtaClass = Class.forName("wta");

            // Build native String models
            Constructor<?> wtaCtor = wtaClass.getConstructor(String.class);
            Object headerTitleQtb = wtaCtor.newInstance("Aidan's Patches");
            Object rowTitleQtb = wtaCtor.newInstance("Ad Blocker");

            // Click callback
            Object clickProxy = Proxy.newProxyInstance(
                    function0Class.getClassLoader(),
                    new Class<?>[] { function0Class },
                    (proxy, method, args) -> {
                        if ("equals".equals(method.getName())) {
                            return proxy == (args != null && args.length > 0 ? args[0] : null);
                        }
                        if ("hashCode".equals(method.getName())) {
                            return System.identityHashCode(proxy);
                        }
                        if ("toString".equals(method.getName())) {
                            return "AidanClickProxy";
                        }
                        if ("invoke".equals(method.getName())) {
                            SettingsBridge.launchSettings(context);
                        }
                        return null;
                    }
            );

            // Native Settings Row composable: Lbj8;->h(qtb, onClick, trailing, composer, changed, default)
            Method rowMethod = bj8Class.getMethod(
                    "h",
                    qtbClass,
                    function0Class,
                    function2Class,
                    composerClass,
                    int.class,
                    int.class
            );

            Object rowProxy = Proxy.newProxyInstance(
                    function2Class.getClassLoader(),
                    new Class<?>[] { function2Class },
                    (proxy, method, args) -> {
                        if ("equals".equals(method.getName())) {
                            return proxy == (args != null && args.length > 0 ? args[0] : null);
                        }
                        if ("hashCode".equals(method.getName())) {
                            return System.identityHashCode(proxy);
                        }
                        if ("toString".equals(method.getName())) {
                            return "AidanRowProxy";
                        }
                        if ("invoke".equals(method.getName()) && args != null && args.length >= 2) {
                            try {
                                rowMethod.invoke(null, rowTitleQtb, clickProxy, null, args[0], 6, 4);
                            } catch (Throwable t) {
                                Log.e(TAG, "Failed to invoke row composable", t);
                            }
                        }
                        return null;
                    }
            );

            // Wrap in ComposableLambda sf3: ptq.k0(-0x3a102, rowProxy, composer)
            Method k0Method = ptqClass.getMethod("k0", int.class, functionClass, composerClass);
            Object rowSf3 = k0Method.invoke(null, -0x3a102, rowProxy, composer);

            Object rowArray = Array.newInstance(function2Class, 1);
            Array.set(rowArray, 0, rowSf3);

            // Native Section & Card Container: Lmq8;->g(Lqtb;[Lkotlin/jvm/functions/Function2;Lpn3;I)V
            Method gMethod = mq8Class.getMethod("g", qtbClass, rowArray.getClass(), composerClass, int.class);
            gMethod.invoke(null, headerTitleQtb, rowArray, composer, 6);
        } catch (Throwable t) {
            Log.w(TAG, "Failed to render section via Compose reflection", t);
        }
    }
}
