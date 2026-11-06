package dev.jason.gboardpatches.extension.accesspointsmenu;

import org.junit.Assert;
import org.junit.Test;

public final class GboardAccessPointsMenu1803PolicyTest {
    @Test
    public void exactBooleanMirrorsSwitchInBothDirections() {
        Assert.assertEquals(Boolean.TRUE, GboardAccessPointsMenu1803Policy.mirrorSwitch(
                "enable_access_points_menu_redesign", Boolean.FALSE, true));
        Assert.assertEquals(Boolean.FALSE, GboardAccessPointsMenu1803Policy.mirrorSwitch(
                "enable_access_points_menu_redesign", Boolean.TRUE, false));
        Assert.assertSame(Boolean.TRUE, GboardAccessPointsMenu1803Policy.mirrorSwitch(
                "unrelated", Boolean.TRUE, false));
        Assert.assertEquals("false", GboardAccessPointsMenu1803Policy.mirrorSwitch(
                "enable_access_points_menu_redesign", "false", true));
    }
}
