package app.wordfeudwordfinder.extension.ui;

import app.wordfeudwordfinder.extension.game.GameState;

/** Visibility rules for the floating button (spec section 2). */
public final class OverlayVisibility {
    private OverlayVisibility() {}

    /**
     * Visible on a game route ({@code routeGameId} not null) unless the game is known to have ended. A game that is
     * not (yet) in the GameStore ({@code st == null}) shows the button too: a new game is opened before Wordfeud's
     * next games/detail poll brings its data (the overlay then says the game is loading, see GAME_LOADING).
     */
    public static boolean fabVisible(Long routeGameId, GameState st) {
        if (routeGameId == null) return false;
        if (st == null) return true;
        // Ended games hide the button even when unreadable; an unreadable running game shows it (with the error).
        return !st.ended();
    }
}
