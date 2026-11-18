package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * Adds a "patch settings" row to the top of Twitch's own settings screen, so the settings can be
 * found where people look first. It opens the same screen as the player button.
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    private static final String LEGACY_MAIN = "tv.twitch.android.settings.main.MainSettingsFragment";
    private static boolean creatingLegacyMain;

    private SettingsEntry() {
    }

    /** Injection point: return value of the main settings screen's onCreateView. */
    public static View wrap(View settings) {
        try {
            Context context = settings.getContext();
            Text.use(context);
            LinearLayout wrapper = new LinearLayout(context);
            wrapper.setOrientation(LinearLayout.VERTICAL);
            wrapper.addView(row(context));
            View line = new View(context);
            line.setBackgroundColor(Ui.of(context).line);
            wrapper.addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, Ui.dp(context, 0.7f))));
            // Added last: if building the row failed, Twitch's view is still free to return.
            wrapper.addView(settings, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
            return wrapper;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.settings-entry", e);
            return settings;
        }
    }

    /** Injection point: start of the shared onCreateView of Twitch's list-style settings screens. */
    public static void creating(Object fragment) {
        creatingLegacyMain = fragment != null && LEGACY_MAIN.equals(fragment.getClass().getName());
    }

    /** Injection point: return value of that onCreateView. Only the main screen gets the row. */
    public static View wrapIfMain(View settings) {
        boolean main = creatingLegacyMain;
        creatingLegacyMain = false;
        return main ? wrap(settings) : settings;
    }

    /** Our own row: Twitch draws its rows in Compose now, so there is no layout of theirs to borrow. */
    private static View row(Context context) {
        Ui ui = Ui.of(context);
        String title = label("パッチの設定", "Patch settings");
        String summary = summary();
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Ui.dp(context, 64));
        row.setPadding(Ui.dp(context, 12), Ui.dp(context, 8), Ui.dp(context, 12), Ui.dp(context, 8));
        row.setBackground(ui.pressable(context, 0, 0));
        LinearLayout.LayoutParams tileLp = new LinearLayout.LayoutParams(Ui.dp(context, 32), Ui.dp(context, 32));
        tileLp.rightMargin = Ui.dp(context, 12);
        row.addView(ui.iconTile(context, Icons.Kind.SETTINGS, 0xFF9146FF, 32), tileLp);
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(ui.text(context, title, 15, ui.text, true));
        if (!summary.isEmpty()) texts.addView(ui.text(context, summary, 12, ui.secondary, false));
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.addView(ui.iconView(context, Icons.Kind.CHEVRON, ui.secondary, 20));
        row.setContentDescription(summary.isEmpty() ? title : title + label("、", ", ") + summary);
        row.setOnClickListener(v -> SettingsScreen.show(v.getContext()));
        return row;
    }

    /** Names only what was applied. */
    private static String summary() {
        StringBuilder parts = new StringBuilder();
        if (Features.ads()) join(parts, label("広告ブロック", "Ad blocking"));
        if (Features.chat()) join(parts, label("チャット", "chat"));
        if (Features.danmaku()) join(parts, label("弾幕", "danmaku"));
        if (Features.player()) join(parts, label("再生", "playback"));
        return parts.toString();
    }

    private static void join(StringBuilder parts, String part) {
        if (parts.length() > 0) parts.append(label("・", ", "));
        parts.append(part);
    }
}
