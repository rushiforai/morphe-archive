package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.content.CursorLoader;

import java.util.List;

import app.morphe.extension.shared.Logger;

/**
 * What a service is told about a comment so that it can translate it better.
 *
 * <p>A comment is often a fragment: a word of agreement, a pronoun standing for something said
 * three replies ago, a joke that only lands against what it answers. DeepL takes a piece of
 * context and translates the text against it without translating the context itself, which is
 * exactly what a reply needs.
 *
 * <p>What is sent is chosen in the settings: nothing, the post, or the post and the comments
 * above this one. Nothing is sent for a post, which is not answering anything.
 */
final class WhatItIsAbout {
    /** What the setting can say. */
    static final String NOTHING = "none";
    static final String THE_POST = "post";
    static final String THE_THREAD = "thread";

    /**
     * How much is worth sending. Context is charged for as characters like anything else, and a
     * whole conversation would cost more than the reply it is explaining.
     */
    private static final int AT_MOST = 2000;

    private WhatItIsAbout() {}

    /**
     * @param reader What was made where a thread can be read, or null where none was.
     * @return What to tell the service, or null where there is nothing to tell it.
     */
    static String forThis(Context context, xa.d comment, CursorLoader reader) {
        try {
            if (comment == null || comment.Y0() != Stored.A_COMMENT) {
                // A post answers nothing, so there is nothing to say about it.
                return null;
            }

            String wanted = TranslationSettings.text(context,
                    TranslationSettings.DEEPL_CONTEXT, THE_THREAD);
            if (NOTHING.equals(wanted) || reader == null) {
                return null;
            }

            List<xa.d> thread = EveryComment.of(reader);
            if (thread.isEmpty()) {
                return null;
            }

            StringBuilder saying = new StringBuilder();
            xa.d post = EveryComment.thePostAmong(thread);
            if (post != null) {
                add(saying, post.b1());
                add(saying, post.P0());
            }

            if (THE_THREAD.equals(wanted)) {
                for (xa.d above : EveryComment.above(thread, comment)) {
                    add(saying, above.o());
                }
            }

            String said = saying.toString().trim();
            if (said.isEmpty()) {
                return null;
            }
            // The end of it is what the comment is answering, so the beginning is what goes.
            return said.length() <= AT_MOST ? said : said.substring(said.length() - AT_MOST);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not work out what the comment is about: " + ex);
            return null;
        }
    }

    private static void add(StringBuilder saying, String what) {
        if (what == null || what.trim().isEmpty()) {
            return;
        }
        if (saying.length() > 0) {
            saying.append("\n\n");
        }
        saying.append(what.trim());
    }
}
