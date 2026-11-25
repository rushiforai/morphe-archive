package dev.jason.gboardpatches.extension.rambler;

import android.os.Bundle;

/**
 * Opens Gboard's Rambler settings fragment as the Voice dictionary screen.
 *
 * <p>The Voice dictionary entry under Voice typing opens the same fragment as Rambler, so Gboard's
 * own "Clear all corrected words" confirmation keeps working. Its preference carries this extra,
 * which Gboard passes on as the fragment's arguments.
 */
public final class GboardVoiceDictionaryRuntime {
    public static final String SCREEN_EXTRA = "morphe_screen";
    public static final String VOICE_DICTIONARY = "voice_dictionary";

    private GboardVoiceDictionaryRuntime() {
    }

    /** True when the Rambler settings fragment was opened from the Voice dictionary entry. */
    public static boolean isVoiceDictionaryScreen(Bundle arguments) {
        return arguments != null && VOICE_DICTIONARY.equals(arguments.getString(SCREEN_EXTRA));
    }
}
