package app.morphe.extension.twitch.adblock;

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
 * AD BLOCK section of the SEYTTINGS dialog. Discovered through reflection by
 * the base SEYTTINGS extension, so it only appears when the AD BLOCK patch was
 * applied as well.
 */
public final class AdBlockSection implements SeyttingsSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        AdBlockPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("AD BLOCK");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Block Twitch ads");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(AdBlockPrefs.isEnabled());
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
        hint.setText("Filters stitched ad segments out of the stream and, while a "
                + "break is running, plays the same broadcast from an ad-free player "
                + "type. If no clean stream is available the player waits on the last "
                + "live frame instead of showing the ad. Takes effect on the next "
                + "playlist refresh.");
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
                AdBlockPrefs.setEnabled(enabled);
                status.setText(valueText());
                AdBlockInjector.setEnabled(enabled);
            }
        });
    }

    private static String valueText() {
        return AdBlockPrefs.isEnabled()
                ? "Enabled: ad segments are filtered from the HLS stream."
                : "Disabled: Twitch plays ads normally.";
    }
}
