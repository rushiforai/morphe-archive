package dev.custom.gboardpatches.keyboard;

import android.content.Context;
import android.content.ContextWrapper;
import android.inputmethodservice.InputMethodService;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputConnection;

import java.lang.reflect.Field;

/**
 * Double tap on the left half of the spacebar inserts a tab, the right half undoes the last edit.
 *
 * The keyboard dispatches a tap through {@code SoftKeyboardView.dispatchTouchEvent}, so the second
 * tap is swallowed there and the keyboard never commits a second space. Everything is reflection
 * based and wrapped in catch blocks: any surprise shape leaves the stock keyboard untouched.
 */
public final class SpacebarDoubleTapRuntime {

    /** Two taps further apart than this are two separate spaces, not a double tap. */
    private static final long MAX_TAP_GAP_MS = 400L;
    private static final long MIN_TAP_GAP_MS = 30L;

    private static long lastSpaceTapTime;
    private static boolean lastSpaceTapLeft;
    private static boolean swallowing;

    private SpacebarDoubleTapRuntime() {
    }

    /**
     * @return true when the event belongs to a double tap and must not reach the keyboard.
     */
    public static boolean maybeHandleTouch(ViewGroup keyboardView, MotionEvent event) {
        try {
            if (keyboardView == null || event == null) {
                return false;
            }
            int action = event.getActionMasked();
            if (swallowing) {
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    swallowing = false;
                }
                return true;
            }
            if (action != MotionEvent.ACTION_DOWN) {
                return false;
            }
            if (!touchesSpacebar(keyboardView, event)) {
                lastSpaceTapTime = 0L;
                return false;
            }

            long now = event.getEventTime();
            boolean left = event.getX() < keyboardView.getWidth() / 2.0f;
            long gap = now - lastSpaceTapTime;
            boolean isDoubleTap = lastSpaceTapTime != 0L
                && gap >= MIN_TAP_GAP_MS
                && gap <= MAX_TAP_GAP_MS
                && left == lastSpaceTapLeft;

            lastSpaceTapTime = now;
            lastSpaceTapLeft = left;

            if (!isDoubleTap) {
                return false;
            }

            // Only swallow the tap when the edit really happened, so a terminal that ignores Ctrl+Z
            // still gets its space.
            if (!applyEdit(keyboardView, left)) {
                return false;
            }
            lastSpaceTapTime = 0L;
            swallowing = true;
            return true;
        } catch (Throwable ignored) {
            swallowing = false;
            return false;
        }
    }

    /** Left half inserts a tab, right half undoes the last edit. */
    private static boolean applyEdit(View keyboardView, boolean left) {
        InputConnection connection = inputConnectionOf(keyboardView.getContext());
        if (connection == null) {
            return false;
        }
        try {
            if (left) {
                insertTab(connection);
            } else {
                sendUndo(connection);
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * The first tap of the pair already reached the keyboard and committed its space, so that one
     * space is removed before the tab lands: a double space becomes one tab rather than a space
     * followed by a tab. A selection is left alone, because the tab is about to replace it.
     */
    private static void insertTab(InputConnection connection) {
        CharSequence selected = connection.getSelectedText(0);
        boolean hasSelection = selected != null && selected.length() > 0;
        if (!hasSelection) {
            CharSequence before = connection.getTextBeforeCursor(1, 0);
            if (before != null && before.length() == 1 && before.charAt(0) == ' ') {
                connection.deleteSurroundingText(1, 0);
            }
        }
        connection.commitText("\t", 1);
    }

    /** Ctrl+Z undoes the last edit in Android's editors. */
    private static void sendUndo(InputConnection connection) {
        long now = android.os.SystemClock.uptimeMillis();
        int meta = KeyEvent.META_CTRL_ON | KeyEvent.META_CTRL_LEFT_ON;
        connection.sendKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_Z, 0, meta));
        connection.sendKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_Z, 0, meta));
    }

    private static InputConnection inputConnectionOf(Context context) {
        Context current = context;
        for (int depth = 0; current != null && depth < 12; depth++) {
            if (current instanceof InputMethodService) {
                return ((InputMethodService) current).getCurrentInputConnection();
            }
            if (current instanceof ContextWrapper) {
                current = ((ContextWrapper) current).getBaseContext();
                continue;
            }
            break;
        }
        return null;
    }

    private static boolean touchesSpacebar(ViewGroup keyboardView, MotionEvent event) {
        View hit = findKeyAt(keyboardView, event.getX(), event.getY(), 0);
        return hit != null && isSpaceKey(hit);
    }

    /** Walks the key hierarchy at the touch point, translating coordinates down the tree. */
    private static View findKeyAt(ViewGroup group, float x, float y, int depth) {
        if (depth > 8) {
            return null;
        }
        for (int i = group.getChildCount() - 1; i >= 0; i--) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) {
                continue;
            }
            float localX = x - child.getLeft() + group.getScrollX();
            float localY = y - child.getTop() + group.getScrollY();
            if (localX < 0 || localY < 0 || localX >= child.getWidth() || localY >= child.getHeight()) {
                continue;
            }
            if (child instanceof ViewGroup) {
                View deeper = findKeyAt((ViewGroup) child, localX, localY, depth + 1);
                if (deeper != null) {
                    return deeper;
                }
            }
            if (hasSoftKeyDef(child)) {
                return child;
            }
        }
        return null;
    }

    private static boolean hasSoftKeyDef(View view) {
        return softKeyDefOf(view) != null;
    }

    private static Object softKeyDefOf(View view) {
        try {
            for (Class<?> type = view.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if ("com.google.android.libraries.inputmethod.metadata.SoftKeyDef"
                        .equals(field.getType().getName())) {
                        field.setAccessible(true);
                        return field.get(view);
                    }
                }
            }
        } catch (Throwable ignored) {
            // fall through
        }
        return null;
    }

    /** A key whose payload is a single space commits text, so it is the spacebar. */
    private static boolean isSpaceKey(View view) {
        Object softKeyDef = softKeyDefOf(view);
        if (softKeyDef == null) {
            return false;
        }
        return containsSpaceString(softKeyDef, 0);
    }

    private static boolean containsSpaceString(Object value, int depth) {
        if (value == null || depth > 3) {
            return false;
        }
        if (value instanceof CharSequence) {
            return " ".contentEquals((CharSequence) value);
        }
        if (value instanceof Iterable) {
            for (Object element : (Iterable<?>) value) {
                if (containsSpaceString(element, depth + 1)) {
                    return true;
                }
            }
            return false;
        }
        if (value.getClass().isArray()) {
            int length = java.lang.reflect.Array.getLength(value);
            for (int i = 0; i < length; i++) {
                if (containsSpaceString(java.lang.reflect.Array.get(value, i), depth + 1)) {
                    return true;
                }
            }
            return false;
        }
        String name = value.getClass().getName();
        if (name.startsWith("com.google.android.libraries.inputmethod.metadata.")) {
            for (Class<?> type = value.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    try {
                        field.setAccessible(true);
                        if (containsSpaceString(field.get(value), depth + 1)) {
                            return true;
                        }
                    } catch (Throwable ignored) {
                        // inaccessible field, skip it
                    }
                }
            }
        }
        return false;
    }
}
