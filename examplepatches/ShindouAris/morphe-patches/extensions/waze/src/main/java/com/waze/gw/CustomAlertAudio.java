package com.waze.gw;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/** Persistent user audio used by Mod alerts. Files stay private to each APK variant. */
final class CustomAlertAudio {
    static final String PREF_MODE_PREFIX = "custom_alert_audio_mode_";
    static final String PREF_NAME_PREFIX = "custom_alert_audio_name_";
    static final int MODE_DEFAULT = 0;
    static final int MODE_FILE = 1;
    static final int MODE_RECORDING = 2;
    static final long MAX_BYTES = 16L * 1024L * 1024L;
    static final long MAX_DURATION_MS = 30_000L;
    private static final long MAX_PACKAGE_BYTES = 128L * 1024L * 1024L;
    private static final int MAX_PACKAGE_RECORDINGS = 64;
    private static final String PACKAGE_FORMAT = "wazemod-recordings";
    private static final int PACKAGE_VERSION = 1;
    static final int GROUP_OVERSPEED = 1;
    static final int GROUP_CURRENT_SPEED = 1 << 1;
    static final int GROUP_NEXT_SPEED = 1 << 2;
    static final int GROUP_ALL = GROUP_OVERSPEED | GROUP_CURRENT_SPEED | GROUP_NEXT_SPEED;

    private static final String TAG = "WazeGW-CustomAudio";
    private static final String DIRECTORY = "custom_audio";

    private CustomAlertAudio() { }

    static File file(Context context, String slot) {
        File directory = new File(context.getFilesDir(), DIRECTORY);
        if (!directory.exists()) directory.mkdirs();
        return new File(directory, safeSlot(slot) + ".audio");
    }

    static File recordingTempFile(Context context, String slot) {
        File directory = file(context, slot).getParentFile();
        return new File(directory, safeSlot(slot) + ".recording.tmp.m4a");
    }

    static boolean hasAudio(Context context, String slot) {
        try {
            File audio = file(context, slot);
            return audio.isFile() && audio.length() > 0L && isPlayable(audio);
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean importUri(Context context, String slot, Uri uri) {
        if (context == null || uri == null) return false;
        File target = file(context, slot);
        File temporary = new File(target.getParentFile(), safeSlot(slot) + ".import.tmp");
        deleteQuietly(temporary);
        long written = 0L;
        try (InputStream input = context.getContentResolver().openInputStream(uri);
             FileOutputStream output = new FileOutputStream(temporary)) {
            if (input == null) return false;
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) >= 0) {
                written += count;
                if (written > MAX_BYTES) throw new IllegalArgumentException("audio too large");
                output.write(buffer, 0, count);
            }
            output.getFD().sync();
        } catch (Throwable error) {
            Log.w(TAG, "Unable to import custom alert audio", error);
            deleteQuietly(temporary);
            return false;
        }
        return installValidated(temporary, target);
    }

    static boolean commitRecording(Context context, String slot, File recording) {
        if (context == null || recording == null || !recording.isFile()
                || recording.length() <= 0L || recording.length() > MAX_BYTES) {
            deleteQuietly(recording);
            return false;
        }
        return installValidated(recording, file(context, slot));
    }

    /** Copy a private recording to a user-selected Storage Access Framework destination. */
    static boolean exportToUri(Context context, String slot, Uri destination) {
        if (context == null || destination == null || !hasAudio(context, slot)) return false;
        File source = file(context, slot);
        try (InputStream input = new java.io.FileInputStream(source);
             OutputStream output = context.getContentResolver().openOutputStream(destination, "w")) {
            if (output == null) return false;
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
            output.flush();
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "Unable to export custom alert recording", error);
            return false;
        }
    }

    /** Number of valid user recordings. Picked files and APK voice assets are excluded. */
    static int recordingCount(Context context, android.content.SharedPreferences preferences) {
        return recordingSlots(context, preferences).size();
    }

    /** Restore every custom slot in the selected families to the packaged default voice. */
    static int resetGroups(Context context, android.content.SharedPreferences preferences,
                           int selectedGroups) {
        if (context == null || preferences == null) return 0;
        selectedGroups &= GROUP_ALL;
        if (selectedGroups == 0) return 0;
        ArrayList<String> slots = new ArrayList<String>();
        if ((selectedGroups & GROUP_OVERSPEED) != 0) slots.add("overspeed");
        if ((selectedGroups & GROUP_CURRENT_SPEED) != 0) {
            for (int speed : supportedSpeeds()) slots.add("current_" + speed);
        }
        if ((selectedGroups & GROUP_NEXT_SPEED) != 0) {
            for (int speed : supportedSpeeds()) slots.add("next_" + speed);
        }
        int changed = 0;
        android.content.SharedPreferences.Editor editor = preferences.edit();
        for (String slot : slots) {
            int oldMode = preferences.getInt(modeKey(slot), MODE_DEFAULT);
            File audio = file(context, slot);
            if (oldMode != MODE_DEFAULT || audio.exists()) changed++;
            reset(context, slot);
            editor.putInt(modeKey(slot), MODE_DEFAULT);
            editor.remove(nameKey(slot));
        }
        editor.apply();
        return changed;
    }

    private static int[] supportedSpeeds() {
        return new int[]{10, 20, 30, 35, 40, 50, 60, 70, 80, 90, 100, 110, 120};
    }

    /** Export only MODE_RECORDING clips into a portable, checksummed WazeMod package. */
    static int exportRecordingPackage(Context context,
                                      android.content.SharedPreferences preferences,
                                      Uri destination) {
        if (context == null || preferences == null || destination == null) return -1;
        ArrayList<String> slots = recordingSlots(context, preferences);
        if (slots.isEmpty()) return 0;
        Properties manifest = new Properties();
        manifest.setProperty("format", PACKAGE_FORMAT);
        manifest.setProperty("version", String.valueOf(PACKAGE_VERSION));
        manifest.setProperty("created_at_ms", String.valueOf(System.currentTimeMillis()));
        manifest.setProperty("count", String.valueOf(slots.size()));
        for (String slot : slots) {
            File source = file(context, slot);
            manifest.setProperty("audio." + slot + ".size", String.valueOf(source.length()));
            manifest.setProperty("audio." + slot + ".sha256", sha256(source));
        }
        try (OutputStream raw = context.getContentResolver().openOutputStream(destination, "w");
             ZipOutputStream zip = raw == null ? null : new ZipOutputStream(raw)) {
            if (zip == null) return -1;
            java.io.ByteArrayOutputStream metadata = new java.io.ByteArrayOutputStream();
            manifest.store(metadata, "WazeMod user recordings only");
            putZipBytes(zip, "manifest.properties", metadata.toByteArray());
            for (String slot : slots) putZipFile(zip, "audio/" + slot + ".m4a", file(context, slot));
            zip.finish();
            return slots.size();
        } catch (Throwable error) {
            Log.w(TAG, "Unable to export recording package", error);
            return -1;
        }
    }

    /**
     * Validate the whole package before activating any clip. Existing recordings not present in
     * the package are kept; matching slots are replaced and marked as user recordings.
     */
    static int importRecordingPackage(Context context,
                                      android.content.SharedPreferences preferences,
                                      Uri sourceUri) {
        return importRecordingPackage(context, preferences, sourceUri, GROUP_ALL);
    }

    static int importRecordingPackage(Context context,
                                      android.content.SharedPreferences preferences,
                                      Uri sourceUri, int selectedGroups) {
        if (context == null || preferences == null || sourceUri == null) return -1;
        selectedGroups &= GROUP_ALL;
        if (selectedGroups == 0) return 0;
        File base = file(context, "package_staging").getParentFile();
        File staging = new File(base, "package_import_" + System.nanoTime());
        if (!staging.mkdirs()) return -1;
        Properties manifest = null;
        ArrayList<String> slots = new ArrayList<String>();
        long totalBytes = 0L;
        try (InputStream raw = context.getContentResolver().openInputStream(sourceUri);
             ZipInputStream zip = raw == null ? null : new ZipInputStream(raw)) {
            if (zip == null) return -1;
            ZipEntry entry;
            byte[] buffer = new byte[16 * 1024];
            while ((entry = zip.getNextEntry()) != null) {
                if (entry.isDirectory()) continue;
                String name = entry.getName();
                if ("manifest.properties".equals(name)) {
                    java.io.ByteArrayOutputStream metadata = new java.io.ByteArrayOutputStream();
                    int count;
                    while ((count = zip.read(buffer)) >= 0) {
                        totalBytes += count;
                        if (totalBytes > MAX_PACKAGE_BYTES) throw new IllegalArgumentException("package too large");
                        metadata.write(buffer, 0, count);
                    }
                    manifest = new Properties();
                    manifest.load(new java.io.ByteArrayInputStream(metadata.toByteArray()));
                    continue;
                }
                String slot = packageSlot(name);
                if (slot == null || slots.contains(slot)
                        || slots.size() >= MAX_PACKAGE_RECORDINGS) {
                    throw new IllegalArgumentException("invalid package entry");
                }
                File staged = new File(staging, slot + ".audio");
                long written = 0L;
                try (FileOutputStream output = new FileOutputStream(staged)) {
                    int count;
                    while ((count = zip.read(buffer)) >= 0) {
                        written += count;
                        totalBytes += count;
                        if (written > MAX_BYTES || totalBytes > MAX_PACKAGE_BYTES)
                            throw new IllegalArgumentException("package audio too large");
                        output.write(buffer, 0, count);
                    }
                    output.getFD().sync();
                }
                slots.add(slot);
            }
            if (manifest == null || !PACKAGE_FORMAT.equals(manifest.getProperty("format"))
                    || PACKAGE_VERSION != Integer.parseInt(manifest.getProperty("version", "-1"))
                    || slots.isEmpty()
                    || slots.size() != Integer.parseInt(manifest.getProperty("count", "-1"))) {
                throw new IllegalArgumentException("invalid recording manifest");
            }
            for (String slot : slots) {
                File staged = new File(staging, slot + ".audio");
                long expectedSize = Long.parseLong(
                        manifest.getProperty("audio." + slot + ".size", "-1"));
                String expectedHash = manifest.getProperty("audio." + slot + ".sha256", "");
                if (staged.length() != expectedSize || !expectedHash.equalsIgnoreCase(sha256(staged))
                        || !isPlayable(staged)) {
                    throw new IllegalArgumentException("invalid recording " + slot);
                }
            }
            // Validation is complete. Files are on the same private volume, so activation is a
            // short rename/copy operation and preferences are published only after all succeed.
            ArrayList<String> selectedSlots = new ArrayList<String>();
            for (String slot : slots) {
                if (slotMatchesGroups(slot, selectedGroups)) selectedSlots.add(slot);
            }
            if (selectedSlots.isEmpty()) return 0;
            for (String slot : selectedSlots) {
                if (!installValidated(new File(staging, slot + ".audio"), file(context, slot)))
                    throw new IllegalStateException("unable to activate " + slot);
            }
            android.content.SharedPreferences.Editor editor = preferences.edit();
            for (String slot : selectedSlots) {
                editor.putInt(modeKey(slot), MODE_RECORDING);
                editor.putString(nameKey(slot), I18n.tr("audio.imported_recording"));
            }
            editor.apply();
            return selectedSlots.size();
        } catch (Throwable error) {
            Log.w(TAG, "Rejected recording package", error);
            return -1;
        } finally {
            deleteTree(staging);
        }
    }

    private static ArrayList<String> recordingSlots(Context context,
                                                    android.content.SharedPreferences preferences) {
        ArrayList<String> result = new ArrayList<String>();
        File directory = file(context, "scan").getParentFile();
        File[] files = directory.listFiles();
        if (files == null) return result;
        for (File candidate : files) {
            String name = candidate.getName();
            if (!name.endsWith(".audio")) continue;
            String slot = name.substring(0, name.length() - ".audio".length());
            if (!isSafeSlot(slot) || preferences.getInt(modeKey(slot), MODE_DEFAULT) != MODE_RECORDING)
                continue;
            if (hasAudio(context, slot)) result.add(slot);
        }
        Collections.sort(result);
        return result;
    }

    private static String packageSlot(String entryName) {
        if (entryName == null || !entryName.startsWith("audio/") || !entryName.endsWith(".m4a"))
            return null;
        String slot = entryName.substring("audio/".length(), entryName.length() - ".m4a".length());
        return isSafeSlot(slot) && entryName.equals("audio/" + slot + ".m4a") ? slot : null;
    }

    private static boolean slotMatchesGroups(String slot, int groups) {
        if ("overspeed".equals(slot)) return (groups & GROUP_OVERSPEED) != 0;
        if (slot != null && slot.startsWith("current_"))
            return (groups & GROUP_CURRENT_SPEED) != 0;
        if (slot != null && slot.startsWith("next_"))
            return (groups & GROUP_NEXT_SPEED) != 0;
        return false;
    }

    private static void putZipBytes(ZipOutputStream zip, String name, byte[] bytes) throws Exception {
        zip.putNextEntry(new ZipEntry(name));
        zip.write(bytes);
        zip.closeEntry();
    }

    private static void putZipFile(ZipOutputStream zip, String name, File source) throws Exception {
        zip.putNextEntry(new ZipEntry(name));
        try (InputStream input = new FileInputStream(source)) {
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) >= 0) zip.write(buffer, 0, count);
        }
        zip.closeEntry();
    }

    private static String sha256(File source) {
        try (InputStream input = new FileInputStream(source)) {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) >= 0) digest.update(buffer, 0, count);
            StringBuilder hex = new StringBuilder(64);
            for (byte value : digest.digest()) hex.append(String.format(java.util.Locale.US, "%02x", value & 0xff));
            return hex.toString();
        } catch (Throwable error) {
            throw new IllegalStateException(error);
        }
    }

    private static void deleteTree(File file) {
        if (file == null || !file.exists()) return;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteTree(child);
        deleteQuietly(file);
    }

    static void reset(Context context, String slot) {
        if (context == null) return;
        deleteQuietly(file(context, slot));
        deleteQuietly(recordingTempFile(context, slot));
    }

    private static boolean installValidated(File source, File target) {
        if (!isPlayable(source)) {
            deleteQuietly(source);
            return false;
        }
        deleteQuietly(target);
        if (source.renameTo(target)) return true;
        try (InputStream input = new java.io.FileInputStream(source);
             FileOutputStream output = new FileOutputStream(target)) {
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
            output.getFD().sync();
            deleteQuietly(source);
            return isPlayable(target);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to activate custom alert audio", error);
            deleteQuietly(source);
            deleteQuietly(target);
            return false;
        }
    }

    private static boolean isPlayable(File audio) {
        if (audio == null || !audio.isFile() || audio.length() <= 0L
                || audio.length() > MAX_BYTES) return false;
        long duration = durationMs(audio);
        return duration > 0L && duration <= MAX_DURATION_MS;
    }

    static long durationMs(File audio) {
        if (audio == null || !audio.isFile() || audio.length() <= 0L) return -1L;
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(audio.getAbsolutePath());
            String durationText = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_DURATION);
            return durationText != null ? Long.parseLong(durationText) : -1L;
        } catch (Throwable error) {
            Log.w(TAG, "Rejected invalid custom alert audio", error);
            return -1L;
        } finally {
            try { retriever.release(); } catch (Throwable ignored) { }
        }
    }

    static void deleteQuietly(File file) {
        try { if (file != null && file.exists()) file.delete(); } catch (Throwable ignored) { }
    }

    static String modeKey(String slot) { return PREF_MODE_PREFIX + safeSlot(slot); }
    static String nameKey(String slot) { return PREF_NAME_PREFIX + safeSlot(slot); }

    private static String safeSlot(String slot) {
        if (!isSafeSlot(slot)) return "invalid";
        return slot;
    }

    private static boolean isSafeSlot(String slot) {
        return slot != null && slot.matches("[a-z0-9_]{1,32}");
    }
}
