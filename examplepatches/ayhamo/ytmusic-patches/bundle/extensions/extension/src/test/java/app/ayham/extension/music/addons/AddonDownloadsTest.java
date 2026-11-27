package app.ayham.extension.music.addons;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Downloads follow the addons' "Off on mobile data" switch (protocol.md §8.4.3, the phone's Wi-Fi only). */
public class AddonDownloadsTest {
    @Test
    public void aDownloadWaitsOfflineAndOnMobileDataWithTheSwitchOn() {
        assertTrue(AddonDownloads.mayFetch(true, false));
        assertFalse(AddonDownloads.mayFetch(true, true));   // mobile data, switch on: waits for Wi-Fi
        assertFalse(AddonDownloads.mayFetch(false, false)); // offline: waits for the network
    }
}
