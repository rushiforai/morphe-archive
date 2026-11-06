/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-31.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.Layout;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.List;
import java.util.function.IntConsumer;

import app.morphe.extension.shared.settings.preference.ColorPickerPreference;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

/** An in-window caption layer, independent of controls' auto-hide and the SurfaceView lifecycle. */
final class OfflineSubtitleOverlay {
    private static final int[] COLOURS = {Color.WHITE, Color.YELLOW, Color.CYAN, Color.GREEN};
    private static final int[] POSITIONS = {Gravity.BOTTOM, Gravity.CENTER_VERTICAL, Gravity.TOP};
    private static final Typeface[] FONTS = {
            Typeface.create("sans-serif", Typeface.NORMAL), Typeface.create("sans-serif-medium", Typeface.NORMAL),
            Typeface.create("sans-serif-condensed", Typeface.NORMAL), Typeface.create("serif", Typeface.NORMAL),
            Typeface.create("monospace", Typeface.NORMAL), Typeface.create("casual", Typeface.NORMAL),
            Typeface.create("cursive", Typeface.NORMAL)
    };

    private final Activity activity;
    private final FrameLayout root;
    private final View videoArea;
    private final TextView text;
    private final TextView control;
    private final Runnable pauseHide;
    private final Runnable resumeHide;
    private final OfflineSubtitleStyle style;
    private final GradientDrawable backdrop = new GradientDrawable();
    private final FrameLayout.LayoutParams textParams = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    private final String previewText;
    private List<OfflineCaptions.Saved> tracks = List.of();
    private List<OfflineSubtitle.Cue> selectedCues = List.of();
    private OfflineCaptions.Saved loadedTrack;
    private String videoKey = "";
    private String rendered = "";
    private int selected;
    private int areaWidth;
    private int areaHeight;
    private Dialog previewDialog;
    private Dialog activeDialog;
    private boolean adjustingSlider;

    OfflineSubtitleOverlay(Activity activity, FrameLayout root, View videoArea,
                           Runnable pauseHide, Runnable resumeHide) {
        this.activity = activity;
        this.root = root;
        this.videoArea = videoArea;
        this.pauseHide = pauseHide;
        this.resumeHide = resumeHide;
        style = OfflineSubtitleStyle.parse(Settings.OFFLINE_SUBTITLES_STYLE.get());
        saveStyle();
        previewText = str("revanced_offline_subtitles_preview");

        text = new CaptionTextView(activity);
        text.setGravity(Gravity.CENTER);
        text.setShadowLayer(Utils.dipToPixels(3), 0, Utils.dipToPixels(1), Color.BLACK);
        text.setVisibility(View.GONE);
        text.setLayoutParams(textParams);
        backdrop.setCornerRadius(Utils.dipToPixels(8));
        root.addView(text);
        View.OnLayoutChangeListener geometryChanged = (v, l, t, r, b, ol, ot, or, ob) -> updatePlacement();
        root.addOnLayoutChangeListener(geometryChanged);
        videoArea.addOnLayoutChangeListener(geometryChanged);
        text.addOnLayoutChangeListener(geometryChanged);
        applyStyle();

        control = new TextView(activity);
        control.setText("CC");
        control.setTextColor(Color.WHITE);
        control.setTextSize(16);
        control.setGravity(Gravity.CENTER);
        control.setBackgroundColor(Color.TRANSPARENT);
        int padding = Utils.dipToPixels(12);
        control.setPadding(padding, padding, padding, padding);
        control.setMinimumWidth(Utils.dipToPixels(48));
        control.setMinimumHeight(Utils.dipToPixels(48));
        control.setContentDescription(str("revanced_offline_subtitles_cc"));
        control.setOnClickListener(v -> showMenu());
        control.setVisibility(View.GONE);
    }

    TextView control() {
        return control;
    }

    void close() {
        if (activeDialog != null) activeDialog.dismiss();
    }

    void update(OfflineVideo video, long timeMs) {
        String key = video == null ? "" : video.key();
        if (!videoKey.equals(key)) {
            videoKey = key;
            tracks = video == null || video.audioOnly ? List.of() : video.subtitles;
            selected = 0;
            for (int index = 0; index < tracks.size(); index++) {
                if (tracks.get(index).language().equals(style.language)) {
                    selected = index;
                    break;
                }
            }
            control.setVisibility(tracks.isEmpty() ? View.GONE : View.VISIBLE);
            loadedTrack = null;
            selectedCues = List.of();
        }
        OfflineCaptions.Saved track = tracks.isEmpty() ? null : tracks.get(selected);
        if (track != loadedTrack) {
            loadedTrack = track;
            selectedCues = List.of();
            if (track != null) Utils.runOnBackgroundThread(() -> {
                List<OfflineSubtitle.Cue> cues = track.cues();
                Utils.runOnMainThread(() -> {
                    if (loadedTrack == track) selectedCues = cues;
                });
            });
        }
        String next = style.enabled ? OfflineSubtitle.textAt(selectedCues, timeMs) : "";
        if (!rendered.equals(next)) {
            rendered = next;
            render();
        }
        control.setAlpha(style.enabled ? 1f : 0.5f);
    }

    private void render() {
        String shown = previewDialog != null && rendered.isEmpty() ? previewText : rendered;
        if (!shown.contentEquals(text.getText())) text.setText(shown);
        text.setVisibility(shown.isEmpty() ? View.GONE : View.VISIBLE);
    }

    private void showMenu() {
        pauseHide.run();
        int count = tracks.size();
        String[] labels = new String[count + 6];
        labels[0] = str("revanced_offline_subtitles_off");
        for (int index = 0; index < count; index++) {
            OfflineCaptions.Saved track = tracks.get(index);
            labels[index + 1] = track.name() + ("translated".equals(track.kind())
                    ? " · " + str("revanced_offline_subtitles_translated") : "");
        }
        String[] options = labels("size", "colour", "background", "position", "font");
        System.arraycopy(options, 0, labels, count + 1, options.length);
        AlertDialog dialog = OfflineUi.showChoices(activity, str("revanced_offline_subtitles_cc"), labels,
                style.enabled ? selected + 1 : 0, Color.WHITE, which -> {
                    if (which <= count) {
                        style.enabled = which != 0;
                        if (style.enabled) {
                            selected = which - 1;
                            style.language = tracks.get(selected).language();
                        }
                        saveStyle();
                        update(OfflinePlayer.getCurrent(), OfflinePlayer.getPosition());
                        resumeHide.run();
                    } else {
                        showStyleMenu(which - count - 1);
                    }
                });
        dialog.setOnCancelListener(ignored -> resumeHide.run());
        activeDialog = dialog;
    }

    private void showStyleMenu(int option) {
        switch (option) {
            case 0 -> showSizes();
            case 1 -> showColours();
            case 2 -> showSlider(false);
            case 3 -> showPositions();
            default -> showFonts();
        }
    }

    private void showSizes() {
        showChoices(labels("small", "medium", "large", "extra_large"), style.size, which -> {
            style.size = which;
            finishStyleChoice();
        });
    }

    private void showPositions() {
        showChoices(labels("bottom", "middle", "top", "custom"), style.position, which -> {
            style.position = which;
            if (which == OfflineSubtitleStyle.CUSTOM) {
                applyStyle();
                showSlider(true);
            } else {
                finishStyleChoice();
            }
        });
    }

    private void showFonts() {
        String[] names = labels("font_default", "font_medium", "font_condensed", "font_serif",
                "font_monospace", "font_casual", "font_cursive");
        AlertDialog dialog = OfflineUi.showChoices(activity, str("revanced_offline_subtitles_font"), names,
                style.font, Color.WHITE, which -> {
                    style.font = which;
                    finishStyleChoice();
                }, (label, index) -> label.setTypeface(FONTS[index]));
        dialog.setOnCancelListener(ignored -> resumeHide.run());
        activeDialog = dialog;
    }

    private void showColours() {
        String[] names = labels("white", "yellow", "cyan", "green", "custom", "custom");
        names[4] = str("revanced_offline_subtitles_custom_colour", OfflineSubtitleStyle.colourHex(style.customColour));
        AlertDialog dialog = OfflineUi.showChoices(activity, str("revanced_offline_subtitles_colour"), names,
                style.colour, Color.WHITE, which -> {
                    if (which <= OfflineSubtitleStyle.CUSTOM_COLOUR) {
                        style.colour = which;
                        finishStyleChoice();
                    } else {
                        activeDialog = ColorPickerPreference.showRgbPicker(activity,
                                str("revanced_offline_subtitles_custom_colour_title"),
                                style.customColour, Color.WHITE, colour -> {
                                    style.customColour = colour;
                                    style.colour = OfflineSubtitleStyle.CUSTOM_COLOUR;
                                    applyStyle();
                                    saveStyle();
                                }, resumeHide);
                    }
                }, (label, index) -> {
                    if (index > OfflineSubtitleStyle.CUSTOM_COLOUR) return;
                    GradientDrawable swatch = new GradientDrawable();
                    swatch.setShape(GradientDrawable.OVAL);
                    swatch.setColor(index < COLOURS.length ? COLOURS[index] : style.customColour);
                    swatch.setStroke(Utils.dipToPixels(1), Color.GRAY);
                    int size = Utils.dipToPixels(20);
                    swatch.setBounds(0, 0, size, size);
                    label.setCompoundDrawables(swatch, null, null, null);
                    label.setCompoundDrawablePadding(Utils.dipToPixels(12));
                });
        dialog.setOnCancelListener(ignored -> resumeHide.run());
        activeDialog = dialog;
    }

    private void showChoices(String[] labels, int selected, IntConsumer onChosen) {
        AlertDialog dialog = OfflineUi.showChoices(activity, null, labels, selected, Color.WHITE, onChosen);
        dialog.setOnCancelListener(ignored -> resumeHide.run());
        activeDialog = dialog;
    }

    private static String[] labels(String... keys) {
        String[] labels = new String[keys.length];
        for (int index = 0; index < keys.length; index++) {
            labels[index] = str("revanced_offline_subtitles_" + keys[index]);
        }
        return labels;
    }

    private void finishStyleChoice() {
        applyStyle();
        saveStyle();
        resumeHide.run();
    }

    private void showSlider(boolean position) {
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = Utils.dipToPixels(12);
        content.setPadding(padding, padding / 2, padding, padding / 2);
        GradientDrawable panel = new GradientDrawable();
        panel.setColor(0xFF282828);
        panel.setCornerRadius(Utils.dipToPixels(8));
        content.setBackground(panel);
        TextView title = new TextView(activity);
        title.setTextColor(Color.WHITE);
        title.setTextSize(14);
        content.addView(title);
        String heading = str(position ? "revanced_offline_subtitles_vertical_position"
                : "revanced_offline_subtitles_background");
        int initial = position ? style.verticalPercent : style.opacity;
        title.setText(str("revanced_offline_subtitles_percentage", heading, initial));

        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        SeekBar slider = new SeekBar(activity);
        slider.setMax(position ? 100 : 20);
        slider.setProgress(position ? initial : initial / 5);
        slider.setContentDescription(heading);
        row.addView(slider, new LinearLayout.LayoutParams(0, Utils.dipToPixels(48), 1f));
        Button done = new Button(activity);
        done.setText(str("revanced_offline_subtitles_done"));
        done.setOnClickListener(ignored -> dialog.dismiss());
        row.addView(done);
        content.addView(row);
        dialog.setContentView(content);
        dialog.setCanceledOnTouchOutside(false);
        dialog.setOnDismissListener(ignored -> {
            previewDialog = null;
            adjustingSlider = false;
            render();
            saveStyle();
            resumeHide.run();
        });
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int percent = position ? progress : progress * 5;
                if (position) style.verticalPercent = percent;
                else style.opacity = percent;
                title.setText(str("revanced_offline_subtitles_percentage", heading, percent));
                applyStyle();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
                adjustingSlider = true;
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                adjustingSlider = false;
                saveStyle();
                positionPreviewPanel();
            }
        });
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.addFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL);
            window.setDimAmount(0f);
        }
        previewDialog = dialog;
        activeDialog = dialog;
        render();
        dialog.show();
        positionPreviewPanel();
    }

    private void positionPreviewPanel() {
        if (previewDialog == null || adjustingSlider) return;
        Window window = previewDialog.getWindow();
        if (window == null) return;
        boolean above = text.getY() + text.getHeight() / 2 >= root.getHeight() / 2;
        window.setGravity(Gravity.CENTER_HORIZONTAL | (above ? Gravity.TOP : Gravity.BOTTOM));
        WindowManager.LayoutParams params = window.getAttributes();
        params.y = Utils.dipToPixels(8);
        window.setAttributes(params);
        window.setLayout(Math.min(Utils.dipToPixels(480), root.getWidth() - Utils.dipToPixels(24)),
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private void applyStyle() {
        text.setTextSize(OfflineSubtitleStyle.sizeSp(style.size));
        text.setTypeface(FONTS[style.font]);
        text.setTextColor(style.colour == OfflineSubtitleStyle.CUSTOM_COLOUR
                ? style.customColour : COLOURS[style.colour]);
        backdrop.setColor(OfflineSubtitleStyle.opacityAlpha(style.opacity) << 24);
        text.setBackground(style.opacity == 0 ? null : backdrop);
        int horizontal = OfflineSubtitleStyle.horizontalPadding(text.getTextSize());
        int vertical = OfflineSubtitleStyle.verticalPadding(text.getTextSize());
        text.setPadding(horizontal, vertical, horizontal, vertical);
        updatePlacement();
    }

    private void updatePlacement() {
        int width = root.getWidth();
        int height = root.getHeight();
        if (width <= 0 || height <= 0) return;
        int left = Math.max(0, videoArea.getLeft());
        int right = Math.min(width, videoArea.getRight());
        int top = Math.max(0, videoArea.getTop());
        int bottom = Math.min(height, videoArea.getBottom());
        if (right <= left || bottom <= top) {
            left = top = 0;
            right = width;
            bottom = height;
        }
        if (areaWidth != right - left || areaHeight != bottom - top) {
            areaWidth = right - left;
            areaHeight = bottom - top;
            text.setMaxWidth(OfflineSubtitleStyle.maxWidth(areaWidth));
            text.setMaxHeight(areaHeight);
        }
        boolean custom = style.position == OfflineSubtitleStyle.CUSTOM;
        int gravity = Gravity.CENTER_HORIZONTAL | (custom ? Gravity.TOP : POSITIONS[style.position]);
        int topMargin = custom ? top : Utils.dipToPixels(80);
        int bottomMargin = custom ? height - bottom : Utils.dipToPixels(72);
        int sideMargin = custom ? 0 : Utils.dipToPixels(16);
        if (textParams.gravity != gravity || textParams.topMargin != topMargin
                || textParams.bottomMargin != bottomMargin || textParams.leftMargin != sideMargin) {
            textParams.gravity = gravity;
            textParams.setMargins(sideMargin, topMargin, sideMargin, bottomMargin);
            text.setLayoutParams(textParams);
        }
        text.setTranslationY(custom
                ? OfflineSubtitleStyle.verticalOffset(areaHeight, text.getHeight(), style.verticalPercent) : 0);
        positionPreviewPanel();
    }

    private void saveStyle() {
        Settings.OFFLINE_SUBTITLES_STYLE.save(style.encode());
    }

    /** Shrink a wrapped text block to its longest actual line, not the maximum wrapping width. */
    private static final class CaptionTextView extends TextView {
        CaptionTextView(Activity activity) {
            super(activity);
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            super.onMeasure(widthSpec, heightSpec);
            Layout layout = getLayout();
            if (layout == null) return;
            float widest = 0;
            for (int line = 0; line < layout.getLineCount(); line++) {
                widest = Math.max(widest, layout.getLineMax(line));
            }
            int fitted = OfflineSubtitleStyle.boxWidth(widest, getPaddingLeft(), getMeasuredWidth());
            if (fitted > 0 && fitted < getMeasuredWidth()) {
                super.onMeasure(MeasureSpec.makeMeasureSpec(fitted, MeasureSpec.EXACTLY), heightSpec);
            }
        }
    }
}
