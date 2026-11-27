package app.morphe.extension.kicktv.chatsplit;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * DEFAULT SPLIT VIEW section of the SEYTTINGS dialog. Discovered through
 * reflection by the base SEYTTINGS extension.
 */
public final class ChatSplitSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("DEFAULT SPLIT VIEW");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Open streams in video/chat split view");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(ChatSplitPrefs.isEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        TextView hint = new TextView(activity);
        hint.setText("By default KICK opens a stream with a small overlay chat. "
                + "Turn this on to start in video/chat split view instead. "
                + "A chat mode you pick yourself in the app still wins.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(12);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        enable.setOnClickListener(v -> ChatSplitPrefs.setEnabled(enable.isChecked()));
    }
}