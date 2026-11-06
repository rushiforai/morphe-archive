package app.morphe.extension.shared.settings.preference;

import static app.morphe.extension.shared.settings.BaseSettings.SETTINGS_COLOR_HISTORY;
import static app.morphe.extension.shared.utils.BaseThemeUtils.getAppForegroundColor;
import static app.morphe.extension.shared.utils.StringRef.str;
import static app.morphe.extension.shared.utils.Utils.dipToPixels;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.ColorInt;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;
import java.util.function.IntConsumer;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.ui.ColorDot;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;

/**
 * A custom preference for selecting a color via a hexadecimal code or a color picker dialog.
 * Extends {@link EditTextPreference} to display a colored dot in the widget area,
 * reflecting the currently selected color. The dot is dimmed when the preference is disabled.
 */
@SuppressWarnings({"unused", "deprecation"})
public class ColorPickerPreference extends EditTextPreference {

    /**
     * Length of a valid color string of format #RRGGBB (without alpha) or #AARRGGBB (with alpha).
     */
    public static final int COLOR_STRING_LENGTH_WITHOUT_ALPHA = 7;
    public static final int COLOR_STRING_LENGTH_WITH_ALPHA = 9;

    /**
     * Matches everything that is not a hex number/letter.
     */
    private static final Pattern PATTERN_NOT_HEX = Pattern.compile("[^0-9A-Fa-f]");

    private static final int COLOR_HISTORY_LIMIT = 8;
    private static final Pattern PATTERN_HISTORY_COLOR = Pattern.compile("#(?:[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})");

    /**
     * Alpha for dimming when the preference is disabled.
     */
    public static final float DISABLED_ALPHA = 0.5f; // 50%

    /**
     * View displaying a colored dot in the widget area.
     */
    private View widgetColorDot;

    /**
     * Dialog View displaying a colored dot for the selected color preview in the dialog.
     */
    private View dialogColorDot;

    /**
     * Current color, including alpha channel if opacity slider is enabled.
     */
    @ColorInt
    private int currentColor;

    /**
     * Associated setting for storing the color value.
     */
    private StringSetting colorSetting;

    /**
     * Dialog TextWatcher for the EditText to monitor color input changes.
     */
    private TextWatcher colorTextWatcher;

    @Nullable
    private Runnable transientDismiss;

    @Nullable
    private Dialog currentDialog;

    /**
     * Dialog color picker view.
     */
    protected ColorPickerView dialogColorPickerView;

    /**
     * Listener for color changes.
     */
    protected OnColorChangeListener colorChangeListener;

    /**
     * Whether the opacity slider is enabled.
     */
    private boolean opacitySliderEnabled = false;

    public static final int ID_REVANCED_COLOR_PICKER_VIEW =
            ResourceUtils.getIdIdentifier("revanced_color_picker_view");
    public static final int ID_PREFERENCE_COLOR_DOT =
            ResourceUtils.getIdIdentifier("preference_color_dot");
    public static final int LAYOUT_REVANCED_COLOR_DOT_WIDGET =
            ResourceUtils.getLayoutIdentifier("revanced_color_dot_widget");
    public static final int LAYOUT_REVANCED_COLOR_PICKER =
            ResourceUtils.getLayoutIdentifier("revanced_color_picker");

    /**
     * Removes non valid hex characters, converts to all uppercase,
     * and adds # character to the start if not present.
     */
    public static String cleanupColorCodeString(String colorString, boolean includeAlpha) {
        String result = "#" + PATTERN_NOT_HEX.matcher(colorString)
                .replaceAll("").toUpperCase(Locale.ROOT);

        int maxLength = includeAlpha ? COLOR_STRING_LENGTH_WITH_ALPHA : COLOR_STRING_LENGTH_WITHOUT_ALPHA;
        if (result.length() < maxLength) {
            return result;
        }

        return result.substring(0, maxLength);
    }

    /**
     * @param color        Color, with or without alpha channel.
     * @param includeAlpha Whether to include the alpha channel in the output string.
     * @return #RRGGBB or #AARRGGBB hex color string
     */
    public static String getColorString(@ColorInt int color, boolean includeAlpha) {
        if (includeAlpha) {
            return String.format("#%08X", color);
        }
        color = color & 0x00FFFFFF; // Mask to strip alpha.
        return String.format("#%06X", color);
    }

    /**
     * Interface for notifying color changes.
     */
    public interface OnColorChangeListener {
        void onColorChanged(String key, int newColor);
    }

    /**
     * Sets the listener for color changes.
     */
    public void setOnColorChangeListener(OnColorChangeListener listener) {
        this.colorChangeListener = listener;
    }

    /**
     * Enables or disables the opacity slider in the color picker dialog.
     */
    public void setOpacitySliderEnabled(boolean enabled) {
        this.opacitySliderEnabled = enabled;
    }

    public ColorPickerPreference(Context context) {
        super(context);
        init();
    }

    public ColorPickerPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ColorPickerPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    /** Uses the existing RGB picker, hex editor and recent colours without a registered preference. */
    public static Dialog showRgbPicker(Context context, String title, int initialColor, int defaultColor,
                                     IntConsumer onApplied, Runnable onDismiss) {
        ColorPickerPreference picker = new ColorPickerPreference(context) {
            @Override
            protected void onDialogOkClicked() {
                onApplied.accept(Color.parseColor(getText()) | 0xFF000000);
            }

            @Override
            protected void onDialogNeutralClicked() {
                dialogColorPickerView.setColor(defaultColor | 0xFF000000);
            }
        };
        picker.setPersistent(false);
        picker.setTitle(title);
        picker.setOpacitySliderEnabled(false);
        picker.setText(getColorString(initialColor, false));
        picker.transientDismiss = onDismiss;
        picker.showDialog(null);
        return picker.currentDialog;
    }

    /**
     * Initializes the preference by setting up the EditText, loading the color, and set the widget layout.
     */
    private void init() {
        if (getKey() != null) {
            colorSetting = (StringSetting) Setting.getSettingFromPath(getKey());
            if (colorSetting == null) {
                Logger.printException(() -> "Could not find color setting for: " + getKey());
            }
        } else {
            Logger.printDebug(() -> "initialized without key, settings will be loaded later");
        }

        EditText editText = getEditText();
        editText.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            editText.setAutofillHints((String) null);
        }

        // Set the widget layout to a custom layout containing the colored dot.
        setWidgetLayoutResource(LAYOUT_REVANCED_COLOR_DOT_WIDGET);
    }

    /**
     * Sets the selected color and updates the UI and settings.
     */
    @Override
    public void setText(String colorString) {
        try {
            Logger.printDebug(() -> "setText: " + colorString);
            super.setText(colorString);

            currentColor = Color.parseColor(colorString);
            if (colorSetting != null) {
                colorSetting.save(getColorString(currentColor, opacitySliderEnabled));
            }
            updateDialogColorDot();
            updateWidgetColorDot();

            // Notify the listener about the color change.
            if (colorChangeListener != null) {
                colorChangeListener.onColorChanged(getKey(), currentColor);
            }
        } catch (IllegalArgumentException ex) {
            // This code is reached if the user pastes settings json with an invalid color
            // since this preference is updated with the new setting text.
            Logger.printDebug(() -> "Parse color error: " + colorString, ex);
            Utils.showToastShort(str("revanced_settings_color_invalid"));
            setText(colorSetting.resetToDefault());
        } catch (Exception ex) {
            Logger.printException(() -> "setText failure: " + colorString, ex);
        }
    }

    /**
     * Creates a TextWatcher to monitor changes in the EditText for color input.
     */
    private TextWatcher createColorTextWatcher(ColorPickerView colorPickerView) {
        return new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable edit) {
                try {
                    String colorString = edit.toString();
                    String sanitizedColorString = cleanupColorCodeString(colorString, opacitySliderEnabled);
                    if (!sanitizedColorString.equals(colorString)) {
                        edit.replace(0, colorString.length(), sanitizedColorString);
                        return;
                    }

                    int expectedLength = opacitySliderEnabled
                            ? COLOR_STRING_LENGTH_WITH_ALPHA
                            : COLOR_STRING_LENGTH_WITHOUT_ALPHA;
                    if (sanitizedColorString.length() != expectedLength) {
                        return;
                    }

                    final int newColor = Color.parseColor(colorString);
                    if (currentColor != newColor) {
                        Logger.printDebug(() -> "afterTextChanged: " + sanitizedColorString);
                        currentColor = newColor;
                        updateDialogColorDot();
                        updateWidgetColorDot();
                        colorPickerView.setColor(newColor);
                    }
                } catch (Exception ex) {
                    // Should never be reached since input is validated before using.
                    Logger.printException(() -> "afterTextChanged failure", ex);
                }
            }
        };
    }

    /**
     * Hook for subclasses to add a custom view to the top of the dialog.
     */
    @Nullable
    protected View createExtraDialogContentView(Context context) {
        return null; // Default implementation returns no extra view.
    }

    /**
     * Hook for subclasses to handle the OK button click.
     */
    protected void onDialogOkClicked() {
        // Default implementation does nothing.
    }

    /**
     * Hook for subclasses to handle the Neutral button click.
     */
    protected void onDialogNeutralClicked() {
        // Default implementation.
        try {
            final int defaultColor = Color.parseColor(colorSetting.defaultValue);
            dialogColorPickerView.setColor(defaultColor);
        } catch (Exception ex) {
            Logger.printException(() -> "Reset button failure", ex);
        }
    }

    private static List<Integer> loadColorHistory() {
        List<Integer> history = new ArrayList<>(COLOR_HISTORY_LIMIT);
        for (String colorString : SETTINGS_COLOR_HISTORY.get().split(",")) {
            if (!PATTERN_HISTORY_COLOR.matcher(colorString).matches()) {
                continue;
            }

            int color = Color.parseColor(colorString);
            if (findHistoryColor(history, color) < 0) {
                history.add(color);
                if (history.size() == COLOR_HISTORY_LIMIT) {
                    break;
                }
            }
        }
        return history;
    }

    private static int findHistoryColor(List<Integer> history, @ColorInt int color) {
        for (int index = 0; index < history.size(); index++) {
            // Treat different opacity values of the same RGB color as one history entry.
            if ((history.get(index) & 0x00FFFFFF) == (color & 0x00FFFFFF)) {
                return index;
            }
        }
        return -1;
    }

    private static void moveHistoryColorToFront(List<Integer> history, @ColorInt int color) {
        int existingIndex = findHistoryColor(history, color);
        if (existingIndex >= 0) {
            history.remove(existingIndex);
        }

        history.add(0, color);
        if (history.size() > COLOR_HISTORY_LIMIT) {
            history.remove(history.size() - 1);
        }
    }

    private static void saveColorHistory(@ColorInt int originalColor, @ColorInt int appliedColor) {
        if (originalColor == appliedColor) {
            return;
        }

        List<Integer> history = loadColorHistory();
        moveHistoryColorToFront(history, originalColor);
        moveHistoryColorToFront(history, appliedColor);

        StringBuilder savedColors = new StringBuilder();
        for (int color : history) {
            if (savedColors.length() > 0) {
                savedColors.append(',');
            }
            savedColors.append(getColorString(color, Color.alpha(color) != 255));
        }
        SETTINGS_COLOR_HISTORY.save(savedColors.toString());
    }

    private View createColorHistoryView(Context context) {
        LinearLayout historyContainer = new LinearLayout(context);
        historyContainer.setOrientation(LinearLayout.VERTICAL);
        historyContainer.setPadding(dipToPixels(10), 0, dipToPixels(10), dipToPixels(8));

        List<Integer> history = loadColorHistory();
        if (history.isEmpty()) {
            historyContainer.setVisibility(View.GONE);
            return historyContainer;
        }

        LinearLayout header = new LinearLayout(context);
        header.setGravity(Gravity.CENTER_VERTICAL);

        TextView title = new TextView(context);
        title.setText(str("revanced_settings_color_history"));
        title.setTextColor(getAppForegroundColor());
        header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button clearButton = CustomDialog.createButton(context, null,
                str("revanced_settings_color_history_clear"), () -> {
                    SETTINGS_COLOR_HISTORY.resetToDefault();
                    historyContainer.setVisibility(View.GONE);
                }, false, false);
        clearButton.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dipToPixels(48)));
        header.addView(clearButton);
        historyContainer.addView(header);

        HorizontalScrollView scrollView = new HorizontalScrollView(context);
        scrollView.setHorizontalScrollBarEnabled(true);
        LinearLayout swatches = new LinearLayout(context);
        for (int color : history) {
            swatches.addView(createHistorySwatch(context, color));
        }
        scrollView.addView(swatches);
        historyContainer.addView(scrollView);

        return historyContainer;
    }

    private View createHistorySwatch(Context context, @ColorInt int color) {
        int selectedColor = opacitySliderEnabled ? color : color | 0xFF000000;
        String colorString = getColorString(selectedColor, opacitySliderEnabled);

        // A 48 dp touch target leaves 12 dp between the 36 dp color circles.
        FrameLayout target = new FrameLayout(context);
        target.setLayoutParams(new LinearLayout.LayoutParams(dipToPixels(48), dipToPixels(48)));
        target.setFocusable(true);
        target.setContentDescription(str("revanced_settings_color_history_select", colorString));
        target.setOnClickListener(view -> {
            EditText editText = getEditText();
            editText.setText(colorString);
            editText.setSelection(colorString.length());
        });

        View swatch = new View(context);
        ColorDot.applyColorDot(swatch, selectedColor, true);
        target.addView(swatch, new FrameLayout.LayoutParams(dipToPixels(36), dipToPixels(36), Gravity.CENTER));

        return target;
    }

    @Override
    protected void showDialog(Bundle state) {
        Context context = getContext();

        // Create content container for all dialog views.
        LinearLayout contentContainer = new LinearLayout(context);
        contentContainer.setOrientation(LinearLayout.VERTICAL);

        // Add extra view from subclass if it exists.
        View extraView = createExtraDialogContentView(context);
        if (extraView != null) {
            contentContainer.addView(extraView);
        }

        // Inflate color picker view.
        View colorPicker = LayoutInflater.from(context).inflate(LAYOUT_REVANCED_COLOR_PICKER, null);
        dialogColorPickerView = colorPicker.findViewById(ID_REVANCED_COLOR_PICKER_VIEW);
        dialogColorPickerView.setOpacitySliderEnabled(opacitySliderEnabled);
        dialogColorPickerView.setColor(currentColor);
        contentContainer.addView(colorPicker);

        // Horizontal layout for preview and EditText.
        LinearLayout inputLayout = new LinearLayout(context);
        inputLayout.setOrientation(LinearLayout.HORIZONTAL);
        inputLayout.setGravity(Gravity.CENTER_VERTICAL);

        dialogColorDot = new View(context);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                dipToPixels(20),
                dipToPixels(20)
        );
        previewParams.setMargins(dipToPixels(16), 0, dipToPixels(10), 0);
        dialogColorDot.setLayoutParams(previewParams);
        inputLayout.addView(dialogColorDot);
        updateDialogColorDot();

        EditText editText = getEditText();
        ViewParent parent = editText.getParent();
        if (parent instanceof ViewGroup parentViewGroup) {
            parentViewGroup.removeView(editText);
        }
        editText.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));
        String currentColorString = getColorString(currentColor, opacitySliderEnabled);
        editText.setText(currentColorString);
        editText.setSelection(currentColorString.length());
        editText.setTypeface(Typeface.MONOSPACE);
        colorTextWatcher = createColorTextWatcher(dialogColorPickerView);
        editText.addTextChangedListener(colorTextWatcher);
        inputLayout.addView(editText);

        // Add a dummy view to take up remaining horizontal space,
        // otherwise it will show an oversize underlined text view.
        View paddingView = new View(context);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                0,
                LinearLayout.LayoutParams.MATCH_PARENT,
                1f
        );
        paddingView.setLayoutParams(params);
        inputLayout.addView(paddingView);

        contentContainer.addView(inputLayout);
        contentContainer.addView(createColorHistoryView(context));

        // Create ScrollView to wrap the content container.
        ScrollView contentScrollView = new ScrollView(context);
        contentScrollView.setVerticalScrollBarEnabled(false);
        contentScrollView.setOverScrollMode(View.OVER_SCROLL_NEVER);
        LinearLayout.LayoutParams scrollViewParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                0,
                1.0f
        );
        contentScrollView.setLayoutParams(scrollViewParams);
        contentScrollView.addView(contentContainer);

        final int originalColor = currentColor;
        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                getTitle() != null ? getTitle().toString() : str("revanced_settings_color_picker"),
                null,
                null,
                null,
                () -> { // OK button action.
                    try {
                        String colorString = editText.getText().toString();
                        int expectedLength = opacitySliderEnabled
                                ? COLOR_STRING_LENGTH_WITH_ALPHA
                                : COLOR_STRING_LENGTH_WITHOUT_ALPHA;
                        if (colorString.length() != expectedLength) {
                            Utils.showToastShort(str("revanced_settings_color_invalid"));
                            setText(getColorString(originalColor, opacitySliderEnabled));
                            return;
                        }
                        setText(colorString);
                        saveColorHistory(originalColor, Color.parseColor(colorString));

                        onDialogOkClicked();
                    } catch (Exception ex) {
                        // Should never happen due to a bad color string,
                        // since the text is validated and fixed while the user types.
                        Logger.printException(() -> "OK button failure", ex);
                    }
                },
                () -> { // Cancel button action.
                    try {
                        setText(getColorString(originalColor, opacitySliderEnabled));
                    } catch (Exception ex) {
                        Logger.printException(() -> "Cancel button failure", ex);
                    }
                },
                str("revanced_settings_reset_color"), // Neutral button text.
                this::onDialogNeutralClicked, // Neutral button action.
                false // Do not dismiss dialog.
        );

        // Add the ScrollView to the dialog's main layout.
        LinearLayout dialogMainLayout = dialogPair.second;
        dialogMainLayout.addView(contentScrollView, dialogMainLayout.getChildCount() - 1);

        // Set up color picker listener with debouncing.
        // Add listener last to prevent callbacks from set calls above.
        dialogColorPickerView.setOnColorChangedListener(color -> {
            // Check if it actually changed, since this callback
            // can be caused by updates in afterTextChanged().
            if (currentColor == color) {
                return;
            }

            String updatedColorString = getColorString(color, opacitySliderEnabled);
            Logger.printDebug(() -> "onColorChanged: " + updatedColorString);
            currentColor = color;
            editText.setText(updatedColorString);
            editText.setSelection(updatedColorString.length());

            updateDialogColorDot();
            updateWidgetColorDot();
        });

        // Configure and show the dialog.
        Dialog dialog = dialogPair.first;
        currentDialog = dialog;
        dialog.setOnDismissListener(dialogInterface -> {
            clearDialogViews();
            currentDialog = null;
            if (transientDismiss != null) transientDismiss.run();
        });
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();
    }

    private void clearDialogViews() {
        if (colorTextWatcher != null) {
            getEditText().removeTextChangedListener(colorTextWatcher);
            colorTextWatcher = null;
        }

        if (dialogColorPickerView != null) {
            dialogColorPickerView.setOnColorChangedListener(null);
        }

        dialogColorDot = null;
        dialogColorPickerView = null;
    }

    @Override
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        updateWidgetColorDot();
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        widgetColorDot = view.findViewById(ID_PREFERENCE_COLOR_DOT);
        updateWidgetColorDot();
    }

    private void updateWidgetColorDot() {
        if (widgetColorDot == null) return;

        ColorDot.applyColorDot(
                widgetColorDot,
                currentColor,
                widgetColorDot.isEnabled()
        );
    }

    private void updateDialogColorDot() {
        if (dialogColorDot == null) return;

        ColorDot.applyColorDot(
                dialogColorDot,
                currentColor,
                true
        );
    }
}
