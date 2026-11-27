package dev.srwi.gintype.extension.customholdpopups;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import dev.srwi.gintype.extension.R;
import dev.srwi.gintype.extension.settings.GboardSettingsText;
import dev.srwi.gintype.extension.thicctopbar.ThiccTopBarGboardReflector;

/**
 * Sleek, modern, light/dark adaptive dialog for adding, editing, deleting, or resetting hold popup
 * symbols using Gboard itself as the active soft keyboard.
 */
public final class GboardCustomHoldPopupsEditorDialog {

    private static final String TAG = "GboardCustomHoldPopups";

    public static final String MODE_ADD = "add";
    public static final String MODE_EDIT = "edit";

    private GboardCustomHoldPopupsEditorDialog() {
    }

    /**
     * Shows the Custom Hold Popup editor dialog inside the given Activity.
     *
     * @param activity           host Activity
     * @param mode               {@link #MODE_ADD} or {@link #MODE_EDIT}
     * @param baseKey            normalized base key label (e.g. "a", ".", "1")
     * @param currentSymbol      current symbol text (empty in add mode; pre-filled in edit mode)
     * @param originalSymbol     original default symbol when editing a default entry, or empty
     * @param userAdded          true when editing a user-added symbol, false for default symbol
     * @param addedIndex         index in user-added symbols list when {@code userAdded} is true
     * @param onSavedOrMutated   optional callback invoked after any Add/Save/Delete/Reset mutation
     * @param onDialogDismissed  optional callback invoked when the dialog is dismissed
     */
    public static AlertDialog show(
            Activity activity,
            String mode,
            String baseKey,
            String currentSymbol,
            String originalSymbol,
            boolean userAdded,
            int addedIndex,
            Runnable onSavedOrMutated,
            Runnable onDialogDismissed) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            if (onDialogDismissed != null) {
                onDialogDismissed.run();
            }
            return null;
        }
        String normalizedBaseKey = GboardCustomHoldPopupsSettings.normalizeBaseKey(baseKey);
        if (normalizedBaseKey.isEmpty()) {
            if (onDialogDismissed != null) {
                onDialogDismissed.run();
            }
            return null;
        }
        boolean isAddMode = MODE_ADD.equals(mode);
        boolean nightMode = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;

        int surfaceColor = nightMode ? 0xFF1E1F22 : 0xFFF7F8FC;
        int inputBgColor = nightMode ? 0xFF2B2D31 : 0xFFFFFFFF;
        int inputStrokeColor = nightMode ? 0xFF44474E : 0xFFD8DCE6;
        int textPrimary = nightMode ? 0xFFE3E3E8 : 0xFF1B1C1F;
        int textSecondary = nightMode ? 0xFF9EA2AE : 0xFF5A5E6B;
        int accentColor = resolveThemeAccent(activity, nightMode);
        int onAccentColor = isLightColor(accentColor) ? 0xFF14161A : 0xFFFFFFFF;
        int dangerColor = nightMode ? 0xFFFF897D : 0xFFB3261E;
        int dangerBgColor = nightMode ? 0x33FF897D : 0x1AB3261E;

        String displayKey = formatDisplayKey(normalizedBaseKey);
        String safeCurrent = currentSymbol == null ? "" : currentSymbol;
        String safeOriginal = originalSymbol == null || originalSymbol.isEmpty()
                ? safeCurrent
                : originalSymbol;

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(activity, 24), dp(activity, 22), dp(activity, 24), dp(activity, 20));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(surfaceColor);
        cardBg.setCornerRadius(dp(activity, 28));
        card.setBackground(cardBg);

        // Header row: key badge + title
        LinearLayout headerRow = new LinearLayout(activity);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView keyBadge = new TextView(activity);
        keyBadge.setText(displayKey);
        keyBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        keyBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        keyBadge.setTextColor(accentColor);
        keyBadge.setGravity(Gravity.CENTER);
        keyBadge.setMinWidth(dp(activity, 40));
        keyBadge.setMinHeight(dp(activity, 40));
        keyBadge.setPadding(dp(activity, 10), dp(activity, 4), dp(activity, 10), dp(activity, 4));
        GradientDrawable badgeBg = new GradientDrawable();
        badgeBg.setColor(withAlpha(accentColor, nightMode ? 0.20f : 0.14f));
        badgeBg.setCornerRadius(dp(activity, 12));
        keyBadge.setBackground(badgeBg);
        LinearLayout.LayoutParams badgeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        badgeParams.rightMargin = dp(activity, 14);
        headerRow.addView(keyBadge, badgeParams);

        TextView titleView = new TextView(activity);
        String titleText = isAddMode
                ? GboardSettingsText.format(
                        activity, R.string.gboard_patches_custom_hold_popups_dialog_add_title, displayKey)
                : GboardSettingsText.format(
                        activity, R.string.gboard_patches_custom_hold_popups_dialog_edit_title, displayKey);
        titleView.setText(titleText);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        titleView.setTextColor(textPrimary);
        headerRow.addView(titleView, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        card.addView(headerRow);

        // Subtitle description
        TextView subtitleView = new TextView(activity);
        String subtitleText;
        if (isAddMode) {
            subtitleText = GboardSettingsText.format(
                    activity,
                    R.string.gboard_patches_custom_hold_popups_dialog_add_subtitle,
                    displayKey);
        } else if (userAdded) {
            subtitleText = GboardSettingsText.format(
                    activity,
                    R.string.gboard_patches_custom_hold_popups_dialog_edit_added_subtitle,
                    displayKey);
        } else {
            subtitleText = GboardSettingsText.format(
                    activity,
                    R.string.gboard_patches_custom_hold_popups_dialog_edit_default_subtitle,
                    displayKey,
                    safeOriginal);
        }
        subtitleView.setText(subtitleText);
        subtitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        subtitleView.setTextColor(textSecondary);
        subtitleView.setLineSpacing(0f, 1.15f);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = dp(activity, 12);
        subtitleParams.bottomMargin = dp(activity, 14);
        card.addView(subtitleView, subtitleParams);

        // Input field
        EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        input.setHint(GboardSettingsText.get(
                activity, R.string.gboard_patches_custom_hold_popups_dialog_input_hint));
        input.setHintTextColor(withAlpha(textSecondary, 0.72f));
        input.setTextColor(textPrimary);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
        input.setPadding(dp(activity, 16), dp(activity, 14), dp(activity, 16), dp(activity, 14));
        GradientDrawable inputBg = new GradientDrawable();
        inputBg.setColor(inputBgColor);
        inputBg.setCornerRadius(dp(activity, 16));
        inputBg.setStroke(dp(activity, 1), inputStrokeColor);
        input.setBackground(inputBg);
        if (!isAddMode) {
            input.setText(safeCurrent);
            input.setSelectAllOnFocus(true);
        }
        card.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Inline error message view
        TextView errorView = new TextView(activity);
        errorView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        errorView.setTextColor(dangerColor);
        errorView.setVisibility(View.GONE);
        LinearLayout.LayoutParams errorParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        errorParams.topMargin = dp(activity, 6);
        card.addView(errorView, errorParams);

        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (errorView.getVisibility() == View.VISIBLE) {
                    errorView.setVisibility(View.GONE);
                }
            }

            @Override
            public void afterTextChanged(Editable s) {}
        });

        // Action buttons bar
        LinearLayout buttonRow = new LinearLayout(activity);
        buttonRow.setOrientation(LinearLayout.HORIZONTAL);
        buttonRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams buttonRowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        buttonRowParams.topMargin = dp(activity, 20);

        ScrollView scrollContainer = new ScrollView(activity);
        scrollContainer.setFillViewport(true);
        scrollContainer.addView(card, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setView(scrollContainer)
                .create();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setSoftInputMode(
                    WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE
                            | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }

        SharedPreferences preferences = GboardCustomHoldPopupsSettings.resolvePreferences(activity);

        // Secondary destructive/reset action on the left in Edit mode:
        // - Delete: only for user-added symbols
        // - Reset: only for already modified default symbols
        boolean isModifiedDefault = !isAddMode
                && !userAdded
                && isDefaultSymbolCurrentlyModified(preferences, normalizedBaseKey, safeOriginal, safeCurrent);

        if (!isAddMode && userAdded) {
            TextView deleteBtn = buildPillButton(
                    activity,
                    GboardSettingsText.get(
                            activity, R.string.gboard_patches_custom_hold_popups_dialog_action_delete),
                    dangerColor,
                    dangerBgColor);
            deleteBtn.setOnClickListener(v -> {
                new AlertDialog.Builder(activity)
                        .setTitle(GboardSettingsText.get(
                                activity, R.string.gboard_patches_custom_hold_popups_dialog_action_delete))
                        .setMessage(GboardSettingsText.format(
                                activity,
                                R.string.gboard_patches_custom_hold_popups_dialog_delete_confirm_message,
                                safeCurrent,
                                displayKey))
                        .setNegativeButton(
                                GboardSettingsText.get(activity, R.string.gboard_patches_dialog_cancel),
                                null)
                        .setPositiveButton(
                                GboardSettingsText.get(
                                        activity, R.string.gboard_patches_custom_hold_popups_dialog_action_delete),
                                (d, which) -> {
                                    boolean deleted = GboardCustomHoldPopupsSettings.deleteAddedSymbol(
                                            preferences, normalizedBaseKey, addedIndex, safeCurrent);
                                    if (deleted) {
                                        GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards(activity);
                                        if (onSavedOrMutated != null) {
                                            onSavedOrMutated.run();
                                        }
                                        dialog.dismiss();
                                    } else {
                                        errorView.setText("This symbol was already modified or removed.");
                                        errorView.setVisibility(View.VISIBLE);
                                    }
                                })
                        .show();
            });
            deleteBtn.setMinHeight(dp(activity, 42));
            buttonRow.addView(deleteBtn, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else if (isModifiedDefault) {
            TextView resetBtn = buildPillButton(
                    activity,
                    GboardSettingsText.get(
                            activity, R.string.gboard_patches_custom_hold_popups_dialog_action_reset),
                    dangerColor,
                    dangerBgColor);
            resetBtn.setOnClickListener(v -> {
                new AlertDialog.Builder(activity)
                        .setTitle(GboardSettingsText.get(
                                activity, R.string.gboard_patches_custom_hold_popups_dialog_action_reset))
                        .setMessage(GboardSettingsText.format(
                                activity,
                                R.string.gboard_patches_custom_hold_popups_dialog_reset_confirm_message,
                                safeOriginal,
                                displayKey))
                        .setNegativeButton(
                                GboardSettingsText.get(activity, R.string.gboard_patches_dialog_cancel),
                                null)
                        .setPositiveButton(
                                GboardSettingsText.get(
                                        activity, R.string.gboard_patches_custom_hold_popups_dialog_action_reset),
                                (d, which) -> {
                                    GboardCustomHoldPopupsSettings.resetModifiedDefaultSymbol(
                                            preferences, normalizedBaseKey, safeOriginal);
                                    GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards(activity);
                                    if (onSavedOrMutated != null) {
                                        onSavedOrMutated.run();
                                    }
                                    dialog.dismiss();
                                })
                        .show();
            });
            resetBtn.setMinHeight(dp(activity, 42));
            buttonRow.addView(resetBtn, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        // Spacer
        View spacer = new View(activity);
        buttonRow.addView(spacer, new LinearLayout.LayoutParams(0, 0, 1f));

        // Cancel button
        TextView cancelBtn = buildPillButton(
                activity,
                GboardSettingsText.get(activity, R.string.gboard_patches_dialog_cancel),
                textSecondary,
                Color.TRANSPARENT);
        cancelBtn.setOnClickListener(v -> dialog.dismiss());
        cancelBtn.setMinHeight(dp(activity, 42));
        LinearLayout.LayoutParams cancelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cancelParams.rightMargin = dp(activity, 8);
        buttonRow.addView(cancelBtn, cancelParams);

        // Primary button (Add or Save)
        String primaryLabel = GboardSettingsText.get(
                activity,
                isAddMode
                        ? R.string.gboard_patches_custom_hold_popups_dialog_action_add
                        : R.string.gboard_patches_custom_hold_popups_dialog_action_save);
        TextView primaryBtn = buildPillButton(activity, primaryLabel, onAccentColor, accentColor);
        primaryBtn.setMinHeight(dp(activity, 42));
        Runnable commitAction = () -> {
            String rawInput = input.getText() == null ? "" : input.getText().toString();
            if (GboardCustomHoldPopupsSettings.PENCIL_SYMBOL.equals(rawInput.trim())) {
                errorView.setText(GboardSettingsText.get(
                        activity, R.string.gboard_patches_custom_hold_popups_dialog_error_reserved_pencil));
                errorView.setVisibility(View.VISIBLE);
                return;
            }
            String sanitized = GboardCustomHoldPopupsSettings.sanitizeSymbol(rawInput);
            if (sanitized.isEmpty()) {
                errorView.setText(GboardSettingsText.get(
                        activity, R.string.gboard_patches_custom_hold_popups_dialog_error_empty));
                errorView.setVisibility(View.VISIBLE);
                return;
            }
            boolean ok;
            if (isAddMode) {
                ok = GboardCustomHoldPopupsSettings.addCustomSymbol(
                        preferences, normalizedBaseKey, sanitized);
            } else if (userAdded) {
                ok = GboardCustomHoldPopupsSettings.updateAddedSymbol(
                        preferences, normalizedBaseKey, addedIndex, safeCurrent, sanitized);
            } else {
                ok = GboardCustomHoldPopupsSettings.setModifiedDefaultSymbol(
                        preferences, normalizedBaseKey, safeOriginal, sanitized);
            }
            if (ok) {
                GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards(activity);
                if (onSavedOrMutated != null) {
                    onSavedOrMutated.run();
                }
                dialog.dismiss();
            } else {
                errorView.setText("Unable to save changes. Please reopen the editor.");
                errorView.setVisibility(View.VISIBLE);
            }
        };
        primaryBtn.setOnClickListener(v -> commitAction.run());
        input.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                commitAction.run();
                return true;
            }
            return false;
        });
        buttonRow.addView(primaryBtn, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        card.addView(buttonRow, buttonRowParams);

        dialog.setOnShowListener(ignored -> {
            input.post(() -> {
                try {
                    input.requestFocus();
                    if (!isAddMode && input.getText() != null) {
                        input.selectAll();
                    }
                    InputMethodManager imm = (InputMethodManager) activity.getSystemService(
                            Context.INPUT_METHOD_SERVICE);
                    if (imm != null) {
                        imm.showSoftInput(input, InputMethodManager.SHOW_IMPLICIT);
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Unable to focus custom hold popup editor input", t);
                }
            });
        });
        dialog.setOnDismissListener(ignored -> {
            if (onDialogDismissed != null) {
                try {
                    onDialogDismissed.run();
                } catch (Throwable ignoredErr) {
                }
            }
        });

        try {
            dialog.show();
            return dialog;
        } catch (Throwable t) {
            Log.w(TAG, "Failed to show Custom Hold Popups editor dialog", t);
            if (onDialogDismissed != null) {
                onDialogDismissed.run();
            }
            return null;
        }
    }

    private static boolean isDefaultSymbolCurrentlyModified(
            SharedPreferences preferences,
            String normalizedBaseKey,
            String originalSymbol,
            String currentSymbol) {
        String normOrig = GboardCustomHoldPopupsSettings.normalizeDefaultKey(originalSymbol);
        if (normOrig.isEmpty()) {
            return false;
        }
        GboardCustomHoldPopupsSettings.KeyHoldRules rules =
                GboardCustomHoldPopupsSettings.readKeyRules(preferences, normalizedBaseKey);
        if (rules.modifiedDefaults.containsKey(normOrig)) {
            return true;
        }
        return !TextUtils.isEmpty(currentSymbol)
                && !normOrig.equals(GboardCustomHoldPopupsSettings.normalizeDefaultKey(currentSymbol));
    }

    private static String formatDisplayKey(String normalizedBaseKey) {
        if (normalizedBaseKey == null || normalizedBaseKey.isEmpty()) {
            return "?";
        }
        if (normalizedBaseKey.length() == 1 && Character.isLetter(normalizedBaseKey.charAt(0))) {
            return normalizedBaseKey.toUpperCase(java.util.Locale.ROOT);
        }
        return normalizedBaseKey;
    }

    private static TextView buildPillButton(
            Context context,
            String label,
            int textColor,
            int backgroundColor) {
        TextView btn = new TextView(context);
        btn.setText(label);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        btn.setTextColor(textColor);
        btn.setGravity(Gravity.CENTER);
        btn.setPadding(dp(context, 16), 0, dp(context, 16), 0);
        btn.setClickable(true);
        btn.setFocusable(true);
        GradientDrawable content = new GradientDrawable();
        content.setColor(backgroundColor);
        content.setCornerRadius(dp(context, 21));
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(context, 21));
        btn.setBackground(new RippleDrawable(
                ColorStateList.valueOf(withAlpha(textColor, 0.16f)), content, mask));
        return btn;
    }

    private static int resolveThemeAccent(Context context, boolean nightMode) {
        return ThiccTopBarGboardReflector.resolveNormalAccentColor(context, nightMode);
    }

    private static boolean isLightColor(int color) {
        double r = Color.red(color) / 255.0;
        double g = Color.green(color) / 255.0;
        double b = Color.blue(color) / 255.0;
        double luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b;
        return luminance > 0.58;
    }

    private static int withAlpha(int color, float alphaFraction) {
        int alpha = Math.max(0, Math.min(255, Math.round(255f * alphaFraction)));
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
