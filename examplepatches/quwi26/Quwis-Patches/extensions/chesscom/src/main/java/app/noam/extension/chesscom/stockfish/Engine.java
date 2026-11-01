/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.extension.chesscom.stockfish;

import android.app.ActivityManager;
import android.content.Context;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.noam.extension.chesscom.Utils;

/**
 * Stockfish as a child process spoken to over UCI. The binary ships as lib/arm64-v8a/libstockfish.so
 * so Android extracts it into the native library folder, the one place an app may run a program from.
 */
/**
 * Game Review (in the {@code gamereview} package) runs its own Engine instance rather than
 * sharing this one: the two features are independently toggleable, and a review's exclusive
 * use of the process for up to a minute would otherwise stall live analysis arrows.
 */
public class Engine {
    /** Loading the network embedded in the binary takes a few seconds on slow phones. */
    private static final int READY_TIMEOUT_MS = 30_000;
    private static final int SEARCH_TIMEOUT_MS = 60_000;
    /** Mates are scored as +/-(99 - moves) pawns so they stay ordered. */
    public static final float MATE_SCORE = 99f;
    /** Results while a search deepens are published from this depth on, at most this often. */
    private static final int PROGRESS_MIN_DEPTH = 10;
    private static final long PROGRESS_INTERVAL_MS = 300;

    public interface Progress {
        void onProgress(Result partial);
    }

    public static final class Result {
        /** First move of each line, best first, in UCI ("e2e4"). */
        public final List<String> moves;
        /** The best line's score in pawns from White's side. */
        public final float score;
        /** Moves to mate from White's side (positive: White mates), or 0. */
        public final int mate;
        public final int depth;
        /** No legal moves: checkmate or stalemate. */
        public final boolean over;
        /** The best line's full principal variation, in UCI, starting with its first move. */
        public final List<String> pv;
        /** Every requested line's score in pawns from White's side, in line order. */
        public final float[] lineScores;

        Result(List<String> moves, float score, int mate, int depth, boolean over, List<String> pv, float[] lineScores) {
            this.moves = moves;
            this.score = score;
            this.mate = mate;
            this.depth = depth;
            this.over = over;
            this.pv = pv;
            this.lineScores = lineScores;
        }

        public boolean valid() {
            return !moves.isEmpty() || over;
        }
    }

    private Process process;
    private PrintWriter stdin;
    private BufferedReader stdout;
    private volatile boolean ready;
    private int multiPv = -1;
    /** Threads, and hash in MB; 0 sizes them for the phone. */
    private final int threads, hash;

    /** Sized for the phone: half the cores and a hash from its memory. */
    public Engine() {
        this(0, 0);
    }

    public Engine(int threads, int hashMb) {
        this.threads = threads;
        this.hash = hashMb;
    }

    public boolean start(Context context) {
        File binary = new File(context.getApplicationInfo().nativeLibraryDir, "libstockfish.so");
        if (!binary.canExecute()) {
            Utils.log("Stockfish is not in " + binary.getParent());
            return false;
        }
        try {
            ProcessBuilder builder = new ProcessBuilder(binary.getAbsolutePath());
            builder.redirectErrorStream(true);
            process = builder.start();
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()), 1 << 16);
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(process.getOutputStream()), true);
            return handshake(context, reader, writer);
        } catch (IOException e) {
            Utils.logError("Stockfish did not start", e);
            return failed();
        }
    }

    /**
     * The UCI opening moves on a pipe that is already open: the phone's own process, or (NetEngine)
     * a socket to the computer. Threads and hash are sized from the phone unless a subclass says
     * otherwise.
     */
    protected boolean handshake(Context context, BufferedReader reader, PrintWriter writer) {
        stdout = reader;
        stdin = writer;
        multiPv = -1;
        try {
            send("uci");
            if (!waitFor("uciok")) return failed();
            // Threads before Hash, as Stockfish asks.
            send("setoption name Threads value " + (threads > 0 ? threads : autoThreads(context)));
            send("setoption name Hash value " + (hash > 0 ? hash : autoHashMb(context)));
            send("isready");
            if (!waitFor("readyok")) return failed();
            ready = true;
            return true;
        } catch (IOException e) {
            Utils.logError("Stockfish did not answer UCI", e);
            return failed();
        }
    }

    public boolean ready() {
        if (!ready) return false;
        if (!alive()) {
            ready = false;
            return false;
        }
        return true;
    }

    /** Whether the far end is still there: the process is running, or the socket is open. */
    protected boolean alive() {
        Process current = process;
        if (current == null) return false;
        try {
            current.exitValue();
            return false;
        } catch (IllegalThreadStateException running) {
            return true;
        }
    }

    public Result analyse(String fen, int depth, int lines, Progress progress) {
        return search("position fen " + fen, !fen.contains(" b "), depth, 0, lines, progress);
    }

    /**
     * Analyses one position of a game review, with the full move history so Stockfish sees
     * repetitions and the 50-move rule. Falls back to the bare FEN when the history is unknown
     * or does not apply ({@code history} null or empty).
     */
    public Result analyseGame(String startFen, List<String> history, String positionFen, int depth, long nodes,
                              int lines) {
        String position = history != null && !history.isEmpty()
            ? "position fen " + startFen + " moves " + String.join(" ", history)
            : "position fen " + positionFen;
        return search(position, !positionFen.contains(" b "), depth, nodes, lines, null);
    }

    /** Clears the transposition table between reviewed games. */
    public void newGame() {
        send("ucinewgame");
    }

    /** Searches to the depth and until the node budget is spent, each only when above 0. */
    private Result search(String position, boolean whiteToMove, int depth, long nodes, int lines, Progress progress) {
        if (!ready()) return empty();
        try {
            while (stdout.ready()) {
                if (stdout.readLine() == null) break;
            }
            if (lines != multiPv) {
                send("setoption name MultiPV value " + lines);
                multiPv = lines;
            }
            send(position);
            send("go" + (depth > 0 ? " depth " + depth : "") + (nodes > 0 ? " nodes " + nodes : ""));
            return readSearch(lines, whiteToMove, depth, progress);
        } catch (IOException e) {
            ready = false;
            return empty();
        }
    }

    /** Ends the running search early; its best result so far is still returned. */
    public void stopSearch() {
        send("stop");
    }

    public void quit() {
        ready = false;
        try {
            send("quit");
        } catch (Throwable ignored) {
            // Gone already.
        }
        Process current = process;
        process = null;
        if (current != null) current.destroy();
        closeTransport();
    }

    /** Hangs up the pipe, when it is not a process the JVM can destroy (NetEngine's socket). */
    protected void closeTransport() {}

    private Result readSearch(int lines, boolean whiteToMove, int targetDepth, Progress progress) throws IOException {
        String[] firstMoves = new String[lines];
        float[] scores = new float[lines];
        boolean[] exact = new boolean[lines];
        @SuppressWarnings("unchecked")
        List<String>[] pvs = new List[lines];
        int mate = 0, reached = 0, reported = 0;
        boolean over = false, stopSent = false;
        String bestmove = null;
        long deadline = System.currentTimeMillis() + SEARCH_TIMEOUT_MS, lastReport = 0;

        while (true) {
            if (System.currentTimeMillis() > deadline) {
                if (stopSent) {
                    quit();
                    break;
                }
                send("stop");
                stopSent = true;
                deadline = System.currentTimeMillis() + READY_TIMEOUT_MS;
            }
            String line = stdout.readLine();
            if (line == null) {
                ready = false;
                break;
            }
            if (line.startsWith("bestmove")) {
                String[] parts = line.split(" ");
                if (parts.length > 1 && !"(none)".equals(parts[1])) bestmove = parts[1];
                else over = true;
                break;
            }
            if (!line.startsWith("info ") || line.startsWith("info string") || !line.contains(" score ")) continue;

            String[] t = line.split(" ");
            int pv = 1, depth = 0, value = 0, pvStart = -1;
            boolean bound = false, isMate = false, scored = false;
            for (int i = 1; i < t.length; i++) {
                switch (t[i]) {
                    case "depth":
                        if (i + 1 < t.length) depth = number(t[++i]);
                        break;
                    case "multipv":
                        if (i + 1 < t.length) pv = number(t[++i]);
                        break;
                    case "score":
                        if (i + 2 < t.length) {
                            isMate = "mate".equals(t[i + 1]);
                            value = number(t[i + 2]);
                            scored = true;
                            i += 2;
                        }
                        break;
                    case "lowerbound":
                    case "upperbound":
                        bound = true;
                        break;
                    case "pv":
                        pvStart = i + 1;
                        i = t.length;
                        break;
                    default:
                        break;
                }
            }
            if (!scored || pv < 1 || pv > lines) continue;
            int index = pv - 1;
            // A fail-high or fail-low line only carries a bound.
            if (bound && exact[index]) continue;
            if (depth == 0 && pvStart < 0) over = true;

            float score;
            int whiteMate = 0;
            if (isMate) {
                whiteMate = whiteToMove ? value : -value;
                if (value == 0) score = whiteToMove ? -MATE_SCORE : MATE_SCORE;
                else score = whiteMate > 0 ? MATE_SCORE - whiteMate : -MATE_SCORE - whiteMate;
            } else {
                score = (whiteToMove ? value : -value) / 100f;
            }
            scores[index] = score;
            if (!bound) exact[index] = true;
            if (pvStart > 0 && pvStart < t.length) {
                firstMoves[index] = t[pvStart];
                if (!bound) {
                    List<String> fullLine = new ArrayList<>(t.length - pvStart);
                    for (int k = pvStart; k < t.length; k++) fullLine.add(t[k]);
                    pvs[index] = fullLine;
                }
            }
            if (index == 0) {
                reached = Math.max(reached, depth);
                mate = isMate && value != 0 ? whiteMate : 0;
            }

            if (progress != null && index == 0 && !bound && depth >= PROGRESS_MIN_DEPTH && depth > reported
                && depth < targetDepth && firstMoves[0] != null) {
                long now = System.currentTimeMillis();
                if (now - lastReport >= PROGRESS_INTERVAL_MS) {
                    reported = depth;
                    lastReport = now;
                    progress.onProgress(result(firstMoves, scores, mate, depth, false, null, pvs));
                }
            }
        }
        return result(firstMoves, scores, mate, reached, over, bestmove, pvs);
    }

    private static Result result(String[] firstMoves, float[] scores, int mate, int depth, boolean over,
                                  String bestmove, List<String>[] pvs) {
        String[] moves = firstMoves.clone();
        if (bestmove != null) moves[0] = bestmove;
        List<String> list = new ArrayList<>();
        for (String move : moves) {
            if (move != null && !list.contains(move)) list.add(move);
        }
        boolean finished = over && list.isEmpty();
        List<String> pv = pvs.length > 0 && pvs[0] != null ? pvs[0]
            : list.isEmpty() ? new ArrayList<>() : new ArrayList<>(Collections.singletonList(list.get(0)));
        return new Result(list, scores[0], mate, depth, finished, pv, scores.clone());
    }

    private static Result empty() {
        return new Result(new ArrayList<>(), 0f, 0, 0, false, new ArrayList<>(), new float[0]);
    }

    /**
     * Threads when the settings say Auto: half the phone's cores, so the phone stays cool and
     * smooth. A review on the computer has your computer's cores to spend instead.
     */
    protected int autoThreads(Context context) {
        return Math.max(1, Math.min(4, Runtime.getRuntime().availableProcessors() / 2));
    }

    /** The transposition table when the settings say Auto: the phone's own memory. */
    protected int autoHashMb(Context context) {
        return hashMb(context);
    }

    /** The transposition table, sized from the phone's memory. */
    private static int hashMb(Context context) {
        long totalMb = 0;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (manager != null) {
            ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
            manager.getMemoryInfo(info);
            totalMb = info.totalMem / (1024L * 1024L);
        }
        if (totalMb >= 7_000) return 256;
        if (totalMb >= 3_000) return 128;
        return 32;
    }

    private boolean failed() {
        quit();
        return false;
    }

    private void send(String command) {
        PrintWriter writer = stdin;
        if (writer != null) writer.println(command);
    }

    private boolean waitFor(String token) throws IOException {
        long deadline = System.currentTimeMillis() + READY_TIMEOUT_MS;
        while (System.currentTimeMillis() < deadline) {
            String line = stdout.readLine();
            if (line == null) return false;
            if (line.startsWith(token)) return true;
        }
        return false;
    }

    private static int number(String text) {
        try {
            return Integer.parseInt(text);
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
