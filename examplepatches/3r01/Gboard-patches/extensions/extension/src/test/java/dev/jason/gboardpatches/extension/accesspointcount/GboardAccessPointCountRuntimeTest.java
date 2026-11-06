package dev.jason.gboardpatches.extension.accesspointcount;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class GboardAccessPointCountRuntimeTest {
    private SharedPreferences preferences;

    @Before
    public void setUp() {
        preferences = RuntimeEnvironment.getApplication().getSharedPreferences(
                "access-point-count-runtime-test",
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
    }

    @Test
    public void enabledRuntimeForcesBothExactLongFlags() {
        preferences.edit()
                .putBoolean(GboardAccessPointCountSettings.PREF_KEY_ENABLED, true)
                .putInt(GboardAccessPointCountSettings.PREF_KEY_COUNT, 6)
                .commit();

        Assert.assertEquals(Long.valueOf(6L), apply(
                GboardAccessPointCountPolicy.MAX_ACCESS_POINTS_FLAG,
                Long.valueOf(-1L)));
        Assert.assertEquals(Long.valueOf(6L), apply(
                GboardAccessPointCountPolicy.DEFAULT_ACCESS_POINTS_FLAG,
                Long.valueOf(-1L)));
    }

    @Test
    public void disabledMalformedWrongTypeAndUnrelatedReadsPreserveStock() {
        Long stock = Long.valueOf(-1L);
        preferences.edit()
                .putBoolean(GboardAccessPointCountSettings.PREF_KEY_ENABLED, false)
                .putInt(GboardAccessPointCountSettings.PREF_KEY_COUNT, 6)
                .commit();
        Assert.assertSame(stock, apply(
                GboardAccessPointCountPolicy.MAX_ACCESS_POINTS_FLAG, stock));

        preferences.edit()
                .putBoolean(GboardAccessPointCountSettings.PREF_KEY_ENABLED, true)
                .putInt(GboardAccessPointCountSettings.PREF_KEY_COUNT, 9)
                .commit();
        Assert.assertSame(stock, apply(
                GboardAccessPointCountPolicy.MAX_ACCESS_POINTS_FLAG, stock));
        Assert.assertSame(stock, GboardAccessPointCountRuntime.applyFlagValue(
                GboardAccessPointCountPolicy.MAX_ACCESS_POINTS_FLAG, stock, null));
        Assert.assertSame(stock, apply("unrelated", stock));
        Assert.assertEquals(Integer.valueOf(-1), apply(
                GboardAccessPointCountPolicy.MAX_ACCESS_POINTS_FLAG,
                Integer.valueOf(-1)));
    }

    @Test
    public void matcherOwnsExactlyTwoFlags() {
        Assert.assertTrue(GboardAccessPointCountPolicy.isTargetFlagName(
                "config_max_access_points"));
        Assert.assertTrue(GboardAccessPointCountPolicy.isTargetFlagName(
                "config_default_access_points_num_on_bar"));
        Assert.assertFalse(GboardAccessPointCountPolicy.isTargetFlagName(
                "access_points_count_on_bar"));
        Assert.assertFalse(GboardAccessPointCountPolicy.isTargetFlagName(null));
    }

    private Object apply(String flagName, Object stockResult) {
        return GboardAccessPointCountRuntime.applyFlagValue(
                flagName,
                stockResult,
                preferences);
    }
}
