package app.prathxm.chess.extension.stockfish;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Desktop verification harness.
 *
 * Runs the extension's reflection code against the REAL Chess.com classes (the target APK's
 * dex converted to JVM bytecode with dex2jar) on a plain JVM, with a tiny android.jar stub
 * layer. This proves every obfuscated class/constructor/method the Game Review, arrows and
 * painters rely on resolves and can be instantiated for that exact app version.
 *
 * Usage: see scripts/verify_apk.sh
 */
public class Harness {
    private static int fails = 0;

    static void check(String name, boolean ok, Object detail) {
        String d = detail == null ? "" : String.valueOf(detail);
        if (d.length() > 220) d = d.substring(0, 220) + "…";
        System.out.println((ok ? "PASS " : "FAIL ") + name + (d.isEmpty() ? "" : "  -> " + d));
        if (!ok) fails++;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void main(String[] args) throws Throwable {
        Class<?> flow = Class.forName(args[0]);

        // ── 1. Review type resolution ───────────────────────────────────────────────────
        AppTypes t = AppTypes.get(flow);
        check("Flow collector type", t.collectorClass != null, t.collectorClass.getName());
        check("Continuation type", t.continuationClass != null, t.continuationClass.getName());
        check("FlowCollector.emit", t.emitMethod != null, t.emitMethod);
        check("AnalyzedGameData package", t.agdPrefix != null, t.agdPrefix);
        check("InProgress(float, depth, source)", t.inProgressCtor != null, t.inProgressCtor);
        check("Completed(agd, perms, depth)", t.completedCtor != null, t.completedCtor);
        check("Failure(Throwable)", t.failureCtor != null, t.failureCtor);
        check("Analysis source is \"Ceac\"", "Ceac".equals(String.valueOf(t.ceacSource)), t.ceacSource);

        Class<?> depthCls = Class.forName("com.chess.entities.AnalysisDepth");
        Object standard = Enum.valueOf((Class<Enum>) depthCls, "STANDARD");
        check("InProgress instance", t.inProgressCtor.newInstance(0.5f, standard, t.ceacSource) != null, null);
        check("Failure instance", t.failureCtor.newInstance(new RuntimeException("x")) != null, null);

        // ── 2. Real PGN parsing path ────────────────────────────────────────────────────
        Class<?> qClass = Class.forName("com.chess.chessboard.pgn.q");
        Class<?> fenTypeClass = Class.forName("com.chess.chessboard.fen.FenParser$FenType");
        Object fenTypeC = fenTypeClass.getField("c").get(null);
        check("FenType.c is OPTIONAL_MOVE_NUMBER", "OPTIONAL_MOVE_NUMBER".equals(String.valueOf(fenTypeC)), fenTypeC);
        Method parse = qClass.getMethod("a", String.class, boolean.class, boolean.class, fenTypeClass);
        String pgn = "[Event \"t\"]\n[White \"a\"]\n[Black \"b\"]\n[WhiteElo \"1500\"]\n[BlackElo \"1500\"]\n[Result \"*\"]\n\n"
                + "1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 4. O-O Nf6 *";
        Object game = parse.invoke(null, pgn, true, true, fenTypeC);
        List<?> moves = (List<?>) game.getClass().getMethod("b").invoke(game);
        check("PGN parsed into 8 plies", moves.size() == 8, moves.size());
        Object start = game.getClass().getMethod("c").invoke(game);
        String fen0 = StockfishExtension.extractFen(start);
        check("extractFen(start position)", fen0 != null && fen0.startsWith("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq -"), fen0);
        Method conv = Class.forName("com.chess.chessboard.compengine.MoveConverterKt")
                .getMethod("b", Class.forName("com.chess.chessboard.l"));
        Object mv0 = moves.get(0);
        String lan0 = (String) conv.invoke(null, mv0.getClass().getMethod("a").invoke(mv0));
        check("Move 1 LAN is e2e4", "e2e4".equals(lan0), lan0);
        Object mv6 = moves.get(6);
        String lan6 = (String) conv.invoke(null, mv6.getClass().getMethod("a").invoke(mv6));
        check("Castling LAN (app notation)", lan6 != null && lan6.startsWith("e1"), lan6);
        String fen1 = StockfishExtension.extractFen(mv0.getClass().getMethod("b").invoke(mv0));
        check("extractFen(after 1.e4)", fen1 != null && fen1.startsWith("rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq"), fen1);

        // ── 3. Full AnalyzedGameData build (mirrors LocalAnalysisFlow) ─────────────────────
        Class<?> colorClass = Class.forName("com.chess.entities.Color");
        Class<?> apClass = t.agd("$AnalyzedPosition");
        Class<?> pmClass = t.agd("$AnalyzedPosition$PlayedMove");
        Class<?> smClass = t.agd("$AnalyzedPosition$SuggestedMove");
        Class<?> bmClass = t.agd("$AnalyzedPosition$BestMove");
        Class<?> scClass = t.agd("$AnalyzedPosition$Scenarios");
        Class<?> evalClass = t.agd("$AnalyzedPosition$Eval");
        Constructor<?> apC = apClass.getConstructor(colorClass, pmClass, smClass, bmClass, String.class, scClass);
        Constructor<?> pmC = AppTypes.primaryCtor(pmClass);
        Constructor<?> smC = smClass.getConstructor(float.class, Integer.class, String.class, evalClass, List.class, String.class);
        Constructor<?> bmC = bmClass.getConstructor(String.class);
        Constructor<?> scC = scClass.getConstructor(boolean.class, boolean.class);
        Constructor<?> evC = evalClass.getConstructor(List.class, int.class);
        Class<?>[] pp = pmC.getParameterTypes();
        check("PlayedMove leading 7 params", pp.length >= 7 && pp[0] == String.class && pp[1] == float.class
                && pp[2] == Integer.class && pp[3] == String.class && pp[4] == evalClass && pp[5] == List.class
                && pp[6] == String.class, Arrays.toString(pp));

        Object white = Enum.valueOf((Class<Enum>) colorClass, "WHITE");
        Object ev = evC.newInstance(new ArrayList<>(Arrays.asList("e2e4", "e7e5")), 1);
        Object[] pmArgs = new Object[pp.length];
        for (int k = 0; k < pp.length; k++) pmArgs[k] = AppTypes.defaultFor(pp[k]);
        pmArgs[0] = "18"; pmArgs[1] = 0.3f; pmArgs[2] = null; pmArgs[3] = "e2e4"; pmArgs[4] = ev;
        pmArgs[5] = new ArrayList<>(); pmArgs[6] = null;
        Object pm = pmC.newInstance(pmArgs);
        check("PlayedMove instance", String.valueOf(pm).contains("moveLan=e2e4"), pm);
        Object sm = smC.newInstance(0.3f, null, "e2e4", ev, new ArrayList<>(), null);
        Object ap = apC.newInstance(white, pm, sm, bmC.newInstance("e2e4"), "best", scC.newInstance(false, false));
        check("AnalyzedPosition instance", String.valueOf(ap).startsWith("AnalyzedPosition("), null);

        Class<?> mtClass = t.agd("$Tallies$MovesTally");
        Object tally = mtClass.getConstructor(int.class, int.class, int.class, int.class, int.class, int.class,
                int.class, int.class, int.class, int.class, int.class).newInstance(0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
        Class<?> talliesClass = t.agd("$Tallies");
        Object tallies = talliesClass.getConstructor(mtClass, mtClass, String.class, String.class).newInstance(tally, tally, "a", "b");
        Class<?> accClass = t.agd("$AccuracyScores$Accuracy");
        Object acc = accClass.getConstructor(float.class, Float.class, Float.class, Float.class).newInstance(90f, null, null, null);
        Class<?> accScoresClass = t.agd("$AccuracyScores");
        Object accScores = accScoresClass.getConstructor(accClass, accClass).newInstance(acc, acc);
        Class<?> rcClass = t.agd("$ReportCard");
        Class<?> repClass = t.agd("$ReportCard$Report");
        Class<?> glyphsClass = t.agd("$ReportCard$Report$Glyphs");
        Class<?> catClass = t.agd("$ReportCard$CategoryRating");
        Object glyphs = glyphsClass.getConstructor(String.class, String.class, String.class).newInstance(null, null, null);
        Object cat = catClass.getConstructor(String.class, int.class, String.class, int.class).newInstance("Opening", 1500, "Good", 0);
        Object rep = repClass.getConstructor(Integer.class, glyphsClass, List.class)
                .newInstance(1500, glyphs, new ArrayList<>(Collections.singletonList(cat)));
        Object rc = rcClass.getConstructor(repClass, repClass, String.class).newInstance(rep, rep, "x");
        Class<?> twClass = t.agd("$Themes$ThemesWeights");
        Object tw = twClass.getConstructor(Map.class, Map.class).newInstance(new HashMap<>(), new HashMap<>());
        Class<?> themesClass = t.agd("$Themes");
        Object themes = themesClass.getConstructor(twClass).newInstance(tw);

        Constructor<?> agdC = AppTypes.primaryCtor(t.agd(""));
        Class<?>[] at = agdC.getParameterTypes();
        Object[] aa = new Object[at.length];
        int stringSlot = 0;
        String[] strings = {"rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1", "", "depth_18", "done", null, null};
        List<Object> positions = new ArrayList<>(Collections.singletonList(ap));
        for (int k = 0; k < at.length; k++) {
            Class<?> c = at[k];
            if (c == String.class) aa[k] = stringSlot < strings.length ? strings[stringSlot++] : null;
            else if (c == talliesClass) aa[k] = tallies;
            else if (c == accScoresClass) aa[k] = accScores;
            else if (c == List.class) aa[k] = positions;
            else if (c == Integer.class) aa[k] = 0;
            else if (c == themesClass) aa[k] = themes;
            else if (c == rcClass) aa[k] = rc;
            else aa[k] = AppTypes.defaultFor(c);
        }
        check("AnalyzedGameData has exactly 6 String params", stringSlot == 6, Arrays.toString(at));
        Object agd = agdC.newInstance(aa);
        String s = String.valueOf(agd);
        check("AGD.startingFen", s.contains("startingFen=rnbqkbnr/pppppppp"), null);
        check("AGD.positions", s.contains("positions=[AnalyzedPosition("), null);
        check("AGD.arc", s.contains(", arc=,"), null);
        check("AGD.themes", s.contains("themes=Themes("), null);
        check("AGD.reportCard", s.contains("reportCard=ReportCard("), null);
        check("AGD.analysisStrength", s.contains("analysisStrength=depth_18"), null);
        check("AGD.gameSummary", s.contains("gameSummary=done"), null);

        Class<?> permClass = Class.forName("com.chess.entities.GameAnalysisPermissions");
        Object perms = StockfishExtension.getFullGameAnalysisPermissions();
        check("Full GameAnalysisPermissions", perms != null && permClass.isInstance(perms), perms);
        Object completed = t.completedCtor.newInstance(agd, perms, standard);
        check("Completed result instance", completed != null, completed.getClass().getName());

        // ── 4. Review item fallback builder ─────────────────────────────────────────────
        // history.i = PositionAndMove(position, move, capture): what the app passes to the hook.
        Class<?> hist = Class.forName("com.chess.chessboard.history.i");
        Constructor<?> pamC = hist.getConstructor(Class.forName("com.chess.chessboard.variants.d"),
                Class.forName("com.chess.chessboard.l"), boolean.class);
        Object pam = pamC.newInstance(start, mv0.getClass().getMethod("a").invoke(mv0), false);
        check("PositionAndMove instance", String.valueOf(pam).startsWith("PositionAndMove("), pam);
        Class<?> pair = Class.forName("com.chess.gamereview.api.d");
        Object dummy = StockfishExtension.buildDummyMoveResult(pair, pam);
        check("buildDummyMoveResult", dummy != null && pair.isInstance(dummy), dummy);
        check("fallback item is a BOOK move", String.valueOf(dummy).contains("classification=BOOK"), dummy);

        // ── 5. Board arrows ─────────────────────────────────────────────────────────────
        Class<?> state = Class.forName("com.chess.chessboard.vm.movesinput.CBViewModelStateImpl");
        Method res = ArrowInjector.class.getDeclaredMethod("resolveMembers", Class.class);
        res.setAccessible(true);
        res.invoke(null, state);
        Method setter = (Method) field(ArrowInjector.class, "cachedSetter");
        Method getter = (Method) field(ArrowInjector.class, "cachedGetter");
        Class<?> arrow = (Class<?>) field(ArrowInjector.class, "cachedHintArrowClass");
        check("moveArrows setter", setter != null, setter);
        check("moveArrows getter", getter != null, getter);
        check("HintArrow class", arrow != null, arrow);
        if (args.length > 1) check("setter is the patched method (" + args[1] + ")", setter != null && setter.getName().equals(args[1]), null);
        Class<?> u = Class.forName("com.chess.chessboard.u");
        Object uI = u.getField("a").get(null);
        Method sq = u.getMethod("c", String.class);
        Method newArrow = ArrowInjector.class.getDeclaredMethod("newArrow", Class.class, Object.class, Object.class, int.class, float.class);
        newArrow.setAccessible(true);
        Object ar = newArrow.invoke(null, arrow, sq.invoke(uI, "e2"), sq.invoke(uI, "e4"), 0xFF00C853, 0.85f);
        String as = String.valueOf(ar);
        check("HintArrow instance", as.startsWith("HintArrow("), as);
        check("HintArrow fields", as.contains("color=" + 0xFF00C853) && as.contains("opacity=0.85")
                && as.contains("persistent=false") && as.contains("animated=true"), as);
        check("isEngineArrow recognises our arrow", ArrowInjector.isEngineArrow(ar), null);

        // ── 6. KEY_MOVE_HINTS painter injection ────────────────────────────────────────
        Class<?> opt = Class.forName("com.chess.internal.utils.chessboard.ChessBoardViewOptionalPainterType");
        Object[] out = StockfishExtension.ensureHintArrowsEnabled((Object[]) Array.newInstance(opt, 0));
        check("KEY_MOVE_HINTS injected", out.length == 1 && "KEY_MOVE_HINTS".equals(String.valueOf(out[0])), Arrays.toString(out));

        // ── 7. Ad-Free premium object ──────────────────────────────────────────────────
        Object diamond = StockfishExtension.getPremiumStatusObject(null);
        check("PremiumStatus.DIAMOND", "DIAMOND".equals(String.valueOf(diamond)), diamond);

        // ── 8. Lichess daily puzzle -> Chess.com proto objects ─────────────────────────────
        // (network is not reachable in the harness, so the built-in fallback puzzle is used,
        //  which runs exactly the same proto construction code)
        Object resp = app.prathxm.chess.extension.lichesspuzzle.LichessPuzzleExtension.getDailyPuzzle("2026-09-27", null);
        check("GetDailyPuzzleResponse built", resp != null && resp.getClass().getName().endsWith("GetDailyPuzzleResponse"), resp);
        check("daily puzzle has PGN + hearts", String.valueOf(resp).contains("pgn=") && String.valueOf(resp).contains("999999"), resp);
        Object sub = app.prathxm.chess.extension.lichesspuzzle.LichessPuzzleExtension.submitDailyPuzzleAction(123L, null, null);
        check("SubmitDailyPuzzleActionResponse built", sub != null && sub.getClass().getName().endsWith("SubmitDailyPuzzleActionResponse"), sub);

        // Lichess sends UCI solutions; the app's PGN parser rejects bare UCI, so the movetext
        // is converted first. Every case must parse and reach the expected final position.
        Method uciToPgn = app.prathxm.chess.extension.lichesspuzzle.LichessPuzzleExtension.class
                .getDeclaredMethod("uciToPgnMovetext", String.class, List.class);
        uciToPgn.setAccessible(true);
        String[][] puzzleCases = {
                {"1r4k1/6pp/p7/5r2/2pQ4/q4P2/P1P4P/K2R2R1 b - - 1 1", "a3a2 a1a2 f5a5", "1r4k1/6pp/p7/r7/2pQ4/5P2/K1P4P/3R2R1 w"},
                {"r3k2r/pppq1ppp/8/8/8/8/PPPQ1PPP/R3K2R w KQkq - 0 10", "e1c1 e8g8 d2d7", "r4rk1/pppQ1ppp/8/8/8/8/PPP2PPP/2KR3R b"},
                {"8/P6k/8/8/8/8/6pK/8 w - - 0 50", "a7a8q g2g1n h2g1", "Q7/7k/8/8/8/8/8/6K1 b"},
                {"rnbqkbnr/ppp1p1pp/8/3pPp2/8/8/PPPP1PPP/RNBQKBNR w KQkq f6 0 3", "e5f6 g8f6", "rnbqkb1r/ppp1p1pp/5n2/3p4/8/8/PPPP1PPP/RNBQKBNR w"}};
        for (String[] pc : puzzleCases) {
            String mt = (String) uciToPgn.invoke(null, pc[0], Arrays.asList(pc[1].split(" ")));
            String end = null;
            try {
                Object pg = parse.invoke(null, "[FEN \"" + pc[0] + "\"]\n[SetUp \"1\"]\n\n" + mt + " *", true, true, fenTypeC);
                List<?> pMoves = (List<?>) pg.getClass().getMethod("b").invoke(pg);
                Object lastMv = pMoves.get(pMoves.size() - 1);
                end = StockfishExtension.extractFen(lastMv.getClass().getMethod("b").invoke(lastMv));
            } catch (Throwable e) { end = "parse error: " + e.getCause(); }
            check("Lichess UCI solution parses (" + pc[1] + ")", end != null && end.startsWith(pc[2]), mt + " -> " + end);
        }

        // ── 9. Custom titles ──────────────────────────────────────────────────────────
        Class<?> palette = Class.forName("com.chess.palette.compose.component.ChessTitle");
        check("palette ChessTitle enum", palette.isEnum() && palette.getEnumConstants().length > 0, palette.getEnumConstants().length);

        // ── 10. "Arrows only on my turn": user side from the board's Side enum ──────────────
        Class<?> sideCls = Class.forName("com.chess.chessboard.vm.movesinput.Side");
        for (Object sd : sideCls.getEnumConstants()) {
            String n = ((Enum<?>) sd).name();
            Boolean w = StockfishExtension.sideToWhite(sd);
            Boolean expected = "WHITE".equals(n) ? Boolean.TRUE : "BLACK".equals(n) ? Boolean.FALSE : null;
            check("Side." + n + " -> " + expected, java.util.Objects.equals(w, expected), w);
        }
        // Real CBViewModelStateImpl whose sideToPlaySelfEffects returns Side.BLACK.
        Object sideBlack = Enum.valueOf((Class<Enum>) sideCls, "BLACK");
        Class<?> fn0 = Class.forName("kotlin.jvm.functions.Function0");
        Object sideFn = java.lang.reflect.Proxy.newProxyInstance(fn0.getClassLoader(), new Class<?>[]{fn0},
                (p, m, a) -> "invoke".equals(m.getName()) ? sideBlack : null);
        Object stateObj = null;
        for (Constructor<?> k : state.getConstructors()) {
            Class<?>[] kp = k.getParameterTypes();
            if (kp.length == 4 && kp[2] == fn0) {
                Object registry = kp[3].getConstructor().newInstance();
                stateObj = k.newInstance(start, false, sideFn, registry);
            }
        }
        check("CBViewModelStateImpl instance", stateObj != null, null);
        check("isUserWhite(state playing BLACK) == false", Boolean.FALSE.equals(StockfishExtension.isUserWhite(stateObj)),
                stateObj != null ? StockfishExtension.isUserWhite(stateObj) : null);

        // ── 10b. Full FEN from the app position (real half-move clock / move number) ───────
        String full0 = StockfishExtension.fullFen(start);
        check("fullFen(start) via variants.d.o()", "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1".equals(full0), full0);
        Object after8 = moves.get(7).getClass().getMethod("b").invoke(moves.get(7));
        String full8 = StockfishExtension.extractFen(after8);
        check("extractFen after 4...Nf6 has move number 5", full8 != null && full8.endsWith(" w kq - 2 5"), full8);
        check("sanitizeFen rejects garbage", StockfishExtension.sanitizeFen("8/8 w - - 0 1") == null
                && StockfishExtension.sanitizeFen("8/8/8/8/8/8/8/8 x - - 0 1") == null, null);

        // ── 10c. Eval bar orientation reads getFlipBoard() ─────────────────────────────
        check("isBoardFlipped(state) uses getFlipBoard", stateObj != null && !OverlayManager.isBoardFlipped(stateObj), null);

        // ── 10d. Fair-play screen lists: every listed class exists in this APK ──────────
        for (String setName : new String[]{"ONLINE_GAME_ACTIVITIES", "OFFLINE_BOARD_ACTIVITIES"}) {
            @SuppressWarnings("unchecked")
            java.util.Set<String> names = (java.util.Set<String>) field(StockfishExtension.class, setName);
            List<String> missing = new ArrayList<>();
            for (String n : names) {
                try { Class.forName(n, false, Harness.class.getClassLoader()); } catch (Throwable e) { missing.add(n); }
            }
            check(setName + " all exist in the app", missing.isEmpty(), missing);
        }
        check("live game is online", StockfishExtension.isOnlineGameActivity("com.chess.realchess.ui.game.RealGameActivity"), null);
        check("Chess TV is online", StockfishExtension.isOnlineGameActivity("com.chess.chesstv.ChessTvActivity"), null);
        check("bot game is offline", !StockfishExtension.isOnlineGameActivity("com.chess.features.versusbots.game.BotGameActivityV2"), null);
        check("coach game is offline", !StockfishExtension.isOnlineGameActivity("com.chess.features.guidedcoachgame.GuidedCoachGameActivity"), null);
        check("finished live game is offline", !StockfishExtension.isOnlineGameActivity("com.chess.features.live.archive.ArchivedLiveGameActivity"), null);

        // ── 10e. Move toast deduction, eval bar scale, engine info label ─────────────────
        check("promotion deduced as a7a8q", "a7a8q".equals(MoveClassifier.deduceUciMove("8/P7/8/8/8/8/8/k6K w", "Q7/8/8/8/8/8/8/k6K b")), null);
        check("castling deduced as e1g1", "e1g1".equals(MoveClassifier.deduceUciMove("r3k2r/8/8/8/8/8/8/R3K2R w", "r3k2r/8/8/8/8/8/8/R4RK1 b")), null);
        check("eval bar scale", EvalBarView.ratioFor(0f) == 0.5f && EvalBarView.ratioFor(99f) == 1f
                && EvalBarView.ratioFor(1f) > 0.55f && "0.4".equals(EvalBarView.formatScore(-0.4f)), EvalBarView.ratioFor(1f));
        check("engine info label", "d22 \u00B7 +0.35".equals(OverlayManager.formatEngineInfo(22, 0.35f, false, 0))
                && "d18 \u00B7 -M2".equals(OverlayManager.formatEngineInfo(18, -97f, true, -2)),
                OverlayManager.formatEngineInfo(22, 0.35f, false, 0));

        // ── 10f. Offline opening book: name + Book moves in the local review ─────────────
        check("opening book loaded", OpeningBook.size() > 3000, OpeningBook.size());
        OpeningBook.Match ruy = OpeningBook.lookup(OpeningBook.START_PLACEMENT + " w KQkq - 0 1",
                Arrays.asList("e2e4", "e7e5", "g1f3", "b8c6", "f1b5", "a7a6", "b5a4", "g8f6", "e1g1", "h7h6", "h2h4"));
        check("book: Ruy Lopez line named", ruy != null && ruy.name.startsWith("Ruy Lopez") && ruy.eco.startsWith("C"),
                ruy != null ? ruy.eco + " " + ruy.name + " /" + ruy.bookPlies : null);
        check("book: theory plies counted (castling as e1g1)", ruy != null && ruy.bookPlies >= 9 && ruy.bookPlies < 11, ruy != null ? ruy.bookPlies : null);
        check("book: non-standard start never matches",
                OpeningBook.lookup("8/8/8/8/8/8/8/K6k w - - 0 1", Arrays.asList("e2e4")) == null, null);
        check("book: random first move has no name", OpeningBook.lookup(OpeningBook.START_PLACEMENT + " w KQkq - 0 1",
                Arrays.asList("h2h4", "h7h5", "a2a4", "a7a5", "h1h3", "h8h6", "h3a3")) == null
                || OpeningBook.lookup(OpeningBook.START_PLACEMENT + " w KQkq - 0 1",
                Arrays.asList("h2h4", "h7h5", "a2a4", "a7a5", "h1h3", "h8h6", "h3a3")).bookPlies < 7, null);
        Class<?> openingCls = t.agd("$OpeningInfo");
        Object oi = openingCls.getConstructor(String.class, String.class, float.class).newInstance("Ruy Lopez", "", 0.3f);
        check("OpeningInfo instance", String.valueOf(oi).contains("name=Ruy Lopez"), oi);
        check("AnalyzedGameData takes an OpeningInfo", Arrays.asList(at).contains(openingCls), null);
        Class<?> amc = Class.forName("com.chess.compengine.AnalysisMoveClassification");
        // The review maps AnalyzedPosition.classification with com.chess.compengine.a.a(Companion, String)
        // (f1.H in 4.10.17); every classification string the extension emits must resolve.
        Class<?> amcCompanion = Class.forName("com.chess.compengine.AnalysisMoveClassification$a");
        Method fromString = Class.forName("com.chess.compengine.a").getMethod("a", amcCompanion, String.class);
        Object companion = amc.getField("a").get(null);
        boolean bookMapped = "BOOK".equals(String.valueOf(fromString.invoke(null, companion, ReviewMath.BOOK)));
        List<String> unmapped = new ArrayList<>();
        for (String c : new String[]{ReviewMath.BOOK, ReviewMath.BRILLIANT, ReviewMath.GREAT, ReviewMath.BEST,
                ReviewMath.EXCELLENT, ReviewMath.GOOD, ReviewMath.INACCURACY, ReviewMath.MISTAKE,
                ReviewMath.BLUNDER, ReviewMath.MISS, ReviewMath.FORCED}) {
            if (fromString.invoke(null, companion, c) == null) unmapped.add(c);
        }
        check("every review classification string maps to the app enum", unmapped.isEmpty(), unmapped);
        check("\"book\" string maps to AnalysisMoveClassification.BOOK", bookMapped, null);
        // Report card: f1.f maps CategoryRating.category via f1.W and parses performance as a
        // classification. Every category we emit must map, and every performance must parse.
        Method catW = Class.forName("com.chess.gamereview.v2.f1").getDeclaredMethod("W", String.class);
        catW.setAccessible(true);
        List<String> badCats = new ArrayList<>();
        for (String c : new String[]{"Opening", "Middlegame", "Endgame", "Tactics"}) if (catW.invoke(null, c) == null) badCats.add(c);
        check("report-card categories map to ReportCardCategory", badCats.isEmpty(), badCats);
        List<String> badPerf = new ArrayList<>();
        for (int pct = 0; pct <= 100; pct += 5) {
            String perf = ReviewMath.performance(pct);
            if (fromString.invoke(null, companion, perf) == null) badPerf.add(pct + "=" + perf);
        }
        check("report-card performance parses as a classification", badPerf.isEmpty(), badPerf);
        String sum = ReviewMath.summary(91.24f, 78.4f, new int[11], new int[]{0,0,0,0,0,0,0,0,2,0,1}, "Ruy Lopez");
        check("report-card summary", sum.startsWith("Ruy Lopez") && sum.contains("91.2%") && sum.contains("0\u20133"), sum);
        // Live move toasts: FEN-key history after 1.e4 e5 2.Nf3 Nc6 3.Bb5 (from board placements)
        List<String> keys = Arrays.asList(
                "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w",
                "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b",
                "rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w",
                "rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b",
                "r1bqkbnr/pppp1ppp/2n5/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R w",
                "r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R b");
        OpeningBook.Match live = MoveClassifier.bookMatch(keys);
        check("live toast: 3.Bb5 is Book (Ruy Lopez)", live != null && live.name.startsWith("Ruy Lopez"), live != null ? live.name : null);
        List<String> offBook = new ArrayList<>(keys);
        offBook.set(5, "r1bqkbnr/pppp1ppp/2n5/4p3/4P2P/5N2/PPPP1PP1/RNBQKB1R b");
        check("live toast: 3.h4 is not Book", MoveClassifier.bookMatch(offBook) == null, null);
        check("book only replaces non-errors", ReviewMath.isBookEligible(ReviewMath.EXCELLENT)
                && !ReviewMath.isBookEligible(ReviewMath.BLUNDER) && !ReviewMath.isBookEligible(ReviewMath.MISTAKE), null);

        // ── 11. Game Review through the app's REAL coroutine / Flow machinery ───────────────
        // The Game Review flow is wrapped in kotlinx flow{} (SafeCollector) and collected by
        // runBlocking on another thread, exactly like the app. Before the fix this reproduced the
        // blank review: the flow never completed (or failed "Flow invariant is violated").
        check("FlowBridge COROUTINE_SUSPENDED", "COROUTINE_SUSPENDED".equals(String.valueOf(FlowBridge.suspended())), FlowBridge.suspended());
        FlowHarness.run(t, flow, completed, standard, Harness::check);

        System.out.println(fails == 0 ? "ALL CHECKS PASSED" : (fails + " CHECK(S) FAILED"));
        System.exit(fails == 0 ? 0 : 1);
    }

    private static Object field(Class<?> c, String name) throws Exception {
        Field f = c.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(null);
    }
}
