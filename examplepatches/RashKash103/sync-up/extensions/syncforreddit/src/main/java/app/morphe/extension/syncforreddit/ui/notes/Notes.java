package app.morphe.extension.syncforreddit.ui.notes;

import android.text.style.ForegroundColorSpan;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.http.undelete.RestoredNotes;
import app.morphe.extension.syncforreddit.translate.Originals;

/**
 * What the line under an author has to say about a post or a comment, beyond what Sync puts
 * there itself.
 *
 * <p>There is one place that line is built and more than one patch with something to add to it,
 * so the call goes in once and what it says is decided here. Each patch keeps its own note and
 * is asked for it as the line is drawn; where a patch is not applied its note is never there to
 * find, so nothing has to be told which patches are in.
 *
 * @noinspection unused
 */
public final class Notes {
    /**
     * A red dark enough to read against a light background and light enough against a dark one,
     * since Sync themes the line the note sits on and the note has to hold up on either.
     */
    private static final int RESTORED = 0xFFD1373A;

    /**
     * A blue chosen the same way, but deeper, so that it carries less weight than the red
     * beside it: text that was put back is worth noticing, and text being read in translation
     * is worth knowing.
     */
    private static final int TRANSLATED = 0xFF1B5E86;

    private Notes() {}

    /**
     * Adds whatever is to be said to the line under an author, right after the separating space
     * Sync leaves following the flair and before the score and age it goes on to add. Sync's own
     * "(last edited …)" is written further along the same line and is left as it is.
     */
    public static void appendNote(oc.c header, xa.d comment) {
        append(header, comment, true);
    }

    /**
     * The same for a post, whose header is built by a method taking what Sync's own flair helper
     * takes, so this is called in its shape rather than needing anything moved about for it.
     */
    public static void appendPostNote(oc.c header, Object unusedView, xa.d post) {
        append(header, post, false);
    }

    /**
     * @param leadingBullet Whether a separator is wanted before a note. What Sync leaves ahead of
     *                      it differs: a comment's line has a space there and a post's has a
     *                      separator already, and a second one beside it reads as a gap.
     */
    private static void append(oc.c header, xa.d content, boolean leadingBullet) {
        try {
            if (header == null || content == null) {
                return;
            }

            String id = content.U();
            List<String> said = new ArrayList<>(2);
            List<Integer> coloured = new ArrayList<>(2);

            String restored = RestoredNotes.noteFor(id);
            if (restored != null) {
                said.add(restored);
                coloured.add(RESTORED);
            }

            String translated = Originals.noteFor(content);
            if (translated != null) {
                said.add(translated);
                coloured.add(TRANSLATED);
            }

            for (int each = 0; each < said.size(); each++) {
                // Only the wording is coloured, so the line keeps the same separators between
                // its parts as it has everywhere else.
                if (leadingBullet) {
                    header.b("• ");
                }
                header.c(said.get(each),
                        new Object[]{new ForegroundColorSpan(coloured.get(each))});
                header.b(leadingBullet ? " " : " • ");
            }
        } catch (Throwable ex) {
            // Losing a note is a far better outcome than a thread that will not draw.
            Logger.printInfo(() -> "Could not add a note: " + ex);
        }
    }
}
