package app.morphe.extension.twitch.amoled;

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
 * AMOLED section of the SEYTTINGS dialog. Discovered through reflection by the
 * base SEYTTINGS extension, so it only appears when the AMOLED patch was
 * applied as well.
 */
public final class AmoledSection implements SeyttingsSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        AmoledPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("AMOLED");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Pure black chat and player bars");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(AmoledPrefs.isEnabled());
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
        hint.setText("Replaces Twitch's dark greys with pure black: the chat panel "
                + "and the bars above and below the video. The colour of the "
                + "player, text and badges stays unchanged.");
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
                AmoledPrefs.setEnabled(enabled);
                status.setText(valueText());
                AmoledInjector.setEnabled(enabled);
            }
        });
    }

    private static String valueText() {
        return AmoledPrefs.isEnabled()
                ? "Enabled: chat and player bars are pure black (#000000)."
                : "Disabled: Twitch uses its standard dark greys.";
    }
}
