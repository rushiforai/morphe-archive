package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * `Pick buttons on the screen`, under Invisible buttons (#191). With it on, a small round button sits at the edge of
 * every Messenger screen, and of every menu or sheet tall enough to hold it. Tap it, then tap any button, and that
 * button's levels open right where it is, so a button can be picked without waiting for it to turn up in settings.
 * Everything this adds goes inside the window it's for, which is how it floats over menus too, and none of it is ever
 * listed or dimmed.
 */
final class InvisibleButtonsPick {
    static final String KEY = "invisible_buttons_pick";
    static final String DOT = "invisible_buttons_pick_dot";
    static final String CATCHER = "invisible_buttons_pick_catcher";
    static final String CARD = "invisible_buttons_pick_card";
    static final String LEVEL = "invisible_buttons_pick_level_";
    private static final int DOT_DP = 30;
    /** A menu shorter than this would have the dot over its buttons, so it gets none. */
    private static final int SMALLEST_WINDOW_DP = 160;
    private static final int SURFACE = 0xF2242526;
    private static final int ACCENT = 0xFF4599FF;

    /** Every view this added that sits straight in a window, which a walk skips with everything under it. */
    private static final Map<View, Boolean> ours = new WeakHashMap<>();
    /** Each window's dot. */
    private static final Map<View, View> dots = new WeakHashMap<>();

    private InvisibleButtonsPick() { }

    static void resetForTests() {
        ours.clear();
        dots.clear();
    }

    static boolean on() {
        return Settings.wouldUse(InvisibleButtons.KEY) && Settings.preferences.getBoolean(KEY, false);
    }

    static boolean isOurs(View view) {
        return !ours.isEmpty() && ours.containsKey(view);
    }

    /**
     * Puts the dot on [window] while the switch is on and takes everything this added off once it's off. Only a
     * window's own top view counts, and only one that stacks its children, so the dot can sit over the rest.
     */
    static void sync(View window) {
        if (!(window instanceof FrameLayout) || window.getParent() instanceof View) return;
        FrameLayout root = (FrameLayout) window;
        View dot = dots.get(root);
        boolean wanted = on() && fits(root);
        if (wanted && dot == null) addDot(root);
        else if (!wanted && dot != null) {
            close(root);
            root.removeView(dot);
            dots.remove(root);
            ours.remove(dot);
        }
    }

    private static boolean fits(FrameLayout root) {
        int height = root.getHeight();
        return height == 0 || height >= dp(root, SMALLEST_WINDOW_DP);
    }

    private static void addDot(FrameLayout root) {
        Context context = root.getContext();
        View dot = new View(context);
        dot.setTag(DOT);
        dot.setContentDescription(new SettingsText(context).get("invisible_buttons_pick_dot"));
        dot.setBackground(ring(root, false));
        dot.setElevation(dp(root, 12));
        dot.setOnClickListener(view -> arm(root));
        int size = dp(root, DOT_DP);
        FrameLayout.LayoutParams at = new FrameLayout.LayoutParams(size, size, Gravity.END | Gravity.CENTER_VERTICAL);
        at.setMarginEnd(dp(root, 6));
        root.addView(dot, at);
        ours.put(dot, true);
        dots.put(root, dot);
    }

    private static GradientDrawable ring(View view, boolean armed) {
        GradientDrawable ring = new GradientDrawable();
        ring.setShape(GradientDrawable.OVAL);
        ring.setColor(armed ? 0xCC4599FF : 0x99000000);
        ring.setStroke(dp(view, 2), Color.WHITE);
        return ring;
    }

    /** The dot was tapped: the next tap anywhere in the window picks the button under it. */
    private static void arm(FrameLayout root) {
        close(root);
        View dot = dots.get(root);
        if (dot != null) dot.setBackground(ring(root, true));
        View catcher = new View(root.getContext());
        catcher.setTag(CATCHER);
        catcher.setElevation(dp(root, 16));
        catcher.setOnTouchListener((view, event) -> {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_UP) {
                disarm(root);
                pickAt(root, Math.round(event.getRawX()), Math.round(event.getRawY()));
            } else if (action == MotionEvent.ACTION_CANCEL) {
                disarm(root);
            }
            return true;
        });
        root.addView(catcher, new FrameLayout.LayoutParams(-1, -1));
        ours.put(catcher, true);
        toast(root, new SettingsText(root.getContext()).get("invisible_buttons_pick_now"));
    }

    private static void disarm(FrameLayout root) {
        remove(root, CATCHER);
        View dot = dots.get(root);
        if (dot != null) dot.setBackground(ring(root, false));
    }

    /** Takes the card and the waiting tap off [root], if either is there. */
    private static void close(FrameLayout root) {
        disarm(root);
        remove(root, CARD);
    }

    private static void remove(FrameLayout root, String tag) {
        List<View> gone = new ArrayList<>();
        for (int i = 0; i < root.getChildCount(); i++) if (tag.equals(root.getChildAt(i).getTag())) gone.add(root.getChildAt(i));
        for (View view : gone) {
            root.removeView(view);
            ours.remove(view);
        }
    }

    private static void pickAt(FrameLayout root, int x, int y) {
        View dot = dots.get(root);
        // A second tap on the dot only stops picking.
        if (dot != null && under(dot, x, y)) return;
        Map.Entry<View, String> button = InvisibleButtons.buttonAt(root, x, y);
        if (button == null) toast(root, new SettingsText(root.getContext()).get("invisible_buttons_pick_none"));
        else showCard(root, button.getValue(), x, y);
    }

    private static boolean under(View view, int x, int y) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return x >= at[0] && y >= at[1] && x < at[0] + view.getWidth() && y < at[1] + view.getHeight();
    }

    /** The picked button's name over a strip of its levels, under the button or over it when there's no room below. */
    private static void showCard(FrameLayout root, String name, int x, int y) {
        Context context = root.getContext();
        SettingsText text = new SettingsText(context);
        FrameLayout scrim = new FrameLayout(context);
        scrim.setTag(CARD);
        scrim.setElevation(dp(root, 16));
        scrim.setOnClickListener(view -> close(root));
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        // A tap on the card between its levels keeps it open.
        card.setClickable(true);
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(SURFACE);
        surface.setCornerRadius(dp(root, 16));
        card.setBackground(surface);
        int pad = dp(root, 14);
        card.setPadding(pad, pad, pad, pad);
        TextView title = new TextView(context);
        title.setText(name);
        title.setTextColor(Color.WHITE);
        title.setTextSize(15);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        card.addView(title);
        LinearLayout strip = new LinearLayout(context);
        strip.setOrientation(LinearLayout.HORIZONTAL);
        int current = InvisibleButtons.level(name);
        for (int choice : InvisibleButtons.LEVELS_OFFERED) {
            String shown = text.percent(choice);
            TextView option = new TextView(context);
            option.setTag(LEVEL + choice);
            option.setText(text.display(shown));
            option.setContentDescription(text.get("invisible_buttons_level_choice", shown, name));
            option.setGravity(Gravity.CENTER);
            option.setTextSize(14);
            option.setTextColor(choice == current ? ACCENT : Color.WHITE);
            option.setSelected(choice == current);
            int side = dp(root, 4);
            int high = dp(root, 10);
            option.setPadding(side, high, side, high);
            option.setOnClickListener(view -> choose(root, name, choice, shown, text));
            strip.addView(option, new LinearLayout.LayoutParams(0, -2, 1));
        }
        LinearLayout.LayoutParams stripAt = new LinearLayout.LayoutParams(-1, -2);
        stripAt.topMargin = dp(root, 6);
        card.addView(strip, stripAt);

        int edge = dp(root, 12);
        int width = Math.max(dp(root, 200), Math.min(dp(root, 320), root.getWidth() - 2 * edge));
        card.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int[] rootAt = new int[2];
        root.getLocationOnScreen(rootAt);
        int gap = dp(root, 28);
        int top = y - rootAt[1] + gap;
        if (top + card.getMeasuredHeight() > root.getHeight()) top = Math.max(0, y - rootAt[1] - gap - card.getMeasuredHeight());
        FrameLayout.LayoutParams at = new FrameLayout.LayoutParams(width, -2, Gravity.TOP | Gravity.LEFT);
        at.topMargin = top;
        at.leftMargin = Math.max(edge, Math.min(x - rootAt[0] - width / 2, root.getWidth() - width - edge));
        scrim.addView(card, at);
        root.addView(scrim, new FrameLayout.LayoutParams(-1, -1));
        ours.put(scrim, true);
    }

    private static void choose(FrameLayout root, String name, int choice, String shown, SettingsText text) {
        close(root);
        InvisibleButtons.setLevel(name, choice);
        InvisibleButtons.refresh();
        toast(root, choice == 0 ? text.get("invisible_buttons_invisible")
            : choice >= 100 ? text.get("invisible_buttons_visible") : text.get("invisible_buttons_level", shown));
    }

    private static void toast(View view, String said) {
        Toast.makeText(view.getContext(), said, Toast.LENGTH_SHORT).show();
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
}
