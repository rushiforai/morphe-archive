package app.wordfeudwordfinder.extension.game;

import app.wordfeudwordfinder.extension.core.WfError;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** Replays a game_log into board and local rack (spec section 5). */
public final class GameReplay {
    private GameReplay() {}

    /** Exact field sets observed in real logs; any other field makes the game unreadable (GS-DATA). */
    private static final Set<String> START_FIELDS =
            new HashSet<>(Arrays.asList("type", "tiles", "timestamp"));
    private static final Set<String> PACKED_MOVE_FIELDS = new HashSet<>(Arrays.asList(
            "type", "player", "x", "y", "horizontal", "tiles", "new_tiles", "timestamp"));
    // V10: swap and resign shapes observed in real logs (detail_mandje.json). pass and timeout: see below.
    private static final Set<String> SWAP_FIELDS =
            new HashSet<>(Arrays.asList("type", "player", "tile_count", "tiles", "new_tiles", "timestamp"));
    private static final Set<String> RESIGN_FIELDS =
            new HashSet<>(Arrays.asList("type", "player", "timestamp"));

    public static GameState replay(RawGame g) {
        int lp = g.getLocalPosition();
        boolean ended = g.getEndGame() != 0;
        boolean myTurn = g.getCurrentPlayer() == lp && g.getEndGame() == 0;
        char[][] board = new char[GameState.SIZE][GameState.SIZE];
        List<String> rack = new ArrayList<>();
        try {
            if (lp < 0) throw WfError.gsData("no local player");
            int index = -1;
            for (LogEvent ev : g.getLog()) {
                index++;
                String type = ev.getType();
                if (type == null) throw WfError.gsData("event " + index + " without type");
                try {
                    applyEvent(ev, type, lp, board, rack);
                } catch (WfError e) {
                    if (!"GS-DATA".equals(e.code())) throw e;
                    throw WfError.gsData("event " + index + " " + type + ": " + e.getMessage());
                }
            }
        } catch (WfError e) {
            return new GameState(g.getId(), new char[GameState.SIZE][GameState.SIZE], new ArrayList<String>(),
                    myTurn, ended, e);
        }
        return new GameState(g.getId(), board, rack, myTurn, ended, null);
    }

    private static void applyEvent(LogEvent ev, String type, int lp, char[][] board, List<String> rack)
            throws WfError {
        {
            {
                switch (type) {
                    case "start":
                        checkFields(ev.getRaw(), START_FIELDS);
                        applyStart(ev.getRaw(), lp, rack);
                        break;
                    case "packed_move":
                        checkFields(ev.getRaw(), PACKED_MOVE_FIELDS);
                        applyPackedMove(ev.getRaw(), lp, board, rack);
                        break;
                    case "swap":
                        checkFields(ev.getRaw(), SWAP_FIELDS);
                        applySwap(ev.getRaw(), lp, rack);
                        break;
                    case "resign":
                        checkFields(ev.getRaw(), RESIGN_FIELDS);
                        ResponseParser.integer(ev.getRaw(), "player"); // no board or rack change
                        break;
                    case "pass":
                    case "timeout":
                        // V10 ruling (2026-11-02): the JSON shape of pass/timeout is unobserved. Neither can change the
                        // board or the rack, so only "player" (if present) must be an integer; all other fields are
                        // tolerated, since strict checks could only cause false GS-DATA.
                        if (ev.getRaw().has("player")) ResponseParser.integer(ev.getRaw(), "player");
                        break;
                    default:
                        throw WfError.gsEvent(type);
                }
            }
        }
    }

    private static void checkFields(JSONObject raw, Set<String> allowed) throws WfError {
        Iterator<String> keys = raw.keys();
        while (keys.hasNext()) {
            String k = keys.next();
            if (!allowed.contains(k)) throw WfError.gsData("unknown field " + k);
        }
    }

    private static void applyStart(JSONObject raw, int lp, List<String> rack) throws WfError {
        JSONArray tiles = ResponseParser.arr(raw, "tiles");
        Object mine = tiles.opt(lp);
        if (!(mine instanceof JSONArray)) throw WfError.gsData("start without local rack");
        rack.clear();
        rack.addAll(letters((JSONArray) mine));
    }

    private static void applyPackedMove(JSONObject raw, int lp, char[][] board, List<String> rack) throws WfError {
        int player = ResponseParser.integer(raw, "player");
        int x = ResponseParser.integer(raw, "x");
        int y = ResponseParser.integer(raw, "y");
        Object h = raw.opt("horizontal");
        if (!(h instanceof Boolean)) throw WfError.gsData("field horizontal is not a boolean: " + h);
        boolean horizontal = (Boolean) h;
        int dx = horizontal ? 1 : 0;
        int dy = horizontal ? 0 : 1;
        List<String> placed = moveTiles(ResponseParser.arr(raw, "tiles"));
        if (placed.isEmpty()) throw WfError.gsData("move without tiles");

        for (String letter : placed) {
            while (inside(x, y) && board[y][x] != '\0') { // skip occupied squares
                x += dx;
                y += dy;
            }
            if (!inside(x, y)) throw WfError.gsData("tile " + letter + " leaves the board (x=" + x + ", y=" + y + ")");
            // blank used as X: stored as lowercase (board convention: lowercase = blank, 0 points)
            board[y][x] = letter.length() == 2 ? Character.toLowerCase(letter.charAt(1)) : letter.charAt(0);
            x += dx;
            y += dy;
        }

        if (player == lp) {
            for (String letter : placed) {
                String fromRack = letter.length() == 2 ? "*" : letter; // "*X" spends a blank
                if (!rack.remove(fromRack)) throw WfError.gsData("letter " + fromRack + " not on rack " + rack);
            }
            JSONArray newTiles = ResponseParser.optArr(raw, "new_tiles");
            if (newTiles != null) rack.addAll(letters(newTiles));
        }
    }

    /**
     * Swap: only the local player's own swap changes the rack. It must reveal both the swapped and the new tiles;
     * otherwise the rack cannot be reconstructed and the game is unreadable (GS-DATA). The opponent's swap
     * (whatever it reveals) does not touch the local rack.
     */
    private static void applySwap(JSONObject raw, int lp, List<String> rack) throws WfError {
        int player = ResponseParser.integer(raw, "player");
        if (player != lp) return;
        List<String> swapped = letters(ResponseParser.arr(raw, "tiles"));
        JSONArray newTiles = ResponseParser.optArr(raw, "new_tiles");
        if (newTiles == null) throw WfError.gsData("own swap without new tiles");
        List<String> fresh = letters(newTiles);
        if (swapped.isEmpty() || fresh.size() != swapped.size()) throw WfError.gsData("swap tile count: " + swapped.size() + " swapped, " + fresh.size() + " new");
        for (String letter : swapped) {
            if (!rack.remove(letter)) throw WfError.gsData("letter " + letter + " not on rack " + rack);
        }
        rack.addAll(fresh);
    }

    private static List<String> letters(JSONArray a) throws WfError {
        List<String> out = new ArrayList<>(a.length());
        for (int i = 0; i < a.length(); i++) {
            Object v = a.opt(i);
            if (!(v instanceof String) || ((String) v).length() != 1) throw WfError.gsData("bad tile at index " + i + ": " + v);
            out.add((String) v);
        }
        return out;
    }

    /** packed_move tiles: "X" or "*X" (blank played as X); anything else is GS-DATA. */
    private static List<String> moveTiles(JSONArray a) throws WfError {
        List<String> out = new ArrayList<>(a.length());
        for (int i = 0; i < a.length(); i++) {
            Object v = a.opt(i);
            if (!(v instanceof String)) throw WfError.gsData("bad tile at index " + i + ": " + v);
            String t = (String) v;
            boolean ok = t.length() == 1 ? t.charAt(0) != '*' : t.length() == 2 && t.charAt(0) == '*' && t.charAt(1) != '*';
            if (!ok) throw WfError.gsData("bad tile at index " + i + ": " + v);
            out.add(t);
        }
        return out;
    }

    private static boolean inside(int x, int y) {
        return x >= 0 && y >= 0 && x < GameState.SIZE && y < GameState.SIZE;
    }
}
