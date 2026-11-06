package app.wordfeudwordfinder.extension.game;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * A game as Wordfeud's API returns it, before replay: ids (game, board, ruleset), whose turn it is, whether it ended,
 * the local player's position and the game log. {@link GameReplay} turns it into a {@link GameState}.
 */
public final class RawGame {
    private final long id;
    private final int boardId;
    private final int rulesetId;
    private final int currentPlayer;
    private final int endGame;
    private final int localPosition;
    private final List<LogEvent> log;
    /** The game's {@code updated} field (server time, seconds), or {@link #UNKNOWN_UPDATED} when absent. */
    private final double updated;

    public static final double UNKNOWN_UPDATED = -1;

    public RawGame(long id, int boardId, int rulesetId, int currentPlayer, int endGame,
                   int localPosition, List<LogEvent> log) {
        this(id, boardId, rulesetId, currentPlayer, endGame, localPosition, log, UNKNOWN_UPDATED);
    }

    public RawGame(long id, int boardId, int rulesetId, int currentPlayer, int endGame,
                   int localPosition, List<LogEvent> log, double updated) {
        this.updated = updated;
        this.id = id;
        this.boardId = boardId;
        this.rulesetId = rulesetId;
        this.currentPlayer = currentPlayer;
        this.endGame = endGame;
        this.localPosition = localPosition;
        this.log = Collections.unmodifiableList(new ArrayList<>(log));
    }

    public long getId() { return id; }
    public int getBoardId() { return boardId; }
    public int getRulesetId() { return rulesetId; }
    public int getCurrentPlayer() { return currentPlayer; }
    public int getEndGame() { return endGame; }
    public int getLocalPosition() { return localPosition; }
    public List<LogEvent> getLog() { return log; }
    public double getUpdated() { return updated; }

    /**
     * Whether {@code incoming} may replace {@code stored} (same game): responses can be processed out of order (a
     * games/detail request that was in flight across a move, or a move response handled on another thread), and an
     * older snapshot must not overwrite a newer one. Compares the server's {@code updated} time when both have it
     * (equal times: the longer or equal game_log wins), otherwise only the game_log length. Equal data is accepted,
     * so a re-sent snapshot (e.g. after its ruleset arrived) still replaces the stored one.
     */
    public static boolean notOlder(RawGame stored, RawGame incoming) {
        if (stored == null) return true;
        if (incoming == null) return false;
        double a = stored.updated;
        double b = incoming.updated;
        if (a >= 0 && b >= 0 && a != b) return b > a;
        return incoming.log.size() >= stored.log.size();
    }
}
