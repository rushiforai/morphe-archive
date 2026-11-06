package app.wordfeudwordfinder.extension.core;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;

/**
 * Tiles with more than one letter. Wordfeud's Spanish set has the digraph tiles CH, LL and RR; inside the patch each
 * is one char (board cells, racks, word graph and moves are char based): Greek capitals that no Wordfeud language
 * uses and that have a lower case, which marks a blank as for every other letter (χ = blank played as CH).
 * Everything that leaves the patch (moves sent, words shown or reported) uses the spelled form again.
 */
public final class Tiles {
    private static final String[] DIGRAPHS = {"CH", "LL", "RR"};
    private static final char[] CODES = {'Χ', 'Λ', 'Ρ'}; // Χ Λ Ρ

    private Tiles() {}

    /** The internal char of a tile ("A" -> 'A', "CH" -> 'Χ', case-insensitive), or 0 when it is no tile. */
    public static char code(String tile) {
        if (tile == null || tile.isEmpty()) return 0;
        if (tile.length() == 1) return tile.charAt(0);
        String u = tile.toUpperCase(Locale.ROOT);
        for (int i = 0; i < DIGRAPHS.length; i++) if (DIGRAPHS[i].equals(u)) return CODES[i];
        return 0;
    }

    /** Whether {@code c} (either case) stands for a digraph tile. */
    public static boolean isDigraph(char c) {
        char u = Character.toUpperCase(c);
        for (char k : CODES) if (k == u) return true;
        return false;
    }

    /** The tile as Wordfeud writes it, upper case: 'Χ' or 'χ' -> "CH", 'a' -> "A". */
    public static String text(char c) {
        char u = Character.toUpperCase(c);
        for (int i = 0; i < CODES.length; i++) if (CODES[i] == u) return DIGRAPHS[i];
        return String.valueOf(u);
    }

    /** A word with digraph chars spelled out ("ΧICO" -> "CHICO"); other chars unchanged. */
    public static String spell(String w) {
        if (w == null) return null;
        StringBuilder sb = null;
        for (int i = 0; i < w.length(); i++) {
            char c = w.charAt(i);
            if (isDigraph(c)) {
                if (sb == null) sb = new StringBuilder(w.length() + 4).append(w, 0, i);
                String t = text(c);
                sb.append(Character.isLowerCase(c) ? t.toLowerCase(Locale.ROOT) : t);
            } else if (sb != null) {
                sb.append(c);
            }
        }
        return sb == null ? w : sb.toString();
    }

    public static List<String> spell(Collection<String> words) {
        List<String> out = new ArrayList<>(words.size());
        for (String w : words) out.add(spell(w));
        return out;
    }

    /**
     * Encodes an upper-case spelled word for a tile set: each digraph in {@code digraphTiles} (e.g. "CH") becomes its
     * char, left to right, as Spanish word games do (CH is always the CH tile). Without digraph tiles: unchanged.
     */
    public static String encode(String w, Collection<String> digraphTiles) {
        if (w == null || digraphTiles == null || digraphTiles.isEmpty()) return w;
        StringBuilder sb = new StringBuilder(w.length());
        int i = 0;
        outer:
        while (i < w.length()) {
            for (String d : digraphTiles) {
                if (w.startsWith(d, i)) {
                    sb.append(code(d));
                    i += d.length();
                    continue outer;
                }
            }
            sb.append(w.charAt(i++));
        }
        return sb.toString();
    }

    /** The digraph tiles among tile names (e.g. the keys of a ruleset's tile_points), upper case. */
    public static List<String> digraphsOf(Collection<String> tileNames) {
        List<String> out = new ArrayList<>();
        if (tileNames == null) return out;
        for (String t : tileNames) {
            if (t != null && t.length() > 1 && code(t) != 0) out.add(t.toUpperCase(Locale.ROOT));
        }
        return out;
    }
}
