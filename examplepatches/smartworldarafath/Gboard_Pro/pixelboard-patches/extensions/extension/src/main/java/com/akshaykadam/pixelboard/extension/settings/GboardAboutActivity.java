package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.InputStream;

public class GboardAboutActivity extends Activity {

    private GboardM3Helper.Palette palette;

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

            LinearLayout root = new LinearLayout(this);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(palette.windowBackground);
            root.setLayoutParams(new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            root.addView(GboardM3Helper.createToolbar(this, "About", palette));

            ScrollView scrollView = new ScrollView(this);
            scrollView.setFillViewport(true);
            scrollView.setVerticalScrollBarEnabled(false);

            LinearLayout content = new LinearLayout(this);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 12),
                    GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 32));

            // 1. Top App Branding Card
            content.addView(buildAppHeroCard());

            // 2. Information / Legal Section
            TextView legalLabel = new TextView(this);
            legalLabel.setText("LEGAL & LICENSES");
            legalLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            legalLabel.setTypeface(Typeface.DEFAULT_BOLD);
            legalLabel.setTextColor(palette.accent);
            legalLabel.setPadding(GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 20),
                    GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 8));
            content.addView(legalLabel);

            LinearLayout itemsCard = new LinearLayout(this);
            itemsCard.setOrientation(LinearLayout.VERTICAL);
            itemsCard.setBackground(GboardM3Helper.createCardDrawable(
                    palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 20)));

            itemsCard.addView(buildClickableItem(
                    "Terms of Service",
                    "Terms governing usage and services",
                    "https://github.com/smartworldarafath/Gboard_Pro#readme",
                    true
            ));
            itemsCard.addView(buildDivider());

            itemsCard.addView(buildClickableItem(
                    "Privacy Policy",
                    "Strict zero-telemetry and on-device privacy guarantee",
                    "https://github.com/smartworldarafath/Gboard_Pro#privacy--terms",
                    true
            ));
            itemsCard.addView(buildDivider());

            itemsCard.addView(buildClickableItem(
                    "Open source licenses",
                    "GNU General Public License v3.0 (GPLv3) & dependencies",
                    "https://github.com/smartworldarafath/Gboard_Pro/blob/main/LICENSE",
                    true
            ));
            itemsCard.addView(buildDivider());

            itemsCard.addView(buildClickableItem(
                    "Current version",
                    "v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + " (18.4.1.985164140-release-arm64-v8a)",
                    "https://github.com/smartworldarafath/Gboard_Pro/releases",
                    false
            ));

            content.addView(itemsCard);

            // 3. Developer Section
            TextView devLabel = new TextView(this);
            devLabel.setText("DEVELOPER & COMMUNITY");
            devLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            devLabel.setTypeface(Typeface.DEFAULT_BOLD);
            devLabel.setTextColor(palette.accent);
            devLabel.setPadding(GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 24),
                    GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 8));
            content.addView(devLabel);

            content.addView(buildDeveloperCard());

            scrollView.addView(content);
            root.addView(scrollView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            setContentView(root);
        } catch (Throwable t) {
            Log.e("GboardAboutActivity", "Error in onCreate", t);
            fallbackView(t);
        }
    }

    private void fallbackView(Throwable t) {
        try {
            LinearLayout fallback = new LinearLayout(this);
            fallback.setOrientation(LinearLayout.VERTICAL);
            fallback.setPadding(32, 64, 32, 32);
            TextView tv = new TextView(this);
            tv.setText("Gboard Pro\nVersion " + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + "\n\nDeveloper: Arafath Rahman (@smartworldarafath)\nGitHub: https://github.com/smartworldarafath/Gboard_Pro");
            tv.setTextSize(16f);
            fallback.addView(tv);
            setContentView(fallback);
        } catch (Throwable ignored) {
        }
    }

    private View buildAppHeroCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 24)));
        card.setPadding(GboardM3Helper.dp(this, 24), GboardM3Helper.dp(this, 28),
                GboardM3Helper.dp(this, 24), GboardM3Helper.dp(this, 28));

        // App Icon
        FrameLayout iconFrame = new FrameLayout(this);
        int frameSize = GboardM3Helper.dp(this, 84);
        iconFrame.setBackground(GboardM3Helper.createCardDrawable(
                palette.surfaceAlt, palette.surfaceStroke, GboardM3Helper.dp(this, 22)));

        ImageView iconView = new ImageView(this);
        iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        iconView.setImageDrawable(loadAppIcon());
        iconFrame.addView(iconView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        card.addView(iconFrame, new LinearLayout.LayoutParams(frameSize, frameSize));

        // App Name
        TextView appName = new TextView(this);
        appName.setText("Gboard Pro");
        appName.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
        appName.setTypeface(Typeface.DEFAULT_BOLD);
        appName.setTextColor(palette.textPrimary);
        LinearLayout.LayoutParams nameLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nameLp.topMargin = GboardM3Helper.dp(this, 14);
        card.addView(appName, nameLp);

        // Version Chip
        TextView versionChip = new TextView(this);
        versionChip.setText("v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION);
        versionChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        versionChip.setTypeface(Typeface.DEFAULT_BOLD);
        versionChip.setTextColor(palette.onAccentContainer);
        versionChip.setBackground(GboardM3Helper.createCardDrawable(
                palette.accentContainer, Color.TRANSPARENT, GboardM3Helper.dp(this, 12)));
        versionChip.setPadding(GboardM3Helper.dp(this, 14), GboardM3Helper.dp(this, 5),
                GboardM3Helper.dp(this, 14), GboardM3Helper.dp(this, 5));
        LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        chipLp.topMargin = GboardM3Helper.dp(this, 8);
        card.addView(versionChip, chipLp);

        // Tagline
        TextView tagline = new TextView(this);
        tagline.setText("Advanced On-Device AI Writing & Gemini Voice Dictation Keyboard");
        tagline.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        tagline.setTextColor(palette.textSecondary);
        tagline.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams tagLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tagLp.topMargin = GboardM3Helper.dp(this, 8);
        card.addView(tagline, tagLp);

        return card;
    }

    private Drawable loadAppIcon() {
        try {
            InputStream is = getAssets().open("custom_icons/preview/default.png");
            Bitmap bitmap = BitmapFactory.decodeStream(is);
            is.close();
            if (bitmap != null) {
                return new BitmapDrawable(getResources(), bitmap);
            }
        } catch (Throwable ignored) {
        }
        try {
            return getPackageManager().getApplicationIcon(getPackageName());
        } catch (Throwable ignored) {
            return null;
        }
    }

    private View buildClickableItem(String title, String summary, final String url, boolean hasChevron) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackground(GboardM3Helper.createClickableCardDrawable(
                Color.TRANSPARENT, Color.TRANSPARENT, palette.ripple, GboardM3Helper.dp(this, 14)));
        row.setPadding(GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 14),
                GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 14));

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);

        TextView tView = new TextView(this);
        tView.setText(title);
        tView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        tView.setTypeface(Typeface.DEFAULT_BOLD);
        tView.setTextColor(palette.textPrimary);
        textCol.addView(tView);

        TextView sView = new TextView(this);
        sView.setText(summary);
        sView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        sView.setTextColor(palette.textSecondary);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sLp.topMargin = GboardM3Helper.dp(this, 2);
        textCol.addView(sView, sLp);

        row.addView(textCol, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        if (hasChevron) {
            TextView chevron = new TextView(this);
            chevron.setText(">");
            chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            chevron.setTypeface(Typeface.DEFAULT_BOLD);
            chevron.setTextColor(palette.textSecondary);
            row.addView(chevron);
        }

        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                    startActivity(intent);
                } catch (Throwable ignored) {
                }
            }
        });

        return row;
    }

    private View buildDivider() {
        View divider = new View(this);
        divider.setBackgroundColor(palette.surfaceStroke);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 1);
        lp.leftMargin = GboardM3Helper.dp(this, 18);
        lp.rightMargin = GboardM3Helper.dp(this, 18);
        divider.setLayoutParams(lp);
        return divider;
    }

    private View buildDeveloperCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 20)));
        card.setPadding(GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 18),
                GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 18));

        TextView devName = new TextView(this);
        devName.setText("Arafath Rahman");
        devName.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        devName.setTypeface(Typeface.DEFAULT_BOLD);
        devName.setTextColor(palette.textPrimary);
        card.addView(devName);

        TextView devBio = new TextView(this);
        devBio.setText("Project Maintainer & Android Engineer - @smartworldarafath");
        devBio.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        devBio.setTextColor(palette.textSecondary);
        LinearLayout.LayoutParams bioLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bioLp.topMargin = GboardM3Helper.dp(this, 3);
        card.addView(devBio, bioLp);

        // Social Button Row
        LinearLayout buttonRow = new LinearLayout(this);
        buttonRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.topMargin = GboardM3Helper.dp(this, 16);
        buttonRow.setLayoutParams(rowLp);

        // GitHub Button
        buttonRow.addView(buildSocialButton(
                "GitHub",
                "https://github.com/smartworldarafath",
                palette.accentContainer,
                palette.onAccentContainer
        ), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        View space = new View(this);
        buttonRow.addView(space, new LinearLayout.LayoutParams(GboardM3Helper.dp(this, 12), 1));

        // Instagram Button
        buttonRow.addView(buildSocialButton(
                "Instagram",
                "https://instagram.com/smartworldarafath",
                palette.surfaceAlt,
                palette.textPrimary
        ), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        card.addView(buttonRow);
        return card;
    }

    private View buildSocialButton(final String name, final String url, int bgColor, int textColor) {
        LinearLayout btn = new LinearLayout(this);
        btn.setOrientation(LinearLayout.HORIZONTAL);
        btn.setGravity(Gravity.CENTER);
        btn.setBackground(GboardM3Helper.createClickableCardDrawable(
                bgColor, palette.surfaceStroke, palette.ripple, GboardM3Helper.dp(this, 16)));
        btn.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 12),
                GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 12));

        TextView text = new TextView(this);
        text.setText(name);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        text.setTypeface(Typeface.DEFAULT_BOLD);
        text.setTextColor(textColor);
        btn.addView(text);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                    startActivity(intent);
                } catch (Throwable ignored) {
                }
            }
        });

        return btn;
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        GboardM3Helper.applyActivityExitTransition(this);
    }
}
