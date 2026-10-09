/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Comment sheet options: with its switch on, the comment box's check answers no for the GIF and
 * sticker buttons, each counted, and leaves every other button to Facebook. With Like only on, the
 * reaction picker's method is told to return. With Open every reply thread on, a comment's state
 * starts with its replies open. With Hide related groups on, the check under a post's comments
 * answers no for the Related groups list and leaves every other plugin to Facebook (#101). Off,
 * paused, or before the settings are ready, nothing changes. The
 * row opens Facebook's own settings, in this package only.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CommentSheetOptionsTest {
    /** Another button the comment box's socket asks about, which always stays. */
    private static final String PHOTO_BUTTON =
            "com.facebook.feedback.comments.plugins.commentcomposer.attachmentbutton.photo.PhotoAttachmentButtonPlugin";

    /** Another plugin the socket under a post's comments asks about, which always stays. */
    private static final String RELATED_CONTENT =
            "com.facebook.feedback.comments.plugins.bottomcontent.impl.relatedcontent.RelatedContentPlugin";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.LIKE_ONLY.resetToDefault();
        Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.resetToDefault();
        Settings.OPEN_REPLY_THREADS.resetToDefault();
        Settings.HIDE_RELATED_GROUPS_UNDER_COMMENTS.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.COMMENT_SHEET_OPTIONS + ":")) return line;
        }
        return null;
    }

    @Test
    public void onTheGifAndStickerButtonsAreHeldAndThePickerSkippedEachCounted() {
        Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.save(true);
        Settings.LIKE_ONLY.save(true);
        assertFalse("the photo button was held", CommentSheetOptions.holdsButton(PHOTO_BUTTON));
        assertFalse("a button with no name was held", CommentSheetOptions.holdsButton(null));
        assertTrue("the GIF button stayed", CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
        assertTrue("the sticker button stayed", CommentSheetOptions.holdsButton(CommentSheetOptions.STICKER_BUTTON));
        assertTrue("the reaction picker opened", CommentSheetOptions.skipReactionPicker());
        assertEquals(FamilyNames.COMMENT_SHEET_OPTIONS + ": invoked 5, 2 found, 0 missing. Counted: "
                + CommentSheetOptions.BUTTON_HIDDEN + " 2, " + CommentSheetOptions.PICKER_SKIPPED + " 1", statusLine());
    }

    @Test
    public void onEveryReplyThreadStartsOpenAndIsCounted() {
        Settings.OPEN_REPLY_THREADS.save(true);
        assertTrue("a comment started with its replies closed", CommentSheetOptions.openReplyThreads(false));
        assertTrue("a comment started with its replies closed", CommentSheetOptions.openReplyThreads(false));
        assertTrue("a thread Facebook opened was closed", CommentSheetOptions.openReplyThreads(true));
        assertEquals(FamilyNames.COMMENT_SHEET_OPTIONS + ": invoked 3, 1 found, 0 missing. Counted: "
                + CommentSheetOptions.THREAD_OPENED + " 2", statusLine());
    }

    @Test
    public void onRelatedGroupsAreHeldUnderCommentsAndCounted() {
        Settings.HIDE_RELATED_GROUPS_UNDER_COMMENTS.save(true);
        assertFalse("another plugin under the comments was held", CommentSheetOptions.holdsBottomContent(RELATED_CONTENT));
        assertFalse("a plugin with no name was held", CommentSheetOptions.holdsBottomContent(null));
        assertFalse("the GIF button was held by the check under the comments",
                CommentSheetOptions.holdsBottomContent(CommentSheetOptions.GIF_BUTTON));
        assertTrue("Related groups stayed", CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));
        assertTrue("Related groups stayed", CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));
        assertEquals(FamilyNames.COMMENT_SHEET_OPTIONS + ": invoked 5, 1 found, 0 missing. Counted: "
                + CommentSheetOptions.RELATED_GROUPS_HIDDEN + " 2", statusLine());
    }

    @Test
    public void offPausedOrColdRelatedGroupsAreFacebooks() {
        assertFalse("Hide related groups doesn't start off", Settings.HIDE_RELATED_GROUPS_UNDER_COMMENTS.get());
        assertFalse("off, Related groups were held",
                CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));

        Settings.HIDE_RELATED_GROUPS_UNDER_COMMENTS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " held Related groups",
                    CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse("Related groups were held before the settings were ready",
                CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS)));

        String line = statusLine();
        assertFalse("a plugin left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, Related groups stayed",
                CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));
    }

    @Test
    public void offPausedOrColdTheReplyThreadIsFacebooks() {
        assertFalse("Open every reply thread doesn't start off", Settings.OPEN_REPLY_THREADS.get());
        assertFalse("off, a comment started with its replies open", CommentSheetOptions.openReplyThreads(false));
        assertTrue("off, a thread Facebook opened was closed", CommentSheetOptions.openReplyThreads(true));

        Settings.OPEN_REPLY_THREADS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " opened a reply thread",
                    CommentSheetOptions.openReplyThreads(false));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(
                "a reply thread was opened before the settings were ready", CommentSheetOptions.openReplyThreads(false)));

        String line = statusLine();
        assertFalse("a thread left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, a comment started with its replies closed",
                CommentSheetOptions.openReplyThreads(false));
    }

    @Test
    public void eachSwitchAnswersOnlyForItsOwnHook() {
        Settings.LIKE_ONLY.save(true);
        assertFalse("Like only held the GIF button", CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
        assertTrue("Like only left the picker to open", CommentSheetOptions.skipReactionPicker());
        Settings.LIKE_ONLY.save(false);
        Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.save(true);
        assertFalse("the button switch kept the picker closed", CommentSheetOptions.skipReactionPicker());
        assertFalse("the button switch opened a reply thread", CommentSheetOptions.openReplyThreads(false));
        assertTrue("the button switch left the GIF button", CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
        Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.save(false);
        Settings.OPEN_REPLY_THREADS.save(true);
        assertFalse("the reply switch held the GIF button", CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
        assertFalse("the reply switch kept the picker closed", CommentSheetOptions.skipReactionPicker());
        assertTrue("the reply switch left a thread closed", CommentSheetOptions.openReplyThreads(false));
        assertFalse("the reply switch held Related groups",
                CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));
        Settings.OPEN_REPLY_THREADS.save(false);
        Settings.HIDE_RELATED_GROUPS_UNDER_COMMENTS.save(true);
        assertFalse("the related groups switch held the GIF button",
                CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
        assertFalse("the related groups switch kept the picker closed", CommentSheetOptions.skipReactionPicker());
        assertFalse("the related groups switch opened a reply thread", CommentSheetOptions.openReplyThreads(false));
        assertTrue("the related groups switch left Related groups",
                CommentSheetOptions.holdsBottomContent(CommentSheetOptions.RELATED_GROUPS));
    }

    @Test
    public void offOrPausedNothingChanges() {
        assertFalse("Like only doesn't start off", Settings.LIKE_ONLY.get());
        assertFalse("the button switch doesn't start off", Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.get());
        assertFalse("off, the GIF button was held", CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
        assertFalse("off, the picker was kept closed", CommentSheetOptions.skipReactionPicker());

        Settings.LIKE_ONLY.save(true);
        Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " held the sticker button",
                    CommentSheetOptions.holdsButton(CommentSheetOptions.STICKER_BUTTON));
            assertFalse("a Hushfacebook paused by " + reason + " kept the picker closed",
                    CommentSheetOptions.skipReactionPicker());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertFalse("a button was held before the settings were ready",
                    CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
            assertFalse("the picker was kept closed before the settings were ready",
                    CommentSheetOptions.skipReactionPicker());
        });

        String line = statusLine();
        assertFalse("a hook left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, the GIF button stayed",
                CommentSheetOptions.holdsButton(CommentSheetOptions.GIF_BUTTON));
    }

    @Test
    public void theSwitchesNeedNoRestartAndTravelWithTheirFamily() {
        for (app.morphe.extension.shared.settings.BooleanSetting setting : new app.morphe.extension.shared.settings.BooleanSetting[] {
                Settings.LIKE_ONLY, Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS, Settings.OPEN_REPLY_THREADS,
                Settings.HIDE_RELATED_GROUPS_UNDER_COMMENTS}) {
            assertFalse(setting.key + " asks for a restart, but each hook reads it again", setting.rebootApp);
            assertNull(setting.key + " asks before it changes", setting.userDialogMessage);
            assertTrue("Pause and the report don't know " + setting.key,
                    PatchFamily.COMMENT_SHEET_OPTIONS.switches.contains(setting));
        }
    }

    @Test
    public void theRowOpensFacebooksOwnSettingsInThisPackageOnly() {
        Application context = RuntimeEnvironment.getApplication();
        Intent route = CommentSheetOptions.reactionSettingsIntent(context);
        assertEquals(Intent.ACTION_VIEW, route.getAction());
        assertEquals("fb://facebook_settings/", route.getDataString());
        assertEquals("the route could leave Facebook", context.getPackageName(), route.getPackage());

        assertFalse("a build with no activity for the route said it opened",
                CommentSheetOptions.openReactionSettings(context));
        assertNull(shadowOf(context).getNextStartedActivity());

        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = context.getPackageName();
        info.activityInfo.name = context.getPackageName() + ".IntentUriHandler";
        shadowOf(context.getPackageManager()).addResolveInfoForIntent(route, info);
        assertTrue("the route didn't open", CommentSheetOptions.openReactionSettings(context));
        Intent started = shadowOf(context).getNextStartedActivity();
        assertNotNull(started);
        assertEquals("fb://facebook_settings/", started.getDataString());
        assertEquals(context.getPackageName() + ".IntentUriHandler", started.getComponent().getClassName());
        assertTrue("an application context started the route outside a task",
                (started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }
}
