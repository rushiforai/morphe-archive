/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3867
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.videoplayer;

import static app.morphe.extension.shared.utils.StringRef.str;
import static app.morphe.extension.youtube.settings.YouTubeActivityHook.USE_BOLD_ICONS;

import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.settings.Setting.SliderConfig;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.SheetBottomDialog;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.patches.utils.FlyoutUtils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PipDismissHelper;
import app.morphe.extension.youtube.shared.PlayerControlButton;
import app.morphe.extension.youtube.shared.RootView;
import app.morphe.extension.youtube.utils.VideoUtils;

/**
 * Player button and flyout menu item that open a dialog to adjust the video delay.
 * Tap and hold the player button to reset the delay.
 */
@SuppressWarnings("unused")
public class VideoDelayDialogButton {

    private static final int DIALOG_ANIMATION_DURATION = ResourceUtils.getInteger("fade_duration_fast");

    @Nullable
    private static PlayerControlButton instance;

    /**
     * Injection point.
     */
    public static void initializeButton(View controlsView) {
        try {
            instance = new PlayerControlButton(
                    controlsView,
                    "morphe_video_delay_button",
                    false,
                    () -> Settings.VIDEO_DELAY_OVERLAY_BUTTON.get() && !RootView.isAdProgressTextVisible(),
                    v -> showDialog(v.getContext()),
                    v -> {
                        setDelay(0);
                        return true;
                    }
            );
            instance.setIcon("morphe_video_delay_button");
        } catch (Exception ex) {
            Logger.printException(() -> "initializeButton failure", ex);
        }
    }

    /**
     * Injection point.
     */
    public static void setVisibilityNegatedImmediate() {
        if (instance != null) instance.setVisibilityNegatedImmediate();
    }

    /**
     * Injection point.
     */
    public static void setVisibilityImmediate(boolean visible) {
        if (instance != null) instance.setVisibilityImmediate(visible);
    }

    /**
     * Injection point.
     */
    public static void setVisibility(boolean visible, boolean animated) {
        if (instance != null) instance.setVisibility(visible, animated);
    }

    /**
     * Adds a menu item to the player settings flyout menu.
     */
    public static int addFlyoutButton(Object flyoutPanel, int nextButtonIndex, boolean isTopFlyout) {
        if (Settings.VIDEO_DELAY_FLYOUT_BUTTON.get() && isTopFlyout) {
            Drawable icon = ResourceUtils.getDrawable(USE_BOLD_ICONS
                    ? "morphe_video_delay_button_bold"
                    : "morphe_video_delay_button");

            nextButtonIndex = FlyoutUtils.addFlyoutButton(
                    flyoutPanel,
                    icon,
                    str("morphe_video_delay_title"),
                    v -> {
                        FlyoutUtils.dismissFlyout();
                        showDialog(v.getContext());
                    },
                    nextButtonIndex
            );
        }
        return nextButtonIndex;
    }

    /**
     * Saves the delay. The new delay applies immediately,
     * as the audio renderers read it on every playback loop.
     */
    private static void setDelay(int delayMs) {
        Settings.VIDEO_DELAY.save(delayMs);
    }

    private static int progressToDelay(SliderConfig config, int progress) {
        return (int) (config.min() + progress * config.step());
    }

    private static int delayToProgress(SliderConfig config, int delayMs) {
        return (int) Math.round((delayMs - config.min()) / config.step());
    }

    private static int clampedDelay() {
        return SeekBarPreference.clampToRange(Settings.VIDEO_DELAY);
    }

    private static int clampToConfig(SliderConfig config, int delayMs) {
        return (int) Math.max(config.min(), Math.min(config.max(), delayMs));
    }

    private static TextView createTitleView(Context context, int foregroundColor) {
        TextView titleView = new TextView(context);
        titleView.setText(str("morphe_video_delay_title"));
        titleView.setTextColor(foregroundColor);
        titleView.setTextSize(16);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setGravity(Gravity.CENTER);

        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        titleParams.setMargins(0, Dim.dp20, 0, Dim.dp8);
        titleView.setLayoutParams(titleParams);
        return titleView;
    }

    private static SeekBar createSlider(Context context, SliderConfig config, int foregroundColor) {
        SeekBar slider = new SeekBar(context);
        slider.setMax(delayToProgress(config, (int) config.max()));
        slider.setProgress(delayToProgress(config, clampedDelay()));
        slider.getProgressDrawable().setColorFilter(
                new PorterDuffColorFilter(foregroundColor, PorterDuff.Mode.SRC_IN));
        slider.getThumb().setColorFilter(
                new PorterDuffColorFilter(foregroundColor, PorterDuff.Mode.SRC_IN));
        slider.setLayoutParams(new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        return slider;
    }

    private static LinearLayout createSliderLayout(Context context, Button minusButton,
                                                   SeekBar slider, Button plusButton) {
        LinearLayout sliderLayout = new LinearLayout(context);
        sliderLayout.setOrientation(LinearLayout.HORIZONTAL);
        sliderLayout.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout.LayoutParams sliderLayoutParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        sliderLayoutParams.setMargins(0, Dim.dp8, 0, Dim.dp16);
        sliderLayout.setLayoutParams(sliderLayoutParams);

        sliderLayout.addView(minusButton);
        sliderLayout.addView(slider);
        sliderLayout.addView(plusButton);
        return sliderLayout;
    }

    private static EditText createInputField(Context context, SliderConfig config, int foregroundColor) {
        EditText inputField = new EditText(context);
        inputField.setHint(str("morphe_video_delay_dialog_input_hint"));
        inputField.setInputType(InputType.TYPE_CLASS_NUMBER);
        inputField.setImeOptions(EditorInfo.IME_ACTION_DONE);
        inputField.setFilters(new InputFilter[]{
                new InputFilter.LengthFilter(String.valueOf((int) config.max()).length())
        });
        inputField.setTextColor(foregroundColor);
        inputField.setHintTextColor(Color.GRAY);
        inputField.setBackgroundColor(Color.TRANSPARENT);
        inputField.setPadding(0, 0, 0, 0);
        inputField.setText(String.valueOf(clampedDelay()));
        inputField.setLayoutParams(new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        return inputField;
    }

    private static LinearLayout createFieldBox(Context context, SliderConfig config, EditText inputField) {
        TextView unitView = new TextView(context);
        unitView.setText(config.unit());
        unitView.setTextColor(Color.GRAY);

        ShapeDrawable fieldBackground = new ShapeDrawable(new RoundRectShape(
                Dim.roundedCorners(10), null, null));
        fieldBackground.getPaint().setColor(BaseThemeUtils.getEditTextBackground());

        LinearLayout fieldBox = new LinearLayout(context);
        fieldBox.setOrientation(LinearLayout.HORIZONTAL);
        fieldBox.setGravity(Gravity.CENTER_VERTICAL);
        fieldBox.setBackground(fieldBackground);
        fieldBox.setPadding(Dim.dp12, Dim.dp8, Dim.dp12, Dim.dp8);
        fieldBox.addView(inputField);
        fieldBox.addView(unitView);
        return fieldBox;
    }

    /**
     * Shows a dialog with a slider and a number field for adjusting the delay.
     * Changes are applied immediately, so the sync can be adjusted while the video plays.
     */
    private static void showDialog(Context context) {
        try {
            SliderConfig config = Settings.VIDEO_DELAY.sliderConfig;
            if (config == null) return;

            final int foregroundColor = BaseThemeUtils.getAppForegroundColor();

            SheetBottomDialog.DraggableLinearLayout mainLayout =
                    SheetBottomDialog.createMainLayout(context, BaseThemeUtils.getDialogBackgroundColor());

            LinearLayout contentLayout = new LinearLayout(context);
            contentLayout.setOrientation(LinearLayout.VERTICAL);
            contentLayout.setPadding(Dim.dp16, 0, Dim.dp16, Dim.dp16);

            // The slider has too many steps to select each one by touch, so -/+ adjust by a single step.
            Button minusButton = VideoUtils.createStyledButton(context, false, Dim.dp8, Dim.dp8);
            Button plusButton = VideoUtils.createStyledButton(context, true, Dim.dp8, Dim.dp8);
            SeekBar slider = createSlider(context, config, foregroundColor);
            EditText inputField = createInputField(context, config, foregroundColor);

            // Keeps the slider and the number field from updating each other in a loop.
            final boolean[] isUpdating = {false};

            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override
                public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                    if (!fromUser || isUpdating[0]) return;
                    final int delayMs = progressToDelay(config, progress);
                    setDelay(delayMs);

                    isUpdating[0] = true;
                    inputField.setText(String.valueOf(delayMs));
                    inputField.setSelection(inputField.getText().length());
                    isUpdating[0] = false;
                }

                @Override
                public void onStartTrackingTouch(SeekBar seekBar) {}

                @Override
                public void onStopTrackingTouch(SeekBar seekBar) {}
            });

            inputField.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {}

                @Override
                public void afterTextChanged(Editable s) {
                    if (isUpdating[0]) return;
                    final int delayMs;
                    try {
                        delayMs = clampToConfig(config, Integer.parseInt(s.toString()));
                    } catch (NumberFormatException ex) {
                        return; // Empty field.
                    }
                    setDelay(delayMs);

                    isUpdating[0] = true;
                    slider.setProgress(delayToProgress(config, delayMs));
                    isUpdating[0] = false;
                }
            });

            // Changing the number field also saves the delay and moves the slider.
            minusButton.setOnClickListener(v -> inputField.setText(String.valueOf(
                    clampToConfig(config, clampedDelay() - (int) config.step()))));
            plusButton.setOnClickListener(v -> inputField.setText(String.valueOf(
                    clampToConfig(config, clampedDelay() + (int) config.step()))));

            contentLayout.addView(createTitleView(context, foregroundColor));
            contentLayout.addView(createSliderLayout(context, minusButton, slider, plusButton));
            contentLayout.addView(createFieldBox(context, config, inputField));
            mainLayout.addView(contentLayout);

            SheetBottomDialog.SlideDialog dialog = SheetBottomDialog.createSlideDialog(
                    context, mainLayout, DIALOG_ANIMATION_DURATION);

            PipDismissHelper.dismissOnPip(dialog);
            dialog.show();
        } catch (Exception ex) {
            Logger.printException(() -> "showDialog failure", ex);
        }
    }
}
