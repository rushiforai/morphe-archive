package e.e.a;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.view.View;
import android.view.Gravity;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;
import java.util.Arrays;

public final class AmbientSettings {
    private static final String KEY = "nicoid_ambient_settings";
    private static final String[] LABELS = {"強さ", "広がり", "ぼかし", "明るさ", "コントラスト",
            "彩度", "鮮やかさ", "追従速度", "更新頻度", "サンプル解像度"};
    private static final String[] EN = {"Intensity", "Spread", "Softness", "Brightness", "Contrast",
            "Saturation", "Vibrance", "Response speed", "Update rate", "Sampling resolution"};
    private static final String[] ZH = {"強度", "擴散", "柔化", "亮度", "對比", "飽和度", "鮮豔度", "反應速度", "更新頻率", "取樣解析度"};

    private AmbientSettings() {}

    public static void install(PreferenceActivity a) {
        Preference anchor = a.findPreference("mobile_quality_mode");
        if (anchor == null || a.findPreference(KEY) != null) return;
        PreferenceGroup parent = parent(a.getPreferenceScreen(), anchor);
        if (parent == null) return;
        Preference[] rows = new Preference[parent.getPreferenceCount()];
        for (int i = 0; i < rows.length; i++) rows[i] = parent.getPreference(i);
        for (int i = 0; i < rows.length; i++) rows[i].setOrder(i * 10);
        SharedPreferences p = AmbientLight.prefs(a);
        Entry item = new Entry(a, p);
        item.setKey(KEY);
        item.setOrder(anchor.getOrder() + 1);
        item.setTitle(AmbientLight.title(a));
        item.setOnPreferenceClickListener(ignored -> {
            open(a, p, item::summary);
            return true;
        });
        parent.addPreference(item);
    }

    private static final class Entry extends Preference implements SharedPreferences.OnSharedPreferenceChangeListener {
        private final SharedPreferences prefs;
        Entry(Context c, SharedPreferences prefs) {
            super(c);
            this.prefs = prefs;
            setPersistent(false);
            summary();
            prefs.registerOnSharedPreferenceChangeListener(this);
        }
        void summary() {
            setSummary((AmbientLight.enabled(prefs) ? "ON" : "OFF")
                    + Dev112.tr(getContext(), "：動画の色に合わせて、映像の周りをやわらかく照らします",
                    ": Softly lights the area around the video using its colors.", "：依影片色彩柔和照亮影片周圍"));
        }
        @Override public void onSharedPreferenceChanged(SharedPreferences p, String key) {
            if (key == null || AmbientLight.ENABLED.equals(key)) summary();
        }
    }

    private static PreferenceGroup parent(PreferenceGroup root, Preference anchor) {
        if (root == null) return null;
        for (int i = 0; i < root.getPreferenceCount(); i++) {
            Preference child = root.getPreference(i);
            if (child == anchor) return root;
            if (child instanceof PreferenceGroup) {
                PreferenceGroup found = parent((PreferenceGroup) child, anchor);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void open(PreferenceActivity a, SharedPreferences p, Runnable summary) {
        AlertDialog.Builder builder = Dev112.builder(a);
        Editor editor = new Editor(a, builder.getContext(), p);
        Dev112.show(builder.setTitle(AmbientLight.title(a)).setView(editor.scroll)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    editor.save(p);
                    summary.run();
                }).create());
    }

    private static final class Editor {
        final Context c;
        final ColorStateList tint;
        final int[] values;
        final ScrollView scroll;
        final LinearLayout column;
        final CheckBox enabled;
        final CheckBox[] modes = new CheckBox[3], sides = new CheckBox[4];
        final SeekBar[] bars = new SeekBar[LABELS.length];
        final TextView[] captions = new TextView[LABELS.length];
        final Spinner presets;
        final Preview preview;
        int selection;

        Editor(PreferenceActivity activity, Context c, SharedPreferences p) {
            this.c = c;
            tint = ColorStateList.valueOf(AmbientLight.accent(c));
            values = AmbientLight.values(p);
            selection = preset();
            column = new LinearLayout(c);
            column.setOrientation(LinearLayout.VERTICAL);
            column.setPadding(dp(20), 0, dp(20), dp(12));
            scroll = new ScrollView(c);
            scroll.addView(column);
            enabled = check(column, tr("アンビエントモードを使用", "Enable ambient mode", "啟用環境光"),
                    AmbientLight.enabled(p));
            preview = new Preview(c);
            preview.setContentDescription(tr("光のプレビュー", "Light preview", "光效預覽"));
            column.addView(preview, new LinearLayout.LayoutParams(-1, dp(126)));
            label(column, tr("プリセット", "Preset", "預設"));
            presets = new Spinner(c);
            String[] names = {tr("省電力", "Power saving", "省電"), tr("控えめ", "Subtle", "柔和"),
                    tr("標準", "Standard", "標準"), tr("鮮やか", "Vivid", "鮮豔"), tr("カスタム", "Custom", "自訂")};
            ArrayAdapter<String> options = new ArrayAdapter<>(c, android.R.layout.simple_spinner_item, names);
            options.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
            presets.setAdapter(options);
            presets.setSelection(selection, false);
            column.addView(presets, new LinearLayout.LayoutParams(-1, -2));
            label(column, tr("適用する再生モード", "Playback modes", "播放模式"));
            String[] modeNames = {tr("通常再生", "Normal", "一般"), tr("全画面", "Fullscreen", "全螢幕"),
                    tr("ポップアップ", "Popup", "彈出視窗")};
            LinearLayout mainModes = row(column);
            modes[0] = option(mainModes, modeNames[0], AmbientLight.appliesTo(p, AmbientLight.NORMAL));
            modes[1] = option(mainModes, modeNames[1], AmbientLight.appliesTo(p, AmbientLight.FULL));
            LinearLayout popupMode = row(column);
            modes[2] = check(popupMode, modeNames[2], AmbientLight.appliesTo(p, AmbientLight.POPUP));
            TextView note = new TextView(c);
            note.setText("ⓘ");
            note.setTextSize(18);
            note.setTextColor(AmbientLight.accent(c));
            note.setGravity(Gravity.CENTER);
            note.setContentDescription(tr("ポップアップの描画について", "About the popup light", "關於彈出視窗光效"));
            note.setFocusable(true);
            note.setOnClickListener(v -> Dev112.show(Dev112.builder(activity)
                    .setTitle(modeNames[2])
                    .setMessage(tr("光は小窓の内側の縁に表示します。窓の外側には広がらず、広がりの設定も小窓に合わせて抑えられます。",
                            "The light appears along the inside edge of the popup. It stays within the window, so its spread is limited.",
                            "光效顯示在彈出視窗的內側邊緣，不會擴散到視窗之外，擴散幅度也會受到限制。"))
                    .setPositiveButton(android.R.string.ok, null).create()));
            popupMode.addView(note, new LinearLayout.LayoutParams(dp(44), dp(44)));
            for (int i = 0; i < 3; i++) slider(column, i);
            CheckBox advanced = check(column, tr("詳細設定を表示", "Show advanced settings", "顯示進階設定"), false);
            LinearLayout detail = new LinearLayout(c);
            detail.setOrientation(LinearLayout.VERTICAL);
            column.addView(detail);
            detail.setVisibility(View.GONE);
            advanced.setOnCheckedChangeListener((button, checked) -> detail.setVisibility(checked ? View.VISIBLE : View.GONE));
            for (int i = 3; i < LABELS.length; i++) slider(detail, i);
            label(detail, tr("光を表示する方向", "Light directions", "光效方向"));
            String[] directions = {tr("上", "Top", "上"), tr("下", "Bottom", "下"),
                    tr("左", "Left", "左"), tr("右", "Right", "右")};
            int mask = p.getInt(AmbientLight.PREFIX + "sides", 15);
            LinearLayout directionRow = row(detail);
            for (int i = 0; i < sides.length; i++) {
                sides[i] = option(directionRow, directions[i], (mask & (1 << i)) != 0);
                sides[i].setOnCheckedChangeListener((button, checked) -> preview.invalidate());
            }
            enabled.setOnCheckedChangeListener((button, checked) -> preview.invalidate());
            presets.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                @Override public void onNothingSelected(AdapterView<?> parent) {}
                @Override public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                    if (selection == position) return;
                    selection = position;
                    if (position >= AmbientLight.PRESETS.length) return;
                    System.arraycopy(AmbientLight.PRESETS[position], 0, values, 0, values.length);
                    for (int i = 0; i < bars.length; i++) {
                        bars[i].setProgress(values[i] - AmbientLight.MIN[i]);
                        caption(i);
                    }
                    preview.invalidate();
                }
            });
        }

        int preset() {
            for (int i = 0; i < AmbientLight.PRESETS.length; i++)
                if (Arrays.equals(values, AmbientLight.PRESETS[i])) return i;
            return AmbientLight.PRESETS.length;
        }

        void save(SharedPreferences p) {
            SharedPreferences.Editor e = p.edit().putBoolean(AmbientLight.ENABLED, enabled.isChecked())
                    .putInt(AmbientLight.PREFIX + "sides", mask());
            for (int i = 0; i < modes.length; i++) e.putBoolean(AmbientLight.PREFIX + "mode_" + i, modes[i].isChecked());
            for (int i = 0; i < values.length; i++) e.putInt(AmbientLight.PREFIX + AmbientLight.KEYS[i], values[i]);
            e.apply();
        }

        int mask() {
            int mask = 0;
            for (int i = 0; i < sides.length; i++) if (sides[i] != null && sides[i].isChecked()) mask |= 1 << i;
            return mask;
        }

        void slider(LinearLayout parent, int i) {
            captions[i] = label(parent, "");
            caption(i);
            SeekBar bar = new SeekBar(c);
            bar.setTag("nicoid-managed-input");
            bar.setThumbTintList(tint);
            bar.setProgressTintList(tint);
            bar.setMax(AmbientLight.MAX[i] - AmbientLight.MIN[i]);
            bar.setProgress(values[i] - AmbientLight.MIN[i]);
            parent.addView(bar);
            bars[i] = bar;
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override public void onStartTrackingTouch(SeekBar b) {}
                @Override public void onStopTrackingTouch(SeekBar b) {}
                @Override public void onProgressChanged(SeekBar b, int progress, boolean fromUser) {
                    if (!fromUser) return;
                    values[i] = progress + AmbientLight.MIN[i];
                    selection = preset();
                    presets.setSelection(selection, false);
                    caption(i);
                    preview.invalidate();
                }
            });
        }

        void caption(int i) {
            String value = values[i] + (i == 1 ? " dp" : i == 8 ? " fps" : i == 9 ? " × " + values[i] + " px" : "%");
            String name = tr(LABELS[i], EN[i], ZH[i]);
            captions[i].setText(name + "  " + value);
            if (bars[i] != null) bars[i].setContentDescription(name);
        }

        LinearLayout row(LinearLayout parent) {
            LinearLayout row = new LinearLayout(c);
            row.setGravity(Gravity.CENTER_VERTICAL);
            parent.addView(row, new LinearLayout.LayoutParams(-1, -2));
            return row;
        }

        CheckBox option(LinearLayout row, String text, boolean checked) {
            CheckBox box = check(row, text, checked);
            box.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 1));
            return box;
        }

        CheckBox check(LinearLayout parent, String title, boolean checked) {
            CheckBox box = new CheckBox(c);
            box.setText(title);
            box.setButtonTintList(tint);
            box.setChecked(checked);
            parent.addView(box);
            return box;
        }

        TextView label(LinearLayout parent, String text) {
            TextView label = new TextView(c);
            label.setText(text);
            label.setPadding(0, dp(8), 0, dp(2));
            parent.addView(label);
            return label;
        }

        String tr(String ja, String en, String zh) { return Dev112.tr(c, ja, en, zh); }
        int dp(int n) { return Math.round(c.getResources().getDisplayMetrics().density * n); }

        private final class Preview extends View {
            final AmbientLight.Glow glow = new AmbientLight.Glow();
            final Paint paint = new Paint();
            final int[] sample = {0xff2e8bd1, 0xff427dbc, 0xffc65f30, 0xffee9c4d};
            Preview(Context c) { super(c); }
            @Override protected void onDraw(Canvas canvas) {
                int inset = getWidth() / 5;
                glow.video.set(inset, getHeight() / 5, getWidth() - inset, getHeight() * 4 / 5);
                glow.setBounds(0, 0, getWidth(), getHeight());
                for (int i = 0; i < sample.length; i++) {
                    int color = AmbientLight.adjust(sample[i], values);
                    glow.colors[i] = color;
                    glow.colors[4 + i] = color;
                    glow.colors[8 + i] = AmbientLight.adjust(sample[0], values);
                    glow.colors[12 + i] = AmbientLight.adjust(sample[3], values);
                }
                glow.sides = mask();
                glow.spread = dp(values[1]);
                glow.softness = values[2];
                glow.alpha = enabled.isChecked() ? values[0] * 180 / 100 : 0;
                canvas.drawColor(0xff14161a);
                glow.draw(canvas);
                float step = glow.video.width() / 4f;
                for (int i = 0; i < sample.length; i++) {
                    paint.setColor(sample[i] | Color.BLACK);
                    canvas.drawRect(glow.video.left + i * step, glow.video.top,
                            glow.video.left + (i + 1) * step, glow.video.bottom, paint);
                }
            }
        }
    }
}
