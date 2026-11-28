package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Third-party apps the user allowed to read the Data API. A grant is "package|certificate SHA-256",
 * so another app reusing the package name with a different signing key is not trusted.
 */
final class DataApiGrants {
    private static final String PREFS = "waze_hud_gw";
    private static final String KEY = "api_grants";

    private DataApiGrants() { }

    static boolean isGranted(Context context, String pkg) {
        String entry = entry(context, pkg);
        return entry != null && grants(context).contains(entry);
    }

    /** Every Binder call is checked against the caller's UID, never a name the caller sends. */
    static boolean isAllowedUid(Context context, int uid) {
        String[] packages = context.getPackageManager().getPackagesForUid(uid);
        if (packages == null) return false;
        for (String pkg : packages) if (isGranted(context, pkg)) return true;
        return false;
    }

    static void grant(Context context, String pkg) {
        String entry = entry(context, pkg);
        if (entry == null) return;
        Set<String> next = new HashSet<String>(grants(context));
        next.add(entry);
        prefs(context).edit().putStringSet(KEY, next).apply();
    }

    static void revoke(Context context, String pkg) {
        Set<String> next = new HashSet<String>();
        for (String entry : grants(context)) if (!entry.startsWith(pkg + "|")) next.add(entry);
        prefs(context).edit().putStringSet(KEY, next).apply();
    }

    /** Granted package names, for the settings list. */
    static List<String> packages(Context context) {
        List<String> result = new ArrayList<String>();
        for (String entry : grants(context)) result.add(entry.substring(0, entry.indexOf('|')));
        return result;
    }

    private static Set<String> grants(Context context) {
        return prefs(context).getStringSet(KEY, new HashSet<String>());
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String entry(Context context, String pkg) {
        String cert = certificateSha256(context, pkg);
        return pkg == null || cert == null ? null : pkg + "|" + cert;
    }

    private static String certificateSha256(Context context, String pkg) {
        if (pkg == null) return null;
        try {
            PackageInfo info = context.getPackageManager()
                    .getPackageInfo(pkg, PackageManager.GET_SIGNING_CERTIFICATES);
            if (info.signingInfo == null) return null;
            Signature[] signers = info.signingInfo.getApkContentsSigners();
            if (signers == null || signers.length == 0) return null;
            MessageDigest sha = MessageDigest.getInstance("SHA-256");
            String[] hashes = new String[signers.length];
            for (int i = 0; i < signers.length; i++) {
                StringBuilder hex = new StringBuilder();
                for (byte b : sha.digest(signers[i].toByteArray())) hex.append(String.format("%02x", b));
                hashes[i] = hex.toString();
            }
            Arrays.sort(hashes);
            return String.join(",", hashes);
        } catch (Throwable error) {
            return null;
        }
    }
}
