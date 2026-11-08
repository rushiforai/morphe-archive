package com.anderson.applemusic.one;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInstaller;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Framework-only updater for the single APK: reads {@code updates.json} from the latest
 * GitHub release, compares {@code one-<abi>.versionCode} with {@link Version#CODE},
 * downloads the matching APK with progress, checks its SHA-256 and hands it to
 * {@link PackageInstaller}. The APK replaces this very package, so the signing cert
 * (and the account data) stay the same.
 *
 * <p>No AndroidX/Kotlin: only {@code HttpURLConnection}, {@code org.json},
 * {@code MessageDigest} and {@code PackageInstaller}.
 */
public final class UpdateManager {

    private static final String TAG = "AppleMusicOne";

    private static final String RELEASES =
            "https://github.com/andersonlucasg3/apple-music-android-freedom/releases/latest/download/";
    private static final String MANIFEST_URL = RELEASES + "updates.json";
    private static final long CHECK_INTERVAL_MS = 24L * 60L * 60L * 1000L;
    private static final String PREFS = "one-updater";
    private static final String KEY_LAST_CHECK = "lastCheck";
    private static final int CONNECT_TIMEOUT_MS = 15000;
    private static final int READ_TIMEOUT_MS = 20000;
    private static final int BUFFER_SIZE = 64 * 1024;
    private static final int INSTALL_REQUEST = 0x0E01;

    // States shown by the "Atualizações" dialog.
    public static final int IDLE = 0;
    public static final int CHECKING = 1;
    public static final int NONE = 2;
    public static final int AVAILABLE = 3;
    public static final int DOWNLOADING = 4;
    public static final int VERIFYING = 5;
    public static final int INSTALLING = 6;
    public static final int ERROR = 7;
    public static final int INSTALLED = 8;

    public static final class State {
        public final int phase;
        public final String message;
        public final int progress;
        public final Update update;

        public State(int phase, String message, int progress, Update update) {
            this.phase = phase;
            this.message = message;
            this.progress = progress;
            this.update = update;
        }
    }

    public static final class Update {
        public final String key;
        public final String name;
        public final String version;
        public final int versionCode;
        public final long size;
        public final String sha256;

        public Update(String key, String name, String version, int versionCode, long size, String sha256) {
            this.key = key;
            this.name = name;
            this.version = version;
            this.versionCode = versionCode;
            this.size = size;
            this.sha256 = sha256;
        }
    }

    public interface Listener {
        void onUpdateState(State state);
    }

    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final SharedPreferences prefs;

    private Listener listener;
    private volatile boolean busy;
    private volatile boolean cancelled;
    private volatile HttpURLConnection connection;
    private volatile PackageInstaller.Session session;
    private volatile State current = new State(IDLE, "", -1, null);

    public UpdateManager(Context context) {
        this.context = context.getApplicationContext();
        this.prefs = this.context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public void setListener(Listener listener) {
        this.listener = listener;
    }

    public State currentState() {
        return current;
    }

    /** Periodic check started with the app: at most once per 24 h. */
    public void autoCheck() {
        long last = prefs.getLong(KEY_LAST_CHECK, 0L);
        if (System.currentTimeMillis() - last < CHECK_INTERVAL_MS) {
            Log.i(TAG, "update auto-check throttled");
            return;
        }
        check();
    }

    /** Always checks (the "Atualizações" button uses this). */
    public void check() {
        synchronized (this) {
            if (busy) return;
            busy = true;
        }
        worker.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    doCheck();
                } finally {
                    busy = false;
                }
            }
        });
    }

    public void download(final Update update) {
        if (update == null) return;
        synchronized (this) {
            if (busy) return;
            busy = true;
        }
        cancelled = false;
        worker.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    doDownload(update);
                } finally {
                    busy = false;
                    session = null;
                    connection = null;
                }
            }
        });
    }

    public void cancel() {
        cancelled = true;
        HttpURLConnection open = connection;
        if (open != null) {
            try {
                open.disconnect();
            } catch (Throwable ignored) {
                // Already closed.
            }
        }
        PackageInstaller.Session active = session;
        if (active != null) {
            try {
                active.abandon();
            } catch (Throwable ignored) {
                // The session may already be committed.
            }
            session = null;
        }
    }

    /** Result of the installer status intent, delivered by {@link OneActivity}. */
    public void onInstallResult(boolean success, String message) {
        if (success) {
            postState(new State(INSTALLED, message, -1, null));
        } else {
            postState(new State(ERROR, message, -1, null));
        }
    }

    public void shutdown() {
        cancel();
        worker.shutdownNow();
    }

    // --- check -------------------------------------------------------------------

    private void doCheck() {
        postState(new State(CHECKING, "Verificando atualizações…", -1, null));
        try {
            JSONObject root = new JSONObject(fetchText(MANIFEST_URL));
            Update update = parse(root);
            prefs.edit().putLong(KEY_LAST_CHECK, System.currentTimeMillis()).apply();
            if (update == null) {
                Log.i(TAG, "updates.json: sem one-* mais novo para " + Build.SUPPORTED_ABIS[0]
                        + " (instalada " + installed() + ")");
                postState(new State(NONE, "Sem atualização. Instalada: " + installed(), -1, null));
            } else {
                Log.i(TAG, "updates.json: " + update.key + " " + update.version + " ("
                        + update.versionCode + ") disponível");
                postState(new State(AVAILABLE,
                        "Atualização disponível: " + displayVersion(update.version, update.versionCode)
                                + "\nTamanho: " + formatSize(update.size)
                                + "\nInstalada: " + installed(),
                        -1, update));
            }
        } catch (Throwable t) {
            Log.e(TAG, "update check failed", t);
            postState(new State(ERROR, "Erro ao verificar atualizações: " + describe(t), -1, null));
        }
    }

    /**
     * Picks the most specific {@code one-<abi>} asset. {@link Build#SUPPORTED_ABIS} order
     * wins; when that key is absent, the fallback is the first published one-* entry.
     */
    private Update parse(JSONObject root) throws IOException {
        JSONObject assets = root.optJSONObject("assets");
        if (assets == null) return null;
        for (String key : candidateKeys()) {
            JSONObject entry = assets.optJSONObject(key);
            if (entry == null) continue;
            int code = entry.optInt("versionCode", 0);
            if (code <= Version.CODE) return null;
            String sha256 = entry.optString("sha256", "").toLowerCase(Locale.US);
            if (sha256.length() != 64) {
                throw new IOException("updates.json sem sha256 para " + key);
            }
            String name = entry.optString("name", "");
            if (!name.endsWith(".apk")) name = defaultName(key);
            return new Update(key, name,
                    entry.optString("version", root.optString("version", "")),
                    code, entry.optLong("size", 0L), sha256);
        }
        return null;
    }

    private static List<String> candidateKeys() {
        List<String> keys = new ArrayList<String>();
        for (String abi : Build.SUPPORTED_ABIS) {
            String key = keyForAbi(abi);
            if (key != null && !keys.contains(key)) keys.add(key);
        }
        // Fallback: first one-* asset published (arm64, arm32, x86).
        for (String key : new String[]{"one-arm64", "one-arm32", "one-x86"}) {
            if (!keys.contains(key)) keys.add(key);
        }
        return keys;
    }

    private static String keyForAbi(String abi) {
        if ("arm64-v8a".equals(abi)) return "one-arm64";
        if ("armeabi-v7a".equals(abi) || "armeabi".equals(abi)) return "one-arm32";
        if ("x86".equals(abi) || "x86_64".equals(abi)) return "one-x86";
        return null;
    }

    private static String defaultName(String key) {
        return "AppleMusic-" + key + ".apk";
    }

    // --- download / verify / install ---------------------------------------------

    private void doDownload(Update update) {
        File target = new File(context.getCacheDir(), "AppleMusic-one-update.apk");
        try {
            if (cancelled) {
                postState(new State(IDLE, "Download cancelado.", -1, null));
                return;
            }
            target.delete();
            postState(new State(DOWNLOADING,
                    "Baixando " + update.name + "… 0%", 0, update));
            download(update, target);
            if (cancelled) {
                target.delete();
                postState(new State(IDLE, "Download cancelado.", -1, null));
                return;
            }
            postState(new State(VERIFYING, "Verificando SHA-256…", -1, update));
            String digest = sha256(target);
            if (!digest.equalsIgnoreCase(update.sha256)) {
                target.delete();
                postState(new State(ERROR,
                        "SHA-256 não confere (arquivo corrompido ou updates.json desatualizado).",
                        -1, update));
                return;
            }
            postState(new State(INSTALLING,
                    "Abrindo o instalador do sistema…\nConfirme a instalação na tela do Android.",
                    -1, update));
            install(target);
        } catch (CancelledDownload e) {
            target.delete();
            postState(new State(IDLE, "Download cancelado.", -1, null));
        } catch (Throwable t) {
            target.delete();
            if (cancelled) {
                // cancel() also disconnects the socket, which unblocks read() with an
                // IOException: that is a cancel, not a failure.
                postState(new State(IDLE, "Download cancelado.", -1, null));
                return;
            }
            Log.e(TAG, "update download/install failed", t);
            postState(new State(ERROR, "Falha na atualização: " + describe(t), -1, update));
        }
    }

    private void download(Update update, File target) throws IOException {
        HttpURLConnection conn = open(RELEASES + update.name);
        connection = conn;
        try {
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("HTTP " + code);
            long total = update.size > 0 ? update.size : conn.getContentLength();
            InputStream in = conn.getInputStream();
            FileOutputStream out = new FileOutputStream(target);
            try {
                byte[] buffer = new byte[BUFFER_SIZE];
                long read = 0L;
                int lastPercent = -1;
                int count;
                while ((count = in.read(buffer)) != -1) {
                    if (cancelled) throw new CancelledDownload();
                    out.write(buffer, 0, count);
                    read += count;
                    if (total > 0L) {
                        int percent = (int) Math.min(100L, read * 100L / total);
                        if (percent != lastPercent) {
                            lastPercent = percent;
                            postState(new State(DOWNLOADING,
                                    "Baixando " + update.name + "… " + percent + "%",
                                    percent, update));
                        }
                    }
                }
                out.flush();
            } finally {
                out.close();
                in.close();
            }
        } finally {
            conn.disconnect();
            connection = null;
        }
    }

    private void install(File apk) throws IOException {
        PackageInstaller installer = context.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionParams params =
                new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
        int sessionId = installer.createSession(params);
        PackageInstaller.Session opened = installer.openSession(sessionId);
        session = opened;
        try {
            long size = apk.length();
            InputStream in = new FileInputStream(apk);
            OutputStream out = opened.openWrite("base.apk", 0L, size);
            try {
                byte[] buffer = new byte[BUFFER_SIZE];
                int count;
                while ((count = in.read(buffer)) != -1) {
                    if (cancelled) throw new CancelledDownload();
                    out.write(buffer, 0, count);
                }
                out.flush();
                opened.fsync(out);
            } finally {
                out.close();
                in.close();
            }
            Intent status = new Intent(context, OneActivity.class);
            status.setAction(OneActivity.ACTION_INSTALL_STATUS);
            status.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP
                    | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 31) flags |= PendingIntent.FLAG_MUTABLE;
            opened.commit(PendingIntent.getActivity(context, INSTALL_REQUEST, status, flags)
                    .getIntentSender());
        } catch (IOException e) {
            try {
                opened.abandon();
            } catch (Throwable ignored) {
                // Best effort.
            }
            throw e;
        } finally {
            opened.close();
        }
    }

    // --- helpers -----------------------------------------------------------------

    private static HttpURLConnection open(String url) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
        conn.setReadTimeout(READ_TIMEOUT_MS);
        conn.setInstanceFollowRedirects(true);
        conn.setRequestProperty("User-Agent", "AppleMusic-One/" + Version.NAME);
        conn.setRequestProperty("Accept", "application/json, application/vnd.android.package-archive");
        conn.connect();
        return conn;
    }

    private static String fetchText(String url) throws IOException {
        HttpURLConnection conn = open(url);
        try {
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("HTTP " + code);
            InputStream in = conn.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try {
                byte[] buffer = new byte[BUFFER_SIZE];
                int count;
                while ((count = in.read(buffer)) != -1) out.write(buffer, 0, count);
            } finally {
                in.close();
            }
            return new String(out.toByteArray(), "UTF-8");
        } finally {
            conn.disconnect();
        }
    }

    private static String sha256(File file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        InputStream in = new FileInputStream(file);
        try {
            byte[] buffer = new byte[BUFFER_SIZE];
            int count;
            while ((count = in.read(buffer)) != -1) digest.update(buffer, 0, count);
        } finally {
            in.close();
        }
        StringBuilder hex = new StringBuilder(64);
        for (byte value : digest.digest()) hex.append(String.format(Locale.US, "%02x", value & 0xFF));
        return hex.toString();
    }

    private static String installed() {
        return Version.NAME + " (" + Version.CODE + ")";
    }

    private static String displayVersion(String version, int code) {
        if (version == null || version.length() == 0) return String.valueOf(code);
        return version + " (" + code + ")";
    }

    private static String formatSize(long bytes) {
        if (bytes <= 0L) return "tamanho desconhecido";
        return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
    }

    private static String describe(Throwable t) {
        String message = t.getMessage();
        if (message == null || message.length() == 0) return t.getClass().getSimpleName();
        return message;
    }

    private void postState(final State state) {
        current = state;
        main.post(new Runnable() {
            @Override
            public void run() {
                Listener target = listener;
                if (target != null) target.onUpdateState(state);
            }
        });
    }

    private static final class CancelledDownload extends IOException {
        CancelledDownload() {
            super("cancelled");
        }
    }
}
