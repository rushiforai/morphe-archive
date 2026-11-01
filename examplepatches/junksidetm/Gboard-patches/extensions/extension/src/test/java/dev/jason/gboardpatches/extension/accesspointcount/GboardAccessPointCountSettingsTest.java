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
public final class GboardAccessPointCountSettingsTest {
    private SharedPreferences preferences;

    @Before
    public void setUp() {
        preferences = RuntimeEnvironment.getApplication().getSharedPreferences(
                "access-point-count-test",
                Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
    }

    @Test
    public void missingValuesDefaultToDisabledAndSix() {
        GboardAccessPointCountSettings.Snapshot snapshot =
                GboardAccessPointCountSettings.readRuntimeOrNull(preferences);

        Assert.assertNotNull(snapshot);
        Assert.assertFalse(snapshot.enabled);
        Assert.assertEquals(6, snapshot.count);
    }

    @Test
    public void validValuesRoundTripAndInvalidCountsAreRejected() {
        Assert.assertTrue(GboardAccessPointCountSettings.writeEnabled(preferences, true));
        Assert.assertTrue(GboardAccessPointCountSettings.writeCount(preferences, 3));

        GboardAccessPointCountSettings.Snapshot snapshot =
                GboardAccessPointCountSettings.readRuntimeOrNull(preferences);
        Assert.assertNotNull(snapshot);
        Assert.assertTrue(snapshot.enabled);
        Assert.assertEquals(3, snapshot.count);

        Assert.assertFalse(GboardAccessPointCountSettings.writeCount(preferences, 2));
        Assert.assertFalse(GboardAccessPointCountSettings.writeCount(preferences, 9));
        Assert.assertEquals(3, GboardAccessPointCountSettings.read(preferences).count);
    }

    @Test
    public void malformedAndOutOfRangeStoredValuesFailClosed() {
        preferences.edit()
                .putBoolean(GboardAccessPointCountSettings.PREF_KEY_ENABLED, true)
                .putInt(GboardAccessPointCountSettings.PREF_KEY_COUNT, 2)
                .commit();
        Assert.assertNull(GboardAccessPointCountSettings.readRuntimeOrNull(preferences));

        preferences.edit()
                .putString(GboardAccessPointCountSettings.PREF_KEY_COUNT, "six")
                .commit();
        Assert.assertNull(GboardAccessPointCountSettings.readRuntimeOrNull(preferences));
        Assert.assertNull(GboardAccessPointCountSettings.readRuntimeOrNull(null));
    }
}
