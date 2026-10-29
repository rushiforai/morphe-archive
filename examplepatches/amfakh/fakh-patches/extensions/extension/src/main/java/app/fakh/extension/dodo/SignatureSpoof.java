package app.fakh.extension.dodo;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Makes the app see its original Play App Signing certificate instead of the one a patched APK is
 * resigned with. DoDo signs its API requests (SignInterceptor -> SignManager) with the app's own
 * signing certificate, and the server keys the encrypted song payload to it; a resigned APK sends the
 * wrong certificate, so the downloaded song fails to decrypt (TestJni.o2 returns null) and playback
 * hangs on "loading". This has nothing to do with premium: every song is affected.
 *
 * The fix wraps the system IPackageManager held in ActivityThread with a dynamic proxy that rewrites
 * the certificate in every PackageInfo returned for this package, so GET_SIGNATURES and
 * GET_SIGNING_CERTIFICATES reads yield the original. Pure reflection, no root, no native code. It must
 * run before the app reads its own signature, i.e. at the very start of Application.attachBaseContext.
 *
 * The approach (replacing ActivityThread.sPackageManager with a proxy) is the one used by
 * ApkSignatureKillerEx (https://github.com/L-JINBIN/ApkSignatureKillerEx), reimplemented here as a
 * Binder-interface proxy rather than its ART field edits, which do not hold on recent Android.
 */
@SuppressWarnings("unused")
public final class SignatureSpoof {
    private static final String TAG = "FakhDodo";

    /** This app's package; the proxy only rewrites PackageInfo for it. */
    private static final String PACKAGE_NAME = "com.dundunstudio.autoplay";

    /** DoDo's original Play App Signing certificate (DER, Base64). SHA-1 7dd6724c683c33fbe5cb0d3332d4e5204a938c14. */
    private static final String ORIGINAL_CERT =
        "MIIFiDCCA3CgAwIBAgIUeR97XEfY5LlSFHRQa+DM8ywVtOcwDQYJKoZIhvcNAQELBQAwdDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC0dvb2dsZSBJbmMuMRAwDgYDVQQLEwdBbmRyb2lkMRAwDgYDVQQDEwdBbmRyb2lkMCAXDTIzMTEwNDEwMTg1N1oYDzIwNTMxMTA0MTAxODU3WjB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLR29vZ2xlIEluYy4xEDAOBgNVBAsTB0FuZHJvaWQxEDAOBgNVBAMTB0FuZHJvaWQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCip9Gxyw6Md8BB3rguThyRk5nCrzXV68teol9gBfm/yVZAmiMC97ThIo7NzaFKlXZptddiKohx7pcIIrkK5hMuOo/8kx8DbUybUvTvWeWyFC4ncB5S9TK8mG3cOWtSLH8gvaFt3WJBZqq4HAQnUG0CRKdmm+1jfLB37qkohsB4V/zgDC8Hn3LEP1FFIB4kpKeuYRMbmmLpzpliPWL+wuCO9EaLe/GPqkHHXzStwVbDzI77R00Ssw1rKtgrpNi1/8LMkVZy1yxXioubpkapp0el5q6hvP9Ig6HfQfB1fgm7Q2rYwbtG990OGYiR5n1BNmbJqy00LUeFVcX1Ub+TE4bfqSDZ01C3JjH+DbFWplfAjh1paAsfBmjA05xC+3YJgEa+mcoUMdz5ZHkyWovcUsB84lFh5FOnYTPWFtIbZ0j78arBt87Ymw1T54y0RLfvlzkNKNarkZldZRYefa5/z4zE4cF+jWIA/OSIgeg6atvpgfqKp/Izt6D32wFjQNmMAPJ7d45Ia3ErP5qrOsVUkr45TdzqAVk0T2PtpGf4uoMPM6SfAi8/BlkrvaeVeTfxj1gdmHgDNz3LXMG4NEyoNQbgUJGTA28IFv6pPoL1oVg/h/S1wLrTgaxZcbKGBj4Z+ohjE1QRKDTf3MqI4EmLkxaDYHSGh6vDDNPYymnJkjZakQIDAQABoxAwDjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4ICAQAvR5XlK+egKmxYJzK+CMjrS5cFA3gLESibfHv0wlLGfx+MuD0XXVNvDLP1rEuBbyow2Hz5/bR42R9X55qfGn8eREAZyRSzg00w/7UA/7oNxdH5g5L2u78fX2gq+GHe7TfWFunmVwdTfAd0Rf+3uvyCSproTn/h7qFIXC1peHZPX+vruTCRhs46eVLW/eQ37OEJDDx5FHfOekiA7ZeqgQUxCYSIyyNUL69ekGpekSQjkF71+NBILiF5iO/zk1oxiDF+tylPgcCiJPr0gSKb5sKVH3Dgt0WyUVHFOv+MXHNAL/CFkb49Y3QL+NLJbP/7ctL2IeerDJVPeA1RdS61NNSqP9235rCAK6QLOdVC4B3ov4TdJD7zYxJLu32ANA70MBlCm6BFrdx/GKctkMDguzT+NgFEcmXCGtBZRKwlpNfxZRdnAqzZuznCHRASykTZ3QgYAkXcGnya3L5/hTgMDhtiuZgsEXsQS2h0n+X+K5c2iyJDb0uCIQ70kZEgyU+dKGBfMNxaLBk6N42RCpkhM5HQWrpFJJ1/mwj+iLle4Fe3yNQ+PWVAsZrQxOWlgTJbVbZZExZTDQCCbov5BG/067WLeyYVmqrtyJm7ZU/hfTdMLxxatXY1/vHsxYdS1X9GfbKixeB0IUK3OZ9T/zD+CxVNOL1eBsh2AkYPFTgh877ing==";

    private static Signature originalSignature;
    private static boolean installed;

    private SignatureSpoof() {
    }

    /** Installs the proxy once. Safe to call more than once and never throws into the caller. */
    public static synchronized void install() {
        if (installed) return;
        installed = true;
        try {
            originalSignature = new Signature(Base64.decode(ORIGINAL_CERT, Base64.DEFAULT));

            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Field pmField = activityThread.getDeclaredField("sPackageManager");
            pmField.setAccessible(true);
            Object realPm = pmField.get(null);
            if (realPm == null) return;

            Class<?> ipmInterface = Class.forName("android.content.pm.IPackageManager");
            Object proxy = Proxy.newProxyInstance(
                ipmInterface.getClassLoader(),
                new Class<?>[]{ipmInterface},
                new PmHandler(realPm));
            pmField.set(null, proxy);

            // Any ApplicationPackageManager the app creates after this reads sPackageManager, so it picks up
            // the proxy; install() runs before the app first touches its PackageManager.
            Log.w(TAG, "signature spoof installed");
        } catch (Throwable t) {
            Log.w(TAG, "signature spoof failed", t);
        }
    }

    /** Rewrites the certificate of a PackageInfo for this package in place. */
    private static Object patch(Object result) {
        if (!(result instanceof PackageInfo)) return result;
        PackageInfo info = (PackageInfo) result;
        if (!PACKAGE_NAME.equals(info.packageName)) return result;
        if (info.signatures != null && info.signatures.length > 0) {
            info.signatures[0] = originalSignature;
        }
        if (Build.VERSION.SDK_INT >= 28 && info.signingInfo != null) {
            Signature[] signers = info.signingInfo.getApkContentsSigners();
            if (signers != null && signers.length > 0) {
                signers[0] = originalSignature;
            }
        }
        return result;
    }

    /** Forwards every IPackageManager call to the real one, rewriting getPackageInfo results. */
    private static final class PmHandler implements InvocationHandler {
        private final Object real;

        PmHandler(Object real) {
            this.real = real;
        }

        @Override
        public Object invoke(Object proxyObj, Method method, Object[] args) throws Throwable {
            Object result;
            try {
                result = method.invoke(real, args);
            } catch (java.lang.reflect.InvocationTargetException e) {
                throw e.getCause() != null ? e.getCause() : e;
            }
            if ("getPackageInfo".equals(method.getName())) {
                return patch(result);
            }
            return result;
        }
    }
}
