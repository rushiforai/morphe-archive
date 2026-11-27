package dev.srwi.gintype.extension.multiglide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import dev.srwi.gintype.extension.multiglide.MultiGlideGeometry.KeySpec;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import dev.srwi.gintype.extension.multiglide.MultiGlideWordSession.DecodePort;
import dev.srwi.gintype.extension.multiglide.MultiGlideWordSession.EditorAdapter;
import dev.srwi.gintype.extension.multiglide.MultiGlideWordSession.LifecycleCallbacks;
import dev.srwi.gintype.extension.multiglide.MultiGlideWordSession.SettingsSnapshot;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

/**
 * Pure-JVM behavioral test suite verifying MultiGlide's Gboard integration specification
 * (MG-01 through MG-19) in {@code docs/multiglide-integration.md}.
 */
public class MultiGlideIntegrationTest {

    private MultiGlideWordSession session;
    private FakeEditor editor;
    private RecordingCallbacks callbacks;

    // Coordinates derived from standard QWERTZ geometry (1080x800 -> keyW=108, rowH=200)
    private float letterAX;
    private float letterAY;
    private float letterSX;
    private float letterSY;
    private float letterLX;
    private float letterLY;
    private float spaceX;
    private float spaceY;
    private float backspaceX;
    private float backspaceY;
    private float shiftX;
    private float shiftY;
    private float periodX;
    private float periodY;

    @Before
    public void setUp() {
        session = new MultiGlideWordSession();
        MultiGlideGeometry base = MultiGlideGeometry.createStandardLayout(1080f, 800f, true);
        List<KeySpec> specs = new ArrayList<>(base.allKeysSnapshot());
        // Add explicit non-letter keys along row 2 & bottom row (row 3: y=700)
        specs.add(new KeySpec('\0', 54f, 500f, 108f, 200f));    // Shift (left of y)
        specs.add(new KeySpec('\0', 1026f, 500f, 108f, 200f));  // Backspace (right of m)
        specs.add(new KeySpec('.', 810f, 700f, 108f, 200f));    // Period
        specs.add(new KeySpec('\0', 540f, 700f, 432f, 200f));   // Space (>= 2.5 * 108)
        session.geometry.setKeys(specs, base.keyWidthPx, base.keyHeightPx, false);

        KeySpec a = key('a');
        KeySpec s = key('s');
        KeySpec l = key('l');
        letterAX = a.centerX;
        letterAY = a.centerY;
        letterSX = s.centerX;
        letterSY = s.centerY;
        letterLX = l.centerX;
        letterLY = l.centerY;
        shiftX = 54f;
        shiftY = 500f;
        backspaceX = 1026f;
        backspaceY = 500f;
        periodX = 810f;
        periodY = 700f;
        spaceX = 540f;
        spaceY = 700f;

        editor = new FakeEditor();
        callbacks = new RecordingCallbacks();
    }

    private KeySpec key(char c) {
        KeySpec k = session.geometry.nearestLetterKey(0, 0);
        for (KeySpec candidate : session.geometry.allKeysSnapshot()) {
            if (candidate.character == c) {
                return candidate;
            }
        }
        return k;
    }

    @Test
    public void disabledFeatureBypassesAllHooksAndWordSession() {
        session.sawMultiTouch = true;
        session.multiGlideTakeoverActive = true;
        session.multiGlideWordActive = true;

        assertFalse(session.shouldStartGesture(false, false, false));
        assertTrue(session.shouldStartGesture(false, true, false));
        assertFalse(session.resolveLetterStarted(false, false));
        assertTrue(session.resolveLetterStarted(false, true));
        assertFalse(session.shouldReceiveEventsDuringOtherOwner(false));
        assertFalse(session.shouldSuppressBasicHandler(false, false));
        assertFalse(session.shouldSuppressRolloverCommit(
                false, true, true, 100L, letterLX, letterLY, true, letterAX, letterAY));
    }

    @Test
    public void singleFingerSwipeAndSpaceStayOnStockGboard() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort neverCalled = (tokens, prevWord) -> {
            throw new AssertionError("Decoder must not run on single-finger swipe");
        };

        // Single-finger swipe across a -> s -> l
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1020L, session.geometry);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1050L, session.geometry);
        session.onActionUp(1060L, settings, editor, neverCalled, callbacks);

        assertFalse(session.shouldInterceptGestureDispatch());
        assertFalse(session.multiGlideTakeoverActive);
        assertFalse(session.multiGlideWordActive);
        assertEquals(Boolean.FALSE, callbacks.lastTrailAccent);
        assertEquals("single_touch_swipe", callbacks.lastSkippedReason);

        // Space tap stays on stock Gboard
        editor.stockType("als ");
        session.onActionDown(0, spaceX, spaceY, 1300L, settings, editor, callbacks);
        session.onActionUp(1340L, settings, editor, neverCalled, callbacks);
        assertFalse(session.shouldInterceptGestureDispatch());
    }

    @Test
    public void rolloverMultiTouchWithoutSwipeStaysOnStockGboard() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort neverCalled = (tokens, prevWord) -> {
            throw new AssertionError("Decoder must not run on tap-only rollover");
        };

        // Tap 0 on 'a', pointer 1 overlaps on 'l', both lift without exceeding swipe threshold
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1040L);
        session.onPointerUp(0, letterAX + 2f, letterAY, 1080L, true, callbacks);
        session.onActionUp(1110L, settings, editor, neverCalled, callbacks);

        assertFalse(session.shouldInterceptGestureDispatch());
        assertFalse(session.multiGlideWordActive);
        assertEquals("rollover_no_swipe", callbacks.lastSkippedReason);
    }

    @Test
    public void singleTouchCombineLeavesStockTextIntactWhenZeroCandidates() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort emptyDecoder = (tokens, prevWord) -> Collections.emptyList();

        // Stroke 1: single-finger swipe "Hallo" -> stock commits "Hallo"
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1040L, session.geometry);
        session.onActionUp(1050L, settings, editor, emptyDecoder, callbacks);
        editor.stockType("Hallo");

        // Stroke 2 within timeout: single-finger swipe yielding 0 candidates -> stock must remain untouched
        session.onActionDown(0, letterSX, letterSY, 1120L, settings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1160L, session.geometry);
        session.onActionUp(1170L, settings, editor, emptyDecoder, callbacks);

        assertFalse(session.shouldInterceptGestureDispatch());
        assertFalse(session.multiGlideTakeoverActive);
        assertFalse(session.multiGlideWordActive);
        assertEquals("Hallo", editor.text());
    }

    @Test
    public void autoSpaceOffRetainsBestMatchAndTokensWhenAdditionalSwipeYieldsZeroCandidates() {
        SettingsSnapshot autoSpaceOff = new SettingsSnapshot(true, false, 300, 150);
        List<Integer> decodeTokenCounts = new ArrayList<>();
        DecodePort conditionalDecoder = (tokens, prevWord) -> {
            decodeTokenCounts.add(tokens.size());
            if (tokens.size() >= 3) {
                return Collections.singletonList(cand("Hallowelt", 1f));
            }
            return Collections.emptyList();
        };

        // 1) Stock 1-finger swipe "Hallo"
        session.onActionDown(0, letterAX, letterAY, 1000L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1040L, session.geometry);
        session.onActionUp(1050L, autoSpaceOff, editor, conditionalDecoder, callbacks);
        editor.stockType("Hallo");

        // 2) Second 1-finger swipe yields 0 candidates -> with Auto-Space OFF, MultiGlide takes over,
        // suppresses stock dispatch (preventing "Hallo <word2>"), keeps "Hallo", and retains both tokens.
        session.onActionDown(0, letterSX, letterSY, 3000L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 3050L, session.geometry);
        session.onActionUp(3060L, autoSpaceOff, editor, conditionalDecoder, callbacks);

        assertTrue(session.shouldInterceptGestureDispatch());
        assertTrue(session.multiGlideWordActive);
        assertEquals("Hallo", editor.text());
        assertEquals(2, session.wordTokens.size());
        assertEquals("Hallo", session.currentComposingWord);

        // 3) Third swipe appends onto the retained 2 tokens and resolves when candidates appear.
        session.onActionDown(0, letterAX, letterAY, 5000L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 5050L, session.geometry);
        session.onActionUp(5060L, autoSpaceOff, editor, conditionalDecoder, callbacks);

        assertEquals(3, (int) decodeTokenCounts.get(decodeTokenCounts.size() - 1));
        assertEquals("Hallowelt", editor.text());

        // 4) Subsequent 4th swipe returning 0 candidates keeps "Hallowelt" and retains all 4 tokens.
        DecodePort emptyDecoder = (tokens, prevWord) -> Collections.emptyList();
        session.onActionDown(0, letterSX, letterSY, 7000L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 7050L, session.geometry);
        session.onActionUp(7060L, autoSpaceOff, editor, emptyDecoder, callbacks);

        assertTrue(session.shouldInterceptGestureDispatch());
        assertEquals("Hallowelt", editor.text());
        assertEquals(4, session.wordTokens.size());
    }

    @Test
    public void pureTapsWithoutSwipeStayOnStockEvenWithAutoSpaceOff() {
        SettingsSnapshot autoSpaceOff = new SettingsSnapshot(true, false, 300, 150);
        DecodePort neverCalled = (tokens, prevWord) -> {
            throw new AssertionError("Pure tap sequence without swipes must not invoke Kinetica");
        };

        long ts = 1000L;
        char[] taps = new char[] { 'h', 'a', 'l', 'l', 'o' };
        for (char c : taps) {
            KeySpec k = key(c);
            session.onActionDown(0, k.centerX, k.centerY, ts, autoSpaceOff, editor, callbacks);
            session.onActionUp(ts + 30L, autoSpaceOff, editor, neverCalled, callbacks);
            editor.stockType(String.valueOf(c));
            ts += 2000L; // Long pause > any timeout
        }

        assertFalse(session.shouldInterceptGestureDispatch());
        assertFalse(session.multiGlideWordActive);
        assertEquals("hallo", editor.text());
    }

    @Test
    public void motionHandlerHooksProtectMultiTouchAndKeepFreshActionDown() {
        // Fresh single tap: ACTION_DOWN is never suppressed on BasicMotionEventHandler
        assertFalse(session.shouldSuppressBasicHandler(true, true));
        assertFalse(session.shouldInterceptGestureDispatch());
        assertFalse(session.shouldInterceptGestureReset());

        // Simulating simultaneous two-thumb tap on letters within 220ms -> suppresses premature rollover commit
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150);
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        assertTrue(session.shouldSuppressRolloverCommit(
                true, true, true, 1120L, letterLX, letterLY, true, letterAX, letterAY));
        // Outside 220ms window or on non-letter key -> do not suppress rollover commit
        assertFalse(session.shouldSuppressRolloverCommit(
                true, true, true, 1300L, letterLX, letterLY, true, letterAX, letterAY));
        assertFalse(session.shouldSuppressRolloverCommit(
                true, true, true, 1120L, spaceX, spaceY, true, letterAX, letterAY));

        // Once finger 1 joins and swipes: hooks activate takeover, protect B(), block dispatch & BasicHandler moves
        session.onPointerDown(1, letterLX, letterLY, 1050L);
        assertTrue(session.resolveLetterStarted(true, false));
        assertTrue(session.shouldReceiveEventsDuringOtherOwner(true));
        session.activePointers.get(1).addPoint(letterSX, letterSY, 1080L, session.geometry);
        assertTrue(session.shouldStartGesture(true, false, false));
        assertTrue(session.shouldInterceptGestureDispatch());
        assertTrue(session.shouldInterceptGestureReset());
        assertTrue(session.shouldSuppressBasicHandler(true, false));
        // Fresh ACTION_DOWN remains unsuppressed even while takeover flag was set prior to reset
        assertFalse(session.shouldSuppressBasicHandler(true, true));
    }

    @Test
    public void autoSpaceOffCombinesPassiveTapsAndSwipeAcrossLongPauses() {
        SettingsSnapshot autoSpaceOff = new SettingsSnapshot(true, false, 300, 150);
        List<Integer> decodedTokenCounts = new ArrayList<>();
        DecodePort decoder = (tokens, prevWord) -> {
            decodedTokenCounts.add(tokens.size());
            return Collections.singletonList(cand("hallo", 1f));
        };

        // Tap 'h' and 'a' separately with a 2500ms pause (well above MAX_PASSIVE_TAP_GAP_MS=750ms)
        KeySpec h = key('h');
        KeySpec a = key('a');
        session.onActionDown(0, h.centerX, h.centerY, 1000L, autoSpaceOff, editor, callbacks);
        session.onActionUp(1030L, autoSpaceOff, editor, decoder, callbacks);
        editor.stockType("h");

        session.onActionDown(0, a.centerX, a.centerY, 3530L, autoSpaceOff, editor, callbacks);
        session.onActionUp(3560L, autoSpaceOff, editor, decoder, callbacks);
        editor.stockType("a");

        assertTrue(decodedTokenCounts.isEmpty());
        assertEquals("ha", editor.text());

        // Swipe 'llo' with 2 fingers 4 seconds later -> rolls back stock "ha" and decodes full word (4 tokens)
        session.onActionDown(0, letterLX, letterLY, 7560L, autoSpaceOff, editor, callbacks);
        session.onPointerDown(1, letterSX, letterSY, 7580L);
        session.activePointers.get(0).addPoint(key('o').centerX, key('o').centerY, 7620L, session.geometry);
        session.onPointerUp(0, key('o').centerX, key('o').centerY, 7630L, true, callbacks);
        session.onActionUp(7650L, autoSpaceOff, editor, decoder, callbacks);

        assertEquals(1, decodedTokenCounts.size());
        assertEquals(4, (int) decodedTokenCounts.get(0));
        assertEquals("Hallo", editor.text()); // Start of field -> capitalized
        assertFalse(session.autospaceTimerPending);
    }

    @Test
    public void tapToMultiGlideDelayControlsPassiveTapPrefixPromotionWhenAutoSpaceOn() {
        // When tapToMultiGlideDelayMs == 0 and singleTouchCombineDelayMs == 0,
        // tapped "so" is NOT merged into a following 2-finger MultiGlide "sicher".
        SettingsSnapshot tapCombineOff = new SettingsSnapshot(true, true, 300, 0, true, false, 0);
        List<Integer> decodedTokenCounts = new ArrayList<>();
        DecodePort decoder = (tokens, prevWord) -> {
            decodedTokenCounts.add(tokens.size());
            return Collections.singletonList(cand("sicher", 1f));
        };

        KeySpec s = key('s');
        KeySpec o = key('o');
        session.onActionDown(0, s.centerX, s.centerY, 1000L, tapCombineOff, editor, callbacks);
        session.onActionUp(1030L, tapCombineOff, editor, decoder, callbacks);
        editor.stockType("s");

        session.onActionDown(0, o.centerX, o.centerY, 1100L, tapCombineOff, editor, callbacks);
        session.onActionUp(1130L, tapCombineOff, editor, decoder, callbacks);
        editor.stockType("o");

        // 2-finger MultiGlide immediately (120ms later) -> stays two words: "so sicher"
        session.onActionDown(0, letterSX, letterSY, 1250L, tapCombineOff, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1270L);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1300L, session.geometry);
        session.onPointerUp(0, letterLX, letterLY, 1310L, true, callbacks);
        session.onActionUp(1330L, tapCombineOff, editor, decoder, callbacks);

        assertEquals(1, decodedTokenCounts.size());
        assertEquals(2, (int) decodedTokenCounts.get(0));
        assertEquals("so sicher", editor.text());

        // With custom tapToMultiGlideDelayMs = 200ms, a 250ms pause does NOT merge "so" into "sicher"
        session.onActionCancel(callbacks);
        editor = new FakeEditor();
        decodedTokenCounts.clear();
        SettingsSnapshot shortTapWindow = new SettingsSnapshot(true, true, 300, 0, true, false, 200);

        session.onActionDown(0, s.centerX, s.centerY, 2000L, shortTapWindow, editor, callbacks);
        session.onActionUp(2030L, shortTapWindow, editor, decoder, callbacks);
        editor.stockType("s");

        session.onActionDown(0, o.centerX, o.centerY, 2100L, shortTapWindow, editor, callbacks);
        session.onActionUp(2130L, shortTapWindow, editor, decoder, callbacks);
        editor.stockType("o");

        session.onActionDown(0, letterSX, letterSY, 2380L, shortTapWindow, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 2400L);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 2430L, session.geometry);
        session.onPointerUp(0, letterLX, letterLY, 2440L, true, callbacks);
        session.onActionUp(2460L, shortTapWindow, editor, decoder, callbacks);

        assertEquals(1, decodedTokenCounts.size());
        assertEquals(2, (int) decodedTokenCounts.get(0));
        assertEquals("so sicher", editor.text());
    }

    @Test
    public void autoSpaceOffCombinesSequentialStrokesAcrossLongPausesUntilSpaceOrNavigation() {
        // Even with combineDelayMs=0 stored, Auto-Space OFF ignores timeouts and combines until Space/Nav.
        SettingsSnapshot autoSpaceOff = new SettingsSnapshot(true, false, 300, 0);
        List<Integer> tokenCounts = new ArrayList<>();
        DecodePort decoder = (tokens, prevWord) -> {
            tokenCounts.add(tokens.size());
            return Collections.singletonList(cand("hallowelt", 1f));
        };

        // 1) First 1-finger swipe -> handled by stock Gboard ("Hallo")
        session.onActionDown(0, key('h').centerX, key('h').centerY, 1000L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(key('o').centerX, key('o').centerY, 1080L, session.geometry);
        session.onActionUp(1090L, autoSpaceOff, editor, decoder, callbacks);
        assertFalse(session.shouldInterceptGestureDispatch());
        editor.stockType("Hallo");

        // 2) Wait 5 seconds (long pause), then 2nd 1-finger swipe -> combines via Kinetica
        session.onActionDown(0, key('w').centerX, key('w').centerY, 6100L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(key('t').centerX, key('t').centerY, 6160L, session.geometry);
        session.onActionUp(6180L, autoSpaceOff, editor, decoder, callbacks);

        assertTrue(session.shouldInterceptGestureDispatch());
        assertEquals(1, tokenCounts.size());
        assertEquals(2, (int) tokenCounts.get(0));
        assertEquals("Hallowelt", editor.text());
        assertFalse(session.autospaceTimerPending);

        // 3) Pressing Space ends the word boundary; subsequent 1-finger swipe returns to stock Gboard!
        session.onActionDown(0, spaceX, spaceY, 7000L, autoSpaceOff, editor, callbacks);
        session.onActionUp(7030L, autoSpaceOff, editor, decoder, callbacks);
        editor.finishComposingAndCommitSpace();

        tokenCounts.clear();
        session.onActionDown(0, key('n').centerX, key('n').centerY, 7200L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(key('u').centerX, key('u').centerY, 7260L, session.geometry);
        session.onActionUp(7280L, autoSpaceOff, editor, decoder, callbacks);
        assertFalse(session.shouldInterceptGestureDispatch());
        assertTrue(tokenCounts.isEmpty());

        // 4) Cursor navigation also clears combination state when Auto-Space is OFF
        editor.simulateCursorMoveTo("Moved here");
        session.onActionDown(0, key('w').centerX, key('w').centerY, 9000L, autoSpaceOff, editor, callbacks);
        session.activePointers.get(0).addPoint(key('t').centerX, key('t').centerY, 9050L, session.geometry);
        session.onActionUp(9070L, autoSpaceOff, editor, decoder, callbacks);
        assertFalse(session.shouldInterceptGestureDispatch());
    }

    @Test
    public void wordContinuationRespectsDelayWhenAutoSpaceOnAndHasNoTimeoutWhenOff() {
        DecodePort decoder = (tokens, prevWord) -> Collections.singletonList(
                cand("w" + tokens.size(), 1f));

        // Auto-Space ON (delay 200ms -> cutoff 280ms): second stroke after 600ms starts a new word
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 200, 150);
        performTwoFingerSwipe(1000L, onSettings, decoder);
        assertTrue(session.multiGlideWordActive);
        assertTrue(session.autospaceTimerPending);
        session.finalizeAutospace(true, editor, callbacks); // simulates timer expiry at 1200ms
        assertFalse(session.multiGlideWordActive);
        assertEquals("W2 ", editor.text());

        // Without timer expiry, gap > 200 + 80ms also breaks continuation when Auto-Space ON
        editor.reset();
        performTwoFingerSwipe(2000L, onSettings, decoder);
        session.autospaceTimerPending = false; // timer already cleared or not pending
        boolean continuedAfterExpiry = session.onActionDown(
                0, letterAX, letterAY, 2500L, onSettings, editor, callbacks);
        assertFalse(continuedAfterExpiry);

        // Auto-Space OFF: continuation stays open across a 10-second pause until explicit boundary
        editor.reset();
        SettingsSnapshot offSettings = new SettingsSnapshot(true, false, 200, 150);
        performTwoFingerSwipe(1000L, offSettings, decoder);
        assertTrue(session.multiGlideWordActive);
        boolean continuedLongPause = session.onActionDown(
                0, letterLX, letterLY, 11_000L, offSettings, editor, callbacks);
        assertTrue(continuedLongPause);
        session.activePointers.get(0).addPoint(letterAX, letterAY, 11_050L, session.geometry);
        session.onActionUp(11_060L, offSettings, editor, decoder, callbacks);
        assertEquals("W3", editor.text());

        // Tapping outside letter area breaks continuation
        boolean continuedOnSpace = session.onActionDown(
                0, spaceX, spaceY, 11_200L, offSettings, editor, callbacks);
        assertFalse(continuedOnSpace);
    }

    @Test
    public void prependsLeadingSpaceAfterStockWordWhenAutoSpaceOn() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        editor.stockType("es");
        DecodePort decoder = (tokens, prevWord) ->
                Collections.singletonList(cand("dir", 1f));

        performTwoFingerSwipe(1000L, onSettings, decoder);
        assertEquals("es dir", editor.text());

        // Auto-Space OFF: does NOT auto-insert a leading space
        editor.reset();
        editor.stockType("es");
        SettingsSnapshot offSettings = new SettingsSnapshot(true, false, 300, 150);
        performTwoFingerSwipe(2000L, offSettings, decoder);
        assertEquals("esdir", editor.text());
    }

    @Test
    public void autospaceCommitsSpaceAndRetractsBeforeHuggingPunctuation() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort decoder = (tokens, prevWord) ->
                Collections.singletonList(cand("hallo", 1f));

        performTwoFingerSwipe(1000L, onSettings, decoder);
        assertTrue(session.autospaceTimerPending);
        assertTrue(callbacks.autospaceScheduled);

        session.finalizeAutospace(true, editor, callbacks);
        assertEquals("Hallo ", editor.text());
        assertTrue(session.autospaceInserted);

        // Next touch hits hugging punctuation '.' -> retracts trailing space!
        session.onActionDown(0, periodX, periodY, 1500L, onSettings, editor, callbacks);
        assertFalse(session.autospaceInserted);
        assertEquals("Hallo", editor.text());
    }

    @Test
    public void backspaceCompoundAttachmentWorksInShortAndLongTextsAndIgnoresCursorMoves() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort seitenDecoder = (tokens, prevWord) ->
                Collections.singletonList(cand("Seiten", 1f));
        DecodePort leisteDecoder = (tokens, prevWord) ->
                Collections.singletonList(cand("Leiste", 1f));

        // 1) Short text: stock "Seiten " -> Backspace -> Shift -> MultiGlide "Leiste" = "Seitenleiste" (MG-13)
        editor.stockType("Seiten ");
        assertEquals("Seiten ", editor.text());

        session.onActionDown(0, backspaceX, backspaceY, 1400L, onSettings, editor, callbacks);
        session.onActionUp(1430L, onSettings, editor, seitenDecoder, callbacks);
        editor.simulateBackspace();
        assertEquals("Seiten", editor.text());

        // Optional Shift tap between Backspace and next word keeps Backspace attachment armed
        session.onActionDown(0, shiftX, shiftY, 1460L, onSettings, editor, callbacks);
        session.onActionUp(1490L, onSettings, editor, seitenDecoder, callbacks);

        performTwoFingerSwipe(1550L, onSettings, leisteDecoder);
        assertEquals("Seitenleiste", editor.text());
        assertEquals("leiste", callbacks.lastAlternatives.get(0));

        // 2) Long text (>= 256 chars sliding window): Backspace shrinks within fixed 256-char window
        StringBuilder longPrefix = new StringBuilder();
        for (int i = 0; i < 270; i++) {
            longPrefix.append((char) ('a' + (i % 26)));
        }
        String prefix = longPrefix.toString();
        editor.simulateCursorMoveTo(prefix + "Seiten ");
        // Tap Backspace once while snapshot is saturated at 256 chars
        session.onActionDown(0, backspaceX, backspaceY, 2000L, onSettings, editor, callbacks);
        session.onActionUp(2030L, onSettings, editor, leisteDecoder, callbacks);
        editor.simulateBackspace();

        performTwoFingerSwipe(2100L, onSettings, leisteDecoder);
        assertEquals(prefix + "Seitenleiste", editor.text());

        // 3) Negative: cursor repositioning in textbox WITHOUT Backspace must NOT suppress space
        editor.reset();
        editor.stockType("Hallo ");
        // Cursor jumps after "Seiten" without Backspace key press
        editor.simulateCursorMoveTo("Hallo Seiten");
        performTwoFingerSwipe(3000L, onSettings, leisteDecoder);
        assertEquals("Hallo Seiten Leiste", editor.text());

        // 4) Negative: Spacebar cursor swipe over "Seiten " -> "Seiten" must NOT suppress space
        editor.reset();
        editor.stockType("Seiten ");
        session.onActionDown(0, spaceX, spaceY, 4000L, onSettings, editor, callbacks);
        session.onActionUp(4050L, onSettings, editor, leisteDecoder, callbacks);
        editor.simulateCursorMoveTo("Seiten");
        performTwoFingerSwipe(4100L, onSettings, leisteDecoder);
        assertEquals("Seiten Leiste", editor.text());

        // 5) Negative: Auto-Space OFF placed after existing word WITHOUT Backspace must NOT force lowercase
        editor.reset();
        editor.simulateCursorMoveTo("Seiten");
        SettingsSnapshot offSettings = new SettingsSnapshot(true, false, 300, 150);
        performTwoFingerSwipe(5000L, offSettings, leisteDecoder);
        assertEquals("SeitenLeiste", editor.text());
    }

    @Test
    public void capitalizesSentenceStartsAndNewlinesUnlessAttachingAfterBackspace() {
        assertTrue(MultiGlideWordSession.shouldCapitalizeFirstLetter(""));
        assertTrue(MultiGlideWordSession.shouldCapitalizeFirstLetter("Hallo. "));
        assertTrue(MultiGlideWordSession.shouldCapitalizeFirstLetter("Erste Zeile\n"));
        assertTrue(MultiGlideWordSession.shouldCapitalizeFirstLetter("Frage?  "));
        assertTrue(MultiGlideWordSession.shouldCapitalizeFirstLetter("Achtung! "));
        assertFalse(MultiGlideWordSession.shouldCapitalizeFirstLetter("Hallo "));

        assertEquals("Hallo", MultiGlideWordSession.capitalizeFirstChar("hallo"));
        assertEquals("leiste", MultiGlideWordSession.lowercaseFirstChar("Leiste"));
        assertFalse(MultiGlideWordSession.isAttachingAfterDeletion("Seiten", true, true));
        assertFalse(MultiGlideWordSession.isAttachingAfterDeletion("Seiten", false, false));
        assertTrue(MultiGlideWordSession.isAttachingAfterDeletion("Seiten", false, true));
    }

    @Test
    public void respectsShiftCapsLockAndUnshiftedStateAcrossMultiGlideWords() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort decoder = (tokens, prevWord) -> Arrays.asList(cand("haus", 1f), cand("haut", 0.9f));

        // 1) Mid-sentence with one-shot Shift: capitalizes first letter of bestWord & alternatives
        editor.reset();
        editor.simulateCursorMoveTo("ich habe ");
        performTwoFingerSwipeWithCaps(1000L, onSettings, decoder, MultiGlideWordSession.CapsMode.SHIFT);
        assertEquals("ich habe Haus", editor.text());
        assertEquals(Arrays.asList("Haus", "Haut"), callbacks.lastAlternatives);
        session.finalizeAutospace(true, editor, callbacks);

        // 2) Mid-sentence with Caps Lock: uppercases entire word & alternatives
        editor.reset();
        editor.simulateCursorMoveTo("ich habe ");
        performTwoFingerSwipeWithCaps(2000L, onSettings, decoder, MultiGlideWordSession.CapsMode.CAPS_LOCK);
        assertEquals("ich habe HAUS", editor.text());
        assertEquals(Arrays.asList("HAUS", "HAUT"), callbacks.lastAlternatives);
        session.finalizeAutospace(true, editor, callbacks);

        // 3) Sentence start with Shift explicitly turned OFF (NONE): stays lowercase
        editor.reset();
        performTwoFingerSwipeWithCaps(3000L, onSettings, decoder, MultiGlideWordSession.CapsMode.NONE);
        assertEquals("haus", editor.text());
        assertEquals(Arrays.asList("haus", "haut"), callbacks.lastAlternatives);
        session.finalizeAutospace(true, editor, callbacks);

        // 4) Backspace -> Shift -> Word: attaches without space, and respects explicit Shift
        editor.reset();
        DecodePort leisteDecoder = (tokens, prev) -> Collections.singletonList(cand("Leiste", 1f));
        editor.simulateCursorMoveTo("Seiten ");
        session.onActionDown(0, backspaceX, backspaceY, 4000L, onSettings, editor, callbacks,
                MultiGlideWordSession.CapsMode.NONE);
        editor.simulateBackspace();
        session.onActionUp(4050L, onSettings, editor, leisteDecoder, callbacks);
        performTwoFingerSwipeWithCaps(4200L, onSettings, leisteDecoder, MultiGlideWordSession.CapsMode.SHIFT);
        assertEquals("SeitenLeiste", editor.text());
        session.finalizeAutospace(true, editor, callbacks);

        // 5) Passive tap prefix with Shift ('h' -> "H") followed by unshifted swipe: preserves SHIFT
        editor.reset();
        editor.simulateCursorMoveTo("ich habe ");
        session.onActionDown(0, letterAX, letterAY, 5000L, onSettings, editor, callbacks,
                MultiGlideWordSession.CapsMode.SHIFT);
        editor.stockType("H");
        session.onActionUp(5040L, onSettings, editor, decoder, callbacks);
        // Second stroke is multi-touch swipe after Gboard unshifted
        performTwoFingerSwipeWithCaps(5120L, onSettings, decoder, MultiGlideWordSession.CapsMode.NONE);
        assertEquals("ich habe Haus", editor.text());
        session.finalizeAutospace(true, editor, callbacks);

        // 6) Short 2-letter word ("es") with Shift and Caps Lock, plus overlapping Shift -> letter pointer down
        DecodePort esDecoder = (tokens, prev) -> Collections.singletonList(cand("es", 1f));
        editor.reset();
        editor.simulateCursorMoveTo("ich habe ");
        performTwoFingerSwipeWithCaps(6000L, onSettings, esDecoder, MultiGlideWordSession.CapsMode.SHIFT);
        assertEquals("ich habe Es", editor.text());
        session.finalizeAutospace(true, editor, callbacks);

        editor.reset();
        editor.simulateCursorMoveTo("ich habe ");
        performTwoFingerSwipeWithCaps(7000L, onSettings, esDecoder, MultiGlideWordSession.CapsMode.CAPS_LOCK);
        assertEquals("ich habe ES", editor.text());
        session.finalizeAutospace(true, editor, callbacks);

        // Overlapping Shift (non-letter pointer 0 with NONE) + letter pointer 1 (SHIFT active)
        editor.reset();
        editor.simulateCursorMoveTo("ich habe ");
        session.onActionDown(0, backspaceX, backspaceY, 8000L, onSettings, editor, callbacks,
                MultiGlideWordSession.CapsMode.NONE);
        session.onPointerDown(1, letterAX, letterAY, 8015L);
        session.mergeCapsModeOnPointerDown(MultiGlideWordSession.CapsMode.SHIFT);
        session.activePointers.get(1).addPoint(letterSX, letterSY, 8035L, session.geometry);
        session.onPointerUp(0, backspaceX, backspaceY, 8045L, true, callbacks);
        session.onActionUp(8065L, onSettings, editor, esDecoder, callbacks);
        assertEquals("ich habe Es", editor.text());
        session.finalizeAutospace(true, editor, callbacks);

        // 7) Gboard live keyboard-state bitmask mapping (Lqce / Lqaz constants)
        assertEquals(MultiGlideWordSession.CapsMode.NONE,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x0L));
        assertEquals(MultiGlideWordSession.CapsMode.NONE,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x100L)); // COMPOSING only
        assertEquals(MultiGlideWordSession.CapsMode.SHIFT,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x1L)); // auto SHIFT
        assertEquals(MultiGlideWordSession.CapsMode.SHIFT,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x41L)); // MANUAL_SHIFT
        assertEquals(MultiGlideWordSession.CapsMode.CAPS_LOCK,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x3L)); // SHIFT_LOCK (double-tap Shift)
        assertEquals(MultiGlideWordSession.CapsMode.CAPS_LOCK,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x60000000000L)); // CAPS_LOCK
        assertEquals(MultiGlideWordSession.CapsMode.SHIFT,
                GboardMultiGlideRuntime.capsModeFromKeyboardState(0x20000000000L)); // CAPS
    }

    private void performTwoFingerSwipeWithCaps(
            long t0,
            SettingsSnapshot settings,
            DecodePort decoder,
            MultiGlideWordSession.CapsMode capsMode
    ) {
        session.onActionDown(0, letterAX, letterAY, t0, settings, editor, callbacks, capsMode);
        session.onPointerDown(1, letterLX, letterLY, t0 + 20L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, t0 + 40L, session.geometry);
        session.onPointerUp(0, letterSX, letterSY, t0 + 50L, true, callbacks);
        session.onActionUp(t0 + 70L, settings, editor, decoder, callbacks);
    }

    @Test
    public void notifiesThiccTopBarListenerOnPreviewAndCommit() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort decoder = (tokens, prevWord) -> {
            List<WordCandidate> out = new ArrayList<>();
            out.add(cand("seite", 1f));
            out.add(cand("saite", 0.9f));
            return out;
        };

        performTwoFingerSwipe(1000L, onSettings, decoder);
        assertEquals(1, callbacks.decodedWords.size());
        assertEquals("Seite", callbacks.decodedWords.get(0));
        assertEquals(2, callbacks.lastAlternatives.size());
        assertEquals("Saite", callbacks.lastAlternatives.get(1));

        session.finalizeAutospace(true, editor, callbacks);
        assertEquals(1, callbacks.committedWords.size());
        assertEquals("Seite", callbacks.committedWords.get(0));
        assertTrue(callbacks.lastCommitAutoSpace);
    }

    @Test
    public void spacebarTimerIndicatorNotifiesBufferAndAutospaceTimers() {
        SettingsSnapshot passiveOnlySettings = new SettingsSnapshot(true, true, 300, 0);
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        SettingsSnapshot offSettings = new SettingsSnapshot(true, false, 300, 150);
        DecodePort decoder = (tokens, prevWord) -> Collections.singletonList(cand("Hallo", 10.0f));

        // 1. Pure single-touch tap does NOT start a spacebar / word-ready timer
        session.onActionDown(0, letterAX, letterAY, 1000L, passiveOnlySettings, editor, callbacks);
        assertEquals(0L, callbacks.lastBufferTimerMs);
        session.onPointerUp(0, letterAX, letterAY, 1020L, false, callbacks);
        session.onActionUp(1020L, passiveOnlySettings, editor, decoder, callbacks);
        assertEquals(0L, callbacks.lastBufferTimerMs);
        assertEquals(0, callbacks.wordReadyTimerElapsedCount);

        // 2. Next ACTION_DOWN cancels active buffer timer; single-touch swipe starts combine window (150 ms)
        session.onActionDown(0, letterAX, letterAY, 1100L, onSettings, editor, callbacks);
        assertEquals(0L, callbacks.lastBufferTimerMs);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1130L, session.geometry);
        session.onPointerUp(0, letterSX, letterSY, 1150L, true, callbacks);
        session.onActionUp(1150L, onSettings, editor, decoder, callbacks);
        assertEquals(150L, callbacks.lastBufferTimerMs);

        // 3. MultiGlide word schedules autospace timer and commits with autospaceInserted = true
        session.onActionCancel(callbacks);
        assertEquals(0L, callbacks.lastBufferTimerMs);
        performTwoFingerSwipe(2000L, onSettings, decoder);
        assertTrue(callbacks.autospaceScheduled);
        assertEquals(300L, callbacks.lastAutospaceDelayMs);
        session.finalizeAutospace(true, editor, callbacks);
        assertTrue(callbacks.lastCommitAutoSpace);
        assertEquals(1, callbacks.wordReadyTimerElapsedCount);

        // 4. With Auto-Space disabled, no buffer timer or autospace timer is started
        callbacks.autospaceScheduled = false;
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 3000L, offSettings, editor, callbacks);
        session.onPointerUp(0, letterAX, letterAY, 3020L, false, callbacks);
        session.onActionUp(3020L, offSettings, editor, decoder, callbacks);
        assertEquals(0L, callbacks.lastBufferTimerMs);
        performTwoFingerSwipe(3200L, offSettings, decoder);
        assertFalse(callbacks.autospaceScheduled);
    }

    @Test
    public void wordReadyTimerAndSpacebarIndicatorAlignAcrossAllTimers() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        SettingsSnapshot beforeWordSettings = new SettingsSnapshot(
                true, true, 300, 150, true, true, 750, "last_input");
        DecodePort decoder = (tokens, prevWord) -> Collections.singletonList(cand("Hallo", 10.0f));

        // 1. Single tap (even with combineDelay=150 and tapToMultiGlideDelay=750) does NOT start spacebar or word-ready timer
        session.onActionDown(0, letterAX, letterAY, 1000L, onSettings, editor, callbacks);
        editor.stockType("a");
        session.onPointerUp(0, letterAX, letterAY, 1020L, false, callbacks);
        session.onActionUp(1020L, onSettings, editor, decoder, callbacks);
        assertEquals(0L, callbacks.lastBufferTimerMs);
        assertEquals(0, callbacks.wordReadyTimerElapsedCount);

        // 2. Stock single-finger swipe notifies word-ready elapsed on finalize (both before-word and after-word)
        session.onActionCancel(callbacks);
        editor.reset();
        callbacks.wordReadyTimerElapsedCount = 0;
        session.onActionDown(0, letterAX, letterAY, 2000L, beforeWordSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 2030L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 2050L, true, callbacks);
        session.onActionUp(2050L, beforeWordSettings, editor, decoder, callbacks);
        assertTrue(callbacks.stockSwipeAutospaceScheduled);
        assertEquals(150L, callbacks.lastBufferTimerMs);
        session.finalizeStockSwipeAutospace(true, true, editor, callbacks);
        assertEquals(1, callbacks.wordReadyTimerElapsedCount);

        // 3. last_input Backspace falling back to PassiveTapBuffer (only taps left) clears timers
        session.onActionCancel(callbacks);
        editor.reset();
        session.onActionDown(0, letterAX, letterAY, 3000L, beforeWordSettings, editor, callbacks);
        editor.stockType("f");
        session.onPointerUp(0, letterAX, letterAY, 3020L, false, callbacks);
        session.onActionUp(3020L, beforeWordSettings, editor, decoder, callbacks);
        performTwoFingerSwipe(3200L, beforeWordSettings, decoder);
        assertTrue(callbacks.autospaceScheduled);
        // First Backspace removes the latest token (tap 'l' at 3220ms); second removes the swipe (3200ms),
        // restoring tap prefix "f" to PassiveTapBuffer without starting a word-finalizing timer.
        assertTrue(performBackspaceTap(3400L, beforeWordSettings, decoder));
        assertTrue(performBackspaceTap(3500L, beforeWordSettings, decoder));
        assertEquals(0L, callbacks.lastBufferTimerMs);
    }

    @Test
    public void singleFingerStockSwipeAppendsAutospaceOnlyWhenAutoSpaceEnabled() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        SettingsSnapshot offSettings = new SettingsSnapshot(true, false, 300, 150);
        DecodePort decoder = (tokens, prevWord) -> Collections.emptyList();

        // 1. Pure tap does NOT schedule stock-swipe autospace
        editor.reset();
        session.onActionDown(0, letterAX, letterAY, 1000L, onSettings, editor, callbacks);
        editor.stockType("a");
        session.onPointerUp(0, letterAX, letterAY, 1020L, false, callbacks);
        session.onActionUp(1020L, onSettings, editor, decoder, callbacks);
        assertFalse(callbacks.stockSwipeAutospaceScheduled);
        session.finalizeStockSwipeAutospace(true, editor);
        assertEquals("a", editor.text());

        // 2. Single-finger swipe schedules stock-swipe autospace and appends " " + supports eatBefore
        editor.reset();
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 2000L, onSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 2030L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 2050L, true, callbacks);
        session.onActionUp(2050L, onSettings, editor, decoder, callbacks);
        assertTrue(callbacks.stockSwipeAutospaceScheduled);
        assertEquals(150L, callbacks.lastStockSwipeAutospaceDelayMs);
        session.finalizeStockSwipeAutospace(true, editor);
        assertEquals("Hallo ", editor.text());
        assertTrue(session.autospaceInserted);

        // Punctuation eatBefore retracts the appended space
        session.onActionDown(0, periodX, periodY, 2250L, onSettings, editor, callbacks);
        assertEquals("Hallo", editor.text());

        // Spacebar after autospace preserves the trailing space (allowing multiple spaces)
        // and converts a fast double-tap into ". " only when Gboard's double-space period is enabled
        editor.reset();
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 2500L, onSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 2530L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 2550L, true, callbacks);
        session.onActionUp(2550L, onSettings, editor, decoder, callbacks);
        session.finalizeStockSwipeAutospace(true, editor);
        assertEquals("Hallo ", editor.text());
        assertTrue(session.autospaceInserted);
        // 1st Space tap (simulating BasicMotionEventHandler claiming tap -> onActionCancel)
        // keeps existing space and adds another -> "Hallo  "
        session.onActionDown(0, spaceX, spaceY, 2750L, onSettings, editor, callbacks);
        session.onActionCancel(callbacks);
        editor.finishComposingAndCommitSpace();
        assertEquals("Hallo  ", editor.text());
        assertFalse(session.autospaceInserted);
        // Fast 2nd Space tap within 500ms replaces "  " with "." on ACTION_DOWN before Gboard commits " " -> "Hallo. "
        session.onActionDown(0, spaceX, spaceY, 2900L, onSettings, editor, callbacks);
        session.onActionCancel(callbacks);
        editor.finishComposingAndCommitSpace();
        assertEquals("Hallo. ", editor.text());

        // When Gboard's double-space-period setting is disabled, fast double-tap stays spaces
        SettingsSnapshot noDoublePeriodSettings = new SettingsSnapshot(true, true, 300, 150, false);
        editor.reset();
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 5000L, noDoublePeriodSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 5030L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 5050L, true, callbacks);
        session.onActionUp(5050L, noDoublePeriodSettings, editor, decoder, callbacks);
        session.finalizeStockSwipeAutospace(true, editor);
        session.onActionDown(0, spaceX, spaceY, 5200L, noDoublePeriodSettings, editor, callbacks);
        session.onPointerUp(0, spaceX, spaceY, 5230L, true, callbacks);
        session.onActionUp(5230L, noDoublePeriodSettings, editor, decoder, callbacks);
        editor.finishComposingAndCommitSpace();
        session.onActionDown(0, spaceX, spaceY, 5350L, noDoublePeriodSettings, editor, callbacks);
        session.onPointerUp(0, spaceX, spaceY, 5380L, true, callbacks);
        session.onActionUp(5380L, noDoublePeriodSettings, editor, decoder, callbacks);
        editor.finishComposingAndCommitSpace();
        assertEquals("Hallo   ", editor.text());

        // 3. Guard: if stock Gboard already ended with space, do not append a second space
        editor.reset();
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 3000L, onSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 3030L, session.geometry);
        editor.stockType("Hallo ");
        session.onPointerUp(0, letterSX, letterSY, 3050L, true, callbacks);
        session.onActionUp(3050L, onSettings, editor, decoder, callbacks);
        session.finalizeStockSwipeAutospace(true, editor);
        assertEquals("Hallo ", editor.text());

        // 4. With Auto-Space disabled, single-finger swipe does NOT schedule or append space
        editor.reset();
        callbacks.stockSwipeAutospaceScheduled = false;
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 4000L, offSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 4030L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 4050L, true, callbacks);
        session.onActionUp(4050L, offSettings, editor, decoder, callbacks);
        assertFalse(callbacks.stockSwipeAutospaceScheduled);
        session.finalizeStockSwipeAutospace(false, editor);
        assertEquals("Hallo", editor.text());
    }

    @Test
    public void colonAfterLayoutSwitchRetractsAutospace() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort decoder = (tokens, prev) -> Collections.emptyList();

        // Swipe "Hallo" -> autospace appends " "
        session.onActionDown(0, letterAX, letterAY, 1000L, onSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1030L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 1050L, true, callbacks);
        session.onActionUp(1050L, onSettings, editor, decoder, callbacks);
        session.finalizeStockSwipeAutospace(true, editor);
        assertEquals("Hallo ", editor.text());
        assertTrue(session.autospaceInserted);

        // Tap layout-switch / modifier key (?123 at bottom-left, x=100, y=700) without changing editor text
        List<KeySpec> withSymbolsKey = new ArrayList<>(session.geometry.allKeysSnapshot());
        withSymbolsKey.add(new KeySpec('\0', 100f, 700f, 160f, 200f));
        session.geometry.setKeys(withSymbolsKey, session.geometry.keyWidthPx, session.geometry.keyHeightPx, false);
        session.onActionDown(0, 100f, 700f, 1200L, onSettings, editor, callbacks);
        session.onActionCancel(callbacks);
        assertTrue(session.autospaceInserted);

        // Symbols layout exposes ':' key -> tapping ':' retracts trailing space before ':'
        List<KeySpec> symbolSpecs = new ArrayList<>();
        symbolSpecs.add(new KeySpec(':', 702f, 500f, 108f, 200f));
        symbolSpecs.add(new KeySpec('\0', 540f, 700f, 432f, 200f));
        session.geometry.setKeys(symbolSpecs, session.geometry.keyWidthPx, session.geometry.keyHeightPx, false);
        session.onActionDown(0, 702f, 500f, 1350L, onSettings, editor, callbacks);
        assertEquals("Hallo", editor.text());
        assertFalse(session.autospaceInserted);
    }

    @Test
    public void basicHandlerActionDownRetractsAutospaceBeforeColonOnSymbolsLayout() {
        SettingsSnapshot onSettings = new SettingsSnapshot(true, true, 300, 150);
        DecodePort decoder = (tokens, prev) -> Collections.emptyList();

        session.onActionDown(0, letterAX, letterAY, 2000L, onSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 2030L, session.geometry);
        editor.stockType("Hallo");
        session.onPointerUp(0, letterSX, letterSY, 2050L, true, callbacks);
        session.onActionUp(2050L, onSettings, editor, decoder, callbacks);
        session.finalizeStockSwipeAutospace(true, editor);
        assertEquals("Hallo ", editor.text());

        // Control key (?123) preserves autospaceInserted
        session.onBasicHandlerActionDown('\0', editor);
        assertTrue(session.autospaceInserted);

        // Tapping ':' on symbols layout retracts the trailing space immediately before ':' is committed
        session.onBasicHandlerActionDown(':', editor);
        assertEquals("Hallo", editor.text());
        assertFalse(session.autospaceInserted);
    }

    @Test
    public void clearOrphanedActiveTouchesAfterLongPressPopupRelease() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150);

        // Simulate ACTION_DOWN on '.' (punctuation key) where ACTION_UP is consumed by a long-press
        // popup in BasicMotionEventHandler.A(MotionEvent) and never reaches gesture handler g(MotionEvent).
        session.onActionDown(0, 864f, 700f, 1000L, settings, editor, callbacks);
        assertFalse(session.activePointers.isEmpty());

        // Stale event time older than lastActionDownTimeMs must not clear the active touch
        assertFalse(session.clearOrphanedActiveTouches(950L));
        assertFalse(session.activePointers.isEmpty());

        // Touch stream ending at >= lastActionDownTimeMs clears orphaned activePointers
        assertTrue(session.clearOrphanedActiveTouches(1450L));
        assertTrue(session.activePointers.isEmpty());
        assertEquals(1450L, session.lastTouchUpTimeMs);

        // Calling again when already empty is a no-op
        assertFalse(session.clearOrphanedActiveTouches(1500L));
    }

    @Test
    public void autoSpaceBeforeWordUsesGboardStyleWithoutTrailingSpaces() {
        SettingsSnapshot gboardStyle = new SettingsSnapshot(true, true, 300, 150, true, true);
        DecodePort halloDecoder = (tokens, prev) -> Collections.singletonList(cand("Hallo", -1f));
        DecodePort weltDecoder = (tokens, prev) -> Collections.singletonList(cand("Welt", -1f));
        DecodePort emptyDecoder = (tokens, prev) -> Collections.emptyList();

        // 1. Single-finger stock swipe does NOT append trailing space, arms leading space after timer
        session.onActionDown(0, letterAX, letterAY, 1000L, gboardStyle, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1030L, session.geometry);
        editor.stockType("Es");
        session.onPointerUp(0, letterSX, letterSY, 1050L, true, callbacks);
        session.onActionUp(1050L, gboardStyle, editor, emptyDecoder, callbacks);
        session.finalizeStockSwipeAutospace(true, true, editor);
        assertEquals("Es", editor.text());

        // 2. Tapping "so" after the swiped word prepends leading space before 's', NOT before 'o'
        session.onActionDown(0, letterSX, letterSY, 1400L, gboardStyle, editor, callbacks);
        session.onActionCancel(callbacks);
        editor.stockType("s");
        session.onActionDown(0, letterAX, letterAY, 1460L, gboardStyle, editor, callbacks);
        session.onActionCancel(callbacks);
        editor.stockType("o");
        assertEquals("Es so", editor.text());

        // 3. MultiGlide word prepends leading space (MG-11) and commits WITHOUT trailing space
        performTwoFingerSwipe(2000L, gboardStyle, halloDecoder);
        assertEquals("Es so Hallo", editor.text());
        session.finalizeAutospace(true, true, editor, callbacks);
        assertEquals("Es so Hallo", editor.text());
        assertFalse(session.autospaceInserted);
        assertFalse(callbacks.lastCommitAutoSpace);

        // 4. Tapping next word after MultiGlide word also gets leading space
        session.onActionDown(0, letterSX, letterSY, 2600L, gboardStyle, editor, callbacks);
        session.onActionCancel(callbacks);
        editor.stockType("so");
        assertEquals("Es so Hallo so", editor.text());

        // 5. Subsequent MultiGlide word still prepends leading space (MG-11)
        performTwoFingerSwipe(3200L, gboardStyle, weltDecoder);
        session.finalizeAutospace(true, true, editor, callbacks);
        assertEquals("Es so Hallo so Welt", editor.text());
        assertFalse(session.autospaceInserted);
    }

    @Test
    public void backspaceWholeWordModeDeletesPendingAndCommittedWordsPreservingLeadingSpace() {
        SettingsSnapshot wholeWordSettings = new SettingsSnapshot(
                true, true, 300, 150, true, true, 750,
                GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD);
        DecodePort halloDecoder = (tokens, prev) -> Collections.singletonList(cand("Hallo", -1f));
        DecodePort weltDecoder = (tokens, prev) -> Collections.singletonList(cand("Welt", -1f));

        // 1) Pending MultiGlide word after an existing word: "Hallo" -> "Hallo Welt" -> Backspace -> "Hallo "
        editor.stockType("Hallo");
        performTwoFingerSwipe(1000L, wholeWordSettings, weltDecoder);
        assertEquals("Hallo Welt", editor.text());
        assertTrue(session.multiGlideWordActive);

        performBackspaceTap(1150L, wholeWordSettings, weltDecoder);
        assertEquals("Hallo ", editor.text());
        assertFalse(session.multiGlideWordActive);

        // Next MultiGlide word after "Hallo " does NOT trigger MG-13 compound attachment
        performTwoFingerSwipe(1500L, wholeWordSettings, weltDecoder);
        assertEquals("Hallo Welt", editor.text());

        // 2) Committed MultiGlide word (after autospace timer expires): Backspace still deletes whole word
        session.finalizeAutospace(true, true, editor, callbacks);
        assertEquals("Hallo Welt", editor.text());
        assertFalse(session.multiGlideWordActive);

        performBackspaceTap(2000L, wholeWordSettings, weltDecoder);
        assertEquals("Hallo ", editor.text());

        // 3) After-word autospace mode (trailing space appended): deletes word + trailing space in one tap
        editor.reset();
        SettingsSnapshot afterWordSettings = new SettingsSnapshot(
                true, true, 300, 150, true, false, 750,
                GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD);
        performTwoFingerSwipe(3000L, afterWordSettings, halloDecoder);
        session.finalizeAutospace(true, false, editor, callbacks);
        assertEquals("Hallo ", editor.text());
        performBackspaceTap(3500L, afterWordSettings, halloDecoder);
        assertEquals("", editor.text());
    }

    @Test
    public void backspaceLastInputModeRemovesLatestStartTimeTokenAndRestoresTapPrefix() {
        SettingsSnapshot lastInputSettings = new SettingsSnapshot(
                true, false, 300, 150, true, true, 750,
                GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT);
        DecodePort multiDecoder = (tokens, prev) -> {
            if (tokens.size() >= 2) {
                return Arrays.asList(cand("Automütz", -1f), cand("Automobil", -2f));
            }
            return Arrays.asList(cand("Auto", -1f), cand("Autos", -2f));
        };

        // 1) Overlapping two-finger swipe where pointer 1 started later than pointer 0
        session.onActionDown(0, letterAX, letterAY, 1000L, lastInputSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1040L, session.geometry);
        session.onPointerDown(1, letterLX, letterLY, 1080L);
        session.activePointers.get(1).addPoint(letterAX, letterAY, 1120L, session.geometry);
        session.onPointerUp(0, letterSX, letterSY, 1130L, true, callbacks);
        session.onActionUp(1150L, lastInputSettings, editor, multiDecoder, callbacks);
        assertEquals("Automütz", editor.text());
        assertTrue(session.multiGlideWordActive);

        // Backspace removes only the later-started token (pointer 1) and keeps "Auto" active + updates Thicc Top Bar
        performBackspaceTap(1250L, lastInputSettings, multiDecoder);
        assertEquals("Auto", editor.text());
        assertTrue(session.multiGlideWordActive);
        assertEquals(1, session.wordTokens.size());
        assertEquals("Auto", callbacks.decodedWords.get(callbacks.decodedWords.size() - 1));

        // User can immediately continue swiping the remaining word (MG-10)
        DecodePort bahnDecoder = (tokens, prev) -> Collections.singletonList(cand("Autobahn", -1f));
        session.onActionDown(0, letterLX, letterLY, 1400L, lastInputSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterAX, letterAY, 1440L, session.geometry);
        session.onActionUp(1460L, lastInputSettings, editor, bahnDecoder, callbacks);
        assertEquals("Autobahn", editor.text());

        // 2) After commit (with Auto-Space ON), last_input falls back to whole-word deletion (Gboard behavior)
        SettingsSnapshot lastInputAutoOn = new SettingsSnapshot(
                true, true, 300, 150, true, true, 750,
                GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT);
        editor.reset();
        performTwoFingerSwipe(1800L, lastInputAutoOn, bahnDecoder);
        assertEquals("Autobahn", editor.text());
        session.finalizeAutospace(true, true, editor, callbacks);
        assertFalse(session.multiGlideWordActive);
        performBackspaceTap(2200L, lastInputAutoOn, bahnDecoder);
        assertEquals("", editor.text());

        // 3) Passive tap prefix ("fn") + swipe ("ktion"): Backspace restores "fn" instead of deleting everything
        editor.reset();
        DecodePort emptyDecoder = (tokens, prev) -> Collections.emptyList();
        DecodePort funktionDecoder = (tokens, prev) -> Collections.singletonList(cand("Funktion", -1f));

        session.onActionDown(0, letterAX, letterAY, 3000L, lastInputSettings, editor, callbacks);
        session.onPointerUp(0, letterAX, letterAY, 3020L, true, callbacks);
        session.onActionUp(3020L, lastInputSettings, editor, emptyDecoder, callbacks);
        editor.stockType("f");

        session.onActionDown(0, letterSX, letterSY, 3050L, lastInputSettings, editor, callbacks);
        session.onPointerUp(0, letterSX, letterSY, 3070L, true, callbacks);
        session.onActionUp(3070L, lastInputSettings, editor, emptyDecoder, callbacks);
        editor.stockType("n");

        performTwoFingerSwipe(3120L, lastInputSettings, funktionDecoder);
        assertEquals("Funktion", editor.text());

        // Remove the swipe? Wait: performTwoFingerSwipe added 2 tokens (tap+swipe), remove latest swipe -> tap+tap+tap?
        // Actually in performTwoFingerSwipe pointer 0 is swipe and pointer 1 is tap (started +20ms later).
        // Let's do a single-finger swipe after "fn" so only 1 swipe token is added on top of the 2 taps:
        editor.reset();
        session.onActionCancel(callbacks);
        session.onActionDown(0, letterAX, letterAY, 4000L, lastInputSettings, editor, callbacks);
        session.onPointerUp(0, letterAX, letterAY, 4020L, true, callbacks);
        session.onActionUp(4020L, lastInputSettings, editor, emptyDecoder, callbacks);
        editor.stockType("f");

        session.onActionDown(0, letterSX, letterSY, 4050L, lastInputSettings, editor, callbacks);
        session.onPointerUp(0, letterSX, letterSY, 4070L, true, callbacks);
        session.onActionUp(4070L, lastInputSettings, editor, emptyDecoder, callbacks);
        editor.stockType("n");

        session.onActionDown(0, letterLX, letterLY, 4120L, lastInputSettings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterAX, letterAY, 4150L, session.geometry);
        session.onActionUp(4170L, lastInputSettings, editor, funktionDecoder, callbacks);
        assertEquals("Funktion", editor.text());

        performBackspaceTap(4250L, lastInputSettings, funktionDecoder);
        assertEquals("fn", editor.text());
        assertFalse(session.multiGlideWordActive);
        assertEquals(2, session.passiveTapBuffer.tokens.size());
    }

    @Test
    public void backspaceAfterSpaceOrSecondTapDeletesSingleCharAndHoldPassesThrough() {
        SettingsSnapshot wholeWordSettings = new SettingsSnapshot(
                true, true, 300, 150, true, true, 750,
                GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD);
        DecodePort halloDecoder = (tokens, prev) -> Collections.singletonList(cand("Hallo", -1f));

        // 1) Whole word deleted on 1st Backspace; 2nd Backspace falls back to Gboard (returns false)
        editor.stockType("Hi");
        performTwoFingerSwipe(1000L, wholeWordSettings, halloDecoder);
        session.finalizeAutospace(true, true, editor, callbacks);
        assertEquals("Hi Hallo", editor.text());

        assertTrue(performBackspaceTap(1500L, wholeWordSettings, halloDecoder));
        assertEquals("Hi ", editor.text());

        assertFalse(performBackspaceTap(1650L, wholeWordSettings, halloDecoder));

        // 2) Space after MultiGlide word clears commit undo -> Backspace does NOT delete "Hallo"
        editor.reset();
        performTwoFingerSwipe(2000L, wholeWordSettings, halloDecoder);
        session.finalizeAutospace(true, true, editor, callbacks);
        session.onActionDown(0, spaceX, spaceY, 2400L, wholeWordSettings, editor, callbacks);
        session.onActionCancel(callbacks);
        editor.stockType(" ");
        assertFalse(performBackspaceTap(2500L, wholeWordSettings, halloDecoder));

        // 3) Long-press / hold (>350ms) on Backspace passes through to stock Gboard
        editor.reset();
        performTwoFingerSwipe(3000L, wholeWordSettings, halloDecoder);
        session.onActionDown(0, backspaceX, backspaceY, 3100L, wholeWordSettings, editor, callbacks);
        assertFalse(session.tryConsumePendingBackspaceTap(
                3600L, backspaceX, backspaceY, wholeWordSettings, editor, halloDecoder, callbacks));
    }

    @Test
    public void nativeTopBarBlankSuppressesQuickAccessAcrossActionUpAndClearsOnCancelOrSpace() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 0, 150, true, true);
        DecodePort decoder = (tokens, prev) -> List.of(
                cand("hallo", 10f), cand("halte", 8f), cand("hals", 6f));

        // 1) Two-finger swipe enables native top-bar blanking on ACTION_UP and keeps it active
        //    even if autospaceDelayMs == 0 commits immediately (until Gboard's onCandidatesUpdated
        //    delivers the 3 alternatives or safety timeout expires).
        performTwoFingerSwipe(1000L, settings, decoder);
        assertEquals(Boolean.TRUE, callbacks.lastNativeTopBarBlank);
        session.finalizeAutospace(true, true, editor, callbacks);
        assertEquals(Boolean.TRUE, callbacks.lastNativeTopBarBlank);

        // 2) Pressing Space clears the blanking immediately.
        session.onActionDown(0, spaceX, spaceY, 1200L, settings, editor, callbacks);
        assertEquals(Boolean.FALSE, callbacks.lastNativeTopBarBlank);
        session.onActionUp(1240L, settings, editor, decoder, callbacks);

        // 3) ACTION_CANCEL also clears native top-bar blanking.
        session.onActionDown(0, letterAX, letterAY, 2000L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 2020L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 2040L, session.geometry);
        session.onActionCancel(callbacks);
        assertEquals(Boolean.FALSE, callbacks.lastNativeTopBarBlank);
    }

    @Test
    public void buildLiveSnapshotTokensCopiesPointsWithoutFinalizingActiveTracks() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150, true, true);
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1020L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1040L, session.geometry);

        List<MultiGlideInputToken> snapshot1 = session.buildLiveSnapshotTokens();
        assertTrue(snapshot1 != null);
        assertTrue(snapshot1.stream().anyMatch(t -> t.kind == MultiGlideInputToken.Kind.SWIPE));
        assertFalse(session.activePointers.get(0).contactsFinalized);

        // Track remains mutable for subsequent ACTION_MOVE points before ACTION_UP, and an
        // overlapped swiping finger held >= RESTING_FINGER_MIN_MS (400ms) is NOT dropped.
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1500L, session.geometry);
        List<MultiGlideInputToken> snapshot2 = session.buildLiveSnapshotTokens();
        assertTrue(snapshot2 != null);
        int pts1 = snapshot1.stream()
                .filter(t -> t.kind == MultiGlideInputToken.Kind.SWIPE)
                .mapToInt(t -> t.points.size()).sum();
        int pts2 = snapshot2.stream()
                .filter(t -> t.kind == MultiGlideInputToken.Kind.SWIPE)
                .mapToInt(t -> t.points.size()).sum();
        assertTrue(pts2 > pts1);
    }

    @Test
    public void buildLiveSnapshotTokensIncludesSingleTouchCombineBufferForQuickSecondSwipe() {
        SettingsSnapshot settings = new SettingsSnapshot(true, true, 300, 150, true, true);
        DecodePort unusedDecoder = (tokens, prev) -> Collections.emptyList();

        // First 1-finger swipe stays on stock Gboard and records into SingleTouchCombineBuffer.
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1020L, session.geometry);
        session.onActionUp(1040L, settings, editor, unusedDecoder, callbacks);
        editor.stockType("as");

        // Second quick 1-finger swipe within 150ms must include the first swipe in live snapshot.
        session.onActionDown(0, letterLX, letterLY, 1100L, settings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1130L, session.geometry);
        assertTrue(session.isLivePreviewEligible(session.multiGlideThresholdPx()));

        List<MultiGlideInputToken> combinedSnapshot = session.buildLiveSnapshotTokens();
        assertTrue(combinedSnapshot != null);
        long swipeCount = combinedSnapshot.stream()
                .filter(t -> t.kind == MultiGlideInputToken.Kind.SWIPE).count();
        assertEquals(2L, swipeCount);
    }

    @Test
    public void pendingLeadingSpacePreservedAcrossShiftTapInAutoSpaceBeforeWordMode() {
        SettingsSnapshot settings = new SettingsSnapshot(
                true, true, 800, 150, false, true, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        DecodePort decoder = (tokens, prev) -> Collections.singletonList(cand("Hallo", 1f));

        performTwoFingerSwipe(1000L, settings, decoder);
        assertEquals("Hallo", editor.text());

        session.finalizeAutospace(true, true, editor, callbacks);
        assertTrue(session.pendingLeadingSpaceBeforeNextWord);

        // User taps Shift before typing a capitalized noun.
        session.onActionDown(0, shiftX, shiftY, 2000L, settings, editor, callbacks);
        session.onActionUp(2040L, settings, editor, decoder, callbacks);
        assertTrue(session.pendingLeadingSpaceBeforeNextWord);

        // Next letter tap must insert the pending leading space -> "Hallo ".
        session.onActionDown(0, letterAX, letterAY, 2100L, settings, editor, callbacks);
        assertEquals("Hallo ", editor.text());
    }

    @Test
    public void backspaceHoldCancelResetsTrailAccentAndTopBarBlanking() {
        SettingsSnapshot settings = new SettingsSnapshot(
                true, true, 800, 150, false, false, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        DecodePort decoder = (tokens, prev) -> Collections.singletonList(cand("Hallo", 1f));

        performTwoFingerSwipe(1000L, settings, decoder);
        assertTrue(session.multiGlideWordActive);

        // Backspace tap begins, then turns into a hold past BACKSPACE_HOLD_TIMEOUT_MS.
        session.onActionDown(0, backspaceX, backspaceY, 1200L, settings, editor, callbacks);
        callbacks.lastTrailAccent = null;
        callbacks.lastNativeTopBarBlank = null;
        session.maybeCancelPendingBackspaceTap(backspaceX, backspaceY, 1200L + 300L, callbacks);

        assertFalse(session.multiGlideWordActive);
        assertFalse(session.multiGlideTakeoverActive);
        assertEquals(Boolean.FALSE, callbacks.lastTrailAccent);
        assertEquals(Boolean.FALSE, callbacks.lastNativeTopBarBlank);
    }

    @Test
    public void multiStrokeCompoundWordAfterBackspaceStaysLowercaseAcrossAllStrokes() {
        SettingsSnapshot settings = new SettingsSnapshot(
                true, true, 800, 150, false, false, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        editor.stockType("Seiten ");

        // Backspace deletes trailing space -> "Seiten", latching MG-13 compound attachment.
        session.onActionDown(0, backspaceX, backspaceY, 1000L, settings, editor, callbacks);
        editor.simulateBackspace();
        session.onActionUp(1040L, settings, editor, (t, p) -> Collections.emptyList(), callbacks);

        // Stroke 1 of MultiGlide compound word ("lei") -> "Seitenlei".
        DecodePort stroke1Decoder = (t, p) -> Collections.singletonList(cand("Lei", 1f));
        performTwoFingerSwipe(1200L, settings, stroke1Decoder);
        assertEquals("Seitenlei", editor.text());

        // Stroke 2 continuing the same MultiGlide word ("Leiste") must stay lowercase -> "Seitenleiste".
        DecodePort stroke2Decoder = (t, p) -> Collections.singletonList(cand("Leiste", 1f));
        performTwoFingerSwipe(1400L, settings, stroke2Decoder);
        assertEquals("Seitenleiste", editor.text());
    }

    @Test
    public void tapToMultiGlideOffWithSingleTouchCombineOnDoesNotMergePureTaps() {
        // singleTouchCombineDelayMs = 150ms (ON), tapToMultiGlideDelayMs = 0ms (OFF)
        SettingsSnapshot settings = new SettingsSnapshot(
                true, true, 800, 150, false, false, 0,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        List<Integer> decodedTokenCounts = new ArrayList<>();
        DecodePort decoder = (tokens, prev) -> {
            decodedTokenCounts.add(tokens.size());
            return Collections.singletonList(cand("sicher", 1f));
        };

        KeySpec s = key('s');
        KeySpec o = key('o');
        session.onActionDown(0, s.centerX, s.centerY, 1000L, settings, editor, callbacks);
        session.onActionUp(1030L, settings, editor, decoder, callbacks);
        editor.stockType("s");

        session.onActionDown(0, o.centerX, o.centerY, 1070L, settings, editor, callbacks);
        session.onActionUp(1100L, settings, editor, decoder, callbacks);
        editor.stockType("o");

        // 2-finger MultiGlide within 80ms (< 150ms) must NOT absorb "so" when tapToMultiGlide is OFF.
        session.onActionDown(0, letterSX, letterSY, 1180L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1200L);
        session.activePointers.get(0).addPoint(letterLX, letterLY, 1220L, session.geometry);
        session.onPointerUp(0, letterLX, letterLY, 1230L, true, callbacks);
        session.onActionUp(1250L, settings, editor, decoder, callbacks);

        assertEquals(1, decodedTokenCounts.size());
        assertEquals(2, (int) decodedTokenCounts.get(0));
        assertEquals("so sicher", editor.text());
    }

    @Test
    public void multiGlideAfterClosingPunctuationPrependsLeadingSpace() {
        SettingsSnapshot settings = new SettingsSnapshot(
                true, true, 800, 150, false, true, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        editor.stockType("Hallo,");
        DecodePort decoder = (tokens, prev) -> Collections.singletonList(cand("Welt", 1f));

        performTwoFingerSwipe(1000L, settings, decoder);
        assertEquals("Hallo, Welt", editor.text());
    }

    @Test
    public void livePreviewMarksPendingEditorWordDuringActiveMultiGlideContinuation() {
        SettingsSnapshot settings = new SettingsSnapshot(
                true, true, 300, 150, false, true, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE);
        editor.stockType("Hello ");
        DecodePort firstDecoder = (tokens, prev) -> Collections.singletonList(cand("could", 1f));

        // First MultiGlide stroke: no pending word in editor yet
        session.onActionDown(0, letterAX, letterAY, 1000L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1020L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1040L, session.geometry);
        assertFalse(session.hasPendingTapPrefixInEditor());
        session.onPointerUp(0, letterSX, letterSY, 1050L, true, callbacks);
        session.onActionUp(1070L, settings, editor, firstDecoder, callbacks);
        assertEquals("Hello could", editor.text());

        // Second stroke within autospace window continues "could" in-place: live preview MUST exclude it
        session.onActionDown(0, letterAX, letterAY, 1180L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1200L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1220L, session.geometry);
        assertTrue(session.multiGlideWordActive);
        assertTrue(session.hasPendingTapPrefixInEditor());

        DecodePort secondDecoder = (tokens, prev) -> Collections.singletonList(cand("condos", 1f));
        session.onPointerUp(0, letterSX, letterSY, 1230L, true, callbacks);
        session.onActionUp(1250L, settings, editor, secondDecoder, callbacks);
        assertEquals("Hello condos", editor.text());

        // After autospace finalizes and a new word starts, live preview MUST NOT exclude the previous word
        session.finalizeAutospace(true, editor, callbacks);
        session.onActionDown(0, letterAX, letterAY, 1700L, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, 1720L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, 1740L, session.geometry);
        assertFalse(session.multiGlideWordActive);
        assertFalse(session.hasPendingTapPrefixInEditor());
    }

    @Test
    public void smartTapSwipeSplitSeparatesShortTappedWordBeforeMultiAndSingleSwipe() {
        SettingsSnapshot splitOn = new SettingsSnapshot(
                true, true, 300, 150, true, false, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE, true);
        DecodePort germanDecoder = new DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                if (tokens.size() > 2) {
                    // Combined "so" + swipe "gut" produces no valid word
                    return Collections.emptyList();
                }
                return Collections.singletonList(cand("gut", 0.65f));
            }

            @Override
            public String activeLanguage() {
                return "de";
            }

            @Override
            public int lookupWordFrequency(String word) {
                return "so".equalsIgnoreCase(word) ? 140 : 0;
            }
        };

        // MG-08: tap "so" then immediate multi-touch swipe "gut" -> "so gut"
        performStockTap('s', 1000L, splitOn, germanDecoder);
        performStockTap('o', 1060L, splitOn, germanDecoder);
        assertEquals("so", editor.text());
        performTwoFingerSwipe(1120L, splitOn, germanDecoder);
        assertEquals("so gut", editor.text());

        // Reset and verify MG-09 (single-touch tap "so" + single-touch swipe "gut") -> "so gut"
        session.finalizeAutospace(true, editor, callbacks);
        assertEquals("so gut ", editor.text());
        performStockTap('s', 2000L, splitOn, germanDecoder);
        performStockTap('o', 2060L, splitOn, germanDecoder);
        performSingleSwipe(2120L, splitOn, germanDecoder);
        assertEquals("so gut so gut", editor.text());
    }

    @Test
    public void smartTapSwipeSplitKeepsValidCombinedWordAndHonorsDisabledToggle() {
        SettingsSnapshot splitOn = new SettingsSnapshot(
                true, true, 300, 150, true, false, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE, true);
        DecodePort combinedWinsDecoder = new DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                return tokens.size() > 2
                        ? Collections.singletonList(cand("sofort", 0.60f))
                        : Collections.singletonList(cand("fort", 0.55f));
            }

            @Override
            public String activeLanguage() {
                return "de";
            }

            @Override
            public int lookupWordFrequency(String word) {
                return "so".equalsIgnoreCase(word) ? 140 : 0;
            }
        };

        // "so" + swipe "fort" stays combined as "Sofort" (capitalized at start of field)
        performStockTap('s', 1000L, splitOn, combinedWinsDecoder);
        performStockTap('o', 1060L, splitOn, combinedWinsDecoder);
        performTwoFingerSwipe(1120L, splitOn, combinedWinsDecoder);
        assertEquals("Sofort", editor.text());

        // With toggle OFF, even when combined fails or is weak, MG-08 combines instead of splitting
        session.finalizeAutospace(true, editor, callbacks);
        editor.reset();
        SettingsSnapshot splitOff = new SettingsSnapshot(
                true, true, 300, 150, true, false, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE, false);
        DecodePort splitWouldWinDecoder = new DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                return tokens.size() > 2
                        ? Collections.singletonList(cand("sogut", 0.05f))
                        : Collections.singletonList(cand("gut", 0.65f));
            }

            @Override
            public int lookupWordFrequency(String word) {
                return 140;
            }
        };
        performStockTap('s', 2000L, splitOff, splitWouldWinDecoder);
        performStockTap('o', 2060L, splitOff, splitWouldWinDecoder);
        performTwoFingerSwipe(2120L, splitOff, splitWouldWinDecoder);
        assertEquals("Sogut", editor.text());
    }

    @Test
    public void smartTapSwipeSplitCutsMidTapPrefixForSheWouldAndKeepsFollowingTapAttached() {
        session.finalizeAutospace(true, editor, callbacks);
        editor.reset();
        SettingsSnapshot splitOn = new SettingsSnapshot(
                true, true, 300, 150, true, false, 750,
                GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE, true);
        DecodePort sheWouldDecoder = new DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                // Combined 5-token ("shew" + swipe) -> weak "shrikes"
                if (tokens.size() >= 5 && tokens.get(0).character == 's') {
                    return Collections.singletonList(cand("shrikes", 0.10f));
                }
                // Split ("w" + swipe) -> "would"
                if (tokens.size() >= 2 && tokens.get(0).character == 'w') {
                    return Collections.singletonList(cand("would", 0.85f));
                }
                return Collections.emptyList();
            }

            @Override
            public String activeLanguage() {
                return "en";
            }

            @Override
            public int lookupWordFrequency(String word) {
                if ("she".equalsIgnoreCase(word)) return 210;
                if ("shew".equalsIgnoreCase(word)) return 2;
                return 0;
            }
        };

        // Tap "s", "h", "e", "w" then swipe "oul" -> splits after "she", keeps "w" + swipe -> "she would"
        performStockTap('s', 1000L, splitOn, sheWouldDecoder);
        performStockTap('h', 1050L, splitOn, sheWouldDecoder);
        performStockTap('e', 1100L, splitOn, sheWouldDecoder);
        performStockTap('w', 1150L, splitOn, sheWouldDecoder);
        assertEquals("shew", editor.text());
        performSingleSwipe(1200L, splitOn, sheWouldDecoder);
        assertEquals("she would", editor.text());
    }

    private void performStockTap(
            char ch,
            long downMs,
            SettingsSnapshot settings,
            DecodePort decoder
    ) {
        KeySpec k = key(ch);
        session.onActionDown(0, k.centerX, k.centerY, downMs, settings, editor, callbacks);
        session.onActionUp(downMs + 30L, settings, editor, decoder, callbacks);
        editor.stockType(String.valueOf(ch));
    }

    private void performSingleSwipe(
            long startMs,
            SettingsSnapshot settings,
            DecodePort decoder
    ) {
        session.onActionDown(0, letterAX, letterAY, startMs, settings, editor, callbacks);
        session.activePointers.get(0).addPoint(letterSX, letterSY, startMs + 30L, session.geometry);
        session.onActionUp(startMs + 60L, settings, editor, decoder, callbacks);
    }

    @Test
    public void singleFingerTapJitterDoesNotForceGestureStartOrInsertSpacesBetweenLetters() {
        SettingsSnapshot gboardStyle = new SettingsSnapshot(true, true, 300, 150, true, true);
        DecodePort decoder = (tokens, prevWord) -> Collections.singletonList(cand("wrong", 1f));

        char[] word = new char[] { 'h', 'a', 'l', 'l', 'o' };
        long t = 1000L;
        for (int i = 0; i < word.length; i++) {
            KeySpec k = key(word[i]);
            session.onActionDown(0, k.centerX, k.centerY, t, gboardStyle, editor, callbacks);
            if (i == 1 || i == 2) {
                // Simulate a ~30px thumb slip inside the key (> multiGlideThresholdPx), while
                // stock Gboard correctly keeps stockShouldStart == false.
                session.activePointers.get(0).addPoint(k.centerX + 30f, k.centerY, t + 20L, session.geometry);
                assertFalse(
                        "Single-finger tap jitter must not force Gboard into swipe mode",
                        session.shouldStartGesture(true, false, false));
            }
            session.onActionUp(t + 40L, gboardStyle, editor, decoder, callbacks);
            editor.stockType(String.valueOf(word[i]));
            assertFalse(
                    "Unconfirmed single-finger tap jitter must not schedule stock swipe autospace",
                    callbacks.stockSwipeAutospaceScheduled);
            assertFalse(
                    "Unconfirmed single-finger tap jitter must not arm leading space before next letter",
                    session.pendingLeadingSpaceBeforeNextWord);
            t += 220L;
        }

        assertTrue("Pure taps with minor jitter must not decode via MultiGlide", callbacks.decodedWords.isEmpty());
        assertEquals("hallo", editor.text());
    }

    @Test
    public void confirmedSingleFingerStockSwipeStillArmsAutoSpaceBeforeNextWord() {
        SettingsSnapshot gboardStyle = new SettingsSnapshot(true, true, 300, 150, true, true);
        DecodePort decoder = (tokens, prevWord) -> Collections.emptyList();

        KeySpec h = key('h');
        KeySpec o = key('o');
        session.onActionDown(0, h.centerX, h.centerY, 1000L, gboardStyle, editor, callbacks);
        session.activePointers.get(0).addPoint(o.centerX, o.centerY, 1080L, session.geometry);
        assertTrue(session.shouldStartGesture(true, true, false));
        session.onActionUp(1100L, gboardStyle, editor, decoder, callbacks);
        editor.stockType("hallo");

        assertTrue(callbacks.stockSwipeAutospaceScheduled);
        session.finalizeStockSwipeAutospace(true, true, editor, callbacks);
        assertTrue(session.pendingLeadingSpaceBeforeNextWord);

        KeySpec w = key('w');
        session.onActionDown(0, w.centerX, w.centerY, 1500L, gboardStyle, editor, callbacks);
        session.onActionUp(1540L, gboardStyle, editor, decoder, callbacks);
        editor.stockType("w");
        assertEquals("hallo w", editor.text());
    }

    private boolean performBackspaceTap(
            long downMs,
            SettingsSnapshot settings,
            DecodePort decoder
    ) {
        session.onActionDown(0, backspaceX, backspaceY, downMs, settings, editor, callbacks);
        boolean handled = session.tryConsumePendingBackspaceTap(
                downMs + 50L, backspaceX, backspaceY, settings, editor, decoder, callbacks);
        session.onActionUp(downMs + 50L, settings, editor, decoder, callbacks);
        return handled;
    }

    private static WordCandidate cand(String word, float score) {
        return new WordCandidate(word, score, 0f, 0f, 0f);
    }

    private void performTwoFingerSwipe(
            long startMs,
            SettingsSnapshot settings,
            DecodePort decoder
    ) {
        session.onActionDown(0, letterAX, letterAY, startMs, settings, editor, callbacks);
        session.onPointerDown(1, letterLX, letterLY, startMs + 20L);
        session.activePointers.get(0).addPoint(letterSX, letterSY, startMs + 40L, session.geometry);
        session.onPointerUp(0, letterSX, letterSY, startMs + 50L, true, callbacks);
        session.onActionUp(startMs + 70L, settings, editor, decoder, callbacks);
    }

    private static final class FakeEditor implements EditorAdapter {
        private final StringBuilder buf = new StringBuilder();
        private int composingStart = -1;

        void reset() {
            buf.setLength(0);
            composingStart = -1;
        }

        void stockType(String s) {
            finishComposing();
            buf.append(s);
        }

        void finishComposingAndCommitSpace() {
            finishComposing();
            buf.append(' ');
        }

        void simulateBackspace() {
            composingStart = -1;
            if (buf.length() > 0) {
                buf.deleteCharAt(buf.length() - 1);
            }
        }

        void simulateCursorMoveTo(String textAtCursor) {
            buf.setLength(0);
            buf.append(textAtCursor);
            composingStart = -1;
        }

        private void finishComposing() {
            composingStart = -1;
        }

        String text() {
            return buf.toString();
        }

        @Override
        public String readTextBeforeCursorSnapshot() {
            int n = Math.min(MultiGlideWordSession.TEXT_SNAPSHOT_CHARS, buf.length());
            return buf.substring(buf.length() - n);
        }

        @Override
        public String readCharBeforeCursor() {
            return buf.length() > 0 ? String.valueOf(buf.charAt(buf.length() - 1)) : "";
        }

        @Override
        public void deleteCharsBeforeCursor(int count) {
            int del = Math.min(count, buf.length());
            if (del > 0) {
                buf.delete(buf.length() - del, buf.length());
            }
            composingStart = -1;
        }

        @Override
        public int previewWord(String word, String baselineBeforeText, boolean prependLeadingSpace) {
            int extraChars = 0;
            if (baselineBeforeText != null) {
                extraChars = MultiGlideWordSession.computeExtraCharsAfterBaseline(
                        baselineBeforeText, readTextBeforeCursorSnapshot());
                if (extraChars > 0) {
                    finishComposing();
                    deleteCharsBeforeCursor(extraChars);
                }
            }
            if (prependLeadingSpace) {
                finishComposing();
                buf.append(' ');
            }
            if (composingStart >= 0) {
                buf.replace(composingStart, buf.length(), word);
            } else {
                composingStart = buf.length();
                buf.append(word);
            }
            return extraChars;
        }

        @Override
        public void commitFinishedWord(String word, boolean appendSpace) {
            finishComposing();
            if (appendSpace) {
                buf.append(' ');
            }
        }

        @Override
        public void commitText(String text) {
            if (text != null && !text.isEmpty()) {
                buf.append(text);
            }
        }
    }

    private static final class RecordingCallbacks implements LifecycleCallbacks {
        Boolean lastTrailAccent;
        Boolean lastNativeTopBarBlank;
        String lastSkippedReason;
        boolean autospaceScheduled;
        long lastAutospaceDelayMs;
        boolean stockSwipeAutospaceScheduled;
        long lastStockSwipeAutospaceDelayMs;
        long lastBufferTimerMs;
        int wordReadyTimerElapsedCount;
        final List<String> decodedWords = new ArrayList<>();
        List<String> lastAlternatives = Collections.emptyList();
        final List<String> committedWords = new ArrayList<>();
        boolean lastCommitAutoSpace;

        @Override public void onTrailAccentChanged(boolean active) { lastTrailAccent = active; }
        @Override public void onNativeTopBarBlankChanged(boolean blank) { lastNativeTopBarBlank = blank; }
        @Override public void onTakeoverActivatedOnFinish() {}
        @Override public void onPointerFinished(int pointerId, boolean isSwipe, boolean inMultiGlideGesture) {}
        @Override public void onClearTrailManagerActive() {}
        @Override public void onScheduleAutospaceTimer(long delayMs) {
            autospaceScheduled = true;
            lastAutospaceDelayMs = delayMs;
        }
        @Override public void onCancelAutospaceTimer() { autospaceScheduled = false; }
        @Override public void onScheduleStockSwipeAutospaceTimer(long delayMs) {
            stockSwipeAutospaceScheduled = true;
            lastStockSwipeAutospaceDelayMs = delayMs;
        }
        @Override public void onCancelStockSwipeAutospaceTimer() { stockSwipeAutospaceScheduled = false; }
        @Override public void onBufferTimerUpdated(long durationMs) { lastBufferTimerMs = durationMs; }
        @Override public void onWordReadyTimerElapsed() { wordReadyTimerElapsedCount++; }

        @Override
        public void onWordDecoded(
                String word,
                List<String> alternatives,
                List<MultiGlideInputToken> tokens,
                boolean capitalizeFirst,
                String prevWord,
                String baseline,
                int promotedPassiveCount,
                int rollbackDeleted,
                int restingDropped,
                List<WordCandidate> candidates
        ) {
            if (word != null) {
                decodedWords.add(word);
                lastAlternatives = alternatives;
            }
        }

        @Override
        public void onWordCommitted(
                String word,
                boolean autospaceInserted,
                String prevWord,
                List<String> alternatives
        ) {
            committedWords.add(word);
            lastCommitAutoSpace = autospaceInserted;
        }

        @Override
        public void onSkippedGesture(
                String reason,
                boolean hasSwipe,
                boolean strokeHadMultiTouch,
                int passiveBufferSize,
                int restingDropped,
                String baseline,
                List<MultiGlideInputToken> completedTokens
        ) {
            lastSkippedReason = reason;
        }
    }
}
