package app.johninnl.modelhost.api;

import org.junit.Test;
import static org.junit.Assert.*;

public class ProviderPlatformTest {
    @Test public void officialNativeRuntimeRequiresAndroidElevenAndArm64(){
        assertFalse(ProviderDiscovery.supportsOfficialProvider(29,new String[]{"arm64-v8a"}));
        assertFalse(ProviderDiscovery.supportsOfficialProvider(30,new String[]{"armeabi-v7a"}));
        assertFalse(ProviderDiscovery.supportsOfficialProvider(37,new String[]{"x86_64"}));
        assertFalse(ProviderDiscovery.supportsOfficialProvider(37,null));
        assertFalse(ProviderDiscovery.supportsOfficialProvider(37,new String[0]));
        assertTrue(ProviderDiscovery.supportsOfficialProvider(30,new String[]{"arm64-v8a","armeabi-v7a"}));
        assertTrue(ProviderDiscovery.supportsOfficialProvider(37,new String[]{"arm64-v8a"}));
    }
}
