package app.aidan.extension.fizz;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

public class VersionBridgeTest {

    @Test
    public void testDefaultVersionConstants() {
        assertNotNull(VersionBridge.getClientVersion());
        assertEquals(VersionBridge.DEFAULT_VERSION, VersionBridge.getClientVersion());
        assertNotNull(VersionBridge.getBuildNumber());
        assertEquals(VersionBridge.DEFAULT_BUILD_NUMBER, VersionBridge.getBuildNumber());
    }

    @Test
    public void testInitNullContextDoesNotThrow() {
        VersionBridge.init(null);
        assertEquals(VersionBridge.DEFAULT_VERSION, VersionBridge.getClientVersion());
    }
}
