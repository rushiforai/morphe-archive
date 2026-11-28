package app.onlynazril.extension.tiktok;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.settings.HandleSettings;

/**
 * Hold a name to copy its @handle.
 * <p>
 * The name is TikTok's own view and the patch only changes the text it carries, so the listener is
 * installed on that view after a bind: the header hands over its root, and a comment row is found
 * by climbing from the time view to the row's root. The listener copies the handle the row is
 * showing at that moment, not one captured earlier, so a recycled view cannot copy the previous
 * video's author.
 * <p>
 * A comment's name is written after its time, so the first attempt can miss it. One pre-draw
 * listener retries until the view carries a name, then removes itself; a bounded number of frames
 * keeps a row that never draws a name from leaving a listener behind.
 */
public final class HandleCopy {
    /** Marks a name view that already carries the listener, so it is installed exactly once. */
    private static final int LISTENER_TAG = 0x7f0f9995;

    /** The name's own alpha, remembered when the hold starts. */
    private static final int ALPHA_TAG = 0x7f0f9994;

    /** The full handle behind the name, so an ellipsized view still copies the whole one. */
    private static final int HANDLE_TAG = 0x7f0f9993;

    /** How far the name dims while it is held. */
    private static final float HELD_ALPHA = 0.55f;

    /** About two seconds of frames: enough for the name write, short enough to give up. */
    private static final int MAX_FRAMES = 120;

    /** The names most recently bound, used to tell whether a touch began on one of them. */
    private static final List<WeakReference<View>> NAMES = new ArrayList<>();
    private static boolean suppressCellGesture;
    private static float downX;
    private static float downY;

    private HandleCopy() {}

    /**
     * Called from the feed cell root's `dispatchTouchEvent`. A gesture that starts on the name is
     * passed straight to the normal view dispatch, so the cell's own long-press speed-up never sees
     * it. The check uses the name's current screen bounds, and the state is cleared on up or cancel.
     */
    public static boolean blocksCellGesture(View root, MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            suppressCellGesture = false;
            View name = findTagged(root);
            if (name == null || !name.isShown()) name = visibleName();
            if (name != null && name.isShown()) {
                int[] location = new int[2];
                name.getLocationOnScreen(location);
                int pad = Math.round(
                        24f * name.getResources().getDisplayMetrics().density);
                if (event.getRawX() >= location[0] - pad
                        && event.getRawX() < location[0] + name.getWidth() + pad
                        && event.getRawY() >= location[1] - pad
                        && event.getRawY() < location[1] + name.getHeight() + pad) {
                    suppressCellGesture = true;
                    downX = event.getRawX();
                    downY = event.getRawY();
                }
            }
        } else if (suppressCellGesture && action == MotionEvent.ACTION_MOVE) {
            View name = findTagged(root);
            float slop = name == null
                    ? 0f
                    : ViewConfiguration.get(name.getContext()).getScaledTouchSlop();
            if (Math.abs(event.getRawX() - downX) > slop
                    || Math.abs(event.getRawY() - downY) > slop) {
                // A drag belongs to the list, not to the hold.
                suppressCellGesture = false;
            }
        }
        boolean blocked = suppressCellGesture;
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            suppressCellGesture = false;
        }
        return blocked;
    }

    /** The name this cell root owns: the one that carries the hold listener. */
    private static View findTagged(View view) {
        if (view == null) return null;
        if (view.getTag(LISTENER_TAG) != null) return view;
        if (!(view instanceof ViewGroup group)) return null;
        for (int i = 0; i < group.getChildCount(); i++) {
            View found = findTagged(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static void remember(View name) {
        synchronized (NAMES) {
            NAMES.add(new WeakReference<>(name));
            if (NAMES.size() > 12) NAMES.remove(0);
        }
    }

    private static View visibleName() {
        synchronized (NAMES) {
            for (int i = NAMES.size() - 1; i >= 0; i--) {
                View name = NAMES.get(i).get();
                if (name != null && name.isShown()) return name;
            }
        }
        return null;
    }

    /** A name inside this root, for a header whose root is already the row. */
    public static void watch(View root, String expectedName, String handle) {
        if (root == null || !enabled(root)) return;
        if (attach(root, expectedName, handle)) return;
        retry(root, expectedName, handle);
    }

    /** A name near this view, for a comment where only the time view is in hand. */
    public static void watchNear(View anchor, String expectedName, String handle) {
        if (anchor == null || !enabled(anchor)) return;
        View root = itemRoot(anchor);
        if (attach(root, expectedName, handle)) return;
        retry(root, expectedName, handle);
    }

    private static boolean enabled(View view) {
        Context context = view.getContext();
        return context != null && HandleSettings.isCopyOnHoldEnabled(context);
    }

    private static void retry(View root, String expectedName, String handle) {
        final int[] frames = {0};
        final ViewTreeObserver[] observer = {root.getViewTreeObserver()};
        final ViewTreeObserver.OnPreDrawListener[] listener = new ViewTreeObserver.OnPreDrawListener[1];
        listener[0] = () -> {
            if (attach(root, expectedName, handle) || ++frames[0] >= MAX_FRAMES) {
                if (observer[0].isAlive()) observer[0].removeOnPreDrawListener(listener[0]);
                return true;
            }
            return true;
        };
        if (observer[0].isAlive()) observer[0].addOnPreDrawListener(listener[0]);
    }

    /** The row a comment's time view belongs to: everything below the list's RecyclerView. */
    private static View itemRoot(View view) {
        View current = view;
        for (int depth = 0; depth < 16; depth++) {
            if (!(current.getParent() instanceof View parent)) break;
            if (isRecyclerView(parent)) break;
            current = parent;
        }
        return current;
    }

    /** The list is not on this module's compile classpath, so its class name is the check. */
    private static boolean isRecyclerView(View view) {
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().contains("RecyclerView")) return true;
        }
        return false;
    }

    private static boolean attach(View root, String expectedName, String handle) {
        if (handle == null || handle.trim().isEmpty()) return false;
        TextView name = findName(root, expectedName, handle);
        if (name == null) return false;
        name.setTag(HANDLE_TAG, stripAt(handle));
        if (name.getTag(LISTENER_TAG) != null) return true;
        name.setTag(LISTENER_TAG, Boolean.TRUE);
        name.setOnTouchListener(new Hold(name));
        remember(name);
        Debug.print("handle copy: listener on " + name.getClass().getSimpleName()
                + " text='" + textOf(name) + "' handle='" + handle + "'");
        return true;
    }

    private static TextView findName(View view, String expectedName, String handle) {
        TextView clicked = findName(view, expectedName, handle, true);
        return clicked != null ? clicked : findName(view, expectedName, handle, false);
    }

    private static TextView findName(
            View view, String expectedName, String handle, boolean clickableOnly) {
        if (view instanceof TextView text && isName(textOf(text), expectedName, handle)
                && (!clickableOnly || view.isClickable())) {
            return (TextView) view;
        }
        if (!(view instanceof ViewGroup group)) return null;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = findName(group.getChildAt(i), expectedName, handle, clickableOnly);
            if (found != null) return found;
        }
        return null;
    }

    /**
     * The author's name, not any mention in the row. With the handle in hand the first token has
     * to be exactly `@handle` (a reply prefix such as `@handle > @target` still matches); the
     * nickname is only the fallback when the payload has no handle.
     */
    private static boolean isName(String text, String expectedName, String handle) {
        String trimmed = text.trim();
        if (handle != null && !handle.trim().isEmpty()) {
            String at = "@" + stripAt(handle);
            if (!trimmed.startsWith(at)) return false;
            if (trimmed.length() == at.length()) return true;
            char next = trimmed.charAt(at.length());
            return Character.isWhitespace(next) || next == '\u00b7' || next == '\u2026'
                    || next == '>' || next == '\u203a';
        }
        if (expectedName == null) return false;
        String expected = expectedName.trim();
        return trimmed.equals(expected) || trimmed.startsWith(expected + " ");
    }

    /**
     * Owns the name's touch stream so the press never reaches the video's own long-press detector:
     * that detector is what starts the 2x playback. A short press is still a click, a held press is
     * the copy, and the parent is released on up or cancel.
     */
    private static final class Hold implements View.OnTouchListener {
        private final int timeout;
        private final int slop;
        private float downX;
        private float downY;
        private boolean moved;
        private boolean copied;
        private Runnable pending;

        Hold(View view) {
            this.timeout = ViewConfiguration.getLongPressTimeout();
            this.slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        }

        @Override
        public boolean onTouch(View view, MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    copied = false;
                    moved = false;
                    downX = event.getX();
                    downY = event.getY();
                    intercept(view, true);
                    view.setPressed(true);
                    float baseAlpha = view.getAlpha();
                    view.setTag(ALPHA_TAG, baseAlpha);
                    fade(view, baseAlpha * HELD_ALPHA, 120);
                    pending = () -> {
                        if (copied) return;
                        copied = true;
                        copy(view);
                    };
                    view.postDelayed(pending, timeout);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    if (!copied && !moved
                            && (Math.abs(event.getX() - downX) > slop
                                || Math.abs(event.getY() - downY) > slop)) {
                        moved = true;
                        cancel(view);
                        // A drag is a scroll, not a hold: give the list its gesture back.
                        intercept(view, false);
                        view.setPressed(false);
                        restoreAlpha(view);
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    cancel(view);
                    intercept(view, false);
                    view.setPressed(false);
                    restoreAlpha(view);
                    if (!copied && !moved) view.performClick();
                    copied = false;
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    cancel(view);
                    intercept(view, false);
                    release(view);
                    copied = false;
                    return true;
                default:
                    return true;
            }
        }

        private void cancel(View view) {
            if (pending != null) {
                view.removeCallbacks(pending);
                pending = null;
            }
        }

        private void intercept(View view, boolean disallow) {
            ViewParent parent = view.getParent();
            if (parent != null) parent.requestDisallowInterceptTouchEvent(disallow);
        }
    }

    private static boolean copy(View view) {
        if (!(view instanceof TextView)) return false;
        Context context = view.getContext();
        if (context == null || !HandleSettings.isCopyOnHoldEnabled(context)) return false;
        Object stored = view.getTag(HANDLE_TAG);
        String handle = stored instanceof String
                ? (String) stored
                : handleOf(textOf((TextView) view));
        if (handle == null || handle.isEmpty()) return false;
        ClipboardManager clipboard =
                (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return false;
        clipboard.setPrimaryClip(ClipData.newPlainText("handle", handle));
        Toast.makeText(context, "Copied " + handle, Toast.LENGTH_SHORT).show();
        release(view);
        return true;
    }

    /**
     * Drops the hold state once the copy is done. The long press has already fired, but the view
     * keeps its pressed drawable and its pending callbacks until the gesture ends; clearing both
     * makes the component let go immediately instead of staying highlighted.
     */
    private static void release(View view) {
        view.cancelLongPress();
        view.setPressed(false);
        view.setSelected(false);
        view.clearFocus();
        restoreAlpha(view);
        view.jumpDrawablesToCurrentState();
    }

    /** A short, eased change of the name's alpha; cancel first so two holds cannot stack. */
    private static void fade(View view, float alpha, int duration) {
        view.animate().cancel();
        view.animate()
                .alpha(alpha)
                .setDuration(duration)
                .setInterpolator(new DecelerateInterpolator())
                .start();
    }

    private static void restoreAlpha(View view) {
        Object tag = view.getTag(ALPHA_TAG);
        float base = tag instanceof Float ? (Float) tag : 1f;
        fade(view, base, 160);
    }

    /** The first token of a stamped name, without the leading `@` or any metadata after it. */
    private static String handleOf(String text) {
        String trimmed = stripAt(text);
        if (trimmed.isEmpty()) return null;
        int end = trimmed.length();
        for (int i = 0; i < trimmed.length(); i++) {
            char c = trimmed.charAt(i);
            if (Character.isWhitespace(c) || c == '\u00b7' || c == '\u2026') {
                end = i;
                break;
            }
        }
        if (end > 3 && trimmed.startsWith("...", end - 3)) end -= 3;
        return end <= 0 ? null : trimmed.substring(0, end);
    }

    private static String stripAt(String value) {
        String trimmed = value == null ? "" : value.trim();
        if (trimmed.startsWith("@")) trimmed = trimmed.substring(1).trim();
        if (trimmed.endsWith("\u2026")) {
            trimmed = trimmed.substring(0, trimmed.length() - 1).trim();
        }
        return trimmed;
    }

    private static String textOf(TextView view) {
        CharSequence text = view.getText();
        return text == null ? "" : text.toString();
    }
}
