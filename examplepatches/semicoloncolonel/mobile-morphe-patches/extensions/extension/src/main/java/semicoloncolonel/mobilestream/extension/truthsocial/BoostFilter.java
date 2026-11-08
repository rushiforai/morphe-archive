package semicoloncolonel.mobilestream.extension.truthsocial;

import java.lang.reflect.Field;
import java.util.ArrayList;

/**
 * Truth Social "Skip ads": drops boosted (paid-promotion) posts from every
 * list of posts the app reads. The patch replaces the list's add call with
 * {@link #add} and fills in {@link #boostField} with the obfuscated name of
 * the post's boost_id field.
 */
@SuppressWarnings("unused")
public final class BoostFilter {
    private static volatile Field field;
    private static volatile boolean failed;

    private BoostFilter() {
    }

    /** Replaced by the patch with the field's name. */
    private static String boostField() {
        return "";
    }

    public static boolean add(ArrayList<Object> list, Object status) {
        if (status != null && isBoosted(status)) return false;
        return list.add(status);
    }

    private static boolean isBoosted(Object status) {
        if (failed) return false;
        try {
            Field f = field;
            if (f == null) {
                f = status.getClass().getDeclaredField(boostField());
                f.setAccessible(true);
                field = f;
            }
            Object value = f.get(status);
            return value instanceof String && !((String) value).isEmpty();
        } catch (Throwable t) {
            failed = true;
            return false;
        }
    }
}
