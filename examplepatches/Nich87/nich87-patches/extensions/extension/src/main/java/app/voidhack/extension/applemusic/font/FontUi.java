package app.voidhack.extension.applemusic.font;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

final class FontUi {
    private FontUi() {}

    static void openSettings(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;

        final Page page = new Page(activity, FontStrings.text(activity, "settings_title"));
        final LinearLayout content = page.createScrollBody();

        page.addFooterButton(FontStrings.text(activity, "apply_restart"), () -> restartApp(activity));

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();

            // 1. Live Preview Card
            LinearLayout previewCard = page.card();
            previewCard.addView(page.text(FontStrings.text(activity, "preview_label"), 12, true, page.accent));

            Typeface uiBold = FontController.resolvePreviewTypeface(activity, 700, false);
            Typeface uiReg = FontController.resolvePreviewTypeface(activity, 400, false);
            Typeface lyricsBold = FontController.resolvePreviewTypeface(activity, 700, true);

            TextView titlePreview = page.text(FontStrings.text(activity, "preview_title"), 19, true, page.primary);
            titlePreview.setTypeface(uiBold);
            titlePreview.setPadding(0, page.dp(8), 0, 0);
            previewCard.addView(titlePreview);

            TextView subPreview = page.text(FontStrings.text(activity, "preview_subtitle"), 13, false, page.secondary);
            subPreview.setTypeface(uiReg);
            subPreview.setPadding(0, page.dp(3), 0, page.dp(10));
            previewCard.addView(subPreview);

            previewCard.addView(page.separator(), new LinearLayout.LayoutParams(-1, 1));

            TextView lyricsPreview = page.text(FontStrings.text(activity, "preview_lyrics"), 20, true, page.primary);
            lyricsPreview.setTypeface(lyricsBold);
            lyricsPreview.setLineSpacing(page.dp(4), 1f);
            lyricsPreview.setPadding(0, page.dp(10), 0, page.dp(2));
            previewCard.addView(lyricsPreview);

            content.addView(previewCard, page.cardParams());

            // 2. Master Toggle
            LinearLayout mainCard = page.card();
            page.addSwitchRow(
                    mainCard,
                    FontStrings.text(activity, "enabled"),
                    FontStrings.text(activity, "enabled_summary"),
                    FontPrefs.isEnabled(activity),
                    checked -> {
                        FontPrefs.setEnabled(activity, checked);
                        FontController.invalidateCache();
                        rebuild[0].run();
                    }
            );
            content.addView(mainCard, page.cardParams());

            // 3. Font Source Selector
            content.addView(page.sectionHeader(FontStrings.text(activity, "section_source")));
            LinearLayout sourceCard = page.card();
            FontPrefs.FontSource source = FontPrefs.getSource(activity);
            addSourceOption(activity, page, sourceCard, FontPrefs.FontSource.CUSTOM_FILE,
                    "source_custom", "source_custom_desc", source, rebuild[0]);
            sourceCard.addView(page.separator(), page.sepParams());
            addSourceOption(activity, page, sourceCard, FontPrefs.FontSource.SYSTEM_SANS,
                    "source_system_sans", "source_system_sans_desc", source, rebuild[0]);
            sourceCard.addView(page.separator(), page.sepParams());
            addSourceOption(activity, page, sourceCard, FontPrefs.FontSource.SYSTEM_SERIF,
                    "source_system_serif", "source_system_serif_desc", source, rebuild[0]);
            sourceCard.addView(page.separator(), page.sepParams());
            addSourceOption(activity, page, sourceCard, FontPrefs.FontSource.SYSTEM_MONOSPACE,
                    "source_system_mono", "source_system_mono_desc", source, rebuild[0]);
            content.addView(sourceCard, page.cardParams());

            // 4. Imported Font Files (when CUSTOM_FILE is active)
            if (source == FontPrefs.FontSource.CUSTOM_FILE) {
                content.addView(page.sectionHeader(FontStrings.text(activity, "section_files")));
                LinearLayout filesCard = page.card();
                addFontSlotRow(activity, page, filesCard, FontPrefs.FontSlot.MAIN_REGULAR,
                        "slot_main_regular", rebuild[0]);
                filesCard.addView(page.separator(), page.sepParams());
                addFontSlotRow(activity, page, filesCard, FontPrefs.FontSlot.MAIN_BOLD,
                        "slot_main_bold", rebuild[0]);
                filesCard.addView(page.separator(), page.sepParams());
                addFontSlotRow(activity, page, filesCard, FontPrefs.FontSlot.LYRICS_REGULAR,
                        "slot_lyrics_regular", rebuild[0]);
                if (FontPrefs.hasSlotFile(activity, FontPrefs.FontSlot.LYRICS_REGULAR)
                        || FontPrefs.hasSlotFile(activity, FontPrefs.FontSlot.LYRICS_BOLD)) {
                    filesCard.addView(page.separator(), page.sepParams());
                    addFontSlotRow(activity, page, filesCard, FontPrefs.FontSlot.LYRICS_BOLD,
                            "slot_lyrics_bold", rebuild[0]);
                }
                content.addView(filesCard, page.cardParams());
            }

            // 5. Scope Selector
            content.addView(page.sectionHeader(FontStrings.text(activity, "section_scope")));
            LinearLayout scopeCard = page.card();
            FontPrefs.FontScope scope = FontPrefs.getScope(activity);
            addScopeOption(activity, page, scopeCard, FontPrefs.FontScope.ALL, "scope_all", scope, rebuild[0]);
            scopeCard.addView(page.separator(), page.sepParams());
            addScopeOption(activity, page, scopeCard, FontPrefs.FontScope.LYRICS_ONLY, "scope_lyrics", scope, rebuild[0]);
            scopeCard.addView(page.separator(), page.sepParams());
            addScopeOption(activity, page, scopeCard, FontPrefs.FontScope.UI_ONLY, "scope_ui", scope, rebuild[0]);
            content.addView(scopeCard, page.cardParams());

            // 6. Typography Options
            content.addView(page.sectionHeader(FontStrings.text(activity, "section_tuning")));
            LinearLayout tuningCard = page.card();
            page.addSwitchRow(
                    tuningCard,
                    FontStrings.text(activity, "keep_sf_latin"),
                    FontStrings.text(activity, "keep_sf_latin_summary"),
                    FontPrefs.isKeepSfProLatin(activity),
                    checked -> {
                        FontPrefs.setKeepSfProLatin(activity, checked);
                        FontController.invalidateCache();
                        rebuild[0].run();
                    }
            );
            tuningCard.addView(page.separator(), page.sepParams());
            page.addSwitchRow(
                    tuningCard,
                    FontStrings.text(activity, "disable_sf_tracking"),
                    FontStrings.text(activity, "disable_sf_tracking_summary"),
                    FontPrefs.isDisableSfTracking(activity),
                    checked -> {
                        FontPrefs.setDisableSfTracking(activity, checked);
                        FontController.invalidateCache();
                    }
            );
            tuningCard.addView(page.separator(), page.sepParams());
            page.addWeightStepper(
                    tuningCard,
                    FontStrings.text(activity, "weight_offset"),
                    FontPrefs.getWeightOffset(activity),
                    newOffset -> {
                        FontPrefs.setWeightOffset(activity, newOffset);
                        FontController.invalidateCache();
                        rebuild[0].run();
                    }
            );
            content.addView(tuningCard, page.cardParams());

            TextView hint = page.text(FontStrings.text(activity, "restart_hint"), 13, false, page.secondary);
            hint.setLineSpacing(page.dp(3), 1f);
            hint.setPadding(page.dp(4), page.dp(12), page.dp(4), page.dp(24));
            content.addView(hint);
        };

        rebuild[0].run();
    }

    private static void addSourceOption(
            Activity activity, Page page, LinearLayout parent,
            FontPrefs.FontSource target, String titleKey, String descKey,
            FontPrefs.FontSource current, Runnable rebuild) {
        page.addRadioRow(
                parent,
                FontStrings.text(activity, titleKey),
                FontStrings.text(activity, descKey),
                current == target,
                () -> {
                    FontPrefs.setSource(activity, target);
                    if (target != FontPrefs.FontSource.CUSTOM_FILE && !FontPrefs.isEnabled(activity)) {
                        FontPrefs.setEnabled(activity, true);
                    }
                    FontController.invalidateCache();
                    rebuild.run();
                }
        );
    }

    private static void addScopeOption(
            Activity activity, Page page, LinearLayout parent,
            FontPrefs.FontScope target, String titleKey,
            FontPrefs.FontScope current, Runnable rebuild) {
        page.addRadioRow(
                parent,
                FontStrings.text(activity, titleKey),
                null,
                current == target,
                () -> {
                    FontPrefs.setScope(activity, target);
                    FontController.invalidateCache();
                    rebuild.run();
                }
        );
    }

    private static void addFontSlotRow(
            final Activity activity,
            final Page page,
            LinearLayout parent,
            final FontPrefs.FontSlot slot,
            String labelKey,
            final Runnable rebuild) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);

        TextView title = page.text(FontStrings.text(activity, labelKey), 15, true, page.primary);
        box.addView(title);

        boolean hasFile = FontPrefs.hasSlotFile(activity, slot);
        String detailText;
        if (hasFile) {
            String savedName = FontPrefs.getSlotDisplayName(activity, slot);
            FontInspector.FontInfo info = FontController.getSlotInfo(activity, slot);
            String name = !savedName.isEmpty() ? savedName : info.displayName;
            String sizeStr = FontInspector.formatSize(info.fileSizeBytes);
            String tech;
            if (info.isVariableWeight() && info.primaryFace() != null) {
                tech = FontStrings.text(activity, "info_variable",
                        info.primaryFace().minWeight, info.primaryFace().maxWeight, sizeStr);
            } else if (info.isCollection) {
                tech = FontStrings.text(activity, "info_ttc", info.faces.size(), sizeStr);
            } else if (info.primaryFace() != null) {
                tech = FontStrings.text(activity, "info_static", info.primaryFace().weight, sizeStr);
            } else {
                tech = sizeStr;
            }
            detailText = name + "\n" + tech;
        } else {
            detailText = FontStrings.text(activity, "not_set");
        }

        TextView detail = page.text(detailText, 12, false, hasFile ? page.accent : page.secondary);
        detail.setPadding(0, page.dp(4), 0, page.dp(8));
        detail.setLineSpacing(page.dp(2), 1f);
        box.addView(detail);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);

        TextView chooseBtn = page.chipButton(FontStrings.text(activity, "choose"), true, () ->
                FontPickerFragment.pick(activity, slot, (pickedSlot, info) -> {
                    if (!FontPrefs.isEnabled(activity)) {
                        FontPrefs.setEnabled(activity, true);
                    }
                    FontController.invalidateCache();
                    rebuild.run();
                })
        );
        actions.addView(chooseBtn, new LinearLayout.LayoutParams(-2, page.dp(34)));

        if (hasFile) {
            TextView clearBtn = page.chipButton(FontStrings.text(activity, "clear"), false, () -> {
                FontPrefs.clearSlot(activity, slot);
                FontController.invalidateCache();
                rebuild.run();
            });
            LinearLayout.LayoutParams cp = new LinearLayout.LayoutParams(-2, page.dp(34));
            cp.setMargins(page.dp(8), 0, 0, 0);
            actions.addView(clearBtn, cp);
        }

        box.addView(actions);
        parent.addView(box);
    }

    private static void restartApp(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(launch);
        }
        activity.finishAffinity();
        Runtime.getRuntime().exit(0);
    }

    private interface BooleanConsumer {
        void accept(boolean value);
    }

    private interface IntConsumer {
        void accept(int value);
    }

    private static final class Page {
        final Activity activity;
        final Dialog dialog;
        final LinearLayout root;
        final int background;
        final int primary;
        final int secondary;
        final int accent;
        final int cardFill;
        final int separator;
        final int systemGray;
        final Typeface regular;
        final Typeface semibold;

        Page(Activity activity, String title) {
            this.activity = activity;
            this.background = resolveColor("background_color", 0xFF1C1C1E);
            this.primary = resolveColor("label_color", Color.WHITE);
            this.secondary = resolveColor("secondary_label_color", 0xFFAEAEB2);
            this.accent = resolveColor("key_color", 0xFFFA2D48);
            this.cardFill = resolveColor("tertiary_fill_color", 0xFF2C2C2E);
            this.separator = resolveColor("separator_color", 0x338E8E93);
            this.systemGray = resolveColor("system_gray", 0xFF8E8E93);
            this.regular = resolveFont("regular", Typeface.DEFAULT);
            this.semibold = resolveFont("semibold", Typeface.DEFAULT_BOLD);

            int themeId = FontStrings.id(activity, "style", "AppTheme.FullScreenDialog");
            this.dialog = themeId != 0 ? new Dialog(activity, themeId) : new Dialog(activity);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

            root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(background);
            if (Build.VERSION.SDK_INT >= 29) root.setForceDarkAllowed(false);
            if (Build.VERSION.SDK_INT >= 30) {
                root.setOnApplyWindowInsetsListener((view, insets) -> {
                    android.graphics.Insets safe = insets.getInsets(
                            WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime()
                    );
                    view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                    return insets;
                });
            }

            FrameLayout toolbar = new FrameLayout(activity);
            TextView heading = text(title, 17, true, primary);
            heading.setGravity(Gravity.CENTER);
            heading.setSingleLine(true);
            heading.setEllipsize(TextUtils.TruncateAt.END);
            FrameLayout.LayoutParams headingParams = new FrameLayout.LayoutParams(-1, -1);
            headingParams.setMargins(dp(56), 0, dp(56), 0);
            toolbar.addView(heading, headingParams);

            ImageButton back = new ImageButton(activity);
            int backIcon = FontStrings.id(activity, "drawable", "sf_chevron_backward_monochrome_medium_medium");
            if (backIcon != 0) {
                back.setImageResource(backIcon);
                back.setImageTintList(ColorStateList.valueOf(accent));
            }
            back.setBackground(ripple(null));
            back.setContentDescription(FontStrings.text(activity, "back"));
            back.setOnClickListener(v -> dialog.dismiss());
            toolbar.addView(back, new FrameLayout.LayoutParams(dp(52), -1, Gravity.START));
            root.addView(toolbar, new LinearLayout.LayoutParams(-1, dp(52)));
            root.addView(separator(), new LinearLayout.LayoutParams(-1, 1));

            dialog.setContentView(root);
            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(background));
                window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
                        | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                        | WindowManager.LayoutParams.FLAG_LAYOUT_INSET_DECOR);
                if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
                window.setStatusBarColor(Color.TRANSPARENT);
                window.setNavigationBarColor(background);
            }
            dialog.show();
            if (window != null) {
                window.setLayout(-1, -1);
                if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
                    boolean light = Color.luminance(background) > 0.5;
                    int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    window.getInsetsController().setSystemBarsAppearance(light ? mask : 0, mask);
                }
            }
            root.requestApplyInsets();
        }

        LinearLayout createScrollBody() {
            ScrollView scroll = new ScrollView(activity);
            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(dp(20), dp(12), dp(20), dp(24));
            scroll.addView(content, new FrameLayout.LayoutParams(-1, -2));
            root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1f));
            return content;
        }

        void addFooterButton(String label, Runnable onClick) {
            LinearLayout footer = new LinearLayout(activity);
            footer.setOrientation(LinearLayout.VERTICAL);
            footer.addView(separator(), new LinearLayout.LayoutParams(-1, 1));
            TextView btn = text(label, 15, true, Color.WHITE);
            btn.setGravity(Gravity.CENTER);
            btn.setBackground(ripple(round(accent, 10)));
            btn.setClickable(true);
            btn.setFocusable(true);
            btn.setOnClickListener(v -> onClick.run());
            LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(-1, dp(50));
            p.setMargins(dp(20), dp(12), dp(20), dp(12));
            footer.addView(btn, p);
            root.addView(footer, new LinearLayout.LayoutParams(-1, -2));
        }

        LinearLayout card() {
            LinearLayout ll = new LinearLayout(activity);
            ll.setOrientation(LinearLayout.VERTICAL);
            ll.setBackground(round(cardFill, 12));
            ll.setPadding(dp(16), dp(12), dp(16), dp(12));
            return ll;
        }

        LinearLayout.LayoutParams cardParams() {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
            lp.setMargins(0, dp(8), 0, dp(4));
            return lp;
        }

        LinearLayout.LayoutParams sepParams() {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, 1);
            lp.setMargins(0, dp(10), 0, dp(10));
            return lp;
        }

        TextView sectionHeader(String label) {
            TextView tv = text(label, 13, true, secondary);
            tv.setPadding(dp(4), dp(16), dp(4), dp(4));
            return tv;
        }

        void addSwitchRow(LinearLayout parent, String title, String summary, boolean checked, BooleanConsumer onChanged) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(LinearLayout.VERTICAL);
            labels.addView(text(title, 15, false, primary));
            if (summary != null && !summary.isEmpty()) {
                TextView sum = text(summary, 12, false, secondary);
                sum.setPadding(0, dp(3), dp(12), 0);
                sum.setLineSpacing(dp(2), 1f);
                labels.addView(sum);
            }
            row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1f));

            Switch sw = new Switch(activity);
            sw.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            sw.setChecked(checked);
            sw.setThumbTintList(new ColorStateList(
                    new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                    new int[]{accent, systemGray}
            ));
            sw.setOnCheckedChangeListener((b, isChecked) -> onChanged.accept(isChecked));
            row.addView(sw);
            row.setOnClickListener(v -> sw.toggle());
            parent.addView(row);
        }

        void addRadioRow(LinearLayout parent, String title, String summary, boolean selected, Runnable onSelect) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setBackground(ripple(null));
            row.setPadding(0, dp(4), 0, dp(4));

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(LinearLayout.VERTICAL);
            labels.addView(text(title, 15, selected, selected ? accent : primary));
            if (summary != null && !summary.isEmpty()) {
                TextView sum = text(summary, 12, false, secondary);
                sum.setPadding(0, dp(3), dp(12), 0);
                sum.setLineSpacing(dp(2), 1f);
                labels.addView(sum);
            }
            row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1f));

            TextView check = text(selected ? "✓" : "", 18, true, accent);
            check.setMinWidth(dp(24));
            check.setGravity(Gravity.END);
            row.addView(check);

            row.setOnClickListener(v -> onSelect.run());
            parent.addView(row);
        }

        void addWeightStepper(LinearLayout parent, String title, final int current, final IntConsumer onChange) {
            LinearLayout top = new LinearLayout(activity);
            top.setOrientation(LinearLayout.HORIZONTAL);
            top.setGravity(Gravity.CENTER_VERTICAL);
            top.addView(text(title, 15, false, primary), new LinearLayout.LayoutParams(0, -2, 1f));
            String valStr = current > 0 ? ("+" + current) : String.valueOf(current);
            top.addView(text(valStr, 15, true, current == 0 ? secondary : accent));
            parent.addView(top);

            LinearLayout controls = new LinearLayout(activity);
            controls.setOrientation(LinearLayout.HORIZONTAL);
            controls.setGravity(Gravity.CENTER_VERTICAL);
            controls.setPadding(0, dp(10), 0, dp(2));

            int[] values = {-200, -100, 0, 100, 200};
            String[] labels = {"-200", "-100", "0", "+100", "+200"};
            for (int i = 0; i < values.length; i++) {
                final int v = values[i];
                boolean active = (v == current);
                TextView btn = text(labels[i], 13, true, active ? Color.WHITE : primary);
                btn.setGravity(Gravity.CENTER);
                btn.setBackground(ripple(round(active ? accent : ((primary & 0x00FFFFFF) | 0x1A000000), 8)));
                btn.setClickable(true);
                btn.setFocusable(true);
                btn.setOnClickListener(view -> onChange.accept(v));
                LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(0, dp(34), 1f);
                p.setMargins(i == 0 ? 0 : dp(6), 0, 0, 0);
                controls.addView(btn, p);
            }
            parent.addView(controls);
        }

        TextView chipButton(String label, boolean filled, Runnable onClick) {
            TextView tv = text(label, 13, true, filled ? Color.WHITE : accent);
            tv.setGravity(Gravity.CENTER);
            tv.setPadding(dp(14), 0, dp(14), 0);
            tv.setBackground(ripple(round(filled ? accent : ((primary & 0x00FFFFFF) | 0x1A000000), 8)));
            tv.setClickable(true);
            tv.setFocusable(true);
            tv.setOnClickListener(v -> onClick.run());
            return tv;
        }

        TextView text(String value, int sp, boolean bold, int color) {
            TextView tv = new TextView(activity);
            tv.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            tv.setText(value);
            tv.setTextSize(sp);
            tv.setTextColor(color);
            tv.setTypeface(bold ? semibold : regular);
            tv.setIncludeFontPadding(false);
            return tv;
        }

        View separator() {
            View v = new View(activity);
            v.setBackgroundColor(separator);
            return v;
        }

        GradientDrawable round(int color, int radiusDp) {
            GradientDrawable d = new GradientDrawable();
            d.setColor(color);
            d.setCornerRadius(dp(radiusDp));
            return d;
        }

        RippleDrawable ripple(Drawable content) {
            return new RippleDrawable(
                    ColorStateList.valueOf((primary & 0x00FFFFFF) | 0x18000000),
                    content,
                    new ColorDrawable(Color.WHITE)
            );
        }

        int dp(int value) {
            return Math.round(value * activity.getResources().getDisplayMetrics().density);
        }

        private int resolveColor(String name, int fallback) {
            int resId = FontStrings.id(activity, "color", name);
            if (resId == 0) return fallback;
            try {
                return activity.getColor(resId);
            } catch (RuntimeException ignored) {
                return fallback;
            }
        }

        private Typeface resolveFont(String name, Typeface fallback) {
            int resId = FontStrings.id(activity, "font", name);
            if (resId == 0) return fallback;
            try {
                return activity.getResources().getFont(resId);
            } catch (RuntimeException ignored) {
                return fallback;
            }
        }
    }
}
