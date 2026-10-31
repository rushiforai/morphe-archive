package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.content.CursorLoader;
import android.database.Cursor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;

/**
 * Translating every comment read so far, and putting them all back again.
 *
 * <p>Each comment is judged on its own. A thread can hold several languages at once — a reply in
 * one and the comment above it in another — so one answer for the lot would translate some of
 * them out of a language they were never in.
 *
 * <p>A comment whose language cannot be told is left alone rather than guessed at. Asking about
 * that one on its own still offers to choose the language, which is where a choice belongs: it
 * is one comment and one question, rather than a question in the middle of forty.
 */
final class EveryComment {
    /** How far up a conversation is worth going for something to say about one comment. */
    private static final int AS_FAR_AS_IS_USEFUL = 8;

    private EveryComment() {}

    /**
     * @param about The post the thread belongs to.
     * @return A reader for that thread, or null where there can be none.
     *
     * <p>Must be made on the thread that draws. What Sync hands back watches the store for
     * changes, and a thing that watches has to be made where there is something to be told on
     * — which a thread of one's own has not.
     */
    static CursorLoader readerFor(Context context, String about) {
        if (context == null || about == null || about.isEmpty()) {
            return null;
        }
        try {
            return q8.c.a(context, t7.l.a(about, null), false, null);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not ask about the thread: "
                    + OnDeviceTranslator.because(ex));
            return null;
        }
    }

    /**
     * @param reader What was made on the thread that draws.
     * @return Every comment Sync has read of that thread.
     *
     * <p>Asked of Sync's own store, the way Sync asks it when translating a thread itself. The
     * comments are not held in a list anywhere — what is drawn is drawn straight from a cursor
     * — and reading the one the screen is using would move it under the screen's feet.
     */
    static List<xa.d> of(CursorLoader reader) {
        List<xa.d> comments = new ArrayList<>();
        if (reader == null) {
            return comments;
        }

        Cursor rows = null;
        try {
            rows = reader.loadInBackground();
            if (rows == null) {
                return comments;
            }
            for (int row = 0; row < rows.getCount(); row++) {
                xa.d each = xa.d.z(rows, row);
                if (each != null) {
                    comments.add(each);
                }
            }
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not read the thread: "
                    + OnDeviceTranslator.because(ex));
        } finally {
            if (rows != null) {
                try {
                    rows.close();
                } catch (Exception ex) {
                    Logger.printInfo(() -> "Could not close the thread: " + ex);
                }
            }
        }
        return comments;
    }

    /**
     * @return The comment given and everything under it, which is what a thread means where one
     *         comment is asked about rather than all of them.
     *
     * <p>Everything under it and nothing above: the replies to a comment are what is read after
     * it, and what it was itself replying to is a conversation of its own.
     */
    static List<xa.d> under(List<xa.d> comments, xa.d one) {
        List<xa.d> thread = new ArrayList<>();
        try {
            String id = one.U();
            if (id == null) {
                return thread;
            }

            Set<String> below = new HashSet<>();
            below.add(id);
            thread.add(one);

            // The comments come in the order they are shown, so a reply is always read after
            // the comment it answers and one pass is enough to find all of them.
            for (xa.d each : comments) {
                String parent = each.t0();
                if (parent == null) {
                    continue;
                }
                // A parent is named with the kind in front of it, which an id is not.
                int names = parent.indexOf('_');
                if (below.contains(names < 0 ? parent : parent.substring(names + 1))
                        && each.U() != null && below.add(each.U())) {
                    thread.add(each);
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not follow the thread down: " + ex);
        }
        return thread;
    }

    /**
     * @return The post the thread is about, where the reading of it turned one up. A thread is
     *         read as rows of what it holds, and the post is among them.
     */
    static xa.d thePostAmong(List<xa.d> comments) {
        for (xa.d each : comments) {
            try {
                if (each.Y0() != Stored.A_COMMENT) {
                    return each;
                }
            } catch (Exception ex) {
                // Something that will not say what it is, is not the post.
            }
        }
        return null;
    }

    /**
     * @return The comments this one is a reply to, oldest first, up to the top of the
     *         conversation. What a comment means often depends on what it answers.
     */
    static List<xa.d> above(List<xa.d> comments, xa.d one) {
        List<xa.d> ancestors = new ArrayList<>();
        try {
            Map<String, xa.d> byId = new HashMap<>();
            for (xa.d each : comments) {
                String id = each.U();
                if (id != null) {
                    byId.put(id, each);
                }
            }

            xa.d at = one;
            while (ancestors.size() < AS_FAR_AS_IS_USEFUL) {
                String parent = at.t0();
                if (parent == null) {
                    break;
                }
                int names = parent.indexOf('_');
                xa.d above = byId.get(names < 0 ? parent : parent.substring(names + 1));
                if (above == null) {
                    break;
                }
                ancestors.add(0, above);
                at = above;
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not follow the thread up: " + ex);
        }
        return ancestors;
    }

    /** @return How many of them are standing translated. */
    static int translatedAmong(List<xa.d> comments) {
        int translated = 0;
        for (xa.d each : comments) {
            if (Originals.isTranslated(each)) {
                translated++;
            }
        }
        return translated;
    }

    /**
     * Translates every one that is not, or puts every one back that is.
     *
     * @param back Whether to put them back rather than translate them.
     */
    static void translate(List<xa.d> comments, boolean back, CursorLoader reader, Said tell) {
        new Thread(() -> {
            int done = 0;
            int skipped = 0;
            int failed = 0;

            for (xa.d each : comments) {
                try {
                    boolean translated = Originals.isTranslated(each);
                    if (translated != back) {
                        // Already the way it is being asked to be.
                        continue;
                    }

                    switch (WithoutTheSheet.of(each, null, false, reader)) {
                        case TRANSLATED:
                        case PUT_BACK:
                            done++;
                            break;
                        case NO_LANGUAGE:
                            skipped++;
                            break;
                        default:
                            break;
                    }
                } catch (Exception ex) {
                    failed++;
                    Logger.printInfo(() -> "Could not translate one of them: "
                            + OnDeviceTranslator.because(ex));
                }
            }

            tell.heard(said(done, skipped, failed, back));
        }, "sync-up-translate-thread").start();
    }

    /** What is worth saying once about all of them. */
    interface Said {
        void heard(String what);
    }

    /** @return What to say about what came of it, counted rather than listed. */
    private static String said(int done, int skipped, int failed, boolean back) {
        if (done == 0 && skipped == 0 && failed == 0) {
            return back ? "Nothing to put back" : "Nothing to translate";
        }

        StringBuilder saying = new StringBuilder();
        saying.append(done).append(back ? " put back" : done == 1 ? " comment translated"
                : " comments translated");
        if (skipped > 0) {
            saying.append(", ").append(skipped).append(" in no language anyone could tell");
        }
        if (failed > 0) {
            saying.append(", ").append(failed).append(" could not be done");
        }
        return saying.toString();
    }
}
