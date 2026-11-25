package nl.johninnl.navigation.startup;
import org.junit.Test;
import static org.junit.Assert.*;
public class StartupProtocolTest {
    private boolean allowed(String[] packages,String target) throws Exception {
        return (Boolean)Class.forName("nl.johninnl.navigation.startup.StartupProtocol").getMethod("allowed",String[].class,String.class).invoke(null,packages,target);
    }
    @Test public void acceptsOnlyFrameworkOwnedReceiverPackages() throws Exception {
        assertTrue(allowed(new String[]{"app.vela"},""));
        assertTrue(allowed(new String[]{"org.ungoogled.android.apps.maps"},""));
        assertTrue(allowed(new String[]{"com.google.android.apps.maps"},""));
        assertFalse(allowed(new String[]{"evil.app"},""));assertFalse(allowed(null,""));
    }
    @Test public void configuredReceiverIsAnExactPackageNotPrefixOrClaim() throws Exception {
        assertTrue(allowed(new String[]{"custom.maps"},"custom.maps"));
        assertFalse(allowed(new String[]{"custom.maps.evil"},"custom.maps"));
        assertFalse(allowed(new String[]{"app.vela"},"custom.maps"));
    }
}
