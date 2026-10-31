package app.morphe.extension.syncforreddit.translate;

import android.content.ContentValues;
import android.content.Context;
import android.text.Html;
import android.text.SpannableStringBuilder;

import com.laurencedawson.reddit_sync.provider.RedditProvider;

import app.morphe.extension.shared.Logger;

/**
 * Putting text where the app reads it from.
 *
 * <p>Wanted in two places — when a translation is made, and when the app has written over one
 * with what its author wrote — so it belongs to neither.
 *
 * <p>Public because the app calls into it: a class the patch points a call at is reached from
 * whatever package that call was written into, and a package-private one is refused at the
 * moment it is first called rather than when it is patched.
 */
public final class Stored {
    /** What the app calls a comment, where it says which kind of thing it has. */
    static final int A_COMMENT = 11;

    /** Which post or comment a row is, which kind, and which thread it belongs to. */
    static final String THE_ID = "_id";
    static final String THE_KIND = "sync_type";
    static final String THE_THREAD = "link_id";

    /** Where the text of each is kept. */
    private static final String COMMENT_WRITTEN = "body_raw";
    private static final String COMMENT_DRAWN = "body_processed";
    private static final String POST_WRITTEN = "selftext_raw";
    private static final String POST_DRAWN = "selftext_processed";
    private static final String POST_PREVIEW = "selftext_processed_preview";
    private static final String THE_TITLE = "title";

    /** Where Sync cuts the drawn text to take the first of it for a feed. */
    private static final String FIRST_OF_IT = "\n.";

    /** What Sync's renderer leaves where a spoiler was. */
    private static final String A_SPOILER = "<abbr>";

    private Stored() {}

    /**
     * Writes the text where the app reads it from and says so, which is what makes everything
     * showing this post or comment draw it again.
     */
    static void write(Context context, String id, boolean isAComment, String title,
                              String body) {
        ContentValues values = new ContentValues();
        into(values, isAComment, title, body);
        if (values.size() == 0) {
            return;
        }

        context.getContentResolver().update(RedditProvider.q, values, id, null);
        context.getContentResolver().notifyChange(RedditProvider.B, null);
    }

    /** Fills in every column the text of a post or a comment is kept across. */
    static void into(ContentValues values, boolean isAComment, String title, String body) {
        if (body != null) {
            String drawn = d7.f.r(null, body);
            values.put(isAComment ? COMMENT_WRITTEN : POST_WRITTEN, body);
            values.put(isAComment ? COMMENT_DRAWN : POST_DRAWN, drawn);
            if (!isAComment) {
                // What a feed shows under a title is kept apart from the text it came from.
                values.put(POST_PREVIEW, previewOf(drawn));
            }
        }
        if (title != null) {
            values.put(THE_TITLE, title);
        }
    }

    /** What the app reads back out of a row it is about to store. */
    static String writtenIn(ContentValues row, boolean isAComment) {
        return row.getAsString(isAComment ? COMMENT_WRITTEN : POST_WRITTEN);
    }

    static String titleIn(ContentValues row) {
        return row.getAsString(THE_TITLE);
    }

    /**
     * Called with everything the app is about to store.
     *
     * <p>Reading a thread again writes what an author wrote over a translation, and the reader
     * sees the post they translated turn back for as long as it takes to notice and undo it.
     * Caught here instead, before any of it is stored, so there is nothing to see.
     *
     * @param rows What is about to be stored, taken as an object because a row of them cannot
     *             be written into a call at patch time: the compiler that assembles one does
     *             not read an array in what it is asked to call.
     * @noinspection unused
     */
    public static void beforeStoring(Object rows) {
        try {
            // Every row the app stores comes through here, so the question asked first is the
            // cheapest one: whether anything at all has been translated.
            if (!(rows instanceof ContentValues[])
                    || (!Originals.anyKept() && !Wholesale.anyWanted())) {
                return;
            }
            for (ContentValues row : (ContentValues[]) rows) {
                Originals.putTheTranslationBackInto(row);
                arrivedIn(row);
            }
        } catch (Throwable ex) {
            // Whatever else, the app's own writing must go through.
            Logger.printInfo(() -> "Could not keep a translation through a read: " + ex);
        }
    }

    /**
     * Notices a comment arriving in a thread that was asked for whole, so that what loads after
     * the rest were translated is translated too.
     */
    private static void arrivedIn(ContentValues row) {
        try {
            Integer kind = row.getAsInteger(THE_KIND);
            if (kind == null || kind != A_COMMENT) {
                return;
            }
            String thread = row.getAsString(THE_THREAD);
            if (thread == null) {
                return;
            }
            // A thread is named with the kind in front of it, and asked for without.
            int names = thread.indexOf('_');
            Wholesale.somethingArrivedIn(names < 0 ? thread : thread.substring(names + 1));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not tell what arrived: " + ex);
        }
    }

    /** The same where the app stores one row on its own. */
    public static void beforeStoringOne(ContentValues row) {
        beforeStoring((Object) new ContentValues[]{row});
    }

    /**
     * @return What a feed shows under a title: the first of the drawn text, as words rather
     *         than as tags, with a mark to say there is more. Built the way Sync builds it, so
     *         that a translated post reads in a feed exactly as an untranslated one does.
     */
    private static String previewOf(String drawn) {
        if (drawn == null || drawn.isEmpty()) {
            return null;
        }
        try {
            String[] parts = drawn.split(FIRST_OF_IT);
            boolean thereIsMore = parts.length > 1;
            String first = thereIsMore ? parts[0].trim() : drawn;

            if (first.contains(A_SPOILER)) {
                return "<Spoiler hidden>";
            }

            SpannableStringBuilder said =
                    (SpannableStringBuilder) Html.fromHtml(first);
            said.clearSpans();
            String words = said.toString().replaceAll("\uFFFC", "").trim();
            if (thereIsMore) {
                words = words + "\n…";
            }

            words = words.replace("\u200B", "").trim();
            return words.isEmpty() ? null : words;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not build the preview: " + ex);
            return null;
        }
    }

}
