package dev.jason.gboardpatches.extension.customtheme;

import android.app.Activity;
import android.app.AlertDialog;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Imports a direct theme ZIP or lets the user choose one inner ZIP from a pack. */
final class GboardCustomThemeZipImporter {
    private static final String TAG = "GboardThemeZipImport";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();

    interface Completion {
        void onCommitted(String fileName);
        void onFailure(Throwable failure);
    }

    private GboardCustomThemeZipImporter() {
    }

    static void importUri(Activity activity, Uri uri, Completion completion) {
        Handler main = new Handler(Looper.getMainLooper());
        if (!executeSafely("import selected theme ZIP",
                () -> importInBackground(activity, uri, completion, main))) {
            postFailureSafely(main, completion,
                    new IOException("Theme import worker is unavailable"));
        }
    }

    private static void importInBackground(Activity activity, Uri uri, Completion completion,
            Handler main) {
        File source = null;
        try {
            source = newTempFile(activity);
            try (InputStream input = activity.getContentResolver().openInputStream(uri)) {
                if (input == null) throw new IOException("Selected ZIP cannot be opened");
                copyBounded(input, source, GboardThemeImportContract.MAX_SOURCE_BYTES);
            }
            Archive archive = inspect(source);
            if (archive.directTheme) {
                commit(activity, source, completion, main);
                return;
            }
            if (archive.innerThemes.isEmpty()) {
                throw new IOException("Theme metadata or inner theme ZIP is missing");
            }
            File pack = source;
            source = null;
            if (!postSafely(main, "show theme chooser",
                    () -> showChooserSafely(
                            activity, pack, archive.innerThemes, completion, main))) {
                safeDelete(pack);
            }
        } catch (Throwable failure) {
            safeDelete(source);
            postFailureSafely(main, completion, failure);
        }
    }

    private static void showChooserSafely(Activity activity, File pack, List<InnerTheme> themes,
            Completion completion, Handler main) {
        try {
            CharSequence[] names = new CharSequence[themes.size()];
            for (int index = 0; index < themes.size(); index++) {
                names[index] = themes.get(index).name;
            }
            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle(GboardSettingsText.get(activity,
                            R.string.gboard_patches_custom_theme_choose_import))
                    .setItems(names, (ignored, which) -> handleSelectionSafely(
                            activity, pack, themes, which, completion, main))
                    .setNegativeButton(android.R.string.cancel,
                            (ignored, which) -> invokeSafely(
                                    "cancel theme chooser", () -> safeDelete(pack)))
                    .setOnCancelListener(ignored -> invokeSafely(
                            "dismiss theme chooser", () -> safeDelete(pack)))
                    .create();
            dialog.show();
        } catch (Throwable failure) {
            safeDelete(pack);
            notifyFailureSafely(completion, failure);
        }
    }

    private static void handleSelectionSafely(Activity activity, File pack,
            List<InnerTheme> themes, int which, Completion completion, Handler main) {
        try {
            if (which < 0 || which >= themes.size()) {
                throw new IOException("Selected theme is unavailable");
            }
            extractAndCommit(activity, pack, themes.get(which), completion, main);
        } catch (Throwable failure) {
            safeDelete(pack);
            notifyFailureSafely(completion, failure);
        }
    }

    private static void extractAndCommit(Activity activity, File pack, InnerTheme theme,
            Completion completion, Handler main) {
        if (!executeSafely("extract selected theme", () -> {
            File extracted = null;
            try (ZipFile zip = new ZipFile(pack)) {
                ZipEntry entry = zip.getEntry(theme.entry);
                if (entry == null || entry.isDirectory()) throw new IOException("Theme disappeared from pack");
                extracted = newTempFile(activity);
                try (InputStream input = zip.getInputStream(entry)) {
                    copyBounded(input, extracted, GboardThemeImportContract.MAX_INNER_THEME_BYTES);
                }
                commit(activity, extracted, completion, main);
            } catch (Throwable failure) {
                safeDelete(extracted);
                postFailureSafely(main, completion, failure);
            } finally {
                safeDelete(pack);
            }
        })) {
            safeDelete(pack);
            notifyFailureSafely(completion,
                    new IOException("Theme extraction worker is unavailable"));
        }
    }

    private static void commit(Activity activity, File source, Completion completion, Handler main) {
        try {
            File committed = GboardCustomThemeInstaller.importArchive(activity, source);
            postSafely(main, "deliver imported theme",
                    () -> notifyCommittedSafely(completion, committed.getName()));
        } catch (Throwable failure) {
            postFailureSafely(main, completion, failure);
        }
    }

    private static boolean executeSafely(String operation, Runnable callback) {
        try {
            EXECUTOR.execute(() -> invokeSafely(operation, callback));
            return true;
        } catch (Throwable failure) {
            reportFailure(operation, failure);
            return false;
        }
    }

    private static boolean postSafely(Handler main, String operation, Runnable callback) {
        try {
            return main.post(() -> invokeSafely(operation, callback));
        } catch (Throwable failure) {
            reportFailure(operation, failure);
            return false;
        }
    }

    private static void postFailureSafely(Handler main, Completion completion,
            Throwable failure) {
        postSafely(main, "deliver theme import failure",
                () -> notifyFailureSafely(completion, failure));
    }

    private static void notifyCommittedSafely(Completion completion, String fileName) {
        try {
            completion.onCommitted(fileName);
        } catch (Throwable failure) {
            reportFailure("handle imported theme", failure);
        }
    }

    private static void notifyFailureSafely(Completion completion, Throwable failure) {
        try {
            completion.onFailure(failure);
        } catch (Throwable callbackFailure) {
            reportFailure("handle theme import failure", callbackFailure);
        }
    }

    private static void invokeSafely(String operation, Runnable callback) {
        try {
            callback.run();
        } catch (Throwable failure) {
            reportFailure(operation, failure);
        }
    }

    private static void safeDelete(File file) {
        if (file == null) return;
        try {
            file.delete();
        } catch (Throwable failure) {
            reportFailure("delete theme import temporary file", failure);
        }
    }

    private static void reportFailure(String operation, Throwable failure) {
        try {
            Log.w(TAG, "Failed to " + operation, failure);
        } catch (Throwable ignored) {
            // Logging must never become another failure path inside Gboard.
        }
    }

    private static Archive inspect(File file) throws IOException {
        boolean direct = false;
        List<InnerTheme> themes = new ArrayList<InnerTheme>();
        try (ZipFile zip = new ZipFile(file)) {
            int count = 0;
            for (ZipEntry entry : Collections.list(zip.entries())) {
                if (++count > 512) throw new IOException("ZIP contains too many entries");
                if (!GboardThemeImportContract.isSafeEntryName(entry.getName())) {
                    throw new IOException("Unsafe ZIP entry");
                }
                direct |= GboardThemeImportContract.isRootMetadata(entry.getName());
                if (!entry.isDirectory() && entry.getName().toLowerCase(java.util.Locale.US).endsWith(".zip")) {
                    String name = new File(entry.getName()).getName();
                    themes.add(new InnerTheme(entry.getName(), name.substring(0, name.length() - 4)));
                    if (themes.size() > 128) throw new IOException("Theme pack contains too many themes");
                }
            }
        }
        themes.sort(Comparator.comparing(theme -> theme.name, String.CASE_INSENSITIVE_ORDER));
        return new Archive(direct, themes);
    }

    private static File newTempFile(Activity activity) throws IOException {
        File directory = new File(activity.getCacheDir(), "custom-theme-import");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create import cache");
        return new File(directory, UUID.randomUUID() + ".zip");
    }

    private static void copyBounded(InputStream input, File output, long limit) throws IOException {
        long total = 0L;
        byte[] buffer = new byte[32 * 1024];
        try (FileOutputStream stream = new FileOutputStream(output, false)) {
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read == 0) continue;
                total += read;
                if (total > limit) throw new IOException("Theme ZIP exceeds size limit");
                stream.write(buffer, 0, read);
            }
            stream.flush();
            stream.getFD().sync();
        }
        if (total == 0L) throw new IOException("Theme ZIP is empty");
    }

    private static final class Archive {
        final boolean directTheme;
        final List<InnerTheme> innerThemes;
        Archive(boolean directTheme, List<InnerTheme> innerThemes) {
            this.directTheme = directTheme;
            this.innerThemes = innerThemes;
        }
    }

    private static final class InnerTheme {
        final String entry;
        final String name;
        InnerTheme(String entry, String name) { this.entry = entry; this.name = name; }
    }
}
