package app.morphe.extension.syncforreddit.ui.gestures;

import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.util.Locale;

/**
 * What a gesture says while it is being made: the time being seeked to, the volume being set, or
 * that the video was paused. Drawn over the video in the middle, and gone as soon as the finger
 * is lifted.
 *
 * <p>Built rather than inflated, so that the patch introduces no layout of its own.
 */
final class VideoGestureOverlay {
    private static final int BACKGROUND = 0xB3000000;

    /**
     * One step of volume.
     *
     * <p>Every cell is this same character, and the ones not reached yet are dimmed rather than
     * drawn as a different one. Two characters are two shapes, which a font is free to draw at
     * different widths and heights, and a device that has one of them and not the other draws
     * the row half in boxes. The same character can only be the same size as itself.
     */
    private static final char CELL = '\u25A0';

    /** How much of a cell is left showing where the volume has not reached it. */
    private static final int NOT_REACHED = 0x59FFFFFF;

    /**
     * As many cells as the device has steps of volume, which is usually about fifteen, up to
     * what still reads as a row rather than a wall.
     */
    private static final int MOST_CELLS = 20;

    /** Left a little see through, so that the video is not lost behind what is said about it. */
    private static final float OPACITY = 0.8f;
    private static final long FLASH_MS = 550;

    private final FrameLayout over;
    private final Handler onTheMainThread = new Handler(Looper.getMainLooper());
    private TextView saying;

    VideoGestureOverlay(FrameLayout over) {
        this.over = over;
    }

    void show(CharSequence what) {
        TextView view = view();
        if (view == null) {
            return;
        }
        onTheMainThread.removeCallbacksAndMessages(null);
        view.setText(what);
        view.setVisibility(View.VISIBLE);
    }

    /** Shown for a moment rather than until a finger is lifted, for a gesture already finished. */
    void flash(CharSequence what) {
        show(what);
        onTheMainThread.postDelayed(this::hide, FLASH_MS);
    }

    void hide() {
        if (saying != null) {
            saying.setVisibility(View.GONE);
        }
    }

    String describeSeek(int to, int duration, int by, float precision, String named) {
        String scale = precision == 1f
                ? "" : String.format(Locale.US, "\n%s  (%s)", times(precision), named);
        return String.format(Locale.US, "%s / %s\n%s%s%s",
                clock(to), clock(duration), by < 0 ? "−" : "+", clock(Math.abs(by)), scale);
    }

    /**
     * The volume as a row of cells rather than a number, so that how loud it is can be seen at a
     * glance while the finger is still moving, said above so that it is clear what is moving.
     */
    CharSequence describeVolume(int level, int steps) {
        int cells = Math.max(1, Math.min(MOST_CELLS, steps));
        int filled = Math.round(level * (float) cells / Math.max(steps, 1));

        StringBuilder row = new StringBuilder("Volume\n");
        int from = row.length();
        for (int cell = 0; cell < cells; cell++) {
            row.append(CELL);
        }

        SpannableString said = new SpannableString(row);
        if (filled < cells) {
            said.setSpan(new ForegroundColorSpan(NOT_REACHED), from + filled, said.length(),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return said;
    }

    /** How much of the video a drag is covering, said as people say it rather than as a decimal. */
    private static String times(float precision) {
        if (precision >= 1f) {
            return String.format(Locale.US, "%d× speed", Math.round(precision));
        }
        return String.format(Locale.US, "1/%d speed", Math.round(1f / precision));
    }

    String describePaused(boolean paused) {
        return paused ? "Paused" : "Playing";
    }

    private static String clock(int milliseconds) {
        int seconds = Math.max(0, milliseconds) / 1000;
        int minutes = seconds / 60;
        int hours = minutes / 60;
        return hours > 0
                ? String.format(Locale.US, "%d:%02d:%02d", hours, minutes % 60, seconds % 60)
                : String.format(Locale.US, "%d:%02d", minutes, seconds % 60);
    }

    private TextView view() {
        if (saying != null) {
            return saying;
        }
        try {
            TextView built = new TextView(over.getContext());
            built.setTextColor(Color.WHITE);
            built.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            built.setGravity(Gravity.CENTER);
            int padding = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 12,
                    over.getResources().getDisplayMetrics());
            built.setPadding(padding, padding, padding, padding);

            GradientDrawable behind = new GradientDrawable();
            behind.setColor(BACKGROUND);
            behind.setCornerRadius(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 8,
                    over.getResources().getDisplayMetrics()));
            built.setBackground(behind);

            FrameLayout.LayoutParams where = new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT);
            where.gravity = Gravity.CENTER;
            built.setLayoutParams(where);
            built.setAlpha(OPACITY);
            built.setVisibility(View.GONE);
            // Not something to be touched: it sits over the video the gestures are made on.
            built.setClickable(false);
            built.setFocusable(false);

            over.addView(built);
            saying = built;
            return built;
        } catch (Exception ex) {
            return null;
        }
    }
}
