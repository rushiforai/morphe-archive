package app.morphe.extension.syncforreddit.ui;

import android.text.style.ReplacementSpan;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import app.morphe.extension.shared.Logger;

/**
 * Keeps what Sync works out about the body shown under a post.
 *
 * <p>Sync renders that body in full and then, for a preview, drops every span it just worked out
 * and keeps the bare characters. An address in the body is left as ordinary words: drawn in the
 * colour of the text around it, since the span that would have coloured it is gone, and doing
 * nothing when tapped, since the span that would have answered is gone too.
 *
 * <p>Dropping is kept for the images. They are what makes a preview expensive, and letting them
 * stand would have a feed loading pictures it does not today. Everything else is put back.
 *
 * @noinspection unused
 */
public final class KeepSelftextLinksPatch {
    /** The list of spans a builder is holding, and the span each entry stands for. */
    private static volatile Field spans;
    private static volatile Field span;

    private KeepSelftextLinksPatch() {}

    /**
     * Called where Sync drops the spans, in place of dropping them.
     *
     * <p>The dropping still happens: it is what releases the image loads. What survives it is put
     * back afterwards, so a preview costs what it did and reads as what it says.
     */
    public static void keepDrawing(oc.c builder) {
        List<Object> kept = null;
        try {
            kept = worthKeeping(builder);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not tell the spans apart: " + ex);
        }

        builder.p();

        if (kept == null || kept.isEmpty()) {
            return;
        }

        try {
            held(builder).addAll(kept);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not put the spans back: " + ex);
        }
    }

    /** Everything standing over the text that is not an image. */
    private static List<Object> worthKeeping(oc.c builder) throws Exception {
        List<Object> kept = new ArrayList<>();
        for (Object entry : held(builder)) {
            if (!(spanOf(entry) instanceof ReplacementSpan)) {
                kept.add(entry);
            }
        }
        return kept;
    }

    @SuppressWarnings("unchecked")
    private static Collection<Object> held(oc.c builder) throws Exception {
        Field field = spans;
        if (field == null) {
            field = onlyOfType(builder.getClass(), Collection.class);
            field.setAccessible(true);
            spans = field;
        }
        return (Collection<Object>) field.get(builder);
    }

    private static Object spanOf(Object entry) throws Exception {
        Field field = span;
        if (field == null || field.getDeclaringClass() != entry.getClass()) {
            field = onlyOfType(entry.getClass(), Object.class);
            field.setAccessible(true);
            span = field;
        }
        return field.get(entry);
    }

    /**
     * The one field of the given kind. Named fields are not an option here: these classes are
     * obfuscated, and their names change with every build of the app.
     */
    private static Field onlyOfType(Class<?> owner, Class<?> kind) throws NoSuchFieldException {
        for (Field field : owner.getDeclaredFields()) {
            boolean matches = kind == Object.class
                    ? field.getType() == Object.class
                    : kind.isAssignableFrom(field.getType());
            if (matches) {
                return field;
            }
        }
        throw new NoSuchFieldException("No " + kind.getSimpleName() + " on " + owner.getName());
    }
}
