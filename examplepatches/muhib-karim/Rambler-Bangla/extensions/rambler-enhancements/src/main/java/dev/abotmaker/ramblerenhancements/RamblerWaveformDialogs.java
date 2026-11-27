package dev.abotmaker.ramblerenhancements;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.GridLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.Locale;

/**
 * Live-previewed customization dialogs for the standalone Rambler Waveform settings screen.
 */
final class RamblerWaveformDialogs {
    private static final String TAG = "RamblerWaveform";
    private static final int COLOR_TILE_HEIGHT_DP = 132;

    interface SelectionConsumer {
        void accept(String value);
    }

    interface TuningConsumer {
        void accept(String glowLook, float dotSpacingDp, float glowIntensity, float voiceResponse);
    }

    private RamblerWaveformDialogs() {
    }

    static AlertDialog showAnimationChoiceDialog(
            Context context,
            String title,
            String whenCaption,
            String[] labels,
            String[] descriptions,
            String[] values,
            String currentValue,
            RamblerWaveformSettings.SettingsSnapshot baseSnapshot,
            boolean isProcessingPicker,
            SelectionConsumer consumer) {
        String[] selected = {currentValue};
        HexDotScopeSimulation.Stage stage = isProcessingPicker
                ? HexDotScopeSimulation.Stage.PROCESSING
                : HexDotScopeSimulation.Stage.RECORDING;

        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(context, 18), dp(context, 8), dp(context, 18), dp(context, 4));

        RamblerWaveformPreviewView preview = new RamblerWaveformPreviewView(context);
        preview.setPreviewState(
                snapshotForAnimationChoice(baseSnapshot, selected[0], isProcessingPicker),
                stage);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56));
        previewParams.bottomMargin = dp(context, 8);
        root.addView(preview, previewParams);

        Palette pal = palette(context);
        TextView captionView = label(context, whenCaption);
        captionView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        captionView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams captionParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        captionParams.bottomMargin = dp(context, 10);
        root.addView(captionView, captionParams);

        LinearLayout[] cards = new LinearLayout[values.length];
        for (int index = 0; index < values.length; index++) {
            final int rowIndex = index;
            final String optionValue = values[index];
            LinearLayout card = new LinearLayout(context);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(context, 14), dp(context, 11), dp(context, 14), dp(context, 11));
            card.setClickable(true);
            card.setFocusable(true);
            boolean isSelected = optionValue.equals(selected[0]);
            card.setSelected(isSelected);
            card.setBackground(tileBackground(context, isSelected));

            TextView titleView = label(context, labels[index]);
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            titleView.setTypeface(Typeface.DEFAULT_BOLD);
            card.addView(titleView);

            TextView descView = label(context, descriptions[index]);
            descView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            descView.setTextColor(pal.secondary);
            LinearLayout.LayoutParams descParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            descParams.topMargin = dp(context, 2);
            card.addView(descView, descParams);

            cards[index] = card;
            card.setOnClickListener(view -> runSafely("preview animation choice", () -> {
                selected[0] = optionValue;
                for (int i = 0; i < cards.length; i++) {
                    boolean active = i == rowIndex;
                    cards[i].setSelected(active);
                    cards[i].setBackground(tileBackground(context, active));
                }
                preview.setPreviewState(
                        snapshotForAnimationChoice(baseSnapshot, optionValue, isProcessingPicker),
                        stage);
            }));

            LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cardParams.bottomMargin = dp(context, 8);
            root.addView(card, cardParams);
        }

        ScrollView scroll = new ScrollView(context);
        scroll.addView(root);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(scroll)
                .setPositiveButton("Save", (ignored, ignoredWhich) ->
                        runSafely("save animation choice", () -> consumer.accept(selected[0])))
                .setNegativeButton("Cancel", null)
                .create();
        dialog.show();
        return dialog;
    }

    static AlertDialog showTuningDialog(
            Context context,
            RamblerWaveformSettings.SettingsSnapshot baseSnapshot,
            TuningConsumer consumer) {
        RamblerWaveformSettings.SettingsSnapshot initial =
                baseSnapshot == null ? RamblerWaveformSettings.defaultSnapshot() : baseSnapshot;
        String[] glowLook = {initial.getGlowLook()};
        float[] dotSpacing = {initial.getDotSpacingDp()};
        float[] glowIntensity = {initial.getGlowIntensity()};
        float[] voiceResponse = {initial.getVoiceResponse()};

        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(context, 18), dp(context, 8), dp(context, 18), dp(context, 4));

        RamblerWaveformPreviewView preview = new RamblerWaveformPreviewView(context);
        RamblerWaveformSettings.SettingsSnapshot previewBase = initial.isStock()
                ? initial.withListeningStyle(RamblerWaveformSettings.LISTENING_HEX_DOT_SCOPE)
                : initial;
        preview.setPreviewState(previewBase, HexDotScopeSimulation.Stage.RECORDING);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56));
        previewParams.bottomMargin = dp(context, 8);
        root.addView(preview, previewParams);

        Palette pal = palette(context);
        TextView subView = label(context, "Applies live to both Listening and Processing animations.");
        subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        subView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams subParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subParams.bottomMargin = dp(context, 12);
        root.addView(subView, subParams);

        TextView lookHeader = label(context, "Glow style");
        lookHeader.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(lookHeader);

        LinearLayout lookRow = new LinearLayout(context);
        lookRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams lookRowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lookRowParams.topMargin = dp(context, 6);
        lookRowParams.bottomMargin = dp(context, 12);
        root.addView(lookRow, lookRowParams);

        LinearLayout stripCard = glowLookCard(
                context, "Strip trace", "Glow under lit dots (Hex desktop/strip).",
                RamblerWaveformSettings.GLOW_LOOK_STRIP.equals(glowLook[0]));
        LinearLayout iosCard = glowLookCard(
                context, "iOS halo", "Side edge lobes + dot halos (Hex iOS).",
                RamblerWaveformSettings.GLOW_LOOK_IOS_HALO.equals(glowLook[0]));

        LinearLayout.LayoutParams leftParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        leftParams.rightMargin = dp(context, 4);
        LinearLayout.LayoutParams rightParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        rightParams.leftMargin = dp(context, 4);
        lookRow.addView(stripCard, leftParams);
        lookRow.addView(iosCard, rightParams);

        final int spacingSteps = Math.round(
                (RamblerWaveformSettings.MAX_DOT_SPACING_DP - RamblerWaveformSettings.MIN_DOT_SPACING_DP) * 10.0f);
        final int glowSteps = Math.round(
                (RamblerWaveformSettings.MAX_GLOW_INTENSITY - RamblerWaveformSettings.MIN_GLOW_INTENSITY) * 10.0f);
        final int responseSteps = Math.round(
                (RamblerWaveformSettings.MAX_VOICE_RESPONSE - RamblerWaveformSettings.MIN_VOICE_RESPONSE) * 10.0f);

        TextView spacingTitle = label(context, formatSpacing(dotSpacing[0]));
        root.addView(spacingTitle);
        SeekBar spacingBar = new SeekBar(context);
        spacingBar.setMax(spacingSteps);
        spacingBar.setProgress(Math.round(
                (dotSpacing[0] - RamblerWaveformSettings.MIN_DOT_SPACING_DP) * 10.0f));
        spacingBar.setMinimumHeight(dp(context, 42));
        root.addView(spacingBar);

        TextView glowTitle = label(context, formatMultiplier("Glow", glowIntensity[0]));
        root.addView(glowTitle);
        SeekBar glowBar = new SeekBar(context);
        glowBar.setMax(glowSteps);
        glowBar.setProgress(Math.round(
                (glowIntensity[0] - RamblerWaveformSettings.MIN_GLOW_INTENSITY) * 10.0f));
        glowBar.setMinimumHeight(dp(context, 42));
        root.addView(glowBar);

        TextView responseTitle = label(context, formatMultiplier("Voice response", voiceResponse[0]));
        root.addView(responseTitle);
        SeekBar responseBar = new SeekBar(context);
        responseBar.setMax(responseSteps);
        responseBar.setProgress(Math.round(
                (voiceResponse[0] - RamblerWaveformSettings.MIN_VOICE_RESPONSE) * 10.0f));
        responseBar.setMinimumHeight(dp(context, 42));
        root.addView(responseBar);

        Runnable refreshPreview = () -> preview.setPreviewState(
                previewBase.withTuning(glowLook[0], dotSpacing[0], glowIntensity[0], voiceResponse[0]),
                null);

        Runnable refreshLookCards = () -> {
            boolean isStrip = RamblerWaveformSettings.GLOW_LOOK_STRIP.equals(glowLook[0]);
            stripCard.setSelected(isStrip);
            stripCard.setBackground(tileBackground(context, isStrip));
            iosCard.setSelected(!isStrip);
            iosCard.setBackground(tileBackground(context, !isStrip));
        };

        stripCard.setOnClickListener(v -> runSafely("select strip look", () -> {
            glowLook[0] = RamblerWaveformSettings.GLOW_LOOK_STRIP;
            refreshLookCards.run();
            refreshPreview.run();
        }));
        iosCard.setOnClickListener(v -> runSafely("select iOS look", () -> {
            glowLook[0] = RamblerWaveformSettings.GLOW_LOOK_IOS_HALO;
            refreshLookCards.run();
            refreshPreview.run();
        }));

        spacingBar.setOnSeekBarChangeListener(new SimpleSeekBarListener(progress -> {
            dotSpacing[0] = RamblerWaveformSettings.clampDotSpacingDp(
                    RamblerWaveformSettings.MIN_DOT_SPACING_DP + progress * 0.1f);
            spacingTitle.setText(formatSpacing(dotSpacing[0]));
            refreshPreview.run();
        }));
        glowBar.setOnSeekBarChangeListener(new SimpleSeekBarListener(progress -> {
            glowIntensity[0] = RamblerWaveformSettings.clampGlowIntensity(
                    RamblerWaveformSettings.MIN_GLOW_INTENSITY + progress * 0.1f);
            glowTitle.setText(formatMultiplier("Glow", glowIntensity[0]));
            refreshPreview.run();
        }));
        responseBar.setOnSeekBarChangeListener(new SimpleSeekBarListener(progress -> {
            voiceResponse[0] = RamblerWaveformSettings.clampVoiceResponse(
                    RamblerWaveformSettings.MIN_VOICE_RESPONSE + progress * 0.1f);
            responseTitle.setText(formatMultiplier("Voice response", voiceResponse[0]));
            refreshPreview.run();
        }));

        ScrollView scroll = new ScrollView(context);
        scroll.addView(root);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle("Hex waveform tuning")
                .setView(scroll)
                .setPositiveButton("Save", (ignored, ignoredWhich) -> runSafely("save tuning", () ->
                        consumer.accept(glowLook[0], dotSpacing[0], glowIntensity[0], voiceResponse[0])))
                .setNegativeButton("Cancel", null)
                .setNeutralButton("Reset", null)
                .create();
        dialog.setOnShowListener(ignored -> runSafely("bind reset", () ->
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v ->
                        runSafely("reset tuning", () -> {
                            glowLook[0] = RamblerWaveformSettings.DEFAULT_GLOW_LOOK;
                            dotSpacing[0] = RamblerWaveformSettings.DEFAULT_DOT_SPACING_DP;
                            glowIntensity[0] = RamblerWaveformSettings.DEFAULT_GLOW_INTENSITY;
                            voiceResponse[0] = RamblerWaveformSettings.DEFAULT_VOICE_RESPONSE;
                            refreshLookCards.run();
                            spacingBar.setProgress(Math.round(
                                    (dotSpacing[0] - RamblerWaveformSettings.MIN_DOT_SPACING_DP) * 10.0f));
                            glowBar.setProgress(Math.round(
                                    (glowIntensity[0] - RamblerWaveformSettings.MIN_GLOW_INTENSITY) * 10.0f));
                            responseBar.setProgress(Math.round(
                                    (voiceResponse[0] - RamblerWaveformSettings.MIN_VOICE_RESPONSE) * 10.0f));
                            spacingTitle.setText(formatSpacing(dotSpacing[0]));
                            glowTitle.setText(formatMultiplier("Glow", glowIntensity[0]));
                            responseTitle.setText(formatMultiplier("Voice response", voiceResponse[0]));
                            refreshPreview.run();
                        }))));
        dialog.show();
        return dialog;
    }

    static AlertDialog showPaletteDialog(
            Context context,
            String title,
            String[] labels,
            String[] summaries,
            String[] values,
            String currentSelection,
            RamblerWaveformSettings.SettingsSnapshot currentSnapshot,
            boolean isProcessingSlot,
            Runnable customAction,
            SelectionConsumer consumer) {
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(context, 12), dp(context, 8), dp(context, 12), dp(context, 8));

        RamblerWaveformPreviewView preview = new RamblerWaveformPreviewView(context);
        preview.setPreviewState(
                currentSnapshot,
                isProcessingSlot
                        ? HexDotScopeSimulation.Stage.PROCESSING
                        : HexDotScopeSimulation.Stage.RECORDING);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 56));
        previewParams.setMargins(dp(context, 4), dp(context, 4), dp(context, 4), dp(context, 10));
        root.addView(preview, previewParams);

        GridLayout grid = new GridLayout(context);
        grid.setColumnCount(3);
        AlertDialog[] holder = new AlertDialog[1];
        for (int index = 0; index < values.length; index++) {
            final String value = values[index];
            boolean isCustom = RamblerWaveformSettings.COLOR_SELECTION_CUSTOM.equals(value);
            LinearLayout tile = colorTile(
                    context,
                    labels[index],
                    summaries[index],
                    value,
                    isCustom,
                    isProcessingSlot,
                    value.equals(currentSelection));
            tile.setOnClickListener(view -> runSafely("select color", () -> {
                if (holder[0] != null) {
                    holder[0].dismiss();
                }
                if (isCustom) {
                    new Handler(Looper.getMainLooper()).post(
                            () -> runSafely("open custom color picker", customAction));
                } else {
                    consumer.accept(value);
                }
            }));
            grid.addView(tile, gridParams(context, COLOR_TILE_HEIGHT_DP));
        }
        root.addView(grid);

        ScrollView scroll = new ScrollView(context);
        scroll.addView(root);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(scroll)
                .setNegativeButton("Cancel", null)
                .create();
        holder[0] = dialog;
        dialog.show();
        return dialog;
    }

    static AlertDialog showColorPickerDialog(
            Context context,
            String title,
            String initialValue,
            RamblerWaveformSettings.SettingsSnapshot baseSnapshot,
            boolean isProcessingSlot,
            SelectionConsumer consumer) {
        int initialColor = parseColorOrDefault(initialValue, isProcessingSlot);
        int[] alpha = {Color.alpha(initialColor)};
        boolean[] syncing = {false};

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(context, 24), dp(context, 8), dp(context, 24), 0);

        RamblerWaveformPreviewView preview = new RamblerWaveformPreviewView(context);
        preview.setPreviewState(
                snapshotWithColor(baseSnapshot, formatColor(initialColor), isProcessingSlot),
                isProcessingSlot
                        ? HexDotScopeSimulation.Stage.PROCESSING
                        : HexDotScopeSimulation.Stage.RECORDING);
        LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 52));
        previewParams.bottomMargin = dp(context, 12);
        content.addView(preview, previewParams);

        HsvColorPickerView picker = new HsvColorPickerView(context);
        picker.setColor(initialColor);
        content.addView(picker, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 224)));

        TextView opacityView = label(context, "Opacity");
        LinearLayout.LayoutParams opacityParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        opacityParams.topMargin = dp(context, 12);
        content.addView(opacityView, opacityParams);

        SeekBar alphaBar = new SeekBar(context);
        alphaBar.setMax(255);
        alphaBar.setProgress(alpha[0]);
        alphaBar.setMinimumHeight(dp(context, 48));
        content.addView(alphaBar);

        content.addView(label(context, "Hex color (#RRGGBB or #AARRGGBB)"));

        EditText input = new EditText(context);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        input.setHint("#DBD4C4");
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(9)});
        input.setText(formatColor(initialColor));
        input.setSelectAllOnFocus(true);
        input.setMinimumHeight(dp(context, 48));
        content.addView(input);

        Runnable syncFromPicker = () -> runSafely("sync color picker", () -> {
            if (syncing[0]) {
                return;
            }
            syncing[0] = true;
            try {
                int rgb = picker.getColor();
                int argb = Color.argb(alpha[0], Color.red(rgb), Color.green(rgb), Color.blue(rgb));
                String hex = formatColor(argb);
                input.setText(hex);
                input.setSelection(input.length());
                preview.setPreviewState(
                        snapshotWithColor(baseSnapshot, hex, isProcessingSlot), null);
            } finally {
                syncing[0] = false;
            }
        });

        picker.setListener(ignored -> syncFromPicker.run());
        alphaBar.setOnSeekBarChangeListener(new SimpleSeekBarListener(progress -> {
            alpha[0] = progress;
            syncFromPicker.run();
        }));
        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                runSafely("apply hex color", () -> {
                    if (syncing[0]) {
                        return;
                    }
                    String raw = s == null ? null : s.toString();
                    Integer parsed = RamblerWaveformSettings.tryParseArgb(raw);
                    if (parsed == null) {
                        return;
                    }
                    syncing[0] = true;
                    try {
                        int argb = parsed.intValue();
                        alpha[0] = Color.alpha(argb);
                        alphaBar.setProgress(alpha[0]);
                        picker.setColor(argb);
                        preview.setPreviewState(
                                snapshotWithColor(baseSnapshot, formatColor(argb), isProcessingSlot),
                                null);
                    } finally {
                        syncing[0] = false;
                    }
                });
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });

        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(scroll)
                .setPositiveButton("Save", null)
                .setNegativeButton("Cancel", null)
                .create();
        dialog.setOnShowListener(ignored -> runSafely("init color save button", () ->
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view ->
                        runSafely("save custom color", () -> {
                            String normalized = RamblerWaveformSettings
                                    .tryNormalizeColorHex(input.getText().toString());
                            if (normalized == null) {
                                input.setError("Enter a 6- or 8-digit hex color (e.g. #DBD4C4)");
                                return;
                            }
                            consumer.accept(normalized);
                            dialog.dismiss();
                        }))));
        dialog.show();
        return dialog;
    }

    private static LinearLayout glowLookCard(
            Context context, String title, String description, boolean selected) {
        Palette pal = palette(context);
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(context, 10), dp(context, 9), dp(context, 10), dp(context, 9));
        card.setClickable(true);
        card.setFocusable(true);
        card.setSelected(selected);
        card.setBackground(tileBackground(context, selected));

        TextView titleView = label(context, title);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        card.addView(titleView);

        TextView descView = label(context, description);
        descView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        descView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(context, 2);
        card.addView(descView, params);
        return card;
    }

    private static String formatSpacing(float dpValue) {
        return String.format(Locale.US, "Dot spacing: %.1f dp", dpValue);
    }

    private static String formatMultiplier(String title, float value) {
        return String.format(Locale.US, "%s: %.1fx", title, value);
    }

    private static RamblerWaveformSettings.SettingsSnapshot snapshotForAnimationChoice(
            RamblerWaveformSettings.SettingsSnapshot base,
            String value,
            boolean isProcessingPicker) {
        RamblerWaveformSettings.SettingsSnapshot resolved =
                base == null ? RamblerWaveformSettings.defaultSnapshot() : base;
        if (isProcessingPicker) {
            if (resolved.isStock()) {
                resolved = resolved.withListeningStyle(RamblerWaveformSettings.LISTENING_HEX_DOT_SCOPE);
            }
            return resolved.withProcessingStyle(value);
        }
        return resolved.withListeningStyle(value);
    }

    private static RamblerWaveformSettings.SettingsSnapshot snapshotWithColor(
            RamblerWaveformSettings.SettingsSnapshot base,
            String colorHex,
            boolean isProcessingSlot) {
        RamblerWaveformSettings.SettingsSnapshot resolved =
                base == null ? RamblerWaveformSettings.defaultSnapshot() : base;
        if (resolved.isStock()) {
            resolved = resolved.withListeningStyle(RamblerWaveformSettings.LISTENING_HEX_DOT_SCOPE);
        }
        return resolved.withColor(colorHex, isProcessingSlot);
    }

    private static LinearLayout colorTile(
            Context context,
            String labelText,
            String summary,
            String value,
            boolean custom,
            boolean isProcessingSlot,
            boolean selected) {
        LinearLayout tile = new LinearLayout(context);
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setGravity(Gravity.CENTER_HORIZONTAL);
        tile.setPadding(dp(context, 8), dp(context, 10), dp(context, 8), dp(context, 10));
        tile.setMinimumHeight(dp(context, COLOR_TILE_HEIGHT_DP));
        tile.setClickable(true);
        tile.setFocusable(true);
        tile.setSelected(selected);
        tile.setBackground(tileBackground(context, selected));

        TextView swatchView = new TextView(context);
        swatchView.setGravity(Gravity.CENTER);
        swatchView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        Palette pal = palette(context);
        if (custom && (summary == null || summary.isEmpty())) {
            swatchView.setText("+");
            swatchView.setTextColor(pal.primary);
            swatchView.setBackground(swatchDrawable(context, null, selected));
        } else if (RamblerWaveformSettings.COLOR_HEX_DEFAULT.equals(value)) {
            String hex = isProcessingSlot
                    ? RamblerWaveformSettings.PRESET_AGENT_BLUE
                    : RamblerWaveformSettings.PRESET_PEARL;
            swatchView.setText("H");
            swatchView.setTextColor(Color.parseColor("#FF161B22"));
            swatchView.setBackground(swatchDrawable(context, hex, selected));
        } else if (RamblerWaveformSettings.COLOR_THEME_AUTO.equals(value)) {
            swatchView.setText("A");
            swatchView.setTextColor(pal.primary);
            swatchView.setBackground(swatchDrawable(context, null, selected));
        } else {
            swatchView.setBackground(swatchDrawable(context, custom ? summary : value, selected));
        }
        tile.addView(swatchView, new LinearLayout.LayoutParams(dp(context, 48), dp(context, 48)));

        TextView titleView = label(context, labelText);
        titleView.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleParams.topMargin = dp(context, 8);
        tile.addView(titleView, titleParams);

        TextView subView = label(context, summary == null ? "" : summary);
        subView.setGravity(Gravity.CENTER);
        subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        subView.setTextColor(pal.secondary);
        subView.setMinLines(2);
        subView.setMaxLines(2);
        tile.addView(subView);
        return tile;
    }

    private static GridLayout.LayoutParams gridParams(Context context, int heightDp) {
        GridLayout.LayoutParams params = new GridLayout.LayoutParams();
        params.width = 0;
        params.height = dp(context, heightDp);
        params.columnSpec = GridLayout.spec(GridLayout.UNDEFINED, 1, 1f);
        params.setMargins(dp(context, 4), dp(context, 4), dp(context, 4), dp(context, 4));
        return params;
    }

    static TextView label(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setTextColor(palette(context).primary);
        return view;
    }

    static Drawable tileBackground(Context context, boolean selected) {
        Palette pal = palette(context);
        GradientDrawable content = new GradientDrawable();
        content.setColor(selected ? pal.selected : pal.surface);
        content.setCornerRadius(dp(context, 16));
        content.setStroke(dp(context, selected ? 2 : 1), selected ? pal.accent : pal.stroke);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(context, 16));
        return new RippleDrawable(ColorStateList.valueOf(pal.pressed), content, mask);
    }

    private static Drawable swatchDrawable(Context context, String hexValue, boolean selected) {
        Palette pal = palette(context);
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        Integer parsed = hexValue == null ? null : RamblerWaveformSettings.tryParseArgb(hexValue);
        drawable.setColor(parsed == null ? pal.surfaceAlt : parsed.intValue());
        drawable.setStroke(dp(context, selected ? 3 : 1), selected ? pal.accent : pal.stroke);
        return drawable;
    }

    private static void runSafely(String operation, Runnable action) {
        if (action == null) {
            return;
        }
        try {
            action.run();
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to " + operation, throwable);
            } catch (Throwable ignored) {
                // Fail closed.
            }
        }
    }

    private static int parseColorOrDefault(String value, boolean isProcessingSlot) {
        Integer parsed = RamblerWaveformSettings.tryParseArgb(value);
        if (parsed != null) {
            return parsed.intValue();
        }
        return Color.parseColor(isProcessingSlot
                ? RamblerWaveformSettings.DEFAULT_CUSTOM_PROCESSING_HEX
                : RamblerWaveformSettings.DEFAULT_CUSTOM_LISTENING_HEX);
    }

    private static String formatColor(int color) {
        return Color.alpha(color) == 255
                ? String.format(Locale.ROOT, "#%02X%02X%02X",
                        Color.red(color), Color.green(color), Color.blue(color))
                : String.format(Locale.ROOT, "#%08X", color);
    }

    static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    static Palette palette(Context context) {
        boolean dark = (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return dark
                ? new Palette(
                        Color.parseColor("#FF0E1117"), Color.parseColor("#FFF3F5F8"),
                        Color.parseColor("#FFAAB3C0"), Color.parseColor("#FF121821"),
                        Color.parseColor("#FF161B22"), Color.parseColor("#1FFFFFFF"),
                        Color.parseColor("#172554"), Color.parseColor("#FF8AB4F8"),
                        Color.parseColor("#1F8AB4F8"))
                : new Palette(
                        Color.parseColor("#FFF6F7FB"), Color.parseColor("#FF101828"),
                        Color.parseColor("#FF5F6B7A"), Color.parseColor("#EEF3FB"),
                        Color.WHITE, Color.parseColor("#140F172A"),
                        Color.parseColor("#E8F0FE"), Color.parseColor("#FF1A73E8"),
                        Color.parseColor("#141A73E8"));
    }

    static final class Palette {
        final int background;
        final int primary;
        final int secondary;
        final int surfaceAlt;
        final int surface;
        final int stroke;
        final int selected;
        final int accent;
        final int pressed;

        Palette(
                int background, int primary, int secondary, int surfaceAlt, int surface,
                int stroke, int selected, int accent, int pressed) {
            this.background = background;
            this.primary = primary;
            this.secondary = secondary;
            this.surfaceAlt = surfaceAlt;
            this.surface = surface;
            this.stroke = stroke;
            this.selected = selected;
            this.accent = accent;
            this.pressed = pressed;
        }
    }

    private static final class SimpleSeekBarListener implements SeekBar.OnSeekBarChangeListener {
        interface ProgressConsumer {
            void accept(int progress);
        }

        private final ProgressConsumer consumer;

        SimpleSeekBarListener(ProgressConsumer consumer) {
            this.consumer = consumer;
        }

        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            runSafely("handle slider", () -> consumer.accept(progress));
        }

        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {
        }
    }

    private static final class HsvColorPickerView extends View {
        interface Listener {
            void onColorChanged(int color);
        }

        private static final int[] HUE_COLORS = {
                Color.RED, Color.YELLOW, Color.GREEN, Color.CYAN,
                Color.BLUE, Color.MAGENTA, Color.RED
        };

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint indicatorPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF plane = new RectF();
        private final RectF hue = new RectF();
        private final float density;
        private final float[] hsv = {38f, 0.11f, 0.86f};
        private Listener listener;
        private boolean draggingHue;
        private boolean draggingPlane;

        HsvColorPickerView(Context context) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            setClickable(true);
            setFocusable(true);
            setMinimumHeight(dp(224));
        }

        void setColor(int color) {
            Color.colorToHSV(color, hsv);
            invalidate();
        }

        int getColor() {
            return Color.HSVToColor(hsv);
        }

        void setListener(Listener listener) {
            this.listener = listener;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(
                    resolveSize(dp(300), widthMeasureSpec),
                    resolveSize(dp(224), heightMeasureSpec));
        }

        @Override
        protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
            float inset = dp(4);
            float hueHeight = dp(44);
            float gap = dp(14);
            plane.set(inset, inset, width - inset,
                    Math.max(inset, height - inset - hueHeight - gap));
            hue.set(inset, plane.bottom + gap, width - inset, height - inset);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            try {
                int hueColor = Color.HSVToColor(new float[]{hsv[0], 1f, 1f});
                Shader saturation = new LinearGradient(
                        plane.left, plane.top, plane.right, plane.top,
                        Color.WHITE, hueColor, Shader.TileMode.CLAMP);
                Shader value = new LinearGradient(
                        plane.left, plane.top, plane.left, plane.bottom,
                        Color.WHITE, Color.BLACK, Shader.TileMode.CLAMP);
                paint.setShader(new ComposeShader(saturation, value, PorterDuff.Mode.MULTIPLY));
                canvas.drawRoundRect(plane, dp(12), dp(12), paint);

                paint.setShader(new LinearGradient(
                        hue.left, hue.top, hue.right, hue.top,
                        HUE_COLORS, null, Shader.TileMode.CLAMP));
                canvas.drawRoundRect(hue, dp(12), dp(12), paint);
                paint.setShader(null);

                drawIndicator(canvas, plane.left + hsv[1] * plane.width(),
                        plane.top + (1f - hsv[2]) * plane.height(), dp(10));
                drawIndicator(canvas, hue.left + (hsv[0] / 360f) * hue.width(),
                        hue.centerY(), dp(11));
            } catch (Throwable throwable) {
                paint.setShader(null);
            }
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            try {
                if (!isEnabled()) {
                    return false;
                }
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        draggingHue = hue.contains(event.getX(), event.getY());
                        draggingPlane = plane.contains(event.getX(), event.getY());
                        if (!draggingHue && !draggingPlane) {
                            return false;
                        }
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(true);
                        }
                        update(event);
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        update(event);
                        return true;
                    case MotionEvent.ACTION_UP:
                        update(event);
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(false);
                        }
                        performClick();
                        return true;
                    case MotionEvent.ACTION_CANCEL:
                        if (getParent() != null) {
                            getParent().requestDisallowInterceptTouchEvent(false);
                        }
                        return true;
                    default:
                        return super.onTouchEvent(event);
                }
            } catch (Throwable ignored) {
                return false;
            }
        }

        @Override
        public boolean performClick() {
            super.performClick();
            return true;
        }

        private void update(MotionEvent event) {
            if (draggingHue && hue.width() > 0.0f) {
                hsv[0] = clamp((event.getX() - hue.left) / hue.width()) * 360f;
            } else if (draggingPlane && plane.width() > 0.0f && plane.height() > 0.0f) {
                hsv[1] = clamp((event.getX() - plane.left) / plane.width());
                hsv[2] = 1f - clamp((event.getY() - plane.top) / plane.height());
            }
            invalidate();
            if (listener != null) {
                runSafely("notify color listener", () -> listener.onColorChanged(getColor()));
            }
        }

        private void drawIndicator(Canvas canvas, float x, float y, float radius) {
            indicatorPaint.setStyle(Paint.Style.STROKE);
            indicatorPaint.setStrokeWidth(dp(4));
            indicatorPaint.setColor(Color.BLACK);
            canvas.drawCircle(x, y, radius, indicatorPaint);
            indicatorPaint.setStrokeWidth(dp(2));
            indicatorPaint.setColor(Color.WHITE);
            canvas.drawCircle(x, y, radius, indicatorPaint);
        }

        private float clamp(float v) {
            return Math.max(0f, Math.min(1f, v));
        }

        private int dp(int value) {
            return Math.round(value * density);
        }
    }
}
