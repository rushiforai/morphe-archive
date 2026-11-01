/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.DownloadManager;
import android.content.Context;

import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.shadows.ShadowDownloadManager;

import java.util.concurrent.atomic.AtomicBoolean;

import app.hushpinterest.extension.shared.Utils;

/** Lets tests outside this package ask what the two save and download switches would do. */
public final class SaveAndDownloadForTests {
    private SaveAndDownloadForTests() {}

    /** Whether a queued download of [pin] would save it. Nothing reaches a real save. */
    public static boolean savesADownload(Object pin) {
        SaveAndDownload.Host host = SaveAndDownload.hostForTests;
        Object saver = SaveAndDownload.latest;
        AtomicBoolean asked = new AtomicBoolean();
        SaveAndDownload.hostForTests = new SaveAndDownload.Host() {
            @Override public void save(Object saver, Object pin) { asked.set(true); }
            @Override public boolean saved(Object pin) { return false; }
        };
        SaveAndDownload.latest = new Object();
        try {
            SaveAndDownload.downloaded(pin);
            return asked.get();
        } finally {
            SaveAndDownload.hostForTests = host;
            SaveAndDownload.latest = saver;
        }
    }

    /** Whether saving [pin] would queue a download. */
    public static boolean downloadsASave(Object pin) {
        // Not Utils' context: the paused-hooks test also asks this while the settings aren't ready and that context is gone.
        Context context = RuntimeEnvironment.getApplication();
        ShadowDownloadManager manager = Shadows.shadowOf((DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE));
        int before = manager.getRequestCount();
        SaveAndDownload.saving(pin);
        try {
            Utils.awaitBackgroundTasksForTests();
        } catch (Exception failure) {
            throw new AssertionError(failure);
        }
        return manager.getRequestCount() > before;
    }
}
