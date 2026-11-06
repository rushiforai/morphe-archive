package dev.jason.gboardpatches.extension.longpressquickactions;

import org.junit.Assert;
import org.junit.Test;

public final class GboardGlobeDragGestureStateTest {
    private static final long GRACE_MS = 750L;

    @Test
    public void targetLongPressDoesNotReleaseOwnershipWhileFingerIsDown() {
        GboardGlobeDragGestureState state = new GboardGlobeDragGestureState(GRACE_MS);
        state.onTargetOwner(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL);
        state.onTargetLongPress();

        Assert.assertTrue(state.isActive());
        Assert.assertTrue(state.hasClaimedTarget());
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL,
                state.targetShortcut());
        Assert.assertFalse(state.expire(10_000L));
    }

    @Test
    public void finishTerminalAndReplayOwnTheCompleteReleaseSequence() {
        GboardGlobeDragGestureState state = new GboardGlobeDragGestureState(GRACE_MS);
        state.onPointerFinish(10_000L);
        Assert.assertTrue(state.isAwaitingTerminal(10_500L));
        state.onTerminalConsumed(10_500L);
        Assert.assertTrue(state.isAwaitingReplay(11_000L));
        state.onReplayConsumed();
        Assert.assertTrue(state.isComplete());
    }

    @Test
    public void invalidTargetIsClaimedAsNoOpAndReturningToGlobeClearsIt() {
        GboardGlobeDragGestureState state = new GboardGlobeDragGestureState(GRACE_MS);
        state.onTargetOwner(null);
        Assert.assertTrue(state.hasClaimedTarget());
        Assert.assertNull(state.targetShortcut());
        state.onGlobeOwner();
        Assert.assertFalse(state.hasClaimedTarget());
    }

    @Test
    public void finishBeforeCyrillicPointerOwnerStillAdmitsLateTargetClaim() {
        GboardGlobeDragGestureState state = new GboardGlobeDragGestureState(GRACE_MS);

        state.onPointerFinish(2_000L);
        Assert.assertTrue(state.isAwaitingTerminal(2_100L));

        state.onTargetOwner(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL);

        Assert.assertTrue(state.hasClaimedTarget());
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL,
                state.targetShortcut());
        Assert.assertFalse(state.canCommitClaimedTargetOnPointerFinish());
    }

    @Test
    public void failedActiveOwnershipWaitsForPointerFinish() {
        GboardGlobeDragGestureState state = new GboardGlobeDragGestureState(GRACE_MS);
        state.onFailure(1_000L);
        Assert.assertTrue(state.isFailedActive());
        Assert.assertTrue(state.ownsPointer());
        Assert.assertFalse(state.expire(100_000L));
        state.onPointerFinish(100_000L);
        Assert.assertTrue(state.isAwaitingReplay(100_500L));
    }
}
