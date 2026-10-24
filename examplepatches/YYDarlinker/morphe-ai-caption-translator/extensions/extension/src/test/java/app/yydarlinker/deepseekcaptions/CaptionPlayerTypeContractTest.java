package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Rect;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The official player-type names mix a compact state with a regular-player animation state. The
 * sliding names contain "MINIMIZED" but are not compact: treating them as compact retracts the
 * caption in the middle of YouTube's detail &lt;-&gt; fullscreen drag and leaves it hidden when the
 * gesture is cancelled.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w1280dp-h1000dp-mdpi")
public class CaptionPlayerTypeContractTest {
    private Activity activity;

    @Before
    public void setUp() {
        CaptionPlayerAuthority.resetForTests();
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        CaptionPlayerAuthority.setOwner(activity);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
    }

    @After
    public void tearDown() {
        activity.finish();
        CaptionPlayerAuthority.resetForTests();
    }

    private void type(String value) {
        CaptionPlayerAuthority.onNotification(value);
    }

    @Test
    public void regularPlayerSlidingBetweenSizesKeepsDisplayPermission() {
        type("WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED");
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
        type("WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN");
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
        type("WATCH_WHILE_FULLSCREEN");
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
    }

    @Test
    public void onlyExactNonPlayingStatesAreCompact() {
        type("WATCH_WHILE_MINIMIZED");
        assertEquals(CaptionPlayerAuthority.COMPACT, CaptionPlayerAuthority.state());
        type("WATCH_WHILE_MAXIMIZED");
        type("WATCH_WHILE_PICTURE_IN_PICTURE");
        assertEquals(CaptionPlayerAuthority.COMPACT, CaptionPlayerAuthority.state());
        type("WATCH_WHILE_MAXIMIZED");
        type("WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED");
        assertEquals(CaptionPlayerAuthority.COMPACT, CaptionPlayerAuthority.state());
        assertTrue(CaptionPlayerAuthority.isCompactType("HIDDEN"));
        assertTrue(CaptionPlayerAuthority.isCompactType("NONE"));
        assertFalse(CaptionPlayerAuthority.isCompactType("WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED"));
        assertFalse(CaptionPlayerAuthority.isCompactType("WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN"));
    }

    @Test
    public void aCompactStateIsReconciledFromTheCurrentPlayerType() {
        type("WATCH_WHILE_MINIMIZED");
        assertEquals(CaptionPlayerAuthority.COMPACT, CaptionPlayerAuthority.state());

        // The callback that would report the regular player again is not guaranteed on re-entry:
        // the player was reused. The bounded resume read is the recovery path, and a settled
        // non-compact type is enough to reopen display without waiting for a layout event.
        CaptionPlayerAuthority.installCurrentPlayerTypeForTests(() -> "WATCH_WHILE_MAXIMIZED");
        assertTrue(CaptionPlayerAuthority.reconcileCurrentPlayerTypeIfUnsettled());
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
        assertTrue(CaptionPlayerAuthority.displayPermitted());
    }

    @Test
    public void aSlidingReconcileStillWaitsForGeometry() {
        type("WATCH_WHILE_MINIMIZED");
        CaptionPlayerAuthority.installCurrentPlayerTypeForTests(
                () -> "WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED");
        assertTrue(CaptionPlayerAuthority.reconcileCurrentPlayerTypeIfUnsettled());
        assertEquals(CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR, CaptionPlayerAuthority.state());
        assertFalse(CaptionPlayerAuthority.displayPermitted());
        CaptionPlayerAuthority.settleRegular();
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
    }

    @Test
    public void aSettledTypeRecoversAStuckSlidingState() {
        type("WATCH_WHILE_MINIMIZED");
        CaptionPlayerAuthority.installCurrentPlayerTypeForTests(
                () -> "WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED");
        CaptionPlayerAuthority.reconcileCurrentPlayerTypeIfUnsettled();
        assertEquals(CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR, CaptionPlayerAuthority.state());

        // The slide ended, but its stable layout event never arrived. The next bounded read of the
        // official type must reopen display instead of leaving the quarantine latched.
        CaptionPlayerAuthority.installCurrentPlayerTypeForTests(() -> "WATCH_WHILE_MAXIMIZED");
        assertTrue(CaptionPlayerAuthority.reconcileCurrentPlayerTypeIfUnsettled());
        assertEquals(CaptionPlayerAuthority.REGULAR, CaptionPlayerAuthority.state());
        assertTrue(CaptionPlayerAuthority.displayPermitted());
    }

    @Test
    public void onlyARegularSizedSurfaceContradictsTheMiniplayerName() {
        // Portrait: the miniplayer is a wide, very short strip; detail/fullscreen is much taller.
        assertFalse(
                CaptionPlayerTransitionGuard.looksLikeRegularPlayer(
                        new Rect(0, 2090, 1212, 2305), 1264, 2736));
        assertTrue(
                CaptionPlayerTransitionGuard.looksLikeRegularPlayer(
                        new Rect(0, 0, 1264, 711), 1264, 2736));
        // Landscape: a floating miniplayer is short; a regular player fills most of the height.
        assertFalse(
                CaptionPlayerTransitionGuard.looksLikeRegularPlayer(
                        new Rect(2000, 800, 2640, 1160), 2736, 1264));
        assertTrue(
                CaptionPlayerTransitionGuard.looksLikeRegularPlayer(
                        new Rect(0, 0, 2460, 1264), 2736, 1264));
        assertFalse(CaptionPlayerTransitionGuard.looksLikeRegularPlayer(null, 1264, 2736));
    }
}
