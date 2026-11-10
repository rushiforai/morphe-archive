package app.morphe.extension.twitch.expandchat;

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
 * CHAT section of the SEYTTINGS dialog. Discovered through reflection by the
 * base SEYTTINGS extension, so it only appears when the EXPAND CHAT patch was
 * applied as well.
 */
public final class ExpandChatSection implements SeyttingsSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        ExpandChatPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("CHAT");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Hide the Join the conversation button");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(ExpandChatPrefs.isEnabled());
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
        hint.setText("Removes the footer under the chat so the newest messages "
                + "reach the bottom of the panel.");
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
                ExpandChatPrefs.setEnabled(enabled);
                status.setText(valueText());
                ExpandChatInjector.setEnabled(enabled);
            }
        });
    }

    private static String valueText() {
        return ExpandChatPrefs.isEnabled()
                ? "Hidden: chat uses the full panel height."
                : "Visible: the footer button is shown again.";
    }
}
