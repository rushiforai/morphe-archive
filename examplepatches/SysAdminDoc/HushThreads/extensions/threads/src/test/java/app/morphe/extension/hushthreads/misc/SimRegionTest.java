/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/** What Spoof SIM region hands Threads for each SIM and network read, with its switch on, and off. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SimRegionTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.SPOOF_SIM_REGION.resetToDefault();
        SimRegions.REGION.resetToDefault();
    }

    @Test
    public void theSwitchStartsOffAndLeavesEveryReadAlone() {
        assertFalse(Settings.SPOOF_SIM_REGION.get());
        assertEquals("ph", SimRegion.countryIso("ph"));
        assertEquals("51503", SimRegion.operator("51503"));
        assertEquals("Smart", SimRegion.operatorName("Smart"));
        assertEquals("515", SimRegion.mcc("515"));
        assertEquals("03", SimRegion.mnc("03"));
        assertEquals(515, SimRegion.mccNumber(515));
        assertEquals("Smart", String.valueOf(SimRegion.carrierLabel("Smart")));
        assertEquals(1891, SimRegion.carrierId(1891));
        assertNull(SimRegion.countryIso(null));
    }

    @Test
    public void onEachReadAnswersTheChosenRegionsSim() {
        Settings.SPOOF_SIM_REGION.save(true);
        SimRegions.REGION.save("jp");
        assertEquals("jp", SimRegion.countryIso("us"));
        assertEquals("44010", SimRegion.operator("310260"));
        assertEquals("NTT DOCOMO", SimRegion.operatorName("T-Mobile"));
        assertEquals("440", SimRegion.mcc("310"));
        assertEquals("10", SimRegion.mnc("260"));
        assertEquals(440, SimRegion.mccNumber(310));
        assertEquals(10, SimRegion.mncNumber(260));
        assertEquals("NTT DOCOMO", String.valueOf(SimRegion.carrierLabel("T-Mobile")));
        // Android's carrier id would name the real carrier, so it reads as one Android doesn't know.
        assertEquals(SimRegion.UNKNOWN_CARRIER_ID, SimRegion.carrierId(1));
        // A phone with no SIM reads empty or null, and still gets the region.
        assertEquals("jp", SimRegion.countryIso(null));
        assertEquals("44010", SimRegion.operator(""));
    }

    @Test
    public void aThreeDigitNetworkCodeSplitsAfterTheCountryCode() {
        Settings.SPOOF_SIM_REGION.save(true);
        SimRegions.REGION.save("mx");
        assertEquals("334", SimRegion.mcc(null));
        assertEquals("020", SimRegion.mnc(null));
    }

    @Test
    public void theDefaultRegionIsTheUnitedStates() {
        Settings.SPOOF_SIM_REGION.save(true);
        assertEquals("us", SimRegion.countryIso("de"));
        assertEquals("310260", SimRegion.operator("26201"));
    }

    @Test
    public void aStoredRegionThatIsntListedLeavesThreadsItsOwnSim() {
        Settings.SPOOF_SIM_REGION.save(true);
        SimRegions.REGION.save("zz");
        assertEquals("de", SimRegion.countryIso("de"));
        assertEquals("26201", SimRegion.operator("26201"));
        assertEquals("262", SimRegion.mcc("262"));
    }

    @Test
    public void everyRegionIsAWellFormedRealSim() {
        Set<String> seen = new HashSet<>();
        for (SimRegions.Region region : SimRegions.REGIONS) {
            assertTrue(region.iso, region.iso.matches("[a-z]{2}"));
            assertTrue(region.iso + " is listed once", seen.add(region.iso));
            assertTrue(region.iso + ": " + region.mccMnc, region.mccMnc.matches("[0-9]{5,6}"));
            assertFalse(region.iso, region.carrier.trim().isEmpty());
            // Android knows the country, so its name shows in the picker rather than the code.
            assertFalse(region.iso, region.displayName(Locale.US).equalsIgnoreCase(region.iso));
            assertNotNull(SimRegions.find(region.iso.toUpperCase(Locale.ROOT) + " "));
        }
        assertNotNull("the default region is listed", SimRegions.find(SimRegions.REGION.defaultValue));
        assertNull(SimRegions.find(null));
    }
}
