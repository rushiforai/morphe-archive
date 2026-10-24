/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.share;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.live.LiveRecordQuality;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** LIVE recording quality in a LIVE room's share sheet (#203). */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28, qualifiers = "en")
public class ShareLiveQualityTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for BaseSharePackage, whose itemType is a public field TikTok never renames. */
    public static final class Package {
        public final String itemType;
        Package(String itemType) { this.itemType = itemType; }
    }

    public static final class Action {
        private final String originalKey;
        Action(String key) { originalKey = key; }
        public String key() {
            String owned = OwnedShareActions.key(this);
            return owned == null ? originalKey : owned;
        }
    }

    private Activity activity;
    private int constructed;
    private int picks;
    private String previousQuality;
    private boolean previousRecord;

    @Before public void setUp() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        Utils.setActivity(activity);
        previousQuality = Settings.LIVE_RECORD_QUALITY.get();
        previousRecord = Settings.RECORD_LIVE.get();
        SettingsStatus.liveControlsEnabled = true;
        Settings.RECORD_LIVE.save(true);
        ShareLiveQuality.nativeForTests = from -> {
            assertSame(activity, from);
            constructed++;
            return new Action("report");
        };
        ShareLiveQuality.pickerForTests = context -> picks++;
    }

    @After public void tearDown() {
        ShareLiveQuality.nativeForTests = null;
        ShareLiveQuality.pickerForTests = null;
        ((List<?>) ReflectionHelpers.getStaticField(ShareLiveQuality.class, "BUILT")).clear();
        Settings.LIVE_RECORD_QUALITY.save(previousQuality);
        Settings.RECORD_LIVE.save(previousRecord);
        SettingsStatus.liveControlsEnabled = false;
        PausedProcess.set(false);
        activity.finish();
    }

    private static List<Object> row() {
        return new ArrayList<>(Arrays.asList(new Action("report"), new Action("save")));
    }

    @Test public void joinsALiveSheetOnceAndLeavesTheNativeRowAlone() {
        Package live = new Package("live");
        List<Object> nativeRow = row();
        List<?> finished = ShareLiveQuality.actions(live, nativeRow);
        assertEquals(2, nativeRow.size());
        assertEquals(3, finished.size());
        assertEquals(ShareLiveQuality.KEY, ((Action) finished.get(2)).key());
        assertEquals("report", ((Action) finished.get(0)).key());
        assertEquals("LIVE recording quality", OwnedShareActions.label(finished.get(2)));
        assertTrue(OwnedShareActions.owns(finished.get(2)));
        // The same sheet read again keeps the one action.
        List<?> again = ShareLiveQuality.actions(live, new ArrayList<>(finished));
        assertEquals(3, again.size());
        assertSame(finished.get(2), again.get(2));
        assertEquals(1, constructed);
    }

    @Test public void staysOutOfVideoAndProfileSheets() {
        for (String type : new String[] {"aweme", "user"}) {
            List<Object> nativeRow = row();
            assertSame(nativeRow, ShareLiveQuality.actions(new Package(type), nativeRow));
        }
        assertEquals(0, constructed);
    }

    @Test public void staysOutWhileRecordingIsOffOrHushfeedIsPaused() {
        Settings.RECORD_LIVE.save(false);
        List<Object> nativeRow = row();
        assertSame(nativeRow, ShareLiveQuality.actions(new Package("live"), nativeRow));
        Settings.RECORD_LIVE.save(true);
        PausedProcess.set(true);
        assertSame(nativeRow, ShareLiveQuality.actions(new Package("live"), nativeRow));
        assertEquals(0, constructed);
    }

    @Test public void aTapOpensTheChoiceOnlyForTheSheetItWasBuiltFor() {
        Package live = new Package("live");
        List<?> finished = ShareLiveQuality.actions(live, row());
        Object mine = finished.get(2);
        assertTrue(OwnedShareActions.click(mine, activity, live));
        assertEquals(1, picks);
        assertTrue("an owned action is consumed on another sheet too", OwnedShareActions.click(mine, activity, new Package("live")));
        assertEquals(1, picks);
        assertFalse(OwnedShareActions.click(new Action("report"), activity, live));
    }

    @Test public void aPickIsWrittenForTheRecorder() {
        Settings.LIVE_RECORD_QUALITY.save("room");
        for (int i = 0; i < LiveRecordQuality.VALUES.length; i++) {
            ShareLiveQuality.choose(i);
            assertEquals(LiveRecordQuality.VALUES[i], Settings.LIVE_RECORD_QUALITY.get());
        }
        ShareLiveQuality.choose(-1);
        ShareLiveQuality.choose(LiveRecordQuality.VALUES.length);
        assertEquals("ld", Settings.LIVE_RECORD_QUALITY.get());
    }

    @Test public void theChoiceListMatchesTheSettingsPage() {
        assertEquals(LiveRecordQuality.LABELS.length, LiveRecordQuality.VALUES.length);
        assertEquals(0, LiveRecordQuality.indexOf("room"));
        assertEquals(4, LiveRecordQuality.indexOf("uhd"));
        assertEquals(0, LiveRecordQuality.indexOf("nonsense"));
        assertEquals(0, LiveRecordQuality.indexOf(null));
    }
}
