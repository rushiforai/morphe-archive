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
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * "Home tabs" chooser — reorder with the arrows, check to show. The top checked tab is the one
 * the home screen opens on. At least one tab stays on.
 */
final class HomeTabsDialog extends Dialog {

    interface OnDone {
        void onDone();
    }

    private final float density;
    private final int accent;
    private final List<String> ordered;   // every key, in current order
    private final List<String> shown;     // subset that is visible
    private LinearLayout list;

    HomeTabsDialog(Context context, int accentArgb, final OnDone onDone) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.accent = 0xFF000000 | accentArgb;

        this.shown = new ArrayList<>(HomeTabs.order());
        this.ordered = new ArrayList<>(shown);
        for (String k : HomeTabs.KEYS) {
            if (!ordered.contains(k)) ordered.add(k);
        }
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
        head.setText("Home tabs");
        head.setTextColor(0xFFFFFFFF);
        head.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        head.setTypeface(head.getTypeface(), Typeface.BOLD);
        head.setPadding(0, 0, 0, dp(4));
        root.addView(head);

        TextView sub = new TextView(getContext());
        sub.setText("Home opens on the top checked tab.");
        sub.setTextColor(0xFF9AA0A6);
        sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        sub.setPadding(0, 0, 0, dp(10));
        root.addView(sub);

        list = new LinearLayout(getContext());
        list.setOrientation(LinearLayout.VERTICAL);
        root.addView(list);
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
                List<String> result = new ArrayList<>();
                for (String k : ordered) {
                    if (shown.contains(k)) result.add(k);
                }
                HomeTabs.setOrder(result);
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
        for (int i = 0; i < ordered.size(); i++) {
            final int index = i;
            final String key = ordered.get(i);
            list.addView(row(key, index));
        }
    }

    private View row(final String key, final int index) {
        LinearLayout row = new LinearLayout(getContext());
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(4), dp(10), dp(4), dp(10));

        final boolean on = shown.contains(key);
        View check = new View(getContext());
        check.setBackground(Glyphs.checkbox(on ? accent : 0xFF9AA0A6, density, on));
        LinearLayout.LayoutParams clp = new LinearLayout.LayoutParams(dp(20), dp(20));
        clp.rightMargin = dp(14);
        row.addView(check, clp);

        TextView label = new TextView(getContext());
        label.setText(HomeTabs.LABELS[indexOfKey(key)]);
        label.setTextColor(on ? 0xFFEDEDED : 0xFF8A8F94);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        LinearLayout.LayoutParams llp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        row.addView(label, llp);

        row.addView(arrow(true, index > 0, new Runnable() {
            @Override public void run() { swap(index, index - 1); }
        }));
        row.addView(arrow(false, index < ordered.size() - 1, new Runnable() {
            @Override public void run() { swap(index, index + 1); }
        }));

        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (on && shown.size() <= 1) {
                    Toast.makeText(getContext(), "Keep at least one tab", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (on) shown.remove(key); else shown.add(key);
                rebuild();
            }
        });
        return row;
    }

    private View arrow(boolean up, boolean enabled, final Runnable onTap) {
        View a = new View(getContext());
        a.setBackground(Glyphs.chevron(enabled ? 0xFFCDCDCD : 0xFF44484C, density, up));
        int box = dp(34);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(box, box);
        a.setLayoutParams(lp);
        if (enabled) {
            a.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) { onTap.run(); }
            });
        }
        return a;
    }

    private void swap(int a, int b) {
        if (b < 0 || b >= ordered.size()) return;
        String tmp = ordered.get(a);
        ordered.set(a, ordered.get(b));
        ordered.set(b, tmp);
        rebuild();
    }

    private static int indexOfKey(String key) {
        for (int i = 0; i < HomeTabs.KEYS.length; i++) {
            if (HomeTabs.KEYS[i].equals(key)) return i;
        }
        return 0;
    }

    private int dp(float v) {
        return Math.round(v * density);
    }
}
