/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.kljjh.flymelyrics;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.util.Pair;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.CheckBox;
import app.morphe.extension.shared.theme.ThemeUtils;
import java.util.ArrayList;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import app.morphe.extension.shared.ui.CustomDialog;
import static android.view.ViewGroup.LayoutParams.MATCH_PARENT;
import static android.view.ViewGroup.LayoutParams.WRAP_CONTENT;


@SuppressWarnings("deprecation")
public final class FlymePreference {
    public static void install(PreferenceFragment fragment) {
        PreferenceScreen root = fragment.getPreferenceScreen();
        if (root == null || root.findPreference(FlymeController.KEY) != null) return;
        Preference mini = root.findPreference("morphe_music_lyrics_miniplayer");
        Preference miniTiming = root.findPreference("morphe_music_lyrics_mini_next_offset_ms");
        PreferenceGroup parent = parentOf(root, mini);
        PreferenceGroup timingParent = parentOf(root, miniTiming);
        if (parent == null || timingParent == null) return;
        Context c = parent.getContext();
        SwitchPreference toggle = new SwitchPreference(c);
        boolean zh = "zh".equals(c.getResources().getConfiguration().getLocales().get(0).getLanguage());
        matchRow(toggle, mini);
        toggle.setKey(FlymeController.KEY);
        toggle.setPersistent(false);
        toggle.setTitle(zh ? "魅族状态栏歌词" : "Flyme status bar lyrics");
        toggle.setSummary(zh ? "在状态栏显示当前歌词。" : "Show the current lyric in the status bar.");
        toggle.setChecked(FlymeController.enabled(c));
        toggle.setOnPreferenceChangeListener((pref, value) -> { FlymeController.setEnabled(c, Boolean.TRUE.equals(value)); return true; });
        insertAfter(parent, mini, toggle);
        Preference offset = new Preference(c);
        matchRow(offset, miniTiming);
        offset.setKey(FlymeTiming.KEY);
        offset.setPersistent(false);
        offset.setTitle(zh ? "状态栏歌词时间偏移" : "Status bar lyric timing");
        offset.setSummary(summary(c, zh));
        offset.setOnPreferenceClickListener(pref -> {
            showTimingDialog(offset, zh);
            return true;
        });
        insertAfter(timingParent, miniTiming, offset);
    }
    // PreferenceGroup breaks order ties by title, which varies with the UI language.
    // Reserve actual positions within this category while preserving sibling order.
    private static void insertAfter(PreferenceGroup group, Preference anchor, Preference... rows) {
        ArrayList<Preference> ordered = new ArrayList<>();
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference child = group.getPreference(i);
            ordered.add(child);
            if (child == anchor) java.util.Collections.addAll(ordered, rows);
        }
        for (int i = 0; i < ordered.size(); i++) ordered.get(i).setOrder(i);
        for (Preference row : rows) group.addPreference(row);
    }
    // Use the active official layout and icon variant, including icon-free preferences.
    private static void matchRow(Preference row, Preference example) {
        if (example == null) return;
        row.setLayoutResource(example.getLayoutResource());
        row.setWidgetLayoutResource(example.getWidgetLayoutResource());
        Drawable icon = example.getIcon();
        if (icon != null && icon.getConstantState() != null)
            row.setIcon(icon.getConstantState().newDrawable(row.getContext().getResources()).mutate());
        row.setOrder(example.getOrder());
    }

    // Adapted from Morphe SeekBarPreference (GPL-3.0, see NOTICE).
    private static void showTimingDialog(Preference pref, boolean zh) {
        Context c = pref.getContext();
        int saved = FlymeTiming.manual(c);
        int gap = Math.round(8 * c.getResources().getDisplayMetrics().density);
        TypedValue themeColor = new TypedValue();
        c.getTheme().resolveAttribute(android.R.attr.colorAccent, themeColor, true);
        ColorStateList accent = ColorStateList.valueOf(themeColor.data);

        TextView value = new TextView(c);
        value.setGravity(Gravity.CENTER);
        value.setTextColor(accent);
        value.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        SeekBar slider = new SeekBar(c);
        slider.setContentDescription(pref.getTitle());
        slider.setMax(2 * FlymeTiming.LIMIT / FlymeTiming.STEP);
        slider.setProgressTintList(accent);
        slider.setThumbTintList(accent);
        slider.setProgress(progress(saved));
        value.setText(sliderValue(slider) + "ms");
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int pos, boolean user) { value.setText(sliderValue(bar) + "ms"); }
            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });
        LinearLayout center = new LinearLayout(c);
        center.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(MATCH_PARENT, WRAP_CONTENT);
        labelParams.topMargin = labelParams.bottomMargin = gap;
        center.addView(value, labelParams);
        center.addView(slider, MATCH_PARENT, WRAP_CONTENT);
        LinearLayout row = new LinearLayout(c);
        row.setGravity(Gravity.BOTTOM);
        row.addView(endpoint(c, -FlymeTiming.LIMIT));
        LinearLayout.LayoutParams middle = new LinearLayout.LayoutParams(0, WRAP_CONTENT, 1f);
        middle.setMarginStart(gap);
        middle.setMarginEnd(gap);
        row.addView(center, middle);
        row.addView(endpoint(c, FlymeTiming.LIMIT));

        LinearLayout content = new LinearLayout(c);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, gap, 0, gap);
        final int foreground = ThemeUtils.getAppForegroundColor();
        CheckBox follow = new CheckBox(c);
        follow.setText(zh ? "跟随 MediaSession 时间偏移" : "Follow MediaSession timing");
        follow.setTextColor(foreground);
        follow.setButtonTintList(ColorStateList.valueOf(foreground));
        follow.setChecked(FlymeTiming.follows(c));
        TextView hint = new TextView(c);
        hint.setText(zh ? "勾选：使用迷你播放器和媒体会话的偏移值。取消勾选：用下方滑块单独调整状态栏歌词。"
                : "Checked: use the mini-player and media session offset. Unchecked: adjust status bar lyrics with the slider below.");
        hint.setTextColor(foreground);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        hint.setPadding(0, 0, 0, gap);
        slider.setEnabled(!follow.isChecked());
        row.setAlpha(follow.isChecked() ? 0.5f : 1f);
        follow.setOnCheckedChangeListener((button, checked) -> {
            slider.setEnabled(!checked);
            row.setAlpha(checked ? 0.5f : 1f);
        });
        content.addView(follow, MATCH_PARENT, WRAP_CONTENT);
        content.addView(hint, MATCH_PARENT, WRAP_CONTENT);
        content.addView(row, MATCH_PARENT, WRAP_CONTENT);
        Pair<Dialog, LinearLayout> dialog = CustomDialog.create(c, pref.getTitle(), null, null, null,
                () -> {
                    FlymeTiming.configure(c, follow.isChecked(), sliderValue(slider));
                    pref.setSummary(summary(c, zh));
                },
                () -> {}, zh ? "重置" : "Reset", () -> {
                    follow.setChecked(true);
                    slider.setProgress(progress(FlymeTiming.DEFAULT));
                }, false);
        dialog.second.addView(content, 1);
        dialog.first.show();
    }
    private static int progress(int ms) { return (ms + FlymeTiming.LIMIT) / FlymeTiming.STEP; }
    private static int sliderValue(SeekBar bar) { return bar.getProgress() * FlymeTiming.STEP - FlymeTiming.LIMIT; }
    private static TextView endpoint(Context c, int ms) {
        TextView label = new TextView(c);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        label.setTextColor(ThemeUtils.getAppForegroundColor());
        label.setText(ms + "ms");
        return label;
    }
    private static String summary(Context c, boolean zh) {
        return FlymeTiming.follows(c) ? (zh ? "跟随 MediaSession 时间偏移" : "Following MediaSession timing")
                : timingLabel(FlymeTiming.manual(c), zh);
    }
    private static String timingLabel(int ms, boolean zh) {
        if (ms == 0) return zh ? "0 ms（无偏移）" : "0 ms (no offset)";
        return (ms > 0 ? "+" : "") + ms + " ms" + (zh ? (ms < 0 ? "（提前）" : "（延后）") : (ms < 0 ? " (early)" : " (late)"));
    }
    // Official unsorted categories can have a suffix in their key. Locate the actual parent.
    private static PreferenceGroup parentOf(PreferenceGroup group, Preference target) {
        if (target == null) return null;
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference item = group.getPreference(i);
            if (item == target) return group;
            if (item instanceof PreferenceGroup) {
                PreferenceGroup found = parentOf((PreferenceGroup) item, target);
                if (found != null) return found;
            }
        }
        return null;
    }
    private FlymePreference() { }
}
