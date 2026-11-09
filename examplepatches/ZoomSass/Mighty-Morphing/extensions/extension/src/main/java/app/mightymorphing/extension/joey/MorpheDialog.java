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
                Drawable icon = activity.getDrawable(id);
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
        return ModernUi.isModernUiEnabled(activity) ? ModernUi.getPalette(activity).canvas : 0xFF1A140C;
    }

    static LinearLayout actions(Activity activity, TextView... buttons) {
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.END);
        bar.setPadding(0, Math.round(12 * activity.getResources().getDisplayMetrics().density), 0, 0);
        float density = activity.getResources().getDisplayMetrics().density;
        for (TextView button : buttons) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.leftMargin = Math.round(8 * density);
            bar.addView(button, lp);
        }
        return bar;
    }

    /** A short list. The chosen row uses the current accent. */
    static void choices(Activity activity, String title, String[] labels, int selected, Choice choice) {
        LinearLayout page = page(activity, title, null);
        AlertDialog[] shown = new AlertDialog[1];
        for (int i = 0; i < labels.length; i++) {
            TextView row = action(activity, labels[i], i == selected ? GOLD : TEXT);
            row.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rowLp.bottomMargin = Math.round(8 * activity.getResources().getDisplayMetrics().density);
            row.setLayoutParams(rowLp);
            int index = i;
            row.setOnClickListener(v -> {
                if (shown[0] != null) shown[0].dismiss();
                choice.pick(index);
            });
            page.addView(row);
        }
        TextView cancel = action(activity, "Cancel", SUB);
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        page.addView(actions(activity, cancel));
        shown[0] = show(activity, page);
    }

    interface Choice {
        void pick(int index);
    }

    static AlertDialog show(Activity activity, View page) {
        return show(activity, page, 400);
    }

    static AlertDialog show(Activity activity, View page, int maxDp) {
        AlertDialog dialog = new AlertDialog.Builder(activity).setView(page).create();
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
        return ModernUi.isModernUiEnabled(activity) ? ModernUi.getPalette(activity).accent : GOLD;
    }

    static int text(Activity activity) {
        return ModernUi.isModernUiEnabled(activity) ? ModernUi.getPalette(activity).onSurface : TEXT;
    }

    static int sub(Activity activity) {
        return ModernUi.isModernUiEnabled(activity) ? ModernUi.getPalette(activity).onSurfaceVariant : SUB;
    }

    private static int card(Activity activity) {
        return ModernUi.isModernUiEnabled(activity) ? ModernUi.getPalette(activity).container : CARD;
    }
}
