/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Looper;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.time.Duration;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.Shadows;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.ShadowReplacingAtomicFile;
import app.hushtumblr.extension.shared.WorkerPoolForTests;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RootPostMuteUiTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private ActivityController<Activity> controller;

    @Before public void prepare() {
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        ShadowReplacingAtomicFile.closeOnFlushFor = null;
        ShadowReplacingAtomicFile.refuseReadFor = null;
        ShadowReplacingAtomicFile.refusedReads = 0;
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        PatchFamilyForTests.inBuild(EnumSet.of(PatchFamily.MUTE_ROOT_POSTS));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.ROOT_POST_MUTES));
        Settings.MUTE_ROOT_POSTS.save(true); PauseForTests.resume();
        RootPostMutes.fileForTests = new File(temporary.getRoot(), "private.json");
        RootPostMutes.workerForTests = Runnable::run; RootPostMutes.resetForTests();
        account("account-a");
    }

    @After public void restore() {
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        ShadowReplacingAtomicFile.closeOnFlushFor = null;
        ShadowReplacingAtomicFile.refuseReadFor = null;
        ShadowReplacingAtomicFile.refusedReads = 0;
        controller.close(); RootPostMutes.resetForTests();
        RootPostMutes.fileForTests = null; RootPostMutes.workerForTests = null;
        Settings.MUTE_ROOT_POSTS.resetToDefault(); PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null); PauseForTests.resume();
    }

    private void account(String id) {
        RootPostMutes.credentialsChanging(); RootPostMutes.credentialsChanged();
        Object request = new Object(); RootPostMutes.requestCreated(request); RootPostMutes.requestEntered(request);
        RootPostMutes.beginAccountChange((HushAccountIdentity) () -> id);
        RootPostMutes.commitAccount(); RootPostMutes.requestExited();
    }

    private RootPostMutes.Undo mute(String root) {
        AtomicReference<RootPostMutes.Undo> undo = new AtomicReference<>();
        RootPostMutes.mute(RootPostMutes.capture(), root, undo::set); assertNotNull(undo.get()); return undo.get();
    }

    @Test public void fragmentDismissalMakesRetainedManagerListAndClearActionsInert() {
        mute("11");
        RootPostMutePreference row = new RootPostMutePreference(controller.get()); row.onClick();
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog(); assertTrue(dialog.isShowing());
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        Button clear = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        row.closeDialogs(); assertFalse(dialog.isShowing());
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        list.performItemClick(null, 0, 0); clear.performClick();
        assertTrue(queued.isEmpty()); assertEquals(1, RootPostMutes.capture().roots.size());
    }

    @Test public void anAccountChangeMakesAnOpenManagerInert() {
        mute("11"); AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        account("account-b"); mute("22");
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        list.performItemClick(null, 0, 0); dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        assertTrue(queued.isEmpty()); assertEquals(java.util.Set.of("22"), RootPostMutes.capture().roots);
        dialog.dismiss();
    }

    @Test public void undoRestoresImmediatelyAndAnExpiredRetainedButtonDoesNothing() {
        RootPostMuteUi.changed(controller.get(), "Post muted locally", mute("11"));
        Button undo = find(controller.get().findViewById(android.R.id.content), Button.class);
        assertNotNull(undo); undo.performClick(); assertTrue(RootPostMutes.capture().roots.isEmpty());
        mute("22"); undo.performClick();
        assertEquals(java.util.Set.of("22"), RootPostMutes.capture().roots);
    }

    @Test public void aDismissedManagerDoesNotPublishItsQueuedCompletionIntoANewView() {
        mute("11"); RootPostMutePreference row = new RootPostMutePreference(controller.get()); row.onClick();
        AlertDialog old = ShadowAlertDialog.getLatestAlertDialog();
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        clickFirstPost(old);
        assertEquals(1, queued.size()); row.closeDialogs(); row.onClick();
        AlertDialog replacement = ShadowAlertDialog.getLatestAlertDialog(); assertNotSame(old, replacement);
        queued.get(0).run(); assertTrue(replacement.isShowing());
        assertEquals(0, ((ViewGroup) controller.get().findViewById(android.R.id.content)).getChildCount());
        row.closeDialogs();
    }

    @Test public void theMenuActionRemovesOriginalAndReblogNowAndUndoPreservesANewPage() {
        Object heading = new Object();
        app.hushtumblr.extension.tumblr.timeline.HushRootPost original = () -> "11";
        app.hushtumblr.extension.tumblr.timeline.HushRootPost reblog = () -> "11";
        app.hushtumblr.extension.tumblr.timeline.HushRootPost other = () -> "22";
        FakeTimeline timeline = new FakeTimeline(java.util.Arrays.asList(heading, original, reblog, other));
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        new RootPostMuteAction("11", controller.get(), timeline).run();
        assertEquals(1, queued.size()); assertEquals(4, timeline.items.size());
        app.hushtumblr.extension.tumblr.timeline.HushRootPost nextPage = () -> "33";
        timeline.items.add(nextPage);
        RootPostMutes.workerForTests = Runnable::run; queued.get(0).run();
        assertEquals(java.util.Arrays.asList(heading, other, nextPage), timeline.items);
        Button undo = find(controller.get().findViewById(android.R.id.content), Button.class);
        assertNotNull(undo);
        app.hushtumblr.extension.tumblr.timeline.HushRootPost laterPage = () -> "44";
        timeline.items.add(laterPage); undo.performClick();
        assertEquals(java.util.Arrays.asList(heading, original, reblog, other, nextPage, laterPage), timeline.items);
        assertTrue(RootPostMutes.capture().roots.isEmpty());
    }

    @Test public void aFilteredPageAlreadyMissingTheRootKeepsTheSavedMuteAndUndoDoesNotReplaceIt() {
        Object heading = new Object();
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        app.hushtumblr.extension.tumblr.timeline.HushRootPost other = () -> "22";
        FakeTimeline timeline = new FakeTimeline(java.util.Arrays.asList(heading, selected, other));
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        new RootPostMuteAction("11", controller.get(), timeline).run();
        assertEquals(1, queued.size());
        app.hushtumblr.extension.tumblr.timeline.HushRootPost newPage = () -> "33";
        timeline.items = new ArrayList<>(java.util.Arrays.asList(heading, other, newPage));
        RootPostMutes.workerForTests = Runnable::run; queued.get(0).run();
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        assertEquals(0, timeline.applies);
        Button undo = find(controller.get().findViewById(android.R.id.content), Button.class);
        assertNotNull(undo); undo.performClick();
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        assertEquals(java.util.Arrays.asList(heading, other, newPage), timeline.items);
        assertEquals(0, timeline.applies);
    }

    @Test public void aRejectedLocalRebindRollsBackTheSavedMute() {
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        HushLocalTimeline refuses = new HushLocalTimeline() {
            @Override public List<?> hushTimelineItems() { return java.util.List.of(selected); }
            @Override public void hushApplyTimelineItems(List<?> items) { }
        };
        new RootPostMuteAction("11", controller.get(), refuses).run();
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    @Test public void aFailedRebindRollbackDisclosesTheSavedMuteAndRetriesOnlyThatRoot() throws Exception {
        File saved = RootPostMutes.fileForTests;
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> ShadowReplacingAtomicFile.refuseCommitFor = saved)).run();
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        assertTrue(menuNotice().getText().toString().contains("still muted locally"));
        Button unmute = menuRecovery();
        unmute.performClick();
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        assertTrue(unmute.isEnabled());
        assertTrue(menuNotice().getText().toString().contains("Try again"));
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        mute("22");
        unmute.performClick();
        assertEquals(java.util.Set.of("22"), RootPostMutes.capture().roots);
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    @Test public void aRefusedRollbackWorkerKeepsUsableRecoveryAfterAdmissionReturns() throws Exception {
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> { })).run();
        assertEquals(1, queued.size());
        Button unmute;
        try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
            RootPostMutes.workerForTests = null;
            queued.get(0).run();
            assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
            assertTrue(menuNotice().getText().toString().contains("still muted locally"));
            unmute = menuRecovery();
            unmute.performClick();
            assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
            assertTrue(unmute.isEnabled());
            assertTrue(menuNotice().getText().toString().contains("Try again"));
        }
        RootPostMutes.workerForTests = Runnable::run;
        unmute.performClick();
        assertTrue(RootPostMutes.capture().roots.isEmpty());
    }

    @Test public void aRollbackRevisionConflictOffersUnmuteWithoutOverwritingLaterChanges() {
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> mute("22"))).run();
        assertEquals(java.util.Set.of("11", "22"), RootPostMutes.capture().roots);
        Button unmute = menuRecovery();
        mute("33");
        unmute.performClick();
        assertEquals(java.util.Set.of("22", "33"), RootPostMutes.capture().roots);
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    @Test public void aConflictingEditThatAlreadyUnmutedTheRootDoesNotOfferStaleRecovery() {
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> {
            RootPostMutes.remove(RootPostMutes.capture(), "11", ignored -> { });
            mute("22");
        })).run();
        assertEquals(java.util.Set.of("22"), RootPostMutes.capture().roots);
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
        assertNull(controller.get().findViewById(android.R.id.content).findViewWithTag("root_mute_notice"));
    }

    @Test public void anAccountChangeDuringRollbackCannotPublishRecoveryIntoTheNextAccount() {
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> { })).run();
        queued.remove(0).run();
        assertEquals(1, queued.size());
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        RootPostMutes.workerForTests = Runnable::run;
        account("account-b"); mute("22");
        queued.remove(0).run();
        assertEquals(java.util.Set.of("22"), RootPostMutes.capture().roots);
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    @Test public void aRecoveryActionRetainedAcrossAccountChangesCannotUnmuteTheNextAccount() throws Exception {
        File saved = RootPostMutes.fileForTests;
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> ShadowReplacingAtomicFile.refuseCommitFor = saved)).run();
        Button unmute = menuRecovery();
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        account("account-b"); mute("11"); mute("22");
        unmute.performClick();
        assertEquals(java.util.Set.of("11", "22"), RootPostMutes.capture().roots);
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    @Test public void aFinishingOwnerDoesNotReceiveFailedRollbackRecovery() throws Exception {
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        new RootPostMuteAction("11", controller.get(), refusesRebind(() -> { })).run();
        queued.remove(0).run();
        assertEquals(1, queued.size());
        ShadowReplacingAtomicFile.refuseCommitFor = RootPostMutes.fileForTests;
        controller.get().finish();
        queued.remove(0).run();
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    private static HushLocalTimeline refusesRebind(Runnable beforeRefusal) {
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        return new HushLocalTimeline() {
            @Override public List<?> hushTimelineItems() { return List.of(selected); }
            @Override public void hushApplyTimelineItems(List<?> items) { beforeRefusal.run(); }
        };
    }

    private TextView menuNotice() {
        TextView label = controller.get().findViewById(android.R.id.content).findViewWithTag("root_mute_notice");
        assertNotNull(label);
        return label;
    }

    private Button menuRecovery() {
        Button action = find(controller.get().findViewById(android.R.id.content), Button.class);
        assertNotNull(action);
        assertEquals("Unmute post", action.getText().toString());
        assertTrue(action.isEnabled());
        return action;
    }

    @Test public void aNativeMenuCallbackUsesItsOwnTimelineAndKeepsDirectHostsWorking() {
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        FakeTimeline owner = new FakeTimeline(List.of(selected));
        HushRootMenuHost callback = () -> owner;
        RootPostMuteAction action = RootPostMenu.action(selected, controller.get(), callback);
        assertNotNull(action);
        assertNotNull(RootPostMenu.action(selected, controller.get(), owner));
        action.run();
        assertTrue(owner.items.isEmpty());
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
    }

    @Test public void aCallbackCannotSupplyAnAbsentForeignOrUnreadableTimeline() {
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        assertNull(RootPostMenu.action(selected, controller.get(), new Object()));
        assertNull(RootPostMenu.action(selected, controller.get(), (HushRootMenuHost) () -> null));
        assertNull(RootPostMenu.action(selected, controller.get(), (HushRootMenuHost) () -> new FakeTimeline(List.of())));
        assertNull(RootPostMenu.action(selected, controller.get(), (HushRootMenuHost) () -> { throw new IllegalStateException(); }));
        assertTrue(RootPostMutes.capture().roots.isEmpty());
    }

    @Test public void theCallbackMenuKeepsAccountPauseFamilyAndCanonicalRootGates() {
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        HushRootMenuHost callback = () -> new FakeTimeline(List.of(selected));
        assertNull(RootPostMenu.action(selected, null, callback));
        assertNull(RootPostMenu.action((app.hushtumblr.extension.tumblr.timeline.HushRootPost) () -> null, controller.get(), callback));
        Settings.MUTE_ROOT_POSTS.save(false);
        assertNull(RootPostMenu.action(selected, controller.get(), callback));
        Settings.MUTE_ROOT_POSTS.save(true);
        PauseForTests.pause(app.hushtumblr.extension.shared.settings.HushTumblrPause.Reason.SWITCH);
        assertNull(RootPostMenu.action(selected, controller.get(), callback));
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertNull(RootPostMenu.action(selected, controller.get(), callback));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.ROOT_POST_MUTES));
        RootPostMutes.logout();
        assertNull(RootPostMenu.action(selected, controller.get(), callback));
    }

    @Test public void onlyADashboardMenuOffersTheBlogHalfAndItRemovesThatHalfUntilUndo() {
        BlogPost reblog = new BlogPost("11", "reblogs:art-blog"), original = new BlogPost("22", "originals:art-blog");
        BlogPost secondReblog = new BlogPost("33", "reblogs:art-blog"), otherBlog = new BlogPost("44", "reblogs:other");
        FakeDashboard dashboard = new FakeDashboard(List.of(reblog, original, secondReblog, otherBlog));
        assertNull(RootPostMenu.blogAction(reblog, controller.get(), new FakeTimeline(List.of(reblog))));
        // An Explore tab shares the dashboard tab's class but isn't held by the dashboard.
        FakeDashboard explore = new FakeDashboard(List.of(reblog));
        explore.held = false;
        assertNull(RootPostMenu.blogAction(reblog, controller.get(), (HushRootMenuHost) () -> explore));
        assertNotNull(RootPostMenu.action(reblog, controller.get(), (HushRootMenuHost) () -> explore));
        assertNull(RootPostMenu.blogAction(reblog, controller.get(), (HushRootMenuHost) () -> new FakeTimeline(List.of(reblog))));
        assertNull(RootPostMenu.blogAction(new BlogPost("55", null), controller.get(), (HushRootMenuHost) () -> dashboard));
        assertNull(RootPostMenu.blogAction(new BlogPost("66", "reblogs:absent"), controller.get(), (HushRootMenuHost) () -> dashboard));
        RootPostMuteAction action = RootPostMenu.blogAction(reblog, controller.get(), (HushRootMenuHost) () -> dashboard);
        assertNotNull(action);
        assertEquals("reblogs:art-blog", action.entry());
        assertEquals("Hide reblogs from " + app.hushtumblr.extension.shared.L10n.isolate("art-blog"), RootPostMuteUi.menuTitle(action.entry()));
        assertEquals("Hide originals from " + app.hushtumblr.extension.shared.L10n.isolate("art-blog"), RootPostMuteUi.menuTitle("originals:art-blog"));
        assertNotNull(RootPostMenu.action(reblog, controller.get(), (HushRootMenuHost) () -> dashboard));

        action.run();
        assertEquals(List.of(original, otherBlog), dashboard.items);
        assertEquals(java.util.Set.of("reblogs:art-blog"), RootPostMutes.capture().roots);
        Button undo = find(controller.get().findViewById(android.R.id.content), Button.class);
        assertNotNull(undo); undo.performClick();
        assertEquals(List.of(reblog, original, secondReblog, otherBlog), dashboard.items);
        assertTrue(RootPostMutes.capture().roots.isEmpty());
    }

    @Test public void theListNamesABlogRuleAndItsRowRemovesOnlyThatRule() {
        mute("11"); mute("originals:art-blog");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        layoutManager(dialog);
        StringBuilder shown = new StringBuilder();
        shownText(dialog.getWindow().getDecorView(), shown);
        String blog = app.hushtumblr.extension.shared.L10n.isolate("art-blog");
        assertTrue(shown.toString(), shown.toString().contains("Originals from " + blog));
        assertTrue(shown.toString(), shown.toString().contains("Show originals from " + blog + " again"));
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        View row = list.findViewWithTag("originals:art-blog");
        assertNotNull(row);
        list.performItemClick(row, list.getPositionForView(row), 0);
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        dialog.dismiss();
    }

    private static final class BlogPost implements app.hushtumblr.extension.tumblr.timeline.HushRootPost, HushBlogRulePost {
        private final String root, rule;
        BlogPost(String root, String rule) { this.root = root; this.rule = rule; }
        @Override public String hushRootId() { return root; }
        @Override public String hushBlogRule() { return rule; }
    }

    private static final class FakeDashboard implements HushLocalTimeline, HushDashboardTimeline {
        List<Object> items;
        boolean held = true;
        FakeDashboard(List<?> items) { this.items = new ArrayList<>(items); }
        @Override public boolean hushDashboard() { return held; }
        @Override public List<?> hushTimelineItems() { return new ArrayList<>(items); }
        @Override public void hushApplyTimelineItems(List<?> items) { this.items = new ArrayList<>(items); }
    }

    @Test public void anAccountChangeAfterCallbackMenuCreationMakesItsActionInert() {
        app.hushtumblr.extension.tumblr.timeline.HushRootPost selected = () -> "11";
        FakeTimeline owner = new FakeTimeline(List.of(selected));
        RootPostMuteAction action = RootPostMenu.action(selected, controller.get(), (HushRootMenuHost) () -> owner);
        assertNotNull(action);
        account("account-b");
        action.run();
        assertEquals(List.of(selected), owner.items);
        assertTrue(RootPostMutes.capture().roots.isEmpty());
    }

    @Test public void failedUnmuteKeepsThePrivateRowsAndOffersRetry() throws Exception {
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        ShadowReplacingAtomicFile.refuseCommitFor = RootPostMutes.fileForTests;
        clickFirstPost(dialog);
        assertTrue(dialog.isShowing());
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        assertTrue(list.isEnabled());
        assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertTrue(notice(dialog).getText().toString().contains("Try again"));
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, notice(dialog).getAccessibilityLiveRegion());
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        clickFirstPost(dialog);
        assertTrue(dialog.isShowing());
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        assertEquals(0, list.getCount() - list.getHeaderViewsCount());
        assertTrue(inlineUndo(dialog).isShown());
        dialog.dismiss();
    }

    /**
     * A screen reader reads the notice from its polite live region, with no announcement event
     * (Android 16 deprecates them), and the same failure a second time is read again.
     */
    @Test @Config(sdk = {26, 36})
    public void aFailedUnmuteIsReadFromTheNoticeEachTimeWithoutAnAnnouncement() throws Exception {
        AccessibilityManager manager = controller.get().getSystemService(AccessibilityManager.class);
        Shadows.shadowOf(manager).setEnabled(true);
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        ShadowReplacingAtomicFile.refuseCommitFor = RootPostMutes.fileForTests;
        clickFirstPost(dialog);
        ShadowLooper.idleMainLooper(200, java.util.concurrent.TimeUnit.MILLISECONDS);
        String said = notice(dialog).getText().toString();
        int first = liveTextChanges(manager);
        clickFirstPost(dialog);
        ShadowLooper.idleMainLooper(200, java.util.concurrent.TimeUnit.MILLISECONDS);
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        assertTrue(said, said.contains("Try again"));
        assertEquals(said, notice(dialog).getText().toString());
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, notice(dialog).getAccessibilityLiveRegion());
        assertTrue("the first failure gave a screen reader nothing to read", first > 0);
        assertTrue("the same failure again wasn't read", liveTextChanges(manager) > first);
        for (android.view.accessibility.AccessibilityEvent event : Shadows.shadowOf(manager).getSentAccessibilityEvents()) {
            assertNotEquals("announced: " + event.getText(),
                    android.view.accessibility.AccessibilityEvent.TYPE_ANNOUNCEMENT, event.getEventType());
        }
        dialog.dismiss();
    }

    /** Text changes a live region sends from its own text view, the notice's here. */
    private static int liveTextChanges(AccessibilityManager manager) {
        int count = 0;
        for (android.view.accessibility.AccessibilityEvent event : Shadows.shadowOf(manager).getSentAccessibilityEvents()) {
            if (event.getEventType() == android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
                    && (event.getContentChangeTypes() & android.view.accessibility.AccessibilityEvent.CONTENT_CHANGE_TYPE_TEXT) != 0
                    && TextView.class.getName().contentEquals(event.getClassName())) count++;
        }
        return count;
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void uncertainClearRetainsUndoAndRefreshesReconciledOrUnreadRows() throws Exception {
        for (int reads : new int[]{1, 2}) {
            mute("11");
            AlertDialog dialog = RootPostMuteUi.manage(controller.get());
            ShadowReplacingAtomicFile.refuseReadFor = RootPostMutes.fileForTests;
            ShadowReplacingAtomicFile.refusedReads = reads;
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
            layoutManager(dialog);
            assertTrue(inlineUndo(dialog).isShown());
            assertTrue(notice(dialog).getText().toString().contains("Couldn't update"));
            assertFalse(notice(dialog).getText().toString().contains("unchanged"));
            assertFalse(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
            Button retry = dialog.getWindow().getDecorView().findViewWithTag("root_mute_retry");
            if (reads == 1) {
                assertNotNull(RootPostMutes.capture());
                assertTrue(RootPostMutes.capture().roots.isEmpty());
                assertFalse(retry.isShown());
            } else {
                assertNull(RootPostMutes.capture());
                assertTrue(retry.isShown()); assertTrue(retry.isEnabled());
            }
            captureManager("root-mutes-write-unconfirmed-" + reads, dialog);
            ShadowReplacingAtomicFile.refuseReadFor = null;
            if (reads == 2) {
                retry.performClick(); layoutManager(dialog);
                assertTrue(inlineUndo(dialog).isShown());
                assertFalse(retry.isShown());
            }
            inlineUndo(dialog).performClick(); layoutManager(dialog);
            assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
            assertFalse(inlineUndo(dialog).isShown());
            captureManager("root-mutes-write-recovered", dialog);
            dialog.dismiss();
        }
    }

    @Test public void failedClearKeepsTheListAndCanBeRetried() throws Exception {
        mute("11"); mute("22");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        Button clear = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        ShadowReplacingAtomicFile.refuseCommitFor = RootPostMutes.fileForTests;
        clear.performClick();
        assertTrue(dialog.isShowing());
        assertEquals(java.util.Set.of("11", "22"), RootPostMutes.capture().roots);
        assertTrue(clear.isEnabled());
        assertTrue(notice(dialog).getText().toString().contains("Try again"));
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        clear.performClick();
        assertTrue(dialog.isShowing());
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        assertFalse(clear.isEnabled());
        inlineUndo(dialog).performClick();
        assertEquals(java.util.Set.of("11", "22"), RootPostMutes.capture().roots);
        assertTrue(clear.isEnabled());
        dialog.dismiss();
    }

    @Test public void managerUndoStaysInItsVisibleWindowAndRetriesFailedPersistence() throws Exception {
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        clickFirstPost(dialog);
        assertTrue(dialog.isShowing());
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
        Button undo = inlineUndo(dialog);
        assertTrue(undo.isShown());
        ShadowReplacingAtomicFile.refuseCommitFor = RootPostMutes.fileForTests;
        undo.performClick();
        assertTrue(dialog.isShowing());
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        assertTrue(undo.isEnabled());
        assertTrue(undo.isShown());
        assertTrue(notice(dialog).getText().toString().contains("Try again"));
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        undo.performClick();
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        assertFalse(undo.isShown());
        dialog.dismiss();
    }

    @Test public void anAccountChangeClosesPrivateRowsAndPendingCallbacksStayInert() {
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        clickFirstPost(dialog);
        assertEquals(1, queued.size());
        assertFalse(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        account("account-b");
        ShadowLooper.idleMainLooper();
        assertFalse("Old account rows remain visible", dialog.isShowing());
        queued.get(0).run();
        assertFalse(dialog.isShowing());
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
    }

    @Test public void aManagerRowIsAnUnmuteButtonAndDuplicateActionsWaitForTheWorker() {
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        layoutManager(dialog);
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        int position = list.getHeaderViewsCount();
        View row = list.getChildAt(position - list.getFirstVisiblePosition());
        assertNotNull(row);
        AccessibilityNodeInfo info = row.createAccessibilityNodeInfo();
        assertEquals(Button.class.getName(), info.getClassName().toString());
        assertTrue(info.isClickable());
        assertTrue(info.getContentDescription().toString().contains("Unmute"));
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        assertFalse(list.isEnabled());
        assertFalse(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        list.performItemClick(row, position, 0);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        assertEquals(1, queued.size());
        queued.get(0).run();
        assertTrue(dialog.isShowing());
        assertTrue(list.isEnabled());
        dialog.dismiss();
    }

    @Test public void menuUndoUsesTheAccessibleTimeoutAndRetainsFailedRestores() throws Exception {
        AccessibilityManager manager = controller.get().getSystemService(AccessibilityManager.class);
        Shadows.shadowOf(manager).setInteractiveUiTimeout(60000);
        RootPostMuteUi.changed(controller.get(), "Post muted locally", mute("11"));
        Button undo = find(controller.get().findViewById(android.R.id.content), Button.class);
        assertNotNull(undo);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(11));
        assertNotNull(undo.getParent());
        ShadowReplacingAtomicFile.refuseCommitFor = RootPostMutes.fileForTests;
        undo.performClick();
        assertNotNull(undo.getParent());
        assertTrue(undo.isEnabled());
        ShadowReplacingAtomicFile.refuseCommitFor = null;
        undo.performClick();
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
        RootPostMuteUi.changed(controller.get(), "Post muted locally", mute("22"));
        Button expiring = find(controller.get().findViewById(android.R.id.content), Button.class);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(61));
        assertNull(find(controller.get().findViewById(android.R.id.content), Button.class));
        expiring.performClick();
        assertEquals(java.util.Set.of("22"), RootPostMutes.capture().roots);
    }

    @Test public void inlineUndoHonorsTheAccessibleTimeoutThenMakesTheRetainedButtonInert() {
        AccessibilityManager manager = controller.get().getSystemService(AccessibilityManager.class);
        Shadows.shadowOf(manager).setInteractiveUiTimeout(60000);
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        clickFirstPost(dialog);
        Button undo = inlineUndo(dialog);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(11));
        assertEquals(View.VISIBLE, undo.getVisibility());
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(50));
        assertEquals(View.GONE, undo.getVisibility());
        undo.performClick();
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        dialog.dismiss();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-night-xhdpi")
    public void aKeyboardCanReachTheManagersInlineUndo() {
        mute("11");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        clickFirstPost(dialog);
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        Button undo = inlineUndo(dialog);
        Object root = org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                dialog.getWindow().getDecorView(), "getViewRootImpl");
        org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, false));
        assertTrue(list.requestFocus());
        assertFalse(undo.hasFocus());
        list.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_DOWN));
        list.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DPAD_DOWN));
        assertTrue("Keyboard focus skipped the visible Undo action", undo.hasFocus());
        undo.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_CENTER));
        undo.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DPAD_CENTER));
        ShadowLooper.idleMainLooper();
        assertEquals(java.util.Set.of("11"), RootPostMutes.capture().roots);
        dialog.dismiss();
    }

    @Test public void theManagerStatesBothRetentionLimitsAndShowsNothingOfAnotherAccount() {
        mute("7101");
        account("account-b"); mute("7202");
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        layoutManager(dialog);
        View decor = dialog.getWindow().getDecorView();
        TextView limits = decor.findViewWithTag("root_mute_limits");
        assertNotNull(limits);
        assertTrue(limits.isShown());
        // The copy names both numbers, so a changed limit has to change the copy with it.
        assertEquals(500, RootPostMuteStore.MAX_ROOTS);
        assertEquals(8, RootPostMuteStore.MAX_ACCOUNTS);
        StringBuilder all = new StringBuilder();
        shownText(decor, all);
        String shown = all.toString();
        assertTrue(shown, shown.contains("Up to 500 posts and blog rules are kept per account."));
        assertEquals("This device keeps muted post lists for eight accounts. When a ninth account mutes a post, "
                + "the list that's gone longest without a change is deleted.", limits.getText().toString());
        assertTrue(shown, shown.contains("7202"));
        assertFalse("another account's post is on the screen: " + shown, shown.contains("7101"));
        assertFalse("an account key is on the screen: " + shown, shown.matches("(?s).*[0-9a-f]{64}.*"));
        dialog.dismiss();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rEG-w390dp-h844dp-night-xhdpi")
    public void bothRetentionLimitsStayReadableAtTwiceTheTextSizeInRtl() {
        Configuration config = new Configuration(controller.get().getResources().getConfiguration());
        config.fontScale = 2f;
        controller.get().getResources().updateConfiguration(config, null);
        for (int i = 1; i <= 20; i++) mute(String.valueOf(1000 + i));
        controller.visible();
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        ShadowLooper.idleMainLooper();
        View decor = dialog.getWindow().getDecorView();
        measure(decor, 716, 1688);
        ListView list = find(decor, ListView.class);
        for (String tag : new String[]{"root_mute_help", "root_mute_limits"}) {
            TextView text = decor.findViewWithTag(tag);
            assertNotNull(tag, text);
            android.text.Layout lines = text.getLayout();
            assertNotNull(tag, lines);
            assertTrue(tag, lines.getLineCount() > 1);
            assertEquals(tag + " lost its end", text.getText().length(), lines.getLineEnd(lines.getLineCount() - 1));
            int room = text.getWidth() - text.getCompoundPaddingLeft() - text.getCompoundPaddingRight();
            for (int line = 0; line < lines.getLineCount(); line++) {
                assertEquals(tag, 0, lines.getEllipsisCount(line));
                assertTrue(tag + " runs past its edge", lines.getLineMax(line) <= room);
            }
            assertTrue(tag + " is cut off", text.getHeight()
                    >= lines.getHeight() + text.getCompoundPaddingTop() + text.getCompoundPaddingBottom());
            // The header can be taller than the list at this size, so its end is reached by scrolling.
            View header = (View) text.getParent();
            for (int tries = 0; tries < 8 && below(list, header, text) > 0; tries++) list.scrollListBy(below(list, header, text));
            assertTrue(tag + " can't be scrolled into view", below(list, header, text) <= 0);
        }
        dialog.dismiss();
    }

    /** Restarts with [document] where account-a's list belongs, so its read fails. */
    private File unreadable(byte[] document) throws Exception {
        File saved = RootPostMutes.fileForTests;
        Files.write(saved.toPath(), document);
        RootPostMutes.resetForTests();
        account("account-a");
        assertNull(RootPostMutes.capture());
        return saved;
    }

    @Test public void aLoadingAccountGetsTheNotYetNoticeAndAFailedReadOpensARetryWithNoPrivateDetail() throws Exception {
        mute("7101");
        File saved = RootPostMutes.fileForTests;
        // Cut short, the document still holds the account key and the muted post.
        String cut = new String(Files.readAllBytes(saved.toPath()), StandardCharsets.UTF_8).replace("}", "");
        assertTrue(cut, cut.contains("7101"));
        Files.write(saved.toPath(), cut.getBytes(StandardCharsets.UTF_8));
        RootPostMutes.resetForTests();
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        account("account-a");
        ShadowToast.reset();
        assertNull(RootPostMuteUi.manage(controller.get()));
        assertEquals("Muted posts aren't available for this account yet", ShadowToast.getTextOfLatestToast());
        queued.remove(0).run();
        ShadowToast.reset();
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        assertNotNull(dialog);
        assertNull(ShadowToast.getTextOfLatestToast());
        layoutManager(dialog);
        View decor = dialog.getWindow().getDecorView();
        assertTrue(notice(dialog).isShown());
        assertEquals("Couldn't read this account's muted posts. Nothing was changed or deleted.",
                notice(dialog).getText().toString());
        Button retry = decor.findViewWithTag("root_mute_retry");
        assertTrue(retry.isShown()); assertTrue(retry.isEnabled());
        assertFalse(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        ListView list = find(decor, ListView.class);
        assertEquals(0, list.getCount() - list.getHeaderViewsCount());
        StringBuilder all = new StringBuilder();
        shownText(decor, all);
        String shown = all.toString();
        assertFalse("a muted post is on the screen: " + shown, shown.contains("7101"));
        assertFalse("an account key is on the screen: " + shown, shown.matches("(?s).*[0-9a-f]{64}.*"));
        assertFalse("the file's name is on the screen: " + shown, shown.contains(saved.getName()));
        assertFalse("an unread list reads as an empty one: " + shown, shown.contains("No muted posts"));
        dialog.dismiss();
    }

    @Test public void retryReadsOnceOnTheWorkerKeepsDamagedBytesAndShowsTheRepairedList() throws Exception {
        mute("7101");
        byte[] good = Files.readAllBytes(RootPostMutes.fileForTests.toPath());
        byte[] damaged = "{broken".getBytes(StandardCharsets.UTF_8);
        File saved = unreadable(damaged);
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        layoutManager(dialog);
        View decor = dialog.getWindow().getDecorView();
        Button retry = decor.findViewWithTag("root_mute_retry");
        retry.performClick();
        layoutManager(dialog);
        assertTrue(dialog.isShowing());
        assertTrue(notice(dialog).getText().toString().startsWith("Couldn't read"));
        assertTrue(retry.isShown()); assertTrue(retry.isEnabled());
        assertArrayEquals(damaged, Files.readAllBytes(saved.toPath()));
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        retry.performClick(); retry.performClick();
        assertEquals(1, queued.size());
        assertFalse(retry.isEnabled());
        assertEquals("Reading muted posts", notice(dialog).getText().toString());
        assertNull(RootPostMutes.capture());
        Files.write(saved.toPath(), good);
        queued.get(0).run();
        layoutManager(dialog);
        assertEquals(java.util.Set.of("7101"), RootPostMutes.capture().roots);
        ListView list = find(decor, ListView.class);
        assertEquals(1, list.getCount() - list.getHeaderViewsCount());
        assertFalse(retry.isShown()); assertFalse(notice(dialog).isShown());
        TextView help = decor.findViewWithTag("root_mute_help");
        assertTrue(help.isShown());
        assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        // The recovered list is the working one: its row unmutes as usual.
        RootPostMutes.workerForTests = Runnable::run;
        clickFirstPost(dialog);
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        dialog.dismiss();
    }

    @Test public void anAccountChangeClosesTheUnreadManagerAndItsQueuedRetryCannotReachTheNextAccount() throws Exception {
        mute("7101");
        byte[] good = Files.readAllBytes(RootPostMutes.fileForTests.toPath());
        File saved = unreadable("{broken".getBytes(StandardCharsets.UTF_8));
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        layoutManager(dialog);
        Button retry = dialog.getWindow().getDecorView().findViewWithTag("root_mute_retry");
        List<Runnable> queued = new ArrayList<>(); RootPostMutes.workerForTests = queued::add;
        retry.performClick();
        assertEquals(1, queued.size());
        Files.write(saved.toPath(), good);
        RootPostMutes.workerForTests = Runnable::run;
        account("account-b");
        ShadowLooper.idleMainLooper();
        assertFalse("The old account's failure stayed open", dialog.isShowing());
        queued.get(0).run();
        assertTrue(RootPostMutes.capture().roots.isEmpty());
        // The retained button belongs to a closed window and the old account.
        List<Runnable> later = new ArrayList<>(); RootPostMutes.workerForTests = later::add;
        retry.performClick();
        assertTrue(later.isEmpty());
    }

    @Test public void aReadTheFullWorkerRefusesOpensTheRetryAndShowsTheListOnceThereIsRoom() throws Exception {
        mute("7101");
        File saved = RootPostMutes.fileForTests;
        byte[] good = Files.readAllBytes(saved.toPath());
        RootPostMutes.resetForTests();
        AlertDialog dialog;
        Button retry;
        try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
            RootPostMutes.workerForTests = null;
            account("account-a");
            assertNull(RootPostMutes.capture());
            ShadowToast.reset();
            dialog = RootPostMuteUi.manage(controller.get());
            assertNotNull("an account whose read never started still counts as loading", dialog);
            assertNull(ShadowToast.getTextOfLatestToast());
            layoutManager(dialog);
            assertTrue(notice(dialog).isShown());
            assertEquals("Couldn't read this account's muted posts. Nothing was changed or deleted.",
                    notice(dialog).getText().toString());
            retry = dialog.getWindow().getDecorView().findViewWithTag("root_mute_retry");
            assertTrue(retry.isShown()); assertTrue(retry.isEnabled());
            // Still no room. This retry is refused as well, and the button is there to press again.
            retry.performClick();
            layoutManager(dialog);
            assertTrue(dialog.isShowing());
            assertTrue(notice(dialog).getText().toString().startsWith("Couldn't read"));
            assertTrue(retry.isShown()); assertTrue(retry.isEnabled());
            assertNull(RootPostMutes.capture());
            assertArrayEquals(good, Files.readAllBytes(saved.toPath()));
        }
        RootPostMutes.workerForTests = Runnable::run;
        retry.performClick();
        layoutManager(dialog);
        assertEquals(java.util.Set.of("7101"), RootPostMutes.capture().roots);
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        assertEquals(1, list.getCount() - list.getHeaderViewsCount());
        assertFalse(retry.isShown()); assertFalse(notice(dialog).isShown());
        assertArrayEquals(good, Files.readAllBytes(saved.toPath()));
        dialog.dismiss();
    }

    /** How far the bottom of [text], a child of the list's [header], sits below the list's visible rows. */
    private static int below(ListView list, View header, View text) {
        return header.getTop() + text.getBottom() - (list.getHeight() - list.getPaddingBottom());
    }

    private static void shownText(View view, StringBuilder into) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView) into.append(((TextView) view).getText()).append('\n');
        if (view.getContentDescription() != null) into.append(view.getContentDescription()).append('\n');
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            shownText(((ViewGroup) view).getChildAt(i), into);
        }
    }

    private static void clickFirstPost(AlertDialog dialog) {
        layoutManager(dialog);
        ListView list = find(dialog.getWindow().getDecorView(), ListView.class);
        int position = list.getHeaderViewsCount();
        View row = list.getChildAt(position - list.getFirstVisiblePosition());
        assertNotNull(row);
        list.performItemClick(row, position, 0);
        layoutManager(dialog);
    }

    private static void layoutManager(AlertDialog dialog) {
        ShadowLooper.idleMainLooper();
        int width = dialog.getWindow().getAttributes().width;
        measure(dialog.getWindow().getDecorView(), width > 0 ? Math.min(780, width) : 716, 1688);
    }

    private static TextView notice(AlertDialog dialog) {
        TextView notice = dialog.getWindow().getDecorView().findViewWithTag("root_mute_notice");
        assertNotNull(notice);
        return notice;
    }

    private static Button inlineUndo(AlertDialog dialog) {
        Button undo = dialog.getWindow().getDecorView().findViewWithTag("root_mute_undo");
        assertNotNull(undo);
        return undo;
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rEG-w390dp-h320dp-night-xhdpi")
    public void aShortScreenAtTwiceTheTextSizeKeepsActionsAndTheLastPrivateRowReachable() {
        Configuration config = new Configuration(controller.get().getResources().getConfiguration());
        config.fontScale = 2f;
        controller.get().getResources().updateConfiguration(config, null);
        for (int i = 1; i <= 20; i++) mute(String.valueOf(1000 + i));
        controller.visible();
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        ShadowLooper.idleMainLooper();
        View decor = dialog.getWindow().getDecorView();
        measure(decor, 716, 640);
        assertTrue(decor.getHeight() <= 640);
        for (int which : new int[]{AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            Button action = dialog.getButton(which);
            Rect visible = new Rect();
            assertTrue(action.getText().toString(), action.getGlobalVisibleRect(visible));
            assertEquals(action.getText().toString(), action.getHeight(), visible.height());
            android.text.Layout text = action.getLayout();
            assertTrue(action.getText().toString(), text.getHeight() <= action.getHeight()
                    - action.getCompoundPaddingTop() - action.getCompoundPaddingBottom());
        }
        ListView list = find(decor, ListView.class);
        assertTrue(list.getHeight() > 0 && list.getHeight() < 640);
        list.setSelection(list.getCount() - 1);
        measure(decor, 716, 640);
        assertEquals(list.getCount() - 1, list.getLastVisiblePosition());
        View last = list.getChildAt(list.getChildCount() - 1);
        assertTrue(last.getBottom() <= list.getHeight() - list.getPaddingBottom());
        dialog.dismiss();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-night-xhdpi")
    public void rendersTheEmptyPrivateManager() throws Exception {
        captureManager("root-mutes-empty");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-night-xhdpi")
    public void rendersThePopulatedPrivateManager() throws Exception {
        mute("1001"); mute("1002"); mute("1003");
        captureManager("root-mutes-populated");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rEG-w390dp-h844dp-night-xhdpi")
    public void rendersThePrivateManagerAtTwiceTheTextSizeInRtl() throws Exception {
        Configuration config = new Configuration(controller.get().getResources().getConfiguration());
        config.fontScale = 2f;
        controller.get().getResources().updateConfiguration(config, null);
        for (int i = 1; i <= 20; i++) mute(String.valueOf(1000 + i));
        captureManager("root-mutes-large-rtl");
    }

    private void captureManager(String name) throws Exception {
        controller.visible();
        AlertDialog dialog = RootPostMuteUi.manage(controller.get());
        assertNotNull(dialog);
        try {
            captureManager(name, dialog);
        } finally { dialog.dismiss(); }
    }

    private void captureManager(String name, AlertDialog dialog) throws Exception {
            ShadowLooper.idleMainLooper();
            View decor = dialog.getWindow().getDecorView();
            int width = dialog.getWindow().getAttributes().width;
            if (width <= 0) width = 716;
            measure(decor, Math.min(780, width), 1688);
            assertTrue(decor.getWidth() > 0 && decor.getHeight() > 0);
            Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(image);
            canvas.drawColor(android.graphics.Color.BLACK);
            canvas.translate((780 - decor.getWidth()) / 2f, (1688 - decor.getHeight()) / 2f);
            decor.draw(canvas);
            File folder = new File("build/reports/settings-design");
            assertTrue(folder.isDirectory() || folder.mkdirs());
            try (FileOutputStream output = new FileOutputStream(new File(folder, name + ".png"))) {
                assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, output));
            } finally { image.recycle(); }
    }

    private static void measure(View decor, int width, int height) {
        decor.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.AT_MOST));
        decor.layout(0, 0, decor.getMeasuredWidth(), decor.getMeasuredHeight());
    }

    private static final class FakeTimeline implements HushLocalTimeline {
        List<Object> items;
        int applies;
        FakeTimeline(List<?> items) { this.items = new ArrayList<>(items); }
        @Override public List<?> hushTimelineItems() { return new ArrayList<>(items); }
        @Override public void hushApplyTimelineItems(List<?> items) { this.items = new ArrayList<>(items); applies++; }
    }

    private static <T extends View> T find(View view, Class<T> type) {
        if (type.isInstance(view)) return type.cast(view);
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            T found = find(((ViewGroup) view).getChildAt(i), type); if (found != null) return found;
        }
        return null;
    }
}
