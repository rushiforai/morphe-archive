package nl.johninnl.gboard;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * One download at a time, owned by the Gboard process rather than the settings screen,
 * so leaving the screen keeps it going. Partial files resume with HTTP Range requests;
 * nothing is used until its size and SHA-256 match the catalogue.
 */
public final class ParakeetDownloader {
    private static final String TAG = "MorpheParakeet";
    private static final long SPACE_MARGIN = 64L << 20;

    public static final int IDLE = 0;
    public static final int RUNNING = 1;
    public static final int DONE = 2;
    public static final int FAILED = 3;
    public static final int CANCELLED = 4;

    /** Immutable progress snapshot for the settings screen. */
    public static final class Status {
        public final int phase;
        public final String modelId;
        public final long done;
        public final long total;
        public final String error;

        Status(int phase, String modelId, long done, long total, String error) {
            this.phase = phase;
            this.modelId = modelId;
            this.done = done;
            this.total = total;
            this.error = error;
        }
    }

    private static final Object LOCK = new Object();
    private static Thread worker;
    private static volatile boolean cancel;
    private static volatile int phase = IDLE;
    private static volatile String modelId;
    private static volatile long done;
    private static volatile long total;
    private static volatile String error;

    private ParakeetDownloader() {}

    public static Status status() {
        return new Status(phase, modelId, done, total, error);
    }

    /** Job id of a download of the voice correction list's spelling data only. */
    public static final String DICTIONARY_JOB = "dictionary-data";

    /** Starts downloading the runtime and [model]; a running download of any model is kept. */
    public static void start(Context context, ParakeetCatalog.Model model) {
        begin(context, model);
    }

    /** Downloads only the spelling data the voice correction list needs (about 2.3 MB). */
    public static void startDictionary(Context context) {
        begin(context, null);
    }

    private static void begin(Context context, ParakeetCatalog.Model model) {
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        synchronized (LOCK) {
            if (worker != null && worker.isAlive()) return;
            cancel = false;
            phase = RUNNING;
            modelId = model == null ? DICTIONARY_JOB : model.id;
            done = 0;
            total = 0;
            error = null;
            worker = new Thread(() -> run(app, model), "MorpheParakeetDownload");
            worker.setDaemon(true);
            worker.start();
        }
    }

    public static void cancel() {
        cancel = true;
    }

    private static void run(Context context, ParakeetCatalog.Model model) {
        try {
            install(context, model);
            phase = cancel ? CANCELLED : DONE;
        } catch (CancelledException e) {
            phase = CANCELLED;
        } catch (IOException | RuntimeException e) {
            Log.w(TAG, "Download failed", e);
            error = e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage();
            phase = FAILED;
        }
    }

    private static void install(Context context, ParakeetCatalog.Model model) throws IOException {
        if (model == null) {
            installDictionary(context, true);
            return;
        }
        if (!ParakeetStore.supportsArm64()) throw new IOException("This device has no 64-bit ARM support");
        File cache = ParakeetStore.cacheDir(context);
        File modelDir = ParakeetStore.modelDir(context, model);
        File runtimeDir = ParakeetStore.runtimeDir(context);
        mkdirs(cache);
        mkdirs(modelDir);
        mkdirs(runtimeDir);

        File library = ParakeetStore.runtimeLibrary(context);
        boolean needRuntime = !ParakeetStore.verified(library, ParakeetCatalog.RUNTIME_LIBRARY_SIZE, ParakeetCatalog.RUNTIME_LIBRARY_SHA256);
        ParakeetCatalog.Asset vad = ParakeetCatalog.VAD_MODEL;
        File vadTarget = ParakeetStore.vadModel(context);
        boolean needVad = !ParakeetStore.verified(vadTarget, vad.size, vad.sha256);
        long needed = (needRuntime ? ParakeetCatalog.RUNTIME_ARCHIVE.size + ParakeetCatalog.RUNTIME_LIBRARY_SIZE : 0) + (needVad ? vad.size : 0);
        long sum = (needRuntime ? ParakeetCatalog.RUNTIME_ARCHIVE.size : 0) + (needVad ? vad.size : 0);
        for (ParakeetCatalog.Asset file : model.files) {
            if (ParakeetStore.verified(new File(modelDir, file.name), file.size, file.sha256)) continue;
            sum += file.size;
            File partial = partial(context, model, file);
            needed += file.size - (partial.isFile() ? Math.min(partial.length(), file.size) : 0);
        }
        total = sum;
        if (ParakeetStore.root(context).getUsableSpace() < needed + SPACE_MARGIN) {
            throw new IOException("Not enough free storage: " + ((needed + SPACE_MARGIN) >> 20) + " MB needed");
        }

        if (needRuntime) {
            File archive = new File(cache, ParakeetCatalog.RUNTIME_ARCHIVE.name + ".part");
            fetch(ParakeetCatalog.RUNTIME_ARCHIVE, archive);
            File staged = new File(runtimeDir, ParakeetCatalog.RUNTIME_LIBRARY + ".part");
            extract(archive, ParakeetCatalog.RUNTIME_ENTRY, staged);
            if (staged.length() != ParakeetCatalog.RUNTIME_LIBRARY_SIZE
                    || !ParakeetCatalog.RUNTIME_LIBRARY_SHA256.equals(ParakeetStore.sha256(staged))) {
                staged.delete();
                throw new IOException("Runtime library checksum mismatch");
            }
            move(staged, library);
            ParakeetStore.sealLibrary(library);
            ParakeetStore.markVerified(library, ParakeetCatalog.RUNTIME_LIBRARY_SHA256);
            archive.delete();
        }
        if (needVad) {
            File partial = new File(cache, vad.name + ".part");
            fetch(vad, partial);
            move(partial, vadTarget);
            ParakeetStore.markVerified(vadTarget, vad.sha256);
        }

        for (ParakeetCatalog.Asset file : model.files) {
            File target = new File(modelDir, file.name);
            if (ParakeetStore.verified(target, file.size, file.sha256)) continue;
            File partial = partial(context, model, file);
            fetch(file, partial);
            move(partial, target);
            ParakeetStore.markVerified(target, file.sha256);
        }
        if (ParakeetDictionary.available() && ParakeetDictionary.enabled(context)) installDictionary(context, false);
    }

    /** Fetches the voice correction list's spelling data; [alone] when it is the whole job. */
    private static void installDictionary(Context context, boolean alone) throws IOException {
        File cache = ParakeetStore.cacheDir(context);
        File dir = ParakeetDictionary.dataDir(context);
        mkdirs(cache);
        mkdirs(dir);
        if (alone) {
            total = ParakeetDictionary.missingDataBytes(context);
            if (ParakeetStore.root(context).getUsableSpace() < total + SPACE_MARGIN) {
                throw new IOException("Not enough free storage: " + ((total + SPACE_MARGIN) >> 20) + " MB needed");
            }
        } else {
            total += ParakeetDictionary.missingDataBytes(context);
        }
        for (ParakeetCatalog.Asset file : ParakeetCatalog.DICTIONARY_FILES) {
            File target = new File(dir, file.name);
            if (ParakeetStore.verified(target, file.size, file.sha256)) continue;
            File partial = new File(cache, "dictionary-" + ParakeetCatalog.DICTIONARY_DATA_VERSION + "-" + file.name + ".part");
            fetch(file, partial);
            move(partial, target);
            ParakeetStore.markVerified(target, file.sha256);
        }
    }

    private static File partial(Context context, ParakeetCatalog.Model model, ParakeetCatalog.Asset file) {
        return new File(ParakeetStore.cacheDir(context), model.id + "-" + file.name + ".part");
    }

    /** Downloads [asset] into [partial] (resuming), then checks its size and SHA-256. */
    private static void fetch(ParakeetCatalog.Asset asset, File partial) throws IOException {
        IOException last = null;
        for (int attempt = 0; attempt < 4; attempt++) {
            if (cancel) throw new CancelledException();
            try {
                transfer(asset, partial);
                last = null;
                break;
            } catch (CancelledException e) {
                throw e;
            } catch (IOException e) {
                last = e;
                Log.w(TAG, "Retrying " + asset.name, e);
                sleep(2_000L << attempt);
            }
        }
        if (last != null) throw last;
        if (partial.length() != asset.size || !asset.sha256.equals(ParakeetStore.sha256(partial))) {
            partial.delete();
            throw new IOException(asset.name + " checksum mismatch");
        }
    }

    private static void transfer(ParakeetCatalog.Asset asset, File partial) throws IOException {
        long have = partial.isFile() ? partial.length() : 0;
        if (have > asset.size) {
            partial.delete();
            have = 0;
        }
        done += have;
        if (have == asset.size) return;
        HttpURLConnection connection = (HttpURLConnection) new URL(asset.url).openConnection();
        connection.setConnectTimeout(20_000);
        connection.setReadTimeout(60_000);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("User-Agent", "Gboard-Morphe-Parakeet");
        if (have > 0) connection.setRequestProperty("Range", "bytes=" + have + "-");
        try {
            int code = connection.getResponseCode();
            boolean append;
            if (code == HttpURLConnection.HTTP_PARTIAL && have > 0) {
                append = true;
            } else if (code == HttpURLConnection.HTTP_OK) {
                done -= have;
                have = 0;
                append = false;
            } else {
                done -= have;
                throw new IOException("HTTP " + code + " for " + asset.name);
            }
            try (InputStream in = connection.getInputStream();
                 FileOutputStream out = new FileOutputStream(partial, append)) {
                byte[] buffer = new byte[1 << 16];
                for (int n; (n = in.read(buffer)) > 0; ) {
                    if (cancel) throw new CancelledException();
                    have += n;
                    if (have > asset.size) throw new IOException(asset.name + " is larger than expected");
                    out.write(buffer, 0, n);
                    done += n;
                }
                out.getFD().sync();
            } catch (IOException e) {
                done -= have;
                throw e;
            }
            if (have != asset.size) {
                done -= have;
                throw new IOException(asset.name + " download ended early");
            }
        } finally {
            connection.disconnect();
        }
    }

    private static void extract(File archive, String entryName, File target) throws IOException {
        try (ZipFile zip = new ZipFile(archive)) {
            ZipEntry entry = zip.getEntry(entryName);
            if (entry == null) throw new IOException("Runtime archive lacks " + entryName);
            try (InputStream in = zip.getInputStream(entry); FileOutputStream out = new FileOutputStream(target)) {
                byte[] buffer = new byte[1 << 16];
                long written = 0;
                for (int n; (n = in.read(buffer)) > 0; ) {
                    written += n;
                    if (written > ParakeetCatalog.RUNTIME_LIBRARY_SIZE) throw new IOException("Runtime library too large");
                    out.write(buffer, 0, n);
                }
                out.getFD().sync();
            }
        }
    }

    private static void move(File from, File to) throws IOException {
        if (to.exists() && !to.delete()) throw new IOException("Cannot replace " + to.getName());
        if (!from.renameTo(to)) throw new IOException("Cannot store " + to.getName());
    }

    private static void mkdirs(File dir) throws IOException {
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create " + dir.getName());
    }

    private static void sleep(long millis) throws IOException {
        try {
            Thread.sleep(millis);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new InterruptedIOException();
        }
    }

    private static final class CancelledException extends IOException {
        CancelledException() {
            super("Cancelled");
        }
    }
}
