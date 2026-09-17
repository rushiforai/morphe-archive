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
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * "Bottom navigation" chooser — check which destinations the bar shows. Profile is always on and
 * can't be unchecked; the bar caps at five, so the sixth check is refused.
 */
final class NavItemsDialog extends Dialog {

    interface OnDone {
        void onDone();
    }

    private static final int MAX_VISIBLE = 5;

    private final float density;
    private final int accent;
    private final List<String> selected;
    private LinearLayout list;

    NavItemsDialog(Context context, int accentArgb, final OnDone onDone) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.accent = 0xFF000000 | accentArgb;
        this.selected = new ArrayList<>(NavItems.enabled());
        build(onDone);
    }

    private void build(final OnDone onDone) {
        Window window = getWindow();
        if (window != null) {
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(SurfaceColors.elevated(getContext()));
            bg.setCornerRadius(dp(20));
            window.setBackgroundDrawable(bg);
        }

        LinearLayout root = new LinearLayout(getContext());
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(20), dp(20), dp(14));

        TextView head = new TextView(getContext());
        head.setText("Bottom navigation");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(4));
        root.addView(head);

        TextView sub = new TextView(getContext());
        sub.setText("Pick up to five. Profile is always shown.");
        sub.setTextColor(0xFF9AA0A6);
        sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        sub.setPadding(0, 0, 0, dp(10));
        root.addView(sub);

        ScrollView scroll = new ScrollView(getContext());
        list = new LinearLayout(getContext());
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        root.addView(scroll);
        rebuild();

        TextView done = new TextView(getContext());
        done.setText("Done");
        done.setAllCaps(true);
        done.setTextColor(accent);
        done.setTypeface(done.getTypeface(), Typeface.BOLD);
        done.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        done.setGravity(Gravity.END);
        done.setPadding(dp(12), dp(16), dp(4), dp(6));
        done.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                NavItems.setEnabled(selected);
                dismiss();
                onDone.onDone();
            }
        });
        root.addView(done);

        setContentView(root);
        if (window != null) {
            window.setLayout(
                    Math.min(getContext().getResources().getDisplayMetrics().widthPixels - dp(44), dp(420)),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private void rebuild() {
        list.removeAllViews();
        for (int i = 0; i < NavItems.KEYS.length; i++) {
            final String key = NavItems.KEYS[i];
            final boolean locked = "profile".equals(key);
            final boolean on = locked || selected.contains(key);

            View card = OptionCard.build(getContext(), density, NavItems.LABELS[i], on, accent,
                    new Runnable() {
                        @Override public void run() {
                            if (locked) return;
                            if (selected.contains(key)) {
                                selected.remove(key);
                            } else if (visibleCount() >= MAX_VISIBLE) {
                                Toast.makeText(getContext(), "The bar holds five items", Toast.LENGTH_SHORT).show();
                                return;
                            } else {
                                selected.add(key);
                            }
                            rebuild();
                        }
                    });
            if (locked) card.setAlpha(0.55f);
            list.addView(card);
        }
    }

    /** Selected count with Profile always counted. */
    private int visibleCount() {
        int n = selected.contains("profile") ? 0 : 1;
        return n + selected.size();
    }

    private int dp(float v) {
        return Math.round(v * density);
    }
}
