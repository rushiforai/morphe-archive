/*
 * Copyright (C) 2026 anddea
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 * - Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-24.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 * https://github.com/MorpheApp/morphe-patches/pull/2282
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.utils;

import static android.view.ViewGroup.LayoutParams.MATCH_PARENT;
import static android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
import static app.morphe.extension.shared.utils.StringRef.str;
import static app.morphe.extension.shared.utils.Utils.dipToPixels;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.widget.Button;
import android.widget.GridLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.function.DoubleSupplier;

import app.morphe.extension.youtube.patches.video.PlaybackSpeedValues;

/** Shared watch/local speed views. Only the caller knows how to apply or persist a rate. */
public final class PlaybackSpeedControls {
    public interface Selection {
        void choose(float rate);
    }

    private PlaybackSpeedControls() {
    }

    public static void addCenteredHeader(LinearLayout layout, TextView currentSpeed) {
        currentSpeed.setTextColor(ThemeUtils.getAppForegroundColor());
        currentSpeed.setTextSize(16);
        currentSpeed.setTypeface(Typeface.DEFAULT_BOLD);
        currentSpeed.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(MATCH_PARENT, WRAP_CONTENT);
        params.setMargins(0, dipToPixels(20), 0, dipToPixels(12));
        layout.addView(currentSpeed, params);
    }

    public static Runnable addTo(LinearLayout layout, TextView currentSpeed, float[] presets,
                                 DoubleSupplier current, Selection select, boolean liveSlider) {
        Context context = layout.getContext();
        int foreground = ThemeUtils.getAppForegroundColor();
        int firstStep = Math.max(1, PlaybackSpeedValues.speedToStep(presets[0]));
        int lastStep = Math.max(firstStep, PlaybackSpeedValues.speedToStep(presets[presets.length - 1]));
        int spacing = dipToPixels(8);

        LinearLayout sliderRow = new LinearLayout(context);
        sliderRow.setGravity(Gravity.CENTER_VERTICAL);
        Button minus = VideoUtils.createStyledButton(context, false, spacing, spacing);
        Button plus = VideoUtils.createStyledButton(context, true, spacing, spacing);
        minus.setContentDescription("−");
        plus.setContentDescription("+");
        SpeedSlider slider = new SpeedSlider(context);
        slider.setContentDescription(str("revanced_preference_category_playback_speed"));
        slider.getProgressDrawable().setColorFilter(foreground, PorterDuff.Mode.SRC_IN);
        slider.getThumb().setColorFilter(foreground, PorterDuff.Mode.SRC_IN);
        sliderRow.addView(minus);
        sliderRow.addView(slider, new LinearLayout.LayoutParams(0, WRAP_CONTENT, 1f));
        sliderRow.addView(plus);
        layout.addView(sliderRow);

        Button[] buttons = addPresets(layout, presets, foreground);
        Runnable refresh = () -> {
            float rate = (float) current.getAsDouble();
            int step = PlaybackSpeedValues.speedToStep(rate);
            slider.setMax(Math.max(lastStep, step) - firstStep);
            slider.setProgress(step - firstStep);
            showSelected(currentSpeed, presets, buttons, rate);
        };

        Selection choose = rate -> {
            select.choose(rate);
            refresh.run();
        };
        minus.setOnClickListener(v -> choose.choose(PlaybackSpeedValues.adjust((float) current.getAsDouble(), -1)));
        plus.setOnClickListener(v -> choose.choose(PlaybackSpeedValues.adjust((float) current.getAsDouble(), 1)));
        for (int index = 0; index < presets.length; index++) {
            float rate = presets[index];
            buttons[index].setOnClickListener(v -> choose.choose(rate));
        }
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            private boolean dragging;
            private boolean changed;

            @Override
            public void onStartTrackingTouch(SeekBar bar) {
                dragging = true;
                changed = false;
            }

            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (!fromUser) return;

                float rate = PlaybackSpeedValues.stepToSpeed(firstStep + progress);
                if (liveSlider || !dragging) {
                    choose.choose(rate);
                } else {
                    changed = true;
                    showSelected(currentSpeed, presets, buttons, rate);
                }
            }

            @Override
            public void onStopTrackingTouch(SeekBar bar) {
                dragging = false;
                if (!liveSlider && changed && !slider.cancelled) {
                    choose.choose(PlaybackSpeedValues.stepToSpeed(firstStep + bar.getProgress()));
                } else {
                    refresh.run();
                }
            }
        });
        refresh.run();
        return refresh;
    }

    private static void showSelected(TextView text, float[] presets, Button[] buttons, float rate) {
        text.setText(VideoUtils.formatSpeedStringX(rate, 2));
        for (int index = 0; index < presets.length; index++) {
            buttons[index].setSelected(presets[index] == rate);
        }
    }

    private static Button[] addPresets(LinearLayout layout, float[] presets, int foreground) {
        Context context = layout.getContext();
        GridLayout grid = new GridLayout(context);
        grid.setColumnCount(5);
        grid.setAlignmentMode(GridLayout.ALIGN_BOUNDS);
        grid.setRowCount((presets.length + 4) / 5);
        int margin = dipToPixels(4);
        int rowMargin = dipToPixels(12);
        LinearLayout.LayoutParams gridParams = new LinearLayout.LayoutParams(MATCH_PARENT, WRAP_CONTENT);
        gridParams.setMargins(margin, rowMargin, margin, rowMargin);
        layout.addView(grid, gridParams);

        Button[] buttons = new Button[presets.length];
        int background = ThemeUtils.getAdjustedBackgroundColor(false);
        for (int index = 0; index < presets.length; index++) {
            float rate = presets[index];
            Button button = new Button(context, null, 0);
            String label = VideoUtils.formatSpeed(rate, 1);
            button.setText(rate == 1f ? label + '\n' + str("revanced_playback_speed_normal") : label);
            button.setTextColor(foreground);
            button.setTextSize(12);
            button.setAllCaps(false);
            button.setGravity(Gravity.CENTER);

            GradientDrawable selected = presetBackground(background);
            selected.setStroke(dipToPixels(2), foreground);
            StateListDrawable states = new StateListDrawable();
            states.addState(new int[]{android.R.attr.state_selected}, selected);
            states.addState(new int[0], presetBackground(background));
            button.setBackground(states);

            GridLayout.LayoutParams params = new GridLayout.LayoutParams();
            params.width = 0;
            params.height = dipToPixels(44);
            params.columnSpec = GridLayout.spec(GridLayout.UNDEFINED, 1, 1f);
            params.setMargins(margin, margin, margin, margin);
            grid.addView(button, params);
            buttons[index] = button;
        }
        return buttons;
    }

    private static GradientDrawable presetBackground(int color) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(color);
        background.setCornerRadius(dipToPixels(20));
        return background;
    }

    @SuppressLint("ClickableViewAccessibility")
    private static final class SpeedSlider extends SeekBar {
        private boolean cancelled;

        SpeedSlider(Context context) {
            super(context);
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            cancelled = event.getActionMasked() == MotionEvent.ACTION_CANCEL;
            return super.onTouchEvent(event);
        }
    }
}
