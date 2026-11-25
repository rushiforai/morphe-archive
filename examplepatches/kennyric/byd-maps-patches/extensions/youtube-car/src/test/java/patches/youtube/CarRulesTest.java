package patches.youtube;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;

import org.junit.Test;

public class CarRulesTest {
    @Test public void carHostNamesAreRecognizedWithoutAPackageList() {
        assertTrue(CarDisplay.isCarHostName("drivedeck-guest-app.morphe.android.youtube"));
        assertTrue(CarDisplay.isCarHostName("DriveDeck"));
        assertTrue(CarDisplay.isCarHostName("Android Auto"));
        assertTrue(CarDisplay.isCarHostName("gearslip-projection"));
        assertTrue(CarDisplay.isCarHostName("mycar-projection"));
        assertFalse(CarDisplay.isCarHostName("Overlay #1"));
        assertFalse(CarDisplay.isCarHostName("HDMI Screen"));
        assertFalse(CarDisplay.isCarHostName(""));
        assertFalse(CarDisplay.isCarHostName(null));
    }

    @Test public void mirroringCarHostsIncludeEveryRequestedClient() {
        java.util.List<String> hosts = Arrays.asList(CarDisplay.MIRRORING_CAR_HOSTS);
        assertTrue(hosts.contains("app.johninnl.drivedeck"));
        assertTrue(hosts.contains("app.seb3thehacker.gearslip"));
        assertTrue(hosts.contains("io.github.psychobarge.grapheneauto"));
        assertTrue(hosts.contains("io.github.sirionero.mycar"));
    }

    @Test public void phoneRequestsKeepTheirFormFactor() {
        assertEquals(1, CarLayout.universalFormFactor(1, false));
        assertEquals(2, CarLayout.brokenEndpointFormFactor(2, false));
        assertEquals(1, CarLayout.browseFormFactor(1, "UCabc", false));
    }

    @Test public void carDisplayUsesTheAutomotiveLayoutExceptForBrokenPages() {
        assertEquals(CarLayout.AUTOMOTIVE_FORM_FACTOR, CarLayout.universalFormFactor(1, true));
        assertEquals(CarLayout.LARGE_FORM_FACTOR,
                CarLayout.brokenEndpointFormFactor(CarLayout.AUTOMOTIVE_FORM_FACTOR, true));
        assertEquals(CarLayout.AUTOMOTIVE_FORM_FACTOR,
                CarLayout.browseFormFactor(CarLayout.AUTOMOTIVE_FORM_FACTOR, "FEwhat_to_watch", true));
        assertEquals(CarLayout.AUTOMOTIVE_FORM_FACTOR,
                CarLayout.browseFormFactor(CarLayout.AUTOMOTIVE_FORM_FACTOR, "FEsubscriptions", true));
        // Channel, playlist and library pages fail or lose items in the automotive layout.
        assertEquals(CarLayout.LARGE_FORM_FACTOR,
                CarLayout.browseFormFactor(CarLayout.AUTOMOTIVE_FORM_FACTOR, "UCabc", true));
        assertEquals(CarLayout.LARGE_FORM_FACTOR,
                CarLayout.browseFormFactor(CarLayout.AUTOMOTIVE_FORM_FACTOR, "VLPLabc", true));
        assertEquals(CarLayout.LARGE_FORM_FACTOR,
                CarLayout.browseFormFactor(CarLayout.AUTOMOTIVE_FORM_FACTOR, "FElibrary", true));
    }

    @Test public void itemSectionIndexMustBeInsideTheList() {
        assertTrue(CarLayout.checkItemSectionRenderer(Arrays.asList("a", "b"), 1));
        assertFalse(CarLayout.checkItemSectionRenderer(Arrays.asList("a", "b"), 2));
        assertFalse(CarLayout.checkItemSectionRenderer(Collections.emptyList(), 0));
        assertFalse(CarLayout.checkItemSectionRenderer(null, 0));
    }

    @Test public void onlyAnUpwardSwipeShowsTheNavigationBar() {
        assertTrue(CarNavigationBar.isSwipeUp(30, 5, 1));
        assertFalse(CarNavigationBar.isSwipeUp(20, 5, 1));
        assertFalse(CarNavigationBar.isSwipeUp(30, 40, 1));
        assertFalse(CarNavigationBar.isSwipeUp(30, 5, 2));
    }
}
