package ajstrick81.morphe.extension.hbomax.speed;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;

/**
 * The on-screen speed control, designed for a TV remote rather than touch.
 *
 * It is a single focusable chip in the top-right corner showing the current
 * speed (e.g. "1.5×"). The user reaches it with the D-pad and presses OK/ENTER
 * (or DPAD_CENTER) to cycle to the next speed; the change is applied to every
 * live player and persisted. Being one focusable View keeps focus handling
 * trivial and — because it never calls requestFocus() — it does not steal focus
 * from HBO's own player controls; the user only lands on it if they navigate to
 * it deliberately.
 *
 * This is the deliberately-minimal TV sketch of the phone patch's touch panel.
 * A multi-button row with full D-pad traversal is a later enhancement once the
 * focus behaviour has been validated on a real remote.
 */
@SuppressLint("ViewConstructor")
final class HboSpeedPanel extends Button {
    /** Keep a normal-speed entry so the user can always get back to 1×. */
    private static final float[] SPEEDS = {0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f};

    HboSpeedPanel(Context context) {
        super(context);

        setFocusable(true);
        setFocusableInTouchMode(false);
        setAllCaps(false);
        setTextColor(Color.WHITE);
        setBackgroundColor(Color.argb(0xB0, 0x20, 0x20, 0x20));
        setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        int padH = dp(16);
        int padV = dp(8);
        setPadding(padH, padV, padH, padV);
        render();

        setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                cycle();
            }
        });
    }

    FrameLayout.LayoutParams buildLayoutParams() {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.TOP | Gravity.END;
        int margin = dp(24);
        params.topMargin = margin;
        params.rightMargin = margin;
        return params;
    }

    private void cycle() {
        try {
            float current = Prefs.speed();
            int index = 0;
            for (int i = 0; i < SPEEDS.length; i++) {
                if (Math.abs(SPEEDS[i] - current) < 0.001f) {
                    index = i;
                    break;
                }
            }
            float next = SPEEDS[(index + 1) % SPEEDS.length];

            Prefs.speed(next);
            int dispatched = PlayerBridge.setSpeed(next);
            render();
            Logger.i("Speed chip -> " + next + "x (dispatched to " + dispatched + " player(s))");
        } catch (Throwable t) {
            Logger.e("Speed cycle failed", t);
        }
    }

    private void render() {
        setText(label(Prefs.speed()));
    }

    private static String label(float speed) {
        String number = (speed == (long) speed)
                ? String.valueOf((long) speed)
                : String.valueOf(speed);
        return number + "×"; // e.g. "1.25×"
    }

    private int dp(int value) {
        float density = getResources().getDisplayMetrics().density;
        return Math.round(value * density);
    }
}
