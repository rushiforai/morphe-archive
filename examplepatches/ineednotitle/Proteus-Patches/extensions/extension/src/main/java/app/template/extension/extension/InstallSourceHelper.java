package app.template.extension.extension;

import android.content.pm.InstallSourceInfo;
import android.os.Build;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Binder-level install-source spoofing (Layer 2 of "Spoof install source").
 *
 * {@code ActivityThread.sPackageManager} is the process-wide binder proxy that
 * backs every PackageManager call, including calls made from freshly obtained
 * PackageManager instances. Wrapping it in a Java proxy means the spoofed
 * installer is returned for <em>any</em> code path, not just the DEX call sites
 * patched by Layer 1.
 *
 * Both {@code ActivityThread} and {@code IPackageManager} are hidden APIs, so on
 * Android 9+ the lookup is likely to be refused by the hidden-API policy. Every
 * step is best-effort and swallows failures: when the proxy cannot be installed
 * the app keeps the behaviour of Layer 1 (and the real install source).
 */
public final class InstallSourceHelper {

    private static volatile String installerPackageName;

    private InstallSourceHelper() {}

    /**
     * Called from the patched Application.onCreate().
     *
     * @param installer package name to report as the installing store
     *                  (e.g. {@code com.android.vending}).
     */
    public static void init(String installer) {
        if (installer == null || installer.length() == 0) return;
        installerPackageName = installer;
        try {
            installPackageManagerProxy();
        } catch (Throwable ignored) {
            // Hidden API blocked or unexpected platform layout — Layer 1 covers it.
        }
    }

    private static void installPackageManagerProxy() throws Throwable {
        Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
        Method currentActivityThread =
                activityThreadClass.getDeclaredMethod("currentActivityThread");
        currentActivityThread.setAccessible(true);
        Object activityThread = currentActivityThread.invoke(null);
        if (activityThread == null) return;

        Field sPackageManagerField = activityThreadClass.getDeclaredField("sPackageManager");
        sPackageManagerField.setAccessible(true);
        final Object realPackageManager = sPackageManagerField.get(activityThread);
        if (realPackageManager == null || Proxy.isProxyClass(realPackageManager.getClass())) {
            return;
        }

        Class<?> iPackageManagerClass = Class.forName("android.content.pm.IPackageManager");
        InvocationHandler handler = new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                String name = method.getName();
                if ("getInstallerPackageName".equals(name)) {
                    String installer = installerPackageName;
                    if (installer != null) return installer;
                }
                Object result = method.invoke(realPackageManager, args);
                // InstallSourceInfo only exists from API 30 — touching the class on an
                // older device would throw NoClassDefFoundError inside the proxy and
                // break the PackageManager call itself.
                if ("getInstallSourceInfo".equals(name)
                        && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R
                        && result instanceof InstallSourceInfo) {
                    spoofInstallSourceInfo((InstallSourceInfo) result);
                }
                return result;
            }
        };

        Object proxyPackageManager = Proxy.newProxyInstance(
                iPackageManagerClass.getClassLoader(),
                new Class<?>[]{iPackageManagerClass},
                handler);
        sPackageManagerField.set(activityThread, proxyPackageManager);
    }

    /**
     * InstallSourceInfo's fields are private, so rewrite them reflectively when
     * the platform allows it. Failure simply leaves the real values in place.
     */
    private static void spoofInstallSourceInfo(InstallSourceInfo info) {
        String installer = installerPackageName;
        if (info == null || installer == null) return;
        String[] fields = {
                "mInitiatingPackageName",
                "mInstallingPackageName",
                "mOriginatingPackageName",
        };
        for (String fieldName : fields) {
            try {
                Field field = InstallSourceInfo.class.getDeclaredField(fieldName);
                field.setAccessible(true);
                field.set(info, installer);
            } catch (Throwable ignored) {
                // Field renamed or hidden — skip it.
            }
        }
    }
}
