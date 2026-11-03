package app.morphe.extension.shared.patches;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class DeviceSpoofHelper {

    public static final String PREF_KEY_PROFILE = "morphe_backup_profile";
    public static final String PROFILE_AUTO = "auto";
    public static final String PROFILE_PIXEL_XL = "pixel-xl";
    public static final String PROFILE_PIXEL_5 = "pixel-5";

    private static final String FINGERPRINT_PIXEL_XL =
            "google/marlin/marlin:10/QP1A.191005.007.A3/5972272:user/release-keys";
    private static final String FINGERPRINT_PIXEL_5 =
            "google/redfin/redfin:14/UP1A.231105.001.B2/11264870:user/release-keys";

    private static final String ORIGINAL_MODEL = Build.MODEL;
    private static final String ORIGINAL_DEVICE = Build.DEVICE;
    private static final String ORIGINAL_PRODUCT = Build.PRODUCT;
    private static final String ORIGINAL_FINGERPRINT = Build.FINGERPRINT;
    private static final String ORIGINAL_MANUFACTURER = Build.MANUFACTURER;
    private static final String ORIGINAL_BRAND = Build.BRAND;

    private static volatile String cachedSettingProfile = null;
    private static final String defaultSettingProfile = PROFILE_AUTO;

    // Strong reference to prevent GC of the listener
    private static SharedPreferences.OnSharedPreferenceChangeListener backupPrefsListener = null;
    private static int lastStoragePolicy = -1;

    static {
        try {
            applyBuildSpoof();
        } catch (Throwable ignored) {}
    }

    private DeviceSpoofHelper() {}

    public static void init(Context context) {
        if (context != null) {
            try {
                SharedPreferences prefs = context.getSharedPreferences("morphe_settings", Context.MODE_PRIVATE);
                cachedSettingProfile = prefs.getString(PREF_KEY_PROFILE, defaultSettingProfile);
            } catch (Throwable ignored) {}
            syncPolicyForProfile(context, getSelectedProfile());
            registerBackupPrefsListener(context);
            applyBuildSpoof();
        }
    }

    private static synchronized void registerBackupPrefsListener(Context context) {
        if (backupPrefsListener != null || context == null) return;
        try {
            Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            SharedPreferences backupPrefs = appContext.getSharedPreferences("photos.backup.backup_prefs", Context.MODE_PRIVATE);
            lastStoragePolicy = backupPrefs.getInt("backup_prefs_storage_policy", -1);
            backupPrefsListener = (sharedPreferences, key) -> {
                if ("backup_prefs_storage_policy".equals(key)) {
                    int newPolicy = sharedPreferences.getInt("backup_prefs_storage_policy", -1);
                    if (newPolicy != -1 && newPolicy != lastStoragePolicy) {
                        Logger.printInfo(() -> "Detected Photos backup storage policy change: " + lastStoragePolicy + " -> " + newPolicy);
                        lastStoragePolicy = newPolicy;
                        applyBuildSpoof();
                        if (PROFILE_AUTO.equalsIgnoreCase(getSelectedProfile())) {
                            new Handler(Looper.getMainLooper()).post(() -> {
                                try {
                                    String profileName = newPolicy == 1 ? "Pixel 5 (Storage Saver)" : "Pixel XL (Original Quality)";
                                    Toast.makeText(appContext,
                                            "Backup quality changed! Applying " + profileName + " unmetered backup...",
                                            Toast.LENGTH_SHORT).show();
                                } catch (Throwable ignored) {}
                            });
                            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                                restartApp(appContext);
                            }, 800);
                        }
                    }
                }
            };
            backupPrefs.registerOnSharedPreferenceChangeListener(backupPrefsListener);
        } catch (Throwable t) {
            Logger.printException(() -> "Error registering backup prefs listener", t);
        }
    }

    public static String getSelectedProfile() {
        if (cachedSettingProfile != null) return cachedSettingProfile;
        try {
            Context ctx = Utils.getContextOrNull();
            if (ctx != null) {
                SharedPreferences prefs = ctx.getSharedPreferences("morphe_settings", Context.MODE_PRIVATE);
                cachedSettingProfile = prefs.getString(PREF_KEY_PROFILE, defaultSettingProfile);
                registerBackupPrefsListener(ctx);
                return cachedSettingProfile;
            }
        } catch (Throwable ignored) {}
        return defaultSettingProfile;
    }

    /**
     * Resolves the effective device profile:
     * - If user selected PROFILE_PIXEL_XL / PROFILE_PIXEL_5 explicitly, returns it.
     * - If user selected PROFILE_AUTO (default):
     *   Reads "photos.backup.backup_prefs" -> "backup_prefs_storage_policy":
     *     0 = Original Quality -> PROFILE_PIXEL_XL
     *     1 = Storage Saver -> PROFILE_PIXEL_5
     */
    public static String getEffectiveProfile() {
        String selected = getSelectedProfile();
        if (PROFILE_PIXEL_XL.equalsIgnoreCase(selected)) return PROFILE_PIXEL_XL;
        if (PROFILE_PIXEL_5.equalsIgnoreCase(selected)) return PROFILE_PIXEL_5;

        // Auto mode: inspect Google Photos backup quality setting
        try {
            Context ctx = Utils.getContextOrNull();
            if (ctx != null) {
                registerBackupPrefsListener(ctx);
                SharedPreferences backupPrefs = ctx.getSharedPreferences("photos.backup.backup_prefs", Context.MODE_PRIVATE);
                int policy = backupPrefs.getInt("backup_prefs_storage_policy", 0);
                if (policy == 1) return PROFILE_PIXEL_5;
                return PROFILE_PIXEL_XL;
            }
        } catch (Throwable ignored) {}
        return PROFILE_PIXEL_XL;
    }

    public static boolean isStorageSaver() {
        return PROFILE_PIXEL_5.equalsIgnoreCase(getEffectiveProfile());
    }

    public static boolean isPixelXl() {
        return PROFILE_PIXEL_XL.equalsIgnoreCase(getEffectiveProfile());
    }

    public static void setProfile(Context context, String profile) {
        cachedSettingProfile = profile;
        if (context != null) {
            try {
                SharedPreferences prefs = context.getSharedPreferences("morphe_settings", Context.MODE_PRIVATE);
                prefs.edit().putString(PREF_KEY_PROFILE, profile).commit();
            } catch (Throwable t) {
                Logger.printException(() -> "Error saving backup profile", t);
            }
            syncPolicyForProfile(context, profile);
        }
        applyBuildSpoof();
    }

    public static void syncPolicyForProfile(Context context, String profile) {
        if (context == null || PROFILE_AUTO.equalsIgnoreCase(profile)) return;
        if (PROFILE_PIXEL_5.equalsIgnoreCase(profile)) {
            ensureStoragePolicy(context, 1);
        } else if (PROFILE_PIXEL_XL.equalsIgnoreCase(profile)) {
            ensureStoragePolicy(context, 0);
        }
    }

    public static void ensureStoragePolicy(Context context, int expectedPolicy) {
        if (context == null) return;
        try {
            SharedPreferences backupPrefs = context.getSharedPreferences("photos.backup.backup_prefs", Context.MODE_PRIVATE);
            int current = backupPrefs.getInt("backup_prefs_storage_policy", -1);
            if (current != expectedPolicy) {
                backupPrefs.edit().putInt("backup_prefs_storage_policy", expectedPolicy).commit();
                Logger.printInfo(() -> "ensureStoragePolicy: updated policy from " + current + " to " + expectedPolicy);
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error updating backup_prefs_storage_policy", t);
        }
    }

    public static String getProfileDisplayName() {
        String selected = getSelectedProfile();
        String effective = getEffectiveProfile();
        String effectiveDesc = PROFILE_PIXEL_5.equalsIgnoreCase(effective)
                ? "Storage Saver • Pixel 5"
                : "Original Quality • Pixel XL";

        if (PROFILE_AUTO.equalsIgnoreCase(selected)) {
            return "Auto (" + effectiveDesc + ")";
        }
        return effectiveDesc;
    }

    public static String getProfileChipName() {
        String selected = getSelectedProfile();
        if (PROFILE_AUTO.equalsIgnoreCase(selected)) {
            return "Auto (" + (isStorageSaver() ? "Storage Saver" : "Original Quality") + ")";
        }
        return isStorageSaver() ? "Storage Saver" : "Original Quality";
    }

    public static String getModel() {
        if (isStorageSaver()) return "Pixel 5";
        return "Pixel XL";
    }

    public static String getDevice() {
        if (isStorageSaver()) return "redfin";
        return "marlin";
    }

    public static String getProduct() {
        if (isStorageSaver()) return "redfin";
        return "marlin";
    }

    public static String getFingerprint() {
        if (isStorageSaver()) return FINGERPRINT_PIXEL_5;
        return FINGERPRINT_PIXEL_XL;
    }

    public static String getManufacturer() {
        return "Google";
    }

    public static String getBrand() {
        return "google";
    }

    public static void applyBuildSpoof() {
        try {
            setBuildField("MODEL", getModel());
            setBuildField("DEVICE", getDevice());
            setBuildField("PRODUCT", getProduct());
            setBuildField("FINGERPRINT", getFingerprint());
            setBuildField("MANUFACTURER", getManufacturer());
            setBuildField("BRAND", getBrand());
        } catch (Throwable t) {
            Logger.printException(() -> "Error in applyBuildSpoof", t);
        }
    }

    private static void setBuildField(String fieldName, String value) {
        if (value == null) return;
        try {
            java.lang.reflect.Field field = Build.class.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(null, value);
        } catch (Throwable t) {
            Logger.printException(() -> "Failed to spoof Build." + fieldName, t);
        }
    }

    public static String resolveSystemFeature(String feature) {
        if ("com.google.android.apps.photos.NEXUS_PRELOAD".equals(feature)
                || "com.google.android.apps.photos.nexus_preload".equals(feature)) {
            // Pixel XL: returns wifi (true) to enable unmetered Original Quality.
            return isPixelXl() ? "android.hardware.wifi" : feature;
        }
        if ("com.google.android.feature.PIXEL_2020_EXPERIENCE".equals(feature)) {
            // Pixel 5: returns wifi (true) to enable unmetered Storage Saver.
            return isStorageSaver() ? "android.hardware.wifi" : feature;
        }
        return feature;
    }

    /**
     * Determines whether the Backup Quality row should be visible in Google Photos settings.
     * - Auto-Sync Mode: ALWAYS returns true so user can toggle between Original and Storage Saver.
     * - Pixel XL Mode: returns false (matches authentic Pixel 1 unmetered original only behavior).
     * - Pixel 5 Mode: returns true.
     */
    public static boolean shouldShowQualitySelector(boolean originalVisibility) {
        String selected = getSelectedProfile();
        if (PROFILE_AUTO.equalsIgnoreCase(selected)) {
            return true;
        }
        if (PROFILE_PIXEL_XL.equalsIgnoreCase(selected)) {
            return false;
        }
        if (PROFILE_PIXEL_5.equalsIgnoreCase(selected)) {
            return true;
        }
        return originalVisibility;
    }

    /**
     * Enhances quality descriptions with Morphe device configuration indicators in Auto-Sync mode.
     * qualityType: 0 = Original Quality, 1 = Storage Saver, 2 = Express
     */
    public static java.util.List<String> getEnhancedQualityDescriptions(int qualityType, java.util.List<String> originalDescriptions) {
        if (!PROFILE_AUTO.equalsIgnoreCase(getSelectedProfile()) || originalDescriptions == null) {
            return originalDescriptions;
        }
        java.util.List<String> list = new java.util.ArrayList<>(originalDescriptions);
        if (qualityType == 0) {
            list.add("• Morphe: Google Pixel XL configuration (Unlimited storage)");
        } else if (qualityType == 1) {
            list.add("• Morphe: Google Pixel 5 configuration (Unlimited storage)");
        }
        return list;
    }

    /**
     * Controls option enablement in the Backup Quality selection screen.
     * qualityType: 0 = Original Quality, 1 = Storage Saver, 2 = Express
     */
    public static boolean isQualityOptionEnabled(int qualityType) {
        String selected = getSelectedProfile();
        if (PROFILE_PIXEL_5.equalsIgnoreCase(selected)) {
            // Forced Pixel 5: only Storage Saver (1) is active; Original (0) and Express (2) are disabled
            return qualityType == 1;
        }
        if (PROFILE_AUTO.equalsIgnoreCase(selected)) {
            // Auto-Sync: Original (0) and Storage Saver (1) are enabled; Express (2) is disabled
            return qualityType != 2;
        }
        return true;
    }

    public static String getSystemProperty(String key) {
        return getSystemProperty(key, "");
    }

    public static String getSystemProperty(String key, String originalValue) {
        boolean storageSaver = isStorageSaver();
        switch (key) {
            case "ro.product.model":
            case "ro.product.model_for_attestation":
                return storageSaver ? "Pixel 5" : "Pixel XL";
            case "ro.product.device":
            case "ro.product.device_for_attestation":
            case "ro.product.name":
            case "ro.product.name_for_attestation":
                return storageSaver ? "redfin" : "marlin";
            case "ro.product.brand":
                return "google";
            case "ro.product.manufacturer":
                return "Google";
            case "ro.build.fingerprint":
                return storageSaver ? FINGERPRINT_PIXEL_5 : FINGERPRINT_PIXEL_XL;
            default:
                return originalValue;
        }
    }

    public static void restartApp(Activity activity) {
        restartApp((Context) activity);
    }

    public static void restartApp(Context context) {
        try {
            Context ctx = context != null ? context : Utils.getContextOrNull();
            if (ctx != null) {
                Logger.printInfo(() -> "Triggering application restart via Utils.restartApp...");
                Utils.restartApp(ctx);
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Error restarting Photos app", t);
        }
    }
}
