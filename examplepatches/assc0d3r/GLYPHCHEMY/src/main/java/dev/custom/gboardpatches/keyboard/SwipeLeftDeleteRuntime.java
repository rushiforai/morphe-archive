package dev.custom.gboardpatches.keyboard;

import android.content.Context;
import android.content.ContextWrapper;
import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.inputmethod.InputConnection;

/**
 * Sliding left anywhere on the keyboard acts as backspace.
 *
 * The pointer owner (the class that tracks a finger across soft keys) is hooked twice: its target
 * update entry records the key under the finger, and its per-event update decides whether the
 * gesture is a leftward slide. Once the slide is recognized the stock retargeting is suppressed so
 * the keys the finger travels over never press, and a repeating delete runs until the finger is
 * lifted: characters first, whole words once the slide is held.
 *
 * Everything is reflection/instanceof based and wrapped in catch blocks: any surprise shape leaves
 * the stock keyboard untouched.
 */
public final class SwipeLeftDeleteRuntime {

    /** Horizontal travel, in dp, before a drag counts as a left slide. */
    private static final float SLOP_DP = 32.0f;
    /** A vertical component this much larger than the horizontal one is a scroll, not a slide. */
    private static final float VERTICAL_RATIO = 1.2f;
    private static final long CHAR_INTERVAL_MS = 60L;
    private static final long WORD_INTERVAL_MS = 130L;
    /** Deletes before the slide turns into word deletion. */
    private static final int CHARS_BEFORE_WORDS = 8;
    private static final int WORD_LOOKBEHIND = 48;

    private static View anchorView;
    private static float downX;
    private static float downY;
    private static boolean tracking;
    private static boolean sliding;
    private static int deletes;
    private static Handler handler;
    private static Runnable pendingDelete;

    private SwipeLeftDeleteRuntime() {
    }

    /** Called from the pointer owner with the soft key the finger currently sits on. */
    public static void captureKey(Object key) {
        try {
            if (key instanceof View) {
                anchorView = (View) key;
            }
        } catch (Throwable ignored) {
            // keep the previous anchor
        }
    }

    /**
     * Called before the pointer owner updates its target for every touch event.
     *
     * @return true when the event belongs to a left slide and must not reach the stock keyboard.
     */
    public static boolean handleTouch(Object tracker, MotionEvent event, int index) {
        try {
            if (event == null) {
                return sliding;
            }
            int action = event.getActionMasked();
            float x = xOf(event, index);
            float y = yOf(event, index);
            if (action == MotionEvent.ACTION_DOWN) {
                resetSession();
                downX = x;
                downY = y;
                tracking = true;
                return false;
            }
            if (action == MotionEvent.ACTION_MOVE) {
                if (!tracking) {
                    return false;
                }
                if (sliding) {
                    return true;
                }
                float dx = x - downX;
                float dy = y - downY;
                if (dx > -slop() || Math.abs(dx) <= Math.abs(dy) * VERTICAL_RATIO) {
                    return false;
                }
                sliding = true;
                deletes = 0;
                deleteStep();
                scheduleNext();
                return true;
            }
            if (action == MotionEvent.ACTION_UP) {
                if (sliding) {
                    stopPendingDelete();
                    return true;
                }
                resetSession();
                return false;
            }
            if (action == MotionEvent.ACTION_CANCEL) {
                boolean wasSliding = sliding;
                resetSession();
                return wasSliding;
            }
            return sliding;
        } catch (Throwable ignored) {
            resetSession();
            return false;
        }
    }

    /**
     * Called when the pointer owner finishes the gesture. The key under the finger commits on
     * release, so a slide removes that stray character before it settles.
     */
    public static void onPointerFinish() {
        if (!sliding) {
            return;
        }
        try {
            sliding = false;
            deletes = 0;
            deleteStep();
        } catch (Throwable ignored) {
            // nothing to do
        }
        resetSession();
    }

    /** Drops any slide state and repeating delete; called from the pointer cancel/reset hooks. */
    public static void reset() {
        try {
            stopPendingDelete();
            sliding = false;
            deletes = 0;
        } catch (Throwable ignored) {
            // nothing to do
        }
    }

    private static void resetSession() {
        reset();
        tracking = false;
        downX = 0.0f;
        downY = 0.0f;
    }

    private static void scheduleNext() {
        stopPendingDelete();
        if (!sliding) {
            return;
        }
        long delay = deletes <= CHARS_BEFORE_WORDS ? CHAR_INTERVAL_MS : WORD_INTERVAL_MS;
        pendingDelete = new Runnable() {
            @Override
            public void run() {
                try {
                    if (!sliding) {
                        return;
                    }
                    deleteStep();
                    scheduleNext();
                } catch (Throwable ignored) {
                    // stop silently
                }
            }
        };
        handler().postDelayed(pendingDelete, delay);
    }

    private static void stopPendingDelete() {
        if (pendingDelete != null && handler != null) {
            handler.removeCallbacks(pendingDelete);
        }
        pendingDelete = null;
    }

    private static Handler handler() {
        if (handler == null) {
            handler = new Handler(Looper.getMainLooper());
        }
        return handler;
    }

    private static void deleteStep() {
        InputConnection connection = connectionOf();
        if (connection == null) {
            return;
        }
        boolean word = deletes >= CHARS_BEFORE_WORDS;
        deletes++;
        if (word) {
            deleteWord(connection);
        } else {
            connection.deleteSurroundingText(1, 0);
        }
    }

    /** Deletes the previous word together with the separators in front of it. */
    private static void deleteWord(InputConnection connection) {
        CharSequence before;
        try {
            before = connection.getTextBeforeCursor(WORD_LOOKBEHIND, 0);
        } catch (Throwable ignored) {
            before = null;
        }
        int count = 0;
        if (before != null) {
            int length = before.length();
            int cursor = length;
            while (cursor > 0 && Character.isWhitespace(before.charAt(cursor - 1))) {
                cursor--;
            }
            int wordEnd = cursor;
            while (cursor > 0 && isWordChar(before.charAt(cursor - 1))) {
                cursor--;
            }
            count = wordEnd - cursor;
            if (count == 0) {
                count = length - cursor;
            }
        }
        if (count <= 0) {
            count = 1;
        }
        connection.deleteSurroundingText(count, 0);
    }

    private static boolean isWordChar(char value) {
        return Character.isLetterOrDigit(value) || value == '\'' || value == '\u2019';
    }

    private static float slop() {
        View view = anchorView;
        if (view == null) {
            return SLOP_DP;
        }
        return SLOP_DP * view.getResources().getDisplayMetrics().density;
    }

    private static InputConnection connectionOf() {
        View view = anchorView;
        if (view == null) {
            return null;
        }
        Context context = view.getContext();
        for (int depth = 0; context != null && depth < 12; depth++) {
            if (context instanceof InputMethodService) {
                return ((InputMethodService) context).getCurrentInputConnection();
            }
            if (context instanceof ContextWrapper) {
                context = ((ContextWrapper) context).getBaseContext();
                continue;
            }
            break;
        }
        return null;
    }

    private static float xOf(MotionEvent event, int index) {
        try {
            return event.getX(index);
        } catch (Throwable ignored) {
            return event.getX();
        }
    }

    private static float yOf(MotionEvent event, int index) {
        try {
            return event.getY(index);
        } catch (Throwable ignored) {
            return event.getY();
        }
    }
}
