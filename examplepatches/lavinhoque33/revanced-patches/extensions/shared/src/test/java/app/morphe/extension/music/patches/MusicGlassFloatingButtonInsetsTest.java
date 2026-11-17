/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-16.
 * Written by lavinhoque33, 2026-11-14.
 */

package app.morphe.extension.music.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class MusicGlassFloatingButtonInsetsTest {
    @Test
    public void stockMiniplayerReserveIsNotAddedTwice() {
        assertEquals(0, MusicGlassFloatingButtonInsets.extraRoom(1000, 932, 68, 0));
    }

    @Test
    public void miniplayerOnlyIncludesFloatingBottomGap() {
        // A 64px floating player plus a 12px gap replaces stock's 68px reserve.
        assertEquals(8, MusicGlassFloatingButtonInsets.extraRoom(1000, 924, 68, 0));
    }

    @Test
    public void navigationOnlyIncludesRealBarAndFloatingPlayer() {
        assertEquals(88, MusicGlassFloatingButtonInsets.extraRoom(1000, 844, 68, 80));
    }

    @Test
    public void bothStylesDoNotCountTheBarTwice() {
        assertEquals(88, MusicGlassFloatingButtonInsets.extraRoom(1000, 844, 68, 80));
    }

    @Test
    public void resizingNavigationBarFollowsItsMeasuredHeight() {
        assertEquals(128, MusicGlassFloatingButtonInsets.extraRoom(1000, 804, 68, 120));
        assertEquals(56, MusicGlassFloatingButtonInsets.extraRoom(1000, 876, 68, 48));
    }

    @Test
    public void smallerFloatingPlayerKeepsAtLeastTheNavigationRoom() {
        assertEquals(80, MusicGlassFloatingButtonInsets.extraRoom(1000, 856, 68, 80));
        assertEquals(0, MusicGlassFloatingButtonInsets.extraRoom(1000, 936, 68, 0));
    }

    @Test
    public void coordinatesAreIndependentOfStatusBarOffsetAndDensity() {
        assertEquals(88, MusicGlassFloatingButtonInsets.extraRoom(1050, 894, 68, 80));
        assertEquals(264, MusicGlassFloatingButtonInsets.extraRoom(3000, 2532, 204, 240));
    }

    @Test
    public void pageAndSnackbarSpacingArePreserved() {
        int extra = MusicGlassFloatingButtonInsets.extraRoom(1000, 844, 68, 80);
        int browseMargin = 68 + 16;
        int playlistMargin = 68 + 24 + 40;

        assertEquals(1000 - 844 + 16, browseMargin + extra);
        assertEquals(1000 - 844 + 24 + 40, playlistMargin + extra);
    }

    @Test
    public void noPlayerKeepsOnlyTheNavigationInset() {
        assertEquals(0, MusicGlassFloatingButtonInsets.extraRoom(1000, 1000, 68, 0));
        assertEquals(80, MusicGlassFloatingButtonInsets.extraRoom(1000, 1000, 68, 80));
        assertEquals(120, MusicGlassFloatingButtonInsets.extraRoom(1000, 1000, 68, 120));
    }

    @Test
    public void measuredSizesKeepTheNativeEdgeGapAtEveryDensity() {
        for (int density : new int[]{1, 2, 3}) {
            for (int navigationHeight : new int[]{0, 48, 80, 128, 256}) {
                for (int playerHeight : new int[]{48, 64, 68, 96, 160}) {
                    for (int bottomGap : new int[]{0, 12, 40, 96}) {
                        int contentBottom = 2000 * density;
                        int nativeReserve = 68 * density;
                        int edgeGap = 24 * density;
                        int navigationRoom = navigationHeight * density;
                        int miniplayerTop = contentBottom
                                - (navigationHeight + playerHeight + bottomGap) * density;
                        int extra = MusicGlassFloatingButtonInsets.extraRoom(
                                contentBottom, miniplayerTop, nativeReserve, navigationRoom);
                        int buttonBottom = contentBottom - nativeReserve - edgeGap - extra;

                        assertTrue(miniplayerTop - buttonBottom >= edgeGap);
                    }
                }
            }
        }
    }

    @Test
    public void initialEdgeOnlyMarginIsClearBeforeTheNativeReserveArrives() {
        Frames frames = new Frames(60);

        assertFalse(frames.preDraw());
        assertEquals(480, frames.margin);
        frames.layout();

        assertTrue(frames.preDraw());
        assertEquals(60, frames.clearance());
    }

    @Test
    public void nativeRewriteAfterTargetNeedsNoGlobalLayoutCallback() {
        Frames frames = new Frames(230);
        frames.settle();
        frames.nativeRewrite(230, true);

        assertFalse(frames.preDraw());
        frames.layout();

        assertTrue(frames.preDraw());
        assertEquals(480, frames.margin);
        assertEquals(60, frames.clearance());
    }

    @Test
    public void rewriteWithoutRelayoutCanDrawItsAlreadyClearRectangle() {
        Frames frames = new Frames(230);
        frames.settle();
        frames.nativeRewrite(230, false);

        assertTrue(frames.preDraw());
        assertEquals(480, frames.margin);
        assertEquals(60, frames.clearance());
        frames.layout();

        assertTrue(frames.preDraw());
        assertEquals(60, frames.clearance());
    }

    @Test
    public void repeatedRewritesNeverAccumulateTheGlassRoom() {
        Frames frames = new Frames(230);
        frames.settle();
        for (int nativeMargin : new int[]{60, 230, 310, 480, 230, 60, 230}) {
            frames.nativeRewrite(nativeMargin, true);
            frames.settle();

            assertTrue(frames.clearance() >= 60);
        }
        assertEquals(480, frames.margin);
    }

    @Test
    public void goneAndDetachedRewritesAreHandledWhenShownAgain() {
        Frames frames = new Frames(230);
        frames.settle();
        frames.attached = false;
        frames.nativeRewrite(60, true);

        assertTrue(frames.preDraw());
        frames.attached = true;
        frames.visible = false;
        frames.nativeRewrite(230, true);

        assertTrue(frames.preDraw());
        frames.visible = true;
        frames.settle();

        assertEquals(480, frames.margin);
        assertEquals(60, frames.clearance());
    }

    @Test
    public void nativeSnackbarAndNavigationResizeKeepTheirRoom() {
        Frames frames = new Frames(330);
        frames.settle();
        assertEquals(580, frames.margin);
        assertEquals(160, frames.clearance());

        frames.room = 325;
        frames.obstacleTop = 1905;
        frames.settle();

        assertEquals(655, frames.margin);
        assertEquals(160, frames.clearance());
    }

    @Test
    public void stablePredrawIsIdempotent() {
        Frames frames = new Frames(230);
        frames.settle();
        for (int i = 0; i < 100; i++) {
            assertTrue(frames.preDraw());
            assertEquals(480, frames.margin);
        }
    }

    @Test
    public void offscreenChangesDoNotCancelDrawing() {
        Frames frames = new Frames(230);
        frames.onScreen = false;

        assertTrue(frames.preDraw());
        assertEquals(480, frames.margin);
    }

    @Test
    public void rewriteEveryFrameCannotStarveDrawing() {
        Frames frames = new Frames(230);
        frames.settle();
        int drawn = 0;
        for (int i = 0; i < 20; i++) {
            frames.nativeRewrite(230, true);
            if (frames.preDraw()) drawn++;
        }
        assertEquals(18, drawn);
        assertEquals(480, frames.margin);

        frames.layout();
        assertTrue(frames.preDraw());
        frames.nativeRewrite(230, true);
        assertFalse(frames.preDraw());
    }

    /**
     * A scripted frame pipeline: native writes/layouts, then pre-draw, then the requested layout.
     * Deliberately has no global-layout callback; it uses the production margin/draw decisions.
     */
    private static final class Frames {
        private final MusicGlassFloatingButtonInsets.MarginState state =
                new MusicGlassFloatingButtonInsets.MarginState();
        private int margin;
        private int laidOutMargin;
        private int room = 250;
        private int obstacleTop = 1980;
        private boolean layoutRequested;
        private boolean visible = true;
        private boolean attached = true;
        private boolean onScreen = true;

        Frames(int nativeMargin) {
            margin = laidOutMargin = nativeMargin;
        }

        void nativeRewrite(int nativeMargin, boolean relayout) {
            margin = nativeMargin;
            if (relayout) {
                laidOutMargin = nativeMargin;
                layoutRequested = false;
            }
        }

        boolean preDraw() {
            if (!visible || !attached) {
                state.resetDrawCancellation();
                return true;
            }
            int bottom = 2400 - laidOutMargin;
            int minimum = layoutRequested ? Integer.MIN_VALUE
                    : MusicGlassFloatingButtonInsets.minimumMargin(margin, bottom, obstacleTop, 60);
            int target = state.target(margin, room, minimum);
            boolean changed = margin != target;
            if (changed) {
                margin = target;
                layoutRequested = true;
            }
            return state.shouldDraw(changed, layoutRequested, onScreen && bottom + 60 > obstacleTop);
        }

        void layout() {
            laidOutMargin = margin;
            layoutRequested = false;
        }

        void settle() {
            for (int i = 0; i < 3; i++) {
                if (preDraw() && !layoutRequested) {
                    assertTrue(clearance() >= 60);
                    return;
                }
                layout();
            }
            throw new AssertionError("A finite rewrite did not settle");
        }

        int clearance() {
            return obstacleTop - (2400 - laidOutMargin);
        }
    }
}
