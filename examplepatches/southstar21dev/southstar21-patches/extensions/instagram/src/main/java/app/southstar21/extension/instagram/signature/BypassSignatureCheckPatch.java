package app.southstar21.extension.instagram.signature;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Bypass signature check: Instagram trusts this app again, and nothing else.
 * <p>
 * Instagram checks the signing key of the apps it deals with, itself included, and a patched
 * Instagram is signed with a different key, so it would distrust itself. The check used to be
 * made to answer yes for every app, but Instagram also uses it the other way round: what it
 * opens for sharing outside the app (the system share sheet) must NOT be signed like
 * Instagram. With every app "signed like Instagram" that was refused, and sharing a post or
 * reel to another app just went back to it. So only Instagram's own package is trusted here;
 * every other app gets Instagram's own answer.
 */
@SuppressWarnings("unused")
public final class BypassSignatureCheckPatch {
    private static final String TAG = "BypassSignatureCheck";
    /** The package a patched Instagram keeps. */
    private static final String INSTAGRAM = "com.instagram.android";

    private static String ownPackage;
    /** The checked app's String and Collection fields, found once for its class. */
    private static Class<?> fieldsOf;
    private static List<Field> fields;

    private BypassSignatureCheckPatch() {
    }

    /**
     * Called by the patch with every answer of Instagram's "is this app signed with a key we
     * trust?" check, and {@code app}, Instagram's description of the app (its package names
     * and signatures). True for this app itself, Instagram's own answer for any other.
     */
    public static boolean isTrusted(Object app, boolean trusted) {
        if (trusted || app == null) return trusted;
        try {
            return isOwnApp(app);
        } catch (Throwable t) {
            Log.e(TAG, "Couldn't check the app", t);
            return false;
        }
    }

    private static boolean isOwnApp(Object app) throws IllegalAccessException {
        String own = ownPackage();
        for (Field field : fieldsOf(app.getClass())) {
            Object value = field.get(app);
            if (own.equals(value)) return true;
            if (value instanceof Collection) {
                for (Object item : (Collection<?>) value) {
                    if (own.equals(item)) return true;
                }
            }
        }
        return false;
    }

    private static synchronized List<Field> fieldsOf(Class<?> type) {
        if (type == fieldsOf) return fields;
        List<Field> found = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            Class<?> t = field.getType();
            if (t != String.class && !Collection.class.isAssignableFrom(t)) continue;
            field.setAccessible(true);
            found.add(field);
        }
        fieldsOf = type;
        fields = found;
        return found;
    }

    /** This app's package: Instagram's, unless it was installed under another name. */
    private static String ownPackage() {
        if (ownPackage != null) return ownPackage;
        String name = null;
        try {
            name = (String) Class.forName("android.app.ActivityThread")
                    .getMethod("currentPackageName").invoke(null);
        } catch (Throwable ignored) {
            // Falls back to Instagram's package below.
        }
        ownPackage = name != null ? name : INSTAGRAM;
        return ownPackage;
    }
}
