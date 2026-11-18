package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class HypeSeriesTest {
    @Test
    public void countsLandInTheCurrentBucket() {
        HypeSeries series = new HypeSeries();
        series.add(100);
        series.add(200);
        int[] now = series.snapshot(9_999);
        assertEquals(2, now[HypeSeries.POINTS - 1]);
    }

    @Test
    public void timePassingShiftsTheBuckets() {
        HypeSeries series = new HypeSeries();
        series.add(0);
        int[] later = series.snapshot(20_000);
        assertEquals(1, later[HypeSeries.POINTS - 3]);
        assertEquals(0, later[HypeSeries.POINTS - 1]);
    }

    @Test
    public void aLongSilenceClearsTheWindow() {
        HypeSeries series = new HypeSeries();
        series.add(0);
        assertArrayEquals(new int[HypeSeries.POINTS], series.snapshot(HypeSeries.BUCKET_MS * HypeSeries.POINTS * 2));
    }

    private static int[] steady(int rate, int latest) {
        int[] values = new int[HypeSeries.POINTS];
        java.util.Arrays.fill(values, rate);
        values[HypeSeries.POINTS - 2] = latest;
        return values;
    }

    @Test
    public void aSuddenJumpIsASpike() {
        assertEquals(4, HypeSeries.spikeRatio(steady(10, 40)));
    }

    @Test
    public void steadyChatIsNoSpike() {
        assertEquals(0, HypeSeries.spikeRatio(steady(10, 15)));
    }

    @Test
    public void quietChannelsNeedARealCrowd() {
        assertEquals(0, HypeSeries.spikeRatio(steady(1, 4)));
    }

    @Test
    public void tooLittleHistoryIsNoSpike() {
        int[] values = new int[HypeSeries.POINTS];
        values[HypeSeries.POINTS - 3] = 1;
        values[HypeSeries.POINTS - 2] = 40;
        assertEquals(0, HypeSeries.spikeRatio(values));
    }
}
