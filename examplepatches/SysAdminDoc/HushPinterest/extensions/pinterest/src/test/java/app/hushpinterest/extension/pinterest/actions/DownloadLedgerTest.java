/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Application;
import android.app.DownloadManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Looper;
import android.os.ParcelFileDescriptor;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.annotation.Resetter;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowApplication;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.WorkerPoolForTests;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = DownloadLedgerTest.NativeDownloads.class)
public class DownloadLedgerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String SOURCE = "https://i.pinimg.com/originals/pin.jpg?token=private-test-value";
    private Application app;
    private DownloadManager manager;
    private NativeDownloads nativeJobs;

    @Before public void prepare() throws Exception {
        app = RuntimeEnvironment.getApplication();
        ShadowDownloadManager.reset();
        manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        nativeJobs = Shadow.extract(manager);
        clearProcessView();
        preferences().edit().clear().commit();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        PauseForTests.resume();
        Settings.DOWNLOAD_PINS.save(true);
    }

    @After public void reset() throws Exception {
        settle();
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        clearProcessView();
    }

    @Test public void downloadedPinsAreRequestedOnesButNotFailedSkippedOrUnsupported() {
        owned("111", DownloadManager.STATUS_RUNNING);
        owned("112", DownloadManager.STATUS_SUCCESSFUL);
        owned("113", DownloadManager.STATUS_FAILED);
        assertTrue(DownloadLedger.record(app, 9999, "114"));
        assertTrue(DownloadLedger.recordResult(app, "333", DownloadLedger.State.SKIPPED));
        assertTrue(DownloadLedger.recordResult(app, "444", DownloadLedger.State.FAILED));
        assertTrue(DownloadLedger.recordResult(app, "555", DownloadLedger.State.UNSUPPORTED));
        assertEquals(new java.util.HashSet<>(java.util.Arrays.asList("111", "112")), DownloadLedger.downloadedPinIds(app));

        // When Android can't be asked, its requests still count, so nothing is saved twice.
        nativeJobs.nullCursor = true;
        assertEquals(new java.util.HashSet<>(java.util.Arrays.asList("111", "112", "113", "114")),
                DownloadLedger.downloadedPinIds(app));
        nativeJobs.nullCursor = false;
    }

    @Test public void recordsOnlyBoundedMinimalFactsAndEvictionKeepsNativeRequests() throws Exception {
        for (int i = 0; i < 40; i++) owned(Integer.toString(1000 + i), DownloadManager.STATUS_PENDING);
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals(32, jobs.size());
        assertEquals("1039", jobs.get(0).pinId);
        assertEquals("1008", jobs.get(31).pinId);
        String stored = preferences().getString(DownloadLedger.RECORDS, "");
        assertEquals(32, stored.lines().count());
        for (String row : stored.split("\n")) assertTrue(row, row.matches("[0-9]+,[0-9]{1,30},[0-9]+"));
        // The eight older requests keep only their ID and pin ID, newest first.
        String earlier = preferences().getString(DownloadLedger.EARLIER, "");
        assertEquals(8, earlier.lines().count());
        for (String row : earlier.split("\n")) assertTrue(row, row.matches("[0-9]+,[0-9]{1,30}"));
        assertTrue(earlier, earlier.startsWith("7,1007\n"));
        assertEquals(2, preferences().getAll().size());
        for (String text : new String[]{stored, earlier}) {
            assertFalse(text.contains("https"));
            assertFalse(text.contains("token"));
            assertFalse(text.contains("Pinterest_"));
            assertFalse(text.contains("content:"));
        }
        assertEquals(40, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertEquals(32, nativeJobs.queries.get(0).length);
    }

    @Test public void aFullBoardOfSavesStillCountsOnceItsPinsLeaveTheVisibleHistory() {
        // Download board takes up to 500 pins, and the visible history shows the newest 32.
        java.util.Set<String> saved = new java.util.HashSet<>();
        for (int i = 0; i < BoardDownloads.PINS; i++) {
            String pin = Integer.toString(10000 + i);
            owned(pin, DownloadManager.STATUS_SUCCESSFUL);
            saved.add(pin);
        }
        assertTrue(DownloadLedger.recordResult(app, "99", DownloadLedger.State.SKIPPED));
        assertTrue(DownloadLedger.recordResult(app, "98", DownloadLedger.State.UNSUPPORTED));
        nativeJobs.queries.clear();
        assertEquals(saved, DownloadLedger.downloadedPinIds(app));
        // One query, under the 999 host parameters SQLite allows before 3.32 (Android 10's Downloads).
        assertEquals(1, nativeJobs.queries.size());
        assertEquals(BoardDownloads.PINS, nativeJobs.queries.get(0).length);
        assertTrue(DownloadLedger.LIMIT + DownloadLedger.EARLIER_LIMIT < 999);

        List<DownloadLedger.Job> shown = new DownloadLedger(app).reconcile();
        assertEquals(DownloadLedger.LIMIT, shown.size());
        assertEquals("98", shown.get(0).pinId);
        assertEquals(DownloadLedger.LIMIT, preferences().getString(DownloadLedger.RECORDS, "").lines().count());
        // Skipped and unsupported results never count, so only requests move back.
        assertEquals(BoardDownloads.PINS - DownloadLedger.LIMIT + 2,
                preferences().getString(DownloadLedger.EARLIER, "").lines().count());
    }

    @Test public void theEarlierHistoryKeepsItsNewestEntriesAndAndroidStillDecidesWhatCounts() {
        owned("0", DownloadManager.STATUS_SUCCESSFUL);
        long failed = owned("1", DownloadManager.STATUS_PENDING);
        long missing = owned("2", DownloadManager.STATUS_SUCCESSFUL);
        owned("3", DownloadManager.STATUS_SUCCESSFUL);
        int total = DownloadLedger.LIMIT + DownloadLedger.EARLIER_LIMIT;
        for (int i = 4; i < total; i++) owned(Integer.toString(100 + i), DownloadManager.STATUS_SUCCESSFUL);
        java.util.Set<String> downloaded = DownloadLedger.downloadedPinIds(app);
        assertEquals(total, downloaded.size());
        assertTrue(downloaded.containsAll(java.util.Arrays.asList("0", "1", "2", "3")));
        assertEquals(DownloadLedger.EARLIER_LIMIT, preferences().getString(DownloadLedger.EARLIER, "").lines().count());

        // A newer download pushes the oldest entry out of both lists, and only that one.
        owned("77", DownloadManager.STATUS_SUCCESSFUL);
        downloaded = DownloadLedger.downloadedPinIds(app);
        assertEquals(total, downloaded.size());
        assertFalse(downloaded.contains("0"));
        assertTrue(downloaded.contains("77"));
        assertEquals(DownloadLedger.EARLIER_LIMIT, preferences().getString(DownloadLedger.EARLIER, "").lines().count());

        // Earlier requests are asked about again: failed or gone from Android, they can be saved again.
        status(failed, DownloadManager.STATUS_FAILED);
        manager.remove(missing);
        downloaded = DownloadLedger.downloadedPinIds(app);
        assertFalse(downloaded.contains("1"));
        assertFalse(downloaded.contains("2"));
        assertTrue(downloaded.contains("3"));
        // When Android can't be asked, they still count, so nothing is saved twice.
        nativeJobs.nullCursor = true;
        assertTrue(DownloadLedger.downloadedPinIds(app).contains("2"));
        nativeJobs.nullCursor = false;
    }

    @Test public void removingAPinFromHistoryForgetsItsEarlierEntriesToo() throws Exception {
        owned("7", DownloadManager.STATUS_SUCCESSFUL);
        owned("8", DownloadManager.STATUS_SUCCESSFUL);
        for (int i = 0; i < DownloadLedger.LIMIT; i++) owned(Integer.toString(100 + i), DownloadManager.STATUS_SUCCESSFUL);
        long again = owned("7", DownloadManager.STATUS_SUCCESSFUL);
        assertTrue(DownloadLedger.downloadedPinIds(app).containsAll(java.util.Arrays.asList("7", "8")));

        assertTrue(DownloadLedger.removeHistory(app, again, null));
        settle();
        java.util.Set<String> downloaded = DownloadLedger.downloadedPinIds(app);
        assertFalse(downloaded.contains("7"));
        assertTrue(downloaded.contains("8"));
        assertEquals(DownloadLedger.LIMIT + 3, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertFalse(preferences().getString(DownloadLedger.EARLIER, "").contains(",7\n"));
    }

    @Test public void removingAResultThatNeverCountedKeepsThePinsEarlierDownloads() throws Exception {
        owned("7", DownloadManager.STATUS_SUCCESSFUL);
        for (int i = 0; i < DownloadLedger.LIMIT; i++) owned(Integer.toString(100 + i), DownloadManager.STATUS_SUCCESSFUL);
        assertTrue(DownloadLedger.recordResult(app, "7", DownloadLedger.State.SKIPPED));
        long skipped = new DownloadLedger(app).reconcile().get(0).id;

        assertTrue(DownloadLedger.removeHistory(app, skipped, null));
        settle();
        assertTrue(DownloadLedger.downloadedPinIds(app).contains("7"));
        assertEquals("1,100\n0,7\n", preferences().getString(DownloadLedger.EARLIER, ""));
    }

    @Test public void removingARowThatMovedToTheEarlierHistoryStillForgetsIt() throws Exception {
        long first = owned("7", DownloadManager.STATUS_SUCCESSFUL);
        // The dialog still shows the row, but newer downloads have pushed it out of the visible history.
        for (int i = 0; i < DownloadLedger.LIMIT; i++) owned(Integer.toString(100 + i), DownloadManager.STATUS_SUCCESSFUL);

        assertTrue(DownloadLedger.removeHistory(app, first, null));
        settle();
        assertFalse(DownloadLedger.downloadedPinIds(app).contains("7"));
        assertEquals(DownloadLedger.LIMIT, new DownloadLedger(app).reconcile().size());
        assertEquals("", preferences().getString(DownloadLedger.EARLIER, ""));
        assertEquals("History removed. Files and active downloads were kept.", ShadowToast.getTextOfLatestToast());
        assertNotNull(nativeJobs.getRequest(first));
    }

    @Test public void malformedOrOversizeEarlierHistoryCountsNothing() {
        // Only Android's request IDs belong there; a signed line is a local result and never counts.
        long known = enqueue("321");
        status(known, DownloadManager.STATUS_SUCCESSFUL);
        preferences().edit().putString(DownloadLedger.EARLIER,
                known + ",321\n" + known + ",999\n-1,123\n-7,456\nbad,1\n6,bad\n7,1,extra\n9999999999999999999,2\n").commit();
        nativeJobs.queries.clear();
        assertEquals(new java.util.HashSet<>(java.util.Arrays.asList("321")), DownloadLedger.downloadedPinIds(app));
        assertArrayEquals(new long[]{known}, nativeJobs.queries.get(0));
        nativeJobs.queries.clear();
        // Over 51 characters a line: refused whole, though each line alone would be asked about.
        preferences().edit().putString(DownloadLedger.EARLIER, (known + ",3\n").repeat(DownloadLedger.EARLIER_LIMIT * 13)).commit();
        assertTrue(DownloadLedger.downloadedPinIds(app).isEmpty());
        preferences().edit().putInt(DownloadLedger.EARLIER, 1).commit();
        assertTrue(DownloadLedger.downloadedPinIds(app).isEmpty());
        assertTrue(nativeJobs.queries.isEmpty());
    }

    @Test public void zeroIdIsOwnedAndInvalidAdmissionNeverQueriesAnything() {
        assertFalse(DownloadLedger.record(app, -1, "12"));
        assertFalse(DownloadLedger.record(app, 10, "../other"));
        assertFalse(DownloadLedger.record(app, 11, "1234567890123456789012345678901"));
        assertFalse(DownloadLedger.record(null, 12, "12"));
        assertTrue(new DownloadLedger(app).reconcile().isEmpty());
        assertTrue(nativeJobs.queries.isEmpty());
        long id = owned("12", DownloadManager.STATUS_PENDING);
        assertEquals(0, id);
        assertArrayEquals(new long[]{0}, new DownloadLedger(app).reconcile().stream().mapToLong(job -> job.id).toArray());
    }

    @Test public void malformedDuplicateAndOversizeMetadataCannotExpandOwnership() {
        preferences().edit().putString(DownloadLedger.RECORDS,
                "7,123,100\n7,999,200\n-1,123,100\n8,bad,100\n9,123,0\n-5,123,100,SAVED\n"
                        + "9999999999999999999,123,100\n10,123,9999999999999999999\n11,123,100,extra\n-6,123,100,P\n"
                        // A folder field that isn't one DownloadManager writes to is no folder at all.
                        + "12,123,100,F:Music/x\n13,123,100,F:Pictures/../x\n14,123,100,F:\n15,123,100,F:Download\n"
                        + "16,123,100,F:Pictures/a\u0007b\n-17,123,100,F:Pictures/x\n").commit();
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals(1, jobs.size());
        assertEquals(7, jobs.get(0).id);
        assertEquals("123", jobs.get(0).pinId);
        assertEquals(DownloadLedger.State.MISSING, jobs.get(0).state);
        assertArrayEquals(new long[]{7}, nativeJobs.queries.get(0));
        nativeJobs.queries.clear();
        // Oversized, it keeps only the whole lines within the bound, and still asks only about their IDs.
        preferences().edit().putString(DownloadLedger.RECORDS, "1,2,3\n".repeat(DownloadLedger.RECORDS_LENGTH / 6 + 1)).commit();
        jobs = new DownloadLedger(app).reconcile();
        assertEquals(1, jobs.size());
        assertEquals(1, jobs.get(0).id);
        assertArrayEquals(new long[]{1}, nativeJobs.queries.get(0));
        nativeJobs.queries.clear();
        preferences().edit().putInt(DownloadLedger.RECORDS, 1).commit();
        assertTrue(new DownloadLedger(app).reconcile().isEmpty());
        assertTrue(nativeJobs.queries.isEmpty());
    }

    /**
     * Only a damaged store holds a history longer than this class writes. Its newest whole lines are
     * kept rather than none, so the next download doesn't replace the history with one line, and a
     * line the bound cuts through is dropped rather than read short.
     */
    @Test public void anOversizedHistoryKeepsItsNewestWholeLinesAndTheNextWriteKeepsThemToo() {
        long older = owned("201", DownloadManager.STATUS_SUCCESSFUL);
        long newer = owned("202", DownloadManager.STATUS_SUCCESSFUL);
        String saved = preferences().getString(DownloadLedger.RECORDS, "");
        // Cut short at the bound, the last line would read as request 77 saved at time 17.
        String junk = "#".repeat(DownloadLedger.RECORDS_LENGTH - saved.length() - 6);
        String damaged = saved + junk + "\n77,777,1700000000000\n";
        assertTrue(damaged.length() > DownloadLedger.RECORDS_LENGTH);
        assertEquals(DownloadLedger.RECORDS_LENGTH - 5, damaged.indexOf("77,777"));
        preferences().edit().putString(DownloadLedger.RECORDS, damaged).commit();

        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertArrayEquals(new long[]{newer, older}, jobs.stream().mapToLong(job -> job.id).toArray());
        assertEquals(DownloadLedger.State.COMPLETED, jobs.get(0).state);
        assertArrayEquals(new long[]{newer, older}, nativeJobs.queries.get(0));

        long next = owned("203", DownloadManager.STATUS_PENDING);
        String rewritten = preferences().getString(DownloadLedger.RECORDS, "");
        assertEquals(3, rewritten.lines().count());
        assertTrue(rewritten, rewritten.startsWith(next + ",203,"));
        assertTrue(rewritten, rewritten.endsWith(saved));
        assertTrue(DownloadLedger.downloadedPinIds(app).containsAll(java.util.Arrays.asList("201", "202", "203")));
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void onlyOwnedIdsAreQueriedAndForeignReturnedRowsAreIgnored() {
        long unrelated = enqueue("9");
        long owned = owned("123", DownloadManager.STATUS_RUNNING);
        nativeJobs.extraRow = unrelated;
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertArrayEquals(new long[]{owned}, nativeJobs.queries.get(0));
        assertEquals(1, jobs.size());
        assertEquals(owned, jobs.get(0).id);
        assertEquals(DownloadLedger.State.RUNNING, jobs.get(0).state);
        assertTrue(nativeJobs.cursor.isClosed());
        assertEquals(2, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void allNativeStatesAndSafeReasonsRemainDistinct() {
        int[] statuses = {DownloadManager.STATUS_PENDING, DownloadManager.STATUS_RUNNING, DownloadManager.STATUS_PAUSED,
                DownloadManager.STATUS_FAILED, DownloadManager.STATUS_SUCCESSFUL, 9876};
        DownloadLedger.State[] expected = {DownloadLedger.State.QUEUED, DownloadLedger.State.RUNNING, DownloadLedger.State.PAUSED,
                DownloadLedger.State.FAILED, DownloadLedger.State.COMPLETED, DownloadLedger.State.UNAVAILABLE};
        for (int i = 0; i < statuses.length; i++) {
            long id = owned(Integer.toString(100 + i), statuses[i]);
            nativeJobs.reasons.put(id, i == 2 ? DownloadManager.PAUSED_WAITING_TO_RETRY : DownloadManager.ERROR_INSUFFICIENT_SPACE);
        }
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        for (int i = 0; i < statuses.length; i++) {
            DownloadLedger.Job job = jobs.get(statuses.length - 1 - i);
            assertEquals(expected[i], job.state);
            assertFalse(job.reasonText(), job.reasonText().contains("token"));
            assertFalse(job.reasonText(), job.reasonText().contains("private-test-value"));
            assertFalse(job.statusText().isEmpty());
        }
        assertEquals("Android will retry the download.", jobs.get(3).reasonText());
        assertEquals("Not enough storage.", jobs.get(2).reasonText());
        assertEquals("Check Downloads for the saved file.", jobs.get(1).reasonText());
        assertTrue(jobs.get(2).canRetry());
        assertFalse(jobs.get(1).canRetry());
        try { jobs.clear(); fail("mutable result"); }
        catch (UnsupportedOperationException expectedImmutable) { }
    }

    /** Android's Downloads list shows only the Download folder, so a save in Pinterest's folder says where it is. */
    @Test public void aFinishedDownloadInPinterestsFolderSaysWhereItIs() {
        Settings.SAVE_IN_PINTEREST_FOLDER.save(true);
        try {
            owned("200", DownloadManager.STATUS_SUCCESSFUL);
            owned("201", DownloadManager.STATUS_FAILED);
        } finally {
            Settings.SAVE_IN_PINTEREST_FOLDER.save(false);
        }
        owned("202", DownloadManager.STATUS_SUCCESSFUL);
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals("202", jobs.get(0).pinId);
        assertEquals("Check Downloads for the saved file.", jobs.get(0).reasonText());
        assertEquals("201", jobs.get(1).pinId);
        assertEquals("Download failed.", jobs.get(1).reasonText());
        assertEquals("200", jobs.get(2).pinId);
        assertEquals("Saved in Pictures/100PINT/Pins.", jobs.get(2).reasonText());
    }

    @Test public void pausedAndFailedReasonCodesHaveNonsecretFallbacks() {
        long id = owned("123", DownloadManager.STATUS_PAUSED);
        int[] paused = {DownloadManager.PAUSED_WAITING_FOR_NETWORK, DownloadManager.PAUSED_QUEUED_FOR_WIFI, DownloadManager.PAUSED_UNKNOWN};
        String[] pauseText = {"Waiting for a network connection this download can use.",
                "Waiting for Wi-Fi that isn't metered. A hotspot doesn't count.",
                "Paused by Android."};
        for (int i = 0; i < paused.length; i++) {
            nativeJobs.reasons.put(id, paused[i]);
            assertEquals(pauseText[i], new DownloadLedger(app).reconcile().get(0).reasonText());
        }
        status(id, DownloadManager.STATUS_FAILED);
        int[] failed = {DownloadManager.ERROR_DEVICE_NOT_FOUND, DownloadManager.ERROR_FILE_ALREADY_EXISTS,
                DownloadManager.ERROR_CANNOT_RESUME, DownloadManager.ERROR_FILE_ERROR, DownloadManager.ERROR_HTTP_DATA_ERROR,
                DownloadManager.ERROR_UNHANDLED_HTTP_CODE, DownloadManager.ERROR_TOO_MANY_REDIRECTS, 403, DownloadManager.ERROR_UNKNOWN, 7654321};
        String[] failureText = {"Download storage is unavailable.", "The file already exists.", "Android couldn't resume the download.",
                "Android couldn't save the file.", "The download server couldn't complete the request.",
                "The download server couldn't complete the request.", "The download server couldn't complete the request.",
                "The download server couldn't complete the request.", "Download failed.", "Download failed."};
        for (int i = 0; i < failed.length; i++) {
            nativeJobs.reasons.put(id, failed[i]);
            assertEquals(failureText[i], new DownloadLedger(app).reconcile().get(0).reasonText());
        }
    }

    /**
     * A download a network limit holds back is waiting, not failed: it can't be retried, and it still
     * counts for Download board, so nothing queues it twice. A failed one takes the limits that are
     * on when it's retried, and the request already queued stays as it was.
     */
    @Test public void waitingForAnAllowedNetworkIsNotAFailureAndARetryTakesTheLimitsOnNow() throws Exception {
        Settings.DOWNLOAD_UNMETERED_ONLY.save(true);
        Settings.DOWNLOAD_NO_ROAMING.save(true);
        try {
            long waiting = owned("123", DownloadManager.STATUS_PAUSED);
            ShadowDownloadManager.ShadowRequest queued = Shadow.extract(nativeJobs.getRequest(waiting));
            assertFalse(queued.getAllowedOverMetered());
            assertFalse(queued.getAllowedOverRoaming());
            for (int reason : new int[]{DownloadManager.PAUSED_QUEUED_FOR_WIFI, DownloadManager.PAUSED_WAITING_FOR_NETWORK}) {
                nativeJobs.reasons.put(waiting, reason);
                DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
                assertEquals(DownloadLedger.State.PAUSED, job.state);
                assertEquals("Paused", job.statusText());
                assertTrue(job.reasonText(), job.reasonText().startsWith("Waiting for"));
                assertFalse(job.canRetry());
                assertTrue(DownloadLedger.downloadedPinIds(app).contains("123"));
                assertTrue(DownloadLedger.retry(app, waiting, null));
                settle();
                assertEquals(1, nativeJobs.getRequestCount());
                assertEquals("Can't retry this. Check Downloads or open the pin again.", ShadowToast.getTextOfLatestToast());
            }

            status(waiting, DownloadManager.STATUS_FAILED);
            Settings.DOWNLOAD_UNMETERED_ONLY.save(false);
            assertTrue(DownloadLedger.retry(app, waiting, null));
            settle();
            assertEquals(2, nativeJobs.getRequestCount());
            ShadowDownloadManager.ShadowRequest retried = Shadow.extract(nativeJobs.getRequest(waiting + 1));
            assertTrue(retried.getAllowedOverMetered());
            assertFalse(retried.getAllowedOverRoaming());
            assertNotNull(nativeJobs.getRequest(waiting));
            assertFalse(queued.getAllowedOverMetered());
            assertEquals(0, nativeJobs.removes);
        } finally {
            Settings.DOWNLOAD_UNMETERED_ONLY.save(false);
            Settings.DOWNLOAD_NO_ROAMING.save(false);
        }
    }

    @Test public void missedBroadcastAndProcessRestartRecoverCompletedJobFromPrivateId() throws Exception {
        long id = owned("123", DownloadManager.STATUS_RUNNING);
        assertEquals(DownloadLedger.State.RUNNING, new DownloadLedger(app).reconcile().get(0).state);
        status(id, DownloadManager.STATUS_SUCCESSFUL);
        clearProcessView();
        DownloadLedger.onStart(app);
        settle();
        assertEquals(DownloadLedger.State.COMPLETED, processView().get(0).state);
        assertArrayEquals(new long[]{id}, nativeJobs.queries.get(nativeJobs.queries.size() - 1));
        assertEquals(1, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void ownedResultBroadcastRequeriesStatusAndIgnoresUnownedOrWrongActions() throws Exception {
        long id = owned("123", DownloadManager.STATUS_RUNNING);
        DownloadLedger.onStart(app);
        settle();
        ShadowApplication.Wrapper registration = registration();
        int before = nativeJobs.queries.size();
        registration.broadcastReceiver.onReceive(app, new Intent(DownloadManager.ACTION_DOWNLOAD_COMPLETE)
                .putExtra(DownloadManager.EXTRA_DOWNLOAD_ID, 9999));
        registration.broadcastReceiver.onReceive(app, new Intent("other.action")
                .putExtra(DownloadManager.EXTRA_DOWNLOAD_ID, id));
        registration.broadcastReceiver.onReceive(app, new Intent(DownloadManager.ACTION_DOWNLOAD_COMPLETE));
        settle();
        assertEquals(before, nativeJobs.queries.size());
        status(id, DownloadManager.STATUS_FAILED);
        nativeJobs.reasons.put(id, 403);
        registration.broadcastReceiver.onReceive(app, new Intent(DownloadManager.ACTION_DOWNLOAD_COMPLETE)
                .putExtra(DownloadManager.EXTRA_DOWNLOAD_ID, id).putExtra(DownloadManager.COLUMN_STATUS, DownloadManager.STATUS_SUCCESSFUL));
        settle();
        assertEquals(before + 1, nativeJobs.queries.size());
        assertEquals(DownloadLedger.State.FAILED, processView().get(0).state);
        assertEquals("The download server couldn't complete the request.", processView().get(0).reasonText());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void startupWatchesOnceWithSignatureSenderPermission() throws Exception {
        DownloadLedger.onStart(app);
        DownloadLedger.onStart(app);
        settle();
        assertEquals(1, registrations().size());
        assertEquals(DownloadLedger.SENDER_PERMISSION, registration().broadcastPermission);
        assertTrue(nativeJobs.queries.isEmpty());
    }

    @Test @Config(sdk = 33)
    public void modernReceiverAllowsTheNativeProviderUidAndRequiresItsSignaturePermission() throws Exception {
        DownloadLedger.onStart(app);
        settle();
        assertEquals(Context.RECEIVER_EXPORTED, registration().flags);
        assertEquals(DownloadLedger.SENDER_PERMISSION, registration().broadcastPermission);
    }

    @Test public void missingRequestIsGuidanceWithoutAssumingTheFileWasDeleted() throws Exception {
        long id = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        manager.remove(id); // Simulates removal in system Downloads, not a ledger action.
        nativeJobs.removes = 0;
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(DownloadLedger.State.MISSING, job.state);
        assertFalse(job.canRetry());
        assertEquals("Android dropped this request. Check Downloads before retrying.", job.reasonText());
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        assertEquals(0, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertEquals("Open the pin again to get a fresh download link.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aRequestKeepsItsFolderAfterAndroidForgetsIt() {
        long id = enqueue("300");
        status(id, DownloadManager.STATUS_SUCCESSFUL);
        assertTrue(DownloadLedger.record(app, id, "300", DownloadFolder.PINTEREST));
        String saved = preferences().getString(DownloadLedger.RECORDS, "").split("\n")[0];
        assertTrue(saved.startsWith(id + ",300,"));
        assertTrue(saved.endsWith(",P"));
        manager.remove(id); // Simulates removal in system Downloads, not a ledger action.
        nativeJobs.removes = 0;
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(DownloadLedger.State.MISSING, job.state);
        assertEquals("Android dropped this request. Check Pictures/100PINT/Pins before retrying.", job.reasonText());
        // A Download request keeps the old line shape, so history written before the flag reads the same.
        long plain = owned("301", DownloadManager.STATUS_SUCCESSFUL);
        String first = preferences().getString(DownloadLedger.RECORDS, "").split("\n")[0];
        assertTrue(first.startsWith(plain + ",301,"));
        assertEquals(3, first.split(",", -1).length);
        assertEquals(0, nativeJobs.removes);
    }

    /** #5: a folder picked by hand is kept with its request, commas and all, and named once Android forgets it. */
    @Test public void aPickedFolderIsKeptWithItsRequestAndNamedWhenAndroidForgetsIt() {
        String folder = "Pictures/Art, 100% mine";
        long id = enqueue("310");
        status(id, DownloadManager.STATUS_SUCCESSFUL);
        assertTrue(DownloadLedger.record(app, id, "310", folder));
        String saved = preferences().getString(DownloadLedger.RECORDS, "").split("\n")[0];
        assertTrue(saved, saved.startsWith(id + ",310,") && saved.endsWith(",F:Pictures/Art%2C 100%25 mine"));
        manager.remove(id); // Simulates removal in system Downloads, not a ledger action.
        nativeJobs.removes = 0;
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(DownloadLedger.State.MISSING, job.state);
        assertEquals("Android dropped this request. Check " + folder + " before retrying.", job.reasonText());
        // A full history of the longest folders, every character escaped, still reads back whole.
        String longest = "Documents/" + ",".repeat(DownloadFolder.MAX_LENGTH - "Documents/".length());
        assertEquals(DownloadFolder.MAX_LENGTH, longest.length());
        for (int i = 0; i < DownloadLedger.LIMIT; i++) {
            assertTrue(DownloadLedger.record(app, 1_000_000_000_000_000_000L + i, "9".repeat(30), longest));
        }
        String full = preferences().getString(DownloadLedger.RECORDS, "");
        assertTrue(full.length() + " <= " + DownloadLedger.RECORDS_LENGTH, full.length() <= DownloadLedger.RECORDS_LENGTH);
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals(DownloadLedger.LIMIT, jobs.size());
        assertEquals("Android dropped this request. Check " + longest + " before retrying.", jobs.get(0).reasonText());
        assertEquals(0, nativeJobs.removes);
    }

    /** A request whose folder wasn't kept is placed by the destination Android reports for it. */
    @Test public void aPickedFolderIsReadFromAndroidWhenTheLineDoesNotSayIt() {
        DownloadFolder.PICKED.save("DCIM/Pins");
        try {
            owned("320", DownloadManager.STATUS_SUCCESSFUL);
        } finally {
            DownloadFolder.PICKED.save("");
        }
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals("Saved in DCIM/Pins.", jobs.get(0).reasonText());
    }

    @Test public void nullDeniedAndPartialQueryFailuresRemainUnavailableAndCloseTheCursor() {
        long id = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        assertEquals(DownloadLedger.State.COMPLETED, new DownloadLedger(app).reconcile().get(0).state);
        nativeJobs.nullCursor = true;
        assertUnavailable(id);
        nativeJobs.nullCursor = false;
        nativeJobs.denied = true;
        assertUnavailable(id);
        nativeJobs.denied = false;
        owned("456", DownloadManager.STATUS_SUCCESSFUL);
        nativeJobs.failAfterReads = 1;
        List<DownloadLedger.Job> partial = new DownloadLedger(app).reconcile();
        assertEquals(2, partial.size());
        for (DownloadLedger.Job job : partial) assertEquals(DownloadLedger.State.UNAVAILABLE, job.state);
        assertTrue(nativeJobs.cursor.isClosed());
        assertEquals(DownloadLedger.State.UNAVAILABLE, processView().get(0).state);
        assertEquals(2, nativeJobs.getRequestCount());
    }

    @Test public void refreshSettlesOnMainWithImmutableRowsAndUnavailableIsNotEmpty() throws Exception {
        long id = owned("123", DownloadManager.STATUS_PENDING);
        AtomicReference<List<DownloadLedger.Job>> delivered = new AtomicReference<>();
        AtomicBoolean onMain = new AtomicBoolean();
        nativeJobs.nullCursor = true;
        assertTrue(DownloadLedger.refresh(app, jobs -> {
            onMain.set(Looper.myLooper() == Looper.getMainLooper());
            delivered.set(jobs);
        }));
        settle();
        assertTrue(onMain.get());
        assertNotNull(delivered.get());
        assertEquals(1, delivered.get().size());
        assertEquals(id, delivered.get().get(0).id);
        assertEquals(DownloadLedger.State.UNAVAILABLE, delivered.get().get(0).state);
        try { delivered.get().clear(); fail("mutable callback"); }
        catch (UnsupportedOperationException expectedImmutable) { }
    }

    @Test public void failedValidatedRetryCreatesFreshNotifiedRequestAndNeverDeletesOldNativeJob() throws Exception {
        long old = owned("123", DownloadManager.STATUS_FAILED);
        AtomicBoolean callback = new AtomicBoolean();
        assertTrue(DownloadLedger.retry(app, old, () -> callback.set(true)));
        settle();
        assertTrue(callback.get());
        assertEquals(2, nativeJobs.getRequestCount());
        assertNotNull(nativeJobs.getRequest(old));
        assertEquals(0, nativeJobs.removes);
        assertArrayEquals(new long[]{old}, nativeJobs.queries.get(0));
        ShadowDownloadManager.ShadowRequest retry = Shadow.extract(nativeJobs.getRequest(old + 1));
        assertEquals(SOURCE, retry.getUri().toString());
        assertEquals("image/jpeg", retry.getMimeType());
        assertEquals(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED, retry.getNotificationVisibility());
        assertTrue(retry.getRequestHeaders().isEmpty());
        assertTrue(retry.getAllowedOverMetered());
        assertTrue(retry.getAllowedOverRoaming());
        assertTrue(retry.getDestination().getLastPathSegment().matches("Pinterest_123_[0-9]+\\.jpg"));
        ShadowDownloadManager.ShadowRequest original = Shadow.extract(nativeJobs.getRequest(old));
        assertFalse(retry.getDestination().equals(original.getDestination()));
        String stored = preferences().getString(DownloadLedger.RECORDS, "");
        assertEquals(1, stored.lines().count());
        assertTrue(stored.startsWith((old + 1) + ",123,"));
        assertFalse(stored.contains("token"));
        assertTrue(DownloadLedger.retry(app, old, null));
        settle();
        assertEquals("second retry of the replaced row", 2, nativeJobs.getRequestCount());
    }

    @Test public void simultaneousRetryActionsReplaceTheOldHistoryOnce() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        AtomicInteger callbacks = new AtomicInteger();
        assertTrue(DownloadLedger.retry(app, id, callbacks::incrementAndGet));
        assertTrue(DownloadLedger.retry(app, id, callbacks::incrementAndGet));
        settle();
        assertEquals(2, callbacks.get());
        assertEquals(2, nativeJobs.getRequestCount());
        assertEquals(1, preferences().getString(DownloadLedger.RECORDS, "").lines().count());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void suppliedMp4RetryKeepsItsVideoFormatAndFreshDestination() throws Exception {
        String source = "https://v.pinimg.com/videos/supplied.mp4";
        long id = manager.enqueue(PinDownloads.request(PinMedia.sourceUrl(source, true), "Pinterest_123_1.mp4"));
        status(id, DownloadManager.STATUS_FAILED);
        assertTrue(DownloadLedger.record(app, id, "123"));
        assertTrue(new DownloadLedger(app).reconcile().get(0).canRetry());
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        ShadowDownloadManager.ShadowRequest retried = Shadow.extract(nativeJobs.getRequest(id + 1));
        assertEquals(source, retried.getUri().toString());
        assertEquals("video/mp4", retried.getMimeType());
        assertTrue(retried.getDestination().getLastPathSegment().matches("Pinterest_123_[0-9]+\\.mp4"));
        assertEquals(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED, retried.getNotificationVisibility());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void retryRequiresTheOriginalMediaTypeRatherThanGuessingFromARedirect() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        for (String mime : new String[]{"video/mp4", "image/png", "text/html", null}) {
            nativeJobs.mimes.put(id, mime);
            assertFalse(new DownloadLedger(app).reconcile().get(0).canRetry());
            assertTrue(DownloadLedger.retry(app, id, null));
            settle();
            assertEquals(1, nativeJobs.getRequestCount());
            assertEquals("Open the pin again to get a fresh download link.", ShadowToast.getTextOfLatestToast());
        }
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void nativeEnqueueRejectionKeepsOwnedHistoryAndSettlesTheCallback() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        String original = preferences().getString(DownloadLedger.RECORDS, "");
        nativeJobs.rejectEnqueue = true;
        AtomicBoolean finished = new AtomicBoolean();
        assertTrue(DownloadLedger.retry(app, id, () -> finished.set(true)));
        settle();
        assertTrue(finished.get());
        assertEquals(1, nativeJobs.getRequestCount());
        assertEquals(original, preferences().getString(DownloadLedger.RECORDS, ""));
        assertEquals("Couldn't save this pin.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void sourceValidationRejectsUnsafeAndUnsupportedRetryUrlsAndKeepsNativeFiles() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        String[] urls = {"http://i.pinimg.com/pin.jpg", "https://i.pinimg.com.example.org/pin.jpg",
                "https://user:password@i.pinimg.com/pin.jpg", "https://i.pinimg.com:444/pin.jpg",
                "file:///private/pin.jpg", "https://i.pinimg.com/playlist.m3u8", "https://i.pinimg.com/not-media", null};
        for (String url : urls) {
            nativeJobs.sources.put(id, url);
            DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
            assertFalse(String.valueOf(url), job.canRetry());
            assertTrue(DownloadLedger.retry(app, id, null));
            settle();
            assertEquals(1, nativeJobs.getRequestCount());
            assertEquals("Open the pin again to get a fresh download link.", ShadowToast.getTextOfLatestToast());
        }
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void onlyFreshFailedStateCanRetryAndNativePausedRetryRemainsUntouched() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        assertTrue(new DownloadLedger(app).reconcile().get(0).canRetry());
        for (int state : new int[]{DownloadManager.STATUS_PENDING, DownloadManager.STATUS_RUNNING,
                DownloadManager.STATUS_PAUSED, DownloadManager.STATUS_SUCCESSFUL}) {
            status(id, state);
            assertTrue(DownloadLedger.retry(app, id, null));
            settle();
            assertEquals(1, nativeJobs.getRequestCount());
            assertEquals("Can't retry this. Check Downloads or open the pin again.", ShadowToast.getTextOfLatestToast());
        }
        nativeJobs.nullCursor = true;
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        assertEquals("Couldn't check Downloads. Try again.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void pauseDisabledSwitchAndAbsentCapabilityPreventRetryButKeepReconciliation() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        assertEquals(1, nativeJobs.getRequestCount());
        assertTrue(nativeJobs.queries.isEmpty());
        DownloadLedger.onStart(app);
        settle();
        assertEquals(DownloadLedger.State.FAILED, processView().get(0).state);
        PauseForTests.resume();
        Settings.DOWNLOAD_PINS.save(false);
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        assertEquals("Resume HushPinterest and turn on Download pins to retry.", ShadowToast.getTextOfLatestToast());
        Settings.DOWNLOAD_PINS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        assertEquals(1, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertEquals("Open the pin again to get a fresh download link.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void forgettingCompletedAndActiveHistoryKeepsEveryNativeRequest() throws Exception {
        long active = owned("123", DownloadManager.STATUS_RUNNING);
        long complete = owned("456", DownloadManager.STATUS_SUCCESSFUL);
        AtomicInteger callbacks = new AtomicInteger();
        assertTrue(DownloadLedger.removeHistory(app, complete, callbacks::incrementAndGet));
        settle();
        assertTrue(DownloadLedger.removeHistory(app, active, callbacks::incrementAndGet));
        settle();
        assertEquals(2, callbacks.get());
        assertTrue(new DownloadLedger(app).reconcile().isEmpty());
        assertEquals(2, nativeJobs.getRequestCount());
        assertNotNull(nativeJobs.getRequest(active));
        assertNotNull(nativeJobs.getRequest(complete));
        assertEquals(0, nativeJobs.removes);
        assertTrue(nativeJobs.queries.isEmpty());
        assertEquals("History removed. Files and active downloads were kept.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void guidanceUsesSystemDownloadsAndCanonicalPinRouteWithoutSharingFileUris() {
        long id = owned("123", DownloadManager.STATUS_RUNNING);
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertTrue(DownloadLedger.openDownloads(app));
        Intent downloads = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(DownloadManager.ACTION_VIEW_DOWNLOADS, downloads.getAction());
        assertNull(downloads.getData());
        assertTrue(DownloadLedger.reopenPin(app, job));
        Intent pin = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, pin.getAction());
        assertEquals("https://www.pinterest.com/pin/123/", pin.getDataString());
        assertEquals(app.getPackageName(), pin.getPackage());
        assertTrue(pin.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertEquals(0, pin.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertArrayEquals(new long[]{id}, nativeJobs.queries.get(0));
    }

    @Test public void onlyAFinishedImageIsHandedToSetAsWithAReadGrant() throws Exception {
        long image = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        long video = owned("456", DownloadManager.STATUS_SUCCESSFUL);
        long running = owned("789", DownloadManager.STATUS_RUNNING);
        nativeJobs.mimes.put(video, "video/mp4");
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        DownloadLedger.Job finished = jobs.stream().filter(job -> job.id == image).findFirst().get();
        assertTrue(finished.canSetAs());
        assertFalse(jobs.stream().filter(job -> job.id == video).findFirst().get().canSetAs());
        assertFalse(jobs.stream().filter(job -> job.id == running).findFirst().get().canSetAs());
        assertTrue(DownloadLedger.setAs(app, finished));
        settle();
        Intent chooser = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        Intent attach = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals(Intent.ACTION_ATTACH_DATA, attach.getAction());
        assertEquals("content://downloads/all_downloads/" + image, attach.getDataString());
        assertEquals("image/jpeg", attach.getType());
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, attach.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertEquals("image/jpeg", attach.getStringExtra("mimeType"));
    }

    @Test public void setAsRechecksTheRequestAndTheSwitchBeforeOpeningAnything() throws Exception {
        long image = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        DownloadLedger.Job finished = new DownloadLedger(app).reconcile().get(0);
        status(image, DownloadManager.STATUS_RUNNING);
        assertTrue(DownloadLedger.setAs(app, finished));
        settle();
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertEquals("This download isn't a finished image anymore. Check Downloads.", ShadowToast.getTextOfLatestToast());
        status(image, DownloadManager.STATUS_SUCCESSFUL);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertTrue(DownloadLedger.setAs(app, finished));
        settle();
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertEquals("Resume HushPinterest and turn on Download pins to use this.", ShadowToast.getTextOfLatestToast());
    }

    /** Open and Share hand over Android's own content address for a finished download, with a read grant and no copy. */
    @Test public void aFinishedDownloadOpensAndSharesByItsContentAddressWithAReadGrant() throws Exception {
        long image = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        long video = owned("456", DownloadManager.STATUS_SUCCESSFUL);
        nativeJobs.mimes.put(video, "video/mp4");
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        DownloadLedger.Job picture = jobs.stream().filter(job -> job.id == image).findFirst().get();
        DownloadLedger.Job clip = jobs.stream().filter(job -> job.id == video).findFirst().get();
        assertTrue(picture.canOpen());
        assertTrue(clip.canOpen());
        int grants = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;

        assertTrue(DownloadLedger.openFile(app, picture));
        settle();
        Intent view = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, view.getAction());
        assertEquals("content://downloads/all_downloads/" + image, view.getDataString());
        assertEquals("image/jpeg", view.getType());
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, view.getFlags() & grants);

        assertTrue(DownloadLedger.shareFile(app, clip));
        settle();
        Intent chooser = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, chooser.getAction());
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals(Intent.ACTION_SEND, send.getAction());
        assertEquals("video/mp4", send.getType());
        Uri stream = send.getParcelableExtra(Intent.EXTRA_STREAM);
        assertEquals("content://downloads/all_downloads/" + video, String.valueOf(stream));
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, send.getFlags() & grants);
        // The chooser passes the read grant on for the URI in its clip.
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, chooser.getFlags() & grants);
        assertEquals(stream, chooser.getClipData().getItemAt(0).getUri());
        assertEquals(2, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
    }

    /**
     * Android files a finished download in MediaStore too, where other apps see the file's own name
     * and get a preview, so that address goes out. Anything else in that column keeps DownloadManager's.
     */
    @Test public void theMediaStoreEntryIsHandedOverWhenAndroidFiledOne() throws Exception {
        long video = owned("456", DownloadManager.STATUS_SUCCESSFUL);
        long image = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        nativeJobs.mimes.put(video, "video/mp4");
        nativeJobs.filed.put(video, "content://media/external_primary/downloads/248");
        nativeJobs.filed.put(image, "file:///storage/emulated/0/Download/Pinterest_123.jpg");
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        DownloadLedger.Job clip = jobs.stream().filter(job -> job.id == video).findFirst().get();
        DownloadLedger.Job picture = jobs.stream().filter(job -> job.id == image).findFirst().get();

        assertTrue(DownloadLedger.shareFile(app, clip));
        settle();
        Intent chooser = Shadows.shadowOf(app).getNextStartedActivity();
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        Uri stream = send.getParcelableExtra(Intent.EXTRA_STREAM);
        assertEquals("content://media/external_primary/downloads/248", String.valueOf(stream));
        assertEquals(stream, chooser.getClipData().getItemAt(0).getUri());
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, send.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);

        assertTrue(DownloadLedger.openFile(app, picture));
        settle();
        assertEquals("content://downloads/all_downloads/" + image,
                Shadows.shadowOf(app).getNextStartedActivity().getDataString());
    }

    /**
     * With the share preview provider in the manifest, Share file sends a video's MediaStore entry
     * through it, grant and clip included, so the share sheet can show a frame. An image's entry
     * already previews and goes out as it is, and Open keeps the plain address.
     */
    @Test public void aSharedVideoGoesThroughTheSharePreviewProvider() throws Exception {
        android.content.pm.ProviderInfo info = new android.content.pm.ProviderInfo();
        info.authority = app.getPackageName() + ".hushpinterest.share";
        info.name = SharePreviewProvider.class.getName();
        info.packageName = app.getPackageName();
        Shadows.shadowOf(app.getPackageManager()).addOrUpdateProvider(info);
        // MediaStore files the video as one of this app's videos, which is what the provider serves.
        SharePreviewProviderTest.FakeMedia media = org.robolectric.Robolectric
                .buildContentProvider(SharePreviewProviderTest.FakeMedia.class).create("media").get();
        media.types.put("/external_primary/downloads/248", "video/mp4");
        media.types.put("/external_primary/downloads/249", "image/jpeg");
        media.owners.put("/external_primary/downloads/248", app.getPackageName());
        media.owners.put("/external_primary/downloads/249", app.getPackageName());
        long video = owned("456", DownloadManager.STATUS_SUCCESSFUL);
        long image = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        nativeJobs.mimes.put(video, "video/mp4");
        nativeJobs.filed.put(video, "content://media/external_primary/downloads/248");
        nativeJobs.filed.put(image, "content://media/external_primary/downloads/249");
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        DownloadLedger.Job clip = jobs.stream().filter(job -> job.id == video).findFirst().get();
        DownloadLedger.Job picture = jobs.stream().filter(job -> job.id == image).findFirst().get();

        assertTrue(DownloadLedger.shareFile(app, clip));
        settle();
        Intent chooser = Shadows.shadowOf(app).getNextStartedActivity();
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        Uri stream = send.getParcelableExtra(Intent.EXTRA_STREAM);
        assertEquals("content://" + info.authority + "/media/external_primary/downloads/248", String.valueOf(stream));
        assertEquals("video/mp4", send.getType());
        assertEquals(stream, chooser.getClipData().getItemAt(0).getUri());
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, chooser.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);

        assertTrue(DownloadLedger.shareFile(app, picture));
        settle();
        send = Shadows.shadowOf(app).getNextStartedActivity().getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals("content://media/external_primary/downloads/249", String.valueOf(send.getParcelableExtra(Intent.EXTRA_STREAM)));

        assertTrue(DownloadLedger.openFile(app, clip));
        settle();
        assertEquals("content://media/external_primary/downloads/248", Shadows.shadowOf(app).getNextStartedActivity().getDataString());
    }

    /**
     * A stale row never hands a file on: not when the file was deleted, the request failed, changed
     * type, left Android or left this history, and never for a local result.
     */
    @Test public void deletedFailedForeignAndLocalRowsNeverHandOverAFile() throws Exception {
        long id = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        DownloadLedger.Job finished = new DownloadLedger(app).reconcile().get(0);
        java.util.function.BooleanSupplier open = () -> DownloadLedger.openFile(app, finished);
        java.util.function.BooleanSupplier share = () -> DownloadLedger.shareFile(app, finished);
        String gone = "This download isn't a saved file anymore. Check Downloads.";

        // Deleted in a file manager: Android still calls the request finished.
        nativeJobs.deletedFiles.add(id);
        assertHandsNothing(open, gone);
        assertHandsNothing(share, gone);
        nativeJobs.deletedFiles.clear();
        status(id, DownloadManager.STATUS_FAILED);
        assertHandsNothing(open, gone);
        status(id, DownloadManager.STATUS_SUCCESSFUL);
        nativeJobs.mimes.put(id, "text/html");
        assertHandsNothing(share, gone);
        nativeJobs.mimes.remove(id);

        // Removed from history, the request and its file stay, but they're no longer this history's.
        assertTrue(DownloadLedger.removeHistory(app, id, null));
        settle();
        assertHandsNothing(open, gone);
        assertHandsNothing(share, gone);
        assertNotNull(nativeJobs.getRequest(id));

        assertTrue(DownloadLedger.record(app, id, "123"));
        manager.remove(id); // Simulates removal in system Downloads, not a ledger action.
        nativeJobs.removes = 0;
        assertHandsNothing(open, gone);

        assertTrue(DownloadLedger.recordResult(app, "789", DownloadLedger.State.SKIPPED));
        DownloadLedger.Job local = new DownloadLedger(app).reconcile().get(0);
        assertTrue(local.id < 0);
        assertFalse(local.canOpen());
        assertFalse(DownloadLedger.openFile(app, local));
        assertFalse(DownloadLedger.shareFile(app, local));
        settle();
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertEquals(0, nativeJobs.removes);
    }

    /** No app for the file, or Downloads that can't be asked, is said; paused, Android isn't asked at all. */
    @Test public void noAppForTheFileAnUnavailableDownloadsOrPauseIsSaid() throws Exception {
        owned("123", DownloadManager.STATUS_SUCCESSFUL);
        DownloadLedger.Job finished = new DownloadLedger(app).reconcile().get(0);
        Shadows.shadowOf(app).checkActivities(true);
        assertTrue(DownloadLedger.openFile(app, finished));
        settle();
        assertEquals("Couldn't open this file. Check Downloads for the saved file.", ShadowToast.getTextOfLatestToast());
        Shadows.shadowOf(app).checkActivities(false);

        nativeJobs.denied = true;
        assertHandsNothing(() -> DownloadLedger.shareFile(app, finished), "Couldn't share this file. Check Downloads for the saved file.");
        nativeJobs.denied = false;

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        int queries = nativeJobs.queries.size();
        assertHandsNothing(() -> DownloadLedger.openFile(app, finished), "Resume HushPinterest and turn on Download pins to use this.");
        assertEquals(queries, nativeJobs.queries.size());
    }

    private void assertHandsNothing(java.util.function.BooleanSupplier handOver, String said) throws Exception {
        assertTrue(handOver.getAsBoolean());
        settle();
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertEquals(said, ShadowToast.getTextOfLatestToast());
    }

    @Test public void workerRejectionSettlesCallbacksAndDoesNotMutateOrEnqueue() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        String before = preferences().getString(DownloadLedger.RECORDS, "");
        AtomicInteger callbacks = new AtomicInteger();
        AtomicReference<List<DownloadLedger.Job>> received = new AtomicReference<>(Collections.emptyList());
        try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
            assertFalse(DownloadLedger.refresh(app, jobs -> { received.set(jobs); callbacks.incrementAndGet(); }));
            assertFalse(DownloadLedger.retry(app, id, callbacks::incrementAndGet));
            assertFalse(DownloadLedger.removeHistory(app, id, callbacks::incrementAndGet));
            ShadowLooper.idleMainLooper();
            assertEquals(3, callbacks.get());
            assertNull(received.get());
            assertEquals(1, nativeJobs.getRequestCount());
            assertTrue(nativeJobs.queries.isEmpty());
            assertEquals(before, preferences().getString(DownloadLedger.RECORDS, ""));
        }
        assertEquals(0, nativeJobs.removes);
    }

    @Test public void failedHistoryPersistenceAfterRetryStillReportsStartedAndNeverUndoesNativeRequest() throws Exception {
        long id = owned("123", DownloadManager.STATUS_FAILED);
        SharedPreferences real = preferences();
        Context rejecting = rejectingWrites(real);
        assertTrue(DownloadLedger.retry(rejecting, id, null));
        settle();
        assertEquals(2, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertEquals("Download started, but history wasn't saved. Check Downloads.", ShadowToast.getTextOfLatestToast());
        assertTrue(real.getString(DownloadLedger.RECORDS, "").startsWith(id + ",123,"));
    }

    @Test public void privateStoreFailureStillSettlesRefreshWithUnknownHistory() throws Exception {
        Context denied = new ContextWrapper(app) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { throw new SecurityException("private test store denied"); }
        };
        AtomicInteger calls = new AtomicInteger();
        AtomicReference<List<DownloadLedger.Job>> received = new AtomicReference<>(Collections.emptyList());
        assertTrue(DownloadLedger.refresh(denied, jobs -> { calls.incrementAndGet(); received.set(jobs); }));
        settle();
        assertEquals(1, calls.get());
        assertNull(received.get());
        assertEquals("Couldn't check Downloads. Try again.", ShadowToast.getTextOfLatestToast());
        assertTrue(nativeJobs.queries.isEmpty());
    }

    @Test public void failedHistoryRemovalKeepsTheRecordAndNativeFile() throws Exception {
        long id = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        SharedPreferences real = preferences();
        String original = real.getString(DownloadLedger.RECORDS, "");
        AtomicBoolean finished = new AtomicBoolean();
        assertTrue(DownloadLedger.removeHistory(rejectingWrites(real), id, () -> finished.set(true)));
        settle();
        assertTrue(finished.get());
        assertEquals(original, real.getString(DownloadLedger.RECORDS, ""));
        assertNotNull(nativeJobs.getRequest(id));
        assertEquals(0, nativeJobs.removes);
        assertEquals("Couldn't remove this history entry. Try again.", ShadowToast.getTextOfLatestToast());
    }

    private long enqueue(String pinId) {
        return manager.enqueue(PinDownloads.request(PinMedia.sourceUrl(SOURCE, false), "Pinterest_" + pinId + "_1.jpg"));
    }

    private long owned(String pinId, int state) {
        long id = enqueue(pinId);
        status(id, state);
        assertTrue(DownloadLedger.record(app, id, pinId));
        return id;
    }

    private void status(long id, int state) {
        ShadowDownloadManager.ShadowRequest request = Shadow.extract(nativeJobs.getRequest(id));
        request.setStatus(state);
    }

    private SharedPreferences preferences() { return app.getSharedPreferences(DownloadLedger.STORE, Context.MODE_PRIVATE); }

    private void assertUnavailable(long id) {
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(id, job.id);
        assertEquals(DownloadLedger.State.UNAVAILABLE, job.state);
        assertFalse(job.canRetry());
        assertEquals("Couldn't check Downloads. Try again.", job.reasonText());
    }

    private List<ShadowApplication.Wrapper> registrations() {
        List<ShadowApplication.Wrapper> registrations = new ArrayList<>();
        for (ShadowApplication.Wrapper registration : Shadows.shadowOf(app).getRegisteredReceivers()) {
            if (registration.intentFilter.hasAction(DownloadManager.ACTION_DOWNLOAD_COMPLETE)) registrations.add(registration);
        }
        return registrations;
    }

    private ShadowApplication.Wrapper registration() {
        assertEquals(1, registrations().size());
        return registrations().get(0);
    }

    private void clearProcessView() throws Exception {
        Shadows.shadowOf(app).clearRegisteredReceivers();
        for (String name : new String[]{"receiverContext", "cachedContext"}) {
            Field field = DownloadLedger.class.getDeclaredField(name);
            field.setAccessible(true);
            field.set(null, null);
        }
        Field field = DownloadLedger.class.getDeclaredField("cached");
        field.setAccessible(true);
        field.set(null, Collections.emptyList());
    }

    @SuppressWarnings("unchecked")
    private List<DownloadLedger.Job> processView() {
        try {
            Field field = DownloadLedger.class.getDeclaredField("cached");
            field.setAccessible(true);
            return (List<DownloadLedger.Job>) field.get(null);
        } catch (ReflectiveOperationException failure) { throw new AssertionError(failure); }
    }

    private static void settle() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    private Context rejectingWrites(SharedPreferences real) {
        SharedPreferences denied = (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
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
        return new ContextWrapper(app) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                return name.equals(DownloadLedger.STORE) ? denied : super.getSharedPreferences(name, mode);
            }
        };
    }

    /** Real cursor contracts are exercised; the stock shadow doesn't implement reason codes. */
    @Implements(DownloadManager.class)
    public static class NativeDownloads extends ShadowDownloadManager {
        final List<long[]> queries = new ArrayList<>();
        final Map<Long, Integer> reasons = new HashMap<>();
        final Map<Long, String> sources = new HashMap<>();
        final Map<Long, String> mimes = new HashMap<>();
        final Map<Long, String> filed = new HashMap<>();
        final Set<Long> deletedFiles = new HashSet<>();
        /** Requests Android hasn't started: a phone reports no local URI for them, only the destination hint. */
        final Set<Long> unstarted = new HashSet<>();
        MatrixCursor cursor;
        boolean nullCursor;
        boolean denied;
        int failAfterReads = -1;
        boolean rejectEnqueue;
        long extraRow = -1;
        int removes;

        @Resetter public static void resetNative() { ShadowDownloadManager.reset(); }

        @Implementation @Override protected Cursor query(DownloadManager.Query query) {
            ShadowDownloadManager.ShadowQuery filter = Shadow.extract(query);
            long[] ids = filter.getIds();
            assertNotNull("unfiltered native download query", ids);
            queries.add(ids.clone());
            if (denied) throw new SecurityException("native query denied");
            if (nullCursor) return null;
            cursor = new MatrixCursor(new String[]{DownloadManager.COLUMN_ID, DownloadManager.COLUMN_STATUS,
                    DownloadManager.COLUMN_REASON, DownloadManager.COLUMN_URI, DownloadManager.COLUMN_MEDIA_TYPE,
                    DownloadManager.COLUMN_LOCAL_URI, DownloadManager.COLUMN_MEDIAPROVIDER_URI, DownloadLedger.DESTINATION_HINT}) {
                private int statusReads;
                @Override public int getInt(int column) {
                    if (column == 1 && failAfterReads >= 0 && statusReads++ == failAfterReads) {
                        throw new IllegalStateException("native row unavailable");
                    }
                    return super.getInt(column);
                }
            };
            for (long id : ids) addRow(id);
            if (extraRow >= 0) addRow(extraRow);
            return cursor;
        }

        @Implementation @Override protected long enqueue(DownloadManager.Request request) {
            return rejectEnqueue ? -1 : super.enqueue(request);
        }

        private void addRow(long id) {
            DownloadManager.Request original = getRequest(id);
            if (original == null) return;
            ShadowDownloadManager.ShadowRequest request = Shadow.extract(original);
            String destination = request.getDestination() == null ? null : request.getDestination().toString();
            cursor.addRow(new Object[]{id, request.getStatus(), reasons.getOrDefault(id, 0),
                    sources.containsKey(id) ? sources.get(id) : request.getUri().toString(),
                    mimes.containsKey(id) ? mimes.get(id) : request.getMimeType(),
                    unstarted.contains(id) ? null : destination, filed.get(id), destination});
        }

        /** Android keeps a finished request whose file was deleted elsewhere; opening its file then fails. */
        @Implementation protected ParcelFileDescriptor openDownloadedFile(long id) throws FileNotFoundException {
            if (getRequest(id) == null || deletedFiles.contains(id)) throw new FileNotFoundException("No file for download " + id);
            File saved = new File(RuntimeEnvironment.getApplication().getCacheDir(), "native-download-" + id);
            try (FileOutputStream out = new FileOutputStream(saved)) {
                out.write(1);
            } catch (IOException failure) {
                throw new AssertionError(failure);
            }
            return ParcelFileDescriptor.open(saved, ParcelFileDescriptor.MODE_READ_ONLY);
        }

        @Implementation protected Uri getUriForDownloadedFile(long id) {
            DownloadManager.Request original = getRequest(id);
            if (original == null) return null;
            ShadowDownloadManager.ShadowRequest request = Shadow.extract(original);
            return request.getStatus() == DownloadManager.STATUS_SUCCESSFUL ? Uri.parse("content://downloads/all_downloads/" + id) : null;
        }

        @Implementation @Override protected int remove(long... ids) {
            removes += ids.length;
            return super.remove(ids);
        }
    }
}
