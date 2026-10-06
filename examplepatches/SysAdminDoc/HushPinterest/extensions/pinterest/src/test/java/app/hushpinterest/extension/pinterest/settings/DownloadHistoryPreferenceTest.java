/*
 * Copyright (c) 2026 HushPinterest contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.DownloadManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.EnumSet;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushpinterest.extension.pinterest.actions.DownloadLedger;
import app.hushpinterest.extension.pinterest.actions.DownloadLedgerTest;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.WorkerPoolForTests;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** Exercises native preference clicks and ledger callbacks, rather than prebuilt display snapshots. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "en-rUS", shadows = DownloadHistoryPreferenceTest.NativeDownloads.class)
@SuppressWarnings("deprecation")
public class DownloadHistoryPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String SOURCE = "https://i.pinimg.com/originals/pin.jpg?token=private-test-value";
    private Application app;
    private DownloadManager manager;
    private NativeDownloads nativeJobs;
    private ActivityController<HistoryActivity> controller;
    private HistoryPage page;

    @Before public void prepare() throws Exception {
        settle();
        app = RuntimeEnvironment.getApplication();
        ShadowDownloadManager.reset();
        manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        nativeJobs = Shadow.extract(manager);
        app.getSharedPreferences(storeName(), Context.MODE_PRIVATE).edit().clear().commit();
        HistoryActivity.denyRead = false;
        HistoryActivity.denyWrite = false;
        HistoryActivity.failWindow = false;
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        PauseForTests.resume();
        Settings.DOWNLOAD_PINS.save(true);
        controller = Robolectric.buildActivity(HistoryActivity.class).setup();
        page = new HistoryPage();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page, "history").commit();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
    }

    @After public void restore() throws Exception {
        nativeJobs.release.countDown();
        HistoryActivity.denyRead = false;
        HistoryActivity.denyWrite = false;
        HistoryActivity.failWindow = false;
        settle();
        if (controller != null) controller.close();
        ShadowLooper.idleMainLooper();
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
    }

    @Test public void theNativeRowIsSearchableReadableAndAnnouncedAsAButton() {
        DownloadHistoryPreference row = page.row;
        assertEquals("action_download_history", row.getKey());
        assertFalse(row.isPersistent());
        assertEquals(text("Download history"), row.getTitle().toString());
        ListView parent = pageList();
        View drawn = parent.getAdapter().getView(0, null, parent);
        TextView title = drawn.findViewById(android.R.id.title);
        TextView summary = drawn.findViewById(android.R.id.summary);
        assertEquals(ScreenColors.DEFAULT.title, title.getCurrentTextColor());
        assertEquals(ScreenColors.DEFAULT.summary, summary.getCurrentTextColor());
        assertEquals(Integer.MAX_VALUE, title.getMaxLines());
        assertEquals(Integer.MAX_VALUE, summary.getMaxLines());
        AccessibilityNodeInfo node = drawn.createAccessibilityNodeInfo();
        assertEquals(Button.class.getName(), node.getClassName().toString());
        assertTrue(node.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
    }

    @Test public void emptyHistoryIsDifferentFromUnavailableAndButtonsStayUsable() throws Exception {
        AlertDialog dialog = open();
        assertEquals(text("No HushPinterest downloads in this history."), message(dialog));
        assertEquals(View.GONE, jobs(dialog).getVisibility());
        assertUsable(dialog);
        HistoryActivity.denyRead = true;
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertEquals(text("Couldn't check Downloads. Try again."), message(dialog));
        assertUsable(dialog);
        HistoryActivity.denyRead = false;
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertEquals(text("No HushPinterest downloads in this history."), message(dialog));
        assertUsable(dialog);
    }

    @Test @Config(sdk = 28) public void androidNineExplainsWhyPickerFilesAreAbsent() throws Exception {
        AlertDialog dialog = open();
        assertEquals(text("Android 9 uses the file picker. Results from visible-pin selections appear here."), message(dialog));
        assertEquals(View.GONE, jobs(dialog).getVisibility());
        assertUsable(dialog);
    }

    @Test public void theScreenShowsTheBoundedOwnedRequestsWithDatesStatusAndSafeReasons() throws Exception {
        for (int i = 0; i < 40; i++) owned(Integer.toString(1000 + i), DownloadManager.STATUS_PENDING);
        long failed = owned("123", DownloadManager.STATUS_FAILED);
        reasons().put(failed, DownloadManager.ERROR_INSUFFICIENT_SPACE);
        AlertDialog dialog = open();
        assertTrue(message(dialog).contains(text("Only the 32 most recent HushPinterest requests are listed. Manage active downloads in Downloads.")));
        ListAdapter rows = jobs(dialog).getAdapter();
        assertEquals(32, rows.getCount());
        String first = rows.getItem(0).toString();
        assertTrue(first, first.contains("123"));
        assertTrue(first, first.contains(text("Failed")));
        assertTrue(first, first.contains(text("Not enough storage.")));
        assertTrue(first, first.split("\n").length >= 4);
        for (int i = 0; i < rows.getCount(); i++) {
            String shown = rows.getItem(i).toString();
            assertFalse(shown, shown.contains("token"));
            assertFalse(shown, shown.contains("private-test-value"));
            assertFalse(shown, shown.contains("https:"));
        }
        assertEquals(41, nativeJobs.getRequestCount());
        assertEquals(0, removed());
    }

    @Test public void anUnavailableNativeQueryKeepsItsOwnedRowAndCanRecover() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        ReflectionHelpers.setField(nativeJobs, "nullCursor", true);
        AlertDialog dialog = open();
        assertEquals(1, jobs(dialog).getAdapter().getCount());
        String shown = jobs(dialog).getAdapter().getItem(0).toString();
        assertTrue(shown, shown.contains(text("Unavailable")));
        assertTrue(shown, shown.contains(text("Couldn't check Downloads. Try again.")));
        assertFalse(shown, shown.contains(text("Missing")));
        assertUsable(dialog);
        ReflectionHelpers.setField(nativeJobs, "nullCursor", false);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertTrue(jobs(dialog).getAdapter().getItem(0).toString().contains(text("Downloading")));
    }

    @Test public void onlyAFreshValidatedFailedRequestOffersRetry() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        AlertDialog dialog = open();
        AlertDialog choice = chooseJob(dialog, 0);
        assertEquals(3, choice.getListView().getAdapter().getCount());
        assertTrue(choice.getListView().getAdapter().getItem(0).toString().contains(text("Retry download")));
        choice.dismiss();
        ShadowLooper.idleMainLooper();
        status(id, DownloadManager.STATUS_SUCCESSFUL);
        choice = chooseJob(dialog, 0);
        assertEquals(3, choice.getListView().getAdapter().getCount());
        assertTrue(message(choice).contains(text("Completed")));
        assertFalse(choice.getListView().getAdapter().getItem(0).toString().contains(text("Retry download")));
        assertTrue(choice.getListView().getAdapter().getItem(0).toString().contains(text("Set as wallpaper")));
        click(choice.getListView(), 0);
        settleTwice();
        Intent chooser = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        assertEquals(Intent.ACTION_ATTACH_DATA, ((Intent) chooser.getParcelableExtra(Intent.EXTRA_INTENT)).getAction());
    }

    @Test public void unsafeOrExpiredSourcesOfferReopeningWithoutRetry() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        ReflectionHelpers.<Map<Long, String>>getField(nativeJobs, "sources").put(id, "https://example.com/file.jpg");
        AlertDialog choice = chooseJob(open(), 0);
        assertEquals(2, choice.getListView().getAdapter().getCount());
        assertTrue(choice.getListView().getAdapter().getItem(0).toString().contains(text("Open pin")));
    }

    @Test public void pauseOrAnOffSwitchDoesNotOfferRetryButKeepsHistoryAvailable() throws Exception {
        owned("123", DownloadManager.STATUS_FAILED);
        AlertDialog history = open();
        Settings.DOWNLOAD_PINS.save(false);
        AlertDialog choice = chooseJob(history, 0);
        assertEquals(2, choice.getListView().getAdapter().getCount());
        assertTrue(message(choice).contains(text("Resume HushPinterest and turn on Download pins to retry.")));
        choice.dismiss();
        ShadowLooper.idleMainLooper();
        Settings.DOWNLOAD_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        choice = chooseJob(history, 0);
        assertEquals(2, choice.getListView().getAdapter().getCount());
        assertTrue(message(choice).contains(text("Resume HushPinterest and turn on Download pins to retry.")));
        assertEquals(1, nativeJobs.getRequestCount());
    }

    @Test public void retryRechecksAnOffSwitchAfterItsChooserWasOpened() throws Exception {
        owned("123", DownloadManager.STATUS_FAILED);
        AlertDialog history = open();
        AlertDialog choice = chooseJob(history, 0);
        Settings.DOWNLOAD_PINS.save(false);
        click(choice.getListView(), 0);
        settleTwice();
        assertEquals(1, nativeJobs.getRequestCount());
        assertEquals(text("Resume HushPinterest and turn on Download pins to retry."), ShadowToast.getTextOfLatestToast());
        assertUsable(history);
        choice = chooseJob(history, 0);
        assertEquals(2, choice.getListView().getAdapter().getCount());
    }

    @Test public void retryQueuesANewNativeJobAndRefreshesTheOneHistoryEntry() throws Exception {
        owned("123", DownloadManager.STATUS_FAILED);
        AlertDialog history = open();
        click(chooseJob(history, 0).getListView(), 0);
        settleTwice();
        assertEquals(2, nativeJobs.getRequestCount());
        assertEquals(1, jobs(history).getAdapter().getCount());
        assertTrue(jobs(history).getAdapter().getItem(0).toString().contains(text("Queued")));
        assertEquals(0, removed());
        assertUsable(history);
    }

    @Test public void removalHasNoConfirmationAndKeepsActiveAndCompletedNativeJobs() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        owned("456", DownloadManager.STATUS_SUCCESSFUL);
        AlertDialog history = open();
        for (int i = 0; i < 2; i++) {
            AlertDialog choice = chooseJob(history, 0);
            click(choice.getListView(), choice.getListView().getAdapter().getCount() - 1);
            settleTwice();
            assertFalse(choice.isShowing());
            assertSame("removal opened an extra dialog", choice, ShadowAlertDialog.getLatestAlertDialog());
            assertEquals(text("History removed. Files and active downloads were kept."), ShadowToast.getTextOfLatestToast());
            assertUsable(history);
        }
        assertEquals(2, nativeJobs.getRequestCount());
        assertEquals(0, removed());
        assertEquals(View.GONE, jobs(history).getVisibility());
        assertEquals(text("No HushPinterest downloads in this history."), message(history));
    }

    @Test public void aFailedHistoryWriteLeavesTheEntryAndControlsAvailableForAnotherTap() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        AlertDialog history = open();
        AlertDialog choice = chooseJob(history, 0);
        HistoryActivity.denyWrite = true;
        click(choice.getListView(), 1);
        settleTwice();
        assertEquals(text("Couldn't remove this history entry. Try again."), ShadowToast.getTextOfLatestToast());
        assertEquals(1, jobs(history).getAdapter().getCount());
        assertUsable(history);
        HistoryActivity.denyWrite = false;
        click(chooseJob(history, 0).getListView(), 1);
        settleTwice();
        assertEquals(View.GONE, jobs(history).getVisibility());
        assertEquals(0, removed());
    }

    @Test public void aRefusedWorkerShowsUnavailableThenRefreshWorksAfterThePoolRecovers() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        AlertDialog history;
        try (WorkerPoolForTests ignored = WorkerPoolForTests.fill()) {
            history = startOpen();
            ShadowLooper.idleMainLooper();
            assertEquals(text("Couldn't check Downloads. Try again."), message(history));
            assertUsable(history);
        }
        history.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertEquals(1, jobs(history).getAdapter().getCount());
        assertUsable(history);
    }

    @Test public void aRefusedRemovalDoesNotFreezeTheHistoryOrRemoveAnything() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        AlertDialog history = open();
        AlertDialog choice = chooseJob(history, 0);
        try (WorkerPoolForTests ignored = WorkerPoolForTests.fill()) {
            click(choice.getListView(), 1);
            ShadowLooper.idleMainLooper();
            assertUsable(history);
            assertEquals(1, nativeJobs.getRequestCount());
            assertEquals(0, removed());
        }
        history.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertEquals(1, jobs(history).getAdapter().getCount());
        assertUsable(history);
    }

    @Test public void openDownloadsUsesTheSystemAndReopenUsesOnlyTheCanonicalHostPin() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        AlertDialog history = open();
        history.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        Intent downloads = Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertEquals(DownloadManager.ACTION_VIEW_DOWNLOADS, downloads.getAction());
        assertTrue(history.isShowing());
        click(chooseJob(history, 0).getListView(), 0);
        ShadowLooper.idleMainLooper();
        Intent pin = Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, pin.getAction());
        assertEquals("https://www.pinterest.com/pin/123/", pin.getDataString());
        assertEquals(controller.get().getPackageName(), pin.getPackage());
        assertTrue(pin.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertNull(pin.getClipData());
        assertEquals(0, pin.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION));
        assertUsable(history);
    }

    @Test public void dismissedScreensIgnoreLateChooserCallbacksAndCanBeOpenedAgain() throws Exception {
        owned("123", DownloadManager.STATUS_FAILED);
        AlertDialog old = open();
        nativeJobs.holdNext.set(true);
        click(jobs(old), 0);
        assertTrue(nativeJobs.started.await(3, TimeUnit.SECONDS));
        old.dismiss();
        ShadowLooper.idleMainLooper();
        AlertDialog next = startOpen();
        nativeJobs.release.countDown();
        settle();
        assertTrue(next.isShowing());
        assertSame(next, page.row.getDialog());
        assertSame("an obsolete callback opened a job chooser", next, ShadowAlertDialog.getLatestAlertDialog());
        assertUsable(next);
    }

    @Test public void closingTheOwnerAlsoClosesItsJobChooser() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        AlertDialog history = open();
        AlertDialog choice = chooseJob(history, 0);
        page.row.onActivityDestroy();
        ShadowLooper.idleMainLooper();
        assertFalse(history.isShowing());
        assertFalse(choice.isShowing());
        assertNull(page.row.getDialog());
    }

    @Test public void aFailedChooserCallbackLeavesTheHistoryUsableForAnotherTap() throws Exception {
        owned("123", DownloadManager.STATUS_RUNNING);
        AlertDialog history = open();
        HistoryActivity.failWindow = true;
        click(jobs(history), 0);
        settle();
        assertSame(history, page.row.getDialog());
        assertEquals(text("Couldn't check Downloads. Try again."), ShadowToast.getTextOfLatestToast());
        assertUsable(history);
        HistoryActivity.failWindow = false;
        assertTrue(chooseJob(history, 0).isShowing());
    }

    private AlertDialog startOpen() {
        click(pageList(), 0);
        AlertDialog dialog = (AlertDialog) page.row.getDialog();
        assertNotNull("the native preference click didn't open its history", dialog);
        return dialog;
    }

    private AlertDialog open() throws Exception { AlertDialog dialog = startOpen(); settle(); return dialog; }

    private AlertDialog chooseJob(AlertDialog history, int position) throws Exception {
        click(jobs(history), position);
        settle();
        AlertDialog choice = ShadowAlertDialog.getLatestAlertDialog();
        assertNotSame(history, choice);
        assertTrue(choice.isShowing());
        return choice;
    }

    private static void click(ListView list, int position) {
        ListAdapter adapter = list.getAdapter();
        assertNotNull(adapter);
        assertTrue(list.performItemClick(adapter.getView(position, null, list), position, adapter.getItemId(position)));
    }

    private static ListView jobs(AlertDialog dialog) { return dialog.findViewById(android.R.id.list); }
    private ListView pageList() { return page.getView().findViewById(android.R.id.list); }

    private static String message(AlertDialog dialog) {
        TextView text = visibleMessage(dialog.getWindow().getDecorView());
        assertNotNull("dialog has no visible explanation", text);
        return text.getText().toString();
    }

    private static TextView visibleMessage(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof TextView && view.getId() == android.R.id.message) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = visibleMessage(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void assertUsable(AlertDialog dialog) {
        assertTrue(dialog.isShowing());
        for (int button : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEUTRAL, AlertDialog.BUTTON_NEGATIVE}) {
            assertTrue("history action disabled", dialog.getButton(button).isEnabled());
        }
        assertTrue(jobs(dialog).isEnabled());
    }

    private long owned(String pinId, int state) {
        long id = manager.enqueue(new DownloadManager.Request(Uri.parse(SOURCE)).setMimeType("image/jpeg"));
        status(id, state);
        assertTrue(DownloadLedger.record(app, id, pinId));
        return id;
    }

    private void status(long id, int state) {
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(nativeJobs.getRequest(id));
        request.setStatus(state);
    }

    private Map<Long, Integer> reasons() { return ReflectionHelpers.getField(nativeJobs, "reasons"); }
    private int removed() { return ReflectionHelpers.getField(nativeJobs, "removes"); }
    private String text(String english) { return L10n.t(page.row.getContext(), english); }
    private static String storeName() { return ReflectionHelpers.getStaticField(DownloadLedger.class, "STORE"); }
    private static void settle() throws Exception { Utils.awaitBackgroundTasksForTests(); ShadowLooper.idleMainLooper(); }
    private static void settleTwice() throws Exception { settle(); settle(); }

    public static class HistoryPage extends PreferenceFragment {
        DownloadHistoryPreference row;
        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
            row = new DownloadHistoryPreference(getActivity());
            screen.addPreference(row);
            setPreferenceScreen(screen);
        }
    }

    public static class HistoryActivity extends Activity {
        static boolean denyRead;
        static boolean denyWrite;
        static boolean failWindow;

        @Override public Object getSystemService(String name) {
            if (failWindow && name.equals(Context.WINDOW_SERVICE)) throw new IllegalStateException("injected dialog window failure");
            return super.getSystemService(name);
        }

        @Override public Context getApplicationContext() {
            return new ContextWrapper(super.getApplicationContext()) {
                @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                    if (!name.equals(storeName())) return super.getSharedPreferences(name, mode);
                    if (denyRead) throw new SecurityException("history store unavailable");
                    SharedPreferences real = super.getSharedPreferences(name, mode);
                    if (!denyWrite) return real;
                    return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                            new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
                                if (method.getName().equals("edit")) {
                                    return Proxy.newProxyInstance(SharedPreferences.Editor.class.getClassLoader(),
                                            new Class<?>[]{SharedPreferences.Editor.class}, (editor, change, values) -> {
                                                if (change.getName().equals("commit")) return false;
                                                if (SharedPreferences.Editor.class.isAssignableFrom(change.getReturnType())) return editor;
                                                return null;
                                            });
                                }
                                try { return method.invoke(real, args); }
                                catch (InvocationTargetException failure) { throw failure.getCause(); }
                            });
                }
            };
        }
    }

    /** The controlled delay proves that callbacks settle after their owning screen has closed. */
    @Implements(DownloadManager.class)
    public static class NativeDownloads extends DownloadLedgerTest.NativeDownloads {
        final AtomicBoolean holdNext = new AtomicBoolean();
        final CountDownLatch started = new CountDownLatch(1);
        final CountDownLatch release = new CountDownLatch(1);

        @Implementation @Override protected long enqueue(DownloadManager.Request request) {
            long id = super.enqueue(request);
            // Stock Robolectric leaves status at zero. The controlled provider queues accepted jobs.
            if (id >= 0) Shadow.<ShadowDownloadManager.ShadowRequest>extract(request).setStatus(DownloadManager.STATUS_PENDING);
            return id;
        }

        @Implementation @Override protected Cursor query(DownloadManager.Query query) {
            if (holdNext.compareAndSet(true, false)) {
                started.countDown();
                try {
                    if (!release.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("test query delay expired");
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    throw new IllegalStateException(interrupted);
                }
            }
            return super.query(query);
        }
    }
}
