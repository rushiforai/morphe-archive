package app.morphe.extension.syncforreddit.translate;

import app.morphe.extension.shared.Logger;

/**
 * What is written back when a translation arrives.
 *
 * <p>Sync writes the text as it was, then a rule, then the translation, then a line naming the
 * service — which it draws as a picture fetched from a domain that no longer answers. So a
 * translated post is twice as long as it was, says it twice, and has a gap at the bottom.
 *
 * <p>Only the translation is written now. What was written is kept aside first, so that asking
 * to translate the same thing again puts it back, and the line under the author says which
 * language it came from while it stands translated.
 *
 * @noinspection unused
 */
public final class InPlace {
    /** What the app calls a comment, where it says which kind of thing it has. */
    private static final int A_COMMENT = 11;

    private InPlace() {}

    /**
     * Called where Sync would have composed what to store out of the text, the translation and
     * a line about Google.
     *
     * @param content      The post or the comment being translated.
     * @param fromLanguage What it was written in.
     * @param translated   The translation, or what was written where it is being put back.
     * @return What to store, which is what it was handed.
     */
    public static String instead(xa.d content, String fromLanguage, String translated) {
        try {
            String id = content.U();

            if (Originals.written(id) != null) {
                // This was translated already, so what is being written back is what was
                // written in the first place, and there is nothing left to put back.
                Originals.forget(id);
                return translated;
            }

            String written = content.Y0() == A_COMMENT ? content.o() : content.P0();
            if (translated == null || translated.equals(written)) {
                // A translation that says exactly what was written is not one. Keeping it would
                // put a note under the author about a post that plainly did not change.
                Logger.printInfo(() -> "The translation says what was written, so it is not one");
                return translated;
            }
            Originals.remember(id, null, written, null, translated, fromLanguage);
        } catch (Throwable ex) {
            // Whatever else happens, what was asked for is the translation.
            Logger.printInfo(() -> "Could not keep what was written: " + ex);
        }

        return translated;
    }
}
