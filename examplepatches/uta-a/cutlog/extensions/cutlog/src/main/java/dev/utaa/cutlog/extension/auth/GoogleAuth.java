package dev.utaa.cutlog.extension.auth;

import android.content.Context;
import android.content.pm.PackageManager;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;

/** Changes only the provider of Google ID tokens; setlog still authenticates the real token. */
public final class GoogleAuth {
    private static final String GMS_PACKAGE = "com.google.android.gms";
    private static final String MICROG_PACKAGE = "app.revanced.android.gms";
    private static final String MICROG_SIGN_IN_ACTION =
            "app.revanced.android.gms.auth.api.identity.service.signin.START";
    private static final String GOOGLE_ID_TYPE =
            "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL";
    // MorpheApp/MicroG-RE release signing certificate, also verified against installed 7.3.0.
    private static final byte[] MICROG_CERTIFICATE = hex(
            "0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7");

    private GoogleAuth() {}

    public static boolean isTrustedMicrogInstalled(Context context) {
        if (context == null) return false;
        try {
            return context.getPackageManager().hasSigningCertificate(
                    MICROG_PACKAGE, MICROG_CERTIFICATE, PackageManager.CERT_INPUT_SHA256);
        } catch (RuntimeException exception) {
            return false;
        }
    }

    /** Password, passkey and clear-credential requests retain their original providers. */
    public static boolean shouldUseMicrog(Context context, Object request) {
        return isGoogleIdOnlyRequest(request) && isTrustedMicrogInstalled(context);
    }

    /** Use the bundled nonce-capable getSignInIntent controller, not Identity Credentials. */
    public static boolean useIdentityCredentialsApi(boolean original, Context context, Object request) {
        return shouldUseMicrog(context, request) ? false : original;
    }

    /** The rebranded action is emitted only by a Sign-In client pinned to trusted MicroG. */
    public static String servicePackage(String action) {
        return MICROG_SIGN_IN_ACTION.equals(action) ? MICROG_PACKAGE : GMS_PACKAGE;
    }

    // Host classes are R8-obfuscated. Match the stable credential type, not their names.
    private static boolean isGoogleIdOnlyRequest(Object request) {
        if (request == null) return false;
        try {
            boolean found = false;
            for (Class<?> type = request.getClass(); type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || !List.class.isAssignableFrom(field.getType())) continue;
                    field.setAccessible(true);
                    Object value = field.get(request);
                    if (!(value instanceof List)) return false;
                    for (Object option : (List<?>) value) {
                        if (!hasGoogleIdType(option)) return false;
                        found = true;
                    }
                }
            }
            return found;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            return false;
        }
    }

    private static boolean hasGoogleIdType(Object option) throws IllegalAccessException {
        if (option == null) return false;
        for (Class<?> type = option.getClass(); type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                field.setAccessible(true);
                if (GOOGLE_ID_TYPE.equals(field.get(option))) return true;
            }
        }
        return false;
    }

    private static byte[] hex(String value) {
        byte[] result = new byte[value.length() / 2];
        for (int index = 0; index < result.length; index++) {
            result[index] = (byte) Integer.parseInt(value.substring(index * 2, index * 2 + 2), 16);
        }
        return result;
    }
}
