package app.southstar21.extension.instagram.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.southstar21.extension.instagram.ads.HideAdsPatch;
import app.southstar21.extension.instagram.liquidglass.LiquidGlassNavBarPatch;
import app.southstar21.extension.instagram.navbuttons.HideNavigationButtonsPatch;
import app.southstar21.extension.instagram.profilepicture.ViewProfilePicturePatch;
import app.southstar21.extension.instagram.reels.DisableReelsPatch;

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
                LiquidGlassNavBarPatch.SETTINGS,
                HideNavigationButtonsPatch.SETTINGS,
                DisableReelsPatch.SETTINGS,
                HideAdsPatch.SETTINGS,
                ViewProfilePicturePatch.SETTINGS
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

    /**
     * Some hooks run before the main activity has focus (e.g. while Instagram builds its tab
     * list), so this loads the preferences from the application if init() hasn't run yet.
     */
    static SharedPreferences preferencesOrNull() {
        if (preferences == null) {
            try {
                Context app = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                if (app != null) init(app);
            } catch (Throwable ignored) {
                // Falls back to the defaults.
            }
        }
        return preferences;
    }
}
