/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.Nullable;

import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.function.Supplier;

import app.morphe.extension.crimera.downloader.Downloader;
import app.morphe.extension.crimera.downloader.DownloadEngine;
import app.morphe.extension.crimera.downloader.EnqueueResult;
import app.morphe.extension.crimera.downloader.engine.DownloadLog;
import app.morphe.extension.crimera.downloader.engine.EnglishNotificationTexts;
import app.morphe.extension.crimera.downloader.messages.DownloadMessages;
import app.morphe.extension.crimera.downloader.messages.EnglishDownloadTexts;
import app.morphe.extension.crimera.downloader.model.BatchResult;
import app.morphe.extension.crimera.downloader.model.ConflictPolicy;
import app.morphe.extension.crimera.downloader.model.DownloadRequest;
import app.morphe.extension.crimera.downloader.model.EnqueueState;
import app.morphe.extension.instagram.utils.InstagramLogger;
import app.morphe.extension.shared.Utils;

/**
 * Instagram's side of the shared downloader: which folder, which file names, what to tell the user.
 * The patch calls {@link #install()} when the app starts so a notification action tapped after the
 * process was killed finds a running downloader.
 */
public final class DownloadService {
    // Kept from the first downloader so the user's notification settings for it still apply.
    private static final String CHANNEL_ID = "media_download_channel";
    private static final String CHANNEL_NAME = "Downloads";

    private static final DownloadLog LOG = new DownloadLog() {
        @Override
        public void info(Supplier<String> message) {
            InstagramLogger.printInfo(message::get);
        }

        @Override
        public void error(Supplier<String> message, Throwable cause) {
            InstagramLogger.printException(message::get, cause);
        }
    };

    /** Reserving a destination talks to the document provider, which must not happen on the UI thread. */
    private static final Executor ENQUEUE_EXECUTOR = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "download-enqueue");
        thread.setDaemon(true);
        return thread;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** One media to save: where it comes from and what to call it. */
    static final class Item {
        final String url;
        @Nullable final String subFolder;
        final String fileName;

        Item(String url, @Nullable String subFolder, String fileName) {
            this.url = url;
            this.subFolder = subFolder;
            this.fileName = fileName;
        }
    }

    private DownloadService() {
    }

    /** Called by the patch at application start. */
    public static void install() {
        try {
            Downloader.install(Utils.getContext(), CHANNEL_ID, CHANNEL_NAME, new EnglishNotificationTexts(), LOG);
        } catch (RuntimeException e) {
            InstagramLogger.printException(() -> "Could not install the downloader", e);
        }
    }

    /**
     * Queues the items and tells the user once what happened to them. {@code label} names the author
     * in that message when it is known.
     */
    static void download(Context context, List<Item> items, @Nullable String label) {
        if (items.isEmpty()) return;

        Context appContext = context.getApplicationContext();
        Uri tree = DownloadFolder.writableTree(appContext);
        if (tree == null) {
            DownloadFolder.choose(context);
            return;
        }

        ENQUEUE_EXECUTOR.execute(() -> {
            try {
                DownloadEngine engine = Downloader.get();
                if (engine == null) {
                    install();
                    engine = Downloader.get();
                }
                if (engine == null) throw new IllegalStateException("The downloader is not installed");

                BatchResult result = new BatchResult();
                for (Item item : items) {
                    result.add(enqueue(engine, appContext, tree, item, label));
                }
                String message = DownloadMessages.summary(result, new EnglishDownloadTexts(), label);
                MAIN.post(() -> Utils.showToastShort(message));
            } catch (RuntimeException e) {
                InstagramLogger.printException(() -> "Could not queue the download", e);
            }
        });
    }

    private static EnqueueState enqueue(
            DownloadEngine engine, Context context, Uri tree, Item item, @Nullable String label) {
        DownloadRequest request;
        try {
            request = new DownloadRequest(
                    item.url,
                    Collections.emptyList(),
                    tree,
                    subpathOf(item.subFolder),
                    item.fileName,
                    mimeTypeOf(item.fileName),
                    ConflictPolicy.SKIP,
                    label);
        } catch (IllegalArgumentException e) {
            InstagramLogger.printException(() -> "Invalid download request for " + item.fileName, e);
            return EnqueueState.FAILED;
        }

        EnqueueResult result = engine.enqueue(request);
        if (result.state() == EnqueueState.DESTINATION_LOST) {
            // The folder was deleted or its access revoked: ask for a new one on the next download.
            DownloadFolder.clear(context);
        }
        if (result.cause() != null) {
            InstagramLogger.printException(() -> "Could not reserve " + item.fileName, result.cause());
        }
        return result.state();
    }

    private static List<String> subpathOf(@Nullable String subFolder) {
        if (subFolder == null || subFolder.isBlank()) return Collections.emptyList();
        List<String> names = new ArrayList<>();
        for (String name : subFolder.split("/")) {
            if (!name.isBlank()) names.add(name);
        }
        return names;
    }

    private static String mimeTypeOf(String fileName) {
        String mimeType = URLConnection.guessContentTypeFromName(fileName);
        return mimeType == null ? "application/octet-stream" : mimeType;
    }
}
