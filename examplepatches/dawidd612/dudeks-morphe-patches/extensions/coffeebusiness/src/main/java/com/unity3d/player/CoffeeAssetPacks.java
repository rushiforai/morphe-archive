package com.unity3d.player;

import android.content.Context;
import android.util.Log;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.zip.GZIPInputStream;
import java.util.zip.ZipFile;

/** Exposes the exact bundled Unity packs as real local files. */
public final class CoffeeAssetPacks {
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static Context context;
    private static UnityPlayer player;
    private static volatile String installedPath;
    private CoffeeAssetPacks() {}
    public static void initialize(UnityPlayer owner, Context app) {
        player = owner;
        context = app.getApplicationContext();
    }
    private static boolean bundled(String name) {
        return "UnityDataAssetPack".equals(name) || "UnityStreamingAssetsPack".equals(name)
            || "UnityTextureCompressionsAssetPack".equals(name);
    }
    public static String path(String name) { return bundled(name) ? installedPath : null; }
    public static boolean states(String[] names, IAssetPackManagerStatusQueryCallback callback) {
        if (names == null || names.length == 0) return false;
        for (String name : names) if (!bundled(name)) return false;
        String[] requested = names.clone();
        IO.execute(() -> {
            int status = 4, error = 0;
            try { installedPath = extract(context).getAbsolutePath(); }
            catch (Exception e) { status = 5; error = -100; Log.e("CoffeeAssetPacks", "Bundled pack extraction failed", e); }
            int[] states = new int[requested.length], errors = new int[requested.length];
            Arrays.fill(states, status); Arrays.fill(errors, error);
            if (callback != null) player.invokeOnMainThread(() -> callback.onStatusResult(0, requested, states, errors));
        });
        return true;
    }
    private static byte[] readMarker(File marker) throws IOException {
        try (InputStream in = new FileInputStream(marker); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[64]; int n;
            while ((n = in.read(buffer)) != -1) out.write(buffer, 0, n);
            return out.toByteArray();
        }
    }
    private static File extract(Context app) throws Exception {
        byte[] manifest;
        try (InputStream input = app.getAssets().open("morphe/coffee-asset-packs.tsv.gz")) {
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] block = new byte[65536]; int n;
            while ((n = input.read(block)) != -1) buffer.write(block, 0, n);
            manifest = buffer.toByteArray();
        }
        byte[] identity = MessageDigest.getInstance("SHA-256").digest(manifest);
        StringBuilder packId = new StringBuilder();
        for (byte b : identity) packId.append(String.format(java.util.Locale.ROOT, "%02x", b & 255));
        File root = new File(app.getNoBackupFilesDir(), "morphe-coffee/" + packId);
        File marker = new File(root, ".complete");
        if (marker.isFile() && Arrays.equals(identity, readMarker(marker))) return root;
        if (!root.isDirectory() && !root.mkdirs()) throw new IOException("Cannot create bundled asset directory");
        String prefix = root.getCanonicalPath() + File.separator;
        try (ZipFile apk = new ZipFile(app.getApplicationInfo().sourceDir);
             BufferedReader reader = new BufferedReader(new InputStreamReader(
                 new GZIPInputStream(new ByteArrayInputStream(manifest)), StandardCharsets.UTF_8))) {
            String row; byte[] block = new byte[65536];
            while ((row = reader.readLine()) != null) {
                String[] parts = row.split("\t", -1);
                if (parts.length != 2 || !parts[0].startsWith("assets/")) throw new IOException("Invalid asset manifest");
                File output = new File(root, parts[0].substring(7));
                // Archive filenames must never escape the helper-owned directory.
                if (!output.getCanonicalPath().startsWith(prefix)) throw new IOException("Invalid asset path");
                File parent = output.getParentFile();
                if (!parent.isDirectory() && !parent.mkdirs()) throw new IOException("Cannot create asset folder");
                java.util.zip.ZipEntry entry = apk.getEntry(parts[0]);
                if (entry == null) throw new IOException("Missing bundled asset: " + parts[0]);
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                try (InputStream in = apk.getInputStream(entry); OutputStream out = new FileOutputStream(output)) {
                    int n; while ((n = in.read(block)) != -1) { out.write(block, 0, n); digest.update(block, 0, n); }
                }
                StringBuilder actual = new StringBuilder();
                for (byte b : digest.digest()) actual.append(String.format(java.util.Locale.ROOT, "%02x", b & 255));
                if (!actual.toString().equals(parts[1])) throw new IOException("Bundled asset checksum differs: " + parts[0]);
            }
        }
        try (OutputStream out = new FileOutputStream(marker)) { out.write(identity); }
        return root;
    }
}
