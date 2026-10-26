package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The caption must not be hosted by the video Surface ancestor: that is the layer YouTube rebuilds
 * and reparents during fullscreen and comment transitions. The visual host is now the topmost
 * player-overlay container, above the controls, so the caption is not covered by the progress bar
 * and its own TextView receives the drag.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w2736dp-h1264dp-mdpi")
public class CaptionStableHostTest {
    private Activity a;
    private FrameLayout content, overlays, captionHost, controls, touchHost;

    @Before
    public void setUp() {
        a = Robolectric.buildActivity(Activity.class).setup().visible().get();
        content = new FrameLayout(a);
        a.setContentView(content);
        overlays = new FrameLayout(a);
        overlays.setId(id("player_overlays"));
        content.addView(overlays, new FrameLayout.LayoutParams(2736, 1264));
        captionHost = new FrameLayout(a);
        captionHost.setId(id("inset_overlay_view_layout"));
        overlays.addView(captionHost, new FrameLayout.LayoutParams(2736, 1264));
        controls = new FrameLayout(a);
        controls.setClickable(true);
        overlays.addView(controls, new FrameLayout.LayoutParams(2736, 1264));
        touchHost = new FrameLayout(a);
        touchHost.setId(id("player_overlays_custom_views_container"));
        overlays.addView(touchHost, new FrameLayout.LayoutParams(2736, 1264));
        layout();
        CaptionSurface.activity(a);
    }

    @After
    public void tearDown() {
        CaptionSurface.activity(null);
        CaptionPlayerAuthority.resetForTests();
        a.finish();
    }

    private int id(String name) {
        return a.getResources().getIdentifier(name, "id", a.getPackageName());
    }

    private void layout() {
        content.measure(
                View.MeasureSpec.makeMeasureSpec(2736, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1264, View.MeasureSpec.EXACTLY));
        content.layout(0, 0, 2736, 1264);
    }

    @Test
    public void theCaptionHostIsTheTopmostPlayerOverlayNotTheControlsLayer() {
        FrameLayout host = CaptionSurface.stableCaptionHost();
        assertNotNull(host);
        assertSame(touchHost, host);
        assertTrue(CaptionSurface.pinnedHost(host));
        assertTrue(CaptionSurface.topmostOverlayHost(host));
        assertTrue(
                "the caption layer must be above the controls in the player overlays",
                overlays.indexOfChild(host) > overlays.indexOfChild(controls));
    }

    @Test
    public void theTouchLayerIsTheSameTopmostContainerWhenItHostsTheCaption() {
        assertSame(touchHost, CaptionSurface.touchHost());
        assertSame(CaptionSurface.stableCaptionHost(), CaptionSurface.touchHost());
    }

    @Test public void closedShortsCannotBeRediscoveredFromAStillAttachedReelContainer() {
        FrameLayout reel = new FrameLayout(a);
        reel.setId(id("reel_player_overlay_root"));
        content.addView(reel, new FrameLayout.LayoutParams(2736, 1264));layout();
        CaptionPlayerAuthority.setOwner(a);CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionSurface.refresh();assertTrue(CaptionSurface.isShorts());
        CaptionPlayerAuthority.noteShortsSurface();assertTrue(CaptionPlayerAuthority.displayPermitted());
        CaptionPlayerAuthority.onShortsStateChanged(false);
        org.junit.Assert.assertFalse(CaptionSurface.isShorts());
        org.junit.Assert.assertFalse(CaptionSurface.shortsSurfaceNow());
        CaptionSurface.refresh();org.junit.Assert.assertFalse(CaptionSurface.isShorts());
        org.junit.Assert.assertFalse(CaptionPlayerAuthority.displayPermitted());
    }
    @Test public void aPositiveReadyEventCanRevalidateShortsAfterAnEarlierNegativeProbeN75() {
        FrameLayout reel=new FrameLayout(a);reel.setId(id("reel_player_overlay_root"));
        content.addView(reel,new FrameLayout.LayoutParams(2736,1264));reel.setVisibility(View.GONE);layout();
        CaptionPlayerAuthority.setOwner(a);CaptionPlayerAuthority.onShortsStateChanged(true);
        org.junit.Assert.assertFalse(CaptionSurface.shortsSurfaceNow());
        CaptionPlayerAuthority.settleRegularFromGeometry();
        assertEquals(CaptionPlayerAuthority.REGULAR,CaptionPlayerAuthority.state());
        reel.setVisibility(View.VISIBLE);layout();
        org.junit.Assert.assertFalse("the previous negative probe is still throttled",CaptionSurface.shortsSurfaceNow());
        CaptionSurface.allowShortsReadyProbe();
        assertTrue("REGULAR does not imply that its Shorts surface has already been bound",CaptionPlayerAuthority.recoverShorts());
        assertTrue(CaptionSurface.isShorts());assertTrue(CaptionPlayerAuthority.displayPermitted());
    }
}
