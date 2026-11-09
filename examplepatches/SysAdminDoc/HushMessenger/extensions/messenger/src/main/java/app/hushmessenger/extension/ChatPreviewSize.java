package app.hushmessenger.extension;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Bigger chat preview (#151, #153). The preview a long press on a chat opens stacks the chat over its menu, capped at
 * 88% of the screen. Messenger gives the chat 45% of the screen (at most 380dp) on tall screens and 30% on short ones,
 * and lets it shrink to 160dp to make room for a long menu. With the switch on, the chat gets SHARE of the cap and
 * never shrinks, so the menu gets the rest and scrolls inside it (the menu's holder is already a ScrollView).
 *
 * A layer over the chat takes every tap to open the chat, so the chat can't be scrolled in the preview. tapLayer gives
 * that layer a touch listener: a tap still opens the chat, and a drag goes to the chat under it instead.
 * Public, since the calls come from Messenger's own preview fragment in another package.
 */
public final class ChatPreviewSize {
    static final String KEY = "chat_preview_size";
    /** The chat's share of the preview's cap. */
    static final float SHARE = 0.65f;

    private ChatPreviewSize() {}

    /** The chat's height in the preview: Messenger's own, or SHARE of the preview's cap when that's taller. */
    public static int height(int stock, int most) {
        try {
            if (most <= 0 || !Settings.enabled(KEY)) return stock;
            return Math.max(stock, Math.round(most * SHARE));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't size the chat preview", error);
            return stock;
        }
    }

    /** The least the chat shrinks to for a long menu: Messenger's own, or none at all with the switch on. */
    public static int least(int stock, int height) {
        try {
            return Settings.wouldUse(KEY) ? height : stock;
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't size the chat preview", error);
            return stock;
        }
    }

    /** Lets a drag on the preview's tap layer scroll the chat under it. Taps still reach the layer. */
    public static void tapLayer(View layer) {
        try {
            if (layer == null || !Settings.enabled(KEY)) return;
            layer.setOnTouchListener(new Drag(ViewConfiguration.get(layer.getContext()).getScaledTouchSlop()));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't let the chat preview scroll", error);
        }
    }

    /**
     * Holds on to a press until it moves past the touch slop. Then it ends the layer's own press, so letting go opens
     * nothing, and hands the press and the rest of the gesture to the chat under the layer.
     */
    static final class Drag implements View.OnTouchListener {
        private final int slop;
        private MotionEvent down;
        private View target;
        private boolean dragging;

        Drag(int slop) {
            this.slop = slop;
        }

        @Override public boolean onTouch(View layer, MotionEvent event) {
            try {
                return handle(layer, event);
            } catch (Throwable error) {
                reset();
                Settings.hookFailedPrivately(KEY, "Couldn't scroll the chat preview", error);
                return false;
            }
        }

        private boolean handle(View layer, MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    reset();
                    down = MotionEvent.obtain(event);
                    return false;
                case MotionEvent.ACTION_MOVE:
                    if (!dragging && !start(layer, event)) return false;
                    forward(layer, event);
                    return true;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    boolean was = dragging;
                    if (was) forward(layer, event);
                    reset();
                    return was;
                default:
                    if (!dragging) return false;
                    forward(layer, event);
                    return true;
            }
        }

        /** Starts the drag once the press has moved far enough and a chat sits under where it began. */
        private boolean start(View layer, MotionEvent event) {
            if (down == null || Math.hypot(event.getX() - down.getX(), event.getY() - down.getY()) <= slop) return false;
            View chat = chatUnder(layer, down);
            if (chat == null) return false;
            target = chat;
            dragging = true;
            MotionEvent cancel = MotionEvent.obtain(event);
            cancel.setAction(MotionEvent.ACTION_CANCEL);
            try {
                layer.onTouchEvent(cancel);
            } finally {
                cancel.recycle();
            }
            ViewParent parent = layer.getParent();
            if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
            forward(layer, down);
            return true;
        }

        /** The nearest shown view under the layer in its parent that the press began on, or null. */
        static View chatUnder(View layer, MotionEvent press) {
            if (!(layer.getParent() instanceof ViewGroup)) return null;
            ViewGroup parent = (ViewGroup) layer.getParent();
            for (int i = parent.indexOfChild(layer) - 1; i >= 0; i--) {
                View below = parent.getChildAt(i);
                if (below == null || below.getVisibility() != View.VISIBLE) continue;
                float x = press.getX() + layer.getX() - below.getX();
                float y = press.getY() + layer.getY() - below.getY();
                return x >= 0 && y >= 0 && x < below.getWidth() && y < below.getHeight() ? below : null;
            }
            return null;
        }

        private void forward(View layer, MotionEvent event) {
            MotionEvent copy = MotionEvent.obtain(event);
            copy.offsetLocation(layer.getX() - target.getX(), layer.getY() - target.getY());
            try {
                target.dispatchTouchEvent(copy);
            } finally {
                copy.recycle();
            }
        }

        private void reset() {
            if (down != null) down.recycle();
            down = null;
            target = null;
            dragging = false;
        }
    }
}
