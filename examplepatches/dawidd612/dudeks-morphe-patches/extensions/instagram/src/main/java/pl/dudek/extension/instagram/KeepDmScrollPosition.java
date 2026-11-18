package pl.dudek.extension.instagram;

import java.lang.ref.WeakReference;
import android.os.SystemClock;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewTreeObserver;
import androidx.recyclerview.widget.RecyclerView;
import app.morphe.extension.instagram.utils.IgStr;
import app.morphe.extension.crimera.settings.BooleanSetting;
import app.morphe.extension.crimera.sharedPreference.SharedPref;
import app.morphe.extension.instagram.settings.preference.Helper;

/** Piko add-on. Temporary layout tracking is restricted to the old-reply send path. */
public final class KeepDmScrollPosition {
    private static final String KEY = "dudeks_keep_dm_scroll_position";
    private static final BooleanSetting ENABLED = new BooleanSetting(KEY, true);

    private static WeakReference<ReplyLayout> activeReply = new WeakReference<>(null);

    private KeepDmScrollPosition() {}

    /** Only the Direct layout helper calls this, with its own weak list reference. */
    public static boolean shouldSkipReplyLayoutScroll(WeakReference<?> listReference) {
        ReplyLayout reply = activeReply.get();
        if (reply == null || listReference == null || listReference.get() != reply.list) return false;
        if (!reply.isValid()) {
            reply.dispose();
            return false;
        }
        return true;
    }

    public static boolean shouldKeepPosition(Object repliedMessage, boolean atLatest) {
        // Every subsequent send ends the previous transition, including ordinary
        // messages and replies at latest. An eligible reply arms a fresh snapshot.
        ReplyLayout previous = activeReply.get();
        if (previous != null) previous.dispose();
        if (repliedMessage == null || atLatest) return false;
        try {
            return Boolean.TRUE.equals(SharedPref.getBooleanPref(ENABLED));
        } catch (RuntimeException unavailablePreferences) {
            // Preserve Instagram's behavior if preferences are unavailable during teardown.
            return false;
        }
    }

    /** Called only when the old-reply guard has suppressed the send-to-latest runnable. */
    public static void preserveReplyLayout(View view) {
        if (!(view instanceof RecyclerView)) return;
        RecyclerView list = (RecyclerView) view;
        if (!list.isAttachedToWindow() || list.getScrollState() != 0 || list.getChildCount() == 0) return;
        View first = null;
        View second = null;
        for (int i = 0; i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            if (child.getBottom() <= list.getPaddingTop() ||
                    child.getTop() >= list.getHeight() - list.getPaddingBottom()) continue;
            if (first == null || child.getTop() < first.getTop()) {
                second = first;
                first = child;
            } else if (second == null || child.getTop() < second.getTop()) {
                second = child;
            }
        }
        if (first != null) new ReplyLayout(list, first, second).listen();
    }

    /**
     * Composer cleanup may be deferred or animate over several frames. Observe a
     * bounded transition instead of dropping the anchor at the first unchanged draw.
     * Only compensate uniform row movement equal to the usable bottom-edge change;
     * native dataset anchoring and all unrelated scrolling remain in control.
     */
    private static final class ReplyLayout implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener, Runnable {
        // Observation budget, not an Instagram animation duration or a delayed jump.
        private static final long MAX_TRANSITION_MS = 1000;
        private final RecyclerView list;
        private final View first, second;
        private final ViewTreeObserver observer;
        private final int width, firstHeight, secondHeight;
        private final float firstTop, firstTranslation, secondTranslation;
        private int lastFirstTop, lastSecondTop;
        private float lastFirstTranslation, lastSecondTranslation;
        private final int[] location = new int[2];
        private final long deadline = SystemClock.uptimeMillis() + MAX_TRANSITION_MS;
        private int bottom;
        private boolean disposed;

        ReplyLayout(RecyclerView list, View first, View second) {
            this.list = list;
            this.first = first;
            this.second = second;
            observer = list.getViewTreeObserver();
            width = list.getWidth();
            list.getLocationOnScreen(location);
            bottom = contentBottom();
            lastFirstTop = location[1] + first.getTop();
            lastSecondTop = second == null ? 0 : location[1] + second.getTop();
            firstTranslation = lastFirstTranslation = first.getTranslationY();
            secondTranslation = lastSecondTranslation = second == null ? 0 : second.getTranslationY();
            firstTop = lastFirstTop + firstTranslation;
            firstHeight = first.getHeight();
            secondHeight = second == null ? 0 : second.getHeight();
        }

        private int contentBottom() {
            return location[1] + list.getHeight() - list.getPaddingBottom();
        }

        void listen() {
            if (!observer.isAlive()) return;
            ReplyLayout previous = activeReply.get();
            if (previous != null) previous.dispose();
            activeReply = new WeakReference<>(this);
            observer.addOnPreDrawListener(this);
            list.addOnAttachStateChangeListener(this);
            // Release even if the view stays attached but stops drawing.
            if (!list.postDelayed(this, MAX_TRANSITION_MS)) dispose();
        }

        private void dispose() {
            if (disposed) return;
            disposed = true;
            if (activeReply.get() == this) activeReply.clear();
            if (observer.isAlive()) observer.removeOnPreDrawListener(this);
            list.removeOnAttachStateChangeListener(this);
            list.removeCallbacks(this);
        }

        private boolean isValid() {
            return !disposed && SystemClock.uptimeMillis() < deadline && list.isAttachedToWindow() &&
                    list.hasWindowFocus() && list.getScrollState() == 0 &&
                    first.getParent() == list && first.getHeight() == firstHeight &&
                    (second == null || (second.getParent() == list && second.getHeight() == secondHeight)) &&
                    list.getWidth() == width;
        }

        @Override public boolean onPreDraw() {
            if (!isValid()) {
                dispose();
                return true;
            }
            list.getLocationOnScreen(location);
            int nextBottom = contentBottom();
            int growth = nextBottom - bottom;
            int layoutMovement = location[1] + first.getTop() - lastFirstTop;
            int secondLayoutMovement = second == null ? layoutMovement : location[1] + second.getTop() - lastSecondTop;
            float translation = first.getTranslationY();
            float otherTranslation = second == null ? 0 : second.getTranslationY();
            if ((layoutMovement != 0 && layoutMovement != growth) || secondLayoutMovement != layoutMovement ||
                    !followsResize(translation, lastFirstTranslation, firstTranslation, layoutMovement, growth) ||
                    (second != null && !followsResize(otherTranslation, lastSecondTranslation,
                            secondTranslation, layoutMovement, growth))) {
                // Explicit navigation, manual scrolling or an independent item update.
                // Never resume tracking after this, even if scrolling becomes idle.
                dispose();
                return true;
            }
            float movement = location[1] + first.getTop() + translation - firstTop;
            // Use the rendered offset: an item animation can temporarily cancel the
            // layout movement. Correcting getTop() alone would introduce a new hop.
            int correction = Math.round(movement);
            if (correction != 0) list.scrollBy(0, correction);
            bottom = nextBottom;
            lastFirstTop = location[1] + first.getTop();
            lastSecondTop = second == null ? 0 : location[1] + second.getTop();
            lastFirstTranslation = translation;
            lastSecondTranslation = otherTranslation;
            if (Math.abs(lastFirstTop + translation - firstTop) > 1f) {
                // The native scroll can be clamped at a boundary; do not chase it.
                dispose();
            }
            return true;
        }

        private static boolean followsResize(float current, float previous, float initial,
                int layoutMovement, int growth) {
            if (current == previous) return true;
            float change = current - previous;
            // A move animation may mask part/all of a just-observed resize.
            if (growth != 0 && layoutMovement == growth && change * growth < 0 &&
                    Math.abs(change) <= Math.abs(growth)) return true;
            // Thereafter allow only settling back towards its pre-send translation.
            float oldOffset = previous - initial;
            float newOffset = current - initial;
            return oldOffset * newOffset >= 0 && Math.abs(newOffset) <= Math.abs(oldOffset);
        }

        @Override public void run() { dispose(); }
        @Override public void onViewDetachedFromWindow(View view) { dispose(); }
        @Override public void onViewAttachedToWindow(View view) {}
    }

    public static void addPreference(PreferenceScreen screen, Helper helper) {
        if (screen == null || helper == null || screen.findPreference(KEY) != null) return;
        screen.addPreference(helper.switchPreference(
                IgStr.str("dudeks_keep_dm_scroll_position_title"),
                IgStr.str("dudeks_keep_dm_scroll_position_summary"),
                ENABLED));
    }
}
