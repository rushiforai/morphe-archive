package app.morphe.extension.twitch.emotes;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.twitch.base.MorpheTheme;
import app.morphe.extension.twitch.base.SeyttingsSection;

/**
 * EMOTES section of the SEYTTINGS dialog. Discovered through reflection by the
 * base SEYTTINGS extension, so it only appears when the EMOTES patch was
 * applied as well.
 */
public final class EmoteSection implements SeyttingsSection {

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        EmotePrefs.init(activity);

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
        status.setText(valueText());
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
        setReloadEnabled(reload, EmotePrefs.isEnabled());
        container.addView(reload, MorpheTheme.matchWidth());

        TextView hint = new TextView(activity);
        hint.setText("One switch enables every provider. Channel emotes follow the "
                + "stream you are watching; global 7TV, BTTV and FFZ sets are "
                + "added automatically.");
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
                EmotePrefs.setEnabled(enabled);
                setReloadEnabled(reload, enabled);
                status.setText(valueText());
                EmoteInjector.setEnabled(enabled);
            }
        });

        reload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                status.setText("Reloading 7TV, BTTV and FFZ sets...");
                EmoteInjector.reload();
                reload.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        status.setText(valueText());
                    }
                }, 4000L);
            }
        });
    }

    private static String valueText() {
        return EmotePrefs.isEnabled()
                ? "Enabled: channel and global emotes render in chat."
                : "Disabled: chat shows plain Twitch text.";
    }

    private static void setReloadEnabled(Button reload, boolean enabled) {
        reload.setEnabled(enabled);
        reload.setAlpha(enabled ? 1f : 0.45f);
    }
}
