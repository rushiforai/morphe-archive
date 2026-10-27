package app.patchlab.extension.offlinegames.strictv2;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Stages the exact Unity libraries in the mounted APK, rather than Android's stock extraction. */
public final class NativeLibraryStore {
    public static final String MANIFEST = "assets/patchlab/offlinegames-native.properties";
    private static final String[] LIBRARIES = {"libmain.so", "libunity.so", "libil2cpp.so"};

    private NativeLibraryStore() {}

    public static synchronized File prepare(File apk, File root) throws IOException {
        try (ZipFile zip = new ZipFile(apk)) {
            ZipEntry manifest = requiredEntry(zip, MANIFEST);
            Properties hashes = new Properties();
            String identity;
            try (InputStream input = zip.getInputStream(manifest)) {
                identity = digest(input);
            }
            try (InputStream input = zip.getInputStream(manifest)) {
                hashes.load(input);
            }
            if (!"1".equals(hashes.getProperty("format"))) {
                throw new IOException("Unsupported Offline Games native manifest");
            }
            // Pre-ARM64 bundles did not carry an ABI key. Keep those mounts readable.
            String abi = hashes.getProperty("abi", "armeabi-v7a");
            if (!abi.equals("armeabi-v7a") && !abi.equals("arm64-v8a")) {
                throw new IOException("Unsupported Offline Games native ABI: " + abi);
            }
            String prefix = "lib/" + abi + "/";
            File directory = new File(root, identity);
            if (!directory.isDirectory() && !directory.mkdirs()) {
                throw new IOException("Cannot create native library directory: " + directory);
            }
            for (String name : LIBRARIES) {
                String expected = hashes.getProperty(name);
                if (expected == null || !expected.matches("[0-9a-f]{64}")) {
                    throw new IOException("Missing or invalid SHA-256 for " + name);
                }
                File output = new File(directory, name);
                if (output.isFile() && expected.equals(digest(output))) continue;

                ZipEntry entry = requiredEntry(zip, prefix + name);
                File staged = File.createTempFile(name, ".tmp", directory);
                try {
                    MessageDigest sha = sha256();
                    try (InputStream input = zip.getInputStream(entry);
                         FileOutputStream stream = new FileOutputStream(staged)) {
                        byte[] buffer = new byte[64 * 1024];
                        int count;
                        while ((count = input.read(buffer)) != -1) {
                            sha.update(buffer, 0, count);
                            stream.write(buffer, 0, count);
                        }
                        stream.getFD().sync();
                    }
                    if (!expected.equals(hex(sha.digest()))) {
                        throw new IOException("Patched APK has an unexpected " + name);
                    }
                    if (!staged.setReadable(true, true) || !staged.setExecutable(true, true)) {
                        throw new IOException("Cannot set native library permissions: " + name);
                    }
                    if (!staged.renameTo(output)) {
                        throw new IOException("Cannot publish verified native library: " + name);
                    }
                } finally {
                    if (staged.exists()) staged.delete();
                }
            }
            return directory;
        }
    }

    private static ZipEntry requiredEntry(ZipFile zip, String path) throws IOException {
        ZipEntry entry = zip.getEntry(path);
        if (entry == null || entry.isDirectory()) {
            throw new IOException("Mounted APK is missing " + path + "; remount the new patched APK");
        }
        return entry;
    }

    private static String digest(File file) throws IOException {
        try (InputStream input = new FileInputStream(file)) {
            return digest(input);
        }
    }

    private static String digest(InputStream input) throws IOException {
        MessageDigest sha = sha256();
        byte[] buffer = new byte[64 * 1024];
        int count;
        while ((count = input.read(buffer)) != -1) sha.update(buffer, 0, count);
        return hex(sha.digest());
    }

    private static MessageDigest sha256() {
        try {
            return MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException impossible) {
            throw new AssertionError(impossible);
        }
    }

    private static String hex(byte[] bytes) {
        StringBuilder result = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) {
            result.append(Character.forDigit((value >> 4) & 15, 16));
            result.append(Character.forDigit(value & 15, 16));
        }
        return result.toString();
    }
}
