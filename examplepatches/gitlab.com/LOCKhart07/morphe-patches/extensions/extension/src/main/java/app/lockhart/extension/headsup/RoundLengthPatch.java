/*
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.lockhart.extension.headsup;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.Log;
import android.util.TypedValue;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Locale;

/**
 * Round length picker for Heads Up!.
 * <p>
 * The game is Unity IL2CPP, so the round length is set in native code. libmorphe_headsup.so
 * hooks GameplayManager.Init and overwrites the round length with the value pushed here through
 * {@link #nativeSetRoundLength(int)}. It also hooks the deck page (DeckDetailsPopup) and calls
 * {@link #onDeckPageVisibilityChanged(boolean)}, which shows a chip that opens the picker.
 */
@SuppressWarnings("unused")
public final class RoundLengthPatch {
    private static final String TAG = "MorpheHeadsUp";
    private static final String NATIVE_LIBRARY = "morphe_headsup";

    private static final String PREFERENCES = "morphe_headsup";
    private static final String KEY_ROUND_LENGTH = "round_length_seconds";

    /** 0 means "use the game's own round length". */
    private static final int GAME_DEFAULT = 0;
    private static final int[] PRESET_SECONDS = {30, 45, 60, 90, 120, 180};
    private static final int MIN_SECONDS = 5;
    private static final int MAX_SECONDS = 600;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static SharedPreferences preferences;
    private static boolean nativeLoaded;
    private static TextView chip;

    private RoundLengthPatch() {
    }

    /**
     * Injection point: start of MainActivity.onCreate, before Unity loads libil2cpp.so.
     */
    public static void onCreate(Activity activity) {
        activityRef = new WeakReference<>(activity);
        chip = null;
        preferences = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);

        if (nativeLoaded) return;
        try {
            System.loadLibrary(NATIVE_LIBRARY);
            nativeLoaded = true;
            nativeSetRoundLength(getRoundLength());
        } catch (Throwable ex) {
            Log.e(TAG, "Failed to load the native bridge", ex);
        }
    }

    private static native void nativeSetRoundLength(int seconds);

    /**
     * Called from native code on the Unity thread when the deck page opens or closes.
     */
    public static void onDeckPageVisibilityChanged(boolean visible) {
        mainHandler.post(() -> {
            try {
                setChipVisible(visible);
            } catch (Exception ex) {
                Log.e(TAG, "Failed to update the round length chip", ex);
            }
        });
    }

    private static int getRoundLength() {
        return preferences == null ? GAME_DEFAULT : preferences.getInt(KEY_ROUND_LENGTH, GAME_DEFAULT);
    }

    private static void setRoundLength(int seconds) {
        preferences.edit().putInt(KEY_ROUND_LENGTH, seconds).apply();
        if (nativeLoaded) nativeSetRoundLength(seconds);
        if (chip != null) chip.setText(chipText(seconds));
    }

    // region Chip

    private static void setChipVisible(boolean visible) {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing()) return;

        if (chip == null) {
            if (!visible) return;
            chip = createChip(activity);
        }

        chip.animate().cancel();
        if (visible) {
            chip.setText(chipText(getRoundLength()));
            chip.setAlpha(0f);
            chip.setVisibility(View.VISIBLE);
            chip.animate().alpha(1f).setDuration(200).start();
        } else {
            chip.setVisibility(View.GONE);
        }
    }

    private static TextView createChip(Activity activity) {
        TextView view = new TextView(activity);
        view.setTextColor(Color.WHITE);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        view.setGravity(Gravity.CENTER);
        int horizontal = dp(activity, 18);
        int vertical = dp(activity, 10);
        view.setPadding(horizontal, vertical, horizontal, vertical);

        GradientDrawable background = new GradientDrawable();
        background.setColor(0xCC1B1B1F);
        background.setCornerRadius(dp(activity, 24));
        background.setStroke(dp(activity, 1), 0x66FFFFFF);
        view.setBackground(background);
        view.setElevation(dp(activity, 6));

        view.setOnClickListener(v -> showPicker());
        view.setVisibility(View.GONE);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL
        );
        params.topMargin = topInset(activity) + dp(activity, 16);
        activity.addContentView(view, params);
        return view;
    }

    private static int topInset(Activity activity) {
        WindowInsets insets = activity.getWindow().getDecorView().getRootWindowInsets();
        if (insets == null) return 0;

        int top = insets.getSystemWindowInsetTop();
        DisplayCutout cutout = insets.getDisplayCutout();
        if (cutout != null) top = Math.max(top, cutout.getSafeInsetTop());
        return top;
    }

    private static String chipText(int seconds) {
        return "⏱  Round: " + (seconds == GAME_DEFAULT ? "default" : formatDuration(seconds)) + "  ▾";
    }

    // endregion

    // region Picker

    private static void showPicker() {
        Activity activity = activityRef.get();
        if (activity == null) return;

        int current = getRoundLength();
        String[] labels = new String[PRESET_SECONDS.length + 2];
        int checked = -1;

        labels[0] = "Game default";
        if (current == GAME_DEFAULT) checked = 0;
        for (int i = 0; i < PRESET_SECONDS.length; i++) {
            labels[i + 1] = formatDuration(PRESET_SECONDS[i]);
            if (current == PRESET_SECONDS[i]) checked = i + 1;
        }
        int customIndex = labels.length - 1;
        labels[customIndex] = checked == -1 ? "Custom (" + formatDuration(current) + ")…" : "Custom…";
        if (checked == -1) checked = customIndex;

        AlertDialog dialog = new AlertDialog.Builder(activity, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle("Round length")
                .setSingleChoiceItems(labels, checked, (d, which) -> {
                    d.dismiss();
                    if (which == 0) {
                        setRoundLength(GAME_DEFAULT);
                    } else if (which == customIndex) {
                        showCustomInput(activity);
                    } else {
                        setRoundLength(PRESET_SECONDS[which - 1]);
                    }
                })
                .setNeutralButton("Reset", (d, which) -> setRoundLength(GAME_DEFAULT))
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        showImmersive(activity, dialog);
    }

    private static void showCustomInput(Activity activity) {
        EditText input = new EditText(activity);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setHint(MIN_SECONDS + "–" + MAX_SECONDS);
        int current = getRoundLength();
        if (current != GAME_DEFAULT) input.setText(String.valueOf(current));

        FrameLayout container = new FrameLayout(activity);
        int margin = dp(activity, 24);
        container.setPadding(margin, dp(activity, 8), margin, 0);
        container.addView(input);

        AlertDialog dialog = new AlertDialog.Builder(activity, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle("Round length in seconds")
                .setView(container)
                .setPositiveButton(android.R.string.ok, null)
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            int seconds;
            try {
                seconds = Integer.parseInt(input.getText().toString().trim());
            } catch (NumberFormatException ex) {
                seconds = -1;
            }
            if (seconds < MIN_SECONDS || seconds > MAX_SECONDS) {
                input.setError("Enter " + MIN_SECONDS + " to " + MAX_SECONDS + " seconds");
                return;
            }
            setRoundLength(seconds);
            dialog.dismiss();
        }));
        showImmersive(activity, dialog);
    }

    /**
     * Shows a dialog without dropping Unity's immersive fullscreen: the dialog window copies the
     * activity's system UI flags before it can take focus.
     */
    private static void showImmersive(Activity activity, AlertDialog dialog) {
        Window window = dialog.getWindow();
        if (window == null) {
            dialog.show();
            return;
        }

        window.setFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE, WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE);
        dialog.show();
        window.getDecorView().setSystemUiVisibility(activity.getWindow().getDecorView().getSystemUiVisibility());
        window.clearFlags(WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE);
    }

    // endregion

    private static String formatDuration(int seconds) {
        if (seconds < 60) return seconds + "s";
        return String.format(Locale.US, "%d:%02d", seconds / 60, seconds % 60);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
