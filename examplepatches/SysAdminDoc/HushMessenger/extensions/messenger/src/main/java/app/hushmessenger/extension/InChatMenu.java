package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * The menu a long press on a message opens, where Messenger draws it inside the chat (#162, #176). On 587 that's
 * ReactionsBarFragment: its view goes on top of the chat in the chat's own frame, with the emoji row over the pressed
 * message and the actions in a bar across the bottom, and nothing behind it dims or blurs. With Blur behind menus on,
 * everything else in that frame blurs under a light shade, and a sharp copy of the pressed message is drawn on the shade
 * so it stands out the way it does on an iPhone. With Floating message menu on too, the actions go into the card under
 * the message. All of it goes when the menu's view leaves the chat. A menu that isn't laid out the way this expects is
 * left as Messenger drew it.
 */
final class InChatMenu implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
    /** How long Litho gets to fill the menu in before it's left as Messenger drew it. */
    static final long WAIT_MS = 1500;
    /** How many frames in a row the emoji row's place has to stay put before it counts as laid out. */
    static final int STILL_FRAMES = 2;
    /** The shade over the blurred chat: black at Blur behind menus' own light dim. */
    static final int SHADE = Color.argb(Math.round(MenuBlur.DIM * 255), 0, 0, 0);

    private final View menu;
    private final FrameLayout chat;
    private final boolean blur;
    private final boolean card;
    private final long deadline;
    /** What this blurred, so exactly that is cleared again. */
    private final List<View> blurred = new ArrayList<>();
    private ViewTreeObserver observer;
    private Lift lift;
    private View floating;
    private boolean waiting = true;
    /** The emoji row and its resting place as the last frame had them, and for how many frames it's been there. */
    private View row;
    private final Rect seen = new Rect();
    private int still;
    /** The emoji row moved up to make room for the card, and where it was moved to. */
    private View raised;
    private float raisedTo;
    /** The menus dressed right now. */
    static final Set<View> up = Collections.newSetFromMap(new WeakHashMap<>());

    private InChatMenu(View menu, FrameLayout chat, boolean blur, boolean card) {
        this.menu = menu;
        this.chat = chat;
        this.blur = blur;
        this.card = card;
        this.deadline = SystemClock.uptimeMillis() + WAIT_MS;
    }

    /** Whether a dressed menu is open in [view]'s window, so what HushMessenger keeps over the chat can make way for it. */
    static boolean isUp(View view) {
        View root = view.getRootView();
        for (View open : up) {
            if (open.isAttachedToWindow() && open.getRootView() == root) return true;
        }
        return false;
    }

    /**
     * Starts watching a menu Messenger just put into the chat. Litho fills it in over the next frames, so the work waits
     * for the frame the emoji row has a settled place on. A menu with no chat around it is shown as a dialog, which
     * MenuBlur.shown(Dialog) takes. Never throws.
     */
    static void shown(View menu) {
        try {
            if (menu == null || !(menu.getParent() instanceof FrameLayout)) return;
            boolean blur = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && Settings.enabled(MenuBlur.KEY);
            boolean card = FloatingMenu.wanted();
            if (!blur && !card) return;
            InChatMenu watch = new InChatMenu(menu, (FrameLayout) menu.getParent(), blur, card);
            watch.observer = menu.getViewTreeObserver();
            watch.observer.addOnPreDrawListener(watch);
            menu.addOnAttachStateChangeListener(watch);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(MenuBlur.KEY, "Couldn't blur behind a message's menu", error);
        }
    }

    /**
     * While waiting, dresses the menu on the frame its emoji row's place has settled on, asking for another frame until
     * then.
     * After that, keeps a row that was moved up where it was moved to.
     */
    @Override public boolean onPreDraw() {
        try {
            if (!waiting) {
                keepRaised();
                return true;
            }
            if (!menu.isAttachedToWindow() || SystemClock.uptimeMillis() > deadline) {
                stop();
                return true;
            }
            if (!settled()) {
                menu.postInvalidateOnAnimation();
                return true;
            }
            waiting = false;
            dress();
            if (raised == null) stop();
            // What went in gets laid out before the first frame that shows it.
            return false;
        } catch (Throwable error) {
            stop();
            undo();
            Settings.hookFailedPrivately(MenuBlur.KEY, "Couldn't blur behind a message's menu", error);
            return true;
        }
    }

    /**
     * Whether the menu is laid out and its emoji row's resting place has stayed put for STILL_FRAMES frames. The slide
     * doesn't count: the row waits under that place for a few frames first, which looks just like having stopped.
     */
    private boolean settled() {
        if (menu.getParent() != chat || menu.getWidth() <= 0 || chat.getWidth() <= 0) return false;
        ViewGroup actions = FloatingMenu.actionBar(menu);
        if (actions == null) return false;
        View panel = FloatingMenu.emojiRow(menu, actions, FloatingMenu.bounds.apply(chat));
        if (panel == null) return false;
        Rect now = FloatingMenu.resting(panel);
        still = panel == row && now.equals(seen) ? still + 1 : 0;
        row = panel;
        seen.set(now);
        return still >= STILL_FRAMES;
    }

    /** Blurs the chat and floats the card. */
    private void dress() {
        up.add(menu);
        float density = chat.getResources().getDisplayMetrics().density;
        if (blur) {
            View message = FloatingMenu.pressed(chat, menu, seen, density);
            float radius = Math.round(MenuBlur.RADIUS_DP * density);
            for (int i = 0; i < chat.getChildCount(); i++) {
                View child = chat.getChildAt(i);
                if (child == menu) continue;
                MenuBlur.screenEffect.accept(child, radius);
                blurred.add(child);
            }
            lift = new Lift(chat.getContext(), message);
            chat.addView(lift, chat.indexOfChild(menu),
                new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        if (!card) return;
        // With a lift the message can move up with the emoji row to make room for the card under it.
        floating = FloatingMenu.dress(menu, chat, lift == null ? null : lift::raise);
        if (lift == null || lift.rise <= 0) return;
        // Messenger's own animation of the row can put it back; it goes straight back up before that frame shows.
        raised = row;
        raisedTo = row.getTranslationY();
    }

    private void keepRaised() {
        View panel = raised;
        if (panel == null || panel.getTranslationY() == raisedTo) return;
        panel.setTranslationY(raisedTo);
    }

    private void stop() {
        waiting = false;
        ViewTreeObserver tree = observer != null && observer.isAlive() ? observer : menu.getViewTreeObserver();
        if (tree.isAlive()) tree.removeOnPreDrawListener(this);
    }

    @Override public void onViewAttachedToWindow(View view) {}

    @Override public void onViewDetachedFromWindow(View view) {
        view.removeOnAttachStateChangeListener(this);
        try {
            stop();
            undo();
        } catch (Throwable error) {
            Settings.hookFailedPrivately(MenuBlur.KEY, "Couldn't clear the blur behind a message's menu", error);
        }
    }

    /**
     * Clears the blur, puts the emoji row back and takes the shade and card out. The chat is still removing the menu
     * when this runs, so the two views only hide here and leave the chat on the next turn of the loop.
     */
    private void undo() {
        up.remove(menu);
        if (raised != null) raised.setTranslationY(0f);
        raised = null;
        for (View view : blurred) MenuBlur.screenEffect.accept(view, 0f);
        blurred.clear();
        View shade = lift, moved = floating;
        lift = null;
        floating = null;
        if (shade == null && moved == null) return;
        if (shade != null) shade.setVisibility(View.GONE);
        if (moved != null) moved.setVisibility(View.GONE);
        chat.post(() -> {
            if (shade != null && shade.getParent() == chat) chat.removeView(shade);
            if (moved != null && moved.getParent() == chat) chat.removeView(moved);
        });
    }

    /**
     * The shade between the blurred chat and the menu, with the pressed message drawn sharp on it where it is, or as far
     * higher as the card under it needed.
     */
    static final class Lift extends View {
        final View message;
        /** How far above the real message its copy is drawn, in pixels. */
        int rise;
        private final int[] at = new int[2];
        private final int[] origin = new int[2];
        private final Rect showing = new Rect();

        Lift(Context context, View message) {
            super(context);
            this.message = message;
            setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        void raise(int by) {
            rise = by;
            invalidate();
        }

        @Override protected void onDraw(Canvas canvas) {
            canvas.drawColor(SHADE);
            if (message == null || !message.isAttachedToWindow() || message.getVisibility() != View.VISIBLE) return;
            // A message running off the list stops where the list does, as it does in the chat.
            if (!message.getLocalVisibleRect(showing)) return;
            message.getLocationInWindow(at);
            getLocationInWindow(origin);
            int saved = canvas.save();
            canvas.translate(at[0] - origin[0], at[1] - origin[1] - rise);
            canvas.clipRect(showing);
            // draw() skips the view's own layer, and a Like tints itself with a blend that needs one to stay on the glyph.
            if (message.getLayerType() != View.LAYER_TYPE_NONE) {
                canvas.saveLayer(showing.left, showing.top, showing.right, showing.bottom, null);
            }
            message.draw(canvas);
            canvas.restoreToCount(saved);
        }
    }
}
