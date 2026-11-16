/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */

package app.morphe.extension.music.patches;

import static org.junit.Assert.assertEquals;

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
}
