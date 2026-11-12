package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.LinearLayout;

/** Independent recognition settings for gestures that stay on one axis. */
final class GestureAxisOptions {
    private static final String HORIZONTAL = "gesture_horizontal_reversal_enabled";

    static boolean allowHorizontalClaim(Context context, String pattern) {
        if (pattern == null || pattern.length() < 2) return true;
        for (int i = 0; i < pattern.length(); i++) {
            char direction = pattern.charAt(i);
            if (direction != 'L' && direction != 'R') return true;
        }
        return GestureControls110.prefs(context).getBoolean(HORIZONTAL, true);
    }

    static void reset(Context context) {
        GestureControls110.prefs(context).edit().remove(Dev128.KEY).remove(HORIZONTAL).apply();
    }

    static void install(Activity activity, LinearLayout box) {
        if (activity == null || box == null || activity.isFinishing()) return;
        Context context = box.getContext();
        addOption(box, Dev128.KEY, false,
                PanelUi.tr(context, "上下方向のみのジェスチャーを認識",
                        "Recognize vertical-only gestures", "辨識僅上下方向的手勢"),
                PanelUi.tr(context,
                        "OFFにすると、↑↓などの上下だけの動きではジェスチャーが発動せず、スクロールを続けられます",
                        "When off, vertical-only movements such as ↑↓ allow scrolling to continue",
                        "關閉後，↑↓ 等僅上下的動作會繼續捲動"));
        addOption(box, HORIZONTAL, true,
                PanelUi.tr(context, "左右方向のみのジェスチャーを認識",
                        "Recognize horizontal-only gestures", "辨識僅左右方向的手勢"),
                PanelUi.tr(context,
                        "OFFにすると、←→などの左右だけの動きではジェスチャーが発動せず、通常の横スワイプ操作を続けられます",
                        "When off, horizontal-only movements such as ←→ allow normal horizontal swipes to continue",
                        "關閉後，←→ 等僅左右的動作會繼續一般的橫向滑動"));
    }

    private static void addOption(LinearLayout box, String key, boolean initial,
                                  String label, String description) {
        Context context = box.getContext();
        SharedPreferences preferences = GestureControls110.prefs(context);
        LinearLayout row = NicoliveUi.row(context);
        CheckBox option = new CheckBox(context);
        option.setText(label);
        option.setChecked(preferences.getBoolean(key, initial));
        option.setOnCheckedChangeListener((button, checked) ->
                preferences.edit().putBoolean(key, checked).apply());
        PanelUi.tint(option);
        row.addView(option, new LinearLayout.LayoutParams(0, -2, 1));

        ImageButton note = NicoliveUi.icon(context, "note", PanelUi.tr(context,
                label + "の説明", "About " + label, label + "的說明"));
        note.setOnClickListener(v -> UiDialogs.show(UiDialogs.builder(context)
                .setTitle(label).setMessage(description)
                .setPositiveButton(android.R.string.ok, null).create()));
        int size = PanelUi.dp(context, 44);
        row.addView(note, new LinearLayout.LayoutParams(size, size));
        box.addView(row);
    }
}
