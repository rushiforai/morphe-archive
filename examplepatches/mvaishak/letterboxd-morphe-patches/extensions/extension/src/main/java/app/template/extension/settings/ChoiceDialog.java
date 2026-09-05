package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Simple single-choice list dialog (dark, accent-checked). */
final class ChoiceDialog extends Dialog {

    interface OnPick {
        void onPick(String value);
    }

    private final float density;

    ChoiceDialog(Context context, String title, String[] labels, String[] values,
                 String current, int accent, OnPick onPick) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        build(title, labels, values, current, 0xFF000000 | accent, onPick);
    }

    private void build(String title, String[] labels, String[] values, String current,
                       int accent, final OnPick onPick) {
        Window window = getWindow();
        if (window != null) {
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xFF161616);
            bg.setCornerRadius(dp(20));
            window.setBackgroundDrawable(bg);
        }

        LinearLayout root = new LinearLayout(getContext());
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(20), dp(20), dp(12));

        TextView head = new TextView(getContext());
        head.setText(title);
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(8));
        root.addView(head);

        for (int i = 0; i < labels.length; i++) {
            final String value = values[i];
            boolean sel = value.equals(current);

            LinearLayout row = new LinearLayout(getContext());
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(6), dp(15), dp(6), dp(15));
            row.setClickable(true);
            row.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    onPick.onPick(value);
                    dismiss();
                }
            });

            TextView label = new TextView(getContext());
            label.setText(labels[i]);
            label.setTextColor(sel ? accent : 0xFFEDEDED);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            row.addView(label, new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            if (sel) {
                TextView check = new TextView(getContext());
                check.setText("✓");
                check.setTextColor(accent);
                check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
                check.setTypeface(check.getTypeface(), Typeface.BOLD);
                row.addView(check);
            }
            root.addView(row);
        }

        setContentView(root);
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private int dp(float v) {
        return Math.round(v * density);
    }
}
