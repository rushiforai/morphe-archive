package app.southstar21.extension.instagram.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.southstar21.extension.instagram.liquidglass.LiquidGlassNavBarPatch;

/** Registry and storage of every patch's settings. */
public final class Settings {
    private static final String PREFERENCES = "southstar21_patches";
    private static SharedPreferences preferences;

    private Settings() {
    }

    /**
     * Every patch with settings, in menu order. Add new patches here.
     * A method rather than a field so patch classes load only when the menu needs them.
     */
    private static List<PatchSettings> all() {
        return Arrays.asList(
                LiquidGlassNavBarPatch.SETTINGS
        );
    }

    /** Patches that were selected in Morphe Manager when patching. */
    public static List<PatchSettings> includedPatches() {
        List<PatchSettings> included = new ArrayList<>();
        for (PatchSettings patch : all()) {
            if (patch.isIncluded()) included.add(patch);
        }
        return included;
    }

    public static void init(Context context) {
        if (preferences == null) {
            preferences = context.getApplicationContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        }
    }

    static SharedPreferences preferences() {
        if (preferences == null) throw new IllegalStateException("Settings.init() not called");
        return preferences;
    }

    static SharedPreferences preferencesOrNull() {
        return preferences;
    }
}
