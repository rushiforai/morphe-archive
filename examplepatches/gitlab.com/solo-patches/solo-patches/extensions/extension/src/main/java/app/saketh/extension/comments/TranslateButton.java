package app.saketh.extension.comments;

import android.app.AlertDialog;
import android.content.Context;
import app.saketh.extension.controls.PatchSettings;
import java.util.Arrays;

/** Where the Translate button of comments, reviews and replies goes, saved in Patch controls. */
public final class TranslateButton {
    static final String BESIDE_LIKE = "beside_like";
    static final String MORE_SHEET = "more_sheet";
    static final String LONG_PRESS = "long_press";
    private static final String KEY = "translate_place";
    private static final String[] PLACES = {BESIDE_LIKE, MORE_SHEET, LONG_PRESS};
    private static final String[] NAMES = {"Beside Like", "In the ⋯ menu", "In the long-press menu (paragraph comments only)"};

    private TranslateButton() {}

    static boolean at(String place) {
        return place.equals(PatchSettings.preferences().getString(KEY, BESIDE_LIKE));
    }

    /** Name of the saved place, for example "Beside Like". */
    public static String label() {
        int index = Arrays.asList(PLACES).indexOf(PatchSettings.preferences().getString(KEY, BESIDE_LIKE));
        return NAMES[Math.max(index, 0)];
    }

    /** Shows the places, saves the choice, then runs {@code chosen}. */
    public static void choose(Context context, Runnable chosen) {
        int current = Math.max(Arrays.asList(PLACES).indexOf(PatchSettings.preferences().getString(KEY, BESIDE_LIKE)), 0);
        new AlertDialog.Builder(context).setTitle("Translate button")
                .setSingleChoiceItems(NAMES, current, (dialog, which) -> {
                    PatchSettings.preferences().edit().putString(KEY, PLACES[which]).apply();
                    dialog.dismiss();
                    chosen.run();
                }).setNegativeButton("Cancel", null).show();
    }
}
