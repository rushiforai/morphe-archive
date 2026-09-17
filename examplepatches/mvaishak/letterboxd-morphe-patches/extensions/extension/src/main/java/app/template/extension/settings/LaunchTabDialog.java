package app.template.extension.settings;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/** "Launch tab" chooser — "Last used" plus every currently-shown bottom-nav item. */
final class LaunchTabDialog extends Dialog {

    interface OnPick {
        void onPick(String value);
    }

    private final float density;
    private final int accent;

    LaunchTabDialog(Context context, String current, int accentArgb, final OnPick onPick) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.accent = 0xFF000000 | accentArgb;
        build(current, onPick);
    }

    private void build(String current, final OnPick onPick) {
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
        head.setText("Launch tab");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(10));
        root.addView(head);

        List<String> values = new ArrayList<>();
        List<String> labels = new ArrayList<>();
        values.add("last");
        labels.add("Last used");
        for (String key : NavItems.enabled()) {
            values.add(key);
            labels.add(labelFor(key));
        }

        ScrollView scroll = new ScrollView(getContext());
        LinearLayout list = new LinearLayout(getContext());
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);

        for (int i = 0; i < values.size(); i++) {
            final String value = values.get(i);
            boolean sel = value.equals(current);
            list.addView(OptionCard.build(getContext(), density, labels.get(i), sel, accent,
                    new Runnable() {
                        @Override public void run() {
                            onPick.onPick(value);
                            dismiss();
                        }
                    }));
        }
        root.addView(scroll);

        setContentView(root);
        if (window != null) {
            window.setLayout(
                    Math.min(getContext().getResources().getDisplayMetrics().widthPixels - dp(44), dp(420)),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private static String labelFor(String key) {
        for (int i = 0; i < NavItems.KEYS.length; i++) {
            if (NavItems.KEYS[i].equals(key)) return NavItems.LABELS[i];
        }
        return key;
    }

    private int dp(float v) {
        return Math.round(v * density);
    }
}
