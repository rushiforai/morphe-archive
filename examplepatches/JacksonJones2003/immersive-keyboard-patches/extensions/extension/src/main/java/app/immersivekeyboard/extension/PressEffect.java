package app.immersivekeyboard.extension;

import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Touch feedback in the style of vivo's liquid glass controls: a soft light blooms out from
 * the finger across the glass, and the keys around the finger dip into the glass and spring
 * back with a small wobble when it is released; when gliding, the dip follows the finger. The pressed key dips the most, its neighbours
 * less, and keys further away do not move at all. The toolbar row only lights up. The glass sheet itself never moves: the system draws its
 * blur separately and a frame behind, so moving the sheet made its corners glitch while typing.
 */
@SuppressWarnings("unused")
public final class PressEffect {
    private static final long FLASH_RISE_MS = 70;
    private static final long FLASH_FADE_MS = 380;
    /** Peak strength of the light on dark glass, where it shows most. */
    private static final int FLASH_PEAK_ALPHA_DARK = 30;
    private static final int FLASH_PEAK_ALPHA_LIGHT = 48;
    private static final float FLASH_RADIUS_FRACTION = 0.55f;
    /** How far the pressed key shrinks; neighbours shrink less with distance. */
    private static final float PRESS_DEPTH = 0.06f;
    /** How far the dip reaches, in widths of the key under the finger. */
    private static final float REACH_KEYS = 1.6f;
    private static final long PRESS_MS = 90;
    private static final long SPRING_MS = 420;
    /** While gliding, how far the finger moves before the dip follows, in reaches. */
    private static final float GLIDE_STEP = 0.15f;
    private static final long GLIDE_MS = 60;

    private static final String KEY_VIEW_CLASS = "SoftKeyView";

    private static final Map<View, State> STATES = new WeakHashMap<>();

    private PressEffect() {
    }

    /** Injection point. Called first thing in InputView.dispatchTouchEvent. */
    public static void onTouch(View inputView, MotionEvent event) {
        try {
            State state = STATES.get(inputView);
            if (state == null) {
                state = new State();
                STATES.put(inputView, state);
            }
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_POINTER_DOWN) {
                int index = event.getActionIndex();
                float x = event.getX(index);
                float y = event.getY(index);
                state.flash(inputView, x, y);
                state.press(inputView, event.getPointerId(index), x, y);
            } else if (action == MotionEvent.ACTION_MOVE) {
                for (int index = 0; index < event.getPointerCount(); index++) {
                    state.move(event.getPointerId(index), event.getX(index), event.getY(index));
                }
            } else if (action == MotionEvent.ACTION_POINTER_UP) {
                state.release(event.getPointerId(event.getActionIndex()));
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                state.releaseAll();
            }
        } catch (Throwable ignored) {
            // Feedback must never get in the way of typing.
        }
    }

    /**
     * Injection point. Called from InputView.dispatchDraw once the keyboard has drawn. The glass
     * blur clears anything painted beneath it, so the light is laid over the finished keyboard.
     */
    public static void draw(View inputView, Canvas canvas) {
        try {
            State state = STATES.get(inputView);
            if (state != null) {
                state.drawFlash(inputView, canvas);
            }
        } catch (Throwable ignored) {
            // Never block drawing.
        }
    }

    private static final class State {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path sheet = new Path();
        private float flashX;
        private float flashY;
        private long flashStart = -1;
        /** What each finger on the keyboard is pressing. */
        private final Map<Integer, Touch> pressed = new HashMap<>();

        void flash(View view, float x, float y) {
            flashX = x;
            flashY = y;
            flashStart = SystemClock.uptimeMillis();
            view.invalidate();
        }

        void drawFlash(View view, Canvas canvas) {
            if (flashStart < 0) {
                return;
            }
            long elapsed = SystemClock.uptimeMillis() - flashStart;
            float strength;
            if (elapsed < FLASH_RISE_MS) {
                strength = elapsed / (float) FLASH_RISE_MS;
            } else if (elapsed < FLASH_RISE_MS + FLASH_FADE_MS) {
                float fade = 1f - (elapsed - FLASH_RISE_MS) / (float) FLASH_FADE_MS;
                strength = fade * fade;
            } else {
                flashStart = -1;
                return;
            }
            // The light spreads outward a little as it fades.
            float spread = 0.75f + 0.25f * Math.min(1f, elapsed / (float) (FLASH_RISE_MS + FLASH_FADE_MS));
            float radius = Math.max(1f, view.getWidth() * FLASH_RADIUS_FRACTION * spread);
            boolean dark = (view.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            int alpha = Math.round(
                    (dark ? FLASH_PEAK_ALPHA_DARK : FLASH_PEAK_ALPHA_LIGHT) * strength);
            paint.setShader(new RadialGradient(flashX, flashY, radius,
                    new int[]{Color.argb(alpha, 255, 255, 255),
                            Color.argb(alpha / 3, 255, 255, 255), Color.TRANSPARENT},
                    new float[]{0f, 0.45f, 1f}, Shader.TileMode.CLAMP));
            // Only light the glass itself, never the cleared corners or the space above it.
            int save = canvas.save();
            if (BottomBarOpacity.glassSheet(view, sheet)) {
                canvas.clipPath(sheet);
            }
            canvas.drawRect(0, 0, view.getWidth(), view.getHeight(), paint);
            canvas.restoreToCount(save);
            paint.setShader(null);
            view.postInvalidateOnAnimation();
        }

        void press(View inputView, int pointer, float x, float y) {
            release(pointer);
            List<View> keys = new ArrayList<>();
            collectKeys(inputView, keys);
            if (keys.isEmpty()) {
                return;
            }
            int[] origin = new int[2];
            int[] location = new int[2];
            inputView.getLocationInWindow(origin);
            // Size the dip by the key under the finger, so it covers the same few keys on the
            // folded screen and on the split layout when the phone is open.
            float keyWidth = 0;
            float nearest = Float.MAX_VALUE;
            float[][] bounds = new float[keys.size()][];
            for (int index = 0; index < keys.size(); index++) {
                View key = keys.get(index);
                key.getLocationInWindow(location);
                float left = location[0] - origin[0];
                float top = location[1] - origin[1];
                float centreX = left + key.getWidth() / 2f;
                float centreY = top + key.getHeight() / 2f;
                bounds[index] = new float[]{left, top, centreX, centreY};
                float distance = (float) Math.hypot(centreX - x, centreY - y);
                if (distance < nearest) {
                    nearest = distance;
                    keyWidth = Math.min(key.getWidth(), key.getHeight() * 1.5f);
                }
            }
            Touch touch = new Touch(keys, bounds, Math.max(1f, keyWidth * REACH_KEYS));
            pressed.put(pointer, touch);
            dip(touch, x, y, PRESS_MS);
        }

        /** Follows a finger gliding across the keys, as in glide typing. */
        void move(int pointer, float x, float y) {
            Touch touch = pressed.get(pointer);
            if (touch != null && Math.hypot(x - touch.x, y - touch.y)
                    >= touch.reach * GLIDE_STEP) {
                dip(touch, x, y, GLIDE_MS);
            }
        }

        /** Dips the keys around (x, y) and lets the ones the finger has left spring back. */
        private void dip(Touch touch, float x, float y, long duration) {
            touch.x = x;
            touch.y = y;
            List<View> held = new ArrayList<>();
            for (int index = 0; index < touch.keys.size(); index++) {
                float[] key = touch.bounds[index];
                float distance = (float) Math.hypot(key[2] - x, key[3] - y);
                if (distance >= touch.reach) {
                    continue;
                }
                float falloff = 0.5f + 0.5f * (float) Math.cos(Math.PI * distance / touch.reach);
                View view = touch.keys.get(index);
                // Pivot on the finger, so the keys around it lean slightly in toward it.
                view.setPivotX(x - key[0]);
                view.setPivotY(y - key[1]);
                float target = 1f - PRESS_DEPTH * falloff;
                view.animate().cancel();
                view.animate().scaleX(target).scaleY(target)
                        .setDuration(duration).setInterpolator(null).start();
                held.add(view);
            }
            for (View view : touch.held) {
                if (!held.contains(view)) {
                    springBack(view);
                }
            }
            touch.held = held;
        }

        void release(int pointer) {
            Touch touch = pressed.remove(pointer);
            if (touch == null) {
                return;
            }
            for (View key : touch.held) {
                springBack(key);
            }
        }

        private static void springBack(View key) {
            key.animate().cancel();
            key.animate().scaleX(1f).scaleY(1f)
                    .setDuration(SPRING_MS).setInterpolator(SPRING).start();
        }

        void releaseAll() {
            for (Integer pointer : new ArrayList<>(pressed.keySet())) {
                release(pointer);
            }
        }

        /**
         * Every key on screen, each Gboard key being its own SoftKeyView, except the toolbar
         * row at the top, which stays still and only lights up.
         */
        private static void collectKeys(View view, List<View> out) {
            if (view.getVisibility() != View.VISIBLE) {
                return;
            }
            Object tag = view.getTag();
            if (tag instanceof String
                    && ((String) tag).contains(BottomBarOpacity.HEADER_AREA_TAG)) {
                return;
            }
            if (view.getClass().getName().endsWith(KEY_VIEW_CLASS)) {
                if (view.getWidth() > 0 && view.getHeight() > 0) {
                    out.add(view);
                }
                return;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    collectKeys(group.getChildAt(index), out);
                }
            }
        }
    }

    /** One finger on the keyboard: the keys it can reach and the ones it is dipping. */
    private static final class Touch {
        final List<View> keys;
        /** Left, top, centre x and centre y of each key, relative to the InputView. */
        final float[][] bounds;
        final float reach;
        List<View> held = new ArrayList<>();
        float x;
        float y;

        Touch(List<View> keys, float[][] bounds, float reach) {
            this.keys = keys;
            this.bounds = bounds;
            this.reach = reach;
        }
    }

    /** A lightly damped spring: overshoots once or twice, then settles. */
    private static final Interpolator SPRING = t ->
            (float) (1 - Math.exp(-8.5 * t) * Math.cos(13 * t));
}
