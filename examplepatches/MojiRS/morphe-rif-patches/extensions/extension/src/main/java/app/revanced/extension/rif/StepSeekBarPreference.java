package app.revanced.extension.rif;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.SeekBar;

import androidx.preference.SeekBarPreference;

/**
 * A SeekBarPreference whose dragged value snaps to its seekBarIncrement. Stock androidx
 * applies the increment only to arrow keys, so a drag moves in steps of 1.
 *
 * Used by name from the ReVanced preference XML. The snapping itself is a hook in
 * SeekBarPreference's SeekBar listener that calls {@link #snap} with the listener's
 * preference; it only acts on this class, so any other slider behaves as stock.
 */
public class StepSeekBarPreference extends SeekBarPreference {

    public StepSeekBarPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    /**
     * Called at the start of SeekBarPreference's onProgressChanged. For a drag on one of
     * ours, moves the SeekBar to the nearest step (the preference applies its
     * seekBarIncrement as the key increment) and returns that; else returns [progress].
     */
    public static int snap(Object preference, SeekBar seekBar, int progress, boolean fromUser) {
        try {
            if (!fromUser || !(preference instanceof StepSeekBarPreference)) return progress;
            int step = seekBar.getKeyProgressIncrement();
            if (step <= 1) return progress;
            int snapped = Math.min(seekBar.getMax(), Math.round(progress / (float) step) * step);
            if (snapped != progress) seekBar.setProgress(snapped);
            return snapped;
        } catch (Throwable t) {
            return progress;
        }
    }
}
