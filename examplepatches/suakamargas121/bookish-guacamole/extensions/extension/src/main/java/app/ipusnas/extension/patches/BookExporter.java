package app.ipusnas.extension.patches;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Injects a "Save to Downloads" option into the book detail overflow menu.
 * When tapped, the option requests the book to be downloaded and decrypted
 * by the app (reusing the existing "Baca"/"Unduh" flow), and once the readable
 * book file is produced the patched BookLoadingAct calls {@link #maybeExport}
 * which copies it to the public Downloads folder via MediaStore.
 *
 * <p>PDF files are re-saved without the DRM password using the app's own Radaee
 * PDF engine (already initialized in {@code GlobalApp.onCreate}), so the
 * exported PDF is readable in any viewer. EPUB files are repacked by the app
 * and are exported as-is.
 *
 * <p>{@link #maybeExport} is invoked from BookLoadingAct's background coroutine,
 * so every Toast must be posted to the main thread and no exception may ever
 * escape back into the app (an escaping exception would abort the book load).
 */
@SuppressWarnings("unused")
public final class BookExporter {

    /** Fixed menu item id, unlikely to collide with app resources. */
    private static final int EXPORT_MENU_ID = 0x2A4D;

    private static volatile boolean exportRequested = false;

    private BookExporter() {
    }

    /**
     * Called from the patched {@code BookDetailAct.onCreateOptionsMenu}.
     * Adds the menu item. Whether the current book is borrowed is only known
     * after the borrow-status API returns, so the click listener re-checks it
     * and shows a toast instead of exporting when the book is not borrowed.
     */
    public static void addExportMenuItem(Activity activity, Menu menu) {
        MenuItem item = menu.add(Menu.NONE, EXPORT_MENU_ID, Menu.NONE, "Simpan ke Unduhan");
        item.setOnMenuItemClickListener(menuItem -> {
            if (!isBookBorrowed(activity)) {
                toast(activity, "Buku belum dipinjam");
                return true;
            }
            exportRequested = true;
            try {
                // BookDetailAct.O() launches BookLoadingAct for the current book.
                activity.getClass().getMethod("O").invoke(activity);
            } catch (Throwable t) {
                exportRequested = false;
                toast(activity, "Gagal memulai unduhan");
            }
            return true;
        });
    }

    /**
     * Called from the patched {@code Liq.a} reader-intent builder right before
     * the PDF/EPUB reader opens the book. If an export was requested, copies
     * the readable book to the public Downloads folder. PDF files are re-saved
     * without the DRM password first so the exported file is readable anywhere.
     */
    public static void maybeExport(Object context, File bookFile, byte[] password, String title) {
        if (!exportRequested || bookFile == null || !bookFile.exists()) {
            return;
        }
        exportRequested = false;

        final Activity activity = context instanceof Activity ? (Activity) context : null;
        if (activity == null) {
            return;
        }

        boolean isPdf = isPdfFile(bookFile);
        String baseName = sanitizeFileName(title);

        if (baseName == null || baseName.isEmpty()) {
            baseName = stripExtension(bookFile.getName());
        }

        String exportName = (isPdf ? baseName + ".pdf" : baseName + ".epub");
        String exportMime = isPdf ? "application/pdf" : "application/epub+zip";

        try {
            File source = bookFile;

            if (isPdf) {
                File unlocked = unlockPdf(activity, bookFile, password);
                if (unlocked != null && unlocked.exists() && unlocked.length() > 0) {
                    source = unlocked;
                } else {
                    toast(activity, "Gagal membuka PDF: file tetap terkunci");
                    return;
                }
            }

            ContentValues values = new ContentValues();
            values.put(MediaStore.Downloads.DISPLAY_NAME, exportName);
            values.put(MediaStore.Downloads.MIME_TYPE, exportMime);
            values.put(
                    MediaStore.Downloads.RELATIVE_PATH,
                    Environment.DIRECTORY_DOWNLOADS + "/iPusnas"
            );

            Uri collection = MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
            Uri uri = activity.getContentResolver().insert(collection, values);
            if (uri == null) {
                throw new IllegalStateException("MediaStore insert returned null");
            }

            try (InputStream in = new FileInputStream(source);
                 OutputStream out = activity.getContentResolver().openOutputStream(uri)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = in.read(buffer)) > 0) {
                    out.write(buffer, 0, count);
                }
            }

            toast(activity, "Buku disimpan ke Unduhan");
        } catch (Throwable t) {
            toast(activity, "Gagal menyimpan buku: " + t.getMessage());
        }
    }

    /**
     * Re-saves a DRM-protected PDF without its password by letting the app's
     * own Radaee PDF engine (already initialized in {@code GlobalApp.onCreate})
     * open the file with the decrypted password and re-save it without the lock.
     * Returns the unlocked temp file, or null on failure.
     *
     * <p>Accessed through reflection because {@code com.radaee.pdf.Document} is
     * part of the host app and not available on the extension's compile path.
     */
    private static File unlockPdf(Context context, File pdfFile, byte[] password) {
        try {
            String pwdStr = password == null ? "" : new String(password, "UTF-8");

            // The app stores the PDF password as a hex string; the actual
            // password is its hex-decode (mirrors the Python _password_for_book).
            byte[] pwdBytes;
            try {
                pwdBytes = fromHex(pwdStr.trim());
            } catch (Exception e) {
                pwdBytes = pwdStr.getBytes("ISO-8859-1");
            }

            Class<?> docClass = Class.forName("com.radaee.pdf.Document");
            Object doc = docClass.getConstructor().newInstance();
            try {
                Method open = docClass.getMethod("Open", String.class, String.class);
                int rc = (Integer) open.invoke(doc,
                        pdfFile.getAbsolutePath(), new String(pwdBytes, "ISO-8859-1"));
                if (rc != 0) {
                    toast(context, "Unlock gagal (rc=" + rc + ")");
                    return null;
                }

                Method saveAs = docClass.getMethod("SaveAs", String.class, boolean.class);
                File out = new File(context.getCacheDir(),
                        "ipusnas_unlocked_" + System.currentTimeMillis() + ".pdf");
                boolean saved = (Boolean) saveAs.invoke(doc, out.getAbsolutePath(), true);
                if (!saved || out.length() == 0) {
                    out.delete();
                    toast(context, "Unlock gagal (save)");
                    return null;
                }
                return out;
            } finally {
                try {
                    docClass.getMethod("Close").invoke(doc);
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable t) {
            toast(context, "Unlock error: " + t);
        }
        return null;
    }

    private static byte[] fromHex(String hex) {
        int len = hex.length();
        if ((len & 1) != 0) {
            throw new IllegalArgumentException("odd hex length");
        }
        byte[] out = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            int hi = Character.digit(hex.charAt(i), 16);
            int lo = Character.digit(hex.charAt(i + 1), 16);
            if (hi < 0 || lo < 0) {
                throw new IllegalArgumentException("invalid hex");
            }
            out[i / 2] = (byte) ((hi << 4) | lo);
        }
        return out;
    }

    private static boolean isPdfFile(File file) {
        String name = file.getName().toLowerCase();
        return name.endsWith(".pdf") || name.endsWith(".moco") || name.endsWith(".mco");
    }

    private static String stripExtension(String name) {
        int dot = name.lastIndexOf('.');
        return dot > 0 ? name.substring(0, dot) : name;
    }

    /**
     * Reads the public {@code BookDetailAct.P} boolean field, which the app
     * sets from {@code BookBorrowModel.Data.hasBorrow}.
     */
    private static boolean isBookBorrowed(Activity activity) {
        try {
            Field field = activity.getClass().getField("P");
            return field.getBoolean(activity);
        } catch (Throwable ignored) {
            // If the field cannot be read, assume borrowed (default to showing).
            return true;
        }
    }

    private static String sanitizeFileName(String input) {
        if (input == null) {
            return null;
        }
        return input.replaceAll("[\\\\/:*?\"<>|]", "_").trim();
    }

    private static void toast(Context context, String message) {
        try {
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Toast.makeText(context, message, Toast.LENGTH_LONG).show();
                } catch (Throwable ignored) {
                }
            });
        } catch (Throwable ignored) {
        }
    }
}
