package com.sj010.gboardclipboard.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.security.SecureRandom;

public final class GboardClipboardHistorySettings {

    /**
     * Authority and permission of the reference build ({@code com.sj010.gboard}).
     * Every other host package gets its own scoped variant so that multiple
     * patched keyboards can be installed side by side without clashing on the
     * global provider authority.
     */
    public static final String PRIMARY_PACKAGE_NAME = "com.sj010.gboard";

    public static final String PERMISSION_READ_CLIPBOARD_HISTORY =
            "com.sj010.gboardclipboard.permission.READ_CLIPBOARD_HISTORY";

    public static final String PROVIDER_AUTHORITY = "com.sj010.gboardclipboard.history";

    public static String permissionForPackage(String packageName) {
        if (packageName == null || packageName.isEmpty()) {
            return PERMISSION_READ_CLIPBOARD_HISTORY;
        }
        if (PRIMARY_PACKAGE_NAME.equals(packageName)) {
            return PERMISSION_READ_CLIPBOARD_HISTORY;
        }
        return packageName + ".permission.READ_CLIPBOARD_HISTORY";
    }

    public static String authorityForPackage(String packageName) {
        if (packageName == null || packageName.isEmpty()) {
            return PROVIDER_AUTHORITY;
        }
        if (PRIMARY_PACKAGE_NAME.equals(packageName)) {
            return PROVIDER_AUTHORITY;
        }
        return packageName + ".gboardclipboard.history";
    }

    /**
     * Resolves the authority that the manifest actually declares for this
     * provider. Reading it back from the package manager keeps the runtime URI
     * and the manifest in sync no matter which patch order produced the APK.
     */
    public static String resolveAuthority(Context context) {
        if (context == null) {
            return PROVIDER_AUTHORITY;
        }
        try {
            android.content.pm.ProviderInfo info = context.getPackageManager().getProviderInfo(
                    new android.content.ComponentName(context, GboardClipboardHistoryProvider.class),
                    0);
            if (info != null && info.authority != null && !info.authority.isEmpty()) {
                return info.authority;
            }
        } catch (Throwable ignored) {
        }
        return authorityForPackage(context.getPackageName());
    }

    /**
     * The signature permission this build declares for external clipboard
     * access. The scoped variant is used for every host package other than the
     * reference build.
     */
    public static String resolvePermission(Context context) {
        if (context == null) {
            return PERMISSION_READ_CLIPBOARD_HISTORY;
        }
        return permissionForPackage(context.getPackageName());
    }

    /**
     * All permission names that may protect the provider. The reference build
     * declares the documented name, a renamed host declares the scoped one, so
     * both are accepted.
     */
    public static String[] candidatePermissions(Context context) {
        String scoped = resolvePermission(context);
        if (PERMISSION_READ_CLIPBOARD_HISTORY.equals(scoped)) {
            return new String[]{PERMISSION_READ_CLIPBOARD_HISTORY};
        }
        return new String[]{scoped, PERMISSION_READ_CLIPBOARD_HISTORY};
    }

    /**
     * True when this app declares the given permission.
     *
     * Permission names live in a global namespace. Another app can declare the
     * same name first, the platform keeps that first definition, and the
     * declared protection level can then be weaker than the one this build
     * asks for. A caller that holds such a permission would pass a plain
     * check, so the definer has to be this package before a permission counts.
     */
    public static boolean isPermissionDeclaredByHost(Context context, String permissionName) {
        if (context == null || permissionName == null || permissionName.isEmpty()) {
            return false;
        }
        try {
            android.content.pm.PermissionInfo info =
                    context.getPackageManager().getPermissionInfo(permissionName, 0);
            if (info == null) {
                return false;
            }
            return context.getPackageName().equals(info.packageName);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Shortens a token for display. The full token is never rendered on screen.
     */
    public static String maskAccessToken(String token) {
        if (token == null || token.isEmpty()) {
            return "";
        }
        if (token.length() <= 8) {
            return token;
        }
        return token.substring(0, 8) + "…";
    }

    static final String PREF_FILE_NAME = "gboard_clipboard_history_prefs";

    static final String PREF_KEY_EXTERNAL_ACCESS_ENABLED =
            "pref_clipboard_history_external_access_enabled";
    static final String PREF_KEY_INCLUDE_SENSITIVE =
            "pref_clipboard_history_include_sensitive";
    static final String PREF_KEY_ACCESS_TOKEN = "pref_clipboard_history_access_token";
    static final String PREF_KEY_BACKFILL_MARKER = "pref_clipboard_history_backfill_marker";

    private static final String TAG = "GboardClipboard";
    private static final int ACCESS_TOKEN_BYTES = 16;
    private static final char[] HEX_DIGITS = "0123456789abcdef".toCharArray();

    private GboardClipboardHistorySettings() {
    }

    public static boolean isExternalAccessEnabled(Context context) {
        SharedPreferences preferences = preferences(context);
        return preferences != null && preferences.getBoolean(PREF_KEY_EXTERNAL_ACCESS_ENABLED, false);
    }

    public static void setExternalAccessEnabled(Context context, boolean enabled) {
        SharedPreferences preferences = preferences(context);
        if (preferences != null) {
            preferences.edit().putBoolean(PREF_KEY_EXTERNAL_ACCESS_ENABLED, enabled).apply();
        }
    }

    public static boolean isSensitiveIncluded(Context context) {
        SharedPreferences preferences = preferences(context);
        return preferences != null && preferences.getBoolean(PREF_KEY_INCLUDE_SENSITIVE, false);
    }

    public static void setSensitiveIncluded(Context context, boolean included) {
        SharedPreferences preferences = preferences(context);
        if (preferences != null) {
            preferences.edit().putBoolean(PREF_KEY_INCLUDE_SENSITIVE, included).apply();
        }
    }

    public static String getAccessToken(Context context) {
        SharedPreferences preferences = preferences(context);
        if (preferences == null) {
            return "";
        }
        String token = preferences.getString(PREF_KEY_ACCESS_TOKEN, null);
        if (token != null && !token.isEmpty()) {
            return token;
        }
        return storeAccessToken(preferences);
    }

    public static String regenerateAccessToken(Context context) {
        SharedPreferences preferences = preferences(context);
        if (preferences == null) {
            return "";
        }
        return storeAccessToken(preferences);
    }

    private static String storeAccessToken(SharedPreferences preferences) {
        String generated = generateAccessToken();
        preferences.edit().putString(PREF_KEY_ACCESS_TOKEN, generated).apply();
        return generated;
    }

    public static String getBackfillMarker(Context context) {
        SharedPreferences preferences = preferences(context);
        return preferences != null ? preferences.getString(PREF_KEY_BACKFILL_MARKER, "") : "";
    }

    public static void setBackfillMarker(Context context, String marker) {
        SharedPreferences preferences = preferences(context);
        if (preferences != null) {
            if (marker == null || marker.isEmpty()) {
                preferences.edit().remove(PREF_KEY_BACKFILL_MARKER).apply();
            } else {
                preferences.edit().putString(PREF_KEY_BACKFILL_MARKER, marker).apply();
            }
        }
    }

    public static boolean isAccessTokenValid(Context context, String candidate) {
        if (candidate == null || candidate.isEmpty()) {
            return false;
        }
        String expected = getAccessToken(context);
        return !expected.isEmpty() && constantTimeEquals(expected, candidate);
    }

    static boolean constantTimeEquals(String expected, String candidate) {
        if (expected == null || candidate == null) {
            return false;
        }
        byte[] expectedBytes = expected.getBytes();
        byte[] candidateBytes = candidate.getBytes();
        int difference = expectedBytes.length ^ candidateBytes.length;
        for (int index = 0; index < expectedBytes.length && index < candidateBytes.length; index++) {
            difference |= expectedBytes[index] ^ candidateBytes[index];
        }
        return difference == 0;
    }

    static String generateAccessToken() {
        byte[] bytes = new byte[ACCESS_TOKEN_BYTES];
        new SecureRandom().nextBytes(bytes);
        char[] digits = new char[bytes.length * 2];
        for (int index = 0; index < bytes.length; index++) {
            int value = bytes[index] & 0xFF;
            digits[index * 2] = HEX_DIGITS[value >>> 4];
            digits[index * 2 + 1] = HEX_DIGITS[value & 0x0F];
        }
        return new String(digits);
    }

    private static SharedPreferences preferences(Context context) {
        if (context == null) {
            return null;
        }
        try {
            return context.getSharedPreferences(PREF_FILE_NAME, Context.MODE_PRIVATE);
        } catch (Throwable t) {
            Log.w(TAG, "Failed reading clipboard settings prefs", t);
            return null;
        }
    }
}
