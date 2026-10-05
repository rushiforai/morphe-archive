/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.Fragment;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import org.json.JSONArray;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;
import org.robolectric.shadows.ShadowToast;

import java.io.IOException;
import java.lang.reflect.Field;
import java.net.URI;
import java.util.EnumSet;
import java.util.Map;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.WorkerPoolForTests;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** Exercises Android 9's user-selected document flow without a storage permission. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@SuppressWarnings("deprecation")
public class DownloadPickerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private Activity activity;
    private final Map<String, Object> pin = Map.of("id", "123456", "images", Map.of(
            "orig", Map.of("url", "https://i.pinimg.com/originals/pin.jpg")));

    @Before public void prepare() {
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        Settings.DOWNLOAD_PINS.save(true);
        assertTrue(activity.getApplicationContext().getSharedPreferences(PendingSaveJournal.STORE, 0)
                .edit().putString(PendingSaveJournal.RECORDS, "[]").commit());
    }

    @After public void reset() {
        Fragment fragment = activity.getFragmentManager().findFragmentByTag("hushpinterest_save_pin");
        if (fragment instanceof PinDownloads.SaveFragment) {
            fragment.onActivityResult(48122, Activity.RESULT_CANCELED, null);
            activity.getFragmentManager().executePendingTransactions();
        }
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
    }

    @Test public void savePickerHasCorrectMimeFilenameAndDoesNotRequestStoragePermission() {
        assertTrue(PinDownloads.start(pin, activity));
        Intent picker = Shadows.shadowOf(activity).getNextStartedActivity();
        assertEquals(Intent.ACTION_CREATE_DOCUMENT, picker.getAction());
        assertTrue(picker.hasCategory(Intent.CATEGORY_OPENABLE));
        assertEquals("image/jpeg", picker.getType());
        assertTrue(picker.getStringExtra(Intent.EXTRA_TITLE).matches("Pinterest_123456_[0-9]+\\.jpg"));
        assertFalse(PinDownloads.start(pin, activity));
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
        cancel();
        assertTrue(PinDownloads.start(pin, activity));
    }

    @Test public void launchedPickerIsNotLaunchedAgainAfterFragmentStateRestoration() {
        assertTrue(PinDownloads.start(pin, activity));
        Shadows.shadowOf(activity).getNextStartedActivity();
        PinDownloads.SaveFragment original = fragment();
        Fragment.SavedState state = activity.getFragmentManager().saveFragmentInstanceState(original);
        Bundle args = original.getArguments();
        cancel();
        PinDownloads.SaveFragment restored = new PinDownloads.SaveFragment();
        restored.setArguments(args);
        restored.setInitialSavedState(state);
        activity.getFragmentManager().beginTransaction().add(restored, "hushpinterest_save_pin").commitNow();
        assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
    }

    @Test public void leavingActivityReleasesPendingSaveForTheNextActivity() {
        assertTrue(PinDownloads.start(pin, activity));
        activity.finish();
        controller.pause().stop().destroy();
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        Utils.setActivity(activity);
        assertTrue(PinDownloads.start(pin, activity));
    }

    @Test public void rejectedWorkerCleansEmptyDocumentAndReleasesSaveWithoutNetwork() throws Exception {
        DeleteProvider provider = provider(false);
        Uri destination = Uri.parse("content://test.documents/document/new");
        assertTrue(PinDownloads.start(pin, activity));
        try (WorkerPoolForTests ignored = WorkerPoolForTests.fill()) {
            fragment().onActivityResult(48122, Activity.RESULT_OK, new Intent().setData(destination));
            activity.getFragmentManager().executePendingTransactions();
            assertTrue("empty document wasn't deleted", provider.attempted.await(3, TimeUnit.SECONDS));
            awaitReleased();
        }
        assertEquals(List.of(destination), provider.deleted);
        assertTrue(PinDownloads.start(pin, activity));
    }

    @Test public void rejectedWorkerWithDeniedCleanupStillReleasesBusyStateAndReportsTheFile() throws Exception {
        DeleteProvider provider = provider(true);
        assertTrue(PinDownloads.start(pin, activity));
        try (WorkerPoolForTests ignored = WorkerPoolForTests.fill()) {
            fragment().onActivityResult(48122, Activity.RESULT_OK,
                    new Intent().setData(Uri.parse("content://test.documents/document/new")));
            activity.getFragmentManager().executePendingTransactions();
            assertTrue(provider.attempted.await(3, TimeUnit.SECONDS));
            awaitReleased();
        }
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Couldn't remove the incomplete file. Check your chosen save location.", ShadowToast.getTextOfLatestToast());
        assertTrue(provider.deleted.isEmpty());
        assertTrue(PinDownloads.start(pin, activity));
    }

    @Test public void pauseBeforeThePickerReturnsDiscardsOnlyItsNewEmptyDocument() throws Exception {
        DeleteProvider provider = provider(false);
        Uri destination = Uri.parse("content://test.documents/document/new");
        assertTrue(PinDownloads.start(pin, activity));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        fragment().onActivityResult(48122, Activity.RESULT_OK, new Intent().setData(destination));
        activity.getFragmentManager().executePendingTransactions();
        assertTrue(provider.attempted.await(3, TimeUnit.SECONDS));
        awaitReleased();
        assertEquals(List.of(destination), provider.deleted);
        PauseForTests.resume();
        assertTrue(PinDownloads.start(pin, activity));
    }

    @Test public void incompleteFullSaveIsDeletedButLateProviderFailureAndUnknownFailureArePreserved() throws Exception {
        DeleteProvider provider = provider(false);
        Uri destination = Uri.parse("content://test.documents/document/new");
        String source = "https://i.pinimg.com/originals/pin.jpg";
        PinTransferTest.Response partial = new PinTransferTest.Response(URI.create(source), 206, null);
        try {
            PinTransfer.save(activity, destination, source, ignored -> partial, System::nanoTime,
                    PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
            fail("partial save succeeded");
        } catch (PinTransfer.SaveFailure failure) {
            PinDownloads.failedDocument(activity, destination, failure);
        }
        assertEquals(List.of(destination), provider.deleted);

        provider.deleted.clear();
        PinTransferTest.ClosingOutput output = new PinTransferTest.ClosingOutput();
        output.failClose = true;
        Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(destination, output);
        PinTransferTest.Response complete = new PinTransferTest.Response(URI.create(source), 200, null);
        complete.input = new PinTransferTest.ClosingInput(new byte[]{1, 2, 3});
        complete.length = 3;
        try {
            PinTransfer.save(activity, destination, source, ignored -> complete, System::nanoTime,
                    PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
            fail("provider close failure was ignored");
        } catch (PinTransfer.SaveFailure failure) {
            PinDownloads.failedDocument(activity, destination, failure);
        }
        assertArrayEquals(new byte[]{1, 2, 3}, output.toByteArray());
        assertTrue(provider.deleted.isEmpty());
        assertEquals("The file may have saved. Check your chosen save location.", ShadowToast.getTextOfLatestToast());

        PinDownloads.failedDocument(activity, destination, new IOException("unknown completion"));
        assertTrue(provider.deleted.isEmpty());
    }

    @Test public void corruptJournalRefusesTheChosenSaveBeforeWritingOrDeletingItsFile() throws Exception {
        DeleteProvider provider = provider(false);
        assertTrue(activity.getApplicationContext().getSharedPreferences(PendingSaveJournal.STORE, 0)
                .edit().putString(PendingSaveJournal.RECORDS, "malformed").commit());
        assertTrue(PinDownloads.start(pin, activity));
        // If the journal guard is skipped, this source fails immediately and cleanup deletes the file.
        fragment().getArguments().putString("url", "https://untrusted.test/pin.jpg");
        fragment().onActivityResult(48122, Activity.RESULT_OK,
                new Intent().setData(Uri.parse("content://test.documents/document/new")));
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        awaitReleased();
        assertTrue(provider.deleted.isEmpty());
        assertEquals("Couldn't record the save location. No file data was written.", ShadowToast.getTextOfLatestToast());
        assertEquals("malformed", activity.getApplicationContext().getSharedPreferences(PendingSaveJournal.STORE, 0)
                .getString(PendingSaveJournal.RECORDS, null));
    }

    @Test public void fullJournalPreservesAllPendingDestinationsAndRefusesAnotherWrite() throws Exception {
        DeleteProvider provider = provider(false);
        Context app = activity.getApplicationContext();
        for (int i = 0; i < PendingSaveJournal.LIMIT; i++) {
            PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(app,
                    Uri.parse("content://test.documents/document/old-" + i), 0);
            PendingSaveJournal.interrupted(app, ticket);
        }
        String original = app.getSharedPreferences(PendingSaveJournal.STORE, 0).getString(PendingSaveJournal.RECORDS, null);
        assertEquals(PendingSaveJournal.LIMIT, new JSONArray(original).length());
        assertTrue(PinDownloads.start(pin, activity));
        fragment().getArguments().putString("url", "https://untrusted.test/pin.jpg");
        fragment().onActivityResult(48122, Activity.RESULT_OK,
                new Intent().setData(Uri.parse("content://test.documents/document/new")));
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        awaitReleased();
        assertTrue(provider.deleted.isEmpty());
        assertEquals(original, app.getSharedPreferences(PendingSaveJournal.STORE, 0).getString(PendingSaveJournal.RECORDS, null));
        assertEquals("Save history is full. Remove an old entry before saving another pin.", ShadowToast.getTextOfLatestToast());
    }

    private void awaitReleased() throws Exception {
        long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        Field saving = PinDownloads.class.getDeclaredField("SAVING");
        saving.setAccessible(true);
        java.util.concurrent.atomic.AtomicBoolean claim = (java.util.concurrent.atomic.AtomicBoolean) saving.get(null);
        while (claim.get() && System.nanoTime() < end) Thread.sleep(2);
        assertFalse("save claim wasn't released", claim.get());
    }

    private DeleteProvider provider(boolean denied) {
        DeleteProvider provider = new DeleteProvider(denied);
        ShadowContentResolver.registerProviderInternal("test.documents", provider);
        return provider;
    }

    private static final class DeleteProvider extends ContentProvider {
        final CountDownLatch attempted = new CountDownLatch(1);
        final List<Uri> deleted = new CopyOnWriteArrayList<>();
        final boolean denied;
        DeleteProvider(boolean denied) { this.denied = denied; }
        @Override public boolean onCreate() { return true; }
        @Override public Bundle call(String method, String argument, Bundle extras) {
            if (!"android:deleteDocument".equals(method)) throw new AssertionError("Unexpected provider call " + method);
            attempted.countDown();
            if (denied) throw new SecurityException("provider deletion denied");
            deleted.add(extras.getParcelable("uri"));
            return new Bundle();
        }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) { return null; }
        @Override public String getType(Uri uri) { return "image/jpeg"; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }

    private PinDownloads.SaveFragment fragment() {
        return (PinDownloads.SaveFragment) activity.getFragmentManager().findFragmentByTag("hushpinterest_save_pin");
    }

    private void cancel() {
        fragment().onActivityResult(48122, Activity.RESULT_CANCELED, null);
        activity.getFragmentManager().executePendingTransactions();
    }
}
