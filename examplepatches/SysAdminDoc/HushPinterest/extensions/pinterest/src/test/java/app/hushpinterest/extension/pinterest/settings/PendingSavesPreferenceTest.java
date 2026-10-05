/*
 * Copyright 2026 HushPinterest contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.provider.DocumentsContract;
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
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowContentResolver;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

import java.util.EnumSet;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushpinterest.extension.pinterest.actions.PendingSaveJournal;
import app.hushpinterest.extension.pinterest.actions.PendingSaveJournalTest;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;

/** Native clicks exercise the recovery guidance without granting authority over its files. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en-rUS", shadows = PendingSaveJournalTest.RecoveryResolver.class)
@SuppressWarnings("deprecation")
public class PendingSavesPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final Uri DESTINATION = Uri.parse("content://test.recovery/document/owned");
    private static final int OFFERED = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION;
    private Context app;
    private ActivityController<Activity> controller;
    private RecoveryPage page;
    private RecoveryProvider provider;

    @Before public void prepare() throws Exception {
        settle();
        app = RuntimeEnvironment.getApplication();
        ReflectionHelpers.callStaticMethod(PendingSaveJournalTest.RecoveryResolver.class, "clearGrants");
        store("[]");
        provider = new RecoveryProvider();
        ShadowContentResolver.registerProviderInternal("test.recovery", provider);
        controller = Robolectric.buildActivity(Activity.class).setup();
        page = new RecoveryPage();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commit();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
    }

    @After public void restore() throws Exception {
        provider.release.countDown();
        settle();
        controller.close();
        ShadowLooper.idleMainLooper();
        store("[]");
        PatchFamily.inBuildForTests = null;
    }

    @Test public void emptyHistoryRefreshesAndBackClosesTheNativeDialog() throws Exception {
        AlertDialog dialog = open();
        assertEquals("No pending HushPinterest saves.", message(dialog));
        assertEquals(View.GONE, entries(dialog).getVisibility());
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(dialog.isShowing());
    }

    @Test public void runningSaveCannotBeForgottenAndInterruptedHistoryNeverTouchesTheFile() throws Exception {
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(app, DESTINATION, OFFERED);
        AlertDialog history = open();
        AlertDialog running = choose(history);
        assertEquals("Saving", Shadows.shadowOf(running).getTitle());
        assertFalse(running.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        running.dismiss();
        ShadowLooper.idleMainLooper();
        PendingSaveJournal.interrupted(app, ticket);
        history.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        AlertDialog interrupted = choose(history);
        assertEquals("Interrupted", Shadows.shadowOf(interrupted).getTitle());
        assertTrue(message(interrupted).contains("won't resume or delete"));
        interrupted.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        settle();
        assertFalse(interrupted.isShowing());
        assertEquals("No pending HushPinterest saves.", message(history));
        assertEquals("Save history removed. The file was kept.", ShadowToast.getTextOfLatestToast());
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void revokedAccessShowsGuidanceWithoutCallingTheFileMissing() throws Exception {
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(app, DESTINATION, OFFERED);
        PendingSaveJournal.interrupted(app, ticket);
        provider.denied = true;
        AlertDialog choice = choose(open());
        assertEquals("Access unavailable", Shadows.shadowOf(choice).getTitle());
        assertTrue(message(choice).contains("Files app"));
        assertEquals(0, provider.opens);
        assertEquals(0, provider.deletes);
    }

    @Test public void corruptHistoryLeavesRefreshUsableAndPreservesThePrivateFacts() throws Exception {
        store("malformed");
        AlertDialog dialog = open();
        assertTrue(message(dialog).contains("Couldn't check"));
        assertEquals(View.GONE, entries(dialog).getVisibility());
        assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertEquals("malformed", app.getSharedPreferences("hushpinterest_pending_saves", Context.MODE_PRIVATE)
                .getString("destinations_v1", null));
        store("[]");
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertEquals("No pending HushPinterest saves.", message(dialog));
    }

    @Test public void aClosedHistoryIgnoresItsDelayedProviderCallback() throws Exception {
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(app, DESTINATION, OFFERED);
        PendingSaveJournal.interrupted(app, ticket);
        provider.hold.set(true);
        AlertDialog old = startOpen();
        assertTrue(provider.started.await(3, TimeUnit.SECONDS));
        old.dismiss();
        ShadowLooper.idleMainLooper();
        AlertDialog next = startOpen();
        provider.release.countDown();
        settle();
        assertTrue(next.isShowing());
        assertSame(next, page.row.getDialog());
        assertSame(next, ShadowAlertDialog.getLatestAlertDialog());
        assertTrue(next.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
    }

    @Test public void closingTheOwnerClosesBothItsHistoryAndItsEntry() throws Exception {
        PendingSaveJournal.Ticket ticket = PendingSaveJournal.begin(app, DESTINATION, OFFERED);
        PendingSaveJournal.interrupted(app, ticket);
        AlertDialog history = open();
        AlertDialog choice = choose(history);
        page.row.onActivityDestroy();
        ShadowLooper.idleMainLooper();
        assertFalse(history.isShowing());
        assertFalse(choice.isShowing());
        assertNull(page.row.getDialog());
    }

    @Test public void recoveryRowIsNonpersistentAndAnnouncesItsButtonAction() {
        assertEquals("action_pending_saves", page.row.getKey());
        assertFalse(page.row.isPersistent());
        ListView list = pageList();
        View drawn = list.getAdapter().getView(0, null, list);
        AccessibilityNodeInfo node = AccessibilityNodeInfo.obtain();
        drawn.onInitializeAccessibilityNodeInfo(node);
        assertEquals(Button.class.getName(), node.getClassName().toString());
        assertTrue(node.isClickable());
    }

    @Test public void android9SettingsUsesRecoveryInsteadOfNativeDownloadHistory() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DOWNLOAD_PINS);
        HushPinterestPreferenceFragment settings = new HushPinterestPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction().replace(android.R.id.content, settings).commit();
        controller.get().getFragmentManager().executePendingTransactions();
        assertTrue(settings.findPreference("action_pending_saves") instanceof PendingSavesPreference);
        assertNotNull(settings.findPreference("action_download_history"));
    }

    private void store(String text) {
        assertTrue(app.getSharedPreferences("hushpinterest_pending_saves", Context.MODE_PRIVATE)
                .edit().putString("destinations_v1", text).commit());
    }
    private static void settle() throws Exception { Utils.awaitBackgroundTasksForTests(); ShadowLooper.idleMainLooper(); }
    private AlertDialog startOpen() { click(pageList(), 0); return (AlertDialog) page.row.getDialog(); }
    private AlertDialog open() throws Exception { AlertDialog dialog = startOpen(); settle(); return dialog; }
    private AlertDialog choose(AlertDialog history) { click(entries(history), 0); return ShadowAlertDialog.getLatestAlertDialog(); }
    private ListView pageList() { return page.getView().findViewById(android.R.id.list); }
    private static ListView entries(AlertDialog dialog) { return dialog.findViewById(android.R.id.list); }
    private static String message(AlertDialog dialog) {
        TextView text = visibleMessage(dialog.getWindow().getDecorView());
        assertNotNull("no visible recovery explanation", text);
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
    private static void click(ListView list, int position) {
        ListAdapter adapter = list.getAdapter();
        assertNotNull(adapter);
        assertTrue(list.performItemClick(adapter.getView(position, null, list), position, adapter.getItemId(position)));
    }

    public static class RecoveryPage extends PreferenceFragment {
        PendingSavesPreference row;
        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
            row = new PendingSavesPreference(getActivity());
            screen.addPreference(row);
            setPreferenceScreen(screen);
        }
    }
    private static class RecoveryProvider extends ContentProvider {
        final AtomicBoolean hold = new AtomicBoolean();
        final CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1);
        boolean denied;
        int opens, deletes;
        @Override public boolean onCreate() { return true; }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) {
            if (hold.compareAndSet(true, false)) {
                started.countDown();
                try { if (!release.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("test provider delay expired"); }
                catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); throw new IllegalStateException(interrupted); }
            }
            if (denied) throw new SecurityException("test document access revoked");
            MatrixCursor result = new MatrixCursor(projection);
            result.addRow(new Object[]{DocumentsContract.getDocumentId(uri)});
            return result;
        }
        @Override public android.content.res.AssetFileDescriptor openAssetFile(Uri uri, String mode) {
            opens++;
            throw new AssertionError("history opened a file");
        }
        @Override public Bundle call(String method, String argument, Bundle extras) {
            deletes++;
            throw new AssertionError("history changed a file");
        }
        @Override public String getType(Uri uri) { return "image/jpeg"; }
        @Override public Uri insert(Uri uri, ContentValues values) { throw new AssertionError("history inserted a file"); }
        @Override public int delete(Uri uri, String selection, String[] args) { deletes++; throw new AssertionError("history deleted a file"); }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new AssertionError("history changed a file"); }
    }
}
