package patches.maps.gearslip;

import static org.junit.Assert.*;
import org.junit.Test;

public final class HostPolicyTest {
    private static final String AUTO = "com.google.android.projection.gearhead";

    @Test public void anyAndroidAutoCompatibleHostThatOwnsItsPackageIsAccepted() {
        for (String host : new String[]{AUTO, "app.seb3thehacker.gearslip", "app.johninnl.drivedeck", "app.johninnl.drivedeck.wireless",
                "com.sironero.mycar", "io.github.flywheel", "it.simoneluconi.betterauto", "org.prototux.aare", "app.unknown.host"}) {
            assertTrue(host, HostPolicy.permits(host, 10042, new String[]{"another.app", host}));
        }
    }
    @Test public void aClaimedPackageTheCallerDoesNotOwnIsRejected() {
        assertFalse(HostPolicy.permits(AUTO, 10042, new String[]{"another.app"}));
        assertFalse(HostPolicy.permits("app.johninnl.drivedeck", -1, new String[]{"app.johninnl.drivedeck"}));
        assertFalse(HostPolicy.permits("app.johninnl.drivedeck", 10042, null));
        assertFalse(HostPolicy.permits(null, 10042, new String[]{"app.johninnl.drivedeck"}));
    }
}
