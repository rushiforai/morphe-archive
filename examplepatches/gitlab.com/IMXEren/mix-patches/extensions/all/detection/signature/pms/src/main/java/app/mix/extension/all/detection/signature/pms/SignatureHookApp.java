/**
 * Copyright 2026 jkennethcarino, IMXEren.
 * https://github.com/jkennethcarino/adobo
 * https://github.com/IMXEren/mix-patches
 */

package app.mix.extension.all.detection.signature.pms;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import org.lsposed.hiddenapibypass.HiddenApiBypass;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * Source: https://github.com/L-JINBIN/ApkSignatureKillerEx
 */
public class SignatureHookApp extends Application {

    static {
        String packageName = "<package-name>";
        String signature = "<signature>";

        killPackageManager(packageName, signature);
    }

    private static void killPackageManager(String packageName, String signature) {
        try {
            Signature fakeSignature = new Signature(Base64.decode(signature, Base64.DEFAULT));

            // HiddenApiBypass uses Unsafe to walk ART internals — the internal
            // structure layouts change across Android versions and OEM ROMs.
            // Wrong offsets cause memory corruption manifesting as
            // GetObjectClass(null) SIGABRT in native code.
            // Only enable on the narrow range where it's known to work
            // (AOSP-like ART on API 28-30). On newer/older versions or OEM
            // ROMs, the field access via setAccessible(true) usually works.
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P
                    && Build.VERSION.SDK_INT <= 30) {
                try {
                    HiddenApiBypass.addHiddenApiExemptions(
                            "Landroid/os/Parcel;",
                            "Landroid/content/pm",
                            "Landroid/app"
                    );
                } catch (Throwable t) {
                    // HiddenApiBypass can throw Error (ExceptionInInitializerError)
                    // or crash entirely (SIGSEGV from bad Unsafe access).
                    // Absorb all failures silently.
                }
            }
            clearPackageInfoCache();
            clearParcelCreators();

            // Inject spoofed creator into Parcel.mCreators and sPairedCreators
            // (avoiding field.set on PackageInfo.CREATOR which crashes native code)
            // Both maps must have the custom creator so no lookup path returns null.
            Parcelable.Creator<PackageInfo> spoofedCreator =
                    getPackageInfoCreator(packageName, fakeSignature);

            Map<ClassLoader, Map<String, Parcelable.Creator<?>>> mCreators =
                    (Map<ClassLoader, Map<String, Parcelable.Creator<?>>>)
                            findField(Parcel.class, "mCreators").get(null);
            if (mCreators != null) {
                Map<String, Parcelable.Creator<?>> inner = mCreators.get(null);
                if (inner == null) {
                    inner = new HashMap<>();
                    mCreators.put(null, inner);
                }
                inner.put("android.content.pm.PackageInfo", spoofedCreator);
            }

            // Also register in sPairedCreators so the fallback lookup path
            // returns the custom creator instead of null.
            try {
                Map<String, Parcelable.Creator<?>> sPairedCreators =
                        (Map<String, Parcelable.Creator<?>>)
                                findField(Parcel.class, "sPairedCreators").get(null);
                if (sPairedCreators != null) {
                    sPairedCreators.put("android.content.pm.PackageInfo", spoofedCreator);
                }
            } catch (Exception ignored) {
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to modify package manager", e);
        }
    }

    private static Field findField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field;
        } catch (NoSuchFieldException e) {
            while ((clazz = clazz.getSuperclass()) != null && !clazz.equals(Object.class)) {
                try {
                    Field field = clazz.getDeclaredField(fieldName);
                    field.setAccessible(true);
                    return field;
                } catch (NoSuchFieldException ignored) {
                }
            }
            throw e;
        }
    }

    private static Parcelable.Creator<PackageInfo> getPackageInfoCreator(
            String packageName, Signature fakeSignature) {
        Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        return new Parcelable.Creator<>() {
            @Override
            public PackageInfo createFromParcel(Parcel source) {
                try {
                    PackageInfo packageInfo = originalCreator.createFromParcel(source);
                    if (packageInfo == null) return null;

                    if (packageInfo.packageName != null
                            && packageInfo.packageName.equals(packageName)) {
                        if (packageInfo.signatures != null
                                && packageInfo.signatures.length > 0) {
                            packageInfo.signatures[0] = fakeSignature;
                        }

                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                            if (packageInfo.signingInfo != null) {
                                Signature[] signaturesArray =
                                        packageInfo.signingInfo.getApkContentsSigners();
                                if (signaturesArray != null
                                        && signaturesArray.length > 0) {
                                    signaturesArray[0] = fakeSignature;
                                }
                            }
                        }
                    }
                    return packageInfo;
                } catch (Exception e) {
                    // Never throw through JNI - native code can't handle it
                    return null;
                }
            }

            @Override
            public PackageInfo[] newArray(int size) {
                return originalCreator.newArray(size);
            }
        };
    }

    private static void clearPackageInfoCache() {
        try {
            Field packageCacheField = findField(PackageManager.class, "sPackageInfoCache");
            Object cache = packageCacheField.get(null);
            if (cache != null) {
                cache.getClass().getMethod("clear").invoke(cache);
            }
        } catch (Exception ignored) {
        }
    }

    private static void clearParcelCreators() {
        // Only remove cached PackageInfo creators from mCreators, not ALL creators.
        // Clearing all of Parcel.mCreators causes native code to crash
        // with GetObjectClass(null) when unmarshalling other Parcelables.
        //
        // We do NOT remove from sPairedCreators — leaving it empty causes
        // native code to get null PackageInfo when the fallback path is taken,
        // resulting in GetObjectClass(null) SIGABRT. Instead, the custom
        // creator is registered in sPairedCreators in killPackageManager.
        try {
            Map<?, ?> mCreators = (Map<?, ?>) findField(Parcel.class, "mCreators").get(null);
            if (mCreators != null) {
                // mCreators can be HashMap<String, Creator> (older) or
                // HashMap<ClassLoader, HashMap<String, Creator>> (newer).
                for (Object value : mCreators.values()) {
                    if (value instanceof Map) {
                        ((Map<?, ?>) value).remove("android.content.pm.PackageInfo");
                    }
                }
                mCreators.remove("android.content.pm.PackageInfo");
            }
        } catch (Exception ignored) {
        }
    }
}
