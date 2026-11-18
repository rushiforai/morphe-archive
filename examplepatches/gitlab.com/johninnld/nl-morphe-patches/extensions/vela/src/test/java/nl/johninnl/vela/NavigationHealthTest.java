package nl.johninnl.vela;

import static org.junit.Assert.*;
import nl.johninnl.navigation.startup.NavigationHealth;
import org.junit.Test;

public class NavigationHealthTest {
    @Test public void healthyEngineCannotClaimAWorkingWarningConnection(){
        assertFalse(NavigationHealth.warnings("Flitsmeister","off",false,false,"running",false).startsWith("✓"));
        assertFalse(NavigationHealth.warnings("Flitsmeister","ready",false,true,"running",false).startsWith("✓"));
        assertTrue(NavigationHealth.warnings("Flitsmeister","ready",true,true,"running",false).startsWith("✓"));
        assertTrue(NavigationHealth.warnings("Flitsmeister","ready",true,false,"running",false).startsWith("!"));
    }
    @Test public void serviceSeparatesExpectedInactivityFromFailureAndPendingWork(){
        for(boolean dutch:new boolean[]{false,true}){
            assertTrue(NavigationHealth.service("Flitsmeister","running",dutch).startsWith("✓"));
            assertTrue(NavigationHealth.service("Flitsmeister","paused",dutch).startsWith("○"));
            assertTrue(NavigationHealth.service("Flitsmeister","connecting",dutch).startsWith("…"));
            assertTrue(NavigationHealth.service("Flitsmeister","permission_required",dutch).startsWith("!"));
            assertTrue(NavigationHealth.service("Flitsmeister","start_blocked",dutch).startsWith("✕"));
        }
    }
    @Test public void dataHealthExpiresAndFallbackNeverClaimsThatMissingValuesWereReceived(){
        for(String receiver:new String[]{"Vela","Google Maps"}){
            assertTrue(NavigationHealth.data("Flitsmeister",receiver,true,false,false).startsWith("✓"));
            String partial=NavigationHealth.data("Flitsmeister",receiver,true,true,false);
            assertTrue(partial.startsWith("✓"));assertTrue(partial.contains(receiver+" supplies missing values when available"));
            String stale=NavigationHealth.data("Flitsmeister",receiver,false,true,false);
            assertTrue(stale.startsWith("!"));assertTrue(stale.contains(receiver+" is using its own data"));
        }
    }
}
