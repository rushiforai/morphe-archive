/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.FrameLayout;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** #11: a long press on a video in a post did nothing, since 46.9's long-press callback for it is empty. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoLinksTest {
    private static final String ADDRESS = "https://va.media.tumblr.com/tumblr_s0m3v1d30_720.mp4";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private ActivityController<Activity> controller;
    private Activity activity;
    private int tumblrPresses;
    private final View.OnLongClickListener tumblrs = pressed -> {
        tumblrPresses++;
        return false;
    };

    @Before public void setUp() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.SHARE_VIDEO_LINKS.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
        ShadowAlertDialog.reset();
        ShadowToast.reset();
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After public void restore() {
        controller.close();
        Settings.SHARE_VIDEO_LINKS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test public void startsOffSoALongPressStaysTumblrs() {
        assertFalse(Settings.SHARE_VIDEO_LINKS.get());
        assertFalse(VideoLinks.press(tumblrs).onLongClick(controlsFor(ADDRESS)));
        assertEquals(1, tumblrPresses);
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
    }

    @Test public void aLongPressOnAVideoOffersItsLinkInsteadOfTumblrsEmptyCallback() {
        Settings.SHARE_VIDEO_LINKS.save(true);
        assertTrue(VideoLinks.press(tumblrs).onLongClick(controlsFor(ADDRESS)));
        assertEquals("Tumblr's listener is skipped", 0, tumblrPresses);
        AlertDialog menu = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(menu);
        assertTrue(menu.isShowing());
        assertEquals(Arrays.asList("Share video link", "Copy video link", "Save video"), texts(shadowOf(menu).getItems()));
    }

    @Test public void shareHandsTheAddressToTheShareSheet() {
        Settings.SHARE_VIDEO_LINKS.save(true);
        VideoLinks.press(tumblrs).onLongClick(controlsFor(ADDRESS));
        shadowOf(ShadowAlertDialog.getLatestAlertDialog()).clickOnItem(0);
        Intent chooser = shadowOf(activity).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals(Intent.ACTION_SEND, send.getAction());
        assertEquals("text/plain", send.getType());
        assertEquals(ADDRESS, send.getStringExtra(Intent.EXTRA_TEXT));
    }

    @Test public void copyTakesTheVideoTheContainerPlaysNow() {
        Settings.SHARE_VIDEO_LINKS.save(true);
        View controls = controlsFor("https://va.media.tumblr.com/tumblr_an0ld3rv1d30_480.mp4");
        // Tumblr reuses the container for the next video as the list scrolls.
        VideoLinks.bind(containerOf(controls), " " + ADDRESS + "\n");
        VideoLinks.press(tumblrs).onLongClick(controls);
        shadowOf(ShadowAlertDialog.getLatestAlertDialog()).clickOnItem(1);
        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        assertEquals(ADDRESS, clipboard.getPrimaryClip().getItemAt(0).getText().toString());
        ShadowLooper.idleMainLooper();
        assertEquals("Video link copied", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aViewWithNoVideoAForgottenVideoAndPauseLeaveThePressToTumblr() {
        Settings.SHARE_VIDEO_LINKS.save(true);
        View.OnLongClickListener pressed = VideoLinks.press(tumblrs);
        assertFalse(pressed.onLongClick(new View(activity)));
        View controls = controlsFor(ADDRESS);
        VideoLinks.bind(containerOf(controls), "  ");
        assertFalse("a blank address forgets the old one", pressed.onLongClick(controls));
        VideoLinks.bind(containerOf(controls), ADDRESS);
        int paused = 0;
        for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
            if (reason == HushTumblrPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), pressed.onLongClick(controls));
            PauseForTests.resume();
            paused++;
        }
        SettingsContextRule.withoutContext(() -> assertFalse(pressed.onLongClick(controls)));
        assertEquals(3 + paused, tumblrPresses);
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
    }

    @Test public void withoutItsHookTheControlsKeepTumblrsListener() {
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        Settings.SHARE_VIDEO_LINKS.save(true);
        assertSame(tumblrs, VideoLinks.press(tumblrs));
        View controls = controlsFor(ADDRESS);
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        assertFalse("nothing was remembered while the hook was missing", VideoLinks.press(tumblrs).onLongClick(controls));
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
    }

    /** The controls sit inside an overlay in the container, like the player's own. */
    private View controlsFor(String address) {
        FrameLayout container = new FrameLayout(activity);
        FrameLayout overlay = new FrameLayout(activity);
        View controls = new View(activity);
        overlay.addView(controls);
        container.addView(overlay);
        VideoLinks.bind(container, address);
        return controls;
    }

    private static View containerOf(View controls) {
        return (View) controls.getParent().getParent();
    }

    private static List<String> texts(CharSequence[] items) {
        List<String> texts = new ArrayList<>();
        for (CharSequence item : items) texts.add(item.toString());
        return texts;
    }
}
