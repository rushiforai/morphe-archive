/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import app.morphe.extension.facebook.navigation.TopBarButtons;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Search with a picture (#245): with the switch on, a long press on the top bar's search button
 * opens Google Lens in the Google app, then Lens on the web, then says nothing can open it. Off,
 * paused or hidden, the button keeps Facebook's own long press.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PictureSearchTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Application context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        HookStatus.clear();
        ShadowToast.reset();
    }

    @After
    public void tearDown() {
        PauseForTests.resume();
        Settings.SEARCH_WITH_PICTURE.resetToDefault();
        Settings.HIDE_SEARCH_BUTTON.resetToDefault();
        Shadows.shadowOf(context).checkActivities(false);
        HookStatus.clear();
    }

    /** In a parent, as in the bar, since a long press nobody takes asks the parent for a context menu. */
    private View button() {
        FrameLayout bar = new FrameLayout(context);
        View button = new FrameLayout(context);
        bar.addView(button);
        return button;
    }

    private void answers(Intent intent, String packageName) {
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = packageName;
        info.activityInfo.name = packageName + ".Lens";
        Shadows.shadowOf(context.getPackageManager()).addResolveInfoForIntent(intent, info);
    }

    private static boolean reported(String count) {
        for (String line : HookStatus.report()) {
            if (line.contains(count)) return true;
        }
        return false;
    }

    @Test
    public void theSwitchStartsOffWaitsForARestartAndBelongsToTheTabBarFamily() {
        assertFalse(Settings.SEARCH_WITH_PICTURE.defaultValue);
        assertTrue("the long press is set as the bar makes the button", Settings.SEARCH_WITH_PICTURE.rebootApp);
        assertTrue(PatchFamily.BOTTOM_TAB_BAR.switches.contains(Settings.SEARCH_WITH_PICTURE));
    }

    @Test
    public void aLongPressOpensLensInTheGoogleApp() {
        Settings.SEARCH_WITH_PICTURE.save(true);
        View search = button();
        TopBarButtons.searchButton(search);
        assertTrue("the button takes a long press", search.isLongClickable());
        assertEquals("a kept button stays in the bar", View.VISIBLE, search.getVisibility());

        assertTrue(search.performLongClick());

        Intent started = Shadows.shadowOf(context).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertEquals(PictureSearch.LENS_APP_URI, started.getDataString());
        assertEquals(PictureSearch.LENS_PACKAGE, started.getPackage());
        assertTrue(reported(PictureSearch.OPENED_APP));
    }

    @Test
    public void withoutTheGoogleAppItOpensLensOnTheWeb() {
        Settings.SEARCH_WITH_PICTURE.save(true);
        Shadows.shadowOf(context).checkActivities(true);
        answers(PictureSearch.lensWeb(), "com.android.chrome");
        View search = button();
        TopBarButtons.searchButton(search);

        assertTrue(search.performLongClick());

        Intent started = Shadows.shadowOf(context).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(PictureSearch.LENS_WEB_URL, started.getDataString());
        assertNull("the browser picks itself", started.getPackage());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertTrue(reported(PictureSearch.OPENED_WEB));
        assertFalse(reported(PictureSearch.OPENED_APP));
    }

    @Test
    public void theGoogleAppWinsOverTheWeb() {
        Settings.SEARCH_WITH_PICTURE.save(true);
        Shadows.shadowOf(context).checkActivities(true);
        answers(PictureSearch.lensApp(), PictureSearch.LENS_PACKAGE);
        answers(PictureSearch.lensWeb(), "com.android.chrome");
        View search = button();
        TopBarButtons.searchButton(search);

        assertTrue(search.performLongClick());

        assertEquals(PictureSearch.LENS_APP_URI, Shadows.shadowOf(context).getNextStartedActivity().getDataString());
        assertNull("one press opens one screen", Shadows.shadowOf(context).getNextStartedActivity());
    }

    @Test
    public void nothingToOpenItSaysSoWithoutThrowing() {
        Settings.SEARCH_WITH_PICTURE.save(true);
        Shadows.shadowOf(context).checkActivities(true);
        View search = button();
        TopBarButtons.searchButton(search);

        assertTrue(search.performLongClick());

        assertNull(Shadows.shadowOf(context).getNextStartedActivity());
        assertEquals("No app on this phone can open Google Lens", ShadowToast.getTextOfLatestToast());
        assertTrue(reported(PictureSearch.NO_LENS));
    }

    @Test
    public void offLeavesFacebooksOwnLongPress() {
        View search = button();
        TopBarButtons.searchButton(search);
        assertFalse(search.isLongClickable());
        assertFalse(search.performLongClick());
        assertNull(Shadows.shadowOf(context).getNextStartedActivity());
    }

    @Test
    public void aPressAfterTheSwitchWentOffOrWhilePausedDoesNothing() {
        Settings.SEARCH_WITH_PICTURE.save(true);
        View search = button();
        TopBarButtons.searchButton(search);

        Settings.SEARCH_WITH_PICTURE.save(false);
        assertFalse(search.performLongClick());
        assertNull(Shadows.shadowOf(context).getNextStartedActivity());

        Settings.SEARCH_WITH_PICTURE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse("paused, Facebook's own long press", search.performLongClick());
        assertNull(Shadows.shadowOf(context).getNextStartedActivity());
        assertEquals(0, ShadowToast.shownToastCount());
    }

    @Test
    public void aHiddenButtonGetsNoLongPress() {
        Settings.SEARCH_WITH_PICTURE.save(true);
        Settings.HIDE_SEARCH_BUTTON.save(true);
        View search = button();
        TopBarButtons.searchButton(search);
        assertEquals(View.GONE, search.getVisibility());
        assertFalse(search.isLongClickable());
    }
}
