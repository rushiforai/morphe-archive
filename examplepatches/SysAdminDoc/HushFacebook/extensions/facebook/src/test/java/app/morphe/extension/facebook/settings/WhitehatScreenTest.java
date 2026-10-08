/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Looper;
import android.preference.Preference;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import java.io.File;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * Facebook's Whitehat settings: the row starts Facebook's own screen by its explicit component, and
 * only when the module the screen loads is on the phone. Without it the screen would throw in its
 * own onBeforeActivityCreate and close Facebook, so the row opens the web page instead.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class WhitehatScreenTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private static final String HASH = "6efdf7511d05bf916f6075fed6f823ad3d42d73bd1e2f70bdafab2a220d8b12d";
    /** The shape of 581's assets/app_modules.json, cut down to a neighbour and the module. */
    private static final String APP_MODULES = "{\"built_in\":[{\"name\":\"longtail\",\"requires_native\":false}],"
            + "\"downloadable\":[{\"disabled\":false,\"hash\":\"abc\",\"name\":\"awesomizer\",\"requires_native\":false},"
            + "{\"disabled\":false,\"hash\":\"" + HASH + "\",\"name\":\"internsettings\",\"requires_native\":true}]}";

    private Activity activity;

    @Before
    public void open() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    @After
    public void restore() {
        WhitehatScreen.availableForTests = null;
    }

    @Test
    public void theScreenIsFacebooksOwnActivityInThisPackage() {
        Intent screen = WhitehatScreen.screenIntent(activity);
        assertEquals(new ComponentName(activity.getPackageName(),
                "com.facebook.katana.internsettingsactivity.WhitehatSettingsActivity"), screen.getComponent());
        assertNull("the screen needs no action", screen.getAction());
        assertNull(screen.getData());
    }

    @Test
    public void withTheModuleTheRowStartsTheScreen() {
        WhitehatScreen.availableForTests = true;
        Preference row = WhitehatScreen.row(activity);
        assertEquals("Facebook's Whitehat settings", String.valueOf(row.getTitle()));
        assertTrue(String.valueOf(row.getSummary()), String.valueOf(row.getSummary()).startsWith("Facebook's own screen"));
        assertFalse("the row saved something", row.isPersistent());

        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        Intent started = shadowOf(activity).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(WhitehatScreen.screenIntent(activity).getComponent(), started.getComponent());
        assertNull("the web page opened as well", shadowOf(activity).getNextStartedActivity());
    }

    @Test
    public void withoutTheModuleTheRowSaysSoAndOpensTheWebPage() {
        WhitehatScreen.availableForTests = false;
        Preference row = WhitehatScreen.row(activity);
        assertTrue(String.valueOf(row.getSummary()), String.valueOf(row.getSummary()).contains("hasn't downloaded"));

        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        Intent started = shadowOf(activity).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertNull("Facebook's screen was started without its module", started.getComponent());
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://www.facebook.com/whitehat", started.getDataString());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertNull(shadowOf(activity).getNextStartedActivity());
    }

    @Test
    public void aBuildWithoutTheScreenShowsAToastInsteadOfClosing() {
        WhitehatScreen.availableForTests = true;
        shadowOf(activity.getApplication()).checkActivities(true);
        WhitehatScreen.open(activity);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("This Facebook build has no Whitehat settings screen.", ShadowToast.getTextOfLatestToast());
    }

    @Test
    public void thePhoneWithNoModuleMetadataGetsTheWebPage() {
        // Robolectric's app has no assets/app_modules.json and no splits: the real check says no.
        assertFalse(WhitehatScreen.available(activity));
    }

    @Test
    public void aDownloadedModuleIsFoundWhereFacebooksLoaderLooks() throws Exception {
        File data = folder.newFolder("data");
        assertFalse("nothing downloaded yet", WhitehatScreen.installed(APP_MODULES, data, null));

        File stale = new File(data, "modules/internsettings_0123/download.zip");
        assertTrue(stale.getParentFile().mkdirs() && stale.createNewFile());
        assertFalse("another build's download counted", WhitehatScreen.installed(APP_MODULES, data, null));

        File zip = new File(data, "modules/internsettings_" + HASH + "/download.zip");
        assertTrue(zip.getParentFile().mkdirs() && zip.createNewFile());
        assertTrue(WhitehatScreen.installed(APP_MODULES, data, null));

        assertFalse("no metadata", WhitehatScreen.installed(null, data, null));
        assertFalse("unreadable metadata", WhitehatScreen.installed("{not json", data, null));
        assertFalse("a disabled module", WhitehatScreen.installed(APP_MODULES.replace(
                "{\"disabled\":false,\"hash\":\"" + HASH, "{\"disabled\":true,\"hash\":\"" + HASH), data, null));
    }

    @Test
    public void anInstalledSplitCounts() throws Exception {
        File split = folder.newFile("split_internsettings.apk");
        File other = folder.newFile("split_awesomizer.apk");
        assertTrue(WhitehatScreen.installed(null, null, new String[] {other.getPath(), split.getPath()}));
        assertFalse(WhitehatScreen.installed(null, null, new String[] {other.getPath()}));
        assertFalse("a listed split that isn't on disk",
                WhitehatScreen.installed(null, null, new String[] {new File(folder.getRoot(), "gone/split_internsettings.apk").getPath()}));
    }
}
