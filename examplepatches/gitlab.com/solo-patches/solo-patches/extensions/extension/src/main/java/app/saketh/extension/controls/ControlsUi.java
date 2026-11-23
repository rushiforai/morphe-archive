package app.saketh.extension.controls;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import app.saketh.extension.fonts.FontHooks;
import app.saketh.extension.theme.ThemeHooks;
import java.util.function.Consumer;

final class ControlsUi {
    final Context context;
    final int background, surface, text, muted, border, accent, accentSurface;

    ControlsUi(Context context, boolean dark) {
        this.context = context;
        background = color("neutral_surface", dark ? 0xff0d0d10 : 0xfff4f5f7);
        surface = color("neutral_surface_medium", dark ? 0xff19191e : Color.WHITE);
        text = color("neutral_content", dark ? 0xfff5f5f7 : 0xff1c1c20);
        muted = dark ? 0xffb3b3bf : 0xff595963;
        border = dark ? 0xff33333c : 0xffdedee5;
        accent = color("primary_content", dark ? 0xff28fff2 : 0xff006a62);
        accentSurface = blend(surface, accent, dark ? 0.14f : 0.08f);
    }

    int dp(int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }

    private int color(String name, int original) {
        int id = context.getResources().getIdentifier(name, "color", context.getPackageName());
        return id == 0 ? original : ThemeHooks.color(context, id, original);
    }

    LinearLayout column() {
        LinearLayout view = new LinearLayout(context);
        view.setOrientation(LinearLayout.VERTICAL);
        return view;
    }

    LinearLayout card(LinearLayout parent) {
        LinearLayout card = column();
        card.setBackground(shape(surface, border, 14));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = dp(12);
        parent.addView(card, params);
        return card;
    }

    TextView text(String value, int size, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setLineSpacing(dp(2), 1f);
        if (bold) view.setTypeface(null, Typeface.BOLD);
        if (PatchSettings.installed("custom_fonts")) FontHooks.apply(view);
        return view;
    }

    void section(LinearLayout parent, String title) {
        TextView heading = text(title, 13, muted, true);
        heading.setPadding(dp(4), dp(18), 0, dp(10));
        if (android.os.Build.VERSION.SDK_INT >= 28) heading.setAccessibilityHeading(true);
        parent.addView(heading);
    }

    void divider(LinearLayout parent) {
        View line = new View(context);
        line.setBackgroundColor(border);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, dp(1));
        params.setMargins(dp(16), 0, dp(16), 0);
        parent.addView(line, params);
    }

    Button button(String label, boolean primary) {
        Button button = new Button(context);
        button.setText(label);
        button.setTextSize(13);
        button.setAllCaps(false);
        button.setTextColor(accent);
        button.setMinHeight(dp(48));
        button.setMinimumHeight(dp(48));
        button.setPadding(dp(12), dp(8), dp(12), dp(8));
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(blend(surface, accent, 0.25f)),
                shape(primary ? accentSurface : surface, primary ? accentSurface : border, 10), null));
        if (PatchSettings.installed("custom_fonts")) FontHooks.apply(button);
        return button;
    }

    Switch switchRow(LinearLayout card, String title, String summary, boolean checked, boolean enabled) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(14), dp(12), dp(14));
        LinearLayout copy = column();
        copy.addView(text(title, 16, enabled ? text : muted, true));
        TextView description = text(summary, 13, muted, false);
        description.setPadding(0, dp(5), dp(10), 0);
        copy.addView(description);
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1f));
        Switch control = new Switch(context);
        control.setContentDescription(title);
        control.setTooltipText(summary);
        control.setChecked(checked);
        control.setEnabled(enabled);
        control.setMinHeight(dp(48));
        int[][] states = {new int[]{-android.R.attr.state_enabled}, new int[]{android.R.attr.state_checked}, new int[0]};
        control.setThumbTintList(new ColorStateList(states, new int[]{muted, accent, muted}));
        control.setTrackTintList(new ColorStateList(states, new int[]{border, blend(surface, accent, 0.4f), border}));
        row.addView(control, new LinearLayout.LayoutParams(-2, dp(48)));
        row.setOnClickListener(view -> { if (control.isEnabled()) control.setChecked(!control.isChecked()); });
        card.addView(row);
        return control;
    }

    /** A tappable row with the setting's current value on the right. Clicks receive the value view. */
    TextView valueRow(LinearLayout card, String title, String summary, Consumer<TextView> click) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(56));
        row.setPadding(dp(16), dp(14), dp(16), dp(14));
        LinearLayout copy = column();
        copy.addView(text(title, 16, text, true));
        TextView description = text(summary, 13, muted, false);
        description.setPadding(0, dp(5), dp(10), 0);
        copy.addView(description);
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1f));
        TextView value = text("", 14, accent, true);
        row.addView(value);
        row.setOnClickListener(view -> click.accept(value));
        card.addView(row);
        return value;
    }

    GradientDrawable shape(int fill, int stroke, int radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(fill);
        shape.setCornerRadius(dp(radius));
        shape.setStroke(dp(1), stroke);
        return shape;
    }

    private static int blend(int base, int overlay, float amount) {
        return Color.rgb(Math.round(Color.red(base) * (1 - amount) + Color.red(overlay) * amount),
                Math.round(Color.green(base) * (1 - amount) + Color.green(overlay) * amount),
                Math.round(Color.blue(base) * (1 - amount) + Color.blue(overlay) * amount));
    }
}
