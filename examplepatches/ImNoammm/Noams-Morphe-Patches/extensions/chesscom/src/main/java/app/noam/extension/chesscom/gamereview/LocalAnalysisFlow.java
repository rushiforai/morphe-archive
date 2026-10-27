/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.extension.chesscom.gamereview;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.stockfish.Engine;
import app.noam.extension.chesscom.stockfish.FishnetSearch;

/**
 * Runs a full local Stockfish review of a finished game and feeds the result back into
 * chess.com's own Game Review screen, in place of its quota-limited server analysis.
 */
final class LocalAnalysisFlow {
    private static final String TAG = "LocalAnalysisFlow";

    private LocalAnalysisFlow() {}

    /**
     * Returns a Flow (the app's obfuscated coroutine Flow interface, passed in by the patch) that
     * runs a full local Stockfish review of {@code pgn} when collected.
     */
    static Object createFlow(final Class<?> flowClass, final String pgn) {
        try {
            final AppTypes types = AppTypes.get(flowClass);
            Class<?> flowIface = types.flowClass;

            return Proxy.newProxyInstance(
                flowIface.getClassLoader(),
                new Class<?>[]{flowIface},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        if (method.getName().equals("collect") && args != null && args.length == 2) {
                            // collect(collector, continuation) is a suspend function: run the
                            // review on a worker thread, suspend the caller and resume it when
                            // the review has finished (see FlowBridge).
                            return FlowBridge.collect(types, args[0], args[1], "noam-stockfish-review",
                                emitter -> runCollect(types, pgn, emitter));
                        }
                        if (method.getName().equals("toString")) {
                            return "LocalAnalysisFlow(" + (pgn != null ? pgn.length() : 0) + " chars)";
                        }
                        if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                        if (method.getName().equals("equals")) return args != null && proxy == args[0];
                        return null;
                    }
                }
            );
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create dynamic proxy flow", t);
            // Never return null: the caller captures this in a final field and NPEs on collect()
            // if it is null. A no-op proxy lets the app show its own error state instead.
            return createNoOpFlow(flowClass);
        }
    }

    /** Bare-bones Flow proxy that does nothing when collected (returns Unit). */
    private static Object createNoOpFlow(Class<?> flowClass) {
        try {
            return Proxy.newProxyInstance(
                flowClass.getClassLoader(),
                new Class<?>[]{flowClass},
                (proxy, method, args) -> {
                    if (method.getName().equals("collect")) return FlowBridge.unit();
                    if (method.getName().equals("toString")) return "NoOpFlow(fallback)";
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return args != null && proxy == args[0];
                    return null;
                }
            );
        } catch (Throwable t2) {
            Log.e(TAG, "Even fallback no-op flow failed", t2);
            return null; // truly unrecoverable - flowClass itself is broken
        }
    }

    private static void runCollect(AppTypes types, String pgn, FlowBridge.Emitter emitter) throws Throwable {
        Activity activity = Utils.topActivity();
        // Fair-play gate: never analyse while a game against a person is on screen.
        if (GameReview.isLiveMatch(activity)) {
            Log.w(TAG, "Analysis request blocked: a live match is on screen.");
            return;
        }

        if (Utils.context() == null) return;

        // How hard to look: the depth picked on the welcome screens or in Noam's Patches.
        String depth = GameReview.reviewDepth();
        long searchNodes = nodesFor(depth);
        GameReview.Mode reviewer = GameReview.mode();
        long started = System.currentTimeMillis();
        Log.i(TAG, "Review by " + reviewer + (reviewer == GameReview.Mode.LICHESS ? "" : " at " + depth));
        GameReview.clearLichessReview();

        // Get Reflection Classes
        Class<?> adClass = Class.forName("com.chess.entities.AnalysisDepth");

        // Analysis source = the "Ceac" (engine analysis) singleton
        Object sourceEnum = types.ceacSource;

        // chess.com's own screens show the depth the review runs at.
        Object depthEnum = Enum.valueOf((Class<Enum>) adClass, depth);

        // Emit initial Progress: InProgress(float progress, AnalysisDepth depth, m source)
        Constructor<?> ipConstructor = types.inProgressCtor;
        Object initialProgress = ipConstructor.newInstance(0.0f, depthEnum, sourceEnum);
        emitter.emit(initialProgress);

        try {
            // Parse PGN using the app's native parser
            Class<?> qClass = Class.forName("com.chess.chessboard.pgn.q");
            Class<?> fenTypeClass = Class.forName("com.chess.chessboard.fen.FenParser$FenType");
            Object fenTypeC = fenTypeClass.getField("c").get(null);

            Method parsePgnMethod = qClass.getMethod("a", String.class, boolean.class, boolean.class, fenTypeClass);
            Object gameObj = parsePgnMethod.invoke(null, pgn, true, true, fenTypeC);

            Method getMovesMethod;
            try {
                getMovesMethod = gameObj.getClass().getMethod("getMoves");
            } catch (NoSuchMethodException e) {
                getMovesMethod = gameObj.getClass().getMethod("b");
            }
            List<?> moves = (List<?>) getMovesMethod.invoke(gameObj);
            int totalMoves = moves.size();

            Method getStartingPositionMethod;
            try {
                getStartingPositionMethod = gameObj.getClass().getMethod("getStartingPosition");
            } catch (NoSuchMethodException e) {
                getStartingPositionMethod = gameObj.getClass().getMethod("c");
            }
            Object startingPosition = getStartingPositionMethod.invoke(gameObj);
            String startingFen = extractFen(startingPosition);

            Class<?> moveConverterClass = Class.forName("com.chess.chessboard.compengine.MoveConverterKt");
            Method moveConvertMethod = moveConverterClass.getMethod("b", Class.forName("com.chess.chessboard.l"));

            // Extract every FEN and played move once.
            String[] fens = new String[totalMoves + 1];
            String[] playedLans = new String[totalMoves];
            fens[0] = startingFen;
            for (int i = 0; i < totalMoves; i++) {
                Object csrmm = moves.get(i);
                fens[i + 1] = extractFen(getPositionAfter(csrmm));
                Method getRawMoveMethod;
                try {
                    getRawMoveMethod = csrmm.getClass().getMethod("getRawMove");
                } catch (NoSuchMethodException e) {
                    getRawMoveMethod = csrmm.getClass().getMethod("a");
                }
                playedLans[i] = (String) moveConvertMethod.invoke(null, getRawMoveMethod.invoke(csrmm));
            }

            // Stockfish-safe move list (standard castling notation) + lightweight boards.
            char[][] boards = new char[totalMoves + 1][];
            boards[0] = BoardUtil.parseBoard(startingFen);
            List<String> engineMoves = new ArrayList<>(totalMoves);
            boolean historyUsable = startingFen != null;
            for (int i = 0; i < totalMoves; i++) {
                String m = playedLans[i];
                if (m == null || m.length() < 4) {
                    historyUsable = false;
                    boards[i + 1] = BoardUtil.parseBoard(fens[i + 1]);
                    continue;
                }
                engineMoves.add(BoardUtil.normalizeCastling(boards[i], m));
                char[] next = boards[i].clone();
                BoardUtil.apply(next, m);
                boards[i + 1] = next;
                // Cross-check against the app's own position; on any disagreement stop sending
                // history (FEN-only analysis is still correct, just less informed).
                if (fens[i + 1] != null && !BoardUtil.placement(next).equals(BoardUtil.placement(fens[i + 1]))) {
                    historyUsable = false;
                    boards[i + 1] = BoardUtil.parseBoard(fens[i + 1]);
                }
            }

            // Opening book: which leading plies are theory, and the name of the opening.
            List<String> bookLine = new ArrayList<>(Math.min(totalMoves, 40));
            for (int i = 0; i < totalMoves && i < 40; i++) {
                if (playedLans[i] == null || playedLans[i].length() < 4) break;
                bookLine.add(BoardUtil.normalizeCastling(boards[i], playedLans[i]));
            }
            OpeningBook.Match opening = null;
            try {
                opening = OpeningBook.lookup(startingFen, bookLine);
            } catch (Throwable t) {
                Log.e(TAG, "Opening book lookup failed", t);
            }
            final int bookPlies = opening != null ? opening.bookPlies : 0;

            // The review the Lichess way: by Lichess's servers, everything from Lichess, or by
            // Stockfish on the phone. A game reviewed before opens from its saved review (for
            // Stockfish, one searched at least as hard).
            final Object progressDepth = depthEnum;
            boolean lichess = reviewer == GameReview.Mode.LICHESS;
            long savedNodes = lichess ? 0 : searchNodes;
            Context context = Utils.context();
            String savedKey = SavedReviews.key(reviewer.name(), startingFen, playedLans);
            ReviewData data = SavedReviews.load(context, savedKey, savedNodes);
            if (data != null) {
                Log.i(TAG, "Opening the saved review");
            } else {
                if (lichess) {
                    try {
                        data = LichessServerReview.review(pgn, fens, totalMoves, fraction -> {
                            emitter.ensureActive();
                            emitter.emit(ipConstructor.newInstance(fraction, progressDepth, sourceEnum));
                        });
                    } catch (IOException e) {
                        Utils.toast(e.getMessage());
                        throw e;
                    }
                } else {
                    data = engineReview(startingFen, fens, playedLans, boards, historyUsable ? engineMoves : null,
                        searchNodes, progress -> {
                            emitter.ensureActive();
                            emitter.emit(ipConstructor.newInstance(progress, progressDepth, sourceEnum));
                        });
                }
                SavedReviews.save(context, savedKey, savedNodes, data);
                Log.i(TAG, "Review ready in " + (System.currentTimeMillis() - started) / 1000 + " s");
            }
            // Where Lichess marked a move, chess.com shows Lichess's better move; Stockfish keeps off it.
            if (lichess) GameReview.setLichessReview(fens, data);

            // Map Stockfish analysis outputs to AnalyzedGameData's AnalyzedPositions
            Class<?> apClass = types.agd("$AnalyzedPosition");
            Class<?> colorClass = Class.forName("com.chess.entities.Color");
            Class<?> pmClass = types.agd("$AnalyzedPosition$PlayedMove");
            Class<?> smClass = types.agd("$AnalyzedPosition$SuggestedMove");
            Class<?> bmClass = types.agd("$AnalyzedPosition$BestMove");
            Class<?> scClass = types.agd("$AnalyzedPosition$Scenarios");
            Class<?> evalClass = types.agd("$AnalyzedPosition$Eval");

            Constructor<?> apConstructor = apClass.getConstructor(colorClass, pmClass, smClass, bmClass, String.class, scClass);
            // PlayedMove: (depth, score, mateIn, moveLan, eval, speech, coachEmotion, skills, skillsHash, boardMarkings)
            // Everything after the first 7 parameters is optional and defaults to null/empty.
            Constructor<?> pmConstructor = AppTypes.primaryCtor(pmClass);
            Constructor<?> smConstructor = smClass.getConstructor(
                float.class, Integer.class, String.class, evalClass, List.class, String.class
            );
            Constructor<?> bmConstructor = bmClass.getConstructor(String.class);
            Constructor<?> scConstructor = scClass.getConstructor(boolean.class, boolean.class);
            Constructor<?> evalConstructor = evalClass.getConstructor(List.class, int.class);

            Object colorWhite = Enum.valueOf((Class<Enum>) colorClass, "WHITE");
            Object colorBlack = Enum.valueOf((Class<Enum>) colorClass, "BLACK");

            List<Object> positions = new ArrayList<>();
            // Tally order matches MovesTally: book, brilliant, greatFind, best, excellent, good,
            // inaccuracy, mistake, blunder, forced, miss
            int[] wT = new int[11];
            int[] bT = new int[11];

            // Starting position (index 0)
            Object startSuggestedMove = null;
            Object startBestMove = null;
            if (data.startBest != null) {
                List<String> startPv = data.startLine.isEmpty() ? Collections.singletonList(data.startBest) : data.startLine;
                startSuggestedMove = smConstructor.newInstance(
                    data.startScore,
                    data.startMate != 0 ? data.startMate : null,
                    data.startBest,
                    evalConstructor.newInstance(startPv, pvCutoff(startPv)),
                    new ArrayList<>(),
                    null
                );
                startBestMove = bmConstructor.newInstance(data.startBest);
            }
            positions.add(apConstructor.newInstance(
                colorWhite, null, startSuggestedMove, startBestMove, null,
                scConstructor.newInstance(false, false)
            ));

            for (int i = 0; i < totalMoves; i++) {
                ReviewData.Ply ply = data.plies[i];
                String playedLan = playedLans[i];
                boolean isWhite = fens[i] == null || fens[i].indexOf(" b ") < 0;
                Object color = isWhite ? colorWhite : colorBlack;

                // Lichess marks inaccuracies, mistakes and blunders (a lost forced mate shows as a
                // Miss); moves of the opening Lichess names are Book and the engine's own best move
                // is Best. Local Stockfish marks the rest Excellent or Good, as chess.com would;
                // Lichess's review leaves them unmarked, as Lichess does.
                String classification = ply.miss ? LichessMath.MISS : ply.judgment != null ? ply.judgment
                    : i < bookPlies ? LichessMath.BOOK : ply.best ? LichessMath.BEST
                    : lichess ? LichessMath.EXCELLENT
                    : LichessMath.unjudged(ply.scoreBefore, ply.mateBefore, ply.scoreAfter, ply.mateAfter, isWhite);
                int[] tally = isWhite ? wT : bT;
                tally[tallyIndex(classification)]++;

                // Played move: its line starts with the played move (the app replays it from the
                // position before the move).
                String safePlayed = playedLan != null ? playedLan : (ply.bestMove != null ? ply.bestMove : "");
                List<String> playedPv = new ArrayList<>();
                playedPv.add(safePlayed);
                for (int k = 0; k < ply.lineAfter.size() && k < 7; k++) playedPv.add(ply.lineAfter.get(k));
                Integer playedMateIn = ply.mateAfter != 0 ? ply.mateAfter : null;
                Object[] pmArgs = new Object[pmConstructor.getParameterTypes().length];
                for (int k = 0; k < pmArgs.length; k++) pmArgs[k] = AppTypes.defaultFor(pmConstructor.getParameterTypes()[k]);
                pmArgs[0] = String.valueOf(ply.depth);                                // depth
                pmArgs[1] = ply.scoreAfter;                                           // score
                pmArgs[2] = playedMateIn;                                             // mateIn
                pmArgs[3] = safePlayed;                                               // moveLan
                pmArgs[4] = evalConstructor.newInstance(playedPv, pvCutoff(playedPv)); // eval
                pmArgs[5] = new ArrayList<>();                                        // speech
                pmArgs[6] = null;                                                     // coachEmotion
                Object playedMove = pmConstructor.newInstance(pmArgs);

                // The better move, when it is known (Lichess names it only for the moves it marks).
                Object suggestedMove = null;
                Object bestMove = null;
                if (ply.bestMove != null) {
                    List<String> line = ply.bestLine.isEmpty() ? Collections.singletonList(ply.bestMove) : ply.bestLine;
                    suggestedMove = smConstructor.newInstance(
                        ply.scoreBefore,
                        ply.mateBefore != 0 ? ply.mateBefore : null,
                        ply.bestMove,
                        evalConstructor.newInstance(line, pvCutoff(line)),
                        new ArrayList<>(),
                        null
                    );
                    bestMove = bmConstructor.newInstance(ply.bestMove);
                }

                Object scenarios = scConstructor.newInstance(ply.judgment != null, false);
                positions.add(apConstructor.newInstance(
                    color, playedMove, suggestedMove, bestMove, classification, scenarios
                ));
            }

            // Tallies
            Class<?> mtClass = types.agd("$Tallies$MovesTally");
            Constructor<?> mtConstructor = mtClass.getConstructor(
                int.class, int.class, int.class, int.class, int.class, int.class, int.class, int.class, int.class, int.class, int.class
            );
            Object whiteTally = mtConstructor.newInstance(wT[0], wT[1], wT[2], wT[3], wT[4], wT[5], wT[6], wT[7], wT[8], wT[9], wT[10]);
            Object blackTally = mtConstructor.newInstance(bT[0], bT[1], bT[2], bT[3], bT[4], bT[5], bT[6], bT[7], bT[8], bT[9], bT[10]);

            Class<?> talliesClass = types.agd("$Tallies");
            Constructor<?> talliesConstructor = talliesClass.getConstructor(mtClass, mtClass, String.class, String.class);
            Object tallies = talliesConstructor.newInstance(whiteTally, blackTally, "Game Summary", "Game Summary Play");

            // Accuracy, as Lichess has it: each side's, and its opening, middlegame and endgame.
            Class<?> accClass = types.agd("$AccuracyScores$Accuracy");
            Constructor<?> accConstructor = accClass.getConstructor(float.class, Float.class, Float.class, Float.class);
            Object whiteAcc = accConstructor.newInstance(data.whiteAccuracy,
                data.whitePhases[0], data.whitePhases[1], data.whitePhases[2]);
            Object blackAcc = accConstructor.newInstance(data.blackAccuracy,
                data.blackPhases[0], data.blackPhases[1], data.blackPhases[2]);

            Class<?> accScoresClass = types.agd("$AccuracyScores");
            Constructor<?> accScoresConstructor = accScoresClass.getConstructor(accClass, accClass);
            Object accuracyScores = accScoresConstructor.newInstance(whiteAcc, blackAcc);

            // Report card: Lichess gives no rating estimate (0 makes chess.com hide its Game
            // Rating row) and no categories.
            Class<?> rcClass = types.agd("$ReportCard");
            Class<?> repClass = types.agd("$ReportCard$Report");
            Class<?> glyphsClass = types.agd("$ReportCard$Report$Glyphs");

            Constructor<?> rcConstructor = rcClass.getConstructor(repClass, repClass, String.class);
            Constructor<?> repConstructor = repClass.getConstructor(Integer.class, glyphsClass, List.class);
            Constructor<?> glyphsConstructor = glyphsClass.getConstructor(String.class, String.class, String.class);

            Object whiteReport = repConstructor.newInstance(0, glyphsConstructor.newInstance(
                phaseGlyph(data.whitePhases[0]), phaseGlyph(data.whitePhases[1]), phaseGlyph(data.whitePhases[2])),
                new ArrayList<>());
            Object blackReport = repConstructor.newInstance(0, glyphsConstructor.newInstance(
                phaseGlyph(data.blackPhases[0]), phaseGlyph(data.blackPhases[1]), phaseGlyph(data.blackPhases[2])),
                new ArrayList<>());

            String summary = LichessMath.summary(opening != null ? opening.name : null,
                data.whiteAccuracy, data.whiteAcpl, data.whiteMarks[0], data.whiteMarks[1], data.whiteMarks[2],
                data.blackAccuracy, data.blackAcpl, data.blackMarks[0], data.blackMarks[1], data.blackMarks[2]);
            Object reportCard = rcConstructor.newInstance(whiteReport, blackReport, summary);

            // Themes
            Class<?> twClass = types.agd("$Themes$ThemesWeights");
            Constructor<?> twConstructor = twClass.getConstructor(Map.class, Map.class);
            Object themesWeights = twConstructor.newInstance(new HashMap<String, Integer>(), new HashMap<String, Integer>());

            Class<?> themesClass = types.agd("$Themes");
            Constructor<?> themesConstructor = themesClass.getConstructor(twClass);
            Object themes = themesConstructor.newInstance(themesWeights);

            // Opening name shown in the review (AnalyzedGameData.openingInfo). The url is only
            // used for an optional online opening-stats request the app wraps in runCatching, so
            // an empty url is safe offline.
            Class<?> openingClass = types.agd("$OpeningInfo");
            Object openingInfo = null;
            if (opening != null) {
                try {
                    int last = Math.min(bookPlies, totalMoves);
                    float openingScore = last == 0 ? data.startScore : data.plies[last - 1].scoreAfter;
                    openingInfo = openingClass.getConstructor(String.class, String.class, float.class)
                        .newInstance(opening.name, "", openingScore);
                } catch (Throwable t) {
                    Log.e(TAG, "Could not build OpeningInfo", t);
                }
            }

            // Build the final AnalyzedGameData. Primary constructor: (startingFen, tallies,
            // accuracyScores, positions, openingInfo, arc, arcPlayerScenarios, playMayContinue,
            // themes, cee, metaData, reportCard, analysisStrength, gameSummary,
            // gameSummaryAudioUrlHash, gameSummaryCoachEmotion, takeaways, gameResult). Fill by
            // type in declaration order; unknown/optional parameters get null/0/empty.
            Class<?> agdClass = types.agd("");
            Constructor<?> agdConstructor = AppTypes.primaryCtor(agdClass);
            Class<?>[] agdTypes = agdConstructor.getParameterTypes();
            Object[] agdArgs = new Object[agdTypes.length];
            int stringSlot = 0;
            String[] strings = {
                startingFen,                          // startingFen
                "",                                   // arc (non-null)
                data.source,                          // analysisStrength
                summary,                              // gameSummary
                null,                                 // gameSummaryAudioUrlHash
                null                                  // gameSummaryCoachEmotion
            };
            for (int k = 0; k < agdTypes.length; k++) {
                Class<?> t = agdTypes[k];
                if (t == String.class) agdArgs[k] = stringSlot < strings.length ? strings[stringSlot++] : null;
                else if (t == talliesClass) agdArgs[k] = tallies;
                else if (t == accScoresClass) agdArgs[k] = accuracyScores;
                else if (t == List.class) agdArgs[k] = positions;
                else if (t == themesClass) agdArgs[k] = themes;
                else if (t == rcClass) agdArgs[k] = reportCard;
                else if (t == openingClass) agdArgs[k] = openingInfo;
                else agdArgs[k] = AppTypes.defaultFor(t);             // cee, gameResult, ...
            }
            Object gameData = agdConstructor.newInstance(agdArgs);

            // Permissions: construct directly with all-true to avoid obfuscated companion field
            // names (the permissions object itself still comes from the real class).
            Class<?> permissionsClass = Class.forName("com.chess.entities.GameAnalysisPermissions");
            Class<?> quotaTypeClass = Class.forName("com.chess.entities.GameAnalysisPermissions$QuotaType");
            Constructor<?> permConstructor = permissionsClass.getConstructor(
                boolean.class, boolean.class, boolean.class, boolean.class, quotaTypeClass
            );
            Object fullPermissions = permConstructor.newInstance(true, true, true, true, null);

            // Emit RemoteAnalysisCompleted to trigger the review UI.
            Constructor<?> compConstructor = types.completedCtor;
            Object completedResult = compConstructor.newInstance(gameData, fullPermissions, depthEnum);
            emitter.emit(completedResult);

        } catch (CancellationException c) {
            Log.i(TAG, "Local review cancelled");
            throw c;
        } catch (Throwable t) {
            Throwable cause = t instanceof java.lang.reflect.InvocationTargetException && t.getCause() != null ? t.getCause() : t;
            if (cause instanceof CancellationException) throw cause;
            Log.e(TAG, "Local stockfish analysis failed", cause);
            // Report through the app's own Failure state so the screen shows its error UI.
            emitter.emit(types.failureCtor.newInstance(cause));
        }
    }

    /**
     * Stockfish on the phone looks at every position as Lichess's servers do (FishnetSearch: with
     * the moves that led there, so it sees repetitions and the 50-move rule), and the moves are
     * scored the Lichess way.
     */
    private static ReviewData engineReview(String startingFen, String[] fens, String[] playedLans, char[][] boards,
                                           List<String> engineMoves, long nodesPerMove,
                                           LichessServerReview.Waiting step) throws Throwable {
        Context context = Utils.context();
        if (context == null) throw new IOException("Stockfish could not start for the review");
        int total = playedLans.length;
        Engine.Result[] results = FishnetSearch.search(context, startingFen, engineMoves, fens, nodesPerMove,
            GameReview.reviewEngines(context), step::progress);

        ReviewData data = new ReviewData();
        int[] depths = new int[total + 1];
        for (int i = 0; i <= total; i++) depths[i] = results[i].depth;
        Arrays.sort(depths);
        data.source = "depth_" + depths[total / 2];
        Engine.Result start = results[0];
        if (!start.moves.isEmpty()) {
            data.startBest = start.moves.get(0);
            data.startLine = linePv(start.pv, data.startBest);
            data.startScore = start.score;
            data.startMate = start.mate;
        }

        // Lichess weighs each move by the volatility around it and scores it from the evals
        // before and after (AccuracyPercent.gameAccuracy). A checkmated position has no eval
        // there, so the mating move has no accuracy or centipawn loss.
        boolean whiteStarts = fens[0] == null || fens[0].indexOf(" b ") < 0;
        boolean mated = results[total].over && Math.abs(results[total].score) >= LichessMath.MATE_THRESHOLD;
        int scored = mated ? total - 1 : total;
        double[] winAfter = new double[scored];
        int[] cpAfter = new int[scored];
        for (int i = 0; i < scored; i++) {
            winAfter[i] = LichessMath.winPercent(results[i + 1].score, results[i + 1].mate);
            cpAfter[i] = LichessMath.cp(results[i + 1].score, results[i + 1].mate);
        }
        List<double[]> weighted = LichessMath.weightedMoves(winAfter, whiteStarts);
        List<double[]> white = new ArrayList<>(), black = new ArrayList<>();

        data.plies = new ReviewData.Ply[total];
        for (int i = 0; i < total; i++) {
            Engine.Result before = results[i], after = results[i + 1];
            boolean isWhite = fens[i] == null || fens[i].indexOf(" b ") < 0;
            String bestLan = !before.moves.isEmpty() ? before.moves.get(0) : null;
            String played = playedLans[i];
            String playedNorm = played != null ? BoardUtil.normalizeCastling(boards[i], played) : null;

            ReviewData.Ply ply = new ReviewData.Ply();
            ply.scoreBefore = before.score;
            ply.mateBefore = before.mate;
            ply.scoreAfter = after.score;
            ply.mateAfter = after.mate;
            ply.depth = after.depth;
            ply.best = (after.over && after.mate != 0)
                || (bestLan != null && (bestLan.equals(playedNorm) || bestLan.equals(played)));
            // Lichess only judges inaccuracies, mistakes and blunders, and never the engine's own
            // best move (fishnet's AnalysisBuilder drops the line when they match).
            ply.judgment = ply.best ? null
                : LichessMath.judgment(before.score, before.mate, after.score, after.mate, isWhite);
            ply.miss = ply.judgment != null
                && LichessMath.lostMate(before.score, before.mate, after.score, after.mate, isWhite);
            if (bestLan != null) {
                ply.bestMove = bestLan;
                ply.bestLine = linePv(before.pv, bestLan);
            }
            if (!after.over) ply.lineAfter = after.pv.subList(0, Math.min(after.pv.size(), 7));
            data.plies[i] = ply;

            if (ply.judgment != null) {
                int[] marks = isWhite ? data.whiteMarks : data.blackMarks;
                marks[ply.judgment.equals(LichessMath.INACCURACY) ? 0 : ply.judgment.equals(LichessMath.MISTAKE) ? 1 : 2]++;
            }
            if (i < weighted.size()) (isWhite ? white : black).add(weighted.get(i));
        }
        data.whiteAccuracy = Math.round(LichessMath.accuracy(white));
        data.blackAccuracy = Math.round(LichessMath.accuracy(black));
        data.scorePhases(fens, winAfter);
        data.whiteAcpl = LichessMath.acpl(cpAfter, whiteStarts, true);
        data.blackAcpl = LichessMath.acpl(cpAfter, whiteStarts, false);
        return data;
    }

    /**
     * Nodes per move for the review depth (an AnalysisDepth name), each a budget Lichess's servers
     * use (lila's Work.Origin): Fast 100,000, Standard 300,000 (its automatic analysis), Deep
     * 1,000,000 (an analysis a player asks for, so Deep gives Analyze with Lichess's numbers) and
     * Maximum 5,000,000 (broadcasts).
     */
    private static long nodesFor(String name) {
        if ("FAST".equals(name)) return 100_000;
        if ("DEEP".equals(name)) return 1_000_000;
        if ("MAXIMUM".equals(name)) return 5_000_000;
        return 300_000; // STANDARD
    }

    /**
     * Tally slot for a classification, in MovesTally order: book, brilliant, great, best,
     * excellent, good, inaccuracy, mistake, blunder, forced, miss.
     */
    private static int tallyIndex(String c) {
        switch (c) {
            case LichessMath.BOOK: return 0;
            case LichessMath.BEST: return 3;
            case LichessMath.GOOD: return 5;
            case LichessMath.INACCURACY: return 6;
            case LichessMath.MISTAKE: return 7;
            case LichessMath.BLUNDER: return 8;
            case LichessMath.MISS: return 10;
            default: return 4;
        }
    }

    /**
     * A phase's mark, the way Lichess colors a phase accuracy (roundTraining.ts accuracyClass):
     * good from 85%, then inaccuracy from 70%, mistake from 55%, blunder below.
     */
    private static String phaseGlyph(Float accuracy) {
        if (accuracy == null) return null;
        if (accuracy >= 85) return "good";
        if (accuracy >= 70) return LichessMath.INACCURACY;
        if (accuracy >= 55) return LichessMath.MISTAKE;
        return LichessMath.BLUNDER;
    }

    /** Engine line that starts with {@code first} (never null, never empty). */
    private static List<String> linePv(List<String> pv, String first) {
        List<String> out = new ArrayList<>();
        if (pv != null && !pv.isEmpty() && first.equals(pv.get(0))) {
            for (int k = 0; k < pv.size() && k < 8; k++) out.add(pv.get(k));
        } else {
            out.add(first);
        }
        return out;
    }

    /** Index of the last move of the line the app should show (app shows cutoff + 1 moves). */
    private static int pvCutoff(List<String> pv) {
        return Math.max(0, Math.min(pv.size(), 8) - 1);
    }

    private static Object getPositionAfter(Object csrmm) throws Exception {
        try {
            return csrmm.getClass().getMethod("getPositionAfter").invoke(csrmm);
        } catch (NoSuchMethodException e) {
            return csrmm.getClass().getMethod("b").invoke(csrmm);
        }
    }

    /** The position as a FEN with all six fields, or null (same shape Analysis.fen() expects). */
    private static String extractFen(Object position) {
        try {
            Method fenGetter = findFenGetter(position.getClass());
            if (fenGetter == null) return null;
            Object value = fenGetter.invoke(position);
            return value instanceof String ? (String) value : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static Method findFenGetter(Class<?> type) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            for (Class<?> implemented : c.getInterfaces()) {
                for (Method m : implemented.getMethods()) {
                    if (m.getParameterTypes().length == 0 && m.getReturnType() == String.class
                        && !m.getName().equals("toString")) return m;
                }
            }
        }
        return null;
    }
}
