package dev.hyzor.extension.chesscom.stockfish;

import android.app.ActivityManager;
import android.content.Context;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import dev.hyzor.extension.chesscom.lichesspuzzle.San;

/**
 * A game's positions searched the way Lichess's servers analyse a game (fishnet): a node budget
 * per move with Stockfish's own single thread and 16 MB hash and no depth limit, the game taken
 * backwards in chunks of five positions that each start from a cleared hash with the position
 * after them searched once first, and a finished game's last position scored without a search.
 * The chunks do not depend on each other, so several engines take them in turn and still give
 * one engine's results.
 */
public final class FishnetSearch {
    /** fishnet's Chunk.MAX_POSITIONS, the repeated position included. */
    private static final int CHUNK = 6;
    /** Stockfish's defaults, which fishnet keeps. */
    private static final int THREADS = 1, HASH_MB = 16;
    private static final long POLL_MS = 250;

    public interface Progress {
        /** Called on the caller's thread while the engines work; throwing stops them and is passed on. */
        void searched(float fraction) throws Throwable;
    }

    private FishnetSearch() {}

    /**
     * Every position of a game: {@code fens[0]} is the start and {@code fens[i]} the position
     * after {@code i} moves. {@code moves} are the game's UCI moves, or null to send each position
     * as its FEN. {@code nodesPerMove} is the budget as lila gives it (1,000,000 for an analysis a
     * player asks for), and {@code engines} search side by side.
     */
    public static Engine.Result[] search(Context context, String startFen, List<String> moves, String[] fens,
                                         long nodesPerMove, int engines, Progress progress) throws Throwable {
        // fishnet's NodeLimit.get spreads the budget over the repeated positions too.
        long nodes = nodesPerMove * CHUNK / (CHUNK + 1);
        int last = fens.length - 1;
        // Chunk k: the positions 5k .. 5k+4 from the end, after the one just before them in that
        // order (the last position itself for the first chunk), whose result is dropped.
        List<int[]> chunks = new ArrayList<>();
        int total = 0;
        for (int first = 0; first <= last; first += CHUNK - 1) {
            int[] chunk = new int[Math.min(CHUNK - 1, last - first + 1) + 1];
            chunk[0] = last - Math.max(0, first - 1);
            for (int k = 1; k < chunk.length; k++) chunk[k] = last - (first + k - 1);
            chunks.add(chunk);
            total += chunk.length;
        }

        Engine.Result[] results = new Engine.Result[last + 1];
        AtomicInteger next = new AtomicInteger(), searched = new AtomicInteger();
        AtomicBoolean stop = new AtomicBoolean();
        List<Engine> running = Collections.synchronizedList(new ArrayList<>());
        Thread[] workers = new Thread[Math.max(1, Math.min(engines, chunks.size()))];
        for (int w = 0; w < workers.length; w++) {
            workers[w] = new Thread(() -> {
                Engine engine = new Engine(THREADS, HASH_MB);
                running.add(engine);
                try {
                    if (!engine.start(context)) return;
                    for (int c; !stop.get() && (c = next.getAndIncrement()) < chunks.size(); ) {
                        int[] chunk = chunks.get(c);
                        engine.newGame();
                        for (int k = 0; k < chunk.length && !stop.get(); k++) {
                            int ply = chunk[k];
                            Engine.Result result = finished(fens[ply]);
                            if (result == null) {
                                result = engine.analyseGame(startFen, moves != null ? moves.subList(0, ply) : null,
                                    fens[ply], 0, nodes, 1);
                                if (!result.valid()) return;
                            }
                            if (k > 0) results[ply] = result;
                            searched.incrementAndGet();
                        }
                    }
                } finally {
                    engine.quit();
                }
            }, "MorpheFishnet" + w);
            workers[w].start();
        }

        try {
            for (Thread worker : workers) {
                while (worker.isAlive()) {
                    progress.searched((float) searched.get() / total);
                    worker.join(POLL_MS);
                }
            }
        } catch (Throwable stopped) {
            stop.set(true);
            synchronized (running) {
                for (Engine engine : running) engine.stopSearch();
            }
            for (Thread worker : workers) worker.join();
            throw stopped;
        }
        for (Engine.Result result : results) {
            if (result == null) throw new IOException("Stockfish could not analyse the game");
        }
        return results;
    }

    /**
     * fishnet's score for a position where the game is over (shakmaty's outcome), or null: the
     * side to move is mated, or it is a draw.
     */
    private static Engine.Result finished(String fen) {
        boolean whiteToMove = fen == null || !fen.contains(" b ");
        if (San.checkmate(fen)) {
            float score = whiteToMove ? -Engine.MATE_SCORE : Engine.MATE_SCORE;
            return new Engine.Result(new ArrayList<>(), score, 0, 0, true, new ArrayList<>(), new float[]{score});
        }
        boolean stalemate = San.stalemate(fen);
        if (stalemate || San.insufficientMaterial(fen)) {
            return new Engine.Result(new ArrayList<>(), 0f, 0, 0, stalemate, new ArrayList<>(), new float[]{0f});
        }
        return null;
    }

    /**
     * Engines side by side when the user has not picked: on Android each holds its own copy of
     * Stockfish's network (about 110 MB, plus 50 MB of its own), so it depends on the phone's memory.
     */
    public static int defaultEngines(Context context) {
        long totalMb = 0;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (manager != null) {
            ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
            manager.getMemoryInfo(info);
            totalMb = info.totalMem / (1024L * 1024L);
        }
        int byMemory = totalMb >= 7_000 ? 4 : totalMb >= 5_000 ? 3 : totalMb >= 3_000 ? 2 : 1;
        return Math.max(1, Math.min(Runtime.getRuntime().availableProcessors(), byMemory));
    }
}
