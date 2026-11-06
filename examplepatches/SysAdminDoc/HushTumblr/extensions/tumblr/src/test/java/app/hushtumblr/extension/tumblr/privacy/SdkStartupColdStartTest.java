/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.privacy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.EnumSet;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * The first ad SDK provider of a cold start, in a process where nothing has loaded HushTumblr's
 * settings yet. On a device that is every launch: Vungle's provider runs before the application's
 * onCreate. A hook that names a setting or a capability before readying the settings loads the
 * settings classes with no context, they throw, and Tumblr dies at launch.
 *
 * <p>This class needs a Robolectric sandbox to itself, which is why it asks for an SDK level no
 * other test class uses. Robolectric shares one sandbox, and the classes loaded in it, between
 * every class on the same level, so on a shared level the settings classes are already loaded
 * and the crash can't happen. {@link SdkStartupTest} covers the decisions themselves. Keep this
 * one free of SettingsContextRule and of anything that touches the settings before the call.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SdkStartupColdStartTest {

    private static final class Provider extends ContentProvider {
        @Override public boolean onCreate() { return true; }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
        @Override public String getType(Uri uri) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        HookStatus.clear();
    }

    @Test
    public void theFirstProviderOfALaunchReadiesTheSettingsBeforeReadingThem() {
        assertFalse("another class readied the settings in this sandbox, so this test can't see the launch order;"
                + " give it an SDK level of its own again", Utils.settingsReady());
        Provider provider = new Provider();
        provider.attachInfo(RuntimeEnvironment.getApplication(), null);

        boolean skipped = SdkStartup.vungle(provider);

        assertTrue("the hook readied the settings for the rest of the launch", Utils.settingsReady());
        assertEquals("nothing threw inside the hook", "[]", HookStatus.missing().toString());
        assertFalse("not patched in, so Vungle starts", skipped);
        assertTrue("Hide ads reads its default, so the settings loaded cleanly", Settings.HIDE_ADS.get());

        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        assertTrue("patched in with Hide ads on, Vungle is kept from starting", SdkStartup.vungle(provider));
        assertTrue("LiveRamp too, with Disable analytics on", SdkStartup.liveRamp(provider));
    }
}
