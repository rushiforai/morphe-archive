import os

path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update Palette.forContext to support themes
target_palette = """        static Palette forContext(Context context, Configuration configuration) {
            boolean nightMode = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;"""

rep_palette = """        static Palette forContext(Context context, Configuration configuration) {
            boolean nightMode = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;

            String selectedTheme = "default";
            if (context != null) {
                try {
                    SharedPreferences p = context.getSharedPreferences("gboard_pro_appearance_prefs", Context.MODE_PRIVATE);
                    selectedTheme = p.getString("selected_gboard_ui_theme", "default");
                    if ("default".equals(selectedTheme)) {
                        selectedTheme = PreferenceManager.getDefaultSharedPreferences(context)
                                .getString("selected_gboard_ui_theme", "default");
                    }
                } catch (Throwable ignored) {
                }
            }

            if ("rainbow".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF1C1310, 0xFF281C17, 0xFF372720, 0x44FF8A65,
                            0xFF5D2416, Color.parseColor("#3F2D16"), 0xFF372720,
                            0xFFFBE9E7, 0xFFFFCCBC, 0x77FFCCBC, 0xFFFF7043, 0x33FF7043);
                } else {
                    return new Palette(
                            0xFFFFF8F6, 0xFFFDEEE9, 0xFFF8E2DB, 0x26FF5722,
                            0xFFFFCCBC, Color.parseColor("#FEF3C7"), 0xFFF8E2DB,
                            0xFF2D1610, 0xFF5F3E35, 0x775F3E35, 0xFFE64A19, 0x26E64A19);
                }
            } else if ("botanical".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF0E1815, 0xFF162520, 0xFF20342E, 0x4480CBC4,
                            0xFF0E3E37, Color.parseColor("#3F2D16"), 0xFF20342E,
                            0xFFE0F2F1, 0xFFB2DFDB, 0x77B2DFDB, 0xFF4DB6AC, 0x334DB6AC);
                } else {
                    return new Palette(
                            0xFFF4FBF7, 0xFFE8F5E9, 0xFFDCEDC8, 0x2600796B,
                            0xFFC8E6C9, Color.parseColor("#FEF3C7"), 0xFFDCEDC8,
                            0xFF0A261F, 0xFF2E5349, 0x772E5349, 0xFF00796B, 0x2600796B);
                }
            } else if ("ocean".equals(selectedTheme)) {
                if (nightMode) {
                    return new Palette(
                            0xFF101322, 0xFF191D32, 0xFF232845, 0x449FA8DA,
                            0xFF1E265C, Color.parseColor("#3F2D16"), 0xFF232845,
                            0xFFE8EAF6, 0xFFC5CAE9, 0x77C5CAE9, 0xFF7986CB, 0x337986CB);
                } else {
                    return new Palette(
                            0xFFF6F8FE, 0xFFEEF2FC, 0xFFE0E7FA, 0x263949AB,
                            0xFFE8EAF6, Color.parseColor("#FEF3C7"), 0xFFE0E7FA,
                            0xFF12182E, 0xFF3F4A6A, 0x773F4A6A, 0xFF3949AB, 0x263949AB);
                }
            }"""

# 2. Update createRadioRow icon size to 42dp
target_radio_icon = """        if (rowModel.getIconDrawable() != null) {
            ImageView iconView = new ImageView(this);
            iconView.setImageDrawable(rowModel.getIconDrawable());
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(24), dp(24));
            iconParams.rightMargin = dp(16);
            iconParams.gravity = Gravity.CENTER_VERTICAL;
            row.addView(iconView, iconParams);
        }"""

rep_radio_icon = """        if (rowModel.getIconDrawable() != null) {
            ImageView iconView = new ImageView(this);
            iconView.setImageDrawable(rowModel.getIconDrawable());
            iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iconView.setClipToOutline(true);
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(42), dp(42));
            iconParams.rightMargin = dp(16);
            iconParams.gravity = Gravity.CENTER_VERTICAL;
            row.addView(iconView, iconParams);
        }"""

# 3. Update createStatusBlockView to render Hero block for About screen
target_status = """    private View createStatusBlockView(GboardPatchesSettingsContract.StatusBlock block) {
        LinearLayout card = buildSectionContainer(false);
        card.setBackground(buildCardDrawable(
                toneBackground(block.getTone()),
                palette.surfaceStroke,
                dp(20)));
        TextView titleView = buildSectionTitle(block.getTitle());
        if (block.getTone() == GboardPatchesSettingsContract.StatusTone.WARNING) {
            titleView.setContentDescription(
                    text(R.string.gboard_patches_warning_label) + ": " + block.getTitle());
        }
        card.addView(titleView);
        card.addView(buildSectionSummary(block.getSummary(), false));
        return card;
    }"""

rep_status = """    private View createStatusBlockView(GboardPatchesSettingsContract.StatusBlock block) {
        LinearLayout card = buildSectionContainer(false);
        card.setBackground(buildCardDrawable(
                toneBackground(block.getTone()),
                palette.surfaceStroke,
                dp(20)));

        if ("Gboard Pro".equals(block.getTitle()) || "About Gboard Pro".equals(block.getTitle())) {
            card.setGravity(Gravity.CENTER_HORIZONTAL);
            card.setPadding(dp(20), dp(24), dp(20), dp(24));

            ImageView heroIcon = new ImageView(this);
            heroIcon.setImageDrawable(loadMipmapDrawable("ic_app"));
            heroIcon.setScaleType(ImageView.ScaleType.FIT_CENTER);
            heroIcon.setClipToOutline(true);
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(72), dp(72));
            iconLp.bottomMargin = dp(12);
            card.addView(heroIcon, iconLp);

            TextView titleView = new TextView(this);
            titleView.setText("Gboard Pro");
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
            titleView.setTypeface(Typeface.DEFAULT_BOLD);
            titleView.setTextColor(palette.textPrimary);
            titleView.setGravity(Gravity.CENTER);
            card.addView(titleView);

            TextView versionPill = new TextView(this);
            versionPill.setText("v1.0.5 (Beta)");
            versionPill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            versionPill.setTypeface(Typeface.DEFAULT_BOLD);
            versionPill.setTextColor(palette.accent);
            versionPill.setBackground(buildCardDrawable(palette.infoContainer, Color.TRANSPARENT, dp(12)));
            versionPill.setPadding(dp(12), dp(4), dp(12), dp(4));
            LinearLayout.LayoutParams pillLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            pillLp.topMargin = dp(6);
            pillLp.bottomMargin = dp(10);
            card.addView(versionPill, pillLp);

            TextView summaryView = buildSectionSummary(block.getSummary(), false);
            summaryView.setGravity(Gravity.CENTER);
            card.addView(summaryView);

            return card;
        }

        TextView titleView = buildSectionTitle(block.getTitle());
        if (block.getTone() == GboardPatchesSettingsContract.StatusTone.WARNING) {
            titleView.setContentDescription(
                    text(R.string.gboard_patches_warning_label) + ": " + block.getTitle());
        }
        card.addView(titleView);
        card.addView(buildSectionSummary(block.getSummary(), false));
        return card;
    }

    private Drawable loadMipmapDrawable(String resName) {
        try {
            int id = getResources().getIdentifier(resName, "mipmap", getPackageName());
            if (id != 0) {
                return getDrawable(id);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }"""

# 4. In buildAndApplyCurrentScreen, re-evaluate palette so theme updates apply immediately
target_rebuild = """        try {
            ensureFeaturesInitialized();
            if (openInitialFeatureFromIntentIfNeeded()) {
                return;
            }"""

rep_rebuild = """        try {
            palette = Palette.forContext(this, getResources().getConfiguration());
            ensureFeaturesInitialized();
            if (openInitialFeatureFromIntentIfNeeded()) {
                return;
            }"""

norm_content = content.replace('\\r\\n', '\\n')
norm_target_palette = target_palette.replace('\\r\\n', '\\n')
norm_rep_palette = rep_palette.replace('\\r\\n', '\\n')
norm_target_radio_icon = target_radio_icon.replace('\\r\\n', '\\n')
norm_rep_radio_icon = rep_radio_icon.replace('\\r\\n', '\\n')
norm_target_status = target_status.replace('\\r\\n', '\\n')
norm_rep_status = rep_status.replace('\\r\\n', '\\n')
norm_target_rebuild = target_rebuild.replace('\\r\\n', '\\n')
norm_rep_rebuild = rep_rebuild.replace('\\r\\n', '\\n')

if norm_target_palette in norm_content and norm_target_radio_icon in norm_content and norm_target_status in norm_content and norm_target_rebuild in norm_content:
    norm_content = norm_content.replace(norm_target_palette, norm_rep_palette, 1)
    norm_content = norm_content.replace(norm_target_radio_icon, norm_rep_radio_icon, 1)
    norm_content = norm_content.replace(norm_target_status, norm_rep_status, 1)
    norm_content = norm_content.replace(norm_target_rebuild, norm_rep_rebuild, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_content)
    print("GboardPatchesSettingsActivity.java updated successfully!")
else:
    print("Targets not matched in GboardPatchesSettingsActivity.java")
