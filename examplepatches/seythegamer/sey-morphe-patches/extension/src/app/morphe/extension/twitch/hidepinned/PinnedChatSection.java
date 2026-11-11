package app.morphe.extension.twitch.hidepinned;

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
 * HIDE PINNED section of the SEYTTINGS dialog. Discovered through reflection by
 * the base SEYTTINGS extension, so it only appears when the HIDE PINNED patch
 * was applied as well.
 */
public final class PinnedChatSection implements SeyttingsSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        PinnedChatPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("HIDE PINNED");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Hide pinned message cards");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(PinnedChatPrefs.isHidePinnedEnabled());
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
        hint.setText("Removes the pinned message card above the chat together "
                + "with its \"Pinned by\" label, pin badge and any pinned "
                + "highlight in the message list. The space goes back to the "
                + "chat. Changes apply immediately.");
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
                PinnedChatPrefs.setHidePinnedEnabled(enabled);
                status.setText(valueText());
                PinnedChatInjector.setEnabled(enabled);
            }
        });
    }

    private static String valueText() {
        return PinnedChatPrefs.isHidePinnedEnabled()
                ? "Enabled: pinned message cards are hidden."
                : "Disabled: Twitch shows the pinned message card.";
    }
}
