/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.settings;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.content.res.TypedArray;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import app.morphe.extension.facebook.media.DownloadQuality;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.theme.AmoledTheme;
import app.morphe.extension.facebook.theme.MaterialYouTheme;
import app.morphe.extension.shared.Utils;

public final class DeVancedSettingsActivity extends Activity {
    private static final int SCREEN_OVERVIEW = 0;
    private static final int SCREEN_PRIVACY = 1;
    private static final int SCREEN_APPEARANCE = 2;
    private static final int SCREEN_MEDIA = 3;
    private static final int SCREEN_HOME = 4;
    private static final int SCREEN_PERFORMANCE = 5;
    private static final int SCREEN_ABOUT = 6;
    private static final int SCREEN_DONATE = 7;
    private static final int SCREEN_STARTUP = 8;
    private static final String STATE_SCREEN = "devanced_settings_screen";

    private int background;
    private int primaryText;
    private int secondaryText;
    private int divider;
    private int accent;
    private int screen = SCREEN_OVERVIEW;
    private boolean darkMode;

    @Override
    protected void onCreate(Bundle state) {
        darkMode = isFacebookDarkMode();
        setTheme(
                darkMode
                        ? android.R.style.Theme_Material_NoActionBar
                        : android.R.style.Theme_Material_Light_NoActionBar
        );
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(state);
        if (state != null) {
            screen = state.getInt(STATE_SCREEN, SCREEN_OVERVIEW);
        }
        DeVancedSettings.initialize(getApplication());
        resolveColors();
        styleWindow();
        setContentView(createContent());
    }

    @Override
    protected void onResume() {
        super.onResume();
        boolean currentDarkMode = isFacebookDarkMode();
        if (currentDarkMode != darkMode) {
            recreate();
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle state) {
        state.putInt(STATE_SCREEN, screen);
        super.onSaveInstanceState(state);
    }

    @Override
    public void onBackPressed() {
        if (screen != SCREEN_OVERVIEW) {
            screen = SCREEN_OVERVIEW;
            refreshContent();
            return;
        }
        super.onBackPressed();
    }

    private void refreshContent() {
        setContentView(createContent());
    }

    private View createContent() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);

        root.addView(
                createToolbar(),
                new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        dp(64)
                )
        );
        root.addView(dividerView());

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.setBackgroundColor(background);

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setBackgroundColor(background);
        content.setPadding(0, 0, 0, dp(24));

        if (screen == SCREEN_OVERVIEW) {
            createOverview(content);
        } else {
            createCategory(content);
        }

        scroll.addView(
                content,
                new ScrollView.LayoutParams(
                        ScrollView.LayoutParams.MATCH_PARENT,
                        ScrollView.LayoutParams.WRAP_CONTENT
                )
        );
        root.addView(
                scroll,
                new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        0,
                        1f
                )
        );
        return root;
    }

    private void createOverview(LinearLayout content) {
        content.addView(overviewHeader());
        content.addView(sectionTitle("Customize your experience"));

        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_PRIVACY,
                "Privacy and content",
                "Ads, analytics and AI-generated content",
                "3 controls",
                SCREEN_PRIVACY
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_APPEARANCE,
                "Appearance",
                "Dark surfaces and visual customization",
                "2 controls",
                SCREEN_APPEARANCE
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_MEDIA,
                "Media and playback",
                "Downloads, quality, 2x Reels and picture-in-picture",
                "5 controls",
                SCREEN_MEDIA
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_STARTUP,
                "Startup",
                "Choose the Facebook surface opened by the launcher",
                "1 control",
                SCREEN_STARTUP
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_HOME,
                "Home feed",
                "Feed refresh, Reels panels, Stories tray and suggested content",
                "4 controls",
                SCREEN_HOME
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_PERFORMANCE,
                "Performance",
                "Independent low-end optimizations",
                "4 controls",
                SCREEN_PERFORMANCE
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_ABOUT,
                "About De-Vanced",
                "Project information and source links",
                "More information",
                SCREEN_ABOUT
        ));
        content.addView(categoryCard(
                FacebookSymbolDrawable.CATEGORY_DONATE,
                "Donate",
                "Support De-Vanced development",
                "3 ways to donate",
                SCREEN_DONATE
        ));
    }

    private void createCategory(LinearLayout content) {
        content.addView(sectionTitle(
                screen == SCREEN_DONATE ? "Ways to donate" : "Controls"
        ));

        switch (screen) {
            case SCREEN_PRIVACY:
                content.addView(switchRow(
                        FacebookSymbolDrawable.ANALYTICS,
                        "Disable analytics",
                        "Blocks Analytics2, Falco, Papaya, QPL, crash/trace uploads and attribution tracking.",
                        DeVancedSettings.isAnalyticsDisabled(),
                        checked -> DeVancedSettings.setAnalyticsDisabled(this, checked)
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.SPARKLE,
                        "Filter AI-generated content",
                        "Hides posts, Stories and Reels that Facebook labels as AI-generated.",
                        DeVancedSettings.isAiFilterEnabled(),
                        checked -> DeVancedSettings.setAiFilterEnabled(this, checked)
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.SHIELD,
                        "Disable ads",
                        "Blocks sponsored content across Feed, Stories, Reels and Marketplace.",
                        DeVancedSettings.isAdsDisabled(),
                        checked -> DeVancedSettings.setAdsDisabled(this, checked)
                ));
                break;

            case SCREEN_APPEARANCE:
                if (!darkMode) {
                    content.addView(infoBanner(
                            "AMOLED is currently inactive",
                            "Facebook Dark mode is off. Turn it on first to use pure-black surfaces."
                    ));
                }
                boolean amoledEnabled =
                        DeVancedSettings.isAmoledThemeEnabled();
                content.addView(switchRow(
                        FacebookSymbolDrawable.SPARKLE,
                        "AMOLED dark theme",
                        darkMode
                                ? "Uses pure-black surfaces while Facebook Dark mode is active."
                                : amoledEnabled
                                        ? "Enabled, but currently inactive because Facebook Dark mode is off."
                                        : "Unavailable while Facebook Dark mode is off.",
                        amoledEnabled,
                        darkMode,
                        checked -> {
                            DeVancedSettings.setAmoledThemeEnabled(this, checked);
                            Toast.makeText(
                                    this,
                                    checked
                                            ? "Restarting Facebook with AMOLED surfaces."
                                            : "Restarting Facebook with stock dark surfaces.",
                                    Toast.LENGTH_SHORT
                            ).show();
                        }
                ));
                boolean materialYouEnabled =
                        DeVancedSettings.isMaterialYouThemeEnabled();
                content.addView(switchRow(
                        FacebookSymbolDrawable.MATERIAL_YOU,
                        "Material You theme",
                        "Uses the phone wallpaper palette for Facebook Light and Dark modes.",
                        materialYouEnabled,
                        true,
                        checked -> {
                            DeVancedSettings.setMaterialYouThemeEnabled(
                                    this,
                                    checked
                            );
                            Toast.makeText(
                                    this,
                                    "Restarting Facebook to apply the theme.",
                                    Toast.LENGTH_SHORT
                            ).show();
                        }
                ));
                break;

            case SCREEN_MEDIA:
                content.addView(mediaQualityInfoCard());
                content.addView(choiceRow(
                        FacebookSymbolDrawable.DOWNLOAD_QUALITY,
                        "Download quality",
                        "Choose saved video resolution. Photo Stories always use the largest available image.",
                        DeVancedSettings.getDownloadQuality().displayName(),
                        view -> showDownloadQualityDialog()
                ));
                content.addView(choiceRow(
                        FacebookSymbolDrawable.REELS_QUALITY,
                        "Reels playback quality",
                        "Overrides Facebook's Reel quality for newly opened Reels.",
                        DeVancedSettings.getReelsPlaybackQuality().displayName(),
                        view -> showPlaybackQualityDialog(true)
                ));
                content.addView(choiceRow(
                        FacebookSymbolDrawable.STORIES_QUALITY,
                        "Stories playback quality",
                        "Controls video Stories. Photo Stories are unchanged.",
                        DeVancedSettings.getStoriesPlaybackQuality().displayName(),
                        view -> showPlaybackQualityDialog(false)
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.REELS_2X,
                        "2x Reels speed",
                        "Plays Shorts at twice their normal speed. Feed, Watch and fullscreen videos keep their own speed.",
                        DeVancedSettings.isReels2xSpeedEnabled(),
                        checked -> DeVancedSettings.setReels2xSpeedEnabled(
                                this,
                                checked
                        )
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.REELS_QUALITY,
                        "Picture-in-picture",
                        "Keeps Reels, video Stories, Feed, Watch and fullscreen videos playing in a floating window when you leave Facebook.",
                        DeVancedSettings.isPictureInPictureEnabled(),
                        checked -> DeVancedSettings.setPictureInPictureEnabled(
                                this,
                                checked
                        )
                ));
                break;

            case SCREEN_STARTUP:
                content.addView(switchRow(
                        FacebookSymbolDrawable.MARKETPLACE_LAUNCH,
                        "Open Marketplace on launch",
                        "Cold starts from the Facebook icon open Marketplace. Links, notifications and tab shortcuts keep their own destinations.",
                        DeVancedSettings.isMarketplaceOnLaunchEnabled(),
                        checked -> DeVancedSettings.setMarketplaceOnLaunchEnabled(
                                this,
                                checked
                        )
                ));
                break;

            case SCREEN_HOME:
                content.addView(switchRow(
                        FacebookSymbolDrawable.AUTO_REFRESH_OFF,
                        "Disable auto refresh",
                        "Keeps the current feed position when you return to Facebook within ten minutes. Pull to refresh still works.",
                        DeVancedSettings.isAutoRefreshDisabled(),
                        checked -> DeVancedSettings.setAutoRefreshDisabled(
                                this,
                                checked
                        )
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.HOME_REELS,
                        "Hide Reels panels",
                        "Removes large Reels carousels and panels from Home. The Reels tab still works.",
                        DeVancedSettings.isHomeReelsHidden(),
                        checked -> {
                            DeVancedSettings.setHomeReelsHidden(this, checked);
                            showRefreshHomeMessage();
                        }
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.HOME_STORIES,
                        "Hide Stories tray",
                        "Removes the Stories row from Home. Stories remain available elsewhere.",
                        DeVancedSettings.isHomeStoriesHidden(),
                        checked -> {
                            DeVancedSettings.setHomeStoriesHidden(this, checked);
                            showRefreshHomeMessage();
                        }
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.SUGGESTIONS_OFF,
                        "Hide suggested content",
                        "Removes suggested posts and recommendation modules from Home.",
                        DeVancedSettings.isHomeSuggestionsHidden(),
                        checked -> {
                            DeVancedSettings.setHomeSuggestionsHidden(this, checked);
                            showRefreshHomeMessage();
                        }
                ));
                break;

            case SCREEN_PERFORMANCE:
                content.addView(switchRow(
                        FacebookSymbolDrawable.SPEED,
                        "Optimize Facebook",
                        "Reduces render-time reflection, avoids explicit GC stalls, and trims patch caches under memory pressure.",
                        DeVancedSettings.isOptimizationEnabled(),
                        checked -> DeVancedSettings.setOptimizationEnabled(this, checked)
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.REDUCE_ANIMATIONS,
                        "Reduce animations",
                        "Disables activity transitions and window animation styles to make navigation feel lighter on low-end phones.",
                        DeVancedSettings.isReduceAnimationsEnabled(),
                        checked -> DeVancedSettings.setReduceAnimationsEnabled(this, checked)
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.HAPTICS_OFF,
                        "Disable haptic feedback",
                        "Skips vibration feedback on buttons, navigation, and long presses to reduce UI overhead.",
                        DeVancedSettings.isHapticsDisabled(),
                        checked -> DeVancedSettings.setHapticsDisabled(this, checked)
                ));
                content.addView(switchRow(
                        FacebookSymbolDrawable.BACKGROUND_WORK_OFF,
                        "Reduce background work",
                        "Stops De-Vanced background scanning and keeps its caches small while Facebook is open.",
                        DeVancedSettings.isBackgroundWorkReduced(),
                        checked -> DeVancedSettings.setBackgroundWorkReduced(this, checked)
                ));
                break;

            case SCREEN_ABOUT:
                content.addView(buttonRow(
                        FacebookSymbolDrawable.INFO,
                        "About De-Vanced",
                        "Developer: RookieZ\nGitHub: RookieEnough/De-Vanced",
                        view -> DeVancedSettings.openRepository(this)
                ));
                break;

            case SCREEN_DONATE:
                content.addView(buttonRow(
                        FacebookSymbolDrawable.KOFI,
                        "Ko-fi",
                        "Support via ko-fi.com/rookie_z",
                        view -> openExternalUrl("https://ko-fi.com/rookie_z")
                ));
                content.addView(buttonRow(
                        FacebookSymbolDrawable.PAYPAL,
                        "PayPal",
                        "Donate via paypal.me/RookieEnough",
                        view -> openExternalUrl("https://paypal.me/RookieEnough")
                ));
                content.addView(buttonRow(
                        FacebookSymbolDrawable.UPI,
                        "UPI",
                        "UPI ID: rookiez@ptyes",
                        view -> openUpiDonation()
                ));
                break;

            default:
                break;
        }
    }

    private View overviewHeader() {
        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setPadding(dp(20), dp(22), dp(20), dp(12));

        TextView eyebrow = new TextView(this);
        eyebrow.setText("DE-VANCED");
        eyebrow.setTextColor(accent);
        eyebrow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        eyebrow.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        header.addView(eyebrow);

        TextView title = new TextView(this);
        title.setText("Make Facebook yours");
        title.setTextColor(primaryText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 27);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setPadding(0, dp(4), 0, 0);
        header.addView(title);

        TextView summary = new TextView(this);
        summary.setText(
                "Organized controls for privacy, appearance, media, the Home feed and performance."
        );
        summary.setTextColor(secondaryText);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        summary.setPadding(0, dp(6), 0, 0);
        header.addView(summary);
        return header;
    }

    private View categoryCard(
            int iconType,
            String titleText,
            String summaryText,
            String countText,
            int destination
    ) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(16), dp(12), dp(14), dp(12));
        card.setClickable(true);
        card.setFocusable(true);
        card.setElevation(dpf(2f));
        card.setBackground(roundedBackground(
                blend(background, primaryText, isLight(background) ? 0.035f : 0.09f),
                18f
        ));
        card.setContentDescription(
                titleText + ". " + summaryText + ". " + countText
        );
        card.setOnClickListener(view -> {
            screen = destination;
            refreshContent();
        });

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(new FacebookSymbolDrawable(iconType, accent));
        icon.setBackground(roundedBackground(
                blend(background, accent, isLight(background) ? 0.12f : 0.24f),
                16f
        ));
        icon.setPadding(dp(10), dp(10), dp(10), dp(10));
        card.addView(icon, new LinearLayout.LayoutParams(dp(48), dp(48)));

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setPadding(dp(14), 0, dp(8), 0);

        TextView title = new TextView(this);
        title.setText(titleText);
        title.setTextColor(primaryText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        labels.addView(title);

        TextView summary = new TextView(this);
        summary.setText(summaryText);
        summary.setTextColor(secondaryText);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summary.setMaxLines(2);
        summary.setPadding(0, dp(3), 0, 0);
        labels.addView(summary);

        TextView count = new TextView(this);
        count.setText(countText);
        count.setTextColor(accent);
        count.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        count.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        count.setPadding(0, dp(6), 0, 0);
        labels.addView(count);

        card.addView(
                labels,
                new LinearLayout.LayoutParams(
                        0,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                        1f
                )
        );

        ImageView arrow = new ImageView(this);
        arrow.setImageDrawable(new FacebookSymbolDrawable(
                FacebookSymbolDrawable.CHEVRON_RIGHT,
                secondaryText
        ));
        card.addView(arrow, new LinearLayout.LayoutParams(dp(24), dp(24)));

        LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        cardParams.setMargins(dp(16), dp(6), dp(16), dp(6));
        card.setLayoutParams(cardParams);
        return card;
    }

    private String categoryTitle(int category) {
        switch (category) {
            case SCREEN_PRIVACY:
                return "Privacy and content";
            case SCREEN_APPEARANCE:
                return "Appearance";
            case SCREEN_MEDIA:
                return "Media and playback";
            case SCREEN_STARTUP:
                return "Startup";
            case SCREEN_HOME:
                return "Home feed";
            case SCREEN_PERFORMANCE:
                return "Performance";
            case SCREEN_ABOUT:
                return "About De-Vanced";
            case SCREEN_DONATE:
                return "Donate";
            default:
                return "De-Vanced Settings";
        }
    }

    private View createToolbar() {
        LinearLayout toolbar = new LinearLayout(this);
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(dp(12), 0, dp(20), 0);
        toolbar.setBackgroundColor(background);

        ImageButton back = new ImageButton(this);
        back.setImageDrawable(new FacebookSymbolDrawable(
                FacebookSymbolDrawable.BACK,
                primaryText
        ));
        back.setBackgroundColor(Color.TRANSPARENT);
        back.setContentDescription(screen == SCREEN_OVERVIEW ? "Close" : "Back");
        back.setPadding(dp(12), dp(12), dp(12), dp(12));
        back.setOnClickListener(view -> {
            if (screen == SCREEN_OVERVIEW) {
                finish();
            } else {
                screen = SCREEN_OVERVIEW;
                refreshContent();
            }
        });
        toolbar.addView(
                back,
                new LinearLayout.LayoutParams(dp(52), dp(52))
        );

        TextView title = new TextView(this);
        title.setText(
                screen == SCREEN_OVERVIEW
                        ? "De-Vanced Settings"
                        : categoryTitle(screen)
        );
        title.setTextColor(primaryText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams titleParams =
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.MATCH_PARENT, 1f);
        titleParams.setMarginStart(dp(8));
        toolbar.addView(title, titleParams);
        return toolbar;
    }

    private View sectionTitle(String text) {
        TextView title = new TextView(this);
        title.setText(text);
        title.setTextColor(accent);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setPadding(dp(20), dp(18), dp(20), dp(8));
        return title;
    }

    private View switchRow(
            int iconType,
            String title,
            String summary,
            boolean checked,
            BooleanConsumer listener
    ) {
        return switchRow(iconType, title, summary, checked, true, listener);
    }

    private View switchRow(
            int iconType,
            String title,
            String summary,
            boolean checked,
            boolean enabled,
            BooleanConsumer listener
    ) {
        LinearLayout row = baseRow(iconType, title, summary);
        ModernToggleView toggle = new ModernToggleView(
                this,
                accent,
                background,
                primaryText
        );
        toggle.setChecked(checked);
        toggle.setEnabled(enabled);
        toggle.setOnCheckedChangeListener(listener);
        toggle.setContentDescription(
                enabled
                        ? title
                        : title + ". Facebook Dark mode is required."
        );
        row.addView(
                toggle,
                new LinearLayout.LayoutParams(
                        dp(52),
                        dp(32)
                )
        );
        if (enabled) {
            toggle.setOnClickListener(
                    view -> toggle.setChecked(!toggle.isChecked())
            );
            row.setOnClickListener(
                    view -> toggle.setChecked(!toggle.isChecked())
            );
        } else {
            row.setClickable(false);
            row.setFocusable(false);
        }
        return withDivider(row);
    }

    private View infoBanner(String titleText, String summaryText) {
        LinearLayout banner = new LinearLayout(this);
        banner.setOrientation(LinearLayout.HORIZONTAL);
        banner.setGravity(Gravity.CENTER_VERTICAL);
        banner.setPadding(dp(16), dp(12), dp(16), dp(12));
        banner.setBackground(roundedBackground(
                blend(background, accent, isLight(background) ? 0.08f : 0.18f),
                14f
        ));
        banner.setContentDescription(titleText + ". " + summaryText);

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(new FacebookSymbolDrawable(
                FacebookSymbolDrawable.INFO,
                accent
        ));
        icon.setBackground(roundedBackground(
                blend(background, accent, isLight(background) ? 0.14f : 0.28f),
                12f
        ));
        icon.setPadding(dp(8), dp(8), dp(8), dp(8));
        banner.addView(icon, new LinearLayout.LayoutParams(dp(36), dp(36)));

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setPadding(dp(12), 0, 0, 0);

        TextView title = new TextView(this);
        title.setText(titleText);
        title.setTextColor(accent);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        labels.addView(title);

        TextView summary = new TextView(this);
        summary.setText(summaryText);
        summary.setTextColor(secondaryText);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summary.setPadding(0, dp(3), 0, 0);
        labels.addView(summary);

        banner.addView(
                labels,
                new LinearLayout.LayoutParams(
                        0,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                        1f
                )
        );

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        params.setMargins(dp(16), dp(4), dp(16), dp(8));
        banner.setLayoutParams(params);
        return banner;
    }

    private View buttonRow(
            int iconType,
            String title,
            String summary,
            View.OnClickListener listener
    ) {
        LinearLayout row = baseRow(iconType, title, summary);
        row.addView(
                endIcon(FacebookSymbolDrawable.CHEVRON_RIGHT),
                new LinearLayout.LayoutParams(dp(24), dp(24))
        );
        row.setOnClickListener(listener);
        return withDivider(row);
    }

    private View choiceRow(
            int iconType,
            String title,
            String summary,
            String value,
            View.OnClickListener listener
    ) {
        LinearLayout row = baseRow(iconType, title, summary);
        row.setContentDescription(
                title + ". " + summary + " Current value: " + value
        );

        TextView selected = new TextView(this);
        selected.setText(value);
        selected.setTextColor(accent);
        selected.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        selected.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        selected.setGravity(Gravity.CENTER_VERTICAL | Gravity.RIGHT);
        selected.setMaxLines(1);
        selected.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams selectedParams = new LinearLayout.LayoutParams(
                dp(92),
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        selectedParams.setMarginEnd(dp(6));
        row.addView(selected, selectedParams);
        row.addView(
                endIcon(FacebookSymbolDrawable.CHEVRON_RIGHT),
                new LinearLayout.LayoutParams(dp(24), dp(24))
        );
        row.setOnClickListener(listener);
        return withDivider(row);
    }

    private View mediaQualityInfoCard() {
        return infoBanner(
                "Why saved quality can differ",
                "Facebook publishes different direct tracks for each Reel or Story. De-Vanced requests your choice, then uses the nearest track it can actually fetch. If only a higher track exists, that original track is kept; nothing is upscaled. The option cards below explain this."
        );
    }

    private void openExternalUrl(String url) {
        try {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (Throwable error) {
            Toast.makeText(
                    this,
                    "No browser is available for this donation link.",
                    Toast.LENGTH_SHORT
            ).show();
        }
    }

    private void openUpiDonation() {
        try {
            Uri uri = Uri.parse(
                    "upi://pay?pa=rookiez@ptyes&pn=RookieZ&cu=INR"
            );
            startActivity(Intent.createChooser(
                    new Intent(Intent.ACTION_VIEW, uri),
                    "Donate with UPI"
            ));
        } catch (Throwable error) {
            copyToClipboard(
                    "rookiez@ptyes",
                    "UPI ID copied: rookiez@ptyes"
            );
        }
    }

    private void copyToClipboard(String value, String message) {
        ClipboardManager clipboard =
                (ClipboardManager) getSystemService(
                        Context.CLIPBOARD_SERVICE
                );
        if (clipboard != null) {
            clipboard.setPrimaryClip(
                    ClipData.newPlainText("UPI ID", value)
            );
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
        }
    }

    private void showDownloadQualityDialog() {
        DownloadQuality[] qualities = DownloadQuality.values();
        String[] labels = new String[qualities.length];
        String[] descriptions = new String[qualities.length];
        for (int index = 0; index < qualities.length; index++) {
            labels[index] = qualities[index].displayName();
            descriptions[index] = downloadQualityDescription(qualities[index]);
        }
        showQualitySelectorDialog(
                "Download quality",
                "Choose a preferred direct track for saved Reels and Stories.",
                FacebookSymbolDrawable.DOWNLOAD_QUALITY,
                labels,
                descriptions,
                DeVancedSettings.getDownloadQuality().ordinal(),
                selected -> {
                    DeVancedSettings.setDownloadQuality(
                            this,
                            qualities[selected]
                    );
                    refreshContent();
                }
        );
    }

    private void showPlaybackQualityDialog(boolean reels) {
        PlaybackQuality[] qualities = PlaybackQuality.values();
        String[] labels = new String[qualities.length];
        String[] descriptions = new String[qualities.length];
        for (int index = 0; index < qualities.length; index++) {
            labels[index] = qualities[index].displayName();
            descriptions[index] = playbackQualityDescription(qualities[index]);
        }
        PlaybackQuality current = reels
                ? DeVancedSettings.getReelsPlaybackQuality()
                : DeVancedSettings.getStoriesPlaybackQuality();
        showQualitySelectorDialog(
                reels
                        ? "Reels playback quality"
                        : "Stories playback quality",
                "Applies to newly opened media. Facebook may use a nearby direct track when the exact one is not published.",
                reels
                        ? FacebookSymbolDrawable.REELS_QUALITY
                        : FacebookSymbolDrawable.STORIES_QUALITY,
                labels,
                descriptions,
                current.ordinal(),
                selected -> {
                    if (reels) {
                        DeVancedSettings.setReelsPlaybackQuality(
                                this,
                                qualities[selected]
                        );
                    } else {
                        DeVancedSettings.setStoriesPlaybackQuality(
                                this,
                                qualities[selected]
                        );
                    }
                    Toast.makeText(
                            this,
                            "Applies to newly opened media.",
                            Toast.LENGTH_SHORT
                    ).show();
                    refreshContent();
                }
        );
    }

    private void showQualitySelectorDialog(
            String titleText,
            String summaryText,
            int iconType,
            String[] labels,
            String[] descriptions,
            int selectedIndex,
            IntConsumer selection
    ) {
        LinearLayout panel = new LinearLayout(this);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(0, 0, 0, 0);
        panel.setBackgroundColor(Color.TRANSPARENT);

        LinearLayout selectorCard = new LinearLayout(this);
        selectorCard.setOrientation(LinearLayout.VERTICAL);
        selectorCard.setPadding(dp(8), dp(8), dp(8), dp(4));
        selectorCard.setElevation(dpf(2f));
        selectorCard.setBackground(roundedBackground(
                blend(
                        background,
                        primaryText,
                        isLight(background) ? 0.055f : 0.12f
                ),
                20f
        ));

        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(10), dp(10), dp(10), dp(6));

        ImageView headerIcon = new ImageView(this);
        headerIcon.setImageDrawable(resolveRowIcon(iconType));
        headerIcon.setBackground(roundedBackground(
                blend(
                        background,
                        accent,
                        isLight(background) ? 0.13f : 0.25f
                ),
                14f
        ));
        headerIcon.setPadding(dp(9), dp(9), dp(9), dp(9));
        header.addView(headerIcon, new LinearLayout.LayoutParams(dp(44), dp(44)));

        LinearLayout headerLabels = new LinearLayout(this);
        headerLabels.setOrientation(LinearLayout.VERTICAL);
        headerLabels.setPadding(dp(12), 0, 0, 0);

        TextView title = new TextView(this);
        title.setText(titleText);
        title.setTextColor(primaryText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        headerLabels.addView(title);

        TextView summary = new TextView(this);
        summary.setText(summaryText);
        summary.setTextColor(secondaryText);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summary.setMaxLines(3);
        summary.setPadding(0, dp(3), 0, 0);
        headerLabels.addView(summary);

        header.addView(
                headerLabels,
                new LinearLayout.LayoutParams(
                        0,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                        1f
                )
        );
        selectorCard.addView(header);

        TextView current = new TextView(this);
        current.setText("SELECTED  \u00b7  " + labels[selectedIndex]);
        current.setTextColor(accent);
        current.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        current.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        current.setLetterSpacing(0.04f);
        current.setPadding(dp(10), dp(7), dp(10), dp(7));
        current.setBackground(roundedBackground(
                blend(
                        background,
                        accent,
                        isLight(background) ? 0.10f : 0.22f
                ),
                10f
        ));
        LinearLayout.LayoutParams currentParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        currentParams.setMargins(dp(10), dp(4), dp(10), dp(4));
        selectorCard.addView(current, currentParams);

        LinearLayout options = new LinearLayout(this);
        options.setOrientation(LinearLayout.VERTICAL);
        options.setPadding(0, dp(4), 0, dp(4));
        final Dialog[] dialog = new Dialog[1];
        for (int index = 0; index < labels.length; index++) {
            final int selected = index;
            if (index > 0) {
                options.addView(qualityOptionDivider());
            }
            LinearLayout option = qualityOptionRow(
                    labels[index],
                    descriptions[index],
                    qualityBadge(labels[index]),
                    index == selectedIndex,
                    () -> {
                        selection.accept(selected);
                        if (dialog[0] != null) {
                            dialog[0].dismiss();
                        }
                    }
            );
            options.addView(option);
        }
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.addView(options);
        selectorCard.addView(
                scroll,
                new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        0,
                        1f
                )
        );

        TextView cancel = new TextView(this);
        cancel.setText("Cancel");
        cancel.setTextColor(accent);
        cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        cancel.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        cancel.setGravity(Gravity.CENTER);
        cancel.setPadding(dp(18), dp(10), dp(18), dp(10));
        cancel.setBackground(pressableBackground(Color.TRANSPARENT, 12f));
        cancel.setClickable(true);
        cancel.setFocusable(true);
        cancel.setOnClickListener(view -> {
            if (dialog[0] != null) {
                dialog[0].dismiss();
            }
        });
        LinearLayout.LayoutParams cancelParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        cancelParams.gravity = Gravity.RIGHT;
        selectorCard.addView(cancel, cancelParams);
        panel.addView(
                selectorCard,
                new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        0,
                        1f
                )
        );

        dialog[0] = new Dialog(this);
        dialog[0].setContentView(panel);
        dialog[0].setCanceledOnTouchOutside(true);
        dialog[0].show();
        Window dialogWindow = dialog[0].getWindow();
        if (dialogWindow != null) {
            dialogWindow.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            dialogWindow.setDimAmount(0.55f);
            dialogWindow.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            dialogWindow.setLayout(
                    Math.round(
                            getResources().getDisplayMetrics().widthPixels *
                                    0.92f
                    ),
                    WindowManager.LayoutParams.WRAP_CONTENT
            );
        }
    }

    private LinearLayout qualityOptionRow(
            String label,
            String description,
            String badge,
            boolean selected,
            Runnable action
    ) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(12), dp(10), dp(12), dp(10));
        row.setMinimumHeight(dp(66));
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(
                label + ". " + description +
                        (selected ? ". Selected." : "")
        );
        row.setBackground(pressableBackground(
                selected
                        ? blend(
                                background,
                                accent,
                                isLight(background) ? 0.075f : 0.15f
                        )
                        : Color.TRANSPARENT,
                12f
        ));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        );
        row.setLayoutParams(params);

        TextView badgeView = new TextView(this);
        badgeView.setText(badge);
        badgeView.setTextColor(selected ? accent : secondaryText);
        badgeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        badgeView.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        badgeView.setGravity(Gravity.CENTER);
        badgeView.setSingleLine(true);
        row.addView(
                badgeView,
                new LinearLayout.LayoutParams(
                        dp(58),
                        dp(36)
                )
        );

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setPadding(dp(12), 0, dp(8), 0);

        TextView quality = new TextView(this);
        quality.setText(label);
        quality.setTextColor(primaryText);
        quality.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        quality.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        labels.addView(quality);

        TextView detail = new TextView(this);
        detail.setText(description);
        detail.setTextColor(secondaryText);
        detail.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        detail.setMaxLines(2);
        detail.setPadding(0, dp(2), 0, 0);
        labels.addView(detail);

        row.addView(
                labels,
                new LinearLayout.LayoutParams(
                        0,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                        1f
                )
        );

        QualitySelectionView state = new QualitySelectionView(this, selected);
        row.addView(
                state,
                new LinearLayout.LayoutParams(dp(28), dp(28))
        );
        row.setOnClickListener(view -> action.run());
        return row;
    }

    private View qualityOptionDivider() {
        View line = new View(this);
        line.setBackgroundColor(
                blend(
                        background,
                        primaryText,
                        isLight(background) ? 0.10f : 0.16f
                )
        );
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(1))
        );
        params.setMargins(dp(70), 0, dp(12), 0);
        line.setLayoutParams(params);
        return line;
    }

    private String downloadQualityDescription(DownloadQuality quality) {
        if (quality == DownloadQuality.HIGHEST) {
            return "Use the largest direct video track Facebook publishes.";
        }
        return "Prefer a direct " + quality.displayName() +
                " track; use the nearest published track when it is missing.";
    }

    private String playbackQualityDescription(PlaybackQuality quality) {
        if (quality == PlaybackQuality.AUTO) {
            return "Let Facebook adapt playback to the connection and device.";
        }
        return "Prefer direct " + quality.displayName() +
                " playback; Facebook may use a nearby published track.";
    }

    private String qualityBadge(String label) {
        if ("Highest available".equals(label)) return "MAX";
        if ("Auto".equals(label)) return "AUTO";
        return label.replace("p", "");
    }

    private void showRefreshHomeMessage() {
        Toast.makeText(
                this,
                "Refresh Home to apply this change.",
                Toast.LENGTH_SHORT
        ).show();
    }

    private LinearLayout baseRow(int iconType, String title, String summary) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20), dp(12), dp(20), dp(12));
        row.setMinimumHeight(dp(76));
        row.setBackgroundColor(background);
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(title + ". " + summary);

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(resolveRowIcon(iconType));
        icon.setBackground(roundedBackground(
                blend(background, accent, isLight(background) ? 0.08f : 0.16f),
                12f
        ));
        icon.setPadding(dp(7), dp(7), dp(7), dp(7));
        LinearLayout.LayoutParams iconParams =
                new LinearLayout.LayoutParams(dp(36), dp(36));
        iconParams.setMarginEnd(dp(14));
        row.addView(icon, iconParams);

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setGravity(Gravity.CENTER_VERTICAL);

        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextColor(primaryText);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        labels.addView(titleView);

        TextView summaryView = new TextView(this);
        summaryView.setText(summary);
        summaryView.setTextColor(secondaryText);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summaryView.setPadding(0, dp(3), 0, 0);
        labels.addView(summaryView);

        row.addView(
                labels,
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f)
        );
        return row;
    }

    private Drawable resolveRowIcon(int iconType) {
        if (iconType == FacebookSymbolDrawable.DOWNLOAD_QUALITY) {
            int nativeHd = getResources().getIdentifier(
                    "fb_ic_hd_24",
                    "drawable",
                    getPackageName()
            );
            if (nativeHd != 0) {
                try {
                    Drawable drawable = getDrawable(nativeHd);
                    if (drawable != null) return drawable;
                } catch (Throwable ignored) {
                }
            }
        }
        return new FacebookSymbolDrawable(iconType, primaryText);
    }

    private View withDivider(View row) {
        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setBackgroundColor(background);
        container.addView(
                row,
                new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT
                )
        );
        container.addView(dividerView());
        return container;
    }

    private View dividerView() {
        View line = new View(this);
        line.setBackgroundColor(divider);
        line.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(1))
        ));
        return line;
    }

    private void resolveColors() {
        if (darkMode) {
            background = DeVancedSettings.isAmoledThemeEnabled()
                    ? Color.BLACK
                    : 0xff242526;
            primaryText = 0xffe4e6eb;
            secondaryText = 0xffb0b3b8;
            accent = 0xff4599ff;
            if (DeVancedSettings.isMaterialYouThemeEnabled()) {
                background = MaterialYouTheme.recolorSurface(background);
                primaryText = MaterialYouTheme.recolorSurface(primaryText);
                secondaryText = MaterialYouTheme.recolorSurface(secondaryText);
                accent = MaterialYouTheme.recolorSurface(accent);
            }
            divider = blend(background, primaryText, 0.16f);
            return;
        }

        TypedArray values = obtainStyledAttributes(new int[]{
                android.R.attr.colorBackground,
                android.R.attr.textColorPrimary,
                android.R.attr.textColorSecondary,
                android.R.attr.colorAccent
        });
        try {
            background = values.getColor(0, Color.WHITE);
            primaryText = values.getColor(1, 0xff050505);
            secondaryText = values.getColor(2, 0xff65676b);
            accent = values.getColor(3, 0xff0866ff);
        } finally {
            values.recycle();
        }
        if (DeVancedSettings.isMaterialYouThemeEnabled()) {
            background = MaterialYouTheme.recolorSurface(background);
            primaryText = MaterialYouTheme.recolorSurface(primaryText);
            secondaryText = MaterialYouTheme.recolorSurface(secondaryText);
            accent = MaterialYouTheme.recolorSurface(accent);
        }
        divider = blend(background, primaryText, 0.16f);
    }

    private boolean isFacebookDarkMode() {
        Context host = Utils.getActivity();
        return AmoledTheme.isFacebookDarkMode(
                host == null ? getApplicationContext() : host
        );
    }

    private void styleWindow() {
        Window window = getWindow();
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        window.getDecorView().setSystemUiVisibility(
                isLight(background)
                        ? View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR |
                                View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
                        : 0
        );
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private float dpf(float value) {
        return value * getResources().getDisplayMetrics().density;
    }

    private ImageView endIcon(int iconType) {
        ImageView icon = new ImageView(this);
        icon.setImageDrawable(new FacebookSymbolDrawable(iconType, secondaryText));
        return icon;
    }

    private GradientDrawable roundedBackground(int color, float radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dpf(radiusDp));
        return drawable;
    }

    private Drawable pressableBackground(int color, float radiusDp) {
        return new RippleDrawable(
                ColorStateList.valueOf(
                        blend(
                                background,
                                accent,
                                isLight(background) ? 0.18f : 0.30f
                        )
                ),
                roundedBackground(color, radiusDp),
                roundedBackground(Color.WHITE, radiusDp)
        );
    }

    private static int blend(int background, int foreground, float amount) {
        int red = Math.round(
                Color.red(background) * (1f - amount) +
                        Color.red(foreground) * amount
        );
        int green = Math.round(
                Color.green(background) * (1f - amount) +
                        Color.green(foreground) * amount
        );
        int blue = Math.round(
                Color.blue(background) * (1f - amount) +
                        Color.blue(foreground) * amount
        );
        return Color.rgb(red, green, blue);
    }

    private static boolean isLight(int color) {
        int brightness =
                (Color.red(color) * 299 +
                        Color.green(color) * 587 +
                        Color.blue(color) * 114) / 1000;
        return brightness >= 160;
    }

    private final class QualitySelectionView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final boolean selected;

        QualitySelectionView(Context context, boolean selected) {
            super(context);
            this.selected = selected;
            setContentDescription(selected ? "Selected" : "Not selected");
        }

        @Override
        protected void onMeasure(
                int widthMeasureSpec,
                int heightMeasureSpec
        ) {
            int size = dp(28);
            setMeasuredDimension(
                    resolveSize(size, widthMeasureSpec),
                    resolveSize(size, heightMeasureSpec)
            );
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float center = getWidth() / 2f;
            float radius = Math.min(getWidth(), getHeight()) * 0.34f;
            paint.setStrokeWidth(Math.max(1.8f, dpf(1.8f)));
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            if (selected) {
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(accent);
                canvas.drawCircle(center, getHeight() / 2f, radius, paint);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(1.7f, dpf(1.7f)));
                paint.setColor(Color.WHITE);
                Path check = new Path();
                check.moveTo(center - radius * 0.45f, getHeight() / 2f);
                check.lineTo(center - radius * 0.10f, getHeight() / 2f + radius * 0.35f);
                check.lineTo(center + radius * 0.50f, getHeight() / 2f - radius * 0.38f);
                canvas.drawPath(check, paint);
            } else {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(1.6f, dpf(1.6f)));
                paint.setColor(secondaryText);
                canvas.drawCircle(center, getHeight() / 2f, radius, paint);
            }
        }
    }

    private static final class ModernToggleView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int accentColor;
        private final int backgroundColor;
        private final int primaryColor;
        private boolean checked;
        private float position;
        private ValueAnimator animator;
        private BooleanConsumer listener;

        ModernToggleView(
                Context context,
                int accentColor,
                int backgroundColor,
                int primaryColor
        ) {
            super(context);
            this.accentColor = accentColor;
            this.backgroundColor = backgroundColor;
            this.primaryColor = primaryColor;
            setClickable(true);
            setFocusable(true);
        }

        boolean isChecked() {
            return checked;
        }

        void setChecked(boolean value) {
            if (checked == value) {
                invalidate();
                return;
            }
            checked = value;
            setSelected(value);
            animatePosition(value ? 1f : 0f);
            if (listener != null) {
                listener.accept(value);
            }
        }

        void setOnCheckedChangeListener(BooleanConsumer listener) {
            this.listener = listener;
        }

        @Override
        public void setEnabled(boolean enabled) {
            super.setEnabled(enabled);
            invalidate();
        }

        @Override
        protected void onDetachedFromWindow() {
            if (animator != null) {
                animator.cancel();
                animator = null;
            }
            super.onDetachedFromWindow();
        }

        @Override
        protected void onMeasure(
                int widthMeasureSpec,
                int heightMeasureSpec
        ) {
            setMeasuredDimension(
                    resolveSize(dp(52), widthMeasureSpec),
                    resolveSize(dp(32), heightMeasureSpec)
            );
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float width = getWidth();
            float height = getHeight();
            float radius = height / 2f;

            int trackColor;
            int thumbColor;
            if (!isEnabled()) {
                trackColor = blend(
                        backgroundColor,
                        primaryColor,
                        isLight(backgroundColor) ? 0.10f : 0.16f
                );
                thumbColor = blend(
                        backgroundColor,
                        primaryColor,
                        isLight(backgroundColor) ? 0.32f : 0.42f
                );
            } else if (checked) {
                int offTrack = blend(
                        backgroundColor,
                        primaryColor,
                        isLight(backgroundColor) ? 0.22f : 0.30f
                );
                int offThumb = blend(
                        backgroundColor,
                        primaryColor,
                        isLight(backgroundColor) ? 0.90f : 0.75f
                );
                trackColor = blend(
                        offTrack,
                        accentColor,
                        position
                );
                thumbColor = blend(
                        offThumb,
                        Color.WHITE,
                        position
                );
            } else {
                int offTrack = blend(
                        backgroundColor,
                        primaryColor,
                        isLight(backgroundColor) ? 0.22f : 0.30f
                );
                int offThumb = blend(
                        backgroundColor,
                        primaryColor,
                        isLight(backgroundColor) ? 0.90f : 0.75f
                );
                trackColor = blend(
                        offTrack,
                        accentColor,
                        position
                );
                thumbColor = blend(
                        offThumb,
                        Color.WHITE,
                        position
                );
            }

            paint.setStyle(Paint.Style.FILL);
            paint.setColor(trackColor);
            canvas.drawRoundRect(
                    new RectF(0, 0, width, height),
                    radius,
                    radius,
                    paint
            );

            float thumbRadius = height * 0.35f;
            float thumbCenterX = height / 2f +
                    (width - height) * position;
            paint.setColor(thumbColor);
            canvas.drawCircle(
                    thumbCenterX,
                    height / 2f,
                    thumbRadius,
                    paint
            );
        }

        private void animatePosition(float target) {
            if (animator != null) {
                animator.cancel();
                animator = null;
            }
            if (!isLaidOut() || getWindowToken() == null) {
                position = target;
                invalidate();
                return;
            }
            animator = ValueAnimator.ofFloat(position, target);
            animator.setDuration(180L);
            animator.setInterpolator(
                    new android.view.animation
                            .AccelerateDecelerateInterpolator()
            );
            animator.addUpdateListener(animation -> {
                position = (Float) animation.getAnimatedValue();
                invalidate();
            });
            animator.start();
        }

        private int dp(int value) {
            return Math.round(
                    value * getResources().getDisplayMetrics().density
            );
        }
    }

    private interface BooleanConsumer {
        void accept(boolean value);
    }

    private interface IntConsumer {
        void accept(int value);
    }
}
