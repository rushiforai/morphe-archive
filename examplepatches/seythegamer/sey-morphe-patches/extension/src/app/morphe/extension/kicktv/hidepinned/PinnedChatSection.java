package app.morphe.extension.kicktv.hidepinned;

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
 * HIDE PINNED section of the SEYTTINGS dialog. It is discovered by the base
 * SEYTTINGS extension through reflection, so it only appears when the
 * HIDE PINNED patch was applied.
 */
public final class PinnedChatSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("HIDE PINNED");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Hide the pinned message card");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(PinnedChatPrefs.isHidePinnedEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("Removes the pinned message and the ad banner attached to it "
                + "from the top of the chat. Changes apply the next time you open "
                + "the chat.");
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
                PinnedChatPrefs.setHidePinnedEnabled(enable.isChecked());
            }
        });
    }
}
