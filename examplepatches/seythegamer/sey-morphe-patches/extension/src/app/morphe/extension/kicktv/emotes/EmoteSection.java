package app.morphe.extension.kicktv.emotes;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * EMOTES section of the SEYTTINGS dialog. Discovered through reflection
 * by the base SEYTTINGS extension, so it only appears when the EMOTES patch was
 * applied as well.
 */
public final class EmoteSection implements MorpheSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("EMOTES");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 10), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final CheckBox enable = new CheckBox(activity);
        enable.setText("Show 7TV, BTTV and FFZ emotes");
        enable.setTextColor(MorpheTheme.COLOR_TEXT);
        enable.setTextSize(18);
        enable.setChecked(EmotePrefs.isEnabled());
        enable.setButtonTintList(ColorStateList.valueOf(MorpheTheme.COLOR_ACCENT));
        MorpheTheme.makeFocusable(activity, enable);
        container.addView(enable, MorpheTheme.matchWidth());

        final TextView status = new TextView(activity);
        status.setText(EmoteRepository.getSummary());
        status.setTextColor(MorpheTheme.COLOR_MUTED);
        status.setTextSize(13);
        status.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 4));
        container.addView(status, MorpheTheme.matchWidth());

        final Button reload = new Button(activity);
        reload.setAllCaps(false);
        reload.setText("Reload emotes");
        reload.setTextSize(18);
        reload.setTextColor(MorpheTheme.COLOR_ACCENT);
        MorpheTheme.makeFocusable(activity, reload);
        reload.setEnabled(EmotePrefs.isEnabled());
        reload.setAlpha(EmotePrefs.isEnabled() ? 1f : 0.45f);
        container.addView(reload, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("7TV channel emotes are used when available. BTTV and FFZ "
                + "global emotes are added because they do not provide KICK channels.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(12);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 6),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable refresh = new Runnable() {
            @Override
            public void run() {
                status.setText(EmoteRepository.getSummary());
            }
        };

        enable.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean enabled = enable.isChecked();
                EmotePrefs.setEnabled(enabled);
                reload.setEnabled(enabled);
                reload.setAlpha(enabled ? 1f : 0.45f);
                if (enabled) {
                    EmoteRepository.ensureStarted();
                }
            }
        });

        reload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                status.setText("Reloading...");
                EmoteRepository.reload();
                handler.removeCallbacks(refresh);
                handler.postDelayed(refresh, 4000);
            }
        });
    }
}
