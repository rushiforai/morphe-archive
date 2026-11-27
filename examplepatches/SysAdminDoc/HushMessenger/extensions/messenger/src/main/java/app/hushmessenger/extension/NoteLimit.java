package app.hushmessenger.extension;

import android.text.InputFilter;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/**
 * Raises the length limit of Messenger's note box. The composer's number drives the counter and the Share button, and
 * the text filter keeps its own copy that stops the typing, so the two only ever change together: if the filter can't
 * be changed the composer gets Messenger's number back.
 */
public final class NoteLimit {
    /**
     * The longest note Facebook still shares (#233): on the S22 in November 2026 one of 601 characters posted and 609
     * didn't ("Your note wasn't shared"). A bigger box only lets people type notes that fail.
     */
    static final int LIMIT = 600;
    private static final String KEY = "longer_notes";

    /** The filter's limit field, kept once found because Messenger calls this every time the note screen updates. */
    private static Field limit;

    private NoteLimit() {
    }

    public static int raise(InputFilter filter, int stock) {
        try {
            if (!Settings.longerNotes()) {
                // Only a note left open while the switch went off still holds the raised number.
                Field raised = limit;
                if (raised != null && raised.getDeclaringClass() == filter.getClass() && raised.getInt(filter) == LIMIT) {
                    raised.setInt(filter, stock);
                }
                return stock;
            }
            Field field = limitOf(filter.getClass());
            if (field == null) throw new IllegalStateException("No single limit field in " + filter.getClass().getName());
            int wanted = Math.max(stock, LIMIT);
            int now = field.getInt(filter);
            if (now != wanted) {
                if (now != stock) throw new IllegalStateException("Unexpected note limit " + now);
                field.setInt(filter, wanted);
            }
            return wanted;
        } catch (LinkageError | ReflectiveOperationException | RuntimeException error) {
            Settings.hookFailed(KEY, "Can't change the note limit", error);
            return stock;
        }
    }

    private static Field limitOf(Class<?> type) {
        Field field = limit;
        if (field != null && field.getDeclaringClass() == type) return field;
        field = null;
        for (Field candidate : type.getDeclaredFields()) {
            if (Modifier.isStatic(candidate.getModifiers()) || candidate.getType() != int.class) continue;
            if (field != null) return null;
            field = candidate;
        }
        if (field != null) {
            field.setAccessible(true);
            limit = field;
        }
        return field;
    }
}
