package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class GboardAppearanceActivity extends Activity {

    private static final String PREF_NAME = "gboard_pro_appearance_prefs";
    private static final String KEY_ACTIVE_ICON = "selected_launcher_icon";
    private static final String KEY_UI_THEME = "selected_gboard_ui_theme";

    public static final class IconOption {
        public final String id;
        public final String name;
        public final String description;
        public final String aliasSuffix;
        public final String assetPath;
        public final int fallbackResId;

        public IconOption(String id, String name, String description, String aliasSuffix, String assetPath, int fallbackResId) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.aliasSuffix = aliasSuffix;
            this.assetPath = assetPath;
            this.fallbackResId = fallbackResId;
        }
    }

    public static final class UiThemeOption {
        public final String id;
        public final String name;
        public final String description;
        public final int[] swatchColors;

        public UiThemeOption(String id, String name, String description, int[] swatchColors) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.swatchColors = swatchColors;
        }
    }

    private GboardM3Helper.Palette palette;
    private final List<IconOption> iconOptions = new ArrayList<IconOption>();
    private final List<UiThemeOption> themeOptions = new ArrayList<UiThemeOption>();
    private LinearLayout listContainer;
    private LinearLayout themeContainer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        try {
            setTheme(GboardM3Helper.resolveActivityTheme(this));
        } catch (Throwable ignored) {
        }
        super.onCreate(savedInstanceState);

        try {
            palette = GboardM3Helper.Palette.forContext(this);
            GboardM3Helper.initActivity(this, palette);

            initIconOptions();
            initUiThemeOptions();

            LinearLayout root = new LinearLayout(this);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(palette.windowBackground);
            root.setLayoutParams(new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            root.addView(GboardM3Helper.createToolbar(this, "Appearance", palette));

            ScrollView scrollView = new ScrollView(this);
            scrollView.setFillViewport(true);
            scrollView.setVerticalScrollBarEnabled(false);

            LinearLayout content = new LinearLayout(this);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 8),
                    GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 32));

            // Header Intro Card
            content.addView(buildHeaderCard());

            // Category 1: APP LAUNCHER ICONS
            TextView categoryLabel = new TextView(this);
            categoryLabel.setText("APP LAUNCHER ICONS");
            categoryLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            categoryLabel.setTypeface(Typeface.DEFAULT_BOLD);
            categoryLabel.setTextColor(palette.accent);
            categoryLabel.setPadding(GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 16),
                    GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 8));
            content.addView(categoryLabel);

            // Icons List
            listContainer = new LinearLayout(this);
            listContainer.setOrientation(LinearLayout.VERTICAL);
            content.addView(listContainer);
            renderIconList();

            // Category 2: GBOARD UI with BETA badge
            LinearLayout uiHeaderRow = new LinearLayout(this);
            uiHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
            uiHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
            uiHeaderRow.setPadding(GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 24),
                    GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 8));

            TextView uiLabel = new TextView(this);
            uiLabel.setText("GBOARD UI");
            uiLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            uiLabel.setTypeface(Typeface.DEFAULT_BOLD);
            uiLabel.setTextColor(palette.accent);
            uiHeaderRow.addView(uiLabel);

            View badgeSpacer = new View(this);
            uiHeaderRow.addView(badgeSpacer, new LinearLayout.LayoutParams(GboardM3Helper.dp(this, 8), 1));

            TextView betaBadge = new TextView(this);
            betaBadge.setText("beta");
            betaBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
            betaBadge.setTypeface(Typeface.DEFAULT_BOLD);
            betaBadge.setTextColor(palette.onAccentContainer);
            betaBadge.setBackground(GboardM3Helper.createCardDrawable(
                    palette.accentContainer, Color.TRANSPARENT, GboardM3Helper.dp(this, 6)));
            betaBadge.setPadding(GboardM3Helper.dp(this, 7), GboardM3Helper.dp(this, 2),
                    GboardM3Helper.dp(this, 7), GboardM3Helper.dp(this, 2));
            uiHeaderRow.addView(betaBadge);

            content.addView(uiHeaderRow);

            // Theme List
            themeContainer = new LinearLayout(this);
            themeContainer.setOrientation(LinearLayout.VERTICAL);
            content.addView(themeContainer);
            renderThemeList();

            scrollView.addView(content);
            root.addView(scrollView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            setContentView(root);
        } catch (Throwable t) {
            fallbackView(t);
        }
    }

    private void fallbackView(Throwable t) {
        try {
            LinearLayout fallback = new LinearLayout(this);
            fallback.setOrientation(LinearLayout.VERTICAL);
            fallback.setPadding(32, 64, 32, 32);
            TextView tv = new TextView(this);
            tv.setText("Appearance Settings\n\nCustomization options active.");
            tv.setTextSize(16f);
            fallback.addView(tv);
            setContentView(fallback);
        } catch (Throwable ignored) {
        }
    }

    private void initIconOptions() {
        iconOptions.clear();
        iconOptions.add(new IconOption(
                "default",
                "Classic Gboard Pro",
                "Official Material You adaptive icon with dynamic monochrome theme",
                "launcher.Default",
                "custom_icons/preview/default.png",
                0
        ));
        iconOptions.add(new IconOption(
                "purple",
                "Expressive Purple",
                "Vibrant violet-purple gradient with high contrast keycap glow",
                "launcher.Purple",
                "custom_icons/preview/icon_purple.png",
                0
        ));
        iconOptions.add(new IconOption(
                "slate",
                "Slate Charcoal",
                "Minimalist graphite matte aesthetic with clean neutral tones",
                "launcher.Slate",
                "custom_icons/preview/icon_slate.png",
                0
        ));
        iconOptions.add(new IconOption(
                "forest_green",
                "Forest Emerald",
                "Nature-inspired emerald green with deep sage keycaps",
                "launcher.ForestGreen",
                "custom_icons/preview/icon_forest_green.png",
                0
        ));
        iconOptions.add(new IconOption(
                "navy_blue",
                "Midnight Navy",
                "Deep indigo and cobalt blue with luminous typing accent",
                "launcher.NavyBlue",
                "custom_icons/preview/icon_navy_blue.png",
                0
        ));
    }

    private void initUiThemeOptions() {
        themeOptions.clear();
        themeOptions.add(new UiThemeOption(
                "default",
                "Default Dynamic",
                "Adaptive Material You dynamic tones matching your device wallpaper",
                new int[]{0xFF0B57D0, 0xFF4285F4, 0xFFD3E3FD}
        ));
        themeOptions.add(new UiThemeOption(
                "rainbow",
                "Expressive Rainbow",
                "Vivid sunset coral, golden amber, and warm peach expressive tones",
                new int[]{0xFFE64A19, 0xFFFF7043, 0xFFFFCCBC}
        ));
        themeOptions.add(new UiThemeOption(
                "botanical",
                "Fresh Botanical",
                "Spring mint, fresh eucalyptus sage, and pastel botanical clover vibe",
                new int[]{0xFF00796B, 0xFF4DB6AC, 0xFFC8E6C9}
        ));
        themeOptions.add(new UiThemeOption(
                "ocean",
                "Ocean Lavender",
                "Coastal azure indigo, radiant twilight lavender, and soft lilac vibe",
                new int[]{0xFF3949AB, 0xFF7986CB, 0xFFD1C4E9}
        ));
    }

    private View buildHeaderCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 20)));
        card.setPadding(GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 18),
                GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 18));

        TextView title = new TextView(this);
        title.setText("Customize Application Theme");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(palette.textPrimary);
        card.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText("Select your preferred launcher icon style and expressive Material 3 UI vibe. Changes take effect across your interface immediately.");
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        subtitle.setTextColor(palette.textSecondary);
        subtitle.setLineSpacing(GboardM3Helper.dp(this, 2), 1.1f);
        LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subLp.topMargin = GboardM3Helper.dp(this, 6);
        card.addView(subtitle, subLp);

        return card;
    }

    private String getSelectedIconId() {
        SharedPreferences prefs = getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
        return prefs.getString(KEY_ACTIVE_ICON, "default");
    }

    private String getSelectedUiThemeId() {
        SharedPreferences prefs = getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
        return prefs.getString(KEY_UI_THEME, "default");
    }

    private void renderIconList() {
        listContainer.removeAllViews();
        String currentSelected = getSelectedIconId();

        for (final IconOption option : iconOptions) {
            final boolean isSelected = option.id.equals(currentSelected);

            LinearLayout itemCard = new LinearLayout(this);
            itemCard.setOrientation(LinearLayout.HORIZONTAL);
            itemCard.setGravity(Gravity.CENTER_VERTICAL);

            int bgColor = isSelected ? palette.accentContainer : palette.surface;
            int strokeColor = isSelected ? palette.accent : palette.surfaceStroke;
            itemCard.setBackground(GboardM3Helper.createClickableCardDrawable(
                    bgColor, strokeColor, palette.ripple, GboardM3Helper.dp(this, 18)));
            itemCard.setPadding(GboardM3Helper.dp(this, 14), GboardM3Helper.dp(this, 12),
                    GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 12));

            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardLp.bottomMargin = GboardM3Helper.dp(this, 10);
            itemCard.setLayoutParams(cardLp);

            // Icon Image container (Squircle preview)
            FrameLayout iconFrame = new FrameLayout(this);
            iconFrame.setBackground(GboardM3Helper.createCardDrawable(
                    palette.surfaceAlt, palette.surfaceStroke, GboardM3Helper.dp(this, 14)));
            int frameSize = GboardM3Helper.dp(this, 56);
            LinearLayout.LayoutParams frameLp = new LinearLayout.LayoutParams(frameSize, frameSize);
            frameLp.rightMargin = GboardM3Helper.dp(this, 14);

            ImageView iconView = new ImageView(this);
            iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            Drawable iconDrawable = loadIconDrawable(option);
            if (iconDrawable != null) {
                iconView.setImageDrawable(iconDrawable);
            }
            iconFrame.addView(iconView, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            itemCard.addView(iconFrame, frameLp);

            // Text Info
            LinearLayout textColumn = new LinearLayout(this);
            textColumn.setOrientation(LinearLayout.VERTICAL);

            TextView nameView = new TextView(this);
            nameView.setText(option.name);
            nameView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            nameView.setTypeface(Typeface.DEFAULT_BOLD);
            nameView.setTextColor(isSelected ? palette.onAccentContainer : palette.textPrimary);
            textColumn.addView(nameView);

            TextView descView = new TextView(this);
            descView.setText(option.description);
            descView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            descView.setTextColor(isSelected ? palette.onAccentContainer : palette.textSecondary);
            LinearLayout.LayoutParams descLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            descLp.topMargin = GboardM3Helper.dp(this, 2);
            textColumn.addView(descView, descLp);

            itemCard.addView(textColumn, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

            // Selection indicator badge
            if (isSelected) {
                TextView activeBadge = new TextView(this);
                activeBadge.setText("Active");
                activeBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                activeBadge.setTypeface(Typeface.DEFAULT_BOLD);
                activeBadge.setTextColor(palette.onAccentContainer);
                activeBadge.setBackground(GboardM3Helper.createCardDrawable(
                        GboardM3Helper.blendAlpha(palette.accent, 0.25f), Color.TRANSPARENT, GboardM3Helper.dp(this, 10)));
                activeBadge.setPadding(GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4),
                        GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4));
                itemCard.addView(activeBadge);
            }

            itemCard.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    applyIconSelection(option);
                }
            });

            listContainer.addView(itemCard);
        }
    }

    private void renderThemeList() {
        themeContainer.removeAllViews();
        String currentSelectedTheme = getSelectedUiThemeId();

        for (final UiThemeOption option : themeOptions) {
            final boolean isSelected = option.id.equals(currentSelectedTheme);

            LinearLayout itemCard = new LinearLayout(this);
            itemCard.setOrientation(LinearLayout.HORIZONTAL);
            itemCard.setGravity(Gravity.CENTER_VERTICAL);

            int bgColor = isSelected ? palette.accentContainer : palette.surface;
            int strokeColor = isSelected ? palette.accent : palette.surfaceStroke;
            itemCard.setBackground(GboardM3Helper.createClickableCardDrawable(
                    bgColor, strokeColor, palette.ripple, GboardM3Helper.dp(this, 18)));
            itemCard.setPadding(GboardM3Helper.dp(this, 14), GboardM3Helper.dp(this, 14),
                    GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 14));

            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardLp.bottomMargin = GboardM3Helper.dp(this, 10);
            itemCard.setLayoutParams(cardLp);

            // Swatch Preview Pill
            LinearLayout swatchLayout = new LinearLayout(this);
            swatchLayout.setOrientation(LinearLayout.HORIZONTAL);
            swatchLayout.setGravity(Gravity.CENTER);
            swatchLayout.setBackground(GboardM3Helper.createCardDrawable(
                    palette.surfaceAlt, palette.surfaceStroke, GboardM3Helper.dp(this, 16)));
            swatchLayout.setPadding(GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 8),
                    GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 8));

            for (int color : option.swatchColors) {
                View circle = new View(this);
                GradientDrawable circleDrawable = new GradientDrawable();
                circleDrawable.setShape(GradientDrawable.OVAL);
                circleDrawable.setColor(color);
                circle.setBackground(circleDrawable);

                int dotSize = GboardM3Helper.dp(this, 14);
                LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dotSize, dotSize);
                dotLp.setMargins(GboardM3Helper.dp(this, 2), 0, GboardM3Helper.dp(this, 2), 0);
                swatchLayout.addView(circle, dotLp);
            }

            LinearLayout.LayoutParams swatchLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            swatchLp.rightMargin = GboardM3Helper.dp(this, 14);
            itemCard.addView(swatchLayout, swatchLp);

            // Text Info
            LinearLayout textColumn = new LinearLayout(this);
            textColumn.setOrientation(LinearLayout.VERTICAL);

            TextView nameView = new TextView(this);
            nameView.setText(option.name);
            nameView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            nameView.setTypeface(Typeface.DEFAULT_BOLD);
            nameView.setTextColor(isSelected ? palette.onAccentContainer : palette.textPrimary);
            textColumn.addView(nameView);

            TextView descView = new TextView(this);
            descView.setText(option.description);
            descView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            descView.setTextColor(isSelected ? palette.onAccentContainer : palette.textSecondary);
            LinearLayout.LayoutParams descLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            descLp.topMargin = GboardM3Helper.dp(this, 2);
            textColumn.addView(descView, descLp);

            itemCard.addView(textColumn, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

            // Selection indicator badge
            if (isSelected) {
                TextView activeBadge = new TextView(this);
                activeBadge.setText("Active");
                activeBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                activeBadge.setTypeface(Typeface.DEFAULT_BOLD);
                activeBadge.setTextColor(palette.onAccentContainer);
                activeBadge.setBackground(GboardM3Helper.createCardDrawable(
                        GboardM3Helper.blendAlpha(palette.accent, 0.25f), Color.TRANSPARENT, GboardM3Helper.dp(this, 10)));
                activeBadge.setPadding(GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4),
                        GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4));
                itemCard.addView(activeBadge);
            }

            itemCard.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    applyThemeSelection(option);
                }
            });

            themeContainer.addView(itemCard);
        }
    }

    private Drawable loadIconDrawable(IconOption option) {
        try {
            InputStream is = getAssets().open(option.assetPath);
            Bitmap bitmap = BitmapFactory.decodeStream(is);
            is.close();
            if (bitmap != null) {
                return new BitmapDrawable(getResources(), bitmap);
            }
        } catch (Throwable ignored) {
        }
        // Fallback to app icon
        try {
            return getPackageManager().getApplicationIcon(getPackageName());
        } catch (Throwable ignored) {
            return null;
        }
    }

    private void applyIconSelection(IconOption selectedOption) {
        String current = getSelectedIconId();
        if (current.equals(selectedOption.id)) {
            Toast.makeText(this, selectedOption.name + " is already active", Toast.LENGTH_SHORT).show();
            return;
        }

        // Save preference
        getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                .edit()
                .putString(KEY_ACTIVE_ICON, selectedOption.id)
                .apply();

        // Toggle activity aliases
        try {
            PackageManager pm = getPackageManager();
            String pkg = getPackageName();

            for (IconOption opt : iconOptions) {
                ComponentName component = new ComponentName(pkg, pkg + "." + opt.aliasSuffix);
                int state = opt.id.equals(selectedOption.id)
                        ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
                pm.setComponentEnabledSetting(component, state, PackageManager.DONT_KILL_APP);
            }
        } catch (Throwable t) {
            // Log or ignore if alias not registered yet
        }

        Toast.makeText(this, "Launcher icon updated: " + selectedOption.name, Toast.LENGTH_SHORT).show();
        renderIconList();
    }

    private void applyThemeSelection(UiThemeOption selectedOption) {
        String current = getSelectedUiThemeId();
        if (current.equals(selectedOption.id)) {
            Toast.makeText(this, selectedOption.name + " is already active", Toast.LENGTH_SHORT).show();
            return;
        }

        getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                .edit()
                .putString(KEY_UI_THEME, selectedOption.id)
                .apply();

        Toast.makeText(this, "Gboard UI theme updated: " + selectedOption.name, Toast.LENGTH_SHORT).show();
        recreate();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        GboardM3Helper.applyActivityExitTransition(this);
    }
}
