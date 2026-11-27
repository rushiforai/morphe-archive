package app.syncit.extension;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Keeps the spans Sync builds for a post body when it draws a feed preview.
 *
 * <p>Sync parses the body into styled text and then, for a preview, drops every span it built
 * and keeps the bare characters. A link is left as ordinary words: drawn in the colour of the
 * text around it, and doing nothing when tapped, because the span that would have answered is
 * gone.
 *
 * <p>Only the link spans are put back. The other spans are left dropped on purpose: the app
 * scales a link's text by 1.25 when its "large link sources" setting is on, and restoring the
 * size spans alongside the links would draw them larger than the text size the user chose.
 *
 * <p>Based on the approach of Patcheddit and Sync Up (GPL-3.0), adapted for this patch bundle.
 *
 * @noinspection unused
 */
public final class KeepPreviewLinksPatch {
    /** The list of spans a builder is holding, and the span each entry stands for. */
    private static volatile Field spans;
    private static volatile Field span;

    private KeepPreviewLinksPatch() {}

    /**
     * Called where Sync drops the spans, in place of dropping them.
     *
     * <p>The dropping still happens: it is what releases the image loads. What survives it is
     * put back afterwards, so a preview costs what it did and reads as what it says.
     */
    public static void keepDrawing(oc.c builder) {
        List<Object> kept = null;
        try {
            kept = worthKeeping(builder);
        } catch (Throwable ignored) {
            // If the spans cannot be told apart, fall back to Sync's own behaviour.
        }

        builder.p();

        if (kept == null || kept.isEmpty()) {
            return;
        }

        try {
            held(builder).addAll(kept);
        } catch (Throwable ignored) {
            // Same here: a preview without links is better than a post that does not draw.
        }
    }

    /** The links standing over the text, and nothing else. */
    private static List<Object> worthKeeping(oc.c builder) throws Exception {
        List<Object> kept = new ArrayList<>();
        for (Object entry : held(builder)) {
            if (spanOf(entry) instanceof mb.d) {
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
