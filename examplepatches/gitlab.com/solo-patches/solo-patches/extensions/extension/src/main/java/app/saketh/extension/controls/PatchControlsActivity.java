package app.saketh.extension.controls;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import app.saketh.extension.comments.TranslateButton;
import app.saketh.extension.comments.TranslateLanguage;
import app.saketh.extension.gifs.GifSearch;
import app.saketh.extension.theme.ThemeHooks;

public final class PatchControlsActivity extends Activity {
    private ControlsUi ui;
    private FontControls fonts;
    private ScrollView scroll;
    private TextView saved;

    @Override public void onCreate(Bundle state) {
        PatchSettings.initialize(this);
        boolean dark = PatchSettings.installed("material_you") || PatchSettings.installed("amoled") ? ThemeHooks.isDark()
                : (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(state);
        setTitle("Patch controls");
        ui = new ControlsUi(this, dark);
        fonts = new FontControls(this, ui);
        LinearLayout root = ui.column();
        root.setBackgroundColor(ui.background);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });
        getWindow().getDecorView().setSystemUiVisibility(dark ? 0
                : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        getWindow().setStatusBarColor(ui.background);
        getWindow().setNavigationBarColor(ui.background);
        toolbar(root);
        scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        LinearLayout body = ui.column();
        body.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), ui.dp(24));
        scroll.addView(body);
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        setContentView(root);
        TextView version = ui.text("WEBNOVEL  8.24.2", 12, ui.accent, true);
        version.setPadding(ui.dp(4), ui.dp(14), 0, ui.dp(4));
        body.addView(version);
        saved = ui.text("Changes save automatically.", 13, ui.muted, false);
        saved.setPadding(ui.dp(4), 0, 0, ui.dp(4));
        body.addView(saved);
        ui.section(body, "BLOCKING");
        LinearLayout blocking = ui.card(body);
        toggle(blocking, "hide_ads", "Hide ads", "Hide launch, reader and Library promotions. Rewarded ads remain available. Reopen Library to apply.", true);
        ui.divider(blocking);
        toggle(blocking, "hide_popups", "Hide promotional popups", "Hide campaigns and automatic prompts. Manual check-in remains available.", true);
        ui.divider(blocking);
        toggle(blocking, "hide_featured_works", "Hide Featured Works page", "Stop the full-screen Featured Works page at launch and its shortcut above the bottom tabs. Reopen the app to apply.", true);
        ui.section(body, "ACCOUNTS");
        // WebNovel's own block list, which it otherwise opens only from the menu on your profile.
        ui.valueRow(ui.card(body), "Blocked accounts", "See the users you blocked. Tap one to open their profile and unblock them.",
                value -> startActivity(new Intent().setClassName(this, "com.qidian.Int.reader.user.UserBlockedListActivity")))
                .setText("›");
        ui.section(body, "READER");
        LinearLayout reader = ui.card(body);
        toggle(reader, "disable_reward_timer", "Disable reading reward timer",
                "Hide the corner widget and stop its timer. Reading rewards from this timer will stop. Reopen the reader to apply.", false);
        ui.section(body, "APPEARANCE");
        LinearLayout appearance = ui.card(body);
        toggle(appearance, "material_you", "Material You colors", "Use wallpaper colors for app accents and backgrounds.", false);
        ui.divider(appearance);
        toggle(appearance, "reader_material_you", "Material You reader", "Use matching colors for reader pages and text. Turn off to restore your saved theme. Reopen the reader to apply.", true);
        ui.divider(appearance);
        toggle(appearance, "amoled", "AMOLED dark theme", "Use pure black backgrounds and reader pages while dark mode is on. Reopen affected screens to apply.", true);
        ui.section(body, "NAVIGATION");
        if (PatchSettings.installed("navigation_controls")) {
            NavigationControls.add(body, ui);
        } else {
            body.addView(ui.text("Main navigation controls patch is not included in this APK.", 14, ui.muted, false));
        }
        ui.section(body, "COMMENTS");
        if (PatchSettings.installed("copy_translate")) {
            translateLanguage(ui.card(body));
        } else {
            body.addView(ui.text("Copy and translate patch is not included in this APK.", 14, ui.muted, false));
        }
        ui.section(body, "GIFS");
        if (PatchSettings.installed("gif_providers")) {
            gifSearch(ui.card(body));
        } else {
            body.addView(ui.text("GIF search providers patch is not included in this APK.", 14, ui.muted, false));
        }
        ui.section(body, "TYPOGRAPHY");
        if (PatchSettings.installed("custom_fonts")) {
            fonts.add(body, false);
            fonts.add(body, true);
            TextView note = ui.text("Import .ttf or .otf files up to 16 MiB. Reader font overrides its built-in selector until reset.", 12, ui.muted, false);
            note.setPadding(ui.dp(4), 0, ui.dp(4), ui.dp(4));
            body.addView(note);
        } else {
            body.addView(ui.text("Custom fonts patch is not included in this APK.", 14, ui.muted, false));
        }
        if (state != null) scroll.post(() -> scroll.scrollTo(0, state.getInt("scroll")));
    }

    private void toolbar(LinearLayout root) {
        LinearLayout bar = new LinearLayout(this);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(ui.dp(8), ui.dp(4), ui.dp(12), ui.dp(4));
        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextSize(32);
        back.setTextColor(ui.text);
        back.setGravity(Gravity.CENTER);
        back.setContentDescription("Back");
        back.setOnClickListener(view -> finish());
        bar.addView(back, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        TextView title = ui.text("Patch controls", 18, ui.text, true);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        bar.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
        Button reopen = ui.button("Reopen app", false);
        reopen.setOnClickListener(view -> {
            Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
            if (launch == null) return;
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(launch);
            finish();
        });
        bar.addView(reopen, new LinearLayout.LayoutParams(-2, -2));
        root.addView(bar, new LinearLayout.LayoutParams(-1, -2));
    }

    private void translateLanguage(LinearLayout card) {
        ui.valueRow(card, "Translate button", "Where Translate appears on comments, reviews and replies.",
                value -> TranslateButton.choose(this, () -> {
                    value.setText(TranslateButton.label());
                    saved.setText("Saved. Reopen the comments to apply.");
                })).setText(TranslateButton.label());
        ui.divider(card);
        ui.valueRow(card, "Translate comments to", "Language for Translate. "
                + "You can also change it from the translation window.", value -> TranslateLanguage.choose(this, () -> {
                    value.setText(TranslateLanguage.label());
                    saved.setText("Saved. Applies to the next translation.");
                })).setText(TranslateLanguage.label());
    }

    private void gifSearch(LinearLayout card) {
        ui.valueRow(card, "GIF search", "Provider for the GIF picker in comments. Reopen the comment editor to apply.",
                value -> GifSearch.chooseProvider(this, () -> {
                    value.setText(GifSearch.providerLabel());
                    saved.setText("Saved. Reopen the comment editor to apply.");
                })).setText(GifSearch.providerLabel());
        ui.divider(card);
        ui.valueRow(card, "GIPHY API key", "Needed for GIPHY. Create a free key at developers.giphy.com.",
                value -> GifSearch.editKey(this, () -> {
                    value.setText(GifSearch.keyLabel());
                    saved.setText("Saved. Applies to the next GIF search.");
                })).setText(GifSearch.keyLabel());
    }

    private void toggle(LinearLayout card, String key, String title, String detail, boolean initial) {
        boolean enabled = PatchSettings.installed(key);
        boolean wallpaper = "material_you".equals(key) || "reader_material_you".equals(key);
        boolean appearance = wallpaper || "amoled".equals(key);
        if (!enabled) detail = "Not included in this APK. Select this patch when rebuilding.";
        if (wallpaper && Build.VERSION.SDK_INT < 31) {
            enabled = false;
            detail = "Wallpaper colors require Android 12 or newer.";
        }
        if ("reader_material_you".equals(key) && enabled && !PatchSettings.materialYou()) {
            enabled = false;
            detail = "Turn on Material You colors first. Your saved page theme is retained.";
        }
        Switch control = ui.switchRow(card, title, detail,
                enabled && PatchSettings.preferences().getBoolean(key, initial), enabled);
        control.setOnCheckedChangeListener((button, checked) -> {
            PatchSettings.preferences().edit().putBoolean(key, checked).apply();
            saved.setText("disable_reward_timer".equals(key)
                    ? "Saved. Close and reopen the reader to apply the timer choice."
                    : "Saved. Reopen affected screens to apply.");
            if (appearance) recreate();
        });
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putInt("scroll", scroll.getScrollY());
        super.onSaveInstanceState(state);
    }

    @Override protected void onResume() {
        super.onResume();
        fonts.refresh();
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        fonts.result(request, result, data);
    }
}
