package dev.jason.gboardpatches.extension.accessibilitylayout;

import org.junit.Assert;
import org.junit.Test;

public final class GboardAccessibilityLayout1777PolicyTest {
    @Test
    public void forcesOnlyPkSimulatorAndNeverTheStockSetting() {
        Assert.assertEquals(Boolean.TRUE, GboardAccessibilityLayout1777Policy.maybeForce(
                "enable_pk_simulator", Boolean.FALSE, true));
        Assert.assertSame(Boolean.FALSE, GboardAccessibilityLayout1777Policy.maybeForce(
                "enable_pk_simulator", Boolean.FALSE, false));
        Assert.assertSame(Boolean.FALSE, GboardAccessibilityLayout1777Policy.maybeForce(
                "enable_pk_simulator_setting", Boolean.FALSE, true));
    }
}
