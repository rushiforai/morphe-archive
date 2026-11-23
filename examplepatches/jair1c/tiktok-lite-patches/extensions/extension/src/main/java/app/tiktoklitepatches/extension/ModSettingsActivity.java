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

public final class ModSettingsActivity extends Activity {
    static final String EXTRA_LIGHT_THEME = "lite_patches_light_theme";
    private ModStrings strings;
    private boolean light;
    private int background, cardColor, border, textColor, muted;
    private static final int ACCENT = 0xFFFE2C55;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        ModSettings.initialize(this);
        strings = ModStrings.forContext(this);
        light = getIntent().hasExtra(EXTRA_LIGHT_THEME)
                ? getIntent().getBooleanExtra(EXTRA_LIGHT_THEME, true)
                : usesLightAppTheme();
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

    private boolean usesLightAppTheme() {
        try {
            // TikTok Lite resolves its explicit preference and its follow-device mode here.
            Class<?> theme = Class.forName("X.Ga0", false, getClassLoader());
            return !Boolean.TRUE.equals(theme.getMethod("LCC").invoke(null));
        } catch (ReflectiveOperationException | LinkageError ignored) {
            return (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    != Configuration.UI_MODE_NIGHT_YES;
        }
    }

    private void showSettings() {
        LinearLayout page = page(strings.get(SETTINGS));

        LinearLayout feed = settingsCard(page, strings.get(FEED));
        addSwitch(feed, strings.get(HIDE_ADS), strings.get(ADS_DESCRIPTION),
                "hide_ads", ModSettings.hideAds());
        TextView count = dialogText(strings.get(ADS_COUNT, FeedFilter.removedCount()),
                13, muted, false);
        count.setPadding(0, dp(12), 0, 0);
        feed.addView(count);

        LinearLayout downloads = settingsCard(page, strings.get(DOWNLOADS));
        addSwitch(downloads, strings.get(CLEAN_DOWNLOADS), strings.get(DOWNLOAD_DESCRIPTION),
                "clean_downloads", ModSettings.cleanDownloads());

        LinearLayout shortcuts = settingsCard(page, strings.get(SHORTCUTS));
        addSwitch(shortcuts, strings.get(PROFILE_ENTRY), strings.get(PROFILE_DESCRIPTION),
                ModSettings.PROFILE_GESTURE, ModSettings.profileGestureEnabled());

        LinearLayout about = settingsCard(page, strings.get(ABOUT));
        action(about, strings.get(ABOUT_TITLE), false, this::showAbout);
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
        ring.setBackground(surface(ACCENT, ACCENT, 60));
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
        name.setSpan(new ForegroundColorSpan(ACCENT), 8, name.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
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
                Intent.ACTION_VIEW, Uri.parse("https://github.com/jair1c/tiktok-lite-patches"))));
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
        return light ? 0xFFC8133B : 0xFFFF6685;
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
        control.setThumbTintList(new ColorStateList(states, new int[]{ACCENT, muted}));
        control.setTrackTintList(new ColorStateList(states, new int[]{0x88FE2C55, border}));
        control.setOnCheckedChangeListener((view, enabled) -> {
            getSharedPreferences("tiktok_lite_patches", MODE_PRIVATE).edit().putBoolean(key, enabled).apply();
        });
        row.addView(control);
        page.addView(row);
    }

    private void action(LinearLayout page, String title, boolean primary, Runnable action) {
        Button button = new Button(this);
        button.setText(title);
        button.setAllCaps(false);
        button.setTextColor(primary ? Color.WHITE : textColor);
        button.setBackground(surface(primary ? 0xFFC8133B : cardColor, primary ? 0xFFC8133B : muted, 12));
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
