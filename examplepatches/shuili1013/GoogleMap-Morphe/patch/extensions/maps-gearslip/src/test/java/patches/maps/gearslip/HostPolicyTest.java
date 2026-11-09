package patches.maps.gearslip;

import static org.junit.Assert.*;
import org.junit.Test;

public final class HostPolicyTest {
    private static final String GEARSLIP = "app.seb3thehacker.gearslip";
    private static final String AUTO = "com.google.android.projection.gearhead";
    private static final String GOOGLE_ORIGINAL = "fdb00c43dbde8b51cb312aa81d3b5fa17713adb94b28f598d77f8eb89daceedf";
    private static final String GOOGLE_CURRENT = "1ca8dcc0bed3cbd872d2cb791200c0292ca9975768a82d676b8b424fb65b5295";
    private static final String EMULATOR_STUB = "1975b2f17177bc89a5dff31f9e64a6cae281a53dc1d1d59b1d147fe1c82afa00";

    @Test public void installedGearslipWorksWithAnySigningKey() {
        assertTrue(HostPolicy.permits(GEARSLIP, 10042, new String[]{"another.app", GEARSLIP}, null, null));
    }
    @Test public void driveDeckAndDevelopmentBuildsWorkWithAnySigningKey() {
        for (String host : new String[]{GEARSLIP + ".dev", "app.johninnl.drivedeck", "app.johninnl.drivedeck.dev"}) {
            assertTrue(host, HostPolicy.permits(host, 10042, new String[]{host}, null, null));
            assertFalse(host, HostPolicy.permits(host, 10042, new String[]{"another.app"}, null, null));
        }
        assertFalse(HostPolicy.permits("app.johninnl.drivedeck.fake", 10042, new String[]{"app.johninnl.drivedeck.fake"}, null, null));
    }
    @Test public void claimedGearslipUnderAnotherUidCannotAuthenticate() {
        assertFalse(HostPolicy.permits(GEARSLIP, 10042, new String[]{"another.app"}, null, null));
        assertFalse(HostPolicy.permits(GEARSLIP, -1, new String[]{GEARSLIP}, null, null));
        assertFalse(HostPolicy.permits(GEARSLIP, 10042, null, null, null));
    }
    @Test public void validationHostAndUnknownPackagesAreExcluded() {
        String validation = GEARSLIP + ".morphetest";
        assertFalse(HostPolicy.permits(validation, 10042, new String[]{validation}, null, null));
        assertFalse(HostPolicy.permits("other.car.host", 10042, new String[]{"other.car.host"}, null, null));
    }
    @Test public void androidAutoRequiresOwnedPackageAndVerifiedGoogleSigner() {
        assertTrue(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{GOOGLE_CURRENT}, null));
        assertTrue(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{GOOGLE_ORIGINAL}, null));
        assertFalse(HostPolicy.permits(AUTO, 10042, new String[]{GEARSLIP}, new String[]{GOOGLE_CURRENT}, null));
        assertFalse(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, null, null));
        assertFalse(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{EMULATOR_STUB}, null));
    }
    @Test public void platformVerifiedRotationHistoryKeepsTheGenuineLineage() {
        assertTrue(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{"future.rotated.signer"},
                new String[]{GOOGLE_ORIGINAL, GOOGLE_CURRENT, "future.rotated.signer"}));
        assertFalse(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{"untrusted"}, new String[]{"untrusted"}));
    }
    @Test public void multipleCurrentSignersMustAllBeTrusted() {
        assertFalse(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{GOOGLE_CURRENT, "untrusted"}, new String[]{GOOGLE_ORIGINAL}));
        assertTrue(HostPolicy.permits(AUTO, 10042, new String[]{AUTO}, new String[]{GOOGLE_CURRENT, GOOGLE_ORIGINAL}, null));
    }
}
