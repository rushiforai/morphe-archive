package app.wordfeudwordfinder.extension.solver;

import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.words.WordGraph;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/** Test access to the package-private generator (with blanks allowed). */
public final class MovePipelineAccess {
    private MovePipelineAccess() {}

    public static List<Move> generate(char[][] board, List<String> rack, BoardLayout layout, Ruleset rs, WordGraph g) {
        return MoveGenerator.generate(board, rack, layout, rs, g, new AtomicBoolean(false), true);
    }
}
