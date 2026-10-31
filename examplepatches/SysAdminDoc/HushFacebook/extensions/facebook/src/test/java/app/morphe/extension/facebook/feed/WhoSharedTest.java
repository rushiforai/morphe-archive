/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.model.GraphQLStoryAttachment;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * See who shared: with the switch on, a post's menu gets the row below Facebook's own, unless the
 * post's share count reads zero or the menu is an attachment's. Off or paused, the menu is
 * Facebook's. Unpatched, a tap opens nothing and says so in the report.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class WhoSharedTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Context context = RuntimeEnvironment.getApplication();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.SEE_WHO_SHARED.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.WHO_SHARED + ":")) return line;
        }
        return null;
    }

    private Menu menuFor(Object item) {
        Menu menu = WhoSharedForTests.facebooksMenu(context);
        WhoShared.add(menu, new View(context), item, WhoSharedForTests.ICON);
        return menu;
    }

    @Test
    public void offByDefaultTheMenuIsFacebooks() {
        assertFalse("the switch doesn't start off", Settings.SEE_WHO_SHARED.get());
        assertEquals(1, menuFor(WhoSharedForTests.sharedPost(3)).size());
    }

    @Test
    public void onAPostSharedGetsTheRowBelowFacebooks() {
        Settings.SEE_WHO_SHARED.save(true);
        assertEquals(3, WhoShared.sharesOf(WhoSharedForTests.sharedPost(3)));
        Menu menu = menuFor(WhoSharedForTests.sharedPost(3));
        assertEquals(2, menu.size());
        assertEquals("Save post", menu.getItem(0).getTitle().toString());
        assertEquals("See who shared", menu.getItem(1).getTitle().toString());
        assertEquals(FamilyNames.WHO_SHARED + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    @Test
    public void aPostThatDoesntSayItsCountStillGetsTheRow() {
        Settings.SEE_WHO_SHARED.save(true);
        assertEquals(-1, WhoShared.sharesOf(new GraphQLStory()));
        assertEquals(2, menuFor(new GraphQLStory()).size());
    }

    @Test
    public void aPostNobodySharedGetsNoRow() {
        Settings.SEE_WHO_SHARED.save(true);
        assertEquals(0, WhoShared.sharesOf(WhoSharedForTests.sharedPost(0)));
        assertEquals(1, menuFor(WhoSharedForTests.sharedPost(0)).size());
    }

    @Test
    public void anAttachmentsMenuGetsNoRow() {
        Settings.SEE_WHO_SHARED.save(true);
        assertEquals(1, menuFor(new GraphQLStoryAttachment(null)).size());
        assertEquals(1, menuFor(null).size());
    }

    @Test
    public void pausedTheMenuIsFacebooks() {
        Settings.SEE_WHO_SHARED.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertEquals("a Hushfacebook paused by " + reason + " still added the row", 1,
                    menuFor(WhoSharedForTests.sharedPost(3)).size());
            PauseForTests.resume();
        }
    }

    /** Unpatched, the stub opens nothing: the tap answers false and the report names the launcher. */
    @Test
    public void unpatchedATapOpensNothingAndSaysSo() {
        Settings.SEE_WHO_SHARED.save(true);
        Menu menu = menuFor(WhoSharedForTests.sharedPost(3));
        MenuItem row = menu.getItem(1);
        assertNotNull(row);
        assertFalse(WhoShared.tap(context, WhoSharedForTests.sharedPost(3)));
        String line = statusLine();
        assertTrue(line, line.contains("1 missing"));
    }

    /** A tap after the switch went off does nothing. */
    @Test
    public void aTapAfterTheSwitchWentOffDoesNothing() {
        assertFalse(WhoShared.tap(context, WhoSharedForTests.sharedPost(3)));
        String line = statusLine();
        assertTrue(line, line == null || !line.contains("missing 1") && !line.contains("1 missing"));
    }
}
