package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.inputmethodservice.Keyboard;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.app.AlertDialog;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;

/** Tap-driven light bloom and per-key spring animation for Helakuru Lite. */
public final class HelakuruLiteGlassPressExtension {
    private static final String PAGE = "morphe_glass_press_page";
    private static final String ENABLED = "morphe_glass_press_enabled";
    private static final String KEY_DIP = "morphe_glass_press_key_dip";
    private static final String GLOW_STRENGTH = "morphe_glass_press_glow_strength";
    private static final String GLOW_SIZE = "morphe_glass_press_glow_size";
    private static final String GLOW_DURATION = "morphe_glass_press_glow_duration";
    private static final int DEFAULT_GLOW_DURATION_MS = 450;
    private static final long DIP_IN_MS = 70L;
    private static final long SPRING_OUT_MS = 380L;
    private static final float KEY_DIP_AMOUNT = 0.045f;
    private static final Map<View, PressState> STATES = new WeakHashMap<>();
    private static final Map<View, Boolean> ATTACHED = new WeakHashMap<>();
    private static final Map<Canvas, View> CANVAS_VIEWS = new WeakHashMap<>();

    private HelakuruLiteGlassPressExtension() { }

    public static void bindSettings(Object activityObject) {
        if (!(activityObject instanceof PreferenceActivity)) return;
        PreferenceActivity activity = (PreferenceActivity) activityObject;
        try {
            Preference found = activity.findPreference(PAGE);
            if (!(found instanceof PreferenceScreen)) return;
            PreferenceScreen page = (PreferenceScreen) found;
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(activity);
            Preference enabled = page.findPreference(ENABLED);
            Preference dip = page.findPreference(KEY_DIP);
            Preference strength = page.findPreference(GLOW_STRENGTH);
            Preference size = page.findPreference(GLOW_SIZE);
            Preference duration = page.findPreference(GLOW_DURATION);
            if (enabled == null || dip == null || strength == null || size == null || duration == null) return;

            bindSwitch(enabled, preferences, ENABLED, false);
            bindSwitch(dip, preferences, KEY_DIP, false);
            boolean effectEnabled = preferences.getBoolean(ENABLED, false);
            dip.setEnabled(effectEnabled);
            strength.setEnabled(effectEnabled);
            size.setEnabled(effectEnabled);
            duration.setEnabled(effectEnabled);
            updateSliderSummary(strength, preferences.getInt(GLOW_STRENGTH, 35), "%");
            updateSliderSummary(size, preferences.getInt(GLOW_SIZE, 100), "%");
            updateSliderSummary(duration, preferences.getInt(GLOW_DURATION, DEFAULT_GLOW_DURATION_MS), " ms");
            strength.setOnPreferenceClickListener(preference -> {
                showSlider(activity, "Glow strength", "%", 0, 100,
                        preferences.getInt(GLOW_STRENGTH, 35), value -> {
                            preferences.edit().putInt(GLOW_STRENGTH, value).apply();
                            updateSliderSummary(strength, value, "%");
                        });
                return true;
            });
            size.setOnPreferenceClickListener(preference -> {
                showSlider(activity, "Glow size", "%", 50, 150,
                        preferences.getInt(GLOW_SIZE, 100), value -> {
                            preferences.edit().putInt(GLOW_SIZE, value).apply();
                            updateSliderSummary(size, value, "%");
                        });
                return true;
            });
            duration.setOnPreferenceClickListener(preference -> {
                showSlider(activity, "Glow fade duration", " ms", 100, 1000, 50,
                        preferences.getInt(GLOW_DURATION, DEFAULT_GLOW_DURATION_MS), value -> {
                            preferences.edit().putInt(GLOW_DURATION, value).apply();
                            updateSliderSummary(duration, value, " ms");
                        });
                return true;
            });
            enabled.setOnPreferenceChangeListener((preference, value) -> {
                boolean isEnabled = Boolean.TRUE.equals(value);
                preferences.edit().putBoolean(ENABLED, isEnabled).apply();
                dip.setEnabled(isEnabled);
                strength.setEnabled(isEnabled);
                size.setEnabled(isEnabled);
                duration.setEnabled(isEnabled);
                return true;
            });
            HelakuruLiteSettingsExtension.applySettingsWindow(activity);
        } catch (Throwable ignored) {
            // Keep Lite settings usable if its preference hierarchy changes.
        }
    }

    private static void bindSwitch(Preference preference, SharedPreferences preferences,
                                   String key, boolean defaultValue) {
        if (!(preference instanceof android.preference.SwitchPreference)) return;
        android.preference.SwitchPreference toggle = (android.preference.SwitchPreference) preference;
        toggle.setPersistent(false);
        toggle.setChecked(preferences.getBoolean(key, defaultValue));
        toggle.setOnPreferenceChangeListener((changed, value) -> {
            preferences.edit().putBoolean(key, Boolean.TRUE.equals(value)).apply();
            return true;
        });
    }

    /** Installs a passive observer; returning false leaves Lite's key handling intact. */
    public static void attachTouchObserver(Object serviceObject) {
        View keyboard = findKeyboardView(serviceObject);
        if (keyboard == null) return;
        synchronized (ATTACHED) {
            if (ATTACHED.containsKey(keyboard)) return;
            ATTACHED.put(keyboard, Boolean.TRUE);
        }
        HelakuruLiteTouchObserverExtension.addObserver(keyboard, "glass-press",
                HelakuruLiteGlassPressExtension::observeTap);
    }

    private static void observeTap(View view, MotionEvent event) {
        if (!isEnabled(view.getContext())) return;
        PressState state = stateFor(view);
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            synchronized (state) {
                state.downX = event.getX();
                state.downY = event.getY();
                state.downTime = event.getEventTime();
                state.x = event.getX();
                state.y = event.getY();
                state.startedAt = event.getEventTime();
                state.releasedAt = -1L;
                state.moved = false;
                state.pressed = true;
                state.active = true;
            }
            view.invalidate();
        } else if (action == MotionEvent.ACTION_MOVE) {
            synchronized (state) {
                float dx = event.getX() - state.downX;
                float dy = event.getY() - state.downY;
                float slop = 18f * view.getResources().getDisplayMetrics().density;
                if (dx * dx + dy * dy > slop * slop) {
                    state.moved = true;
                    state.pressed = false;
                    state.active = false;
                }
            }
            view.invalidate();
        } else if (action == MotionEvent.ACTION_UP) {
            synchronized (state) {
                long held = event.getEventTime() - state.downTime;
                if (!state.moved && held <= 500L) {
                    state.pressed = false;
                    state.releasedAt = event.getEventTime();
                } else {
                    state.active = false;
                    state.pressed = false;
                }
            }
            view.invalidate();
        } else if (action == MotionEvent.ACTION_CANCEL) {
            synchronized (state) {
                state.moved = true;
                state.pressed = false;
                state.active = false;
            }
            view.invalidate();
        }
    }

    public static void drawKeyBackground(GradientDrawable drawable, Canvas canvas,
                                         Object viewObject, Keyboard.Key key) {
        if (!(viewObject instanceof View)) {
            drawable.draw(canvas);
            return;
        }
        View view = (View) viewObject;
        rememberCanvasView(canvas, view);
        int save = canvas.save();
        applyKeyTransform(canvas, view, key);
        drawable.draw(canvas);
        canvas.restoreToCount(save);
    }

    public static void drawFrostedKeyBackground(GradientDrawable drawable, Canvas canvas,
                                                Object viewObject, Keyboard.Key key) {
        if (!(viewObject instanceof View)) {
            HelakuruLiteSettingsExtension.drawKeyBackground(drawable, canvas, viewObject, key);
            return;
        }
        View view = (View) viewObject;
        rememberCanvasView(canvas, view);
        int save = canvas.save();
        applyKeyTransform(canvas, view, key);
        HelakuruLiteSettingsExtension.drawKeyBackground(drawable, canvas, viewObject, key);
        canvas.restoreToCount(save);
    }

    public static void drawKeyIcon(Drawable drawable, Canvas canvas, Object viewObject,
                                   Keyboard.Key key) {
        if (!(viewObject instanceof View)) {
            drawable.draw(canvas);
            return;
        }
        View view = (View) viewObject;
        rememberCanvasView(canvas, view);
        int save = canvas.save();
        applyKeyTransform(canvas, view, key);
        drawable.draw(canvas);
        canvas.restoreToCount(save);
    }

    public static void drawKeyLabel(Canvas canvas, String label, Keyboard.Key key,
                                    float baseline, Paint paint) {
        drawLabel(canvas, label, key, baseline, paint);
    }

    public static void drawFrostedKeyLabel(Canvas canvas, String label, Keyboard.Key key,
                                           float baseline, Paint paint) {
        drawLabel(canvas, label, key, baseline, paint);
    }

    private static void drawLabel(Canvas canvas, String label, Keyboard.Key key,
                                  float baseline, Paint paint) {
        View view = canvasView(canvas);
        int save = canvas.save();
        if (view != null) applyKeyTransform(canvas, view, key);
        HelakuruLiteSettingsExtension.drawKeyLabel(view, canvas, label, key, baseline, paint);
        canvas.restoreToCount(save);
    }

    /** Draws after Lite's key pass so the radial highlight sits over the full key area. */
    public static void drawBloom(Object viewObject, Canvas canvas) {
        if (!(viewObject instanceof View)) return;
        View view = (View) viewObject;
        if (!isEnabled(view.getContext())) return;
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(view.getContext());
        long animationMs = Math.max(100, Math.min(1000,
                preferences.getInt(GLOW_DURATION, DEFAULT_GLOW_DURATION_MS)));
        PressState state = stateFor(view);
        float x;
        float y;
        long pressElapsed;
        long releaseElapsed;
        boolean pressed;
        synchronized (state) {
            if (!state.active) return;
            long now = android.os.SystemClock.uptimeMillis();
            pressed = state.pressed;
            pressElapsed = now - state.startedAt;
            releaseElapsed = state.releasedAt < 0L ? 0L : now - state.releasedAt;
            if (!pressed && releaseElapsed >= animationMs) {
                state.active = false;
                return;
            }
            x = state.x;
            y = state.y;
        }

        float t;
        float fade;
        float radius;
        float strength = clamp01(preferences.getInt(GLOW_STRENGTH, 35) / 100f);
        float size = Math.max(0.5f, Math.min(1.5f,
                preferences.getInt(GLOW_SIZE, 100) / 100f));
        if (strength <= 0f) return;
        if (pressed) {
            t = clamp01(pressElapsed / 180f);
            fade = 0.78f;
            radius = view.getResources().getDisplayMetrics().density * (26f + 78f * t) * size;
        } else {
            t = clamp01(releaseElapsed / (float) animationMs);
            fade = (float) Math.pow(1f - t, 1.6);
            radius = view.getResources().getDisplayMetrics().density * (104f + 34f * t) * size;
        }
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setShader(new RadialGradient(x, y, radius,
                new int[]{withStrength(0x52FFFFFF, strength),
                        withStrength(0x22FFFFFF, strength), 0x00FFFFFF},
                new float[]{0f, 0.48f, 1f}, Shader.TileMode.CLAMP));
        paint.setAlpha(Math.round(215f * fade));
        canvas.drawCircle(x, y, radius, paint);
        if ((pressed && pressElapsed < 180L) || (!pressed && releaseElapsed < animationMs)) {
            view.postInvalidateOnAnimation();
        }
    }

    private static int withStrength(int color, float strength) {
        int alpha = Math.round(((color >>> 24) & 0xff) * strength);
        return (color & 0x00ffffff) | (alpha << 24);
    }

    private static void updateSliderSummary(Preference preference, int value, String suffix) {
        preference.setSummary(value + suffix);
    }

    private static void showSlider(Context context, String title, String suffix, int min, int max,
                                   int current, ValueChanged callback) {
        showSlider(context, title, suffix, min, max, 1, current, callback);
    }

    private static void showSlider(Context context, String title, String suffix, int min, int max,
                                   int step, int current, ValueChanged callback) {
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(24 * context.getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding / 2, padding, 0);

        TextView valueLabel = new TextView(context);
        int safeStep = Math.max(1, step);
        int selectedValue = min + ((Math.max(min, Math.min(max, current)) - min + safeStep / 2) / safeStep) * safeStep;
        valueLabel.setText(selectedValue + suffix);
        layout.addView(valueLabel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        SeekBar seekBar = new SeekBar(context);
        seekBar.setMax((max - min) / safeStep);
        seekBar.setProgress((selectedValue - min) / safeStep);
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                valueLabel.setText((progress * safeStep + min) + suffix);
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) { }
        });
        layout.addView(seekBar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(layout)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Save", (dialogInterface, which) ->
                        callback.changed(seekBar.getProgress() * safeStep + min))
                .create();
        dialog.setOnShowListener(ignored -> HelakuruLiteSettingsExtension.applyDialogInsets(dialog));
        dialog.show();
    }

    private interface ValueChanged { void changed(int value); }

    private static void applyKeyTransform(Canvas canvas, View view, Keyboard.Key key) {
        if (key == null || !isEnabled(view.getContext()) || !isKeyDipEnabled(view.getContext())) return;
        PressState state = stateFor(view);
        float x;
        float y;
        long started;
        long released;
        boolean pressed;
        synchronized (state) {
            if (!state.active) return;
            x = state.x;
            y = state.y;
            started = state.startedAt;
            released = state.releasedAt;
            pressed = state.pressed;
        }
        long now = android.os.SystemClock.uptimeMillis();
        long elapsed = now - started;
        long releaseElapsed = released < 0L ? 0L : now - released;
        if (pressed) {
            if (elapsed >= DIP_IN_MS) return;
        } else if (releaseElapsed >= SPRING_OUT_MS) {
            return;
        }

        float centerX = key.x + key.width / 2f;
        float centerY = key.y + key.height / 2f;
        float dx = centerX - x;
        float dy = centerY - y;
        float distance = (float) Math.sqrt(dx * dx + dy * dy);
        float radius = Math.max(key.width, key.height) * 2.15f;
        float influence = Math.max(0f, 1f - distance / radius);
        if (influence <= 0f) return;

        float scale;
        if (pressed) {
            float amount = clamp01(elapsed / (float) DIP_IN_MS);
            scale = 1f - KEY_DIP_AMOUNT * influence * amount;
            view.postInvalidateOnAnimation();
        } else {
            float t = releaseElapsed / (float) SPRING_OUT_MS;
            float rebound = (float) (Math.exp(-7d * t) * Math.cos(21d * t));
            scale = 1f - KEY_DIP_AMOUNT * influence * rebound;
            view.postInvalidateOnAnimation();
        }
        canvas.scale(scale, scale, centerX, centerY);
    }

    private static boolean isEnabled(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(ENABLED, false);
    }

    private static boolean isKeyDipEnabled(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(KEY_DIP, false);
    }

    private static PressState stateFor(View view) {
        synchronized (STATES) {
            PressState state = STATES.get(view);
            if (state == null) {
                state = new PressState();
                STATES.put(view, state);
            }
            return state;
        }
    }

    private static void rememberCanvasView(Canvas canvas, View view) {
        synchronized (CANVAS_VIEWS) { CANVAS_VIEWS.put(canvas, view); }
    }

    private static View canvasView(Canvas canvas) {
        synchronized (CANVAS_VIEWS) { return CANVAS_VIEWS.get(canvas); }
    }

    private static View findKeyboardView(Object serviceObject) {
        if (serviceObject == null) return null;
        Class<?> type = serviceObject.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField("keyboardView");
                field.setAccessible(true);
                Object value = field.get(serviceObject);
                return value instanceof View ? (View) value : null;
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static float clamp01(float value) { return Math.max(0f, Math.min(1f, value)); }

    private static final class PressState {
        float downX;
        float downY;
        float x;
        float y;
        long downTime;
        long startedAt;
        long releasedAt = -1L;
        boolean moved;
        boolean pressed;
        boolean active;
    }
}
