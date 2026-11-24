/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.app.Activity;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.pdf.PdfDocument;
import android.graphics.pdf.PdfRenderer;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Save document as PDF for a post's document or carousel.
 *
 * <p>LinkedIn's document viewer is given a {@code Source}: a root URL, the document cut into slices (small PDFs that
 * each hold some pages, fetched at root + suffix) and, only when the author allows downloads, the suffix of the
 * original file. The original is saved when it is offered; one slice is saved as it is; several slices are drawn page
 * by page into a new PDF.
 */
@SuppressWarnings("unused")
public final class DocumentPdf {
    private static final int PAGE_PIXELS = 1700;
    private static final String CHANNEL = "fakh_downloads";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();

    /** The documents seen so far by id, least recently used dropped first. */
    private static final Map<String, Doc> SEEN = Collections.synchronizedMap(
            new LinkedHashMap<String, Doc>(32, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Doc> eldest) {
                    return size() > 100;
                }
            });

    /** A document: where its pieces are and what is on offer. */
    static final class Doc {
        final String id;
        final String root;
        /** Suffix of the author's original file, or null when downloads are not allowed. */
        final String original;
        /** Suffixes of the slices, in page order. */
        final List<String> slices;

        Doc(String id, String root, String original, List<String> slices) {
            this.id = id;
            this.root = root;
            this.original = original;
            this.slices = slices;
        }
    }

    private interface Body {
        void writeTo(OutputStream out) throws Exception;
    }

    private DocumentPdf() {
    }

    /** The document of a post, by the id of its asset URN; null if the viewer never showed it. */
    static Doc byId(String id) {
        return SEEN.get(id);
    }

    /**
     * Injection point at the start of DocumentSingleViewData(properties, playerId, documentAsset, source,
     * navigablePages, isFullScreenMode, ...): remembers the document so it can be saved from the post menu.
     */
    public static void onDocument(Object documentAsset, Object source, int navigablePages, boolean fullScreen) {
        if (source == null || !Settings.downloadMedia()) return;
        try {
            Doc doc = describe(source);
            if (doc != null) SEEN.put(doc.id, doc);
        } catch (Throwable t) {
            Diagnostics.error("onDocument failed", t);
        }
    }

    private static Doc describe(Object source) throws ReflectiveOperationException {
        String root = (String) property(source, "getRootUrl");
        String original = (String) property(source, "getDownloadUrlSuffix");
        List<String> slices = new ArrayList<>();
        Object models = property(source, "getDocumentSlices");
        if (models instanceof List) {
            for (Object model : (List<?>) models) {
                Object suffix = Reflect.get(model, "suffixUrl");
                if (suffix instanceof String) slices.add((String) suffix);
            }
        }
        if (root == null || root.isEmpty() || (slices.isEmpty() && original == null)) return null;
        Object urn = property(source, "getAssetUrn");
        String last = urn instanceof String ? ((String) urn).substring(((String) urn).lastIndexOf(':') + 1) : "";
        String id = (last.isEmpty() ? Integer.toHexString(root.hashCode()) : last).replaceAll("[^A-Za-z0-9_-]", "");
        return new Doc(id, root, original, slices);
    }

    /** Saves the document on a background thread and reports with toasts and a notification. */
    static void save(Activity activity, Doc doc) {
        Context context = activity.getApplicationContext();
        Downloads.toast(activity, I18n.f("Downloading to %1$s", Environment.DIRECTORY_DOWNLOADS + folderSuffix()));
        WORKER.execute(() -> {
            String name = "linkedin_document_" + doc.id + ".pdf";
            try {
                Uri saved = store(context, name, out -> build(context, doc, out));
                notifySaved(context, name, saved);
            } catch (Throwable t) {
                Diagnostics.error("document save failed", t);
                MAIN.post(() -> Downloads.toast(context, I18n.f("Download failed: %1$s", t.getMessage())));
            }
        });
    }

    /** Writes the PDF for the document: the original, a single slice, or all slices drawn into one file. */
    private static void build(Context context, Doc doc, OutputStream out) throws Exception {
        if (doc.original != null) {
            out.write(fetch(doc.root + doc.original));
        } else if (doc.slices.size() == 1) {
            out.write(fetch(URI.create(doc.root).resolve(doc.slices.get(0)).toString()));
        } else {
            List<File> files = new ArrayList<>();
            try {
                for (String suffix : doc.slices) {
                    File file = File.createTempFile("fakh_slice", ".pdf", context.getCacheDir());
                    files.add(file);
                    try (OutputStream sink = new FileOutputStream(file)) {
                        sink.write(fetch(URI.create(doc.root).resolve(suffix).toString()));
                    }
                }
                join(files, out);
            } finally {
                for (File file : files) file.delete();
            }
        }
    }

    /** Draws every page of the files, in order, into one new PDF. */
    private static void join(List<File> files, OutputStream out) throws IOException {
        PdfDocument joined = new PdfDocument();
        try {
            int number = 0;
            for (File file : files) {
                try (ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
                     PdfRenderer renderer = new PdfRenderer(descriptor)) {
                    for (int index = 0; index < renderer.getPageCount(); index++) {
                        try (PdfRenderer.Page page = renderer.openPage(index)) {
                            copyPage(page, joined, ++number);
                        }
                    }
                }
            }
            joined.writeTo(out);
        } finally {
            joined.close();
        }
    }

    private static void copyPage(PdfRenderer.Page page, PdfDocument into, int number) {
        int width = page.getWidth();
        int height = page.getHeight();
        Bitmap bitmap = Bitmap.createBitmap(PAGE_PIXELS, Math.max(1, PAGE_PIXELS * height / width), Bitmap.Config.ARGB_8888);
        bitmap.eraseColor(Color.WHITE);
        page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_PRINT);
        PdfDocument.Page target = into.startPage(new PdfDocument.PageInfo.Builder(width, height, number).create());
        target.getCanvas().drawBitmap(bitmap, null, new Rect(0, 0, width, height), null);
        into.finishPage(target);
        bitmap.recycle();
    }

    /** Where documents go: Download, plus the folder picked in settings. */
    private static String folderSuffix() {
        String folder = Settings.downloadFolder();
        return folder.isEmpty() ? "" : "/" + folder;
    }

    /** Writes a file under Download and returns its Uri, or null before Android 10, where it is a plain file. */
    private static Uri store(Context context, String name, Body body) throws Exception {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS),
                    Settings.downloadFolder());
            dir.mkdirs();
            try (OutputStream out = new FileOutputStream(new File(dir, name))) {
                body.writeTo(out);
            }
            return null;
        }
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.MIME_TYPE, "application/pdf");
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS + folderSuffix());
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        ContentResolver resolver = context.getContentResolver();
        Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
        if (uri == null) throw new IOException("MediaStore refused the file");
        try (OutputStream out = resolver.openOutputStream(uri)) {
            body.writeTo(out);
        } catch (Exception e) {
            resolver.delete(uri, null, null);
            throw e;
        }
        values.clear();
        values.put(MediaStore.MediaColumns.IS_PENDING, 0);
        resolver.update(uri, values, null, null);
        return uri;
    }

    /** A "download complete" notification, like the download manager shows for photos and videos; a tap opens the PDF. */
    private static void notifySaved(Context context, String name, Uri uri) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        manager.createNotificationChannel(
                new NotificationChannel(CHANNEL, I18n.tr("Downloads"), NotificationManager.IMPORTANCE_LOW));
        android.app.Notification.Builder note = new android.app.Notification.Builder(context, CHANNEL)
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .setContentTitle(name)
                .setContentText(I18n.tr("Download complete"))
                .setAutoCancel(true);
        if (uri != null) {
            Intent open = new Intent(Intent.ACTION_VIEW).setDataAndType(uri, "application/pdf")
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
            note.setContentIntent(PendingIntent.getActivity(context, 0, open, PendingIntent.FLAG_IMMUTABLE));
        }
        manager.notify((int) (System.nanoTime() & 0x7fffffff), note.build());
    }

    private static byte[] fetch(String url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15_000);
        connection.setReadTimeout(30_000);
        try (InputStream in = connection.getInputStream()) {
            if (connection.getResponseCode() / 100 != 2) throw new IOException("HTTP " + connection.getResponseCode());
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] chunk = new byte[16 * 1024];
            for (int read; (read = in.read(chunk)) != -1; ) bytes.write(chunk, 0, read);
            return bytes.toByteArray();
        } finally {
            connection.disconnect();
        }
    }

    /** Calls LinkedIn's internal accessor {@code name$document_viewer_compose} on the source. */
    private static Object property(Object source, String name) throws ReflectiveOperationException {
        for (Class<?> type = source.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Method method = type.getDeclaredMethod(name + "$document_viewer_compose");
                method.setAccessible(true);
                return method.invoke(source);
            } catch (NoSuchMethodException ignored) {
                // Declared on a superclass.
            }
        }
        return null;
    }
}
