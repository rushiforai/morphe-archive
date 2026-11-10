/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
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

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Saves the document of a post (a PDF or carousel) as one PDF file.
 * <p>
 * LinkedIn's document player gets a parsed {@code Source}: a root URL, the document's slices (small PDF files that
 * each hold a range of pages, fetched as rootUrl + suffix) and, only when the author allows downloads, the suffix of
 * the original PDF. The original is saved when it is offered. Otherwise a document of one slice is saved as that PDF,
 * and the pages of several slices are drawn into a new PDF.
 */
@SuppressWarnings("unused")
public final class DocumentPdf {
    /** Width, in pixels, pages are drawn at when slices are combined. */
    private static final int RENDER_WIDTH = 1700;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();

    static final class Slice {
        final String suffix;
        final int start;
        final int end;

        Slice(String suffix, int start, int end) {
            this.suffix = suffix;
            this.start = start;
            this.end = end;
        }
    }

    static final class Doc {
        final String id;
        final String rootUrl;
        final String downloadSuffix;
        final List<Slice> slices;
        final int pages;

        Doc(String id, String rootUrl, String downloadSuffix, List<Slice> slices, int pages) {
            this.id = id;
            this.rootUrl = rootUrl;
            this.downloadSuffix = downloadSuffix;
            this.slices = slices;
            this.pages = pages;
        }
    }

    private static final java.util.Map<String, Doc> byId = java.util.Collections.synchronizedMap(
            new java.util.LinkedHashMap<String, Doc>(32, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(java.util.Map.Entry<String, Doc> eldest) {
                    return size() > 100;
                }
            });

    private DocumentPdf() {
    }

    /** A document seen in the feed or the viewer, by the id of its asset URN. */
    static Doc byId(String id) {
        return byId.get(id);
    }

    /**
     * Injection point, at the start of DocumentSingleViewData(properties, playerId, documentAsset, source,
     * navigablePages, isFullScreenMode, ...). Only the full screen document viewer gets the download button.
     */
    public static void onDocument(Object documentAsset, Object source, int navigablePages, boolean fullScreen) {
        try {
            if (source == null) return;
            if (!fullScreen && !Settings.postMenu()) return;
            Doc doc = read(source, navigablePages);
            if (doc != null) byId.put(doc.id, doc);
            if (!fullScreen || !Settings.downloadMedia()) return;
            Settings.debugLog("document: root=" + (doc == null ? null : doc.rootUrl)
                    + " slices=" + (doc == null ? 0 : doc.slices.size())
                    + " original=" + (doc != null && doc.downloadSuffix != null));
            if (doc != null) SduiMediaDownload.offerDocument(doc);
        } catch (Throwable t) {
            Diagnostics.error("onDocument failed", t);
        }
    }

    private static Doc read(Object source, int navigablePages) throws ReflectiveOperationException {
        String root = (String) call(source, "getRootUrl$document_viewer_compose");
        if (root == null || root.isEmpty()) return null;
        String download = (String) call(source, "getDownloadUrlSuffix$document_viewer_compose");
        Object pageCount = call(source, "getAvailablePageCount$document_viewer_compose");
        Object urn = call(source, "getAssetUrn$document_viewer_compose");
        List<Slice> slices = new ArrayList<>();
        Object list = call(source, "getDocumentSlices$document_viewer_compose");
        if (list instanceof List) {
            for (Object model : (List<?>) list) {
                if (model == null) continue;
                String suffix = (String) field(model, "suffixUrl");
                if (suffix == null) continue;
                slices.add(new Slice(suffix, (Integer) field(model, "startIndex"), (Integer) field(model, "endIndex")));
            }
        }
        if (slices.isEmpty() && download == null) return null;
        int pages = pageCount instanceof Integer ? (Integer) pageCount : navigablePages;
        String id = urn instanceof String && !((String) urn).isEmpty()
                ? ((String) urn).substring(((String) urn).lastIndexOf(':') + 1)
                : Integer.toHexString(root.hashCode());
        return new Doc(id.replaceAll("[^A-Za-z0-9_-]", ""), root, download, slices, pages);
    }

    /** Saves the document in the background, with toasts for progress and the result. */
    static void save(Activity activity, Doc doc) {
        Context context = activity.getApplicationContext();
        Downloads.toast(activity, "Saving the document…");
        WORKER.execute(() -> {
            String name = "linkedin_document_" + doc.id + ".pdf";
            try {
                if (doc.downloadSuffix != null) {
                    // The original PDF, offered because the author allows downloads.
                    byte[] pdf = fetch(doc.rootUrl + doc.downloadSuffix);
                    writeToDownloads(context, name, out -> out.write(pdf));
                } else if (doc.slices.size() == 1) {
                    byte[] pdf = fetch(resolve(doc.rootUrl, doc.slices.get(0).suffix));
                    writeToDownloads(context, name, out -> out.write(pdf));
                } else {
                    List<File> files = new ArrayList<>();
                    for (Slice slice : doc.slices) {
                        File file = File.createTempFile("loki_slice", ".pdf", context.getCacheDir());
                        try (OutputStream out = new FileOutputStream(file)) {
                            out.write(fetch(resolve(doc.rootUrl, slice.suffix)));
                        }
                        files.add(file);
                    }
                    try {
                        writeToDownloads(context, name, out -> combine(files, out));
                    } finally {
                        for (File file : files) //noinspection ResultOfMethodCallIgnored
                            file.delete();
                    }
                }
                MAIN.post(() -> Downloads.toast(context, I18n.f("Document saved to %1$s", location())));
            } catch (Throwable t) {
                Diagnostics.error("document save failed", t);
                MAIN.post(() -> Downloads.toast(context, "Couldn't save the document"));
            }
        });
    }

    /** Draws every page of the slice PDFs, in order, into one new PDF. */
    private static void combine(List<File> files, OutputStream out) throws Exception {
        PdfDocument document = new PdfDocument();
        try {
            int number = 1;
            for (File file : files) {
                try (ParcelFileDescriptor fd = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
                     PdfRenderer renderer = new PdfRenderer(fd)) {
                    for (int i = 0; i < renderer.getPageCount(); i++) {
                        try (PdfRenderer.Page page = renderer.openPage(i)) {
                            int width = page.getWidth();
                            int height = page.getHeight();
                            Bitmap bitmap = Bitmap.createBitmap(RENDER_WIDTH,
                                    Math.max(1, Math.round(RENDER_WIDTH * height / (float) width)), Bitmap.Config.ARGB_8888);
                            bitmap.eraseColor(Color.WHITE);
                            page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_PRINT);
                            PdfDocument.Page target = document.startPage(
                                    new PdfDocument.PageInfo.Builder(width, height, number++).create());
                            Canvas canvas = target.getCanvas();
                            canvas.drawBitmap(bitmap, null, new Rect(0, 0, width, height), null);
                            document.finishPage(target);
                            bitmap.recycle();
                        }
                    }
                }
            }
            document.writeTo(out);
        } finally {
            document.close();
        }
    }

    private interface Writer {
        void write(OutputStream out) throws Exception;
    }

    /** Writes a PDF into Download/{folder}, where documents always go. */
    private static void writeToDownloads(Context context, String name, Writer writer) throws Exception {
        String folder = Settings.downloadFolder();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "application/pdf");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH,
                    Environment.DIRECTORY_DOWNLOADS + (folder.isEmpty() ? "" : "/" + folder));
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            ContentResolver resolver = context.getContentResolver();
            Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IllegalStateException("MediaStore insert failed");
            try (OutputStream out = resolver.openOutputStream(uri)) {
                if (out == null) throw new IllegalStateException("No output stream");
                writer.write(out);
            } catch (Exception e) {
                resolver.delete(uri, null, null);
                throw e;
            }
            values.clear();
            values.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(uri, values, null, null);
        } else {
            File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), folder);
            //noinspection ResultOfMethodCallIgnored
            dir.mkdirs();
            try (OutputStream out = new FileOutputStream(new File(dir, name))) {
                writer.write(out);
            }
        }
    }

    static String location() {
        String folder = Settings.downloadFolder();
        return folder.isEmpty() ? Environment.DIRECTORY_DOWNLOADS : Environment.DIRECTORY_DOWNLOADS + "/" + folder;
    }

    /** Same as LinkedIn's document loader: the slice suffix resolved against the root URL. */
    private static String resolve(String root, String suffix) throws java.net.URISyntaxException {
        return new URI(root).resolve(suffix).toString();
    }

    private static byte[] fetch(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(30000);
        try {
            int code = connection.getResponseCode();
            if (code / 100 != 2) throw new IllegalStateException("HTTP " + code + " for " + url);
            try (InputStream in = connection.getInputStream()) {
                java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
                byte[] chunk = new byte[16384];
                int read;
                while ((read = in.read(chunk)) != -1) buffer.write(chunk, 0, read);
                return buffer.toByteArray();
            }
        } finally {
            connection.disconnect();
        }
    }

    private static Object call(Object target, String method) throws ReflectiveOperationException {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(method);
                m.setAccessible(true);
                return m.invoke(target);
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    private static Object field(Object target, String name) throws ReflectiveOperationException {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }
}
