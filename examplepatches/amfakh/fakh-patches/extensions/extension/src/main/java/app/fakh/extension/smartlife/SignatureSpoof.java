package app.fakh.extension.smartlife;

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
 * Makes the app see its original signing certificate instead of the one a patched APK is resigned with.
 * Smart Life's native security library (libthing_security) reads the app's signature and kills the process
 * when it does not match. The system IPackageManager held in ActivityThread is wrapped with a dynamic proxy
 * that rewrites the certificate in every PackageInfo returned for this package, so GET_SIGNATURES and
 * GET_SIGNING_CERTIFICATES reads yield the original. Must run before the app reads its own signature.
 */
@SuppressWarnings("unused")
public final class SignatureSpoof {
    private static final String TAG = "FakhSmartLife";

    /** Smart Life, Tuya Smart and BARDI Smart Home ship the same code under different packages and signing certificates. */
    private static final String SMARTLIFE_PACKAGE = "com.tuya.smartlife";
    private static final String TUYA_SMART_PACKAGE = "com.tuya.smart";
    private static final String BARDI_PACKAGE = "com.bardi.smart.home";

    /** Smart Life's original signing certificate (DER, Base64). SHA-1 94dbfb934543ca1477b440add47566d757fd25ef. */
    private static final String SMARTLIFE_CERT =
        "MIIDgzCCAmugAwIBAgIEe7R4yTANBgkqhkiG9w0BAQsFADBxMQswCQYDVQQGEwJDTjERMA8GA1UECBMIWmhlSmlhbmcxETAPBgNVBAcTCEhhbmd6aG91MQ4wDAYDVQQKEwV0bGlmZTEVMBMGA1UECxMMd3d3LnR1eWEuY29tMRUwEwYDVQQDEwx3d3cudHV5YS5jb20wIBcNMTYwNTE3MDM0OTA5WhgPMjA3MTAyMTgwMzQ5MDlaMHExCzAJBgNVBAYTAkNOMREwDwYDVQQIEwhaaGVKaWFuZzERMA8GA1UEBxMISGFuZ3pob3UxDjAMBgNVBAoTBXRsaWZlMRUwEwYDVQQLEwx3d3cudHV5YS5jb20xFTATBgNVBAMTDHd3dy50dXlhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIqNaWHwN3GHIIXhxgKC7EPRaHYvkkW+CoCqID7Yd1ExIuLZGuywT7Pgyr05ktE4idxWhvP5gemzEuwSYLqPvX8VjMikLVWO/wW52n7nbdISJpOSV3fpSR0cD9JnPd7vM8sxmYYgelkNhFIdnGEnH1imYyyjgM3n19d6XNWF5wMC2k4/bCUrunUPq3IB8bKf6gNxMuefWzCTiOYKjMcIvojx6+cb76oipW2d3J1U/aeFNQ4SD72acDW3fs5p2YakiXOxZ5CIMulezWNFW5lSOptMDaKXzq4gGgcOkNOgn5MDGEhGu1ac++azlhq9y1FHJWjHF9l5Pj6bVigWcw1x5XECAwEAAaMhMB8wHQYDVR0OBBYEFFTyzFsc+0lRy8qrsbgncBD70yK5MA0GCSqGSIb3DQEBCwUAA4IBAQCIqGDKz9hormN5JS7viJeSWgG57fiAz7AF8YO2aOUAXg4mnato7WzgrZJydsZFTVjDEbRJUmMdBnHA1QsHkW77L0KSlxhaIbMHcWjjZgCkwnkMybVr7EMbbhZ0OO+9NVcuE2+Ids/ircpsxRqb8hIFNNV+jfHMOqR3ssPUHLrdDAUUgCI+05Bant4WWHg+Lm2KkiL39Q+7oK2oZRzB/nmuhrvJZxHPM5PJoV/NpNzFelwXuT4wf7SQnwzCyzFsvkaIOuhlVSnqQICVWkAUCrDQP6mxyBohop1FPhASkA3BJDJ+tSWHua0/+ZROMLq/d7VF6GQ47bojstlh/p/dfbK4";

    /** Tuya Smart's original signing certificate (DER, Base64). SHA-1 7ef97f90295755b6bde1566394a3f64b00b72324. */
    private static final String TUYA_SMART_CERT =
        "MIIDYTCCAkmgAwIBAgIENCk23zANBgkqhkiG9w0BAQsFADBgMQswCQYDVQQGEwI4NjERMA8GA1UECBMIWmhlamlhbmcxETAPBgNVBAcTCEhhbmd6aG91MQ0wCwYDVQQKEwRUdXlhMQ0wCwYDVQQLEwRUdXlhMQ0wCwYDVQQDEwRUdXlhMCAXDTE1MDUxODA3NDczNVoYDzMwMTMwOTE4MDc0NzM1WjBgMQswCQYDVQQGEwI4NjERMA8GA1UECBMIWmhlamlhbmcxETAPBgNVBAcTCEhhbmd6aG91MQ0wCwYDVQQKEwRUdXlhMQ0wCwYDVQQLEwRUdXlhMQ0wCwYDVQQDEwRUdXlhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnVuoQPJGYun2OPOjHajNsxkjdsfN49dXq6t7zeKDBzlzVJWkbDledcIreZ0LJbuhxQK1oW70fpi4qkUbKUco6ecMWWCNh+TTABC7cAchd2NKa/pGH7Nfw0/yqetA9cu7iDlc0gNnQXo+gNeVOfHAaLFwmNjB2sYxYmkbJwTx4r1eCw8+QudoXLkuwxCckhGXPd/Kh3tbu45/lS7p3L702V6YxZgif0VR90ie5VTsxAjs7lPgG+eO+HCjZpp2rS6nO8mxvaXPxZiR7HA2ma+9Ot9bxxfMRjdqOCa4uthUTGjr6tWMWy9Jpxl7aAPtv7Yr1KDmqe0THQqLF/xwaucwSwIDAQABoyEwHzAdBgNVHQ4EFgQUDL54la5mYu1uDldM4Gf1UM/QyscwDQYJKoZIhvcNAQELBQADggEBAHl530Fbj6sQ0qbGkttyysqRG8fSAEiWAtucVFt0MoQJEa1rlplYpJ3ucTvE+GmPKexMAKMDzCaixvPrWK5KlqYnUHK8UbI3KeyW2op/QiEq7Eajr5ba0DDDk9GlPphheBVejMQPx9RZXVvdXQRwWyaR2tuk+YxqlolVBf3pJYaCW3SbAhE+AKlpJF6tkUwxjXE4YRkP5SQQn+zAGDDW90+ES6/eJ+3Q5Oy/kUJ0jTx9l4BzA7Y5wSDR42OMJVakUa2+DpiIPbaun+nMjkOqpsRBZ6mV3ZkMsvMBMO49jsG6QvXSYtbj+8QERQxxiNT8EZyTJIm7xEj35c1IUQ7JgIo=";

    /** BARDI Smart Home's original signing certificate (DER, Base64). SHA-1 980bfb73de90519784a20630720d4716ae90884a. */
    private static final String BARDI_CERT =
        "MIIDgTCCAmmgAwIBAgIEIZLRwDANBgkqhkiG9w0BAQsFADBwMQswCQYDVQQGEwJDTjERMA8GA1UECBMIWmhlSmlhbmcxETAPBgNVBAcTCEhhbmd6aG91MQ0wCwYDVQQKEwR0dXlhMRUwEwYDVQQLEwx3d3cudHV5YS5jb20xFTATBgNVBAMTDHd3dy50dXlhLmNvbTAgFw0xOTA1MTExNTUyMzlaGA8yMDc0MDIxMTE1NTIzOVowcDELMAkGA1UEBhMCQ04xETAPBgNVBAgTCFpoZUppYW5nMREwDwYDVQQHEwhIYW5nemhvdTENMAsGA1UEChMEdHV5YTEVMBMGA1UECxMMd3d3LnR1eWEuY29tMRUwEwYDVQQDEwx3d3cudHV5YS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCUojI1HH6F1IbLu/lcfLdijKvB2La5xnfDJMUnj85TEysvygfcSBQyPlU0L54UgSF72Z1XnnkjKRetLjiXJUiP+2LLzjD2IU+k1kbJljmoMg4+YND+ZtToo7rfUAwxg3CB0oeGeCudzXUQ2iidCweCnjDakkZDotkDgfhRXFvdWMieix8rYJTbYImGhbYhYWpB/94xaESoBkDMcenAJ1f+sbuUDNOOrw8wBn+h10pz7XEJT2HcGcxtDOyShCO/8Emat+keWHeA1z6wD0aETToqfsI3YmyPN7QCTBlWw9ffCVgP+WPlq+kC+HW05+7knj3MVqmafb0YAk4xusWaV8l3AgMBAAGjITAfMB0GA1UdDgQWBBRjZmQlvLS+f0xremfIbsixZmjXgDANBgkqhkiG9w0BAQsFAAOCAQEAQ24G5bofN/Aaz8VDg+51icFhpCAvQ4EECiJOE9JA48EY5INzEcA6GelPFv3ZVOjRAtxb3N1RBGhcOaRg5Y6yvzS+pZUYf8iETBuH/N++IuU6lptN5wcDaa698SV2g+vclOu0DveRpeaBdlv1//Vrp4WWggGJ0tkfkwbIj6wSPVVeg/mB/37esLoqpH55qUIjDIalf8XszFm/dMgWXKXUiopUA6vBMvcK6uZFQk+hxztHKx6788RUWCPxQf3M4Juc6AbpASTGSA8A2cZYgzYh5XRj3SUlr9rkbr0liUNK3gbb3xNRDAC7JE7tDoSg3WoOfXkjq5pKkQtGCuW2VqgD2A==";

    private static Signature smartLifeSignature;
    private static Signature bardiSignature;
    private static Signature tuyaSmartSignature;
    private static boolean installed;

    private SignatureSpoof() {
    }

    /** Installs the proxy once. Safe to call more than once and never throws into the caller. */
    public static synchronized void install() {
        if (installed) return;
        installed = true;
        try {
            smartLifeSignature = new Signature(Base64.decode(SMARTLIFE_CERT, Base64.DEFAULT));
            tuyaSmartSignature = new Signature(Base64.decode(TUYA_SMART_CERT, Base64.DEFAULT));
            bardiSignature = new Signature(Base64.decode(BARDI_CERT, Base64.DEFAULT));

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

    /** The original certificate of [packageName], or null when it is not one of the apps this patch is for. */
    private static Signature originalFor(String packageName) {
        if (SMARTLIFE_PACKAGE.equals(packageName)) return smartLifeSignature;
        if (TUYA_SMART_PACKAGE.equals(packageName)) return tuyaSmartSignature;
        if (BARDI_PACKAGE.equals(packageName)) return bardiSignature;
        return null;
    }

    /** Rewrites the certificate of a PackageInfo for this package in place. */
    private static Object patch(Object result) {
        if (!(result instanceof PackageInfo)) return result;
        PackageInfo info = (PackageInfo) result;
        Signature original = originalFor(info.packageName);
        if (original == null) return result;
        if (info.signatures != null && info.signatures.length > 0) {
            info.signatures[0] = original;
        }
        if (Build.VERSION.SDK_INT >= 28 && info.signingInfo != null) {
            Signature[] signers = info.signingInfo.getApkContentsSigners();
            if (signers != null && signers.length > 0) {
                signers[0] = original;
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
