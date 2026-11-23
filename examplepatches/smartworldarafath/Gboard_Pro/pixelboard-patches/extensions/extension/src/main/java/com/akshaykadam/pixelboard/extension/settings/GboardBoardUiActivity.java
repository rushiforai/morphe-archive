package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

public class GboardBoardUiActivity extends Activity {

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

            root.addView(GboardM3Helper.createToolbar(this, "Board UI", palette));

            ScrollView scrollView = new ScrollView(this);
            scrollView.setFillViewport(true);
            scrollView.setVerticalScrollBarEnabled(false);

            LinearLayout content = new LinearLayout(this);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 8),
                    GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 28));

            // Hero Card
            content.addView(buildHeroCard());

            // Upcoming features header
            TextView sectionTitle = new TextView(this);
            sectionTitle.setText("PLANNED BOARD UI CAPABILITIES");
            sectionTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            sectionTitle.setTypeface(Typeface.DEFAULT_BOLD);
            sectionTitle.setTextColor(palette.accent);
            sectionTitle.setPadding(GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 20),
                    GboardM3Helper.dp(this, 8), GboardM3Helper.dp(this, 10));
            content.addView(sectionTitle);

            // Roadmap feature items
            content.addView(buildFeatureCard(
                    "Dynamic Keycap Borders",
                    "Customizable stroke thickness and high-contrast outlines for individual alphabet and symbol keys."
            ));
            content.addView(buildFeatureCard(
                    "Typography & Font Selector",
                    "Seamlessly choose between Google Sans, Roboto, Product Sans, and custom monospaced fonts."
            ));
            content.addView(buildFeatureCard(
                    "Accent Contrast & Tone Tuning",
                    "Fine-tune surface luminance, spacebar tinting, and keycap highlight saturation independently."
            ));
            content.addView(buildFeatureCard(
                    "Material 3 Expressive Shapes",
                    "Interactive scalloped flower, squircle, and capsule keycap geometry presets for modern Android devices."
            ));

            // GitHub Action Button
            content.addView(buildGitHubButton());

            scrollView.addView(content);
            root.addView(scrollView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            setContentView(root);
        } catch (Throwable t) {
            Log.e("GboardBoardUiActivity", "Error in onCreate", t);
            fallbackView(t);
        }
    }

    private void fallbackView(Throwable t) {
        try {
            LinearLayout fallback = new LinearLayout(this);
            fallback.setOrientation(LinearLayout.VERTICAL);
            fallback.setPadding(32, 64, 32, 32);
            TextView tv = new TextView(this);
            tv.setText("Board UI Personalization\n\nThis section is currently in active development. Advanced keycap borders, font selection, and expressive key shapes are coming soon!");
            tv.setTextSize(16f);
            fallback.addView(tv);
            setContentView(fallback);
        } catch (Throwable ignored) {
        }
    }

    private View buildHeroCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 22)));
        card.setPadding(GboardM3Helper.dp(this, 20), GboardM3Helper.dp(this, 20),
                GboardM3Helper.dp(this, 20), GboardM3Helper.dp(this, 20));

        // Status badge
        TextView statusBadge = new TextView(this);
        statusBadge.setText("IN ACTIVE DEVELOPMENT");
        statusBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        statusBadge.setTypeface(Typeface.DEFAULT_BOLD);
        statusBadge.setTextColor(palette.onAccentContainer);
        statusBadge.setBackground(GboardM3Helper.createCardDrawable(
                palette.accentContainer, Color.TRANSPARENT, GboardM3Helper.dp(this, 8)));
        statusBadge.setPadding(GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4),
                GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4));
        card.addView(statusBadge, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView title = new TextView(this);
        title.setText("Board UI Personalization");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(palette.textPrimary);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleLp.topMargin = GboardM3Helper.dp(this, 12);
        card.addView(title, titleLp);

        TextView message = new TextView(this);
        message.setText("We are actively engineering advanced visual personalization controls for Gboard Pro. These upcoming settings will give you complete control over keyboard geometry, border accents, typographic styling, and expressive material surfaces.\n\nStay tuned for the upcoming releases as these features roll out!");
        message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        message.setTextColor(palette.textSecondary);
        message.setLineSpacing(GboardM3Helper.dp(this, 3), 1.15f);
        LinearLayout.LayoutParams msgLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        msgLp.topMargin = GboardM3Helper.dp(this, 8);
        card.addView(message, msgLp);

        return card;
    }

    private View buildFeatureCard(String title, String description) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 16)));
        card.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 14),
                GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 14));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = GboardM3Helper.dp(this, 10);
        card.setLayoutParams(lp);

        TextView tView = new TextView(this);
        tView.setText(title);
        tView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        tView.setTypeface(Typeface.DEFAULT_BOLD);
        tView.setTextColor(palette.textPrimary);
        card.addView(tView);

        TextView dView = new TextView(this);
        dView.setText(description);
        dView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        dView.setTextColor(palette.textSecondary);
        dView.setLineSpacing(GboardM3Helper.dp(this, 2), 1.1f);
        LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dLp.topMargin = GboardM3Helper.dp(this, 4);
        card.addView(dView, dLp);

        return card;
    }

    private View buildGitHubButton() {
        LinearLayout button = new LinearLayout(this);
        button.setOrientation(LinearLayout.HORIZONTAL);
        button.setGravity(Gravity.CENTER);
        button.setBackground(GboardM3Helper.createClickableCardDrawable(
                palette.accent, Color.TRANSPARENT, palette.ripple, GboardM3Helper.dp(this, 22)));
        button.setPadding(GboardM3Helper.dp(this, 20), GboardM3Helper.dp(this, 14),
                GboardM3Helper.dp(this, 20), GboardM3Helper.dp(this, 14));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = GboardM3Helper.dp(this, 12);
        button.setLayoutParams(lp);

        TextView label = new TextView(this);
        label.setText("Follow Development on GitHub");
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        label.setTypeface(Typeface.DEFAULT_BOLD);
        label.setTextColor(palette.isNight ? 0xFF00325B : 0xFFFFFFFF);
        button.addView(label);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://github.com/smartworldarafath/Gboard_Pro"));
                    startActivity(intent);
                } catch (Throwable ignored) {
                }
            }
        });

        return button;
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        GboardM3Helper.applyActivityExitTransition(this);
    }
}
