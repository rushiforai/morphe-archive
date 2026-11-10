package app.morphe.extension.kicktv.chat;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * CHAT SIZE section of the SEYTTINGS dialog. It is discovered by the
 * base SEYTTINGS extension through reflection, so it only appears when the
 * CHAT SIZE patch was applied.
 */
public final class ChatSizeSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("CHAT SIZE");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Resize chat in VIDEO/CHAT view");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(ChatSizePrefs.isChatResizeEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final Button sizeButton = new Button(activity);
        sizeButton.setAllCaps(false);
        sizeButton.setTextSize(18);
        sizeButton.setTextColor(MorpheTheme.COLOR_ACCENT);
        MorpheTheme.makeFocusable(activity, sizeButton);
        container.addView(sizeButton, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("Changes apply the next time you open the chat.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(13);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        final Runnable updateSizeState = new Runnable() {
            @Override
            public void run() {
                sizeButton.setText("Chat size: " + ChatSizePrefs.getChatSizeLabel());
                boolean enabled = ChatSizePrefs.isChatResizeEnabled();
                sizeButton.setEnabled(enabled);
                sizeButton.setAlpha(enabled ? 1f : 0.45f);
            }
        };

        enable.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ChatSizePrefs.setChatResizeEnabled(enable.isChecked());
                updateSizeState.run();
            }
        });

        sizeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int next = ChatSizePrefs.nextChatSizePercent(ChatSizePrefs.getChatSizePercent());
                ChatSizePrefs.setChatSizePercent(next);
                updateSizeState.run();
            }
        });

        updateSizeState.run();
    }
}
