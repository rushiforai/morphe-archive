package dev.supperelias2.sbs.morphe;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/** Native, dependency-free settings for the installed SBS mobile patches. */
public final class MorpheSettingsActivity extends Activity {
    private static final int BACKGROUND = Color.rgb(18, 18, 23);
    private static final int SURFACE = Color.rgb(30, 30, 39);
    private static final int TEXT = Color.rgb(245, 243, 250);
    private static final int SECONDARY = Color.rgb(195, 190, 206);
    private static final int ACCENT = Color.rgb(187, 134, 252);
    private LinearLayout content;
    private ScrollView screen;
    private int controls;

    @Override
    public void onCreate(Bundle state) {
        super.onCreate(state);
        MorpheSettings.initialize(this);
        getWindow().setStatusBarColor(BACKGROUND);
        getWindow().setNavigationBarColor(BACKGROUND);
        render();
    }

    private void render() {
        final int scrollPosition = screen == null ? 0 : screen.getScrollY();
        controls = 0;
        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        screen = scroll;
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(BACKGROUND);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(20), dp(14), dp(20), dp(28));
        scroll.addView(content, new ScrollView.LayoutParams(-1, -2));

        Button back = new Button(this);
        back.setText("Back");
        back.setTextColor(ACCENT);
        back.setAllCaps(false);
        back.setOnClickListener(view -> finish());
        content.addView(back, new LinearLayout.LayoutParams(-2, dp(48)));
        text("Morphe settings", 28, TEXT, 12);
        text("Only features included in this patched app appear here. Changes are saved immediately; playback changes may apply to the next video.", 14, SECONDARY, 20);
        text("Ad removal starts enabled. If installed, the intro/recap correction also starts enabled. Other experiments start disabled and may not work with every video.", 14, ACCENT, 16);

        if (has("remove_vod_ads", "remove_live_ads")) {
            section("Advertising");
            toggle("remove_vod_ads", "Remove on-demand ads", "Skip advertising in on-demand videos.", true);
            toggle("remove_live_ads", "Remove live ads", "Remove extra inserted video ads where supported. Ads in the broadcast remain.", true);
        }

        if (has("fix_skip", "auto_skip_intro", "auto_skip_recap", "disable_still_watching", "playback_speed", "external_player", "next_episode_countdown", "binge_profile")) {
            section("Playback");
            toggle("fix_skip", "Fix intro/recap seeking", "Use the correct intro/recap end position on direct streams instead of jumping to the beginning.", true);
            toggle("auto_skip_intro", "Automatically skip intros", "Skip an intro when the video provides an intro marker.", false);
            toggle("auto_skip_recap", "Automatically skip recaps", "Skip a recap when the video provides a recap marker.", false);
            toggle("disable_still_watching", "Keep watching", "Disable the still-watching interruption.", false);
            toggleFor("next_episode_countdown", "next_episode_countdown_enabled", "Custom next-episode countdown", "Adjust the existing autoplay countdown. Cancel and Watch credits remain available.", false, true);
            if (MorpheSettings.enabled("next_episode_countdown_enabled", false)) {
                intChoiceFor("next_episode_countdown", "next_episode_delay_seconds", "Next episode after", "Applies when SBS offers an available next episode.",
                        new String[]{"1 second", "3 seconds", "5 seconds", "9 seconds (original)", "10 seconds", "15 seconds", "30 seconds", "60 seconds"},
                        new int[]{1, 3, 5, 9, 10, 15, 30, 60}, 9);
            }
            toggleFor("playback_speed", "playback_speed_enabled", "Custom playback speed", "Use your preferred speed for on-demand videos. Live streams keep their normal speed.", false, true);
            if (MorpheSettings.enabled("playback_speed_enabled", false)) {
                floatChoice("playback_speed", "Playback speed", "Default speed for on-demand videos.",
                        new String[]{"Normal (1×)", "0.5×", "0.75×", "1.25×", "1.5×", "1.75×", "2×"},
                        new float[]{1f, .5f, .75f, 1.25f, 1.5f, 1.75f, 2f}, 1f);
            }
            toggle("external_player", "Use an external player", "Open supported videos in another installed player. Stream protection may limit playback.", false);
            if (MorpheSettings.isRegistered("binge_profile")) {
                Button binge = new Button(this);
                binge.setText("Apply binge-watching preset");
                binge.setTextColor(ACCENT);
                binge.setAllCaps(false);
                binge.setOnClickListener(view -> new AlertDialog.Builder(this)
                        .setTitle("Enable the binge-watching preset?")
                        .setMessage("Enable intro/recap skipping, keep watching without inactivity interruption, and use a 3-second next-episode countdown. You can change each option separately afterwards.")
                        .setNegativeButton("Cancel", null)
                        .setPositiveButton("Apply", (dialog, which) -> {
                            MorpheSettings.applyBingePreset();
                            render();
                        }).show());
                content.addView(binge, new LinearLayout.LayoutParams(-1, dp(52)));
                controls++;
            }
        }

        if (has("remember_quality")) {
            section("Video quality");
            toggleFor("remember_quality", "remember_quality", "Preferred video quality", "Remember your quality selection or prefer the highest available quality.", false, true);
            if (MorpheSettings.enabled("remember_quality", false)) {
                intChoiceFor("remember_quality", "quality_mode", "Quality mode", "Automatic keeps the app's normal quality selection.",
                        new String[]{"Remember last selection", "Automatic", "Highest available"},
                        new int[]{1, 0, 2}, 1);
            }
        }

        if (has("seek_intervals", "controls_timeout", "clean_pause_overlay")) {
            section("Player controls");
            toggleFor("seek_intervals", "seek_intervals", "Custom seek intervals", "Choose the skip-back and skip-forward intervals.", false, true);
            if (MorpheSettings.enabled("seek_intervals", false)) {
                intChoiceFor("seek_intervals", "seek_back_seconds", "Skip-back interval", "How far the player moves when you skip back.",
                        new String[]{"5 seconds", "10 seconds", "15 seconds (default)", "20 seconds", "30 seconds", "60 seconds"},
                        new int[]{5, 10, 15, 20, 30, 60}, 15);
                intChoiceFor("seek_intervals", "seek_forward_seconds", "Skip-forward interval", "How far the player moves when you skip forward.",
                        new String[]{"5 seconds", "10 seconds", "15 seconds (default)", "20 seconds", "30 seconds", "60 seconds"},
                        new int[]{5, 10, 15, 20, 30, 60}, 15);
            }
            toggleFor("controls_timeout", "controls_timeout_enabled", "Custom controls timeout", "Choose how long the playback controls stay visible.", false, true);
            if (MorpheSettings.enabled("controls_timeout_enabled", false)) {
                intChoiceFor("controls_timeout", "controls_timeout_seconds", "Hide controls after", "How long player controls stay visible during playback.",
                        new String[]{"3 seconds (default)", "5 seconds", "8 seconds", "10 seconds", "15 seconds", "30 seconds"},
                        new int[]{3, 5, 8, 10, 15, 30}, 3);
            }
            toggle("clean_pause_overlay", "Clean pause screen", "Hide playback controls after the timeout while paused. Tap the video to show them again.", false);
        }

        if (has("subtitle_customization")) {
            section("Subtitles");
            toggleFor("subtitle_customization", "subtitle_customization", "Customize subtitles", "Adjust subtitle size, position, and contrast.", false, true);
            if (MorpheSettings.enabled("subtitle_customization", false)) {
                floatChoiceFor("subtitle_customization", "subtitle_scale", "Subtitle size", "Scale subtitles relative to the normal text size.",
                        new String[]{"100% (default)", "75%", "90%", "110%", "125%", "150%", "175%", "200%"},
                        new float[]{1f, .75f, .9f, 1.1f, 1.25f, 1.5f, 1.75f, 2f}, 1f);
                intChoiceFor("subtitle_customization", "subtitle_margin", "Raise subtitles", "Add space below subtitles, measured in screen-independent pixels.",
                        new String[]{"0 (default)", "8", "16", "24", "32", "48", "64"},
                        new int[]{0, 8, 16, 24, 32, 48, 64}, 0);
                toggleFor("subtitle_customization", "subtitle_style", "High-contrast subtitles", "Use bright text with a dark backing for easier reading.", false, false);
            }
        }

        if (has("diagnostic_overlay", "minimal_telemetry", "buffer_recovery")) {
            section("Privacy and diagnostics");
            toggle("diagnostic_overlay", "Playback diagnostics", "Show basic playback information without recording stream addresses or account information.", false);
            toggle("buffer_recovery", "Recover stalled direct video", "Try at most two recovery restarts after prolonged buffering in direct on-demand video. Live, ads and explicit playback errors use the normal recovery.", false);
            toggle("minimal_telemetry", "Reduce telemetry", "Reduce selected navigation, interaction and playback analytics events. Other SDK reporting may continue.", false);
        }

        if (controls == 0) {
            text("No optional settings are installed in this build.", 16, SECONDARY, 16);
        } else {
            text("Experimental features are optional. Their default values preserve normal playback.", 13, SECONDARY, 20);
            Button reset = new Button(this);
            reset.setText("Reset to defaults");
            reset.setTextColor(ACCENT);
            reset.setAllCaps(false);
            reset.setOnClickListener(view -> new AlertDialog.Builder(this)
                    .setTitle("Reset Morphe settings?")
                    .setMessage("Restore all Morphe settings to their default values. Ad removal and the skip fix stay enabled by default; experimental features return to their normal settings.")
                    .setNegativeButton("Cancel", null)
                    .setPositiveButton("Reset", (dialog, which) -> {
                        MorpheSettings.resetDefaults();
                        render();
                        Toast.makeText(this, "Default settings restored", Toast.LENGTH_SHORT).show();
                    }).show());
            content.addView(reset, new LinearLayout.LayoutParams(-1, dp(52)));
        }
        setContentView(scroll);
        scroll.post(() -> scroll.scrollTo(0, scrollPosition));
    }

    private boolean has(String... keys) {
        for (String key : keys) if (MorpheSettings.isRegistered(key)) return true;
        return false;
    }

    private void section(String title) {
        text(title, 18, ACCENT, 14);
    }

    private void toggle(String key, String title, String description, boolean defaultValue) {
        toggleFor(key, key, title, description, defaultValue, false);
    }

    private void toggleFor(String featureKey, String key, String title, String description, boolean defaultValue, boolean refresh) {
        if (!MorpheSettings.isRegistered(featureKey)) return;
        controls++;
        LinearLayout row = card();
        Switch control = new Switch(this);
        control.setText(title);
        control.setTextSize(16);
        control.setTextColor(TEXT);
        control.setPadding(0, dp(4), 0, dp(8));
        control.setMinimumHeight(dp(48));
        control.setThumbTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}}, new int[]{ACCENT, SECONDARY}));
        control.setTrackTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}}, new int[]{0xff675079, 0xff55515c}));
        control.setChecked(MorpheSettings.enabled(key, defaultValue));
        control.setOnCheckedChangeListener((button, checked) -> {
            MorpheSettings.saveBoolean(key, checked);
            if (refresh) render();
        });
        row.addView(control, new LinearLayout.LayoutParams(-1, -2));
        description(row, description);
    }

    private void intChoice(String key, String title, String description, String[] labels, int[] values, int defaultValue) {
        intChoiceFor(key, key, title, description, labels, values, defaultValue);
    }

    private void intChoiceFor(String featureKey, String key, String title, String description, String[] labels, int[] values, int defaultValue) {
        if (!MorpheSettings.isRegistered(featureKey)) return;
        int selected = MorpheSettings.getInt(key, defaultValue);
        int index = 0;
        for (int i = 0; i < values.length; i++) if (values[i] == selected) index = i;
        final int initial = index;
        choice(title, description, labels, initial, position -> MorpheSettings.saveInt(key, values[position]));
    }

    private void floatChoice(String key, String title, String description, String[] labels, float[] values, float defaultValue) {
        floatChoiceFor(key, key, title, description, labels, values, defaultValue);
    }

    private void floatChoiceFor(String featureKey, String key, String title, String description, String[] labels, float[] values, float defaultValue) {
        if (!MorpheSettings.isRegistered(featureKey)) return;
        float selected = MorpheSettings.getFloat(key, defaultValue);
        int index = 0;
        for (int i = 0; i < values.length; i++) if (Math.abs(values[i] - selected) < .001f) index = i;
        final int initial = index;
        choice(title, description, labels, initial, position -> MorpheSettings.saveFloat(key, values[position]));
    }

    private interface Selection {
        void save(int position);
    }

    private void choice(String title, String description, String[] labels, int selected, Selection selection) {
        controls++;
        LinearLayout row = card();
        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextColor(TEXT);
        heading.setTextSize(16);
        row.addView(heading, new LinearLayout.LayoutParams(-1, -2));
        description(row, description);
        Spinner spinner = new Spinner(this, Spinner.MODE_DROPDOWN);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, labels) {
            @Override
            public View getView(int position, View view, ViewGroup parent) {
                TextView item = (TextView) super.getView(position, view, parent);
                item.setTextColor(ACCENT);
                item.setPadding(dp(4), dp(10), dp(4), dp(10));
                return item;
            }

            @Override
            public View getDropDownView(int position, View view, ViewGroup parent) {
                TextView item = (TextView) super.getDropDownView(position, view, parent);
                item.setTextColor(TEXT);
                item.setBackgroundColor(SURFACE);
                item.setPadding(dp(16), dp(14), dp(16), dp(14));
                return item;
            }
        };
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner.setContentDescription(title);
        spinner.setSelection(selected, false);
        spinner.setBackgroundTintList(ColorStateList.valueOf(ACCENT));
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            private int previous = selected;

            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (position == previous) return;
                previous = position;
                selection.save(position);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        row.addView(spinner, new LinearLayout.LayoutParams(-1, dp(54)));
    }

    private LinearLayout card() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(14), dp(10), dp(14), dp(12));
        row.setBackgroundColor(SURFACE);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = dp(10);
        content.addView(row, params);
        return row;
    }

    private void description(LinearLayout parent, String description) {
        TextView label = new TextView(this);
        label.setText(description);
        label.setTextSize(13);
        label.setTextColor(SECONDARY);
        label.setLineSpacing(dp(2), 1f);
        parent.addView(label, new LinearLayout.LayoutParams(-1, -2));
    }

    private void text(String value, int size, int color, int bottomMargin) {
        TextView label = new TextView(this);
        label.setText(value);
        label.setTextSize(size);
        label.setTextColor(color);
        label.setLineSpacing(dp(2), 1f);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = dp(8);
        params.bottomMargin = dp(bottomMargin);
        content.addView(label, params);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
