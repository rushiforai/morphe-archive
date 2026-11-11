package app.morphe.extension.kicktv.maturewarning;

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
 * SKIP 18+ WARNING section of the SEYTTINGS dialog. It is discovered by the
 * base SEYTTINGS extension through reflection, so it only appears when the
 * SKIP 18+ WARNING patch was applied.
 */
public final class MatureWarningSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("SKIP 18+ WARNING");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Auto-accept the mature content warning");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(MatureWarningPrefs.isAutoAcceptEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("The 18+ warning is accepted automatically, so a mature stream "
                + "starts without the extra click. Changes apply the next time you "
                + "open a stream.");
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
                MatureWarningPrefs.setAutoAcceptEnabled(enable.isChecked());
            }
        });
    }
}
