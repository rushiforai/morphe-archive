package app.ayham.extension.music.features;

import java.util.function.ToDoubleFunction;

/**
 * What keeps the editor's controls under the finger (editor.md §6: a tap lands on the chip it went
 * down on). The sheet sits on the bottom of the screen, so a shorter sheet moves everything in it
 * down; a chip whose label shrinks moves the chips after it left. While the sheet is open its
 * height and the lines above the chips only grow (the user's own Customize toggle aside), and a
 * chip with changing labels is as wide as its widest one.
 */
final class SteadyLayout {
    private SteadyLayout() {
    }

    /** The minimum to keep after a layout of [measured]: what was reached, never less. */
    static int hold(int min, int measured) {
        return Math.max(min, measured);
    }

    /** The widest of [labels] as [width] measures them (null for none). */
    static String widest(String[] labels, ToDoubleFunction<String> width) {
        String best = null;
        double w = -1;
        for (String l : labels) {
            double x = width.applyAsDouble(l);
            if (x > w) {
                w = x;
                best = l;
            }
        }
        return best;
    }
}
