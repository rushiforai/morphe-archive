package app.morphe.extension.kicktv.chatbackground;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * CHAT BACKGROUND section of the SEYTTINGS dialog. Discovered through reflection
 * by the base SEYTTINGS extension, so it only appears when the CHAT BACKGROUND
 * patch was applied as well.
 */
public final class ChatBackgroundSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        ChatBackgroundPrefs.init(activity);

        TextView header = new TextView(activity);
        header.setText("CHAT BACKGROUND");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Pure black (AMOLED) chat background");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(ChatBackgroundPrefs.isAmoledEnabled());
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
        hint.setText("Replaces KICK's #070809 chat background with pure black (#000000). "
                + "Applies the next time the chat panel is composed.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(12);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        enable.setOnClickListener(v -> {
            boolean enabled = enable.isChecked();
            ChatBackgroundPrefs.setAmoledEnabled(enabled);
            status.setText(valueText());
        });
    }

    private static String valueText() {
        return ChatBackgroundPrefs.isAmoledEnabled()
                ? "Enabled: chat panel is pure black (#000000)."
                : "Disabled: KICK uses its standard #070809 chat background.";
    }
}