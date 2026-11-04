package app.wordfeudwordfinder.extension.ui;

import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.solver.Rules;
import app.wordfeudwordfinder.extension.ui.Strings.Key;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Pure (no android.*) formatting helpers for the overlay views, unit-tested on the JVM.
 *
 * Bonus labels come from {@link Strings} (keys BONUS_DL..BONUS_TW). The solver's codes in
 * {@link Move#bonuses} ("DL", "TL", "DW", "TW") are mapped to those labels, never shown as-is.
 */
public final class OverlayFormat {
    private OverlayFormat() {}

    /** Index = BoardLayout square code; also the solver's bonus code at that index. */
    private static final String[] SOLVER_CODE = {null, "DL", "TL", "DW", "TW"};
    private static final Key[] BONUS_KEY = {null, Key.BONUS_DL, Key.BONUS_TL, Key.BONUS_DW, Key.BONUS_TW};
    private static final String SEP = " · ";

    /**
     * Short label (from {@link Strings}) for a {@code BoardLayout} square code (0 none, 1 DL, 2 TL, 3 DW, 4 TW);
     * null for none/unknown.
     */
    public static String bonusLabel(String lang, int code) {
        return code > 0 && code < BONUS_KEY.length ? Strings.get(lang, BONUS_KEY[code]) : null;
    }

    /** As {@link #bonusLabel(String, int)} in the fallback language (English). */
    public static String bonusLabel(int code) {
        return bonusLabel("en", code);
    }

    /** Square code (1..4) for a solver bonus code such as "TW"; 0 if unknown. */
    static int codeForSolverBonus(String solverCode) {
        for (int i = 1; i < SOLVER_CODE.length; i++) if (SOLVER_CODE[i].equals(solverCode)) return i;
        return 0;
    }

    /**
     * True when a board character is a blank: lower case and not itself a letter of the ruleset
     * (same rule as the move generator).
     */
    public static boolean isBlank(Ruleset rs, char c) {
        if (c == '\0' || !Character.isLowerCase(c)) return false;
        return rs == null || !rs.getTilePoints().containsKey(String.valueOf(c));
    }

    /** Point value of a tile; 0 for a blank, an unknown letter, an empty square or no ruleset. */
    public static int letterPoints(Ruleset rs, char c) {
        if (c == '\0' || rs == null || isBlank(rs, c)) return 0;
        Integer v = rs.getTilePoints().get(String.valueOf(c));
        return v == null ? 0 : v;
    }

    /** Letter as shown on a tile (blanks show their letter in upper case); "" for an empty square. */
    public static String displayLetter(char c) {
        if (c == '\0') return "";
        return String.valueOf(c).toUpperCase(Locale.ROOT);
    }

    /**
     * Distinct bonus types of a move's new tiles ("TW:A" etc.), in order of first appearance, as
     * {@link Strings} labels, space separated. Unknown solver codes are skipped.
     */
    public static String bonusSummary(String lang, Move m) {
        if (m == null) return "";
        List<String> seen = new ArrayList<>();
        for (String b : m.bonuses) {
            if (b == null) continue;
            int i = b.indexOf(':');
            String label = bonusLabel(lang, codeForSolverBonus(i < 0 ? b : b.substring(0, i)));
            if (label != null && !seen.contains(label)) seen.add(label);
        }
        return String.join(" ", seen);
    }

    /** As {@link #bonusSummary(String, Move)} in the fallback language (English). */
    public static String bonusSummary(Move m) {
        return bonusSummary("en", m);
    }

    /** Rack tiles a move uses, as shown in the USES text: letters in upper case, a blank as "?". */
    public static String usesText(Move m) {
        StringBuilder sb = new StringBuilder();
        for (String l : m.placedLetters) {
            if (sb.length() > 0) sb.append(' ');
            boolean blank = !l.isEmpty() && Character.isLowerCase(l.charAt(0));
            sb.append(blank ? "?" : l.toUpperCase(Locale.ROOT));
        }
        return sb.toString();
    }

    /** Second line of a list row / the info line: direction, rack tiles used and bonus summary. */
    public static String detail(String lang, Move m) {
        StringBuilder sb = new StringBuilder();
        sb.append(Strings.get(lang, m.horizontal ? Key.DIR_ACROSS : Key.DIR_DOWN));
        sb.append(SEP).append(String.format(Locale.ROOT, Strings.get(lang, Key.USES), usesText(m)));
        String b = bonusSummary(lang, m);
        if (!b.isEmpty()) sb.append(SEP).append(b);
        return sb.toString();
    }

    /**
     * The message after a REJECTED result: "Move rejected: A, B" for words that were rejected, "Move rejected: one
     * of A, B, C" ({@code oneOf}) when the server did not say which word of the move was wrong, or just "Move
     * rejected" when there are no words.
     */
    public static String rejectionText(String lang, List<String> words, boolean oneOf) {
        if (words == null || words.isEmpty()) return Strings.get(lang, Key.REJECTED);
        return String.format(Locale.ROOT, Strings.get(lang, oneOf ? Key.REJECTED_ONE_OF : Key.REJECTED_WORDS),
                String.join(", ", words));
    }

    /** Score with its unit, e.g. "12 pts". */
    public static String scoreText(String lang, int score) {
        return String.format(Locale.ROOT, Strings.get(lang, Key.PTS), score);
    }

    /**
     * Which rack positions the move uses (to dim them). Each placed letter takes exactly one rack tile:
     * a matching letter first; a blank (lower-case placed letter) or an unmatched letter takes a blank.
     */
    public static boolean[] usedRackIndices(List<String> rack, Move m) {
        if (rack == null) return new boolean[0];
        boolean[] used = new boolean[rack.size()];
        if (m == null) return used;
        for (String l : m.placedLetters) {
            if (l == null || l.isEmpty()) continue;
            boolean blank = Character.isLowerCase(l.charAt(0));
            int idx = -1;
            if (!blank) idx = find(rack, used, l, false);
            if (idx < 0) idx = find(rack, used, null, true);
            if (idx >= 0) used[idx] = true;
        }
        return used;
    }

    private static int find(List<String> rack, boolean[] used, String letter, boolean blank) {
        for (int i = 0; i < rack.size(); i++) {
            if (used[i]) continue;
            String t = rack.get(i);
            if (t == null) continue;
            if (blank ? Rules.isBlank(t) : t.equals(letter)) return i;
        }
        return -1;
    }
}
