/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.czyeru.extension.tiktok.comment;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.shared.diagnostics.HookStatus;
import app.czyeru.extension.tiktok.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Hides the photo, @ and gift buttons in the comment box.
 *
 * <p>Each comment input stores its icon buttons as it sets up its views, and the patch hands each
 * of the three here at that moment. TikTok writes their visibility again from a dozen places (the
 * text typed, the account, the keyboard opening), so a hidden button is held at gone on every
 * layout pass instead of once. The emoji button and sending stay as they are. The comment "+"
 * panel builds its tiles from a config of the same buttons, which {@link #plusTile} filters.
 */
public final class CommentBoxButtons {
    static final String FAMILY = "comment box buttons";
    private static final WeakHashMap<View, Keeper> KEEPERS = new WeakHashMap<>();

    private CommentBoxButtons() {
    }

    /**
     * The photo icon sits in its own tappable slot beside a badge that's usually gone, and over the
     * keyboard the slot's padding and tap area stayed once the icon went (Login2, 2026-10-20), so
     * that slot goes with it.
     */
    public static void photo(View button) { hide(button, "photo", true); }

    public static void mention(View button) { hide(button, "mention", false); }

    public static void gift(View button) { hide(button, "gift", false); }

    /**
     * A button TikTok's comment "+" panel config names, on its way into the panel's tiles or the row's
     * check for "+". The photo, @ and gift buttons come back as null, which TikTok treats as an id it
     * doesn't know and skips, so their tiles never show and "+" goes once nothing's left for it.
     */
    public static Object plusTile(Object button) {
        HookStatus.bound(FAMILY, "plus panel");
        if (!(button instanceof Enum) || !Settings.HIDE_COMMENT_BOX_BUTTONS.get()) return button;
        switch (((Enum<?>) button).name()) {
            case "PHOTO":
            case "MENTION":
            case "GIFT":
                return null;
            default:
                return button;
        }
    }

    private static void hide(View button, String which, boolean withSlot) {
        if (button == null) return;
        HookStatus.bound(FAMILY, which);
        if (!Settings.HIDE_COMMENT_BOX_BUTTONS.get()) return;
        try {
            Keeper keeper = KEEPERS.get(button);
            if (keeper != null) {
                keeper.hold(button);
                return;
            }
            keeper = new Keeper(button, withSlot);
            keeper.hold(button);
            KEEPERS.put(button, keeper);
            button.addOnAttachStateChangeListener(keeper);
            if (button.isAttachedToWindow()) keeper.onViewAttachedToWindow(button);
        } catch (RuntimeException error) {
            Logger.printException(() -> "Could not hide the comment box " + which + " button", error);
        }
    }

    /**
     * Whether {@code parent} is a slot holding only {@code child}: tappable, with everything else in it gone.
     * The row the buttons sit in isn't tappable, and the text box has its text showing.
     */
    static boolean isSlotOf(ViewParent parent, View child) {
        if (!(parent instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) parent;
        if (!group.isClickable()) return false;
        for (int i = 0; i < group.getChildCount(); i++) {
            View other = group.getChildAt(i);
            if (other != child && other.getVisibility() != View.GONE) return false;
        }
        return true;
    }

    /**
     * Puts the button, and its slot when it has one, back to gone whenever a layout pass finds it showing.
     * TikTok keeps the comment box and sets these buttons only when its own state changes, so with the
     * switch turned off the first layout pass shows what was hidden here, as TikTok last showed it
     * (Login2, 2026-10-20: photo and @ stayed gone on every video until a restart). A button TikTok
     * left gone itself was never held, so it stays gone.
     */
    private static final class Keeper implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnGlobalLayoutListener {
        private final WeakReference<View> button;
        private final boolean withSlot;
        private ViewTreeObserver observer;
        /** What TikTok last showed the button and its slot as before they were hidden here. */
        private int shown = View.VISIBLE;
        private int slotShown = View.VISIBLE;
        private boolean held;
        /** The slot hidden here, so the one given back is that slot even if the button moved since. */
        private WeakReference<View> slot;

        Keeper(View button, boolean withSlot) {
            this.button = new WeakReference<>(button);
            this.withSlot = withSlot;
        }

        @Override public void onViewAttachedToWindow(View view) {
            if (observer != null) return;
            observer = view.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(this);
            onGlobalLayout();
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnGlobalLayoutListener(this);
            observer = null;
        }

        void hold(View view) {
            int now = view.getVisibility();
            if (now == View.GONE) return;
            shown = now;
            held = true;
            view.setVisibility(View.GONE);
        }

        @Override public void onGlobalLayout() {
            View view = button.get();
            if (view == null) return;
            if (!Settings.HIDE_COMMENT_BOX_BUTTONS.get()) {
                release(view);
                return;
            }
            hold(view);
            ViewParent parent = view.getParent();
            if (withSlot && isSlotOf(parent, view) && ((View) parent).getVisibility() != View.GONE) {
                slotShown = ((View) parent).getVisibility();
                slot = new WeakReference<>((View) parent);
                ((View) parent).setVisibility(View.GONE);
            }
        }

        private void release(View view) {
            if (held) {
                held = false;
                if (view.getVisibility() == View.GONE) view.setVisibility(shown);
            }
            View hidden = slot == null ? null : slot.get();
            slot = null;
            if (hidden != null && hidden.getVisibility() == View.GONE) hidden.setVisibility(slotShown);
        }
    }
}
