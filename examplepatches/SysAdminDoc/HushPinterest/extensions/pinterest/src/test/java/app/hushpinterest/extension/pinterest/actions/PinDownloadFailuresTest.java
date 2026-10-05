/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;
import org.robolectric.shadows.ShadowToast;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

import app.hushpinterest.extension.shared.SettingsContextRule;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class PinDownloadFailuresTest {
    private static final Uri DESTINATION = Uri.parse("content://test.failures/document/owned-pin");
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Context app;
    private OwnedDocuments provider;

    @Before public void documents() {
        app = RuntimeEnvironment.getApplication();
        provider = new OwnedDocuments();
        ShadowContentResolver.registerProviderInternal(DESTINATION.getAuthority(), provider);
    }

    @Test public void deniedProviderWritesExplainTheLocationAndCleanOnlyProvenIncompleteOutput() {
        for (Throwable cause : new Throwable[]{new SecurityException("denied"), new FileNotFoundException("missing provider")}) {
            PinDownloads.failedDocument(app, DESTINATION, new PinTransfer.SaveFailure(cause, true));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("Couldn't write to the chosen save location. Check its access and available space.", ShadowToast.getTextOfLatestToast());
        }
        assertEquals(2, provider.deletes);
    }

    @Test public void networkFailuresExplainTheConnectionAndCleanOnlyProvenIncompleteOutput() {
        for (Throwable cause : new Throwable[]{new SocketTimeoutException("read timeout"), new UnknownHostException("unavailable")}) {
            PinDownloads.failedDocument(app, DESTINATION, new PinTransfer.SaveFailure(cause, true));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("Couldn't download this pin. Check your connection and try again.", ShadowToast.getTextOfLatestToast());
        }
        assertEquals(2, provider.deletes);
    }

    @Test public void uncertainNetworkOrProviderCompletionPreservesTheFileAndSaysToCheckIt() {
        for (Throwable cause : new Throwable[]{new SecurityException("provider close"), new SocketTimeoutException("late timeout")}) {
            PinDownloads.failedDocument(app, DESTINATION, new PinTransfer.SaveFailure(cause, false));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("The file may have saved. Check your chosen save location.", ShadowToast.getTextOfLatestToast());
        }
        assertEquals(0, provider.deletes);
    }

    @Test public void unclassifiedFailureDoesNotGuessWhichPartFailed() {
        PinDownloads.failedDocument(app, DESTINATION, new PinTransfer.SaveFailure(new IOException("unclassified"), true));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Couldn't complete the save. Check your connection and chosen save location.", ShadowToast.getTextOfLatestToast());
        assertEquals(1, provider.deletes);
    }

    private static final class OwnedDocuments extends ContentProvider {
        int deletes;
        @Override public boolean onCreate() { return true; }
        @Override public Bundle call(String method, String argument, Bundle extras) {
            assertEquals("android:deleteDocument", method);
            assertEquals(DESTINATION, extras.getParcelable("uri"));
            deletes++;
            return new Bundle();
        }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) { return null; }
        @Override public String getType(Uri uri) { return "image/jpeg"; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }
}
