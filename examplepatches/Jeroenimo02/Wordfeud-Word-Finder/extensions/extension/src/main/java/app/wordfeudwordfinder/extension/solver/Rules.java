package app.wordfeudwordfinder.extension.solver;

/** Game rules used by the move generator (spec section 7). */
public final class Rules {
    private Rules() {}

    /**
     * Bonus for placing seven tiles in one move (V5 confirmed 2026-11-02, Wordfeud 5.7.1: listed 36, awarded 76).
     * Only a move that places {@link #RACK_SIZE} tiles earns it, not one that empties a shorter rack at game end.
     */
    public static final int BINGO_BONUS = 40;

    /** Moves that use a blank; the move format ("*X") is confirmed (V2, 2026-11-02). */
    public static final boolean BLANKS_ENABLED = true;

    /** Centre square (x = y = CENTER) that the first move must cover. */
    public static final int CENTER = 7;

    /** Board size. */
    public static final int SIZE = 15;

    /** Tiles on a full rack; using all of them earns {@link #BINGO_BONUS}. */
    public static final int RACK_SIZE = 7;

    /** True for the rack strings that stand for a blank tile ("?" and the "*" seen in real new_tiles). */
    public static boolean isBlank(String tile) {
        return "?".equals(tile) || "*".equals(tile);
    }
}
