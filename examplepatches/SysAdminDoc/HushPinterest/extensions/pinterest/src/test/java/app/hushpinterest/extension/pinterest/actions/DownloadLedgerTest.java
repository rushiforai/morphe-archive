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
import android.os.Looper;

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

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    @Test public void recordsOnlyBoundedMinimalFactsAndEvictionKeepsNativeRequests() throws Exception {
        for (int i = 0; i < 40; i++) owned(Integer.toString(1000 + i), DownloadManager.STATUS_PENDING);
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals(32, jobs.size());
        assertEquals("1039", jobs.get(0).pinId);
        assertEquals("1008", jobs.get(31).pinId);
        String stored = preferences().getString(DownloadLedger.RECORDS, "");
        assertEquals(32, stored.lines().count());
        for (String row : stored.split("\n")) assertTrue(row, row.matches("[0-9]+,[0-9]{1,30},[0-9]+"));
        assertEquals(1, preferences().getAll().size());
        assertFalse(stored.contains("https"));
        assertFalse(stored.contains("token"));
        assertFalse(stored.contains("Pinterest_"));
        assertFalse(stored.contains("content:"));
        assertEquals(40, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertEquals(32, nativeJobs.queries.get(0).length);
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
                "7,123,100\n7,999,200\n-1,123,100\n8,bad,100\n9,123,0\n"
                        + "9999999999999999999,123,100\n10,123,9999999999999999999\n11,123,100,extra\n").commit();
        List<DownloadLedger.Job> jobs = new DownloadLedger(app).reconcile();
        assertEquals(1, jobs.size());
        assertEquals(7, jobs.get(0).id);
        assertEquals("123", jobs.get(0).pinId);
        assertEquals(DownloadLedger.State.MISSING, jobs.get(0).state);
        assertArrayEquals(new long[]{7}, nativeJobs.queries.get(0));
        nativeJobs.queries.clear();
        preferences().edit().putString(DownloadLedger.RECORDS, "1,2,3\n".repeat(700)).commit();
        assertTrue(new DownloadLedger(app).reconcile().isEmpty());
        assertTrue(nativeJobs.queries.isEmpty());
        preferences().edit().putInt(DownloadLedger.RECORDS, 1).commit();
        assertTrue(new DownloadLedger(app).reconcile().isEmpty());
        assertTrue(nativeJobs.queries.isEmpty());
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

    @Test public void pausedAndFailedReasonCodesHaveNonsecretFallbacks() {
        long id = owned("123", DownloadManager.STATUS_PAUSED);
        int[] paused = {DownloadManager.PAUSED_WAITING_FOR_NETWORK, DownloadManager.PAUSED_QUEUED_FOR_WIFI, DownloadManager.PAUSED_UNKNOWN};
        String[] pauseText = {"Waiting for a network connection.", "Waiting for Wi-Fi.", "Paused by Android."};
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

    @Test @Config(sdk = 28)
    public void AndroidNineDoesNotCreateNativeLedgerOrReceiver() throws Exception {
        assertFalse(DownloadLedger.record(app, 1, "123"));
        DownloadLedger.onStart(app);
        settle();
        assertTrue(registrations().isEmpty());
        assertTrue(nativeJobs.queries.isEmpty());
        assertTrue(preferences().getAll().isEmpty());
    }

    @Test public void missingRequestIsGuidanceWithoutAssumingTheFileWasDeleted() throws Exception {
        long id = owned("123", DownloadManager.STATUS_SUCCESSFUL);
        manager.remove(id); // Simulates removal in system Downloads, not a ledger action.
        nativeJobs.removes = 0;
        DownloadLedger.Job job = new DownloadLedger(app).reconcile().get(0);
        assertEquals(DownloadLedger.State.MISSING, job.state);
        assertFalse(job.canRetry());
        assertEquals("Android no longer has this request. Check Downloads before saving again.", job.reasonText());
        assertTrue(DownloadLedger.retry(app, id, null));
        settle();
        assertEquals(0, nativeJobs.getRequestCount());
        assertEquals(0, nativeJobs.removes);
        assertEquals("Open the pin again to get a fresh download link.", ShadowToast.getTextOfLatestToast());
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
            assertEquals("This request can't be retried. Check Downloads or open the pin again.", ShadowToast.getTextOfLatestToast());
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
        assertEquals("Download started, but its history couldn't be saved. Check Downloads.", ShadowToast.getTextOfLatestToast());
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
                    DownloadManager.COLUMN_REASON, DownloadManager.COLUMN_URI, DownloadManager.COLUMN_MEDIA_TYPE}) {
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
            cursor.addRow(new Object[]{id, request.getStatus(), reasons.getOrDefault(id, 0),
                    sources.containsKey(id) ? sources.get(id) : request.getUri().toString(),
                    mimes.containsKey(id) ? mimes.get(id) : request.getMimeType()});
        }

        @Implementation @Override protected int remove(long... ids) {
            removes += ids.length;
            return super.remove(ids);
        }
    }
}
