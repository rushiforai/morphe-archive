/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewParent;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.SaveButtonColorSetting;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.ResourceType;
import app.hushpinterest.extension.shared.ResourceUtils;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;

/**
 * Hide closeup buttons: the back arrow and the visual search (lens) button that float over a pin's
 * closeup, the like, comment, share and more buttons in the row under its picture, the Remix button,
 * and the Visit site button under a pin that links out. The patch hands each button, or the row
 * holding it, over where Pinterest finds or builds it, and sends every visibility change of those
 * view classes through {@link #visibility}. A handed-over button whose switch is on stays GONE, so it
 * takes no room and TalkBack skips it. Off or paused, Pinterest's own visibility goes through, and
 * the next closeup's button shows as usual. The lens's label has a switch of its own, see
 * {@link #searchLabel}, and the red Save button can be made smaller and painted, see
 * {@link #saveButton}.
 */
public final class CloseupButtons {
    private CloseupButtons() {}

    /** Each button handed over, and the switch that hides it. */
    private static final Map<View, BooleanSetting> MARKED = Collections.synchronizedMap(new WeakHashMap<>());

    /** Pinterest's ids for the row's buttons, the Visit site button and the Save button: -1 until looked up, 0 when the build has none. */
    static int likeId = -1;
    static int commentsId = -1;
    static int shareId = -1;
    static int moreId = -1;
    static int visitSiteId = -1;
    static int saveId = -1;

    /** How big the Save button is with its switch on. */
    static final float SMALLER = 0.8f;
    /** Dark text for a Save button painted a light color, Pinterest's own near-black. */
    static final int DARK_TEXT = 0xFF111111;

    /** Save buttons made smaller, so the switch going off puts them back. */
    private static final Set<View> SHRUNK = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    /** Save buttons painted, with what Pinterest had on them. */
    private static final Map<View, Painted> PAINTED = Collections.synchronizedMap(new WeakHashMap<>());

    /** Keeps a smaller Save button anchored at the end of its row as its size changes. */
    private static final View.OnLayoutChangeListener PIVOT =
            (view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> pivot(view);

    /** The closeup's back arrow, right after Pinterest finds it in the closeup's layout. */
    public static void backArrow(View button) {
        mark(button, Settings.HIDE_CLOSEUP_BACK, "back arrow");
    }

    /** The visual search button, right after Pinterest builds it and gives it its id. */
    public static void lens(View button) {
        mark(button, Settings.HIDE_CLOSEUP_LENS, "visual search");
    }

    /** The Remix button, right after Pinterest builds it with its id. */
    public static void remix(View button) {
        mark(button, Settings.HIDE_CLOSEUP_REMIX, "remix");
    }

    /**
     * The row of buttons under a pin's picture, right after its parent's constructor, before it has
     * built its buttons. Each of like, comment, share and more is the row's child holding Pinterest's
     * id for it, and each has its own switch. The more button gets its id from a later call, so the
     * row is looked at on each layout until all of them were found.
     */
    public static void actionBar(View bar) {
        hand(bar, true);
    }

    /**
     * A row that can hold the Visit site button, right after its parent's constructor. The row is
     * hidden whole, padding included, but only once the button is in it: Pinterest names the button
     * when it fills the row in, so the row is looked at on each layout until it has it.
     */
    public static void visitSite(View bar) {
        hand(bar, false);
    }

    private static void hand(View bar, boolean actions) {
        if (bar == null) return;
        try {
            if (look(bar, actions)) return;
            bar.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(View view, int left, int top, int right, int bottom,
                                           int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    try {
                        if (look(view, actions)) view.removeOnLayoutChangeListener(this);
                    } catch (RuntimeException failure) {
                        view.removeOnLayoutChangeListener(this);
                        HookStatus.threw(FamilyNames.HIDE_CLOSEUP_BUTTONS, actions ? "action buttons" : "visit site", failure);
                    }
                }
            });
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_CLOSEUP_BUTTONS, actions ? "action buttons" : "visit site", failure);
        }
    }

    /** True once there's nothing left to look for in [bar]. */
    private static boolean look(View bar, boolean actions) {
        return actions ? markActionBar(bar) : markVisitSite(bar);
    }

    /** Hands over each of the row's buttons found, true once every one this build has was. */
    private static boolean markActionBar(View bar) {
        if (commentsId < 0) commentsId = id(bar, "action_module_comments_icon");
        if (shareId < 0) shareId = id(bar, "action_module_share_icon_sab");
        if (likeId < 0) likeId = id(bar, "action_module_react_icon_sab");
        if (moreId < 0) moreId = id(bar, "overflow_button");
        if (commentsId == 0 && shareId == 0) return true;
        // Comment and share wear their ids themselves, so either one's parent is the row.
        View comments = find(bar, commentsId);
        View share = find(bar, shareId);
        ViewParent row = comments != null ? comments.getParent() : share != null ? share.getParent() : null;
        if (row == null) return false;
        boolean like = markIn(bar, row, likeId, Settings.HIDE_CLOSEUP_LIKE, "like");
        boolean comment = markIn(bar, row, commentsId, Settings.HIDE_CLOSEUP_COMMENTS, "comments");
        boolean shared = markIn(bar, row, shareId, Settings.HIDE_CLOSEUP_SHARE, "share");
        boolean more = markIn(bar, row, moreId, Settings.HIDE_CLOSEUP_MORE, "more");
        return like && comment && shared && more;
    }

    private static boolean markVisitSite(View bar) {
        if (visitSiteId < 0) visitSiteId = id(bar, "clickthrough_button");
        if (visitSiteId == 0) return true;
        if (find(bar, visitSiteId) == null) return false;
        if (!MARKED.containsKey(bar)) mark(bar, Settings.HIDE_CLOSEUP_VISIT_SITE, "visit site");
        return true;
    }

    /**
     * Hands over the row's child holding the view with [id], once, so a second look doesn't count it
     * again. True when it's handed over or this build has no such id.
     */
    private static boolean markIn(View bar, ViewParent row, int id, BooleanSetting setting, String what) {
        if (id == 0) return true;
        View found = find(bar, id);
        if (found == null) return false;
        View child = found;
        while (child.getParent() != row) {
            if (child == bar || !(child.getParent() instanceof View)) return false;
            child = (View) child.getParent();
        }
        if (!MARKED.containsKey(child)) mark(child, setting, what);
        return true;
    }

    private static View find(View bar, int id) {
        return id == 0 ? null : bar.findViewById(id);
    }

    private static int id(View view, String name) {
        return ResourceUtils.getIdentifier(view.getContext(), ResourceType.ID, name);
    }

    private static void mark(View button, BooleanSetting setting, String what) {
        if (button == null) return;
        try {
            MARKED.put(button, setting);
            if (UiHooks.enabled(FamilyNames.HIDE_CLOSEUP_BUTTONS, setting)) {
                button.setVisibility(View.GONE);
                HookStatus.counted(FamilyNames.HIDE_CLOSEUP_BUTTONS, what + " hidden");
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_CLOSEUP_BUTTONS, what, failure);
        }
    }

    /**
     * Prepended to setVisibility of every button class above. Pinterest shows the back arrow again as
     * the closeup scrolls, and GestaltIconButton serves every icon button in the app, so only a
     * button handed over above is held at GONE, and only while its switch is on.
     */
    public static int visibility(View view, int requested) {
        if (requested == View.GONE || MARKED.isEmpty()) return requested;
        BooleanSetting setting = MARKED.get(view);
        return setting != null && staysHidden(setting) ? View.GONE : requested;
    }

    /**
     * The lens's Search image label, read where the lens decides to wear it and where it plays the
     * animation that shows it, and the lens's glow, read where it's built. Pinterest raises the label
     * flag on the first two eligible pins of a day and drops it after, so with the switch on every
     * pin's lens looks the way the third one does: unlabeled, still there and still searching. The
     * glow has a flag of its own, answered the same way.
     */
    public static boolean searchLabel(boolean shown) {
        if (!shown) return false;
        try {
            if (!UiHooks.enabled(FamilyNames.HIDE_CLOSEUP_BUTTONS, Settings.HIDE_CLOSEUP_SEARCH_LABEL)) return true;
            HookStatus.counted(FamilyNames.HIDE_CLOSEUP_BUTTONS, "search image label left off");
            return false;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_CLOSEUP_BUTTONS, "search image label", failure);
            return true;
        }
    }

    /**
     * Every Gestalt button, right after Pinterest applies a new look to it: its colors, text and
     * icon. Only the closeup's Save button is changed. With its switch on it's drawn at
     * {@link #SMALLER} of its size, anchored at the end of its row, and a color saved for it
     * replaces Pinterest's red while the button is red, so Saved keeps Pinterest's own look. A
     * light color gets {@link #DARK_TEXT}. Each call first takes back what an earlier one did, so
     * the switch going off, the color cleared or a pause shows Pinterest's button again.
     */
    public static void saveButton(View button) {
        if (button == null || saveId == 0) return;
        try {
            if (saveId < 0) saveId = id(button, "save_pinit_bt");
            if (saveId == 0 || button.getId() != saveId) return;
            shrink(button, UiHooks.enabled(FamilyNames.HIDE_CLOSEUP_BUTTONS, Settings.SMALLER_SAVE_BUTTON));
            if (button instanceof TextView) paint((TextView) button, Utils.settingsReady()
                    ? SaveButtonColorSetting.color(SaveButtonColorSetting.SAVE_BUTTON_COLOR.get()) : null);
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.HIDE_CLOSEUP_BUTTONS, "save button", failure);
        }
    }

    private static void shrink(View button, boolean smaller) {
        if (smaller) {
            if (SHRUNK.add(button)) button.addOnLayoutChangeListener(PIVOT);
            pivot(button);
            button.setScaleX(SMALLER);
            button.setScaleY(SMALLER);
            HookStatus.counted(FamilyNames.HIDE_CLOSEUP_BUTTONS, "save button smaller");
        } else if (SHRUNK.remove(button)) {
            button.removeOnLayoutChangeListener(PIVOT);
            button.setScaleX(1f);
            button.setScaleY(1f);
        }
    }

    private static void pivot(View button) {
        if (!SHRUNK.contains(button)) return;
        boolean rtl = button.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        button.setPivotX(rtl ? 0f : button.getWidth());
        button.setPivotY(button.getHeight() / 2f);
    }

    /** What Pinterest had on a Save button this class painted, and what it put there instead. */
    private static final class Painted {
        final ColorStateList red;
        final ColorStateList paint;
        @Nullable final ColorStateList text;
        @Nullable final ColorStateList dark;

        Painted(ColorStateList red, ColorStateList paint, @Nullable ColorStateList text, @Nullable ColorStateList dark) {
            this.red = red;
            this.paint = paint;
            this.text = text;
            this.dark = dark;
        }
    }

    private static void paint(TextView button, @Nullable Integer color) {
        Painted was = PAINTED.remove(button);
        ColorStateList now = button.getBackgroundTintList();
        // Pinterest puts its colors on only when they change, so what's still ours goes back first.
        if (was != null && now == was.paint) {
            tint(button, was.red);
            now = was.red;
        }
        if (was != null && was.dark != null && button.getTextColors() == was.dark) button.setTextColor(was.text);
        if (color == null || !red(now)) return;
        ColorStateList paint = ColorStateList.valueOf(color);
        ColorStateList text = null, dark = null;
        // White text under 3:1 against the color is hard to read, so it goes dark.
        if (1.05 / (Color.luminance(color) + 0.05) < 3) {
            text = button.getTextColors();
            dark = ColorStateList.valueOf(DARK_TEXT);
            button.setTextColor(dark);
        }
        tint(button, paint);
        PAINTED.put(button, new Painted(now, paint, text, dark));
        HookStatus.counted(FamilyNames.HIDE_CLOSEUP_BUTTONS, "save button painted");
    }

    /** Pinterest's red, in light or dark mode, and not the gray or black of Saved. */
    private static boolean red(@Nullable ColorStateList colors) {
        if (colors == null) return false;
        float[] hsv = new float[3];
        Color.colorToHSV(colors.getDefaultColor(), hsv);
        return (hsv[0] >= 340f || hsv[0] <= 10f) && hsv[1] >= 0.75f && hsv[2] >= 0.6f;
    }

    /** The way Pinterest colors a Gestalt button: the background's tint and its shape's under a ripple. */
    private static void tint(View button, ColorStateList colors) {
        button.setBackgroundTintList(colors);
        Drawable background = button.getBackground();
        if (background instanceof RippleDrawable && ((RippleDrawable) background).getNumberOfLayers() > 0) {
            Drawable shape = ((RippleDrawable) background).getDrawable(0);
            if (shape != null) shape.mutate().setTintList(colors);
        } else if (background != null) {
            background.mutate().setTintList(colors);
        }
        button.refreshDrawableState();
        button.invalidate();
    }

    /** The switch read again for a visibility change, which isn't counted as another call. */
    private static boolean staysHidden(BooleanSetting setting) {
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CLOSEUP_BUTTONS, "switch read", failure);
            return false;
        }
    }
}
