package dev.utaa.linimal.extension.features.readwithoutreceipt;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public final class ListHeightFollowerTest {
    @Test
    public void followsEachStepOfTheShrinkAnimation() {
        ListHeightFollower follower = new ListHeightFollower();

        assertEquals(0, follower.onHeight(1936));
        assertEquals(300, follower.onHeight(1636));
        assertEquals(633, follower.onHeight(1003));
        assertEquals(0, follower.onHeight(1003));
    }

    @Test
    public void doesNotScrollWhenTheListGrowsAndMeasuresFromTheGrownHeight() {
        ListHeightFollower follower = new ListHeightFollower();
        follower.onHeight(1003);

        assertEquals(0, follower.onHeight(1936));
        assertEquals(933, follower.onHeight(1003));
    }

    @Test
    public void ignoresUnmeasuredListsAndForgetsTheHeightOnReset() {
        ListHeightFollower follower = new ListHeightFollower();
        follower.onHeight(1936);

        assertEquals(0, follower.onHeight(0));
        assertEquals(933, follower.onHeight(1003));
        follower.reset();
        assertEquals(0, follower.onHeight(500));
    }
}
