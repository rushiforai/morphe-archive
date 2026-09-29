/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.OperationCanceledException;
import android.os.ParcelFileDescriptor;

import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * The app behind a picked settings file, as Android's picker hands one over: it opens the file
 * through a provider, with a cancel signal, and can misbehave in the ways real document apps do.
 */
public final class SettingsFileProvider extends ContentProvider {
    /** Answers "wt" with a refusal and "w" without truncating, which the ContentResolver docs allow. */
    static volatile boolean refusesTruncate;
    /** Thrown by every open for reading, when set. */
    static volatile RuntimeException readFailure;
    /** Holds every open until it's counted down, or until the open's signal is cancelled. */
    static volatile CountDownLatch stall;
    /** A held open waits for the latch alone, as an app that ignores the cancel signal does. */
    static volatile boolean ignoresCancel;
    /** Cancels an open received. */
    static final AtomicInteger cancels = new AtomicInteger();
    /** Opens that returned, cancelled ones excluded. */
    static final AtomicInteger opened = new AtomicInteger();
    /** A permit for each open the stall holds, given once its cancel listener is in place. */
    static final Semaphore holding = new Semaphore(0);

    private static File folder;

    /** Registers the app for [authority] and forgets every file and fault. */
    static void install(String authority) {
        refusesTruncate = false;
        readFailure = null;
        stall = null;
        ignoresCancel = false;
        cancels.set(0);
        opened.set(0);
        holding.drainPermits();
        folder = new File(RuntimeEnvironment.getApplication().getCacheDir(), "settings-files-" + System.nanoTime());
        if (!folder.mkdirs()) throw new IllegalStateException("No folder for the test files");
        Robolectric.setupContentProvider(SettingsFileProvider.class, authority);
    }

    /** A file holding [bytes], ready to be picked. */
    static Uri put(String authority, String name, byte[] bytes) throws IOException {
        try (FileOutputStream out = new FileOutputStream(fileFor(name))) {
            out.write(bytes);
        }
        return Uri.parse("content://" + authority + "/" + name);
    }

    /** What the file at [uri] holds now, or null when nothing was ever written there. */
    static byte[] get(Uri uri) throws IOException {
        File file = fileFor(uri.getLastPathSegment());
        return file.exists() ? Files.readAllBytes(file.toPath()) : null;
    }

    private static File fileFor(String name) {
        return new File(folder, name);
    }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode, CancellationSignal signal)
            throws FileNotFoundException {
        CountDownLatch held = stall;
        if (held != null) {
            CountDownLatch cancelled = new CountDownLatch(1);
            if (signal != null) signal.setOnCancelListener(() -> {
                cancels.incrementAndGet();
                cancelled.countDown();
            });
            holding.release();
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
            try {
                while (!held.await(10, TimeUnit.MILLISECONDS)) {
                    if (!ignoresCancel && cancelled.getCount() == 0) throw new OperationCanceledException();
                    if (System.nanoTime() > deadline) throw new IllegalStateException("The test never released the open");
                }
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new OperationCanceledException();
            }
        }
        File file = fileFor(uri.getLastPathSegment());
        ParcelFileDescriptor answer;
        if (mode.startsWith("r")) {
            RuntimeException failure = readFailure;
            if (failure != null) throw failure;
            answer = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
        } else if ("wt".equals(mode) && refusesTruncate) {
            throw new IllegalArgumentException("Unsupported mode: wt");
        } else {
            int flags = ParcelFileDescriptor.MODE_WRITE_ONLY | ParcelFileDescriptor.MODE_CREATE;
            if ("wt".equals(mode)) flags |= ParcelFileDescriptor.MODE_TRUNCATE;
            answer = ParcelFileDescriptor.open(file, flags);
        }
        opened.incrementAndGet();
        return answer;
    }

    // A document app hands the signal on to its open, as DocumentsProvider does; the framework's
    // defaults drop it on the way to openFile.
    @Override
    public AssetFileDescriptor openAssetFile(Uri uri, String mode, CancellationSignal signal) throws FileNotFoundException {
        return new AssetFileDescriptor(openFile(uri, mode, signal), 0, AssetFileDescriptor.UNKNOWN_LENGTH);
    }

    @Override
    public AssetFileDescriptor openTypedAssetFile(Uri uri, String mimeTypeFilter, Bundle opts, CancellationSignal signal)
            throws FileNotFoundException {
        return openAssetFile(uri, "r", signal);
    }

    @Override public boolean onCreate() { return true; }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public String getType(Uri uri) { return "application/json"; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
}
