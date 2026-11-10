package app.morphe.extension.kicktv.chatexpand;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.view.View;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * EXPAND CHAT section of the SEYTTINGS dialog. It is discovered by the base
 * SEYTTINGS extension through reflection, so it only appears when the
 * EXPAND CHAT patch was applied.
 */
public final class ChatExpandSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("EXPAND CHAT");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Hide the \"Join the Chat\" footer");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(ChatExpandPrefs.isChatExpandEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("The chat fills the freed space. Changes apply the next time you open the chat.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(13);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        enable.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ChatExpandPrefs.setChatExpandEnabled(enable.isChecked());
            }
        });
    }
}
