package app.morphe.extension.syncforreddit.settings;

import androidx.preference.Preference;
import androidx.preference.h;

import app.morphe.extension.shared.Logger;

/**
 * Makes a settings row that cannot be used look like it.
 *
 * <p>Sync draws its own rows, and sets the colour of the title and the line under it every time
 * it does, whatever state the row is in. A row turned off therefore stopped answering a tap and
 * greyed its switch, while its words went on looking like words that could be tapped.
 *
 * <p>Fading the whole row says it once, for every kind of row at once, and leaves the drawing of
 * each kind alone.
 *
 * @noinspection unused
 */
public final class SettingsRows {
    /** How much of a row is left showing when it cannot be used. */
    private static final float FADED = 0.4f;

    private SettingsRows() {}

    /** Called as a row is drawn, after it has drawn itself. */
    public static void drawEnabled(Preference row, h holder) {
        try {
            holder.itemView.setAlpha(row.I() ? 1f : FADED);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not fade a settings row: " + ex);
        }
    }
}
