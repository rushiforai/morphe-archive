package app.danielthemaniel.patches.pokegenie.extension;

import java.lang.reflect.Field;  // used by setMethodField
import java.lang.reflect.Method;

/**
 * Initializes PairIP's obfuscation tables that would normally be populated
 * by the PairIP VM at runtime. Without the VM, all fields are null, causing
 * crashes throughout the app.
 *
 * This class handles:
 * 1. SCXZoOH - String obfuscation table (60 String fields)
 * 2. oQdPuufFLxDgt - Method dispatch table 1 (7 Method fields)
 * 3. iqUQTtB - Method dispatch table 2 (7 Method fields)
 * 4. TotKrJbYNOdy - Method dispatch table 3 (2 Method fields)
 * 5. wegjmNVsN - Method dispatch table 4 (2 Method fields)
 */
public class PairipTableInit {

    /**
     * Initializes PairIP's method dispatch tables via reflection.
     * The string table (SCXZoOH) is handled separately via direct bytecode
     * injection in StripPairipPatch.kt because Class.forName cannot resolve
     * the dash in its package name (com.google.android.gms.internal.auth-api).
     */
    public static void init() {
        try {
            initDispatchTables();
        } catch (Throwable t) {
            // Don't crash if dispatch table init fails
        }
    }

    private static void initDispatchTables() throws Exception {
        Class<?> bundleClass = Class.forName("android.os.Bundle");
        Class<?> intentClass = Class.forName("android.content.Intent");

        // Table 1: oQdPuufFLxDgt (7 Method fields)
        Class<?> dt1 = Class.forName("com.google.firebase.internal.api.zuHy.oQdPuufFLxDgt");

        setMethodField(dt1, "jjmPFOIsOVJ",
            "com.canjin.pokegenie.PoGoApplication$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.PoGoApplication") });

        setMethodField(dt1, "CzbPaqCEocrf",
            "com.canjin.pokegenie.MainActivity$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.MainActivity"), bundleClass });

        setMethodField(dt1, "QkEu",
            "com.canjin.pokegenie.MainActivity$c2020060319", "onPause",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.MainActivity") });

        setMethodField(dt1, "lxxZWxSyD",
            "com.canjin.pokegenie.MainActivity$c2020060320", "onResume",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.MainActivity") });

        setMethodField(dt1, "VwUv",
            "com.canjin.pokegenie.MainActivity$c2020060322", "onStop",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.MainActivity") });

        setMethodField(dt1, "uidOK",
            "com.amazon.aps.ads.activity.ApsInterstitialActivity$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.amazon.aps.ads.activity.ApsInterstitialActivity"), bundleClass });

        setMethodField(dt1, "etgWwKvwf",
            "com.dropbox.core.android.AuthActivity$c2020060318", "onResume",
            new Class<?>[]{ Class.forName("com.dropbox.core.android.AuthActivity") });

        // Table 2: iqUQTtB (7 Method fields)
        Class<?> dt2 = Class.forName("androidx.credentials.playservices.controllers.kcb.iqUQTtB");

        setMethodField(dt2, "ujYWJ",
            "com.canjin.pokegenie.MainActivity$c2020060318", "onDestroy",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.MainActivity") });

        setMethodField(dt2, "wEWhVq",
            "com.google.firebase.auth.internal.GenericIdpActivity$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.google.firebase.auth.internal.GenericIdpActivity"), bundleClass });

        setMethodField(dt2, "kBzLzTCAEB",
            "com.google.firebase.auth.internal.GenericIdpActivity$c2020060318", "onResume",
            new Class<?>[]{ Class.forName("com.google.firebase.auth.internal.GenericIdpActivity") });

        setMethodField(dt2, "xJXLy",
            "com.google.firebase.auth.internal.RecaptchaActivity$c2020060318", "onResume",
            new Class<?>[]{ Class.forName("com.google.firebase.auth.internal.RecaptchaActivity") });

        setMethodField(dt2, "sVYtAnAjrCDQD",
            "com.google.android.gms.auth.api.signin.RevocationBoundService$c2020060317", "onBind",
            new Class<?>[]{ Class.forName("com.google.android.gms.auth.api.signin.RevocationBoundService"), intentClass });

        setMethodField(dt2, "inaEuUXUf",
            "com.amazon.device.ads.DTBInterstitialActivity$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.amazon.device.ads.DTBInterstitialActivity"), bundleClass });

        setMethodField(dt2, "myJMtGUgzWIO",
            "com.amazon.aps.ads.activity.ApsInterstitialActivity$c2020060318", "onDestroy",
            new Class<?>[]{ Class.forName("com.amazon.aps.ads.activity.ApsInterstitialActivity") });

        // Table 3: TotKrJbYNOdy (2 Method fields)
        Class<?> dt3 = Class.forName("net.pubnative.lite.sdk.vpaid.enums.iAn.TotKrJbYNOdy");

        setMethodField(dt3, "ysTjlp",
            "com.canjin.pokegenie.MainActivity$c2020060321", "onStart",
            new Class<?>[]{ Class.forName("com.canjin.pokegenie.MainActivity") });

        setMethodField(dt3, "BhkOv",
            "com.dropbox.core.android.AuthActivity$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.dropbox.core.android.AuthActivity"), bundleClass });

        // Table 4: wegjmNVsN (2 Method fields)
        Class<?> dt4 = Class.forName("com.google.android.gms.measurement.api.uWd.wegjmNVsN");

        setMethodField(dt4, "Rqrs",
            "com.google.firebase.auth.internal.RecaptchaActivity$c2020060317", "onCreate",
            new Class<?>[]{ Class.forName("com.google.firebase.auth.internal.RecaptchaActivity"), bundleClass });

        setMethodField(dt4, "bjTLxb",
            "com.amazon.device.ads.DTBInterstitialActivity$c2020060318", "onDestroy",
            new Class<?>[]{ Class.forName("com.amazon.device.ads.DTBInterstitialActivity") });
    }

    private static void setMethodField(Class<?> tableClass, String fieldName,
                                       String targetClassName, String targetMethodName,
                                       Class<?>[] paramTypes) {
        try {
            Class<?> targetClass = Class.forName(targetClassName);
            Method m = targetClass.getDeclaredMethod(targetMethodName, paramTypes);
            m.setAccessible(true);
            Field f = tableClass.getDeclaredField(fieldName);
            f.setAccessible(true);
            f.set(null, m);
        } catch (Throwable t) {
            // Skip individual dispatch entries that fail
        }
    }
}
