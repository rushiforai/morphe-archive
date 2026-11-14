package nl.johninnl.soundcloud;

import org.junit.Test;
import static org.junit.Assert.*;

public class GoFeaturesTest {
    @Test public void overridesOnlyTheThreeV4n1xFlags() {
        for (String name : new String[]{"offline_sync", "no_audio_ads", "hq_audio"}) {
            assertTrue(GoFeatures.enabled(name, false));
            assertTrue(GoFeatures.enabled(name, true));
        }
        for (String name : new String[]{"offline_sync_extra", "unrelated_feature", "", null}) {
            assertFalse(GoFeatures.enabled(name, false));
            assertTrue(GoFeatures.enabled(name, true));
        }
    }
}
