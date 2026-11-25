package com.feurstagram.extension;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.security.MessageDigest;
import java.util.Base64;

/**
 * The signing-certificate key hash of this APK itself, in Instagram's encoding: the first
 * package signature, SHA-256, URL-safe Base64 without padding (43 characters). The signature
 * patch asks {@link #isOwn} at the top of Instagram's two certificate checks, so this APK's
 * own hash is trusted (its deep links and its own processes keep working) while every other
 * certificate gets Instagram's original answer, so other apps are checked again.
 */
public final class OwnSignature {

    private OwnSignature() {}

    /** Read once per process; empty when the signing certificate could not be read. */
    private static String own;

    /** Whether Instagram's key-hash object {@code keyHash} wraps this APK's own hash. Never throws. */
    public static boolean isOwn(Object keyHash) {
        String hash;
        synchronized (OwnSignature.class) {
            if (own == null) own = compute(Config.getAppContext());
            hash = own;
        }
        return isOwn(keyHash, hash);
    }

    static boolean isOwn(Object keyHash, String ownHash) {
        if (keyHash == null || ownHash.isEmpty()) return false;
        try {
            return ownHash.equals(wrapped(keyHash));
        } catch (Throwable t) {
            return false;
        }
    }

    /** The hash the value object wraps: its only String field, or null when there is not exactly one. */
    private static String wrapped(Object keyHash) throws IllegalAccessException {
        Field match = null;
        for (Field field : keyHash.getClass().getDeclaredFields()) {
            if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) continue;
            if (match != null) return null;
            match = field;
        }
        if (match == null) return null;
        match.setAccessible(true);
        return (String) match.get(keyHash);
    }

    /** Instagram's key hash of this APK's signing certificate; empty without a Context or on error. */
    @SuppressWarnings("deprecation") // GET_SIGNATURES is what Instagram hashes, so mirror it
    static String compute(Context context) {
        if (context == null) return "";
        try {
            Signature[] signatures = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), PackageManager.GET_SIGNATURES).signatures;
            return keyHash(signatures[0].toByteArray());
        } catch (Throwable t) {
            return "";
        }
    }

    static String keyHash(byte[] certificate) throws java.security.NoSuchAlgorithmException {
        return Base64.getUrlEncoder().withoutPadding()
                .encodeToString(MessageDigest.getInstance("SHA-256").digest(certificate));
    }
}
