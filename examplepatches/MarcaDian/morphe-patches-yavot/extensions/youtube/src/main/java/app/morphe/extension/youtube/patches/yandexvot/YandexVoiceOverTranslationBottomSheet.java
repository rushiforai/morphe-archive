/*
 * Copyright (C) 2026 Morphe
 *
 * This file is part of the morphe-patches project:
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original author(s):
 * - Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 */


package app.morphe.extension.youtube.patches.yandexvot;

import static app.morphe.extension.shared.StringRef.str;
import static app.morphe.extension.youtube.videoplayer.LegacyPlayerControlButton.fadeInDuration;
import static app.morphe.extension.youtube.videoplayer.LegacyPlayerControlButton.getDialogBackgroundColor;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Typeface;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.settings.preference.SeekBarPreference.SeekBarConfig;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.SheetBottomDialog;
import app.morphe.extension.youtube.patches.playback.speed.CustomPlaybackSpeedPatch;
import app.morphe.extension.youtube.settings.YandexVotSettings;
import app.morphe.extension.youtube.shared.PlayerType;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

@SuppressWarnings("unused")
public class YandexVoiceOverTranslationBottomSheet {
    private static final Runnable STATUS_REFRESH_CALLBACK =
            YandexVoiceOverTranslationBottomSheet::refreshStatusIfVisible;
    private static final Runnable STATUS_COUNTDOWN_TICK =
            YandexVoiceOverTranslationBottomSheet::refreshStatusIfVisible;


    private static WeakReference<SheetBottomDialog.SlideDialog> currentDialog;
    private static WeakReference<TextView> currentStatusText;
    private static WeakReference<Button> standardVoiceButton;
    private static WeakReference<Button> liveVoiceButton;

    @SuppressLint("SetTextI18n")
    public static void show(Context context) {
        try {
            // Dismiss existing dialog if showing.
            SheetBottomDialog.SlideDialog existing = currentDialog != null ? currentDialog.get() : null;
            if (existing != null && existing.isShowing()) {
                existing.dismiss();
            }

            final int bgColor = getDialogBackgroundColor();
            final int fgColor = Utils.getAppForegroundColor();

            // Create main layout.
            SheetBottomDialog.DraggableLinearLayout mainLayout =
                    SheetBottomDialog.createMainLayout(context, bgColor);

            // --- Title ---
            TextView titleText = new TextView(context);
            titleText.setText(str("morphe_yandex_vot_screen_title"));
            titleText.setTextColor(fgColor);
            titleText.setTextSize(16);
            titleText.setTypeface(Typeface.DEFAULT_BOLD);
            titleText.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            titleParams.setMargins(0, Dim.dp20, 0, Dim.dp12);
            titleText.setLayoutParams(titleParams);
            mainLayout.addView(titleText);

            // Keep the title and drag handle visible while allowing all controls to remain
            // reachable on short landscape screens. This mirrors the official VoT sheet.
            ScrollView scroll = new ScrollView(context);
            scroll.setFillViewport(true);
            scroll.setClipToPadding(false);

            LinearLayout contentLayout = new LinearLayout(context);
            contentLayout.setOrientation(LinearLayout.VERTICAL);
            contentLayout.setPadding(0, 0, 0, Dim.dp16);
            scroll.addView(contentLayout);

            // --- Status indicator ---
            TextView statusText = new TextView(context);
            updateStatusText(statusText);
            currentStatusText = new WeakReference<>(statusText);
            YandexVoiceOverTranslationPatch.addOnTranslationStateChangeCallback(
                    STATUS_REFRESH_CALLBACK);
            refreshStatusIfVisible();
            statusText.setTextColor(fgColor);
            statusText.setTextSize(14);
            statusText.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams statusParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            statusParams.setMargins(0, 0, 0, Dim.dp12);
            statusText.setLayoutParams(statusParams);
            contentLayout.addView(statusText);

            // --- Translation Volume ---
            addVolumeControl(context, contentLayout,
                    str("morphe_yandex_vot_translation_volume_title"),
                    YandexVotSettings.YANDEX_VOT_TRANSLATION_VOLUME,
                    YandexVoiceOverTranslationPatch::applyVolumeToCurrentPlayer);

            // --- Original Audio Volume ---
            addVolumeControl(context, contentLayout,
                    str("morphe_yandex_vot_original_audio_volume_title"),
                    YandexVotSettings.YANDEX_VOT_ORIGINAL_AUDIO_VOLUME,
                    YandexVoiceOverTranslationPatch::refreshOriginalAudioVolumeIfActive);

            // --- Voice style: segmented buttons (Standard | Live) ---
            LinearLayout voiceStyleRow = createVoiceStyleButtons(context);
            contentLayout.addView(voiceStyleRow);

            // --- Audio proxy: proper Switch row ---
            LinearLayout proxyRow = createSwitchRow(context,
                    str("morphe_yandex_vot_audio_proxy_title"),
                    YandexVotSettings.YANDEX_VOT_AUDIO_PROXY_ENABLED,
                    YandexVoiceOverTranslationPatch::restartTranslationIfActive);
            contentLayout.addView(proxyRow);
            mainLayout.addView(scroll);

            // Create dialog.
            SheetBottomDialog.SlideDialog dialog = SheetBottomDialog.createSlideDialog(
                    context, mainLayout, fadeInDuration);
            currentDialog = new WeakReference<>(dialog);

            // Dismiss when entering PiP mode.
            Function1<PlayerType, Unit> playerTypeObserver = new Function1<>() {
                @Override
                public Unit invoke(PlayerType type) {
                    SheetBottomDialog.SlideDialog current = currentDialog.get();
                    if (current == null || !current.isShowing()) {
                        PlayerType.getOnChange().removeObserver(this);
                    } else if (type == PlayerType.WATCH_WHILE_PICTURE_IN_PICTURE) {
                        current.dismiss();
                    }
                    return Unit.INSTANCE;
                }
            };
            PlayerType.getOnChange().addObserver(playerTypeObserver);
            dialog.setOnDismissListener(d -> {
                PlayerType.getOnChange().removeObserver(playerTypeObserver);
                TextView current = currentStatusText != null ? currentStatusText.get() : null;
                if (current != null) current.removeCallbacks(STATUS_COUNTDOWN_TICK);
                currentStatusText = null;
                standardVoiceButton = null;
                liveVoiceButton = null;
            });

            dialog.show();

        } catch (Exception ex) {
            Logger.printException(() -> "YandexVoiceOverTranslationBottomSheet show failure", ex);
        }
    }

    private static void updateStatusText(TextView statusText) {
        if (YandexVoiceOverTranslationPatch.translationStarting) {
            statusText.setText(
                    YandexVoiceOverTranslationPatch.getTranslationRequestStatusText());
            statusText.setTextColor(Color.parseColor("#FFC107"));
        } else if (YandexVoiceOverTranslationPatch.isTranslationActive()) {
            statusText.setText(str("morphe_yandex_vot_stream_ready"));
            statusText.setTextColor(Color.parseColor("#4CAF50"));
        } else {
            statusText.setText(str("morphe_yandex_vot_stopped"));
            statusText.setTextColor(Utils.getAppForegroundColor());
        }
    }

    private static void refreshStatusIfVisible() {
        TextView st = currentStatusText != null ? currentStatusText.get() : null;
        if (st != null) {
            st.removeCallbacks(STATUS_COUNTDOWN_TICK);
            updateStatusText(st);
            if (YandexVoiceOverTranslationPatch.isWaitingCountdownActive()) {
                st.postDelayed(STATUS_COUNTDOWN_TICK, 1000L);
            }
        }
        updateVoiceButtonCacheIndicators();
    }

    private static void updateVoiceButtonCacheIndicators() {
        String suffix = " ✓";
        Button sb = standardVoiceButton != null ? standardVoiceButton.get() : null;
        if (sb != null) {
            boolean cached = YandexVoiceOverTranslationPatch.isCachedForCurrentVideo(false);
            String text = str("morphe_yandex_vot_voice_style_standard") + (cached ? suffix : "");
            sb.setText(text);
        }
        Button lb = liveVoiceButton != null ? liveVoiceButton.get() : null;
        if (lb != null) {
            boolean cached = YandexVoiceOverTranslationPatch.isCachedForCurrentVideo(true);
            String text = str("morphe_yandex_vot_voice_style_live") + (cached ? suffix : "");
            lb.setText(text);
        }
    }

    /**
     * Adds a volume control row: label, [- button] [SeekBar] [+ button] [value%].
     *
     * @param setting the IntegerSetting backing this volume control (provides get/save)
     * @param onChanged called when the volume changes, with the new percent value
     */
    private static void addVolumeControl(Context context, LinearLayout parent,
                                         String label,
                                         IntegerSetting setting,
                                         java.util.function.Consumer<Integer> onChanged) {
        final int fgColor = Utils.getAppForegroundColor();
        final int initialValue = setting.get();
        final SeekBarConfig config = SeekBarPreference.configFor(setting);
        if (config == null) {
            throw new IllegalStateException("No SeekBarConfig registered for " + setting.key);
        }

        // Label
        TextView labelView = new TextView(context);
        labelView.setText(str("morphe_yandex_vot_volume_label_value",
                label, SeekBarPreference.formatLabel(initialValue, config)));
        labelView.setTextColor(fgColor);
        labelView.setTextSize(14);
        labelView.setTypeface(Typeface.DEFAULT_BOLD);
        labelView.setGravity(Gravity.START);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        labelParams.setMargins(Dim.dp16, Dim.dp12, Dim.dp16, 0);
        labelView.setLayoutParams(labelParams);
        parent.addView(labelView);

        // Row: [- button] [SeekBar] [value text] [+ button]
        LinearLayout sliderRow = new LinearLayout(context);
        sliderRow.setOrientation(LinearLayout.HORIZONTAL);
        sliderRow.setGravity(Gravity.CENTER_VERTICAL);

        // - button
        Button minusButton = createMinusPlusButton(context, false);
        sliderRow.addView(minusButton);

        // SeekBar
        SeekBar seekBar = new SeekBar(context);
        seekBar.setMax((config.max() - config.min()) / config.step());
        seekBar.setProgress(SeekBarPreference.valueToProgress(config, initialValue));
        seekBar.getProgressDrawable().setColorFilter(
                new PorterDuffColorFilter(fgColor, PorterDuff.Mode.SRC_IN));
        seekBar.getThumb().setColorFilter(
                new PorterDuffColorFilter(fgColor, PorterDuff.Mode.SRC_IN));
        LinearLayout.LayoutParams seekParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        seekBar.setLayoutParams(seekParams);
        sliderRow.addView(seekBar);

        // Value text
        TextView valueText = new TextView(context);
        valueText.setText(SeekBarPreference.formatLabel(initialValue, config));
        valueText.setTextColor(fgColor);
        valueText.setTextSize(14);
        valueText.setMinWidth(Dim.dp40);
        valueText.setGravity(Gravity.CENTER);
        sliderRow.addView(valueText);

        // + button
        Button plusButton = createMinusPlusButton(context, true);
        sliderRow.addView(plusButton);

        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        rowParams.setMargins(Dim.dp8, 0, Dim.dp8, Dim.dp8);
        sliderRow.setLayoutParams(rowParams);
        parent.addView(sliderRow);

        // Volume change callback
        java.util.function.Consumer<Integer> applyVolume = vol -> {
            vol = Math.max(config.min(), Math.min(config.max(), vol));
            setting.save(vol);
            seekBar.setProgress(SeekBarPreference.valueToProgress(config, vol));
            valueText.setText(SeekBarPreference.formatLabel(vol, config));
            labelView.setText(str("morphe_yandex_vot_volume_label_value",
                    label, SeekBarPreference.formatLabel(vol, config)));
            onChanged.accept(vol);
        };

        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    applyVolume.accept(SeekBarPreference.progressToValue(config, progress));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) { }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) { }
        });

        minusButton.setOnClickListener(v -> applyVolume.accept(setting.get() - config.step()));
        plusButton.setOnClickListener(v -> applyVolume.accept(setting.get() + config.step()));
    }

    /**
     * Creates a +/- button styled like the reference implementation.
     */
    private static Button createMinusPlusButton(Context context, boolean isPlus) {
        Button button = new Button(context, null, 0);
        button.setText(isPlus ? "+" : "−");
        button.setTextColor(Utils.getAppForegroundColor());
        button.setTextSize(18);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER);
        ShapeDrawable background = new ShapeDrawable(new RoundRectShape(
                Dim.roundedCorners(20), null, null));
        background.getPaint().setColor(CustomPlaybackSpeedPatch.getAdjustedBackgroundColor(false));
        button.setBackground(background);
        final int size = Dim.dp36;
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
        params.setMargins(Dim.dp8, 0, Dim.dp8, 0);
        button.setLayoutParams(params);
        return button;
    }

    /**
     * Creates a segmented control row for voice style: Standard | Live.
     */
    private static LinearLayout createVoiceStyleButtons(Context context) {
        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(Dim.dp16, Dim.dp12, Dim.dp16, Dim.dp12);

        // Label
        TextView labelText = new TextView(context);
        labelText.setText(str("morphe_yandex_vot_voice_style_title"));
        labelText.setTextColor(Utils.getAppForegroundColor());
        labelText.setTextSize(14);
        labelText.setTypeface(Typeface.DEFAULT_BOLD);
        labelText.setGravity(Gravity.START);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        labelParams.setMargins(0, 0, 0, Dim.dp8);
        labelText.setLayoutParams(labelParams);
        container.addView(labelText);

        // Buttons row
        LinearLayout buttonsRow = new LinearLayout(context);
        buttonsRow.setOrientation(LinearLayout.HORIZONTAL);
        buttonsRow.setGravity(Gravity.CENTER);

        Button standardButton = createSegmentedButton(context, str("morphe_yandex_vot_voice_style_standard"));
        Button liveButton = createSegmentedButton(context, str("morphe_yandex_vot_voice_style_live"));

        standardVoiceButton = new WeakReference<>(standardButton);
        liveVoiceButton = new WeakReference<>(liveButton);
        updateVoiceButtonCacheIndicators();

        Runnable updateSelection = () -> {
            boolean useLive = YandexVotSettings.YANDEX_VOT_USE_LIVE_VOICES.get();
            int selectedColor = CustomPlaybackSpeedPatch.getAdjustedBackgroundColor(true);
            int unselectedColor = CustomPlaybackSpeedPatch.getAdjustedBackgroundColor(false);
            ShapeDrawable standardBg = (ShapeDrawable) standardButton.getBackground();
            ShapeDrawable liveBg = (ShapeDrawable) liveButton.getBackground();
            standardBg.getPaint().setColor(useLive ? unselectedColor : selectedColor);
            liveBg.getPaint().setColor(useLive ? selectedColor : unselectedColor);
            standardBg.invalidateSelf();
            liveBg.invalidateSelf();
        };

        updateSelection.run();

        standardButton.setOnClickListener(v -> {
            YandexVotSettings.YANDEX_VOT_USE_LIVE_VOICES.save(false);
            updateSelection.run();
            YandexVoiceOverTranslationPatch.restartTranslationIfActive();
        });
        liveButton.setOnClickListener(v -> {
            YandexVotSettings.YANDEX_VOT_USE_LIVE_VOICES.save(true);
            updateSelection.run();
            YandexVoiceOverTranslationPatch.restartTranslationIfActive();
        });

        LinearLayout.LayoutParams btnParams = new LinearLayout.LayoutParams(0, Dim.dp40, 1f);
        btnParams.setMargins(0, 0, Dim.dp4, 0);
        standardButton.setLayoutParams(btnParams);
        LinearLayout.LayoutParams btnParams2 = new LinearLayout.LayoutParams(0, Dim.dp40, 1f);
        btnParams2.setMargins(Dim.dp4, 0, 0, 0);
        liveButton.setLayoutParams(btnParams2);

        buttonsRow.addView(standardButton);
        buttonsRow.addView(liveButton);
        container.addView(buttonsRow);

        return container;
    }

    /**
     * Creates a segmented button styled like the reference VOT bottom sheet.
     */
    private static Button createSegmentedButton(Context context, String text) {
        Button button = new Button(context, null, 0);
        button.setText(text);
        button.setTextColor(Utils.getAppForegroundColor());
        button.setTextSize(13);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER);

        ShapeDrawable background = new ShapeDrawable(new RoundRectShape(
                Dim.roundedCorners(12), null, null));
        background.getPaint().setColor(CustomPlaybackSpeedPatch.getAdjustedBackgroundColor(false));
        button.setBackground(background);
        button.setPadding(Dim.dp12, Dim.dp8, Dim.dp12, Dim.dp8);
        return button;
    }

    /**
     * Creates a row with title and Switch for a boolean setting, styled like reference createVotSwitchItem.
     */
    @SuppressWarnings("SameParameterValue") // Generic row builder, like addVolumeControl; only one switch row exists today.
    private static LinearLayout createSwitchRow(Context context, String title,
                                                 app.morphe.extension.shared.settings.Setting<Boolean> setting,
                                                 Runnable onChanged) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(Dim.dp16, Dim.dp12, Dim.dp16, Dim.dp12);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClickable(true);
        row.setFocusable(true);

        // Pressed state background
        android.graphics.drawable.StateListDrawable bg = new android.graphics.drawable.StateListDrawable();
        bg.addState(new int[]{android.R.attr.state_pressed},
                new android.graphics.drawable.ColorDrawable(
                        CustomPlaybackSpeedPatch.getAdjustedBackgroundColor(true)));
        bg.addState(new int[]{}, new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
        row.setBackground(bg);

        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextSize(14);
        titleView.setTextColor(Utils.getAppForegroundColor());
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        row.addView(titleView, titleParams);

        Switch switchView = new Switch(context);
        switchView.setChecked(setting.get());
        switchView.getThumbDrawable().setColorFilter(
                new PorterDuffColorFilter(Utils.getAppForegroundColor(), PorterDuff.Mode.SRC_ATOP));
        switchView.getTrackDrawable().setColorFilter(
                new PorterDuffColorFilter(Utils.getAppForegroundColor(), PorterDuff.Mode.SRC_ATOP));
        switchView.setOnCheckedChangeListener((v, isChecked) -> {
            setting.save(isChecked);
            if (onChanged != null) onChanged.run();
        });
        row.addView(switchView);

        row.setOnClickListener(v -> switchView.setChecked(!setting.get()));

        return row;
    }

}
