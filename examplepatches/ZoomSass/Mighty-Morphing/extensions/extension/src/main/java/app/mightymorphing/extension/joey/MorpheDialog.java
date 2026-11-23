package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentCallbacks;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.List;

/** Shared layout for the Morphe Settings popups. */
final class MorpheDialog {
    static final int CANVAS = 0xFF102022;
    static final int CARD = 0xFF000000;
    static final int GOLD = 0xFFF0A202;
    static final int TEXT = 0xFFE6E6E6;
    static final int SUB = 0xFF9A9A9A;

    private MorpheDialog() {
    }

    static LinearLayout page(Activity activity, String title, String info) {
        float density = activity.getResources().getDisplayMetrics().density;
        int pad = Math.round(20 * density);
        LinearLayout page = new LinearLayout(activity);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(card(activity));
        page.setPadding(pad, pad, pad, Math.round(8 * density));

        TextView heading = new TextView(activity);
        heading.setText(title);
        heading.setTextColor(accent(activity));
        heading.setTextSize(20);
        page.addView(heading);

        if (info != null && !info.isEmpty()) {
            TextView note = new TextView(activity);
            note.setText(info);
            note.setTextColor(sub(activity));
            note.setTextSize(13);
            note.setPadding(0, Math.round(8 * density), 0, Math.round(12 * density));
            page.addView(note);
        }
        return page;
    }

    static CheckBox check(Activity activity, String label, boolean checked, String drawable) {
        float density = activity.getResources().getDisplayMetrics().density;
        CheckBox box = new CheckBox(activity);
        box.setText(label);
        box.setTextColor(text(activity));
        box.setTextSize(15);
        box.setChecked(checked);
        if (box.getButtonDrawable() != null) box.getButtonDrawable().setTint(accent(activity));
        if (drawable != null) {
            int id = activity.getResources().getIdentifier(drawable, "drawable", activity.getPackageName());
            if (id != 0) {
                Drawable icon = activity.getDrawable(ModernIcons.swap(activity, id));
                if (icon != null) {
                    icon = icon.mutate();
                    icon.setTint(text(activity));
                    int size = Math.round(22 * density);
                    icon.setBounds(0, 0, size, size);
                    box.setCompoundDrawablesRelative(icon, null, null, null);
                    box.setCompoundDrawablePadding(Math.round(8 * density));
                }
            }
        }
        return box;
    }

    static TextView section(Activity activity, String label, int color) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextColor(color);
        view.setTextSize(15);
        view.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        view.setPadding(0, Math.round(12 * density), 0, Math.round(4 * density));
        return view;
    }

    /** Two columns. A short last row keeps an empty cell so the widths stay even. */
    static void addGrid(LinearLayout parent, List<View> cells) {
        for (int i = 0; i < cells.size(); ) {
            LinearLayout line = new LinearLayout(parent.getContext());
            line.setOrientation(LinearLayout.HORIZONTAL);
            for (int column = 0; column < 2 && i < cells.size(); column++, i++) {
                line.addView(cells.get(i), new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            }
            if (line.getChildCount() == 1) {
                line.addView(new View(parent.getContext()), new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            }
            parent.addView(line);
        }
    }

    static ScrollView scroller(Activity activity, View content) {
        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(false);
        scroll.setNestedScrollingEnabled(true);
        scroll.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        float density = activity.getResources().getDisplayMetrics().density;
        int width = Math.min(
                activity.getResources().getDisplayMetrics().widthPixels - Math.round(64 * density),
                Math.round(360 * density));
        scroll.measure(
                View.MeasureSpec.makeMeasureSpec(Math.max(width, 1), View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int max = Math.round(activity.getResources().getDisplayMetrics().heightPixels * 0.62f);
        int height = Math.min(scroll.getMeasuredHeight(), max);
        scroll.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        return scroll;
    }

    static TextView action(Activity activity, String label, int color) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextSize(15);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(Math.round(36 * density));
        int padH = Math.round(14 * density);
        int padV = Math.round(8 * density);
        view.setPadding(padH, padV, padH, padV);
        view.setClickable(true);
        view.setFocusable(true);
        boolean filled = color == GOLD;
        view.setBackground(plate(activity, filled));
        view.setTextColor(filled ? ink(activity) : resolve(activity, color == SUB ? SUB : TEXT));
        return view;
    }

    /** A pick-one row: the name on the left and a switch on the right. Callers set the click and call setFilled. */
    static final class ModeRow extends LinearLayout {
        final android.widget.CompoundButton toggle;

        ModeRow(Activity activity, String label) {
            super(activity);
            float density = activity.getResources().getDisplayMetrics().density;
            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            setMinimumHeight(Math.round(44 * density));
            setPadding(0, Math.round(4 * density), 0, Math.round(4 * density));
            setClickable(true);
            setFocusable(true);
            TextView name = new TextView(activity);
            name.setText(label);
            name.setTextSize(15);
            name.setTextColor(text(activity));
            addView(name, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            toggle = toggle(activity);
            toggle.setClickable(false);
            toggle.setFocusable(false);
            LayoutParams lp = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.leftMargin = Math.round(16 * density);
            addView(toggle, lp);
        }
    }

    static View mode(Activity activity, String label) {
        return new ModeRow(activity, label);
    }

    /** Switch rows follow the same call the buttons used. */
    static void setFilled(Activity activity, View view, boolean on) {
        if (view instanceof ModeRow) {
            ((ModeRow) view).toggle.setChecked(on);
        } else if (view instanceof TextView) {
            setFilled(activity, (TextView) view, on);
        }
    }

    /** Filled when the action is the one in use. Outline when it is available. */
    static void setFilled(Activity activity, TextView view, boolean filled) {
        view.setBackground(plate(activity, filled));
        view.setTextColor(filled ? ink(activity) : text(activity));
    }

    private static android.graphics.drawable.GradientDrawable plate(Activity activity, boolean filled) {
        float density = activity.getResources().getDisplayMetrics().density;
        android.graphics.drawable.GradientDrawable plate = new android.graphics.drawable.GradientDrawable();
        plate.setCornerRadius(18 * density);
        if (filled) {
            plate.setColor(accent(activity));
        } else {
            plate.setColor(card(activity));
            plate.setStroke(Math.max(1, Math.round(density)), sub(activity));
        }
        return plate;
    }

    private static int ink(Activity activity) {
        return ModernUi.modernLook(activity) ? ModernUi.getPalette(activity).onAccent : 0xFF1A140C;
    }

    static LinearLayout actions(Activity activity, TextView... buttons) {
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.END);
        bar.setPadding(0, Math.round(12 * activity.getResources().getDisplayMetrics().density), 0, 0);
        float density = activity.getResources().getDisplayMetrics().density;
        for (TextView button : buttons) {
            boolean many = buttons.length > 3;
            LinearLayout.LayoutParams lp = many
                    ? new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
                    : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.leftMargin = Math.round((many ? 6 : 8) * density);
            if (many) {
                button.setSingleLine(true);
                button.setGravity(Gravity.CENTER);
                button.setPadding(Math.round(6 * density), button.getPaddingTop(), Math.round(6 * density), button.getPaddingBottom());
            }
            bar.addView(button, lp);
        }
        return bar;
    }

    /** A short list of plain rows. The chosen row uses the current accent and a tick. */
    static void choices(Activity activity, String title, String[] labels, int selected, Choice choice) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout page = page(activity, title, null);
        AlertDialog[] shown = new AlertDialog[1];
        page.getChildAt(0).setPadding(0, 0, 0, Math.round(6 * density));
        for (int i = 0; i < labels.length; i++) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(Math.round(48 * density));
            boolean on = i == selected;
            TextView name = new TextView(activity);
            name.setText(labels[i]);
            name.setTextSize(16);
            name.setTextColor(on ? accent(activity) : text(activity));
            row.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            if (on) {
                TextView tick = new TextView(activity);
                tick.setText("\u2713");
                tick.setTextSize(16);
                tick.setTextColor(accent(activity));
                row.addView(tick);
            }
            int index = i;
            row.setClickable(true);
            row.setOnClickListener(v -> {
                if (shown[0] != null) shown[0].dismiss();
                choice.pick(index);
            });
            page.addView(row);
            if (i < labels.length - 1) {
                View line = new View(activity);
                line.setBackgroundColor(sub(activity) & 0x00FFFFFF | 0x33000000);
                page.addView(line, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Math.round(density))));
            }
        }
        TextView cancel = action(activity, "Cancel", SUB);
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        LinearLayout bar = actions(activity, cancel);
        bar.setPadding(0, Math.round(16 * density), 0, Math.round(4 * density));
        page.addView(bar);
        shown[0] = show(activity, page);
    }

    interface Choice {
        void pick(int index);
    }

    /**
     * A short list of options with a switch on each. Turning one on turns the others off, and the
     * choice applies at once. The one in use cannot be turned off, so one is always selected.
     */
    static void exclusive(Activity activity, String title, String[] labels, String[] details,
                          int selected, Choice choice) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout page = page(activity, title, null);
        AlertDialog[] shown = new AlertDialog[1];
        android.widget.CompoundButton[] switches = new android.widget.CompoundButton[labels.length];
        boolean[] busy = {false};
        for (int i = 0; i < labels.length; i++) {
            int index = i;
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(0, Math.round(12 * density), 0, Math.round(12 * density));
            LinearLayout words = new LinearLayout(activity);
            words.setOrientation(LinearLayout.VERTICAL);
            TextView name = new TextView(activity);
            name.setText(labels[i]);
            name.setTextColor(text(activity));
            name.setTextSize(16);
            words.addView(name);
            if (details != null && details[i] != null) {
                TextView note = new TextView(activity);
                note.setText(details[i]);
                note.setTextColor(sub(activity));
                note.setTextSize(13);
                note.setPadding(0, Math.round(2 * density), 0, 0);
                words.addView(note);
            }
            row.addView(words, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            android.widget.CompoundButton toggle = toggle(activity);
            toggle.setChecked(i == selected);
            switches[i] = toggle;
            LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            tlp.leftMargin = Math.round(16 * density);
            row.addView(toggle, tlp);
            toggle.setOnCheckedChangeListener((button, on) -> {
                if (busy[0]) return;
                busy[0] = true;
                if (!on) {
                    button.setChecked(true);
                } else {
                    for (int j = 0; j < switches.length; j++) if (j != index) switches[j].setChecked(false);
                    choice.pick(index);
                }
                busy[0] = false;
            });
            row.setOnClickListener(v -> toggle.setChecked(true));
            page.addView(row);
            if (i < labels.length - 1) {
                View line = new View(activity);
                line.setBackgroundColor(sub(activity) & 0x00FFFFFF | 0x33000000);
                page.addView(line, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Math.round(density))));
            }
        }
        TextView done = action(activity, "Done", SUB);
        done.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        LinearLayout bar = actions(activity, done);
        bar.setPadding(0, Math.round(16 * density), 0, Math.round(4 * density));
        page.addView(bar);
        shown[0] = show(activity, page);
    }

    /** A switch in the popup's colours. */
    static android.widget.CompoundButton toggle(Activity activity) {
        android.widget.CompoundButton toggle;
        try {
            Object created = Class.forName("com.google.android.material.materialswitch.MaterialSwitch")
                    .getConstructor(android.content.Context.class).newInstance(activity);
            toggle = (android.widget.CompoundButton) created;
        } catch (Throwable ignored) {
            toggle = new android.widget.Switch(activity);
        }
        int on = accent(activity);
        int off = sub(activity);
        android.content.res.ColorStateList thumb = new android.content.res.ColorStateList(
                new int[][]{{android.R.attr.state_checked}, {}}, new int[]{on, off});
        android.content.res.ColorStateList track = new android.content.res.ColorStateList(
                new int[][]{{android.R.attr.state_checked}, {}},
                new int[]{on & 0x00FFFFFF | 0x66000000, off & 0x00FFFFFF | 0x33000000});
        try {
            toggle.getClass().getMethod("setThumbTintList", android.content.res.ColorStateList.class).invoke(toggle, thumb);
            toggle.getClass().getMethod("setTrackTintList", android.content.res.ColorStateList.class).invoke(toggle, track);
        } catch (Throwable ignored) {
        }
        return toggle;
    }

    static AlertDialog show(Activity activity, View page) {
        return show(activity, page, 400);
    }

    static AlertDialog show(Activity activity, View page, int maxDp) {
        // Every popup scrolls when it is taller than the screen. A list that scrolls inside the
        // popup scrolls first, then hands the rest of the swipe to the popup. A popup that fits
        // does not scroll, so nothing changes there.
        View content = page;
        if (!(page instanceof ScrollView)) {
            ScrollView scroll = new ScrollView(activity);
            scroll.setFillViewport(true);
            scroll.addView(page, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            content = scroll;
        }
        AlertDialog dialog = new AlertDialog.Builder(activity).setView(content).create();
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(card(activity)));
        }
        dialog.show();
        place(activity, dialog, maxDp);
        if (dialog.getWindow() != null) {
            dialog.getWindow().getDecorView().post(() -> place(activity, dialog, maxDp));
        }
        ComponentCallbacks callbacks = new ComponentCallbacks() {
            @Override
            public void onConfigurationChanged(Configuration newConfig) {
                if (dialog.getWindow() == null) return;
                dialog.getWindow().getDecorView().post(() -> place(activity, dialog, maxDp));
            }

            @Override
            public void onLowMemory() {
            }
        };
        activity.getApplication().registerComponentCallbacks(callbacks);
        dialog.setOnDismissListener(d -> activity.getApplication().unregisterComponentCallbacks(callbacks));
        return dialog;
    }

    /**
     * A popup that uses nearly the whole screen: a fixed frame the caller lays out itself, with
     * its own scrolling where it needs any. It sits beside show(), which wraps and scrolls.
     */
    static android.app.Dialog showFull(Activity activity, View page, int maxDp, Runnable onDismiss) {
        android.app.Dialog dialog = new android.app.Dialog(activity);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        dialog.setContentView(page, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        dialog.show();
        placeFull(activity, dialog, maxDp);
        if (dialog.getWindow() != null) {
            dialog.getWindow().getDecorView().post(() -> placeFull(activity, dialog, maxDp));
        }
        ComponentCallbacks callbacks = new ComponentCallbacks() {
            @Override
            public void onConfigurationChanged(Configuration newConfig) {
                if (dialog.getWindow() == null) return;
                dialog.getWindow().getDecorView().post(() -> placeFull(activity, dialog, maxDp));
            }

            @Override
            public void onLowMemory() {
            }
        };
        activity.getApplication().registerComponentCallbacks(callbacks);
        dialog.setOnDismissListener(d -> {
            activity.getApplication().unregisterComponentCallbacks(callbacks);
            if (onDismiss != null) onDismiss.run();
        });
        return dialog;
    }

    private static void placeFull(Activity activity, android.app.Dialog dialog, int maxDp) {
        if (dialog.getWindow() == null || !dialog.isShowing()) return;
        float density = activity.getResources().getDisplayMetrics().density;
        int margin = Math.round(10 * density);
        android.graphics.Rect visible = new android.graphics.Rect();
        activity.getWindow().getDecorView().getWindowVisibleDisplayFrame(visible);
        int screenW = activity.getResources().getDisplayMetrics().widthPixels;
        int screenH = visible.height() > 0 ? visible.height() : activity.getResources().getDisplayMetrics().heightPixels;
        int width = Math.min(screenW - 2 * margin, Math.round(maxDp * density));
        int height = screenH - 2 * margin;
        dialog.getWindow().setLayout(width, height);
        dialog.getWindow().setGravity(Gravity.CENTER);
    }

    /** Keeps the card to a phone width, and fits it again when a fold opens or closes. */
    private static void place(Activity activity, AlertDialog dialog, int maxDp) {
        if (dialog.getWindow() == null || !dialog.isShowing()) return;
        float density = activity.getResources().getDisplayMetrics().density;
        int screenW = activity.getResources().getDisplayMetrics().widthPixels;
        int width = Math.min(screenW - Math.round(48 * density), Math.round(maxDp * density));
        width = Math.max(width, Math.round(260 * density));
        WindowManager.LayoutParams attrs = dialog.getWindow().getAttributes();
        attrs.width = width;
        attrs.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        attrs.gravity = Gravity.CENTER;
        dialog.getWindow().setAttributes(attrs);
        dialog.getWindow().setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static int resolve(Activity activity, int color) {
        if (color == GOLD) return accent(activity);
        if (color == TEXT) return text(activity);
        if (color == SUB) return sub(activity);
        return color;
    }

    static int accent(Activity activity) {
        return ModernUi.modernLook(activity) ? ModernUi.getPalette(activity).accent : GOLD;
    }

    static int text(Activity activity) {
        return ModernUi.modernLook(activity) ? ModernUi.getPalette(activity).onSurface : TEXT;
    }

    static int sub(Activity activity) {
        return ModernUi.modernLook(activity) ? ModernUi.getPalette(activity).onSurfaceVariant : SUB;
    }

    private static int card(Activity activity) {
        return ModernUi.modernLook(activity) ? ModernUi.getPalette(activity).container : CARD;
    }
}
