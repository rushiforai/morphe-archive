package app.morphe.extension.kicktv.chattext;

import android.app.Activity;
import android.graphics.Typeface;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * CHAT TEXT SIZE section of the SEYTTINGS dialog. It is discovered by the
 * base SEYTTINGS extension through reflection, so it only appears when the
 * CHAT TEXT SIZE patch was applied.
 */
public final class ChatTextSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("CHAT TEXT SIZE");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final Button sizeButton = new Button(activity);
        sizeButton.setAllCaps(false);
        sizeButton.setTextSize(18);
        sizeButton.setTextColor(MorpheTheme.COLOR_ACCENT);
        MorpheTheme.makeFocusable(activity, sizeButton);
        container.addView(sizeButton, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("Stock KICK chat is 11 sp. Restart KICK after changing this.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(13);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        final Runnable updateState = new Runnable() {
            @Override
            public void run() {
                sizeButton.setText("Chat text: "
                        + ChatTextPrefs.getSizeLabel(ChatTextPrefs.getSizeSp()));
            }
        };

        sizeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int next = ChatTextPrefs.nextSizeSp(ChatTextPrefs.getSizeSp());
                ChatTextPrefs.setSizeSp(next);
                updateState.run();
            }
        });

        updateState.run();
    }
}
