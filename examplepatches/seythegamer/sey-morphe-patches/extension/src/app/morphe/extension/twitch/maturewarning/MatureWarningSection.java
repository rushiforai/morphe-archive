package app.morphe.extension.twitch.maturewarning;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.view.View;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.twitch.base.MorpheTheme;
import app.morphe.extension.twitch.base.SeyttingsSection;

/**
 * SKIP 18+ WARNING section of the SEYTTINGS dialog. Discovered through
 * reflection by the base SEYTTINGS extension, so it only appears when the
 * SKIP 18+ WARNING patch was applied as well.
 */
public final class MatureWarningSection implements SeyttingsSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        MatureWarningPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("SKIP 18+ WARNING");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Auto-accept the mature content warning");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(MatureWarningPrefs.isEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final TextView status = new TextView(activity);
        status.setText(valueText());
        status.setTextColor(MorpheTheme.COLOR_MUTED);
        status.setTextSize(13);
        status.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 4));
        container.addView(status, MorpheTheme.matchWidth());

        TextView hint = new TextView(activity);
        hint.setText("Clicks the confirmation button of the 18+ mature content "
                + "warning, so a mature stream starts without the extra click. "
                + "Changes apply the next time the warning appears.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(12);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        enable.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean enabled = enable.isChecked();
                MatureWarningPrefs.setEnabled(enabled);
                status.setText(valueText());
                MatureWarningInjector.setEnabled(enabled);
            }
        });
    }

    private static String valueText() {
        return MatureWarningPrefs.isEnabled()
                ? "Enabled: the mature content warning is accepted automatically."
                : "Disabled: Twitch shows the mature content warning.";
    }
}
