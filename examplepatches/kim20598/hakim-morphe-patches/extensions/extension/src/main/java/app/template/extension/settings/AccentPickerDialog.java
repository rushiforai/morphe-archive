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

import java.util.Map;

/**
 * The accent picker from Morphe Manager: a scroll list of full-width colour cards plus a
 * "Custom colour" card that opens {@link HexPickerDialog}. Result is reported as a preset key
 * ({@code "green"}, {@code "blue"}, ...) or {@code "custom"} + a hex string.
 */
final class AccentPickerDialog extends Dialog {

    interface OnAccentChosen {
        void onChosen(String accentKey, String customHex);
    }

    private final float density;
    private final OnAccentChosen callback;
    private final String currentKey;
    private final String currentHex;

    AccentPickerDialog(Context context, String currentKey, String currentHex, OnAccentChosen cb) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.callback = cb;
        this.currentKey = currentKey == null ? AccentPresets.defaultAccent(context) : currentKey;
        this.currentHex = currentHex == null ? "" : currentHex;
        build();
    }

    private void build() {
        Window window = getWindow();
        if (window != null) window.setBackgroundDrawable(round(SurfaceColors.elevated(getContext()), dp(20)));

        LinearLayout root = new LinearLayout(getContext());
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(18);
        root.setPadding(pad, dp(20), pad, dp(16));

        TextView title = new TextView(getContext());
        title.setText("Accent colour");
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        title.setTypeface(title.getTypeface(), Typeface.BOLD);
        title.setPadding(0, 0, 0, dp(12));
        root.addView(title);

        LinearLayout list = new LinearLayout(getContext());
        list.setOrientation(LinearLayout.VERTICAL);

        if (AccentPresets.materialYouAccentAvailable(getContext())) {
            for (int family = 1; family <= AccentPresets.MATERIAL_YOU_KEYS.length; family++) {
                final String key = AccentPresets.MATERIAL_YOU_KEYS[family - 1];
                Integer tone = AccentPresets.materialYouTone(getContext(), family);
                if (tone == null) continue;
                list.addView(card(AccentPresets.MATERIAL_YOU_LABELS[family - 1], tone, key.equals(currentKey),
                        new View.OnClickListener() {
                            @Override public void onClick(View v) {
                                if (callback != null) callback.onChosen(key, "");
                                dismiss();
                            }
                        }));
            }
        }

        for (Map.Entry<String, String> e : AccentPresets.LABELS.entrySet()) {
            final String key = e.getKey();
            list.addView(card(e.getValue(), AccentPresets.ARGB.get(key), key.equals(currentKey),
                    new View.OnClickListener() {
                        @Override public void onClick(View v) {
                            if (callback != null) callback.onChosen(key, "");
                            dismiss();
                        }
                    }));
        }
        int customColor = AccentPresets.CUSTOM.equals(currentKey)
                ? AccentPresets.previewColor(getContext(), AccentPresets.CUSTOM, currentHex)
                : 0xFF2E2E2E;
        list.addView(card("Custom colour", customColor, AccentPresets.CUSTOM.equals(currentKey),
                new View.OnClickListener() {
                    @Override public void onClick(View v) { openCustom(); }
                }));

        ScrollView scroll = new ScrollView(getContext());
        scroll.addView(list);
        LinearLayout.LayoutParams scrollLp =
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        root.addView(scroll, scrollLp);

        TextView close = new TextView(getContext());
        close.setText("Close");
        close.setGravity(Gravity.CENTER);
        close.setTextColor(0xFFE0E0E0);
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        close.setPadding(0, dp(14), 0, dp(14));
        GradientDrawable closeBg = new GradientDrawable();
        closeBg.setCornerRadius(dp(12));
        closeBg.setStroke(dp(1), 0xFF3A3A3A);
        close.setBackground(closeBg);
        LinearLayout.LayoutParams closeLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        closeLp.topMargin = dp(14);
        close.setLayoutParams(closeLp);
        close.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { dismiss(); }
        });
        root.addView(close);

        setContentView(root);
        if (window != null) {
            window.setLayout(
                    Math.min(getContext().getResources().getDisplayMetrics().widthPixels - dp(44), dp(420)),
                    ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private void openCustom() {
        int start = AccentPresets.previewColor(getContext(), currentKey, currentHex);
        new HexPickerDialog(getContext(), start, new HexPickerDialog.OnPicked() {
            @Override public void onPicked(int argb) {
                if (callback != null) {
                    callback.onChosen(AccentPresets.CUSTOM, String.format("#%06X", argb & 0xFFFFFF));
                }
                dismiss();
            }
        }).show();
    }

    private View card(String label, int argb, boolean selected, View.OnClickListener onClick) {
        argb = 0xFF000000 | argb;
        LinearLayout row = new LinearLayout(getContext());
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackground(round(argb, dp(16)));
        row.setPadding(dp(18), dp(20), dp(18), dp(20));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(12);
        row.setLayoutParams(lp);
        row.setOnClickListener(onClick);

        int onColor = AccentPresets.isLight(argb) ? 0xFF141414 : 0xFFFFFFFF;

        TextView name = new TextView(getContext());
        name.setText(label);
        name.setTextColor(onColor);
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        row.addView(name, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        if (selected) {
            TextView check = new TextView(getContext());
            check.setText("✓");
            check.setTextColor(onColor);
            check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
            check.setTypeface(check.getTypeface(), Typeface.BOLD);
            row.addView(check);
        }
        return row;
    }

    private GradientDrawable round(int color, int radius) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radius);
        return d;
    }

    private int dp(float v) {
        return Math.round(v * density);
    }
}
