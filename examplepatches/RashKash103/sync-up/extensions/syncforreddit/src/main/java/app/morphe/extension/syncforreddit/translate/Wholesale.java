package app.morphe.extension.syncforreddit.translate;

import android.content.CursorLoader;
import android.os.Handler;
import android.os.Looper;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Threads that were translated whole, and the comments that arrive afterwards.
 *
 * <p>A thread is rarely all there at once: more of it loads as it is read, and a reply that
 * arrives after the rest were translated would sit among them in its own language. So a thread
 * asked for whole is remembered, and whatever turns up in it later is translated as well.
 *
 * <p>Remembered only while the app is running. Asking for a thread whole is a thing done while
 * reading it, and a thread opened again tomorrow is a fresh decision.
 */
final class Wholesale {
    /** How long to wait for the rest of a page to arrive before doing anything about it. */
    private static final long UNTIL_IT_SETTLES_MS = 1500;

    private static final Set<String> wanted = new HashSet<>();

    /** One waiting turn per thread, so a page of arrivals is dealt with once. */
    private static final Map<String, Runnable> waiting = new HashMap<>();

    private static final Handler onTheMainThread = new Handler(Looper.getMainLooper());

    private Wholesale() {}

    /** Remembers that this thread was asked for whole. */
    static void asked(String post) {
        if (post == null || post.isEmpty()) {
            return;
        }
        synchronized (wanted) {
            wanted.add(post);
        }
    }

    /** Forgets it, which is what putting a thread back amounts to. */
    static void enough(String post) {
        if (post == null) {
            return;
        }
        synchronized (wanted) {
            wanted.remove(post);
        }
    }

    /** @return Whether any thread at all was asked for whole, asked before every row stored. */
    static boolean anyWanted() {
        synchronized (wanted) {
            return !wanted.isEmpty();
        }
    }

    /** @return Whether whatever arrives in this thread should be translated as well. */
    static boolean stillWanted(String post) {
        if (post == null || post.isEmpty()) {
            return false;
        }
        synchronized (wanted) {
            return wanted.contains(post);
        }
    }

    /**
     * Called where something has arrived in a thread that was asked for whole.
     *
     * <p>Waits for the rest of what is arriving before doing anything: comments come in pages,
     * and translating each as it lands would ask the same questions many times over.
     */
    static void somethingArrivedIn(String post) {
        if (!stillWanted(post)) {
            return;
        }
        synchronized (waiting) {
            Runnable already = waiting.remove(post);
            if (already != null) {
                onTheMainThread.removeCallbacks(already);
            }

            Runnable soon = () -> {
                synchronized (waiting) {
                    waiting.remove(post);
                }
                catchUp(post);
            };
            waiting.put(post, soon);
            onTheMainThread.postDelayed(soon, UNTIL_IT_SETTLES_MS);
        }
    }

    /** Translates whatever in the thread is not translated yet. Runs on the thread that draws. */
    private static void catchUp(String post) {
        try {
            if (!stillWanted(post)) {
                return;
            }
            // Made here, where there is a thread that can be told of a change.
            CursorLoader reader = EveryComment.readerFor(Utils.getContext(), post);
            if (reader == null) {
                return;
            }

            new Thread(() -> {
                List<xa.d> comments = EveryComment.of(reader);
                if (comments.isEmpty()) {
                    return;
                }
                EveryComment.translate(comments, false, reader, what ->
                        Logger.printInfo(() -> "Caught up with " + post + ": " + what));
            }, "sync-up-catch-up").start();
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not catch up with " + post + ": " + ex);
        }
    }
}
