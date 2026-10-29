package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
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
        page.setBackgroundColor(CARD);
        page.setPadding(pad, pad, pad, Math.round(8 * density));

        TextView heading = new TextView(activity);
        heading.setText(title);
        heading.setTextColor(GOLD);
        heading.setTextSize(20);
        page.addView(heading);

        if (info != null && !info.isEmpty()) {
            TextView note = new TextView(activity);
            note.setText(info);
            note.setTextColor(SUB);
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
        box.setTextColor(TEXT);
        box.setTextSize(15);
        box.setChecked(checked);
        if (box.getButtonDrawable() != null) box.getButtonDrawable().setTint(GOLD);
        if (drawable != null) {
            int id = activity.getResources().getIdentifier(drawable, "drawable", activity.getPackageName());
            if (id != 0) {
                Drawable icon = activity.getDrawable(id);
                if (icon != null) {
                    icon = icon.mutate();
                    icon.setTint(TEXT);
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
                Math.round(760 * density));
        scroll.measure(
                View.MeasureSpec.makeMeasureSpec(Math.max(width, 1), View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int max = Math.round(activity.getResources().getDisplayMetrics().heightPixels * 0.62f);
        int height = Math.min(scroll.getMeasuredHeight(), max);
        scroll.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        return scroll;
    }

    static TextView action(Activity activity, String label, int color) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextColor(color);
        view.setTextSize(16);
        int pad = Math.round(12 * activity.getResources().getDisplayMetrics().density);
        view.setPadding(pad, pad, pad, pad);
        view.setClickable(true);
        view.setFocusable(true);
        return view;
    }

    static LinearLayout actions(Activity activity, TextView... buttons) {
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.END);
        for (TextView button : buttons) bar.addView(button);
        return bar;
    }

    static AlertDialog show(Activity activity, View page) {
        AlertDialog dialog = new AlertDialog.Builder(activity).setView(page).create();
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(CANVAS));
        }
        dialog.show();
        if (dialog.getWindow() != null) {
            float density = activity.getResources().getDisplayMetrics().density;
            int width = Math.min(
                    activity.getResources().getDisplayMetrics().widthPixels - Math.round(48 * density),
                    Math.round(840 * density));
            dialog.getWindow().setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        return dialog;
    }
}
