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
            Class<?> composerClass = Class.forName("bu3");
            Class<?> functionClass = Class.forName("kotlin.Function");
            Class<?> function0Class = Class.forName("kotlin.jvm.functions.Function0");
            Class<?> function2Class = Class.forName("kotlin.jvm.functions.Function2");
            Class<?> lambdaFactoryClass = Class.forName("mqp");
            Class<?> sectionClass = Class.forName("oo9");
            Class<?> rowClass = Class.forName("zg9");
            Class<?> stringModelBaseClass = Class.forName("igc");
            Class<?> stringModelClass = Class.forName("hgb");

            // Build native String models
            Constructor<?> stringModelCtor = stringModelClass.getConstructor(String.class);
            Object headerTitle = stringModelCtor.newInstance("Aidan's Patches");
            Object rowTitle = stringModelCtor.newInstance("Ad Blocker");

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

            // Native Settings Row composable: Lzg9;->h(igc, onClick, trailing, composer, changed, default)
            Method rowMethod = rowClass.getMethod(
                    "h",
                    stringModelBaseClass,
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
                                rowMethod.invoke(null, rowTitle, clickProxy, null, args[0], 6, 4);
                            } catch (Throwable t) {
                                Log.e(TAG, "Failed to invoke row composable", t);
                            }
                        }
                        return null;
                    }
            );

            // Wrap in ComposableLambda dm3: mqp.P(-0x3a102, rowProxy, composer)
            Method lambdaMethod = lambdaFactoryClass.getMethod("P", int.class, functionClass, composerClass);
            Object rowSf3 = lambdaMethod.invoke(null, -0x3a102, rowProxy, composer);

            Object rowArray = Array.newInstance(function2Class, 1);
            Array.set(rowArray, 0, rowSf3);

            // Native Section & Card Container: Loo9;->d(Ligc;[Lkotlin/jvm/functions/Function2;Lbu3;I)V
            Method dMethod = sectionClass.getMethod("d", stringModelBaseClass, rowArray.getClass(), composerClass, int.class);
            dMethod.invoke(null, headerTitle, rowArray, composer, 6);
        } catch (Throwable t) {
            Log.w(TAG, "Failed to render section via Compose reflection", t);
        }
    }
}
