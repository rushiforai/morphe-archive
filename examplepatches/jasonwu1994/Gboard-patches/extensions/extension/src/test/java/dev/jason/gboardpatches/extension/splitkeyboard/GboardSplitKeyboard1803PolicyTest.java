package dev.jason.gboardpatches.extension.splitkeyboard;

import java.util.Arrays;
import java.util.Collections;

import org.junit.Assert;
import org.junit.Test;

public final class GboardSplitKeyboard1803PolicyTest {
    @Test
    public void promotesOnlyUnavailableSplitAccessPointWhenEnabled() {
        Assert.assertEquals(2, GboardSplitKeyboard1803Policy.forceAccessPointState(
                "split", 5, true));
        Assert.assertEquals(5, GboardSplitKeyboard1803Policy.forceAccessPointState(
                "split", 5, false));
        Assert.assertEquals(3, GboardSplitKeyboard1803Policy.forceAccessPointState(
                "split", 3, true));
        Assert.assertEquals(5, GboardSplitKeyboard1803Policy.forceAccessPointState(
                "clipboard", 5, true));
    }

    @Test
    public void appendsSplitToOrderWithoutDuplicatesOnlyWhenEnabled() {
        Assert.assertEquals(
                Arrays.asList("clipboard", "split"),
                GboardSplitKeyboard1803Policy.appendSplitAccessPoint(
                        Collections.singletonList("clipboard"), true));
        Assert.assertEquals(
                Collections.singletonList("clipboard"),
                GboardSplitKeyboard1803Policy.appendSplitAccessPoint(
                        Collections.singletonList("clipboard"), false));
        Assert.assertEquals(
                Arrays.asList("clipboard", "split"),
                GboardSplitKeyboard1803Policy.appendSplitAccessPoint(
                        Arrays.asList("clipboard", "split", "split"), true));
    }

    @Test
    public void autoSplitRequiresBothSettingsStockEligibilityAndNonSplitMode() {
        Assert.assertTrue(GboardSplitKeyboard1803Policy.shouldSwitchToSplit(
                true, true, true, 1));
        Assert.assertFalse(GboardSplitKeyboard1803Policy.shouldSwitchToSplit(
                false, true, true, 1));
        Assert.assertFalse(GboardSplitKeyboard1803Policy.shouldSwitchToSplit(
                true, false, true, 1));
        Assert.assertFalse(GboardSplitKeyboard1803Policy.shouldSwitchToSplit(
                true, true, false, 1));
        Assert.assertFalse(GboardSplitKeyboard1803Policy.shouldSwitchToSplit(
                true, true, true, GboardSplitKeyboard1803Policy.SPLIT_KEYBOARD_MODE));
    }

    @Test
    public void splitActionRedirectsOnlyWhenMasterIsEnabledAndAlreadySplit() {
        Assert.assertTrue(GboardSplitKeyboard1803Policy.shouldRedirectSplitActionToRestore(
                true, GboardSplitKeyboard1803Policy.SPLIT_KEYBOARD_MODE));
        Assert.assertFalse(GboardSplitKeyboard1803Policy.shouldRedirectSplitActionToRestore(
                false, GboardSplitKeyboard1803Policy.SPLIT_KEYBOARD_MODE));
        Assert.assertFalse(GboardSplitKeyboard1803Policy.shouldRedirectSplitActionToRestore(
                true, 1));
    }
}
