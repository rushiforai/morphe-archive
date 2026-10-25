package com.kveld9.morphe.extra.extension;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.security.MessageDigest;
import java.util.Map;

public class MoovitHelper {
    private static volatile String pkg;
    private static final String EXPECTED_SHA1 = "c56abf7c6890113ed6654e381e2a1797da3e7f6a";
    private static final String ORIGINAL_CERT_HEX = "308202e3308201cba00302010202044466415d300d06092a864886f70d01010b05003021310b300906035504061302494c31123010060355040a13095472616e7a6d6174653020170d3132303332363137343031315a180f32303632303331343137343031315a3021310b300906035504061302494c31123010060355040a13095472616e7a6d61746530820122300d06092a864886f70d01010105000382010f003082010a028201010087bedc6b170764c5bca1ea3e9d1ebb00a2398731e03f83e6c90f75379f9b178e4a27616211955991b7a18279f4b6f6c06e81fbfc440bcefafb63039dcff929bcc461ccaa7dfc04d6489785dae1abca340b404b83a0763950747b48a3239ba5b12968e4713b15272043c127d3df7b2eb692fc39ce7aac1411a82981815e2d2587952b05bcaf8b3b4d7f63e9dd7e4ca39c40b63a65e79a2c9b22b6699d6d1ee8c4bc890cf5c6bc4edc1bc18df450af3ea93be11d9cab8e7c240a29a987a6f1f9bf95ae59bd3d2d4387750788b0611678f3e8374bb8547c1ca3a68918a856d17f934e05c60c233447d2da5fe9dc50e2b0d0c481ea2e066d8531d26c77c5d65873ad0203010001a321301f301d0603551d0e04160414200a489821eac3b85b8905bf305210890a0b5229300d06092a864886f70d01010b050003820101002195db14b98be526c79eb10f2628da6c5f25a9123cdbe3fc1279d485758e6acc0a64bc36370801b6472bc212618481a29462e8890110ffac423195b9978500e0b7cbc3264d83288686659847c8fd701860ea4d23ee77a74b4cf9e18d2a2b1f0b540106c519c0c1a45622f756b8b2925d39fc93ea090858410cf2ceeb14f70571c5c16a3d0ab4b904bbf4efe8abc2322000513fe25863ec1e0f026c24d2986e67053726093b36c966a446768fa988d17a6d87dfe9820aa7b6267ba81f0ef446d93f7079ecbdb0ff0fdf5bca90cf0e3161a5aff941949e666f9b385ae723614f03b7c361c4f56a96ea453e24df932e67249714b1a762f511cde08f7135adcda580";

    public static void init(Application app) {
        try {
            if (app != null) {
                pkg = app.getPackageName();
            }
            bypassHiddenApi();
            Object proxy = installPackageManagerProxy();
            installServiceManagerHook(proxy);
            verifySpoof(app);
        } catch (Throwable t) {
            String msg = t.getMessage();
            System.out.println("[Fix Google Maps] Spoof inactive: " + (msg != null ? msg : t.getClass().getSimpleName()) + ".");
        }
    }

    private static void bypassHiddenApi() {
        try {
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
                org.lsposed.hiddenapibypass.HiddenApiBypass.addHiddenApiExemptions("L");
            }
        } catch (Throwable t) {
            String msg = t.getMessage();
            System.out.println("[Fix Google Maps] Setup note: HiddenApiBypass failed: " + (msg != null ? msg : t.getClass().getSimpleName()));
        }
    }

    private static Object installPackageManagerProxy() {
        try {
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Field sPackageManagerField = activityThreadClass.getDeclaredField("sPackageManager");
            sPackageManagerField.setAccessible(true);

            Object original = getOriginalPackageManager(activityThreadClass, sPackageManagerField);
            if (original == null) {
                System.out.println("[Fix Google Maps] Setup note: sPackageManager hook failed: original package manager is null");
                return null;
            }

            Object proxy = createPackageManagerProxy(original);
            sPackageManagerField.set(null, proxy);
            return proxy;
        } catch (Throwable t) {
            String msg = t.getMessage();
            System.out.println("[Fix Google Maps] Setup note: sPackageManager hook failed: " + (msg != null ? msg : t.getClass().getSimpleName()));
            return null;
        }
    }

    private static Object getOriginalPackageManager(Class<?> activityThreadClass, Field sPackageManagerField) throws Exception {
        Object current = sPackageManagerField.get(null);
        if (current == null) {
            Method getMethod = activityThreadClass.getDeclaredMethod("getPackageManager");
            getMethod.setAccessible(true);
            getMethod.invoke(null);
            current = sPackageManagerField.get(null);
        }
        return current;
    }

    private static Object createPackageManagerProxy(final Object original) throws Exception {
        Class<?> iPackageManagerClass = Class.forName("android.content.pm.IPackageManager");
        return Proxy.newProxyInstance(
            iPackageManagerClass.getClassLoader(),
            new Class<?>[] { iPackageManagerClass },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if (isPackageInfoCall(method, args)) {
                        PackageInfo info = (PackageInfo) method.invoke(original, args);
                        if (info != null) spoofSignature(info);
                        return info;
                    }
                    return invokeTarget(original, method, args);
                }
            }
        );
    }

    private static boolean isPackageInfoCall(Method method, Object[] args) {
        if (pkg == null || args == null || args.length == 0 || !pkg.equals(args[0])) return false;
        if (!PackageInfo.class.isAssignableFrom(method.getReturnType())) return false;
        return method.getName().contains("PackageInfo");
    }

    private static Object invokeTarget(Object target, Method method, Object[] args) throws Throwable {
        try {
            return method.invoke(target, args);
        } catch (InvocationTargetException e) {
            throw e.getTargetException();
        }
    }

    private static void installServiceManagerHook(final Object packageManagerProxy) {
        if (packageManagerProxy == null) return;
        try {
            Class<?> serviceManagerClass = Class.forName("android.os.ServiceManager");
            Field sCacheField = serviceManagerClass.getDeclaredField("sCache");
            sCacheField.setAccessible(true);
            @SuppressWarnings("unchecked")
            Map<String, android.os.IBinder> sCache =
                (Map<String, android.os.IBinder>) sCacheField.get(null);
            final android.os.IBinder originalBinder =
                (android.os.IBinder) serviceManagerClass.getMethod("getService", String.class).invoke(null, "package");
            if (originalBinder != null && sCache != null) {
                android.os.IBinder proxiedBinder = createServiceBinderProxy(originalBinder, packageManagerProxy);
                sCache.put("package", proxiedBinder);
            }
        } catch (Throwable t) {
            String msg = t.getMessage();
            System.out.println("[Fix Google Maps] Setup note: ServiceManager hook failed: " + (msg != null ? msg : t.getClass().getSimpleName()));
        }
    }

    private static android.os.IBinder createServiceBinderProxy(final android.os.IBinder originalBinder, final Object packageManagerProxy) {
        return (android.os.IBinder) Proxy.newProxyInstance(
            android.os.IBinder.class.getClassLoader(),
            new Class<?>[] { android.os.IBinder.class },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if ("queryLocalInterface".equals(method.getName())) return packageManagerProxy;
                    return invokeTarget(originalBinder, method, args);
                }
            }
        );
    }

    private static void verifySpoof(Application app) {
        if (app == null) {
            System.out.println("[Fix Google Maps] Spoof inactive: application context is null.");
            return;
        }
        try {
            // Query through ActivityThread.sPackageManager: this is the exact object every
            // in-process PackageManagerService consumer resolves, so it exercises the hook
            // itself instead of any framework-level caching above it.
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Field f = atClass.getDeclaredField("sPackageManager");
            f.setAccessible(true);
            Object pm = f.get(null);
            if (pm == null) {
                System.out.println("[Fix Google Maps] Spoof inactive: package manager unavailable.");
            } else {
                PackageInfo info = queryOwnPackageInfo(pm);
                checkVerdict(info, installedSha1(info));
            }
        } catch (Throwable t) {
            String msg = t.getMessage();
            System.out.println("[Fix Google Maps] Spoof inactive: " + (msg != null ? msg : t.getClass().getSimpleName()) + ".");
        }
        probePlayServices(app);
    }

    private static void probePlayServices(Application app) {
        if (app == null) return;
        try {
            Class<?> gmsClass = Class.forName("com.google.android.gms.common.GoogleApiAvailability");
            Object instance = gmsClass.getField("f").get(null);
            Class<?> aClass = Class.forName("com.google.android.gms.common.a");
            int minVersion = aClass.getField("a").getInt(null);
            Method checkMethod = aClass.getMethod("c", android.content.Context.class, int.class);
            int code = (Integer) checkMethod.invoke(instance, app, minVersion);
            System.out.println("[Fix Google Maps] Play Services availability: " + code + ".");
            if (code == 1 || code == 3 || code == 9) {
                System.out.println("[Fix Google Maps] Setup note: Play Services unavailable (" + code + "); Google engine will fall back to Nutiteq.");
            }
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Play Services availability: " + t.getClass().getSimpleName() + ".");
        }
    }

    private static PackageInfo queryOwnPackageInfo(Object pm) throws Throwable {
        int userId = myUserId();
        long flags = (long) PackageManager.GET_SIGNATURES;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
            flags |= PackageManager.GET_SIGNING_CERTIFICATES;
        }
        try {
            Method m = pm.getClass().getMethod("getPackageInfo", String.class, long.class, int.class);
            return (PackageInfo) m.invoke(pm, pkg, flags, userId);
        } catch (NoSuchMethodException e) {
            Method m = pm.getClass().getMethod("getPackageInfo", String.class, int.class, int.class);
            return (PackageInfo) m.invoke(pm, pkg, (int) flags, userId);
        }
    }

    private static int myUserId() {
        try {
            Method m = Class.forName("android.os.UserHandle").getMethod("myUserId");
            return ((Integer) m.invoke(null)).intValue();
        } catch (Throwable t) {
            return 0;
        }
    }

    private static String installedSha1(PackageInfo info) {
        if (info == null) return null;
        if (info.signatures != null && info.signatures.length > 0 && info.signatures[0] != null) {
            return sha1Hex(info.signatures[0].toByteArray());
        }
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P && info.signingInfo != null) {
            try {
                Signature[] history = info.signingInfo.getSigningCertificateHistory();
                if (history != null && history.length > 0 && history[0] != null) {
                    return sha1Hex(history[0].toByteArray());
                }
                Signature[] signers = info.signingInfo.getApkContentsSigners();
                if (signers != null && signers.length > 0 && signers[0] != null) {
                    return sha1Hex(signers[0].toByteArray());
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static void checkVerdict(PackageInfo info, String actualSha1) {
        if (actualSha1 == null) {
            System.out.println("[Fix Google Maps] Spoof inactive: no signature found.");
            return;
        }
        if (EXPECTED_SHA1.equalsIgnoreCase(actualSha1)) {
            System.out.println("[Fix Google Maps] Signature spoof active (sha1=" + EXPECTED_SHA1 + ").");
            checkSigningInfoVerdict(info);
        } else {
            System.out.println("[Fix Google Maps] Spoof inactive: signature mismatch (sha1=" + actualSha1 + ").");
        }
    }

    private static void checkSigningInfoVerdict(PackageInfo info) {
        if (android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.P) {
            System.out.println("[Fix Google Maps] Setup note: signingInfo NOT spoofed (API < 28).");
            return;
        }
        if (info == null || info.signingInfo == null) {
            System.out.println("[Fix Google Maps] Setup note: signingInfo NOT spoofed (signingInfo is null).");
            return;
        }
        try {
            Signature sig = null;
            try {
                Signature[] history = info.signingInfo.getSigningCertificateHistory();
                if (history != null && history.length > 0 && history[0] != null) {
                    sig = history[0];
                }
            } catch (Throwable ignored) { }
            if (sig == null) {
                try {
                    Signature[] signers = info.signingInfo.getApkContentsSigners();
                    if (signers != null && signers.length > 0 && signers[0] != null) {
                        sig = signers[0];
                    }
                } catch (Throwable ignored) { }
            }
            if (sig == null) {
                System.out.println("[Fix Google Maps] Setup note: signingInfo NOT spoofed (no certificate found).");
                return;
            }
            String actualSha1 = sha1Hex(sig.toByteArray());
            if (EXPECTED_SHA1.equalsIgnoreCase(actualSha1)) {
                System.out.println("[Fix Google Maps] SigningInfo spoof active (sha1=" + EXPECTED_SHA1 + ").");
            } else {
                System.out.println("[Fix Google Maps] Setup note: signingInfo NOT spoofed (signature mismatch: sha1=" + actualSha1 + ").");
            }
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Setup note: signingInfo NOT spoofed (" + t.getClass().getSimpleName() + ").");
        }
    }

    private static String sha1Hex(byte[] data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] digest = md.digest(data);
            StringBuilder sb = new StringBuilder(digest.length * 2);
            for (byte b : digest) {
                sb.append(Character.forDigit((b >> 4) & 0xf, 16));
                sb.append(Character.forDigit(b & 0xf, 16));
            }
            return sb.toString();
        } catch (Throwable t) {
            return "";
        }
    }

    @android.annotation.SuppressLint("SoonBlockedPrivateApi")
    private static void spoofSignature(PackageInfo info) {
        byte[] certBytes = hexToBytes(ORIGINAL_CERT_HEX);
        Signature sig = new Signature(certBytes);
        info.signatures = new Signature[] { sig };
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
            spoofSigningInfo(info, sig);
        }
    }

    // Safe: runtime guarded by SDK_INT >= P check in spoofSignature and Throwable catch.
    @android.annotation.SuppressLint("NewApi")
    private static void spoofSigningInfo(PackageInfo info, Signature sig) {
        try {
            Class<?> sdClass;
            try {
                sdClass = Class.forName("android.content.pm.SigningDetails");
            } catch (Throwable t) {
                System.out.println("[Fix Google Maps] Setup note: SigningDetails class lookup failed: " + t.getClass().getSimpleName());
                return;
            }
            Object signingDetails = createSigningDetails(sdClass, sig);
            if (signingDetails != null) {
                SigningInfo si = createSigningInfo(sdClass, signingDetails);
                if (si != null) {
                    try {
                        info.signingInfo = si;
                    } catch (Throwable t) {
                        System.out.println("[Fix Google Maps] Setup note: PackageInfo.signingInfo field assignment failed: " + t.getClass().getSimpleName());
                    }
                }
            }
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Setup note: spoofSigningInfo failed: " + t.getClass().getSimpleName());
        }
    }

    private static Object createSigningDetails(Class<?> sdClass, Signature sig) {
        try {
            Class<?> builderClass = Class.forName("android.content.pm.SigningDetails$Builder");
            Object builder = builderClass.getConstructor().newInstance();
            builderClass.getDeclaredMethod("setSignatures", Signature[].class)
                .invoke(builder, (Object) new Signature[]{sig});
            builderClass.getDeclaredMethod("setSignatureSchemeVersion", int.class)
                .invoke(builder, 1);
            return builderClass.getDeclaredMethod("build").invoke(builder);
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Setup note: SigningDetails$Builder failed: " + t.getClass().getSimpleName());
            return createSigningDetailsViaConstructor(sdClass, sig);
        }
    }

    private static Object createSigningDetailsViaConstructor(Class<?> sdClass, Signature sig) {
        try {
            for (Constructor<?> c : sdClass.getDeclaredConstructors()) {
                c.setAccessible(true);
                Class<?>[] p = c.getParameterTypes();
                if (p.length == 2 && p[0] == Signature[].class && p[1] == int.class) {
                    try {
                        return c.newInstance(new Signature[]{sig}, 1);
                    } catch (Throwable t) {
                        System.out.println("[Fix Google Maps] Setup note: SigningDetails constructor failed: " + t.getClass().getSimpleName());
                        return null;
                    }
                }
            }
            System.out.println("[Fix Google Maps] Setup note: SigningDetails constructor failed: NoSuchMethodException");
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Setup note: SigningDetails constructor failed: " + t.getClass().getSimpleName());
        }
        return null;
    }

    // Safe: runtime guarded by SDK_INT >= P check in caller chain and reflection with Throwable catch.
    @android.annotation.SuppressLint("NewApi")
    private static SigningInfo createSigningInfo(Class<?> sdClass, Object signingDetails) {
        try {
            Constructor<SigningInfo> c = SigningInfo.class.getDeclaredConstructor(sdClass);
            c.setAccessible(true);
            return c.newInstance(signingDetails);
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Setup note: SigningInfo constructor failed: " + t.getClass().getSimpleName());
            return createSigningInfoFallback(signingDetails);
        }
    }

    // Safe: runtime guarded by SDK_INT >= P check in caller chain and reflection with Throwable catch.
    @android.annotation.SuppressLint({"NewApi", "SoonBlockedPrivateApi"})
    private static SigningInfo createSigningInfoFallback(Object signingDetails) {
        try {
            SigningInfo si = new SigningInfo();
            Field f = SigningInfo.class.getDeclaredField("mSigningDetails");
            f.setAccessible(true);
            f.set(si, signingDetails);
            return si;
        } catch (Throwable t) {
            System.out.println("[Fix Google Maps] Setup note: SigningInfo field assignment failed: " + t.getClass().getSimpleName());
            return null;
        }
    }

    private static byte[] hexToBytes(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2)
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i+1), 16));
        return data;
    }
}
