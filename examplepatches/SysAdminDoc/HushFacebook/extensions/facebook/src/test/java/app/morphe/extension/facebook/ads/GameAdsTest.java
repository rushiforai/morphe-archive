/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The game bridge asking about each message a game sends: an ad message gets its promise rejected
 * with the SDK's code while the switch is on, and everything else goes on to Facebook.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GameAdsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.BLOCK_GAME_ADS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String message(String type, String promise) {
        return "{\"type\":\"" + type + "\",\"content\":{\"promiseID\":\"" + promise + "\",\"placementID\":\"1_2\"}}";
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(GameAds.ROUTE + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndEveryAdMessageIsAnsweredWithNoAd() {
        assertTrue("the switch starts off", Settings.BLOCK_GAME_ADS.get());
        for (String[] ad : GameAds.AD_MESSAGES) {
            String message = message(ad[0], "p-" + ad[0]);
            assertEquals(ad[0], "p-" + ad[0], GameAds.heldPromise(message));
            assertEquals(ad[0], ad[1], GameAds.rejection(message));
        }
        assertEquals(GameAds.ROUTE + ": 5 lists, 5 items, 5 removed. Last reason: no ad. Removed: no ad 5. Kinds: "
                + "getinterstitialadasync 1, getrewardedvideoasync 1, loadadasync 1, loadbanneradasync 1, showadasync 1",
                counterLine());
    }

    @Test
    public void rewardedAndInterstitialAdsGetTheSdkCodes() {
        assertEquals("CLIENT_UNSUPPORTED_OPERATION", GameAds.rejection(message("getrewardedvideoasync", "1")));
        assertEquals("ADS_NO_FILL", GameAds.rejection(message("loadadasync", "1")));
        assertEquals("ADS_NOT_LOADED", GameAds.rejection(message("showadasync", "1")));
    }

    /** The game's other messages go on to Facebook uncounted, and so does hiding a banner. */
    @Test
    public void otherMessagesGoOn() {
        assertNull(GameAds.heldPromise(message("setplayerdataasync", "1")));
        assertNull(GameAds.heldPromise(message("hidebanneradasync", "1")));
        assertNull(GameAds.heldPromise(message("paymentspurchaseasync", "1")));
        assertNull("an ad type named elsewhere in the message",
                GameAds.heldPromise("{\"type\":\"shareasync\",\"content\":{\"text\":\"loadadasync\",\"promiseID\":\"1\"}}"));
        assertNull(counterLine());
        assertTrue(HookStatus.report("").toString(), HookStatus.report("").toString()
                .contains(FamilyNames.GAME_ADS + ": invoked 4"));
    }

    @Test
    public void offOrPausedTheGameGetsItsAd() {
        Settings.BLOCK_GAME_ADS.save(false);
        assertNull(GameAds.heldPromise(message("loadadasync", "1")));
        assertEquals(GameAds.ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: loadadasync 1", counterLine());
        Settings.BLOCK_GAME_ADS.resetToDefault();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull(GameAds.heldPromise(message("loadadasync", "1")));
        PauseForTests.resume();
        assertEquals("1", GameAds.heldPromise(message("loadadasync", "1")));
    }

    /** A message it can't read, or one with no promise to answer, goes on as it came. */
    @Test
    public void whatItCantReadGoesOn() {
        assertNull(GameAds.heldPromise(null));
        assertNull(GameAds.heldPromise("loadadasync"));
        assertNull(GameAds.heldPromise("{\"type\":\"loadadasync\"}"));
        assertNull(GameAds.heldPromise("{\"type\":\"loadadasync\",\"content\":{}}"));
        assertNull(GameAds.heldPromise("{\"type\":\"loadadasync\",\"content\":{\"promiseID\":\"\"}}"));
        assertEquals("ADS_NO_FILL", GameAds.rejection(null));
    }
}
