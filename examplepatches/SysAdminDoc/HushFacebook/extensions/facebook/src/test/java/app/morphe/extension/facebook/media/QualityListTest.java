/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** A reel's quality list as Facebook's player stores it: an empty refill must not empty the row. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class QualityListTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final List<String> FULL = Arrays.asList("360p", "540p", "720p", "1080p");
    private static final String REEL = "https://video.example/reel-1.mpd";

    @Before
    public void inBuild() {
        QualityList.inBuildForTests = Boolean.TRUE;
        QualityList.forget();
        HookStatus.clear();
    }

    @After
    public void restore() {
        QualityList.inBuildForTests = null;
        QualityList.forget();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test
    public void aListWithQualitiesGoesThroughAsItCame() {
        assertSame(FULL, QualityList.keep(REEL, FULL));
    }

    @Test
    public void anEmptyListAfterAFullOneOfTheSameVideoGetsTheFullOneBack() {
        QualityList.keep(REEL, FULL);
        assertEquals(FULL, QualityList.keep(REEL, new ArrayList<>()));
        assertEquals(FULL, QualityList.keep(REEL, Collections.emptyList()));
        assertEquals(FULL, QualityList.keep(REEL, null));
        boolean counted = false;
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.PLAYBACK_QUALITY + ":") && line.contains(QualityList.KEPT)) counted = true;
        }
        assertTrue("the kept list is counted", counted);
    }

    @Test
    public void aNewerFullListReplacesTheRememberedOne() {
        QualityList.keep(REEL, FULL);
        List<String> fewer = Arrays.asList("360p", "540p");
        assertSame(fewer, QualityList.keep(REEL, fewer));
        assertEquals(fewer, QualityList.keep(REEL, new ArrayList<>()));
    }

    @Test
    public void anEmptyListForAnotherVideoStaysEmpty() {
        QualityList.keep(REEL, FULL);
        List<String> empty = new ArrayList<>();
        assertSame(empty, QualityList.keep("https://video.example/reel-2.mpd", empty));
    }

    @Test
    public void aVideoThatNeverHadQualitiesStaysEmpty() {
        List<String> empty = new ArrayList<>();
        assertSame(empty, QualityList.keep(REEL, empty));
        assertNull(QualityList.keep(REEL, null));
    }

    @Test
    public void withoutThePlayerItChangesNothing() {
        QualityList.keep(REEL, FULL);
        List<String> empty = new ArrayList<>();
        assertSame(empty, QualityList.keep(null, empty));
    }

    @Test
    public void aBuildWithoutThePatchOrAPausedAppChangesNothing() {
        QualityList.keep(REEL, FULL);
        List<String> empty = new ArrayList<>();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(empty, QualityList.keep(REEL, empty));
        PauseForTests.resume();
        QualityList.inBuildForTests = Boolean.FALSE;
        assertSame(empty, QualityList.keep(REEL, empty));
    }
}
