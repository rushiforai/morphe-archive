package dev.twitchpatches.extension.startup;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class StartupTabTest {
    @Test public void defaultsToLive() {
        assertEquals(StartupTab.LIVE, StartupTab.parse(null));
        assertEquals(StartupTab.LIVE, StartupTab.parse(""));
        assertEquals(StartupTab.LIVE, StartupTab.parse("unknown"));
        assertEquals(StartupTab.LIVE, StartupTab.parse("live"));
    }

    @Test public void roundTripsEveryTab() {
        assertEquals(StartupTab.FOLLOWING, StartupTab.parse(StartupTab.serialize(StartupTab.FOLLOWING)));
        assertEquals(StartupTab.LIVE, StartupTab.parse(StartupTab.serialize(StartupTab.LIVE)));
        assertEquals(StartupTab.CLIPS, StartupTab.parse(StartupTab.serialize(StartupTab.CLIPS)));
    }

    @Test public void labelsAreJapanese() {
        assertEquals("フォロー", StartupTab.label(StartupTab.FOLLOWING));
        assertEquals("ライブ", StartupTab.label(StartupTab.LIVE));
        assertEquals("クリップ", StartupTab.label(StartupTab.CLIPS));
    }
}
