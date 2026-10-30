/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.share;

import java.util.List;

import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Reflect;
import app.pixkk.extension.core.Settings;

/**
 * Puts the "Add to favorites" button into the share menu's bottom row, in the place the settings
 * name.
 *
 * TikTok has the button, and adds it to the row only for the accounts a server flag turns it on
 * for. The code that adds it checks that flag first, so {@link #wanted()} lets it through. The
 * button is then put where the sorting of the row leaves it, and {@link #arrange} moves it to its
 * place once the row is made. Where it goes is counted from the left, from 1; a place past the last
 * button puts it last.
 */
public final class ShareFavorite {
    private static final String KEY = "favorite";

    private ShareFavorite() {
    }

    /** Whether the favorites button is to be in the share menu. */
    public static boolean wanted() {
        return Settings.SHARE_FAVORITE_POSITION.get() > 0;
    }

    /**
     * Called when a share menu's model is made.
     *
     * @param panel the model, which holds the bottom row's buttons as a list
     */
    public static void arrange(Object panel) {
        int position = Settings.SHARE_FAVORITE_POSITION.get();
        if (position <= 0) return;
        try {
            Object actions = Reflect.readField(panel, "LJFF");
            if (!(actions instanceof List)) return;
            @SuppressWarnings("unchecked")
            List<Object> row = (List<Object>) actions;
            int at = -1;
            for (int i = 0; i < row.size(); i++) {
                if (KEY.equals(Reflect.invoke(row.get(i), "key"))) {
                    at = i;
                    break;
                }
            }
            if (at < 0) return;
            Object button = row.remove(at);
            row.add(Math.min(position - 1, row.size()), button);
        } catch (Exception ex) {
            Logger.printException(() -> "Could not place the favorites button", ex);
        }
    }
}
