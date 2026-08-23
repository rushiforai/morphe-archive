package dev.jason.gboardpatches.extension.bluetoothmicrophone;

import org.junit.Assert;
import org.junit.Test;

public final class GboardBluetoothMicrophone1777PolicyTest {
    @Test
    public void forcesOnlyExactFalseBooleanWhenEnabled() {
        Assert.assertEquals(
                "enable_use_bluetooth_setting",
                GboardBluetoothMicrophone1777Policy.BLUETOOTH_MICROPHONE_FLAG);
        Assert.assertEquals(Boolean.TRUE, GboardBluetoothMicrophone1777Policy.maybeForce(
                "enable_use_bluetooth_setting", Boolean.FALSE, true));
        Assert.assertSame(Boolean.FALSE, GboardBluetoothMicrophone1777Policy.maybeForce(
                "enable_use_bluetooth_setting", Boolean.FALSE, false));
        Assert.assertSame(Boolean.TRUE, GboardBluetoothMicrophone1777Policy.maybeForce(
                "enable_use_bluetooth_setting", Boolean.TRUE, true));
        Assert.assertEquals("false", GboardBluetoothMicrophone1777Policy.maybeForce(
                "enable_use_bluetooth_setting", "false", true));
        Assert.assertSame(Boolean.FALSE, GboardBluetoothMicrophone1777Policy.maybeForce(
                "unrelated", Boolean.FALSE, true));
        Assert.assertNull(GboardBluetoothMicrophone1777Policy.maybeForce(
                "enable_use_bluetooth_setting", null, true));
    }
}
