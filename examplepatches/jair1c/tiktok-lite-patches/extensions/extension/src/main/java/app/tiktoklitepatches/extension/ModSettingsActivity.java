package app.tiktoklitepatches.extension;

import static app.tiktoklitepatches.extension.ModStrings.Text.*;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.view.Gravity;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.view.View;
import android.graphics.BitmapFactory;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.EditText;

import java.util.Locale;

public final class ModSettingsActivity extends Activity {
    static final String EXTRA_LIGHT_THEME = "lite_patches_light_theme";
    private ModStrings strings;
    private boolean light;
    private int background, cardColor, border, textColor, muted;
    private ScrollView settingsScroll;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        ModSettings.initialize(this);
        strings = ModStrings.forContext(this);
        light = getIntent().hasExtra(EXTRA_LIGHT_THEME)
                ? getIntent().getBooleanExtra(EXTRA_LIGHT_THEME, true)
                : usesLightAppTheme(this);
        background = light ? 0xFFF5F5F6 : 0xFF101012;
        cardColor = cardColor(light);
        border = borderColor(light);
        textColor = light ? 0xFF17171A : 0xFFF6F6F8;
        muted = light ? 0xFF585861 : 0xFFB7B7C1;
        getWindow().setStatusBarColor(background);
        getWindow().setNavigationBarColor(background);
        getWindow().getDecorView().setSystemUiVisibility(light
                ? View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0);
        showSettings();
    }

    static void open(Activity source, boolean light) {
        source.startActivity(new Intent(source, ModSettingsActivity.class)
                .putExtra(EXTRA_LIGHT_THEME, light));
    }

    static boolean usesLightAppTheme(Activity source) {
        try {
            // 47.8.2 resolves the selected appearance, including follow-device mode, here.
            Class<?> theme = Class.forName("X.K6R", false, source.getClassLoader());
            Object dark = theme.getMethod("LCC").invoke(null);
            if (dark instanceof Boolean) return !((Boolean) dark);
        } catch (ReflectiveOperationException | LinkageError ignored) {
            // Use the originating activity's configuration if the app resolver is unavailable.
        }
        return (source.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                != Configuration.UI_MODE_NIGHT_YES;
    }

    private void showSettings() {
        LinearLayout page = page(strings.get(SETTINGS));

        if (ModSettings.feedFilterAvailable()) {
            LinearLayout feed = settingsCard(page, strings.get(FEED));
            addSwitch(feed, strings.get(HIDE_ADS), strings.get(ADS_DESCRIPTION),
                    ModSettings.ADS, ModSettings.hideAds());
            TextView count = dialogText(strings.get(ADS_COUNT, FeedFilter.removedCount()),
                    13, muted, false);
            count.setPadding(0, dp(12), 0, 0);
            feed.addView(count);
            if (ModSettings.liveFilterAvailable()) {
                addSwitch(feed, strings.get(HIDE_LIVE), strings.get(LIVE_DESCRIPTION),
                        ModSettings.LIVE, ModSettings.hideLive());
            }
            addSwitch(feed, strings.get(HIDE_PHOTO_POSTS), strings.get(PHOTO_POSTS_DESCRIPTION),
                    ModSettings.PHOTO_POSTS, ModSettings.hidePhotoPosts());
        }

        if (ModSettings.cleanDownloadsAvailable()) {
            LinearLayout downloads = settingsCard(page, strings.get(DOWNLOADS));
            addSwitch(downloads, strings.get(CLEAN_DOWNLOADS), strings.get(DOWNLOAD_DESCRIPTION),
                    ModSettings.DOWNLOAD, ModSettings.cleanDownloads());
        }

        if (ModSettings.profileGestureAvailable()) {
            LinearLayout shortcuts = settingsCard(page, strings.get(SHORTCUTS));
            addSwitch(shortcuts, strings.get(PROFILE_ENTRY), strings.get(PROFILE_DESCRIPTION),
                    ModSettings.PROFILE_GESTURE, ModSettings.profileGestureEnabled());
        }

        boolean loopingAvailable = ModSettings.stopVideoLoopingAvailable();
        boolean seekbarAvailable = ModSettings.seekbarAvailable();
        boolean startupPauseAvailable = ModSettings.startupPauseAvailable();
        if (loopingAvailable || seekbarAvailable || startupPauseAvailable) {
            LinearLayout playback = settingsCard(page, strings.get(PLAYBACK));
            if (loopingAvailable) {
                addSwitch(playback, strings.get(STOP_LOOPING_TITLE), strings.get(STOP_LOOPING_DESCRIPTION),
                        ModSettings.STOP_VIDEO_LOOPING, ModSettings.stopVideoLoopingEnabled());
            }
            if (seekbarAvailable) {
                addSwitch(playback, strings.get(SEEKBAR_TITLE), strings.get(SEEKBAR_DESCRIPTION),
                        ModSettings.SHOW_SEEKBAR, ModSettings.seekbarEnabled());
            }
            if (startupPauseAvailable) {
                addSwitch(playback, strings.get(STARTUP_PAUSE_TITLE), strings.get(STARTUP_PAUSE_DESCRIPTION),
                        ModSettings.PAUSE_FIRST_VIDEO, ModSettings.startupPauseEnabled());
            }
        }

        boolean suggestionsAvailable = ModSettings.profileSuggestionsAvailable();
        boolean storyTrayAvailable = ModSettings.inboxStoryTrayAvailable();
        if (suggestionsAvailable || storyTrayAvailable) {
            LinearLayout privacy = settingsCard(page, strings.get(PRIVACY));
            if (suggestionsAvailable) {
                addSwitch(privacy, strings.get(PROFILE_SUGGESTIONS_TITLE), strings.get(PROFILE_SUGGESTIONS_DESCRIPTION),
                        ModSettings.HIDE_PROFILE_SUGGESTIONS, ModSettings.hideProfileSuggestions());
            }
            if (storyTrayAvailable) {
                addSwitch(privacy, strings.get(INBOX_STORY_TRAY_TITLE), strings.get(INBOX_STORY_TRAY_DESCRIPTION),
                        ModSettings.HIDE_INBOX_STORY_TRAY, ModSettings.hideInboxStoryTray());
            }
        }

        LinearLayout appearance = settingsCard(page, strings.get(APPEARANCE));
        if (ModSettings.exactCountsAvailable()) {
            addSwitch(appearance, strings.get(EXACT_COUNTS_TITLE), strings.get(EXACT_COUNTS_DESCRIPTION),
                    ModSettings.EXACT_COUNTS, ModSettings.exactCountsEnabled());
        }
        addAccentPicker(appearance);

        LinearLayout about = settingsCard(page, strings.get(ABOUT));
        action(about, strings.get(ABOUT_TITLE), false, this::showAbout);
    }

    private void addAccentPicker(LinearLayout card) {
        TextView title = dialogText(strings.get(ACCENT_COLOR) + "  " + hexColor(ModSettings.accentColor()),
                16, textColor, true);
        title.setPadding(0, dp(12), 0, 0);
        card.addView(title);
        int[] colors = {ModSettings.DEFAULT_ACCENT, 0xFF2563EB, 0xFF7C3AED, 0xFF00875A, 0xFFD97706};
        LinearLayout palette = new LinearLayout(this);
        palette.setGravity(Gravity.CENTER);
        palette.setPadding(0, dp(12), 0, 0);
        card.addView(palette);
        for (int color : colors) {
            boolean selected = color == ModSettings.accentColor();
            TextView swatch = dialogText(selected ? "✓" : "", 22,
                    contrast(color, Color.WHITE) >= 4.5 ? Color.WHITE : Color.BLACK, true);
            swatch.setGravity(Gravity.CENTER);
            String label = color == ModSettings.DEFAULT_ACCENT
                    ? strings.get(ACCENT_DEFAULT) + " " + hexColor(color) : hexColor(color);
            swatch.setContentDescription(label);
            swatch.setSelected(selected);
            swatch.setBackground(surface(color, border, 7));
            LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(dp(44), dp(44));
            size.setMargins(dp(4), 0, dp(4), 0);
            palette.addView(swatch, size);
            swatch.setOnClickListener(view -> applyAccent(color));
        }
        LinearLayout custom = new LinearLayout(this);
        custom.setOrientation(LinearLayout.VERTICAL);
        custom.setVisibility(View.GONE);
        action(card, strings.get(ACCENT_CUSTOM), false, () -> {
            custom.setVisibility(custom.getVisibility() == View.VISIBLE ? View.GONE : View.VISIBLE);
        });
        card.addView(custom);

        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setContentDescription(strings.get(ACCENT_CUSTOM));
        input.setTextColor(textColor);
        input.setText(hexColor(ModSettings.accentColor()));
        custom.addView(input, new LinearLayout.LayoutParams(-1, -2));
        action(custom, getString(android.R.string.ok), true, () -> {
            String value = input.getText().toString().trim();
            if (!value.matches("#?[0-9a-fA-F]{6}")) {
                input.setError(strings.get(ACCENT_INVALID));
                return;
            }
            android.view.inputmethod.InputMethodManager keyboard =
                    (android.view.inputmethod.InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
            if (keyboard != null) keyboard.hideSoftInputFromWindow(input.getWindowToken(), 0);
            applyAccent(Color.parseColor(value.startsWith("#") ? value : "#" + value));
        });
    }

    private void applyAccent(int color) {
        int scrollY = settingsScroll.getScrollY();
        ModSettings.setAccentColor(color);
        showSettings();
        settingsScroll.post(() -> settingsScroll.scrollTo(0, scrollY));
    }

    private static String hexColor(int color) {
        return String.format(Locale.ROOT, "#%06X", color & 0xFFFFFF);
    }

    private LinearLayout settingsCard(LinearLayout page, String title) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        card.setBackground(surface(cardColor, border, 18));
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2);
        layout.topMargin = dp(12);
        page.addView(card, layout);
        card.addView(dialogText(title, 16, accentText(light), true));
        return card;
    }

    private void showAbout() {
        Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout panel = new LinearLayout(this);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(18), dp(18), dp(18), dp(12));
        panel.setBackground(surface(cardColor, border, 22));
        panel.addView(dialogText(strings.get(ABOUT_TITLE), 20, textColor, true));

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(14), dp(18), dp(14), dp(18));
        GradientDrawable cover = new GradientDrawable(GradientDrawable.Orientation.TL_BR,
                light ? new int[]{0xFFFFEDF1, 0xFFFFFAFB} : new int[]{0xFF381D2B, 0xFF202125});
        cover.setCornerRadius(dp(19));
        cover.setStroke(dp(1), border);
        card.setBackground(cover);
        LinearLayout.LayoutParams cardLayout = new LinearLayout.LayoutParams(-1, -2);
        cardLayout.topMargin = dp(14);
        panel.addView(card, cardLayout);

        FrameLayout ring = new FrameLayout(this);
        ring.setBackground(surface(ModSettings.accentColor(), ModSettings.accentColor(), 60));
        ring.setPadding(dp(2), dp(2), dp(2), dp(2));
        byte[] bytes = Base64.decode(CreatorAvatar.JPEG, Base64.DEFAULT);
        ImageView avatar = new ImageView(this);
        avatar.setImageBitmap(BitmapFactory.decodeByteArray(bytes, 0, bytes.length));
        avatar.setScaleType(ImageView.ScaleType.CENTER_CROP);
        avatar.setBackground(surface(Color.BLACK, Color.BLACK, 60));
        avatar.setClipToOutline(true);
        avatar.setContentDescription("Gabriel Jair");
        ring.addView(avatar, new FrameLayout.LayoutParams(-1, -1));
        card.addView(ring, new LinearLayout.LayoutParams(dp(82), dp(82)));

        SpannableString name = new SpannableString("Gabriel Jair");
        name.setSpan(new ForegroundColorSpan(accentText(light)), 8, name.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        TextView creator = dialogText(name, 22, textColor, true);
        creator.setPadding(0, dp(12), 0, dp(4));
        creator.setGravity(Gravity.CENTER);
        card.addView(creator);
        TextView role = dialogText(strings.get(CREATOR), 13, muted, false);
        role.setGravity(Gravity.CENTER);
        card.addView(role);

        TextView info = dialogText(strings.get(PATCH_VERSION, PatchVersion.NAME), 14, textColor, true);
        info.setPadding(0, dp(14), 0, dp(6));
        panel.addView(info);
        action(panel, strings.get(GITHUB), true, () -> startActivity(new Intent(
                Intent.ACTION_VIEW, Uri.parse("https://github.com/KyVexo/tiktok-lite-patches"))));
        action(panel, strings.get(CLOSE), false, dialog::dismiss);

        ScrollView scroll = new ScrollView(this);
        scroll.addView(panel);
        dialog.setContentView(scroll);
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setGravity(Gravity.CENTER);
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(Math.min(dp(360), getResources().getDisplayMetrics().widthPixels - dp(36)), -2);
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0.67f);
        }
    }

    private TextView dialogText(CharSequence value, int size, int color, boolean bold) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextSize(size);
        text.setTextColor(color);
        if (bold) text.setTypeface(null, Typeface.BOLD);
        return text;
    }

    static int cardColor(boolean light) {
        return light ? Color.WHITE : 0xFF202125;
    }

    static int borderColor(boolean light) {
        return light ? 0xFFE8E8EB : 0xFF36373C;
    }

    static int accentText(boolean light) {
        int accent = ModSettings.accentColor();
        if (accent == ModSettings.DEFAULT_ACCENT) return light ? 0xFFC8133B : 0xFFFF6685;
        int surface = cardColor(light);
        while (contrast(accent, surface) < 4.5) {
            int target = light ? 0 : 255;
            accent = Color.rgb(
                    (Color.red(accent) + target) / 2,
                    (Color.green(accent) + target) / 2,
                    (Color.blue(accent) + target) / 2);
        }
        return accent;
    }

    static double contrast(int first, int second) {
        double a = luminance(first) + 0.05;
        double b = luminance(second) + 0.05;
        return Math.max(a, b) / Math.min(a, b);
    }

    private static double luminance(int color) {
        return 0.2126 * linear(Color.red(color)) + 0.7152 * linear(Color.green(color))
                + 0.0722 * linear(Color.blue(color));
    }

    private static double linear(int channel) {
        double value = channel / 255.0;
        return value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4);
    }

    private GradientDrawable surface(int color, int border, int radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(radius));
        shape.setStroke(dp(1), border);
        return shape;
    }

    private LinearLayout page(String title) {
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(20), dp(14), dp(20), dp(24));
        ScrollView scroll = new ScrollView(this);
        scroll.setFitsSystemWindows(true);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(background);
        scroll.addView(content);
        settingsScroll = scroll;
        setContentView(scroll);

        Button back = new Button(this);
        back.setText("‹");
        back.setContentDescription(strings.get(BACK));
        back.setTextSize(26);
        back.setTextColor(textColor);
        back.setBackgroundColor(Color.TRANSPARENT);
        back.setOnClickListener(view -> finish());
        content.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        content.addView(dialogText("TikTok Lite Patches", 14, muted, true));
        content.addView(dialogText(title, 28, textColor, true));
        return content;
    }

    private void addSwitch(LinearLayout page, String title, String description, String key, boolean checked) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(6), 0, 0);
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(dialogText(title, 16, textColor, true));
        labels.addView(dialogText(description, 13, muted, false));
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));

        Switch control = new Switch(this);
        control.setContentDescription(title);
        control.setMinHeight(dp(52));
        control.setChecked(checked);
        int[][] states = {{android.R.attr.state_checked}, {}};
        control.setThumbTintList(new ColorStateList(states, new int[]{ModSettings.accentColor(), muted}));
        control.setTrackTintList(new ColorStateList(states, new int[]{0x88000000 | (ModSettings.accentColor() & 0xFFFFFF), border}));
        control.setOnCheckedChangeListener((view, enabled) -> {
            getSharedPreferences("tiktok_lite_patches", MODE_PRIVATE).edit().putBoolean(key, enabled).apply();
            if (ModSettings.HIDE_PROFILE_SUGGESTIONS.equals(key) || ModSettings.HIDE_INBOX_STORY_TRAY.equals(key)) {
                ModSettings.refreshInboxRows(key);
            }
        });
        row.addView(control);
        page.addView(row);
    }

    private void action(LinearLayout page, String title, boolean primary, Runnable action) {
        Button button = new Button(this);
        button.setText(title);
        button.setAllCaps(false);
        int fill = primary ? accentText(light) : cardColor;
        int onFill = contrast(fill, Color.WHITE) >= 4.5 ? Color.WHITE : Color.BLACK;
        button.setTextColor(primary ? onFill : textColor);
        button.setBackground(surface(fill, primary ? fill : muted, 12));
        button.setMinHeight(dp(44));
        button.setPadding(dp(12), dp(6), dp(12), dp(6));
        button.setOnClickListener(view -> action.run());
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2);
        layout.topMargin = dp(12);
        page.addView(button, layout);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

}
