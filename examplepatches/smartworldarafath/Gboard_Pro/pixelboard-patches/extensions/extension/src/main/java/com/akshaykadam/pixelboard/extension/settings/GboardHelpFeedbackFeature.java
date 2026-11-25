package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.text.InputType;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.akshaykadam.pixelboard.extension.BuildConfig;

import java.util.Collections;
import java.util.Locale;

/**
 * In-app Liquid Glass Help & Feedback screen that prepares and submits structured
 * feature requests, bug reports, or feedback directly to the GitHub repository issues page.
 */
public final class GboardHelpFeedbackFeature implements GboardPatchesSettingsContract.Feature {

    private static final String PREFS_NAME = "gboard_pro_feedback_prefs";
    private static final String KEY_SAVED_NAME = "reporter_name";
    private static final String GITHUB_ISSUES_NEW_URL =
            "https://github.com/smartworldarafath/Gboard_Pro/issues/new";

    private static final String[] CATEGORIES = {
            "Feature request",
            "Bug report",
            "Feedback"
    };

    private static final String[] GITHUB_LABELS = {
            "enhancement",
            "bug",
            "feedback"
    };

    private final Context context;

    public GboardHelpFeedbackFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Help & feedback";
    }

    @Override
    public String getEntrySummary() {
        return "Submit feature requests, bug reports & feedback";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        return new GboardPatchesSettingsContract.Screen(
                "Help & feedback",
                null,
                "Help & feedback",
                "Report bugs, request features, or share feedback directly to GitHub",
                Collections.emptyList(),
                Collections.emptyList(),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false
        );
    }

    /**
     * Builds the full Liquid Glass form UI embedded inside GboardPatchesSettingsActivity.
     */
    public View buildFormView(final Activity activity, final GboardM3Helper.Palette palette) {
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        SharedPreferences prefs = activity.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        String savedName = prefs.getString(KEY_SAVED_NAME, "");
        String defaultDevice = buildDeviceSummary();

        // Card 1: Reporter Details & Report Type
        LinearLayout detailsCard = createGlassCard(activity, palette);
        detailsCard.addView(createSectionLabel(activity, palette, "DETAILS"));

        detailsCard.addView(createFieldLabel(activity, palette, "Name", 10));
        final EditText nameInput = createGlassEditText(
                activity, palette, "Enter your name", savedName, false);
        nameInput.setImeOptions(EditorInfo.IME_ACTION_NEXT);
        detailsCard.addView(nameInput);

        detailsCard.addView(createFieldLabel(activity, palette, "Device", 14));
        final EditText deviceInput = createGlassEditText(
                activity, palette, "Device model", defaultDevice, false);
        deviceInput.setImeOptions(EditorInfo.IME_ACTION_NEXT);
        detailsCard.addView(deviceInput);

        detailsCard.addView(createFieldLabel(activity, palette, "Type", 16));
        final int[] selectedIndex = new int[]{0};
        final LinearLayout[] chipRows = new LinearLayout[CATEGORIES.length];
        final View[] radioDots = new View[CATEGORIES.length];
        final TextView[] chipLabels = new TextView[CATEGORIES.length];

        LinearLayout categoryList = new LinearLayout(activity);
        categoryList.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams catParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        catParams.topMargin = GboardM3Helper.dp(activity, 8);
        categoryList.setLayoutParams(catParams);

        for (int i = 0; i < CATEGORIES.length; i++) {
            final int idx = i;
            LinearLayout optionRow = new LinearLayout(activity);
            optionRow.setOrientation(LinearLayout.HORIZONTAL);
            optionRow.setGravity(Gravity.CENTER_VERTICAL);
            optionRow.setPadding(
                    GboardM3Helper.dp(activity, 14),
                    GboardM3Helper.dp(activity, 12),
                    GboardM3Helper.dp(activity, 14),
                    GboardM3Helper.dp(activity, 12));
            LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i > 0) {
                rowParams.topMargin = GboardM3Helper.dp(activity, 8);
            }
            optionRow.setLayoutParams(rowParams);
            optionRow.setClickable(true);
            optionRow.setFocusable(true);

            View radioDot = new View(activity);
            LinearLayout.LayoutParams dotParams = new LinearLayout.LayoutParams(
                    GboardM3Helper.dp(activity, 18), GboardM3Helper.dp(activity, 18));
            dotParams.rightMargin = GboardM3Helper.dp(activity, 12);
            radioDot.setLayoutParams(dotParams);

            TextView labelView = new TextView(activity);
            labelView.setText(CATEGORIES[i]);
            labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            labelView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));

            optionRow.addView(radioDot);
            optionRow.addView(labelView);
            categoryList.addView(optionRow);

            chipRows[i] = optionRow;
            radioDots[i] = radioDot;
            chipLabels[i] = labelView;

            optionRow.setOnClickListener(v -> {
                selectedIndex[0] = idx;
                updateCategoryStyles(activity, palette, chipRows, radioDots, chipLabels, idx);
            });
        }
        updateCategoryStyles(activity, palette, chipRows, radioDots, chipLabels, 0);
        detailsCard.addView(categoryList);

        LinearLayout.LayoutParams detailsParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        detailsParams.bottomMargin = GboardM3Helper.dp(activity, 14);
        root.addView(detailsCard, detailsParams);

        // Card 2: Message Box
        LinearLayout messageCard = createGlassCard(activity, palette);
        messageCard.addView(createSectionLabel(activity, palette, "MESSAGE"));
        final EditText messageInput = createGlassEditText(
                activity, palette, "Write message .....", "", true);
        messageInput.setMinLines(5);
        messageInput.setMaxLines(10);
        LinearLayout.LayoutParams msgParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        msgParams.topMargin = GboardM3Helper.dp(activity, 10);
        messageCard.addView(messageInput, msgParams);

        LinearLayout.LayoutParams messageCardParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        messageCardParams.bottomMargin = GboardM3Helper.dp(activity, 20);
        root.addView(messageCard, messageCardParams);

        // Submit Button (3D Liquid Glass Pill or Solid Material 3 Filled Pill)
        boolean liquidGlassSubmit = GboardM3Helper.isLiquidGlassUiEnabled(activity);
        TextView submitButton = new TextView(activity);
        submitButton.setText("Submit");
        submitButton.setGravity(Gravity.CENTER);
        submitButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        submitButton.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        if (liquidGlassSubmit) {
            submitButton.setTextColor(palette.isAmoled || palette.isNight ? 0xFFF5F7FF : 0xFF1A2236);
            submitButton.setBackground(GboardM3Helper.createLiquidGlassPillButtonDrawable(activity, palette));
            submitButton.setElevation(GboardM3Helper.dpF(activity, 4f));
        } else {
            float lum = (0.299f * Color.red(palette.accent)
                    + 0.587f * Color.green(palette.accent)
                    + 0.114f * Color.blue(palette.accent)) / 255f;
            submitButton.setTextColor(lum > 0.58f ? 0xFF121318 : Color.WHITE);
            submitButton.setBackground(GboardM3Helper.createClickableCardDrawable(
                    palette.accent, Color.TRANSPARENT, palette.ripple, GboardM3Helper.dp(activity, 999)));
            submitButton.setElevation(0f);
        }
        submitButton.setClickable(true);
        submitButton.setFocusable(true);
        submitButton.setPadding(
                GboardM3Helper.dp(activity, 28),
                GboardM3Helper.dp(activity, 14),
                GboardM3Helper.dp(activity, 28),
                GboardM3Helper.dp(activity, 14));

        LinearLayout.LayoutParams submitParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, GboardM3Helper.dp(activity, 52));
        submitParams.bottomMargin = GboardM3Helper.dp(activity, 8);
        root.addView(submitButton, submitParams);

        submitButton.setOnClickListener(v -> submitToGitHub(
                activity,
                prefs,
                safeTrim(nameInput.getText()),
                safeTrim(deviceInput.getText()),
                selectedIndex[0],
                safeTrim(messageInput.getText()),
                messageInput));

        return root;
    }

    private static void submitToGitHub(
            Activity activity,
            SharedPreferences prefs,
            String name,
            String device,
            int categoryIdx,
            String message,
            EditText messageInput) {
        if (TextUtils.isEmpty(message)) {
            messageInput.setError("Please write a message");
            messageInput.requestFocus();
            Toast.makeText(activity, "Please write your message before submitting.", Toast.LENGTH_SHORT).show();
            return;
        }

        if (!TextUtils.isEmpty(name)) {
            prefs.edit().putString(KEY_SAVED_NAME, name).apply();
        }

        String category = CATEGORIES[Math.max(0, Math.min(categoryIdx, CATEGORIES.length - 1))];
        String label = GITHUB_LABELS[Math.max(0, Math.min(categoryIdx, GITHUB_LABELS.length - 1))];
        String resolvedName = TextUtils.isEmpty(name) ? "Anonymous User" : name;
        String resolvedDevice = TextUtils.isEmpty(device) ? buildDeviceSummary() : device;

        String firstLine = message.replace('\n', ' ').trim();
        if (firstLine.length() > 64) {
            firstLine = firstLine.substring(0, 61).trim() + "...";
        }
        String issueTitle = String.format(Locale.US, "[%s] %s", category, firstLine);

        StringBuilder body = new StringBuilder();
        body.append("## ").append(category).append('\n');
        body.append("- **Name:** ").append(resolvedName).append('\n');
        body.append("- **Device:** ").append(resolvedDevice).append('\n');
        body.append("- **App Version:** Gboard Pro v").append(BuildConfig.PATCH_VERSION)
                .append(" (18.6.3)\n");
        body.append("- **Android:** Android ").append(Build.VERSION.RELEASE)
                .append(" (SDK ").append(Build.VERSION.SDK_INT).append(")\n\n");
        body.append("### Message\n").append(message).append('\n');

        copyToClipboardQuietly(activity, body.toString());

        Uri issueUri = Uri.parse(GITHUB_ISSUES_NEW_URL)
                .buildUpon()
                .appendQueryParameter("title", issueTitle)
                .appendQueryParameter("body", body.toString())
                .appendQueryParameter("labels", label)
                .build();

        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, issueUri);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(intent);
            Toast.makeText(
                    activity,
                    "Opening GitHub with your " + category.toLowerCase(Locale.US) + "...",
                    Toast.LENGTH_LONG).show();
        } catch (Throwable err) {
            Toast.makeText(
                    activity,
                    "No browser available. Report copied to clipboard!",
                    Toast.LENGTH_LONG).show();
        }
    }

    private static void updateCategoryStyles(
            Context context,
            GboardM3Helper.Palette palette,
            LinearLayout[] chipRows,
            View[] radioDots,
            TextView[] chipLabels,
            int selectedIdx) {
        boolean liquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(context);
        int radius = GboardM3Helper.dp(context, liquidGlass ? 16 : 12);
        for (int i = 0; i < chipRows.length; i++) {
            boolean selected = (i == selectedIdx);

            GradientDrawable rowBg = new GradientDrawable();
            rowBg.setCornerRadius(radius);
            if (selected) {
                int fill = liquidGlass
                        ? (palette.isAmoled ? 0x26A8C7FA : (palette.isNight ? 0x2E8AB4F8 : 0x1A283CF5))
                        : GboardM3Helper.blendAlpha(palette.accent, 0.14f);
                rowBg.setColor(fill);
                rowBg.setStroke(GboardM3Helper.dp(context, 1), palette.accent);
            } else {
                int fill = liquidGlass
                        ? (palette.isAmoled ? 0xFF10131C : (palette.isNight ? 0x1FFFFFFF : 0x66FFFFFF))
                        : palette.surfaceAlt;
                int stroke = liquidGlass
                        ? (palette.isAmoled ? 0x28FFFFFF : (palette.isNight ? 0x22FFFFFF : 0x99DCE2F4))
                        : palette.surfaceStroke;
                rowBg.setColor(fill);
                rowBg.setStroke(GboardM3Helper.dp(context, 1), stroke);
            }
            chipRows[i].setBackground(rowBg);

            GradientDrawable dot = new GradientDrawable();
            dot.setShape(GradientDrawable.OVAL);
            if (selected) {
                dot.setColor(palette.accent);
                dot.setStroke(GboardM3Helper.dp(context, 3),
                        liquidGlass
                                ? (palette.isAmoled || palette.isNight ? 0xFF0A0C12 : 0xFFFFFFFF)
                                : palette.surface);
            } else {
                dot.setColor(Color.TRANSPARENT);
                dot.setStroke(GboardM3Helper.dp(context, 2), palette.textSecondary);
            }
            radioDots[i].setBackground(dot);

            chipLabels[i].setTextColor(selected ? palette.accent : palette.textPrimary);
            chipLabels[i].setTypeface(Typeface.create(
                    "sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));
        }
    }

    private static LinearLayout createGlassCard(Context context, GboardM3Helper.Palette palette) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(
                GboardM3Helper.dp(context, 18),
                GboardM3Helper.dp(context, 16),
                GboardM3Helper.dp(context, 18),
                GboardM3Helper.dp(context, 18));
        if (GboardM3Helper.isLiquidGlassUiEnabled(context)) {
            card.setBackground(GboardM3Helper.createLiquidGlassCardDrawable(context, palette, 24, false));
            card.setElevation(GboardM3Helper.dpF(context, 2f));
        } else {
            card.setBackground(GboardM3Helper.createCardDrawable(
                    palette.surface, palette.surfaceStroke, GboardM3Helper.dp(context, 16)));
            card.setElevation(0f);
        }
        return card;
    }

    private static TextView createSectionLabel(
            Context context, GboardM3Helper.Palette palette, String text) {
        TextView tv = new TextView(context);
        tv.setText(text);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        tv.setLetterSpacing(0.08f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tv.setTextColor(palette.accent);
        return tv;
    }

    private static TextView createFieldLabel(
            Context context, GboardM3Helper.Palette palette, String text, int topMarginDp) {
        TextView tv = new TextView(context);
        tv.setText(text);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        tv.setTextColor(palette.textSecondary);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = GboardM3Helper.dp(context, topMarginDp);
        lp.bottomMargin = GboardM3Helper.dp(context, 6);
        tv.setLayoutParams(lp);
        return tv;
    }

    private static EditText createGlassEditText(
            Context context,
            GboardM3Helper.Palette palette,
            String hint,
            String initialValue,
            boolean multiline) {
        EditText edit = new EditText(context);
        edit.setHint(hint);
        edit.setText(initialValue);
        edit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        edit.setTextColor(palette.textPrimary);
        edit.setHintTextColor(GboardM3Helper.blendAlpha(palette.textSecondary, 0.72f));
        edit.setPadding(
                GboardM3Helper.dp(context, 14),
                GboardM3Helper.dp(context, 12),
                GboardM3Helper.dp(context, 14),
                GboardM3Helper.dp(context, 12));
        if (multiline) {
            edit.setSingleLine(false);
            edit.setGravity(Gravity.TOP | Gravity.START);
            edit.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                    | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        } else {
            edit.setSingleLine(true);
            edit.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            edit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
        }

        boolean liquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(context);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(GboardM3Helper.dp(context, liquidGlass ? 16 : 12));
        int fill = liquidGlass
                ? (palette.isAmoled ? 0xFF10131C : (palette.isNight ? 0xFF232736 : 0xB8FFFFFF))
                : palette.surfaceAlt;
        int stroke = liquidGlass
                ? (palette.isAmoled ? 0x33A8C7FA : (palette.isNight ? 0x30FFFFFF : 0xFFCFD6EC))
                : palette.surfaceStroke;
        bg.setColor(fill);
        bg.setStroke(GboardM3Helper.dp(context, 1), stroke);
        edit.setBackground(bg);

        edit.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return edit;
    }

    private static String buildDeviceSummary() {
        String manufacturer = Build.MANUFACTURER != null ? Build.MANUFACTURER.trim() : "";
        String model = Build.MODEL != null ? Build.MODEL.trim() : "";
        String combined;
        if (!TextUtils.isEmpty(manufacturer)
                && !model.toLowerCase(Locale.US).startsWith(manufacturer.toLowerCase(Locale.US))) {
            combined = capitalize(manufacturer) + " " + model;
        } else {
            combined = !TextUtils.isEmpty(model) ? model : "Android Device";
        }
        return combined + " (Android " + Build.VERSION.RELEASE + ")";
    }

    private static String capitalize(String value) {
        if (TextUtils.isEmpty(value)) {
            return value;
        }
        return Character.toUpperCase(value.charAt(0)) + value.substring(1);
    }

    private static String safeTrim(CharSequence text) {
        return text == null ? "" : text.toString().trim();
    }

    private static void copyToClipboardQuietly(Context context, String text) {
        try {
            ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("Gboard Pro Feedback", text));
            }
        } catch (Throwable ignored) {
        }
    }
}
