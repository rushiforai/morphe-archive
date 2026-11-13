package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertArrayEquals;

import org.junit.Test;

/** タイムラインで表示区間を動かしたときの区間の計算。 */
public class TimelineViewTest {
    private static final long DURATION = 5000;

    private static long[] move(String drag, long start, long end, long delta) {
        return TimelineView.movedRange(TimelineView.Drag.valueOf(drag), start, end, delta, DURATION);
    }

    @Test
    public void movesStartWithinVideoAndMinimumRange() {
        assertArrayEquals(new long[] {1500, 3000}, move("START", 1000, 3000, 500));
        assertArrayEquals(new long[] {0, 3000}, move("START", 1000, 3000, -2000));
        assertArrayEquals(new long[] {2800, 3000}, move("START", 1000, 3000, 5000));
    }

    @Test
    public void movesEndWithinVideoAndMinimumRange() {
        assertArrayEquals(new long[] {1000, 3500}, move("END", 1000, 3000, 500));
        assertArrayEquals(new long[] {1000, DURATION}, move("END", 1000, 3000, 9000));
        assertArrayEquals(new long[] {1000, 1200}, move("END", 1000, 3000, -5000));
    }

    @Test
    public void movesWholeRangeKeepingLength() {
        assertArrayEquals(new long[] {1500, 3500}, move("MOVE", 1000, 3000, 500));
        assertArrayEquals(new long[] {3000, DURATION}, move("MOVE", 1000, 3000, 9000));
        assertArrayEquals(new long[] {0, 2000}, move("MOVE", 1000, 3000, -9000));
    }

    /** 動画全体を覆う区間は動かない。 */
    @Test
    public void fullRangeCannotMove() {
        assertArrayEquals(new long[] {0, DURATION}, move("MOVE", 0, DURATION, 700));
    }
}
