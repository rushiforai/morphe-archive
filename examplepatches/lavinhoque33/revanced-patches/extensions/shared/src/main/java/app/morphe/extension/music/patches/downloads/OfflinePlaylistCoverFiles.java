/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.Set;
import java.util.function.BooleanSupplier;
import java.util.regex.Pattern;

/** Worker-only cover storage: one small reference per page, shared image bytes, or a reference to a track copy. */
final class OfflinePlaylistCoverFiles {
    static final int MAX_IMAGE_BYTES = 1024 * 1024;

    private static final String REF = ".ref";
    private static final String COVER = ".cover";
    private static final String PENDING = ".part";
    private static final int HASH_LENGTH = 64;
    private static final int REF_MAX_BYTES = 2 * HASH_LENGTH + 1;
    private static final Pattern HASH = Pattern.compile("[0-9a-f]{64}");

    record Ref(String asset, String target) {
        boolean isTrack() {
            return RawAudioFiles.validId(target);
        }
    }

    private final File directory;

    OfflinePlaylistCoverFiles(File directory) {
        this.directory = directory;
    }

    @Nullable
    Ref read(String pageId) {
        return read(new File(directory, pageId + REF));
    }

    @Nullable
    private static Ref read(File file) {
        if (!file.isFile() || file.length() > REF_MAX_BYTES) return null;
        try {
            String data = new String(Files.readAllBytes(file.toPath()), StandardCharsets.US_ASCII);
            if (data.length() <= HASH_LENGTH || data.charAt(HASH_LENGTH) != '\n') return null;
            String asset = data.substring(0, HASH_LENGTH);
            String target = data.substring(HASH_LENGTH + 1);
            return HASH.matcher(asset).matches() && (HASH.matcher(target).matches() || RawAudioFiles.validId(target))
                    ? new Ref(asset, target) : null;
        } catch (IOException ex) {
            return null;
        }
    }

    @Nullable
    File image(Ref ref) {
        if (ref.isTrack()) return null;
        File file = new File(directory, ref.target() + COVER);
        long length = file.length();
        return length > 0 && length <= MAX_IMAGE_BYTES && file.isFile() ? file : null;
    }

    /** Reuses an already remembered rendition of this asset, including across a browse id and a source id. */
    synchronized boolean linkShared(String pageId, String asset, BooleanSupplier stillRetained) throws IOException {
        File[] refs = directory.listFiles((dir, name) -> name.endsWith(REF));
        if (refs == null) return false;
        for (File file : refs) {
            Ref ref = read(file);
            if (ref != null && ref.asset().equals(asset) && image(ref) != null) {
                if (stillRetained.getAsBoolean()) writeRef(pageId, ref);
                return true;
            }
        }
        return false;
    }

    synchronized void linkTrack(String pageId, String asset, String videoId, BooleanSupplier stillRetained)
            throws IOException {
        if (stillRetained.getAsBoolean()) writeRef(pageId, new Ref(asset, videoId));
    }

    synchronized void remember(String pageId, String asset, byte[] bytes, BooleanSupplier stillRetained)
            throws IOException {
        if (bytes.length == 0 || bytes.length > MAX_IMAGE_BYTES || !stillRetained.getAsBoolean()) return;

        // A different worker may have published this asset while this worker was fetching it.
        if (linkShared(pageId, asset, stillRetained)) return;

        Ref ref = new Ref(asset, digest(bytes));
        if (image(ref) == null) publish(new File(directory, ref.target() + COVER), bytes);
        writeRef(pageId, ref);
    }

    synchronized void retainOnly(Set<String> pageIds) throws IOException {
        File[] files = directory.listFiles();
        if (files == null) return;

        Set<String> keepImages = new HashSet<>();
        for (File file : files) {
            String name = file.getName();
            if (!name.endsWith(REF)) continue;
            String pageId = name.substring(0, name.length() - REF.length());
            Ref ref = pageIds.contains(pageId) ? read(file) : null;
            if (ref == null) Files.deleteIfExists(file.toPath());
            else if (!ref.isTrack()) keepImages.add(ref.target() + COVER);
        }
        for (File file : files) {
            String name = file.getName();
            if (name.endsWith(PENDING) || name.endsWith(COVER) && !keepImages.contains(name)) {
                Files.deleteIfExists(file.toPath());
            }
        }
    }

    private void writeRef(String pageId, Ref ref) throws IOException {
        byte[] bytes = (ref.asset() + '\n' + ref.target()).getBytes(StandardCharsets.US_ASCII);
        publish(new File(directory, pageId + REF), bytes);
    }

    private void publish(File destination, byte[] bytes) throws IOException {
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No playlist cover directory");

        File pending = new File(directory, destination.getName() + PENDING);
        try {
            Files.write(pending.toPath(), bytes);
            Files.move(pending.toPath(), destination.toPath(), StandardCopyOption.ATOMIC_MOVE,
                    StandardCopyOption.REPLACE_EXISTING);
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    static String assetHash(String key) {
        return digest(key.getBytes(StandardCharsets.UTF_8));
    }

    private static String digest(byte[] bytes) {
        byte[] hash;
        try {
            hash = MessageDigest.getInstance("SHA-256").digest(bytes);
        } catch (NoSuchAlgorithmException ex) {
            throw new AssertionError(ex);
        }
        char[] hex = new char[HASH_LENGTH];
        String digits = "0123456789abcdef";
        for (int i = 0; i < hash.length; i++) {
            hex[2 * i] = digits.charAt((hash[i] & 0xff) >>> 4);
            hex[2 * i + 1] = digits.charAt(hash[i] & 15);
        }
        return new String(hex);
    }
}
