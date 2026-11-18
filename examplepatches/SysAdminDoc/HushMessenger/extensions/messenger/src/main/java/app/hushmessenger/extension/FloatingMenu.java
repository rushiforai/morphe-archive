package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * The long-press menu as a floating card under the message (#176). Messenger puts the emoji row over the message you
 * pressed and drops Reply, Copy and the rest into a bar across the bottom of the screen, which is a reach on a tall
 * phone. With the switch on, those same actions go up as a rounded card right under the message, like an iPhone, and the
 * bar at the bottom goes away. Every row is Messenger's own action: a tap passes the press straight back to the button
 * it came from, so Reply, Edit, Unsend, Forward, Copy and More keep doing exactly what they did, and the emoji row and
 * swipe to reply are left alone. The chat behind blurs through Blur behind menus, which this sits under.
 * Nothing here is certain about Messenger's layout, so anything unexpected leaves the bottom bar as it was.
 */
final class FloatingMenu {
    /** The switch, under Blur behind menus in the settings Look tab. */
    static final String KEY = "floating_menu";

    /** The card: how round, how wide, how tall a row is, and the gap it keeps from the message and the screen edges. */
    static final int CORNER_DP = 16;
    static final int WIDTH_DP = 232;
    static final int ROW_HEIGHT_DP = 50;
    static final int ROW_PADDING_DP = 18;
    static final int CARD_PADDING_DP = 6;
    static final int GAP_DP = 10;
    static final int EDGE_DP = 12;
    static final int ELEVATION_DP = 12;
    static final int ICON_DP = 20;
    static final float LABEL_SP = 16f;

    /** How many views of the menu to look through, and how many of the chat behind it. */
    static final int MENU_SEARCH_LIMIT = 96;
    static final int CHAT_SEARCH_LIMIT = 600;
    /** How far from the emoji row's edge the pressed message's own edge can be, in dp. */
    static final int ANCHOR_DP = 24;
    /** How many emoji rows tall a message has to be for Messenger to lay the row over it instead of above it. */
    static final int TALL_ROWS = 2;
    /** Too few actions and this isn't the menu; too many and Messenger's layout isn't what's expected. */
    static final int MIN_ACTIONS = 2, MAX_ACTIONS = 8;

    /** Menus already carrying a card, so a menu shown again after a trip to the background doesn't get a second. */
    private static final Set<View> dressed = Collections.newSetFromMap(new WeakHashMap<>());

    /** Where a view sits on screen. Tests swap it, since nothing is on a screen in a test. */
    static java.util.function.Function<View, Rect> bounds = FloatingMenu::on;

    private FloatingMenu() {}

    /** Whether the long-press actions move into a card: the switch is on and the blur patch that calls this is in. */
    static boolean wanted() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && Settings.running() && prefs.getBoolean(KEY, false)
            && Settings.installed.contains(MenuBlur.KEY);
    }

    /** Moves a long-press menu's bottom bar into a card under the message. Never throws. */
    static void shown(android.app.Dialog dialog) {
        try {
            if (dialog == null || !dialog.isShowing() || !wanted()) return;
            android.view.Window window = dialog.getWindow();
            View overlay = window == null ? null : MenuBlur.messageMenu(window.peekDecorView());
            if (overlay == null || !dressed.add(overlay)) return;
            dress(overlay, host(dialog));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Couldn't float a long-press menu", error);
        }
    }

    /** The chat the menu opened over, which is where the pressed message still is. Null when there's no telling. */
    static View host(android.app.Dialog dialog) {
        android.app.Activity activity = MenuBlur.activity(dialog.getContext());
        if (activity == null || activity.isFinishing()) return null;
        android.view.Window window = activity.getWindow();
        return window == null ? null : window.peekDecorView();
    }

    /**
     * Builds the card from the menu's own bottom bar and puts it under the pressed message. Leaves the bar alone when
     * the menu isn't laid out the way this expects. The card, or null when there's none.
     */
    static View dress(View overlay, View host) {
        return dress(overlay, host, null);
    }

    /**
     * The same, for a menu whose pressed message is drawn again on top of the chat (see InChatMenu). When the card has no
     * room under that message, the emoji row moves up with it, the way an iPhone lifts the last message in a chat, and
     * lift is told how far so the message is drawn that much higher too. Null keeps both where Messenger put them.
     */
    static View dress(View overlay, View host, java.util.function.IntConsumer lift) {
        ViewGroup actions = actionBar(overlay);
        if (actions == null) return null;
        FrameLayout frameHolder = frame(overlay);
        if (frameHolder == null || frameHolder.getWidth() <= 0 || frameHolder.getHeight() <= 0) return null;
        Rect frame = bounds.apply(frameHolder);
        View panel = emojiRow(overlay, actions, frame);
        if (panel == null) return null;
        List<View> sources = buttons(actions);
        if (sources.size() < MIN_ACTIONS || sources.size() > MAX_ACTIONS) return null;
        List<String> labels = new ArrayList<>();
        for (View source : sources) {
            String label = label(source);
            if (label == null) return null;
            labels.add(label);
        }
        Context context = overlay.getContext();
        float density = density(context);
        LinearLayout card = card(context, sources, labels, density);
        int width = (int) (WIDTH_DP * density);
        int height = height(sources.size(), density);
        Rect anchor = resting(panel);
        View message = pressed(host, overlay, anchor, density);
        Rect bubble = message == null ? null : bounds.apply(message);
        int gap = (int) (GAP_DP * density), edge = (int) (EDGE_DP * density);
        int rise = lift == null ? 0 : rise(anchor, bubble, frame, height, gap, edge);
        if (rise > 0) {
            anchor.offset(0, -rise);
            if (bubble != null) bubble.offset(0, -rise);
            panel.setTranslationY(-rise);
            lift.accept(rise);
        }
        Rect placed = place(anchor, bubble, frame, width, height, gap, edge);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height);
        params.gravity = Gravity.TOP | Gravity.START;
        params.leftMargin = placed.left - frame.left;
        params.topMargin = placed.top - frame.top;
        actions.setVisibility(View.GONE);
        frameHolder.addView(card, params);
        return card;
    }

    /**
     * Where the card goes, in the coordinates the rects come in. Under the pressed message when the chat behind says
     * where it is, a line under the emoji row when it doesn't, lined up with the side the message is on and always
     * fully on screen. With no room under the message it goes over the emoji row instead, so it never covers the row.
     */
    static Rect place(Rect panel, Rect bubble, Rect frame, int width, int height, int gap, int edge) {
        Rect anchor = under(panel, bubble);
        int top = anchor.bottom + gap;
        int left = anchor.centerX() > frame.centerX() ? anchor.right - width : anchor.left;
        left = Math.max(frame.left + edge, Math.min(left, frame.right - edge - width));
        int over = Math.min(panel.top, anchor.top) - gap - height;
        if (top + height > frame.bottom - edge && over >= frame.top + edge) top = over;
        top = Math.max(frame.top + edge, Math.min(top, frame.bottom - edge - height));
        return new Rect(left, top, left + width, top + height);
    }

    /**
     * What the card goes under: the pressed message, or just the emoji row when there's no message to go by. A message
     * too tall for the row to sit over it has the row laid across it instead, so there the card goes under the row, on
     * the message's side, rather than somewhere off the bottom of the screen.
     */
    private static Rect under(Rect panel, Rect bubble) {
        if (bubble == null || bubble.isEmpty()) return panel;
        if (bubble.top >= panel.centerY()) return bubble;
        return new Rect(bubble.left, panel.top, bubble.right, panel.bottom);
    }

    /**
     * How far the emoji row and the pressed message have to move up for the card to fit under the message, never so
     * far that the row leaves the top of the screen. 0 when it already fits.
     */
    static int rise(Rect panel, Rect bubble, Rect frame, int height, int gap, int edge) {
        Rect anchor = under(panel, bubble);
        int missing = anchor.bottom + gap + height - (frame.bottom - edge);
        if (missing <= 0) return 0;
        int room = Math.min(panel.top, anchor.top) - (frame.top + edge);
        return Math.max(0, Math.min(missing, room));
    }

    /** How tall the card is for that many rows, counting the hairlines between them and its own padding. */
    static int height(int rows, float density) {
        int line = Math.max(1, (int) density);
        return rows * (int) (ROW_HEIGHT_DP * density) + (rows - 1) * line + 2 * (int) (CARD_PADDING_DP * density);
    }

    /** The card itself: one row per action, each handing its tap back to Messenger's own button. */
    static LinearLayout card(Context context, List<View> sources, List<String> labels, float density) {
        boolean light = MaterialYouTheme.chatIsLight();
        boolean blurred = ChatDialogs.blur.enabled(context);
        int surface = blurred ? ChatDialogs.glass(ChatDialogs.surface(light)) : ChatDialogs.surface(light);
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(CORNER_DP * density);
        background.setColor(surface);
        card.setBackground(background);
        card.setClipToOutline(true);
        card.setElevation(ELEVATION_DP * density);
        GradientDrawable line = new GradientDrawable();
        line.setColor(ChatDialogs.outline(light));
        line.setSize(0, Math.max(1, (int) density));
        card.setDividerDrawable(line);
        card.setShowDividers(LinearLayout.SHOW_DIVIDER_MIDDLE);
        int padding = (int) (CARD_PADDING_DP * density);
        card.setPadding(0, padding, 0, padding);
        for (int i = 0; i < sources.size(); i++) card.addView(row(context, sources.get(i), labels.get(i), light, density));
        return card;
    }

    private static TextView row(Context context, View source, String label, boolean light, float density) {
        TextView row = new TextView(context);
        row.setText(label);
        row.setTag(label);
        row.setTextSize(LABEL_SP);
        row.setTextColor(onSurface(light));
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setSingleLine(true);
        row.setEllipsize(TextUtils.TruncateAt.END);
        int side = (int) (ROW_PADDING_DP * density);
        row.setPadding(side, 0, side, 0);
        row.setClickable(true);
        row.setFocusable(true);
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(ChatDialogs.outline(light)), null, null));
        row.setOnClickListener(view -> source.performClick());
        Drawable icon = icon(source, (int) (ICON_DP * density));
        if (icon != null) {
            row.setCompoundDrawablesRelative(icon, null, null, null);
            row.setCompoundDrawablePadding(side / 2);
        }
        row.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
            (int) (ROW_HEIGHT_DP * density)));
        return row;
    }

    /**
     * The bar of actions across the bottom of the menu: as wide as the menu, sitting on its bottom edge, and made of
     * buttons that take a tap. The emoji row never matches, since it floats near the message and takes its own taps.
     */
    static ViewGroup actionBar(View overlay) {
        if (!(overlay instanceof ViewGroup)) return null;
        Rect menu = bounds.apply(overlay);
        for (View view : tree(overlay, MENU_SEARCH_LIMIT)) {
            if (!(view instanceof ViewGroup) || view == overlay) continue;
            Rect box = bounds.apply(view);
            if (box.width() < menu.width() * 0.6 || box.height() <= 0) continue;
            if (menu.bottom - box.bottom > box.height()) continue;
            if (buttons((ViewGroup) view).size() >= MIN_ACTIONS) return (ViewGroup) view;
        }
        return null;
    }

    /** The menu's own buttons in a bar: every visible child that takes a tap. */
    static List<View> buttons(ViewGroup bar) {
        List<View> found = new ArrayList<>();
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE || child.getWidth() <= 0) continue;
            if (!child.isClickable()) return Collections.emptyList();
            found.add(child);
        }
        return found;
    }

    /**
     * The emoji row Messenger floats over the pressed message, which is how the card knows where that message is: the
     * lowest thing in the menu that is short, visible and no part of the action bar.
     */
    static View emojiRow(View overlay, ViewGroup actions, Rect frame) {
        View lowest = null;
        Rect best = null;
        for (View view : tree(overlay, MENU_SEARCH_LIMIT)) {
            if (view == overlay || view == actions || within(view, actions)) continue;
            if (view.getVisibility() != View.VISIBLE) continue;
            Rect box = bounds.apply(view);
            if (box.width() <= 0 || box.height() <= 0 || box.height() > frame.height() / 3) continue;
            if (box.top >= bounds.apply(actions).top) continue;
            if (best == null || box.bottom > best.bottom) {
                lowest = view;
                best = box;
            }
        }
        return lowest;
    }

    /**
     * The pressed message in the chat behind, found by the emoji row Messenger put against its edge: of everything in
     * the chat that takes a press, the one whose top sits closest to that row's bottom. 587's bubbles take their long
     * press through Litho and only say they take a tap, so a tap counts. Null when nothing is close enough, and then the
     * card goes a line under the emoji row instead.
     */
    static Rect bubble(View host, Rect panel, float density) {
        View message = pressed(host, null, panel, density);
        return message == null ? null : bounds.apply(message);
    }

    /**
     * The pressed message's own view, as bubble() finds it, leaving out the menu itself when it sits in the chat. That's
     * the one starting right under the emoji row, or for a message too tall for that, like a video, the biggest one the
     * row is laid across. A whole line of the chat doesn't count there, only what sits inside one.
     */
    static View pressed(View host, View menu, Rect panel, float density) {
        if (host == null) return null;
        int reach = (int) (ANCHOR_DP * density);
        int line = bounds.apply(host).width();
        View closest = null, across = null;
        Rect closestBox = null;
        int best = Integer.MAX_VALUE, biggest = 0;
        for (View view : tree(host, menu, CHAT_SEARCH_LIMIT)) {
            if (!(view.isLongClickable() || view.isClickable()) || view.getVisibility() != View.VISIBLE) continue;
            Rect box = bounds.apply(view);
            if (box.width() <= 0 || box.height() <= 0) continue;
            int off = Math.abs(box.top - panel.bottom);
            if (off > reach) {
                int area = box.width() * box.height();
                if (box.top < panel.bottom && box.bottom > panel.bottom && box.width() < line
                    && box.height() >= panel.height() * TALL_ROWS && area > biggest) {
                    biggest = area;
                    across = view;
                }
                continue;
            }
            if (off < best || (off == best && closestBox != null && box.height() < closestBox.height())) {
                best = off;
                closest = view;
                closestBox = box;
            }
        }
        // What starts under the row but stays within a tall message's height, like the Forward button beside a video,
        // goes with that message.
        if (closest != null && across != null) {
            Rect tall = bounds.apply(across);
            if (closestBox.top >= tall.top && closestBox.bottom <= tall.bottom) return across;
        }
        return closest != null ? closest : across;
    }

    /** The words on one of Messenger's buttons, from the button itself or the one piece of text it holds. */
    static String label(View button) {
        CharSequence described = button.getContentDescription();
        if (described != null && described.toString().trim().length() > 0) return described.toString().trim();
        if (button instanceof TextView) {
            CharSequence text = ((TextView) button).getText();
            if (text != null && text.toString().trim().length() > 0) return text.toString().trim();
        }
        for (View view : tree(button, 16)) {
            if (!(view instanceof TextView)) continue;
            CharSequence text = ((TextView) view).getText();
            if (text != null && text.toString().trim().length() > 0) return text.toString().trim();
        }
        return null;
    }

    /** A copy of the button's own icon at the card's size, or null when it hasn't got one to copy. */
    static Drawable icon(View button, int size) {
        for (View view : tree(button, 16)) {
            if (!(view instanceof ImageView)) continue;
            Drawable drawable = ((ImageView) view).getDrawable();
            if (drawable == null || drawable.getConstantState() == null) continue;
            Drawable copy = drawable.getConstantState().newDrawable(button.getResources()).mutate();
            copy.setBounds(0, 0, size, size);
            return copy;
        }
        return null;
    }

    /** The menu's own frame, which is what the card is positioned in. */
    static FrameLayout frame(View overlay) {
        ViewGroup parent = overlay.getParent() instanceof ViewGroup ? (ViewGroup) overlay.getParent() : null;
        for (int depth = 0; parent != null && depth < 8; depth++) {
            if (parent instanceof FrameLayout && parent.getWidth() >= overlay.getWidth()) return (FrameLayout) parent;
            parent = parent.getParent() instanceof ViewGroup ? (ViewGroup) parent.getParent() : null;
        }
        return null;
    }

    /** Everything under a view, nearest first, up to a limit so a deep screen can't hold the press up. */
    private static List<View> tree(View root, int limit) {
        return tree(root, null, limit);
    }

    /** The same, leaving out one view and everything under it. */
    private static List<View> tree(View root, View skip, int limit) {
        List<View> found = new ArrayList<>();
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(root);
        while (!queue.isEmpty() && found.size() < limit) {
            View view = queue.poll();
            if (view == skip) continue;
            found.add(view);
            if (!(view instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
        }
        return found;
    }

    private static boolean within(View view, View parent) {
        for (int depth = 0; view != null && depth < 16; depth++) {
            if (view == parent) return true;
            view = view.getParent() instanceof View ? (View) view.getParent() : null;
        }
        return false;
    }

    /**
     * Where a view sits once Messenger's slide on it is over: its place on screen without its own translation. The emoji
     * row waits under its place, invisible, for a few frames before sliding up, so where it is right now says nothing.
     */
    static Rect resting(View view) {
        Rect box = new Rect(bounds.apply(view));
        box.offset(-Math.round(view.getTranslationX()), -Math.round(view.getTranslationY()));
        return box;
    }

    /** Where a view is on screen. */
    static Rect on(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return new Rect(at[0], at[1], at[0] + view.getWidth(), at[1] + view.getHeight());
    }

    /** What reads on the card: Messenger's own near-black, and its near-white in the dark theme. */
    static int onSurface(boolean light) {
        return light ? 0xFF050505 : 0xFFE4E6EB;
    }

    private static float density(Context context) {
        if (context == null) return 1f;
        float density = context.getResources().getDisplayMetrics().density;
        return density <= 0 ? 1f : density;
    }

    /** Forgets every menu already carrying a card, for tests. */
    static void resetForTests() {
        dressed.clear();
        bounds = FloatingMenu::on;
    }
}
