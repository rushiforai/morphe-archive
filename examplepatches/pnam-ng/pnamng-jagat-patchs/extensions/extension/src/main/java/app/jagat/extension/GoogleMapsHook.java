package app.jagat.extension;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Build;
import android.util.Base64;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class GoogleMapsHook {
    private static final String TAG = "JagatMorphe_Maps";
    private static final String TARGET_PACKAGE = "io.jagat.lite";

    // Jagat release certificate Base64 (1420 bytes, SHA-1: d20d46fbb5c97a1ffc41ce2c6e2da1efdac29bb1)
    private static final String ORIGINAL_CERT_B64 =
            "MIIFiDCCA3CgAwIBAgIUZdH1NHWsCvq8z0l2gJeUl/Eda/swDQYJKoZIhvcNAQELBQAwdDEL" +
            "MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDU1vdW50YWluIFZp" +
            "ZXcxFDASBgNVBAoTC0dvb2dsZSBJbmMuMRAwDgYDVQQLEwdBbmRyb2lkMRAwDgYDVQQDEwdB" +
            "bmRyb2lkMCAXDTIzMDIyNTA1NDEwOFoYDzIwNTMwMjI1MDU0MTA4WjB0MQswCQYDVQQGEwJV" +
            "UzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UE" +
            "ChMLR29vZ2xlIEluYy4xEDAOBgNVBAsTB0FuZHJvaWQxEDAOBgNVBAMTB0FuZHJvaWQwggIi" +
            "MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCti+8DloiQJQg/awkmmEsKmJQCVcEX2cip" +
            "YCtwBSUnepcWGsoIwaNfG76E/AlFjKr147R9BlVkX3jdkAzT8+8UQ3dBQ8QjKg7Qlv0tZZL0" +
            "yHTtsRIvPZtl9/BDRZqJtj13r2ujrOrshC66Uq+Ce8dD0fXPFgmLmLY/rcMB188VI+uBhPC3" +
            "xIt9cNv/ue7Db880x6JzseEeRk2FLUkm01h0dAKqI44n6lwpBBut9eq+FygwV9X4t9cMZ2dN" +
            "O9JgTysnKbgHGEdMHrOfNLvpDiHkqPdV/KDDvH8R6FXuMhXSIrZAUFg9DRb4BTe7k/lEoGrM" +
            "nh1se2XezwNaBbuGKwV6Epi8WN3ugUlAODqQg3CEayL9eid0TXS9em2/yCWcsOAbbgDMv4Tk" +
            "xnz4CKFxTHv2gFR85+43mSNWacE4p4L8rZSZCC/WaTDTiweP3CzjegH1mTPyRlCkQI3scgCB" +
            "GrHFMrN1y3FrCh3WzMgjv8EUKyY9MA2vnZMfoRBIaS1Iy/+MFDB5Y7zFG4+VfoY0HMAIokjt" +
            "ZnHzVbjrZY+kQbDEZJABg/qxyu/6m7IZj368ctTTFfmHnnGTstIpLXgyEB4Ib1yjcamTbgf5" +
            "SSDMwNjleiX22OQzvkcu/snjpxHsxwQfB1vvIkI/dOaLbboTfV1O/AuoXRMsR2MAOpHdrWyx" +
            "5QIDAQABoxAwDjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4ICAQAJR+HLfabIuMSx" +
            "8qfou6BKiwcriY0TLomfn4Ef8RJi2FZwWBKAKhhDGJSzipqgcwEym5qOo4VsrOM5pB+GddWS" +
            "oS8X5z4XyEQ46rgDWm2tFj9xTuOyugb8Vv38EzjZbWbrSQxstGLHBvZeTns1jZKhpW0zjtwD" +
            "e53H8fzfTxejhsClfB/hWfk77+679dWil1nbbUAQ1Ivf6kZvMHmaxMSnqj7OV9zJ+JZfnPJV" +
            "XfC6BXxXqfzvkiJRcV7KAtsJPd/KocMIDwVnXyWcQirOwn9zr1BCZPHOQZAkqwhfJVRx4+rm" +
            "vI75HemTA8UFOJYY8rg9AiIcOYV68brkI89ZnqUziOKk+hW0abhm4jTv3v5pvlmzzt0FS93I" +
            "m9CN6ZiX5gwKWJ08kTb67p5IA/7OKgEHfZqMlEKnzmpEgy/8Wcf4mczCLLIWamp4S/eGEVE2" +
            "smqQDcrkC8tCFzIL4FGxBFnaVYy13+lOKK4UiTHEGEnApGakLXs1LJrDdjbQiOF9fXS6XZU8" +
            "KggcaEzX3jViJwiVYwi7NZRwRFd+tTQI2wvYVceV0rgv3faeBwjpL9r3REBkTpVHCQBZcOl+" +
            "TkMV7W//cuLA9VNT8zJcR1trBH3PKXjT9uCRwXtpkHP9ovlxwFRaMezsj7CeFbpvfsli4jBf" +
            "ZOQBz35RFaJgcYPNoBTcPg==";

    // 20-byte SHA-1 hash bytes of Jagat's original certificate
    private static final byte[] ORIGINAL_SHA1_BYTES = new byte[]{
            (byte) 0xd2, (byte) 0x0d, (byte) 0x46, (byte) 0xfb, (byte) 0xb5,
            (byte) 0xc9, (byte) 0x7a, (byte) 0x1f, (byte) 0xfc, (byte) 0x41,
            (byte) 0xce, (byte) 0x2c, (byte) 0x6e, (byte) 0x2d, (byte) 0xa1,
            (byte) 0xef, (byte) 0xda, (byte) 0xc2, (byte) 0x9b, (byte) 0xb1
    };

    // Uppercase hex SHA-1 string (used by Places & Maps HTTP headers)
    public static final String ORIGINAL_SHA1_HEX = "D20D46FBB5C97A1FFC41CE2C6E2DA1EFDAC29BB1";

    private static Signature originalSignature;
    private static boolean initialized = false;

    public static synchronized void init(Context context) {
        if (initialized) {
            return;
        }
        initialized = true;

        try {
            byte[] certBytes = Base64.decode(ORIGINAL_CERT_B64, Base64.DEFAULT);
            originalSignature = new Signature(certBytes);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to decode original cert", t);
        }

        bypassHiddenApi();
        hookActivityThreadPackageManager();

        if (context != null) {
            hookContextPackageManager(context);
            Context appContext = context.getApplicationContext();
            if (appContext != null && appContext != context) {
                hookContextPackageManager(appContext);
            }
        }
        Log.i(TAG, "GoogleMapsHook initialized successfully");
    }

    private static void bypassHiddenApi() {
        try {
            Method forName = Class.class.getDeclaredMethod("forName", String.class);
            Method getDeclaredMethod = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, Class[].class);
            Class<?> vmRuntimeClass = (Class<?>) forName.invoke(null, "dalvik.system.VMRuntime");
            Method getRuntime = (Method) getDeclaredMethod.invoke(vmRuntimeClass, "getRuntime", (Class<?>[]) null);
            Method setHiddenApiExemptions = (Method) getDeclaredMethod.invoke(vmRuntimeClass, "setHiddenApiExemptions", new Class<?>[]{String[].class});
            Object vmRuntime = getRuntime.invoke(null);
            setHiddenApiExemptions.invoke(vmRuntime, new Object[]{new String[]{"L"}});
        } catch (Throwable t) {
            Log.w(TAG, "Bypass hidden api note: " + t.getMessage());
        }
    }

    private static void hookActivityThreadPackageManager() {
        try {
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Method getPackageManagerMethod = activityThreadClass.getDeclaredMethod("getPackageManager");
            getPackageManagerMethod.setAccessible(true);
            final Object originalPm = getPackageManagerMethod.invoke(null);
            if (originalPm == null) {
                return;
            }

            Class<?> iPackageManagerClass = Class.forName("android.content.pm.IPackageManager");
            Object proxyPm = Proxy.newProxyInstance(
                    iPackageManagerClass.getClassLoader(),
                    new Class<?>[]{iPackageManagerClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            String name = method.getName();
                            if (name.startsWith("getPackageInfo") && args != null && args.length > 0) {
                                String pkg = extractPackageName(args[0]);
                                if (TARGET_PACKAGE.equals(pkg)) {
                                    Object result = method.invoke(originalPm, args);
                                    if (result instanceof PackageInfo) {
                                        spoofPackageInfo((PackageInfo) result);
                                    }
                                    return result;
                                }
                            }
                            return method.invoke(originalPm, args);
                        }
                    }
            );

            Field sPackageManagerField = activityThreadClass.getDeclaredField("sPackageManager");
            sPackageManagerField.setAccessible(true);
            sPackageManagerField.set(null, proxyPm);
            Log.i(TAG, "Hooked ActivityThread.sPackageManager");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to hook ActivityThread.sPackageManager: " + t.getMessage());
        }
    }

    private static void hookContextPackageManager(Context context) {
        try {
            PackageManager pm = context.getPackageManager();
            if (pm != null) {
                // ApplicationPackageManager holds 'mPM' (IPackageManager)
                Field mPMField = null;
                Class<?> curr = pm.getClass();
                while (curr != null && curr != Object.class) {
                    try {
                        mPMField = curr.getDeclaredField("mPM");
                        break;
                    } catch (NoSuchFieldException e) {
                        curr = curr.getSuperclass();
                    }
                }
                if (mPMField != null) {
                    mPMField.setAccessible(true);
                    Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
                    Field sPackageManagerField = activityThreadClass.getDeclaredField("sPackageManager");
                    sPackageManagerField.setAccessible(true);
                    Object proxyPm = sPackageManagerField.get(null);
                    if (proxyPm != null) {
                        mPMField.set(pm, proxyPm);
                        Log.i(TAG, "Updated ApplicationPackageManager.mPM");
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to update Context.mPM: " + t.getMessage());
        }
    }

    private static String extractPackageName(Object obj) {
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj != null) {
            try {
                Method getPkgMethod = obj.getClass().getMethod("getPackageName");
                Object name = getPkgMethod.invoke(obj);
                if (name instanceof String) {
                    return (String) name;
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    public static void spoofPackageInfo(PackageInfo pi) {
        if (pi == null || originalSignature == null) {
            return;
        }
        pi.signatures = new Signature[]{originalSignature};

        if (Build.VERSION.SDK_INT >= 28 && pi.signingInfo != null) {
            try {
                Field signingDetailsField = SigningInfo.class.getDeclaredField("mSigningDetails");
                signingDetailsField.setAccessible(true);
                Object details = signingDetailsField.get(pi.signingInfo);
                if (details != null) {
                    Field sigs = details.getClass().getDeclaredField("signatures");
                    sigs.setAccessible(true);
                    sigs.set(details, new Signature[]{originalSignature});

                    Field pastSigs = details.getClass().getDeclaredField("pastSigningCertificates");
                    pastSigs.setAccessible(true);
                    pastSigs.set(details, new Signature[]{originalSignature});
                }
            } catch (Throwable ignored) {
            }
        }
    }

    // Direct helper for PackageManagerWrapper.getPackageInfo
    public static PackageInfo hookPackageInfo(PackageInfo pi, String packageName, int flags) {
        if (pi != null && TARGET_PACKAGE.equals(packageName)) {
            spoofPackageInfo(pi);
        }
        return pi;
    }

    // Direct helper for AndroidUtilsLight.getPackageCertificateHashBytes
    public static byte[] hookPackageCertificateHashBytes(Context context, String packageName) {
        if (TARGET_PACKAGE.equals(packageName)) {
            return ORIGINAL_SHA1_BYTES;
        }
        return null;
    }

    // Direct helper for Places CredentialsHelper (zzlk.zza)
    public static String hookCertificateFingerprint(PackageManager pm, String packageName) {
        if (TARGET_PACKAGE.equals(packageName)) {
            return ORIGINAL_SHA1_HEX;
        }
        return null;
    }
}
