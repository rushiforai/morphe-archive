/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.UriPermission;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Looper;
import android.provider.DocumentsContract;

import org.json.JSONArray;
import org.json.JSONException;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowContentResolver;
import org.robolectric.util.ReflectionHelpers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.net.URI;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.IntPredicate;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.WorkerPoolForTests;

/** Models process loss by dropping volatile worker claims while retaining private persisted facts. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, shadows = PendingSaveJournalTest.RecoveryResolver.class)
public class PendingSaveJournalTest {
    private static final Uri DESTINATION = Uri.parse("content://test.recovery/document/created-pin");
    private static final String SOURCE = "https://i.pinimg.com/originals/pin.jpg";
    private static final int READ = Intent.FLAG_GRANT_READ_URI_PERMISSION;
    private static final int WRITE = Intent.FLAG_GRANT_WRITE_URI_PERMISSION;
    private static final int OFFERED = READ | WRITE | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION;
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private Context app;
    private PendingSaveJournal journal;
    private DocumentProvider provider;
    private File file;

    @Before public void prepare() throws Exception {
        app = RuntimeEnvironment.getApplication();
        preferences().edit().clear().commit();
        loseVolatileWorkers();
        RecoveryResolver.clearGrants();
        file = temporary.newFile("saved-pin.jpg");
        provider = new DocumentProvider();
        ProviderInfo info = new ProviderInfo();
        info.authority = DESTINATION.getAuthority();
        provider.attachInfo(app, info);
        ShadowContentResolver.registerProviderInternal(info.authority, provider);
        journal = new PendingSaveJournal(app);
    }

    @After public void reset() throws Exception {
        loseVolatileWorkers();
        Thread.interrupted();
    }

    @Test public void durableDestinationAndOnlyOfferedGrantDeltaExistBeforeFirstWrite() throws Exception {
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(app, DESTINATION, OFFERED | Intent.FLAG_ACTIVITY_NEW_TASK);
        JSONArray row = new JSONArray(preferences().getString(PendingSaveJournal.RECORDS, "")).getJSONArray(0);
        assertEquals(5, row.length());
        assertEquals(ticket.id, row.getLong(0));
        assertTrue(row.getLong(1) > 0);
        assertEquals(DESTINATION.toString(), row.getString(2));
        assertEquals(READ | WRITE, row.getInt(3));
        assertFalse(row.getBoolean(4));
        assertFalse(preferences().getAll().toString().contains(SOURCE));
        assertEquals(List.of(new Grant(DESTINATION, READ | WRITE)), RecoveryResolver.taken);
        assertEquals(0, provider.opens);
        ClosingOutput output = output();
        save(new ByteArrayInputStream(new byte[]{1, 2, 3}), 3);
        assertTrue(output.closed);
        assertArrayEquals(new byte[]{1, 2, 3}, Files.readAllBytes(file.toPath()));
    }

    @Test public void successfulCloseBeforeTerminalPersistenceStillBecomesInterruptedAndKeepsCompleteFile() throws Exception {
        journal.beginNow(DESTINATION, OFFERED);
        ClosingOutput output = output();
        byte[] complete = {3, 4, 5, 6};
        save(new ByteArrayInputStream(complete), complete.length);
        assertTrue("provider close didn't complete", output.closed);
        // The worker disappears before completed() can persist its terminal marker.
        assertRestartState(PendingSaveJournal.State.INTERRUPTED);
        assertArrayEquals(complete, Files.readAllBytes(file.toPath()));
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
        assertTrue(RecoveryResolver.released.isEmpty());
    }

    @Test public void midWriteLossPreservesPartialBytesAndNeverAppendsOrDeletesOnRestart() throws Exception {
        journal.beginNow(DESTINATION, OFFERED);
        ClosingOutput output = output();
        InputStream interrupted = new InputStream() {
            int reads;
            @Override public int read() { throw new AssertionError("bulk read expected"); }
            @Override public int read(byte[] bytes, int offset, int length) {
                if (reads++ != 0) throw new ProcessLoss();
                bytes[offset] = 7; bytes[offset + 1] = 8;
                return 2;
            }
        };
        try { save(interrupted, 6); fail("process loss wasn't delivered"); }
        catch (ProcessLoss lost) { /* No terminal journal operation occurred. */ }
        assertTrue(output.closed); // Test unwinding closes resources; no completion is inferred from it.
        assertRestartState(PendingSaveJournal.State.INTERRUPTED);
        assertArrayEquals(new byte[]{7, 8}, Files.readAllBytes(file.toPath()));
        assertEquals(1, output.closes);
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void failedTerminalCommitAfterCloseDoesNotTurnCompleteFileIntoCleanup() throws Exception {
        Context store = failingStore(commit -> commit == 2);
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(store, DESTINATION, OFFERED);
        output();
        save(new ByteArrayInputStream(new byte[]{9, 10}), 2);
        assertFalse(PendingSaveJournal.completed(store, ticket));
        loseVolatileWorkers();
        assertEquals(PendingSaveJournal.State.INTERRUPTED, new PendingSaveJournal(store).reconcile().get(0).state);
        assertArrayEquals(new byte[]{9, 10}, Files.readAllBytes(file.toPath()));
        assertTrue(RecoveryResolver.released.isEmpty());
        assertEquals(0, provider.deletes);
    }

    @Test public void providerCloseFailureRemainsUncertainAndNeverAuthorizesJournalDeletion() throws Exception {
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        ClosingOutput output = output();
        output.failClose = true;
        try { save(new ByteArrayInputStream(new byte[]{12, 13}), 2); fail("close failure was ignored"); }
        catch (PinTransfer.SaveFailure failure) { assertFalse(failure.incomplete); }
        PendingSaveJournal.interrupted(app, ticket);
        assertEquals(PendingSaveJournal.State.INTERRUPTED, journal.reconcile().get(0).state);
        assertArrayEquals(new byte[]{12, 13}, Files.readAllBytes(file.toPath()));
        assertEquals(0, provider.deletes);
    }

    @Test public void restartingAfterTerminalMarkerReleasesGrantAndNeverTouchesSavedFile() throws Exception {
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        Files.write(file.toPath(), new byte[]{18, 19});
        RecoveryResolver.lossOnRelease = true;
        try { journal.completedNow(ticket); fail("process loss wasn't delivered"); }
        catch (ProcessLoss lost) { /* The terminal marker was persisted before grant release. */ }
        assertTrue(new JSONArray(preferences().getString(PendingSaveJournal.RECORDS, "")).getJSONArray(0).getBoolean(4));
        RecoveryResolver.lossOnRelease = false;
        loseVolatileWorkers();
        assertTrue(new PendingSaveJournal(app).reconcile().isEmpty());
        assertEquals(List.of(new Grant(DESTINATION, READ | WRITE)), RecoveryResolver.released);
        assertArrayEquals(new byte[]{18, 19}, Files.readAllBytes(file.toPath()));
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void deathDuringGrantAcquisitionCanRecoverOnlyTheJournaledOfferedModes() throws Exception {
        RecoveryResolver.lossAfterTake = true;
        try { journal.beginNow(DESTINATION, OFFERED); fail("process loss wasn't delivered"); }
        catch (ProcessLoss lost) { /* Grant taken, pending record persisted, volatile token absent. */ }
        assertRestartState(PendingSaveJournal.State.INTERRUPTED);
        long id = journal.reconcile().get(0).id;
        assertTrue(journal.forgetNow(id));
        assertEquals(List.of(new Grant(DESTINATION, READ | WRITE)), RecoveryResolver.released);
        assertEquals(0, provider.deletes);
    }

    @Test public void revokedGrantProducesAccessLostWithoutQueryingOrDeletingTheDestination() throws Exception {
        journal.beginNow(DESTINATION, OFFERED);
        RecoveryResolver.grants.clear();
        assertRestartState(PendingSaveJournal.State.ACCESS_LOST);
        assertEquals(0, provider.queries);
        assertTrue(journal.forgetNow(journal.reconcile().get(0).id));
        assertTrue(RecoveryResolver.released.isEmpty());
        assertEquals(0, provider.deletes);
    }

    @Test public void unsupportedPersistableOfferStillRecordsLocationWithoutManufacturingAccess() throws Exception {
        journal.beginNow(DESTINATION, READ | WRITE); // Persistable was not offered.
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertRestartState(PendingSaveJournal.State.ACCESS_LOST);
        assertEquals(0, provider.queries);
    }

    @Test public void writeOnlyOfferNeverBecomesReadAccess() throws Exception {
        journal.beginNow(DESTINATION, WRITE | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        assertEquals(List.of(new Grant(DESTINATION, WRITE)), RecoveryResolver.taken);
        assertRestartState(PendingSaveJournal.State.ACCESS_LOST);
        assertEquals(0, provider.queries);
    }

    @Test public void grantRefusalDoesNotErasePendingFactsOrInventRecoveryAccess() throws Exception {
        RecoveryResolver.denyTake = true;
        journal.beginNow(DESTINATION, OFFERED);
        assertRestartState(PendingSaveJournal.State.ACCESS_LOST);
        assertEquals(1, new JSONArray(preferences().getString(PendingSaveJournal.RECORDS, "")).length());
        assertEquals(0, provider.opens);
    }

    @Test public void cannotDeterminePriorGrantsMeansNoNewRetainedPermissionIsClaimed() throws Exception {
        RecoveryResolver.denyGrantQuery = true;
        journal.beginNow(DESTINATION, OFFERED);
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertEquals(0, new JSONArray(preferences().getString(PendingSaveJournal.RECORDS, "")).getJSONArray(0).getInt(3));
        loseVolatileWorkers();
        assertEquals(PendingSaveJournal.State.UNAVAILABLE, journal.reconcile().get(0).state);
        RecoveryResolver.denyGrantQuery = false;
    }

    @Test public void completionReleasesOnlyNewModesAndKeepsPreexistingHostGrants() throws Exception {
        RecoveryResolver.grants.put(DESTINATION, READ);
        Uri unrelated = Uri.parse("content://test.recovery/document/host-owned");
        RecoveryResolver.grants.put(unrelated, READ | WRITE);
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        assertEquals(List.of(new Grant(DESTINATION, WRITE)), RecoveryResolver.taken);
        assertTrue(journal.completedNow(ticket));
        assertEquals(List.of(new Grant(DESTINATION, WRITE)), RecoveryResolver.released);
        assertEquals(Integer.valueOf(READ), RecoveryResolver.grants.get(DESTINATION));
        assertEquals(Integer.valueOf(READ | WRITE), RecoveryResolver.grants.get(unrelated));
        assertTrue(journal.reconcile().isEmpty());
    }

    @Test public void preexistingCompleteGrantIsNeverTakenTouchedOrReleased() throws Exception {
        RecoveryResolver.grants.put(DESTINATION, READ | WRITE);
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        assertTrue(journal.completedNow(ticket));
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertTrue(RecoveryResolver.released.isEmpty());
        assertEquals(Integer.valueOf(READ | WRITE), RecoveryResolver.grants.get(DESTINATION));
    }

    @Test public void deniedReleaseKeepsTerminalMarkerAndOffersTruthfulRetryGuidance() throws Exception {
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        RecoveryResolver.denyRelease = true;
        assertFalse(journal.completedNow(ticket));
        loseVolatileWorkers();
        PendingSaveJournal.Entry entry = journal.reconcile().get(0);
        assertEquals(PendingSaveJournal.State.RELEASE_PENDING, entry.state);
        assertTrue(entry.guidanceText().contains("The file was kept"));
        assertEquals(0, provider.queries);
        RecoveryResolver.denyRelease = false;
        assertTrue(journal.forgetNow(entry.id));
        assertTrue(journal.reconcile().isEmpty());
        assertEquals(0, provider.deletes);
    }

    @Test public void metadataFailureAfterReleaseIsRecoveredWithoutTakingAccessAgain() throws Exception {
        Context store = failingStore(commit -> commit == 3);
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(store, DESTINATION, OFFERED);
        assertFalse(PendingSaveJournal.completed(store, ticket));
        assertTrue(RecoveryResolver.grants.isEmpty());
        assertTrue(new JSONArray(preferences().getString(PendingSaveJournal.RECORDS, "")).getJSONArray(0).getBoolean(4));
        loseVolatileWorkers();
        assertTrue(new PendingSaveJournal(store).reconcile().isEmpty());
        assertEquals(1, RecoveryResolver.taken.size());
        assertEquals(1, RecoveryResolver.released.size());
        assertEquals(0, provider.deletes);
    }

    @Test public void failedInitialCommitPreventsPermissionAcquisitionAndTransfer() throws Exception {
        Context store = failingStore(commit -> true);
        try { PendingSaveJournal.begin(store, DESTINATION, OFFERED); fail("undurable save was permitted"); }
        catch (IOException failure) { assertTrue(failure.getMessage().contains("No file data was written")); }
        assertEquals("[]", preferences().getString(PendingSaveJournal.RECORDS, "[]"));
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertEquals(0, provider.opens);
    }

    @Test public void journalLimitRefusesNewSaveWithoutEvictingOlderDestinationsOrGrants() throws Exception {
        for (int i = 0; i < PendingSaveJournal.LIMIT; i++) {
            journal.beginNow(Uri.parse("content://test.recovery/document/" + i), OFFERED);
        }
        String before = preferences().getString(PendingSaveJournal.RECORDS, "");
        try { journal.beginNow(DESTINATION, OFFERED); fail("journal bound was ignored"); }
        catch (IOException full) { assertTrue(full.getMessage().contains("history is full")); }
        assertEquals(before, preferences().getString(PendingSaveJournal.RECORDS, ""));
        assertEquals(PendingSaveJournal.LIMIT, RecoveryResolver.taken.size());
        assertTrue(RecoveryResolver.released.isEmpty());
    }

    @Test public void sameDestinationCannotHaveTwoConcurrentOrInterruptedOwnershipClaims() throws Exception {
        journal.beginNow(DESTINATION, OFFERED);
        for (int attempt = 0; attempt < 2; attempt++) {
            try { journal.beginNow(DESTINATION, OFFERED); fail("duplicate destination permitted"); }
            catch (IllegalStateException duplicate) { assertTrue(duplicate.getMessage().contains("pending record")); }
            loseVolatileWorkers();
        }
        assertEquals(1, RecoveryResolver.taken.size());
        assertEquals(1, journal.reconcile().size());
    }

    @Test public void activeRecordCannotBeForgottenOrQueriedAsAnInterruptedSave() throws Exception {
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        assertEquals(PendingSaveJournal.State.SAVING, journal.reconcile().get(0).state);
        assertEquals(0, provider.queries);
        try { journal.forgetNow(ticket.id); fail("active save was forgotten"); }
        catch (IllegalStateException active) { assertTrue(active.getMessage().contains("still running")); }
        assertTrue(RecoveryResolver.released.isEmpty());
        PendingSaveJournal.interrupted(app, ticket);
        assertEquals(PendingSaveJournal.State.INTERRUPTED, journal.reconcile().get(0).state);
    }

    @Test public void historyRemovalKeepsCompletePartialAndUnrelatedFiles() throws Exception {
        byte[] saved = {29, 30};
        Files.write(file.toPath(), saved);
        File unrelated = temporary.newFile("unrelated.jpg");
        Files.write(unrelated.toPath(), new byte[]{31});
        PendingSaveJournal.Ticket ticket = journal.beginNow(DESTINATION, OFFERED);
        PendingSaveJournal.interrupted(app, ticket);
        assertTrue(journal.forgetNow(ticket.id));
        assertArrayEquals(saved, Files.readAllBytes(file.toPath()));
        assertArrayEquals(new byte[]{31}, Files.readAllBytes(unrelated.toPath()));
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void providerMissingNullDeniedWrongRowAndFailedCloseAreDistinctFromCompletion() throws Exception {
        journal.beginNow(DESTINATION, OFFERED);
        loseVolatileWorkers();
        provider.missing = true;
        assertEquals(PendingSaveJournal.State.MISSING, journal.reconcile().get(0).state);
        provider.missing = false;
        provider.nullCursor = true;
        assertEquals(PendingSaveJournal.State.UNAVAILABLE, journal.reconcile().get(0).state);
        provider.nullCursor = false;
        provider.denied = true;
        assertEquals(PendingSaveJournal.State.ACCESS_LOST, journal.reconcile().get(0).state);
        provider.denied = false;
        provider.wrongRow = true;
        assertEquals(PendingSaveJournal.State.UNAVAILABLE, journal.reconcile().get(0).state);
        provider.wrongRow = false;
        provider.failClose = true;
        assertEquals(PendingSaveJournal.State.UNAVAILABLE, journal.reconcile().get(0).state);
        provider.failClose = false;
        provider.failQuery = true;
        assertEquals(PendingSaveJournal.State.UNAVAILABLE, journal.reconcile().get(0).state);
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
        for (Uri queried : provider.queried) assertEquals(DESTINATION, queried);
    }

    @Test public void malformedPrivateJournalFailsClosedWithoutReleasingAnyHostPermission() throws Exception {
        RecoveryResolver.grants.put(DESTINATION, READ | WRITE);
        for (String bad : List.of("{", "[[1,2,\"https://i.pinimg.com/pin.jpg\",3,false]]",
                "[[1.5,2,\"content://test.recovery/document/created-pin\",3,false]]",
                "[[1,2,\"content://test.recovery/document/created-pin\",8,false]]",
                "[[1,2,\"content://test.recovery/document/created-pin\",3,false,\"extra\"]]")) {
            preferences().edit().putString(PendingSaveJournal.RECORDS, bad).commit();
            try { journal.beginNow(DESTINATION, OFFERED); fail("malformed journal was overwritten"); }
            catch (IllegalStateException invalid) { /* Preserve unknown bookkeeping and all files. */ }
            assertEquals(bad, preferences().getString(PendingSaveJournal.RECORDS, ""));
        }
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertTrue(RecoveryResolver.released.isEmpty());
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void nonDocumentOrOversizedDestinationNeverAcquiresAccessOrCreatesRecord() throws Exception {
        for (Uri bad : List.of(Uri.parse(SOURCE), Uri.fromFile(file), Uri.parse("content://test.recovery/not-document/id"),
                Uri.parse(DESTINATION + "?url=secret"), Uri.parse(DESTINATION + "#fragment"),
                Uri.parse("content://test.recovery/document/" + "x".repeat(2048)))) {
            try { journal.beginNow(bad, OFFERED); fail("invalid destination permitted"); }
            catch (IllegalArgumentException rejected) { /* No destination has been opened. */ }
        }
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertEquals("[]", preferences().getString(PendingSaveJournal.RECORDS, "[]"));
        assertEquals(0, provider.opens);
    }

    @Test public void startupReconcilesMissedWorkerCompletionWithoutDeletingOrStartingAnotherTransfer() throws Exception {
        journal.beginNow(DESTINATION, OFFERED);
        loseVolatileWorkers();
        PendingSaveJournal.onStart(app);
        assertTrue(provider.checked.await(3, TimeUnit.SECONDS));
        List<PendingSaveJournal.Entry> entries = awaitRefresh(app);
        assertEquals(PendingSaveJournal.State.INTERRUPTED, entries.get(0).state);
        assertTrue(entries.get(0).guidanceText().contains("won't resume or delete"));
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void workerRefusalReportsUnavailableAndAlwaysReturnsMainCallback() throws Exception {
        AtomicInteger callbacks = new AtomicInteger();
        try (WorkerPoolForTests ignored = WorkerPoolForTests.fill()) {
            assertFalse(PendingSaveJournal.refresh(app, entries -> { assertNull(entries); callbacks.incrementAndGet(); }));
            assertFalse(PendingSaveJournal.forget(app, 99, callbacks::incrementAndGet));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(2, callbacks.get());
        }
        assertEquals(0, provider.queries);
    }

    @Test public void inaccessibleStoreAndThrowingCallbackDoNotMakeTheNextControlUnusable() throws Exception {
        Context denied = new ContextWrapper(app) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { throw new SecurityException("private test store denied"); }
        };
        assertNull(awaitRefresh(denied));
        CountDownLatch delivered = new CountDownLatch(1);
        assertTrue(PendingSaveJournal.refresh(app, entries -> { delivered.countDown(); throw new IllegalStateException("test callback failed"); }));
        awaitCallback(delivered);
        assertTrue(awaitRefresh(app).isEmpty());
    }

    @Test @Config(sdk = 30, shadows = RecoveryResolver.class)
    public void newerNativeDownloadsNeverEnterThisJournalOrAcquireSafGrants() throws Exception {
        PendingSaveJournal.onStart(app);
        assertFalse(PendingSaveJournal.refresh(app, entries -> assertNull(entries)));
        try { PendingSaveJournal.begin(app, DESTINATION, OFFERED); fail("native download entered Android 9 journal"); }
        catch (IOException expected) { assertTrue(expected.getMessage().contains("Android 9")); }
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(RecoveryResolver.taken.isEmpty());
        assertEquals("[]", preferences().getString(PendingSaveJournal.RECORDS, "[]"));
        assertEquals(0, provider.queries);
        assertEquals(0, provider.deletes);
    }

    private void assertRestartState(PendingSaveJournal.State state) throws Exception {
        loseVolatileWorkers();
        List<PendingSaveJournal.Entry> entries = new PendingSaveJournal(app).reconcile();
        assertEquals(1, entries.size());
        assertEquals(state, entries.get(0).state);
    }

    private static void loseVolatileWorkers() throws Exception {
        Field active = PendingSaveJournal.class.getDeclaredField("ACTIVE");
        active.setAccessible(true);
        ((Set<?>) active.get(null)).clear();
        Field context = PendingSaveJournal.class.getDeclaredField("activeContext");
        context.setAccessible(true);
        context.set(null, null);
    }

    private ClosingOutput output() throws IOException {
        ClosingOutput output = new ClosingOutput(file);
        Shadows.shadowOf(app.getContentResolver()).registerOutputStream(DESTINATION, output);
        return output;
    }

    private void save(InputStream body, long length) throws Exception {
        PinTransferTest.Response response = new PinTransferTest.Response(URI.create(SOURCE), 200, null);
        response.input = body;
        response.length = length;
        PinTransfer.save(app, DESTINATION, SOURCE, ignored -> {
            try {
                JSONArray records = new JSONArray(preferences().getString(PendingSaveJournal.RECORDS, "[]"));
                assertEquals(1, records.length());
                assertEquals(DESTINATION.toString(), records.getJSONArray(0).getString(2));
            } catch (JSONException malformed) { throw new IOException("test journal wasn't readable before the transfer", malformed); }
            return response;
        }, System::nanoTime, PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
    }

    private SharedPreferences preferences() { return app.getSharedPreferences(PendingSaveJournal.STORE, Context.MODE_PRIVATE); }

    private Context failingStore(IntPredicate reject) {
        SharedPreferences real = preferences();
        AtomicInteger commits = new AtomicInteger();
        SharedPreferences store = (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
                    if (!method.getName().equals("edit")) return invoke(real, method, args);
                    SharedPreferences.Editor delegate = real.edit();
                    return Proxy.newProxyInstance(SharedPreferences.Editor.class.getClassLoader(),
                            new Class<?>[]{SharedPreferences.Editor.class}, (editor, change, values) -> {
                                if (change.getName().equals("commit") && reject.test(commits.incrementAndGet())) return false;
                                Object result = invoke(delegate, change, values);
                                return SharedPreferences.Editor.class.isAssignableFrom(change.getReturnType()) ? editor : result;
                            });
                });
        return new ContextWrapper(app) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                return name.equals(PendingSaveJournal.STORE) ? store : super.getSharedPreferences(name, mode);
            }
        };
    }

    private static Object invoke(Object target, java.lang.reflect.Method method, Object[] args) throws Throwable {
        try { return method.invoke(target, args); }
        catch (InvocationTargetException failure) { throw failure.getCause(); }
    }

    private List<PendingSaveJournal.Entry> awaitRefresh(Context context) throws Exception {
        AtomicReference<List<PendingSaveJournal.Entry>> result = new AtomicReference<>();
        CountDownLatch delivered = new CountDownLatch(1);
        assertTrue(PendingSaveJournal.refresh(context, entries -> {
            assertEquals(Looper.getMainLooper(), Looper.myLooper());
            result.set(entries);
            delivered.countDown();
        }));
        awaitCallback(delivered);
        return result.get();
    }

    private static void awaitCallback(CountDownLatch delivered) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        while (delivered.getCount() != 0 && System.nanoTime() < deadline) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Thread.sleep(5);
        }
        assertEquals("main callback wasn't delivered", 0, delivered.getCount());
    }

    private static final class ProcessLoss extends Error {}

    private static final class ClosingOutput extends OutputStream {
        final FileOutputStream output;
        boolean closed, failClose;
        int closes;
        ClosingOutput(File file) throws IOException { output = new FileOutputStream(file); }
        @Override public void write(int value) throws IOException { output.write(value); }
        @Override public void write(byte[] bytes, int offset, int length) throws IOException { output.write(bytes, offset, length); }
        @Override public void flush() throws IOException { output.flush(); }
        @Override public void close() throws IOException {
            output.close();
            closed = true;
            closes++;
            if (failClose) throw new IOException("test provider close failed after accepting bytes");
        }
    }

    private static final class Grant {
        final Uri uri;
        final int modes;
        Grant(Uri uri, int modes) { this.uri = uri; this.modes = modes; }
        @Override public boolean equals(Object other) { return other instanceof Grant && uri.equals(((Grant) other).uri) && modes == ((Grant) other).modes; }
        @Override public int hashCode() { return 31 * uri.hashCode() + modes; }
        @Override public String toString() { return uri + " modes=" + modes; }
    }

    /** Controlled permission service; real provider cursors and streams still exercise the save. */
    @Implements(ContentResolver.class)
    public static class RecoveryResolver extends ShadowContentResolver {
        static final Map<Uri, Integer> grants = new HashMap<>();
        static final List<Grant> taken = new ArrayList<>(), released = new ArrayList<>();
        static boolean denyTake, denyRelease, denyGrantQuery, lossAfterTake, lossOnRelease;
        static void clearGrants() {
            grants.clear(); taken.clear(); released.clear();
            denyTake = denyRelease = denyGrantQuery = lossAfterTake = lossOnRelease = false;
        }

        @Implementation protected List<UriPermission> getPersistedUriPermissions() {
            if (denyGrantQuery) throw new SecurityException("test grant query denied");
            List<UriPermission> result = new ArrayList<>();
            for (Map.Entry<Uri, Integer> entry : grants.entrySet()) result.add(ReflectionHelpers.callConstructor(UriPermission.class,
                    ReflectionHelpers.ClassParameter.from(Uri.class, entry.getKey()),
                    ReflectionHelpers.ClassParameter.from(int.class, entry.getValue()),
                    ReflectionHelpers.ClassParameter.from(long.class, 1L)));
            return result;
        }

        @Implementation protected void takePersistableUriPermission(Uri uri, int modes) {
            if (denyTake) throw new SecurityException("test offered grant refused");
            taken.add(new Grant(uri, modes));
            grants.merge(uri, modes, (before, added) -> before | added);
            if (lossAfterTake) throw new ProcessLoss();
        }

        @Implementation protected void releasePersistableUriPermission(Uri uri, int modes) {
            if (lossOnRelease) throw new ProcessLoss();
            if (denyRelease) throw new SecurityException("test grant release denied");
            released.add(new Grant(uri, modes));
            int remaining = grants.getOrDefault(uri, 0) & ~modes;
            if (remaining == 0) grants.remove(uri); else grants.put(uri, remaining);
        }
    }

    private static final class DocumentProvider extends ContentProvider {
        int queries, opens, deletes;
        boolean missing, nullCursor, denied, wrongRow, failClose, failQuery;
        final List<Uri> queried = new ArrayList<>();
        final CountDownLatch checked = new CountDownLatch(1);
        @Override public boolean onCreate() { return true; }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) {
            queries++;
            queried.add(uri);
            checked.countDown();
            assertArrayEquals(new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, projection);
            assertNull(selection); assertNull(args); assertNull(sort);
            if (denied) throw new SecurityException("test provider access revoked");
            if (failQuery) throw new IllegalStateException("test provider failed");
            if (nullCursor) return null;
            MatrixCursor cursor = new MatrixCursor(projection) {
                @Override public void close() {
                    super.close();
                    if (failClose) throw new IllegalStateException("test query close failed");
                }
            };
            if (!missing) cursor.addRow(new Object[]{wrongRow ? "wrong-document" : DocumentsContract.getDocumentId(uri)});
            return cursor;
        }
        @Override public android.content.res.AssetFileDescriptor openAssetFile(Uri uri, String mode) {
            opens++;
            throw new AssertionError("journal must not open or append a document");
        }
        @Override public int delete(Uri uri, String selection, String[] args) {
            deletes++;
            throw new AssertionError("journal must not delete a document");
        }
        @Override public android.os.Bundle call(String method, String arg, android.os.Bundle extras) {
            if ("android:deleteDocument".equals(method)) deletes++;
            throw new AssertionError("journal must not mutate a document provider");
        }
        @Override public String getType(Uri uri) { return "image/jpeg"; }
        @Override public Uri insert(Uri uri, ContentValues values) { throw new AssertionError("journal must not insert a document"); }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new AssertionError("journal must not update a document"); }
    }
}
