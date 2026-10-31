package app.morphe.extension.shared.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.DiagnosticsDialog;
import app.morphe.extension.shared.patches.LocalCreationDownloader;
import app.morphe.extension.shared.patches.PhenotypeFlagManager;
import app.morphe.extension.shared.patches.PhenotypeFlagManager.MaterialVectorDrawable;
import app.morphe.extension.shared.patches.PhenotypeFlagManager.Theme;
import app.morphe.extension.shared.patches.PhotosModelSeeder;
import app.morphe.extension.shared.patches.flags.PhotoFlagsRegistry;
import app.morphe.extension.shared.patches.toolkit.NativeToolkitDialog;

/**
 * Dedicated, full-screen Material 3 Settings section for Morphe Google Photos.
 * Replaces the old floating pill dock with a native, organized settings screen:
 * - Feature Flags & Experiments (Flag Manager, Curated Presets, Reset Overrides, Backup/Restore)
 * - Native Toolkit & Media Management (Batch Creations, Local Deleter, Cache Cleaner, Locked Folder)
 * - On-Device AI Models (Gemini Nano, Magic Eraser, Segmentation Model Manager & Seeder)
 * - Diagnostics & Logging (Live logcat stream, Phenotype dump inspector, Debug bundle export)
 * - Creations Registry (Clear Saved Creations Registry with M3 confirmation)
 * - About Morphe (Version, Build info, GitHub repository link)
 */
public final class MorpheSettingsScreen {

    private static final String MORPHE_VERSION = "v1.17.0";
    private static final String GITHUB_URL = "https://github.com/Akash-Sriram/morphe-google-photos";

    private MorpheSettingsScreen() {}

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        activity.runOnUiThread(() -> {
            try {
                showInternal(activity);
            } catch (Throwable t) {
                Logger.printException(() -> "Error showing MorpheSettingsScreen", t);
                Toast.makeText(activity, "Error opening Morphe Settings: " + t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

    private static void showInternal(Activity activity) {
        Theme theme = Theme.get(activity);

        Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar_Fullscreen);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(theme.surface));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                window.setStatusBarColor(theme.surface);
                window.setNavigationBarColor(theme.surface);
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                View decor = window.getDecorView();
                int flags = decor.getSystemUiVisibility();
                if (!theme.isDark) {
                    flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                    }
                } else {
                    flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                    }
                }
                decor.setSystemUiVisibility(flags);
            }
        }

        View root = createRootView(activity, dialog::dismiss, true);
        dialog.setContentView(root);
        dialog.show();
    }

    public static View createRootView(Activity activity, Runnable onBack) {
        return createRootView(activity, onBack, false);
    }

    public static View createRootView(Activity activity, Runnable onBack, boolean isDialog) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(theme.surface);
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // ─────────────────────────────────────────────────────────────────────
        // Top App Bar
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout topBar = new LinearLayout(activity);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        int tbPadH = (int) (12 * density);
        int tbPadV = (int) (10 * density);
        topBar.setPadding(tbPadH, tbPadV, tbPadH, tbPadV);

        // Back Arrow Button
        FrameLayout btnBack = new FrameLayout(activity);
        int btnBackSize = (int) (44 * density);
        LinearLayout.LayoutParams btnBackLp = new LinearLayout.LayoutParams(btnBackSize, btnBackSize);
        btnBackLp.setMargins(0, 0, (int) (8 * density), 0);
        btnBack.setLayoutParams(btnBackLp);
        btnBack.setClickable(true);
        btnBack.setFocusable(true);
        btnBack.setBackground(createCircularRippleDrawable(theme.textSecondary, theme.surfaceContainer));

        ImageView ivBack = new ImageView(activity);
        Drawable backDrawable = PhenotypeFlagManager.getStockDrawable(activity, "quantum_gm_ic_arrow_back_vd_theme_24", theme.textPrimary);
        if (backDrawable == null) {
            backDrawable = new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_ARROW_BACK, theme.textPrimary);
        }
        ivBack.setImageDrawable(backDrawable);
        int icBackSize = (int) (24 * density);
        FrameLayout.LayoutParams ivBackLp = new FrameLayout.LayoutParams(icBackSize, icBackSize);
        ivBackLp.gravity = Gravity.CENTER;
        ivBack.setLayoutParams(ivBackLp);
        btnBack.addView(ivBack);
        btnBack.setOnClickListener(v -> {
            if (onBack != null) onBack.run();
        });
        topBar.addView(btnBack);

        // Title
        LinearLayout titleCol = new LinearLayout(activity);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams titleColLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleCol.setLayoutParams(titleColLp);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Morphe");
        tvTitle.setTextSize(20f);
        tvTitle.setTextColor(theme.textPrimary);
        tvTitle.setTypeface(null, Typeface.BOLD);
        titleCol.addView(tvTitle);

        topBar.addView(titleCol);

        // Version Badge
        TextView tvVer = new TextView(activity);
        tvVer.setText(MORPHE_VERSION);
        tvVer.setTextSize(11.5f);
        tvVer.setTypeface(null, Typeface.BOLD);
        tvVer.setTextColor(theme.primary);
        tvVer.setBackground(createRoundedDrawable(theme.surfaceContainer, 12 * density));
        int verPadH = (int) (10 * density);
        int verPadV = (int) (5 * density);
        tvVer.setPadding(verPadH, verPadV, verPadH, verPadV);
        topBar.addView(tvVer);

        root.addView(topBar);

        // Divider
        View topDivider = new View(activity);
        topDivider.setBackgroundColor(theme.outline);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (1 * density));
        topDivider.setLayoutParams(divLp);
        root.addView(topDivider);

        // ─────────────────────────────────────────────────────────────────────
        // Scrollable Content
        // ─────────────────────────────────────────────────────────────────────
        ScrollView scroll = new ScrollView(activity);
        scroll.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        scroll.setVerticalScrollBarEnabled(false);

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int padContentH = (int) (16 * density);
        content.setPadding(padContentH, (int) (14 * density), padContentH, (int) (32 * density));

        // ─────────────────────────────────────────────────────────────────────
        // 1. Overview Banner Card
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout overviewCard = createCardContainer(activity, density, theme);
        overviewCard.setOrientation(LinearLayout.VERTICAL);
        int oPad = (int) (18 * density);
        overviewCard.setPadding(oPad, oPad, oPad, oPad);

        LinearLayout ovHeader = new LinearLayout(activity);
        ovHeader.setOrientation(LinearLayout.HORIZONTAL);
        ovHeader.setGravity(Gravity.CENTER_VERTICAL);

        FrameLayout ovIconBox = new FrameLayout(activity);
        int ovIconSize = (int) (42 * density);
        LinearLayout.LayoutParams ovIconLp = new LinearLayout.LayoutParams(ovIconSize, ovIconSize);
        ovIconLp.setMargins(0, 0, (int) (14 * density), 0);
        ovIconBox.setLayoutParams(ovIconLp);
        ovIconBox.setBackground(createRoundedDrawable(theme.primaryContainer, 14 * density));

        ImageView ovIcon = new ImageView(activity);
        Drawable ovDrawable = PhenotypeFlagManager.getStockDrawable(activity, "quantum_gm_ic_tune_vd_theme_24", theme.onPrimaryContainer);
        if (ovDrawable == null) {
            ovDrawable = new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_TUNE, theme.onPrimaryContainer);
        }
        ovIcon.setImageDrawable(ovDrawable);
        int ovIcSize = (int) (24 * density);
        FrameLayout.LayoutParams ovIcLp = new FrameLayout.LayoutParams(ovIcSize, ovIcSize);
        ovIcLp.gravity = Gravity.CENTER;
        ovIcon.setLayoutParams(ovIcLp);
        ovIconBox.addView(ovIcon);
        ovHeader.addView(ovIconBox);

        LinearLayout ovTextCol = new LinearLayout(activity);
        ovTextCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams ovTextColLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        ovTextCol.setLayoutParams(ovTextColLp);

        TextView ovTitle = new TextView(activity);
        ovTitle.setText("Morphe Enhancements");
        ovTitle.setTextSize(16.5f);
        ovTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        ovTitle.setTextColor(theme.textPrimary);
        ovTextCol.addView(ovTitle);

        SharedPreferences prefs = PhenotypeFlagManager.getPrefs(activity);
        int activeOverrides = 0;
        try {
            Map<String, ?> all = prefs.getAll();
            for (String k : all.keySet()) {
                if (!k.startsWith("_")) activeOverrides++;
            }
        } catch (Throwable ignored) {}

        TextView ovDesc = new TextView(activity);
        ovDesc.setText(activeOverrides > 0 
                ? activeOverrides + " active feature overrides • All systems active" 
                : "Stock mode • Recommended presets available");
        ovDesc.setTextSize(12.5f);
        ovDesc.setTextColor(theme.textSecondary);
        ovTextCol.addView(ovDesc);
        ovHeader.addView(ovTextCol);

        overviewCard.addView(ovHeader);

        // Stats summary chips row
        LinearLayout chipsRow = new LinearLayout(activity);
        chipsRow.setOrientation(LinearLayout.HORIZONTAL);
        chipsRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams chipsRowLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        chipsRowLp.setMargins(0, (int) (12 * density), 0, 0);
        chipsRow.setLayoutParams(chipsRowLp);

        chipsRow.addView(createMiniChip(activity, density, theme, "Flags: " + activeOverrides + " active"));
        chipsRow.addView(createMiniChip(activity, density, theme, "Toolkit: Ready"));
        chipsRow.addView(createMiniChip(activity, density, theme, "On-Device AI: OK"));

        overviewCard.addView(chipsRow);
        content.addView(overviewCard);

        // ─────────────────────────────────────────────────────────────────────
        // 2. Feature Flags & Experiments
        // ─────────────────────────────────────────────────────────────────────
        content.addView(createSectionHeader(activity, density, theme, "Flags & Experiments"));
        LinearLayout flagsGroup = createCardContainer(activity, density, theme);

        flagsGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_tune_vd_theme_24",
                MaterialVectorDrawable.TYPE_TUNE,
                "In-App Flag Manager",
                "Search, filter, toggle experimental redesigns and feature flags",
                () -> {
                    if (isDialog && onBack != null) onBack.run();
                    PhenotypeFlagManager.showFlagManagerDialog(activity);
                }));

        flagsGroup.addView(createItemDivider(activity, density, theme));

        flagsGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_auto_awesome_vd_theme_24",
                MaterialVectorDrawable.TYPE_PRESETS,
                "Curated Presets",
                "Apply recommended configurations (Ultra Pixel, Modern UI)",
                () -> PhenotypeFlagManager.showCuratedPresetsDialog(activity, null)));

        flagsGroup.addView(createItemDivider(activity, density, theme));

        flagsGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_restore_vd_theme_24",
                MaterialVectorDrawable.TYPE_RESTART,
                "Reset All Flag Overrides",
                "Clear custom phenotype flags and restore stock app defaults",
                (theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A),
                () -> showResetFlagsDialog(activity, onBack, theme)));

        content.addView(flagsGroup);

        // ─────────────────────────────────────────────────────────────────────
        // 3. Native Toolkit & Media Utilities
        // ─────────────────────────────────────────────────────────────────────
        content.addView(createSectionHeader(activity, density, theme, "Toolkit & Media Management"));
        LinearLayout toolkitGroup = createCardContainer(activity, density, theme);

        toolkitGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_space_dashboard_vd_theme_24",
                MaterialVectorDrawable.TYPE_TOOLKIT,
                "Launch Google Photos Toolkit",
                "Batch creation downloader, deduplication, and media filtering",
                () -> {
                    if (isDialog && onBack != null) onBack.run();
                    NativeToolkitDialog.show(activity);
                }));

        toolkitGroup.addView(createItemDivider(activity, density, theme));

        toolkitGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_delete_vd_theme_24",
                MaterialVectorDrawable.TYPE_DELETE,
                "Storage & Cache Cleaner",
                "Purge thumbnail memory cache and transient download artifacts",
                () -> {
                    NativeToolkitDialog.clearCache();
                    Toast.makeText(activity, "Morphe: Thumbnail and temporary cache cleared", Toast.LENGTH_SHORT).show();
                }));

        content.addView(toolkitGroup);

        // ─────────────────────────────────────────────────────────────────────
        // 4. On-Device AI & ML Models
        // ─────────────────────────────────────────────────────────────────────
        content.addView(createSectionHeader(activity, density, theme, "On-Device AI & Models"));
        LinearLayout aiGroup = createCardContainer(activity, density, theme);

        aiGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_cloud_download_vd_theme_24",
                MaterialVectorDrawable.TYPE_DOWNLOAD,
                "AI & ML Model Manager",
                "Inspect, seed and verify Gemini Nano, Magic Eraser, and segmentation assets",
                () -> {
                    if (isDialog && onBack != null) onBack.run();
                    PhotosModelSeeder.showModelManagerDialog(activity);
                }));

        content.addView(aiGroup);

        // ─────────────────────────────────────────────────────────────────────
        // 5. Diagnostics & Logging
        // ─────────────────────────────────────────────────────────────────────
        content.addView(createSectionHeader(activity, density, theme, "Diagnostics & Logs"));
        LinearLayout diagGroup = createCardContainer(activity, density, theme);

        diagGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_notes_vd_theme_24",
                MaterialVectorDrawable.TYPE_LOGS,
                "Diagnostics Viewer & Session Logs",
                "Real-time logcat reader, phenotype dump, and system diagnostics",
                () -> {
                    if (isDialog && onBack != null) onBack.run();
                    DiagnosticsDialog.show(activity);
                }));

        content.addView(diagGroup);

        // ─────────────────────────────────────────────────────────────────────
        // 6. Creations Registry
        // ─────────────────────────────────────────────────────────────────────
        content.addView(createSectionHeader(activity, density, theme, "Creations Registry"));
        LinearLayout registryGroup = createCardContainer(activity, density, theme);

        registryGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_auto_awesome_mosaic_vd_theme_24",
                MaterialVectorDrawable.TYPE_SYNC,
                "Clear Saved Creations Registry",
                "Reset download tracking to re-sync Made-For-You animations and collages",
                () -> showClearRegistryDialog(activity, theme)));

        content.addView(registryGroup);

        // ─────────────────────────────────────────────────────────────────────
        // 7. About Morphe
        // ─────────────────────────────────────────────────────────────────────
        content.addView(createSectionHeader(activity, density, theme, "About Morphe"));
        LinearLayout aboutGroup = createCardContainer(activity, density, theme);

        aboutGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_info_vd_theme_24",
                MaterialVectorDrawable.TYPE_TAG,
                "Morphe for Google Photos",
                MORPHE_VERSION + " • Open source enhancements suite",
                null));

        aboutGroup.addView(createItemDivider(activity, density, theme));

        aboutGroup.addView(createPreferenceItem(activity, density, theme,
                "quantum_gm_ic_open_in_new_vd_theme_24",
                MaterialVectorDrawable.TYPE_SHARE,
                "GitHub Repository",
                "View source code, report issues, and download updates",
                () -> {
                    try {
                        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(GITHUB_URL));
                        activity.startActivity(intent);
                    } catch (Throwable t) {
                        Toast.makeText(activity, "Unable to open link: " + GITHUB_URL, Toast.LENGTH_SHORT).show();
                    }
                }));

        content.addView(aboutGroup);

        scroll.addView(content);
        root.addView(scroll);

        // Handle edge-to-edge window insets
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            root.setOnApplyWindowInsetsListener((v, insets) -> {
                int top = insets.getInsets(WindowInsets.Type.statusBars()).top;
                int bottom = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
                topBar.setPadding(tbPadH, top + tbPadV, tbPadH, tbPadV);
                content.setPadding(padContentH, (int) (14 * density), padContentH, bottom + (int) (24 * density));
                return insets;
            });
        }

        return root;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // UI Helpers
    // ─────────────────────────────────────────────────────────────────────────

    private static LinearLayout createCardContainer(Activity activity, float density, Theme theme) {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.setMargins(0, 0, 0, (int) (12 * density));
        card.setLayoutParams(lp);

        card.setBackground(createRoundedDrawable(theme.surfaceContainer, 28 * density));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            card.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), 28 * density);
                }
            });
            card.setClipToOutline(true);
        }
        return card;
    }

    private static TextView createSectionHeader(Activity activity, float density, Theme theme, String title) {
        TextView tv = new TextView(activity);
        tv.setText(title);
        tv.setTextSize(13.5f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        tv.setTextColor(theme.primary);
        int padH = (int) (16 * density);
        int padTop = (int) (18 * density);
        int padBottom = (int) (8 * density);
        tv.setPadding(padH, padTop, padH, padBottom);
        return tv;
    }

    private static View createItemDivider(Activity activity, float density, Theme theme) {
        View div = new View(activity);
        int divColor = theme.isDark ? 0x1AFFFFFF : 0x0F000000;
        div.setBackgroundColor(divColor);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                (int) (1 * density)
        );
        lp.setMargins((int) (70 * density), 0, (int) (16 * density), 0);
        div.setLayoutParams(lp);
        return div;
    }

    private static LinearLayout createPreferenceItem(Activity activity, float density, Theme theme,
                                                     String stockIcon, int fallbackType,
                                                     String title, String subtitle,
                                                     Runnable onClick) {
        return createPreferenceItem(activity, density, theme, stockIcon, fallbackType, title, subtitle, theme.primary, onClick);
    }

    private static LinearLayout createPreferenceItem(Activity activity, float density, Theme theme,
                                                     String stockIcon, int fallbackType,
                                                     String title, String subtitle,
                                                     int iconTintColor,
                                                     Runnable onClick) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int padH = (int) (16 * density);
        int padV = (int) (13 * density);
        row.setPadding(padH, padV, padH, padV);
        row.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        if (onClick != null) {
            row.setClickable(true);
            row.setFocusable(true);
            row.setBackground(createItemRippleDrawable(Color.TRANSPARENT, theme.cardActive));
            row.setOnClickListener(v -> onClick.run());
        }

        // Icon Container (Smooth 40dp rounded box with theme.card background)
        FrameLayout iconBox = new FrameLayout(activity);
        int boxSize = (int) (40 * density);
        LinearLayout.LayoutParams boxLp = new LinearLayout.LayoutParams(boxSize, boxSize);
        boxLp.setMargins(0, 0, (int) (14 * density), 0);
        iconBox.setLayoutParams(boxLp);
        iconBox.setBackground(createRoundedDrawable(theme.card, 13 * density));

        ImageView iv = new ImageView(activity);
        Drawable iconDrawable = PhenotypeFlagManager.getStockDrawable(activity, stockIcon, iconTintColor);
        if (iconDrawable == null) {
            iconDrawable = new MaterialVectorDrawable(fallbackType, iconTintColor);
        }
        iv.setImageDrawable(iconDrawable);
        int icSize = (int) (22 * density);
        FrameLayout.LayoutParams icLp = new FrameLayout.LayoutParams(icSize, icSize);
        icLp.gravity = Gravity.CENTER;
        iv.setLayoutParams(icLp);
        iconBox.addView(iv);
        row.addView(iconBox);

        // Text Column
        LinearLayout textCol = new LinearLayout(activity);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textCol.setLayoutParams(textLp);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText(title);
        tvTitle.setTextSize(15f);
        tvTitle.setTextColor(theme.textPrimary);
        tvTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        textCol.addView(tvTitle);

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView tvSub = new TextView(activity);
            tvSub.setText(subtitle);
            tvSub.setTextSize(12.5f);
            tvSub.setTextColor(theme.textSecondary);
            tvSub.setLineSpacing(0, 1.15f);
            LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            subLp.setMargins(0, (int) (2.5f * density), 0, 0);
            tvSub.setLayoutParams(subLp);
            textCol.addView(tvSub);
        }
        row.addView(textCol);

        // Trailing Chevron
        if (onClick != null) {
            ImageView ivChevron = new ImageView(activity);
            Drawable chev = PhenotypeFlagManager.getStockDrawable(activity, "quantum_gm_ic_keyboard_arrow_right_vd_theme_24", theme.textSecondary);
            if (chev == null) {
                chev = new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_RIGHT, theme.textSecondary);
            }
            ivChevron.setImageDrawable(chev);
            int chevSize = (int) (20 * density);
            LinearLayout.LayoutParams chevLp = new LinearLayout.LayoutParams(chevSize, chevSize);
            chevLp.setMargins((int) (8 * density), 0, (int) (4 * density), 0);
            ivChevron.setLayoutParams(chevLp);
            row.addView(ivChevron);
        }

        return row;
    }

    private static TextView createMiniChip(Activity activity, float density, Theme theme, String text) {
        TextView chip = new TextView(activity);
        chip.setText(text);
        chip.setTextSize(11.5f);
        chip.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        chip.setTextColor(theme.primary);
        chip.setBackground(createRoundedDrawable(theme.isDark ? 0x264CDAC6 : 0x1E006A60, 10 * density));
        int pH = (int) (10 * density);
        int pV = (int) (5 * density);
        chip.setPadding(pH, pV, pH, pV);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, 0, (int) (8 * density), 0);
        chip.setLayoutParams(lp);
        return chip;
    }

    private static Drawable createRoundedDrawable(int color, float radius) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(radius);
        gd.setColor(color);
        return gd;
    }

    private static Drawable createItemRippleDrawable(int normalColor, int rippleColor) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            ColorStateList csl = ColorStateList.valueOf(rippleColor);
            GradientDrawable content = new GradientDrawable();
            content.setColor(normalColor);
            GradientDrawable mask = new GradientDrawable();
            mask.setColor(Color.WHITE);
            return new RippleDrawable(csl, content, mask);
        }
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(normalColor);
        return gd;
    }

    private static Drawable createCircularRippleDrawable(int rippleColor, int normalColor) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            ColorStateList csl = ColorStateList.valueOf(rippleColor);
            GradientDrawable content = new GradientDrawable();
            content.setShape(GradientDrawable.OVAL);
            content.setColor(Color.TRANSPARENT);
            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.OVAL);
            mask.setColor(Color.WHITE);
            return new RippleDrawable(csl, content, mask);
        }
        GradientDrawable gd = new GradientDrawable();
        gd.setShape(GradientDrawable.OVAL);
        gd.setColor(normalColor);
        return gd;
    }

    private static void showResetFlagsDialog(Activity activity, Runnable onBack, Theme theme) {
        String msg = "All stored phenotype overrides will be cleared.\n\n" +
                "• Reverts to clean stock Google Photos behavior.\n" +
                "• You can reload recommended presets anytime.\n" +
                "• Requires restarting Google Photos to take effect.";
        PhenotypeFlagManager.createM3MessageDialog(
                activity,
                "Reset Flag Overrides?",
                msg,
                "Reset",
                () -> PhenotypeFlagManager.resetAllFlags(activity, () -> {
                    Toast.makeText(activity, "Flag overrides reset! Force close Photos to apply.", Toast.LENGTH_LONG).show();
                    if (onBack != null) {
                        onBack.run();
                    }
                }),
                true
        ).show();
    }

    private static void showClearRegistryDialog(Activity activity, Theme theme) {
        String msg = "This clears local tracking of already-downloaded Made-For-You animations, collages, and cinematic photos.\n\n" +
                "• Local media files in your storage are NEVER deleted.\n" +
                "• Made-For-You creations will re-sync and become eligible for batch processing again.";
        PhenotypeFlagManager.createM3MessageDialog(
                activity,
                "Clear Creations Registry?",
                msg,
                "Clear Registry",
                () -> {
                    LocalCreationDownloader.clearSavedRegistry(activity);
                    Toast.makeText(activity, "Morphe: Saved creations registry cleared", Toast.LENGTH_SHORT).show();
                },
                true
        ).show();
    }
}
