// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.comments;

import static app.morphe.extension.shared.StringRef.str;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.preference.Preference;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * <p>
 * "Comments to load": how many comments a post requests from Reddit when it opens, from Reddit's default (200)
 * to its maximum (500). A number box and a slider, kept in sync.
 */
@SuppressWarnings({"unused", "deprecation"})
public class CommentLimitPreference extends Preference {
    public static final int MIN = 200;
    public static final int MAX = 500;

    public CommentLimitPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public CommentLimitPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public CommentLimitPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public CommentLimitPreference(Context context) {
        super(context);
        init();
    }

    /** The setting, within Reddit's limits. */
    public static int limit() {
        return clamp(Settings.COMMENT_LIMIT.get());
    }

    private static int clamp(int value) {
        return Math.max(MIN, Math.min(MAX, value));
    }

    private void init() {
        // Made in code, with no XML to name it: without a title, its row showed only its summary.
        setTitle(str("revanced_baconreader_comment_limit_title"));
        updateSummary();
        setOnPreferenceClickListener(preference -> {
            showDialog();
            return true;
        });
    }

    private void updateSummary() {
        setSummary(str("revanced_baconreader_comment_limit_summary", limit()));
    }

    private void showDialog() {
        try {
            Context context = getContext();
            final EditText number = new EditText(context);
            number.setInputType(InputType.TYPE_CLASS_NUMBER);
            number.setText(String.valueOf(limit()));
            number.setSelection(number.getText().length());

            final SeekBar slider = new SeekBar(context);
            slider.setMax(MAX - MIN);
            slider.setProgress(limit() - MIN);

            // Each one follows the other; the number box only moves the slider with a value in range.
            final boolean[] updating = {false};
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override
                public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                    if (updating[0] || !fromUser) return;
                    updating[0] = true;
                    number.setText(String.valueOf(MIN + progress));
                    number.setSelection(number.getText().length());
                    updating[0] = false;
                }

                @Override
                public void onStartTrackingTouch(SeekBar seekBar) {
                }

                @Override
                public void onStopTrackingTouch(SeekBar seekBar) {
                }
            });
            number.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                }

                @Override
                public void afterTextChanged(Editable s) {
                    if (updating[0]) return;
                    Integer value = parse(s.toString());
                    if (value == null || value < MIN || value > MAX) return;
                    updating[0] = true;
                    slider.setProgress(value - MIN);
                    updating[0] = false;
                }
            });

            // The number box with the slider right below it.
            int padding = Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 8,
                    context.getResources().getDisplayMetrics()));
            LinearLayout layout = new LinearLayout(context);
            layout.setOrientation(LinearLayout.VERTICAL);
            layout.setPadding(padding * 3, padding, padding * 3, 0);
            layout.addView(number, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = padding;
            params.bottomMargin = padding;
            layout.addView(slider, params);

            final AlertDialog dialog = new AlertDialog.Builder(context)
                    .setTitle(getTitle() != null ? getTitle().toString() : "")
                    .setView(layout)
                    .setPositiveButton(android.R.string.ok, (d, which) -> {
                        // Out of range or empty: the nearest allowed value.
                        Integer value = parse(number.getText().toString());
                        int limit = value == null ? slider.getProgress() + MIN : clamp(value);
                        Settings.COMMENT_LIMIT.save(limit);
                        updateSummary();
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .setNeutralButton(str("revanced_baconreader_comment_limit_reset"), null)
                    .create();
            // Reset keeps the dialog open.
            dialog.setOnShowListener(d -> dialog.getButton(DialogInterface.BUTTON_NEUTRAL).setOnClickListener(v -> {
                updating[0] = true;
                number.setText(String.valueOf(Settings.COMMENT_LIMIT.defaultValue));
                number.setSelection(number.getText().length());
                slider.setProgress(clamp(Settings.COMMENT_LIMIT.defaultValue) - MIN);
                updating[0] = false;
            }));

            dialog.show();
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the comment limit", ex);
        }
    }

    private static Integer parse(String text) {
        try {
            return Integer.parseInt(text.trim());
        } catch (NumberFormatException ex) {
            return null;
        }
    }
}
