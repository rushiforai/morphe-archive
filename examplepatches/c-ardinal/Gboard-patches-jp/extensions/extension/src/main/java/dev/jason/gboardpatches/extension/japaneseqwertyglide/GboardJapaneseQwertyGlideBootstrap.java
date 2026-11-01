package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.Log;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Builds an English decoder snapshot from bundled resources without activating a Latin IME. */
final class GboardJapaneseQwertyGlideBootstrap {
    private static final int RAW_MODEL = 0x7f130069;
    private static final long MAX_MODEL_BYTES = 64L * 1024 * 1024;
    private static final byte[] FST_MAGIC = {6, 111, 80, 7};
    private static final byte[] XZ_MAGIC = {(byte) 253, 55, 122, 88, 90, 0};
    private static ClassLoader snapshotLoader;
    private static File snapshotModel;
    private static Object preparedSnapshot;

    private GboardJapaneseQwertyGlideBootstrap() {
    }

    static synchronized Object snapshot(ClassLoader loader, Context context) throws Exception {
        try {
            if (context == null) {
                throw new IllegalArgumentException("Missing bootstrap context");
            }
            if (snapshotLoader == loader && preparedSnapshot != null && validModel(snapshotModel)) {
                return preparedSnapshot;
            }
            Context application = context.getApplicationContext();
            if (application == null) {
                application = context;
            }
            initializeLibrary(loader, application);
            File directory = new File(application.getCacheDir(), "japanese_qwerty_glide");
            if (!directory.isDirectory() && !directory.mkdirs()) {
                throw new IOException("Cannot create dedicated model cache");
            }
            Resources resources = application.getResources();
            TypedArray models = resources.obtainTypedArray(0x7f03000d);
            long version;
            try {
                int[] ids = new int[models.length()];
                for (int index = 0; index < ids.length; index++) {
                    ids[index] = models.getResourceId(index, 0);
                }
                version = englishVersion(resources.getStringArray(0x7f03000c), ids,
                        resources.getIntArray(0x7f03000e));
            } finally {
                models.recycle();
            }
            File apk = new File(application.getApplicationInfo().sourceDir);
            File model;
            try (AssetFileDescriptor descriptor = resources.openRawResourceFd(RAW_MODEL)) {
                if (descriptor == null) {
                    throw new IOException("Bundled model descriptor unavailable");
                }
                validateSegment(apk, descriptor.getStartOffset(), descriptor.getLength());
                model = new File(directory, "main_en_us_" + version + "_" + descriptor.getLength() + ".dict");
                if (!validModel(model)) {
                    File temporary = File.createTempFile("main-en-", ".tmp", directory);
                    try {
                        try (InputStream raw = descriptor.createInputStream();
                                InputStream decoded = xz(loader, raw);
                                OutputStream output = new FileOutputStream(temporary)) {
                            copyModel(decoded, output);
                        }
                        if (!validModel(temporary)) {
                            throw new IOException("Bundled dictionary is not a valid FST");
                        }
                        Files.move(temporary.toPath(), model.toPath(), StandardCopyOption.ATOMIC_MOVE,
                                StandardCopyOption.REPLACE_EXISTING);
                    } finally {
                        Files.deleteIfExists(temporary.toPath());
                    }
                }
            }
            GboardJapaneseQwertyGlideDecoder.Wire wire =
                    new GboardJapaneseQwertyGlideDecoder.ReflectiveWire(loader);
            Object parameters = parameters(loader, application, directory, wire);
            Object main = model(wire, model.getAbsolutePath(), model.length(), version);
            Object snapshot = new GboardJapaneseQwertyGlideDecoder.Snapshot(wire.bytes(parameters),
                    null, null, Collections.singletonList(wire.bytes(main)));
            snapshotLoader = loader;
            snapshotModel = model;
            preparedSnapshot = snapshot;
            Log.i(GboardJapaneseQwertyGlideRuntime.TAG, "bootstrap: bundled English snapshot ready");
            return snapshot;
        } catch (Exception failure) {
            Log.w(GboardJapaneseQwertyGlideRuntime.TAG,
                    "bootstrap: snapshot failed (" + failure.getClass().getSimpleName() + ")");
            throw failure;
        }
    }

    private static void initializeLibrary(ClassLoader loader, Context context) throws Exception {
        Class<?> locations = Class.forName("gai", false, loader);
        Object singleton = locations.getField("c").get(null);
        File crashDirectory = (File) locations.getMethod("b", Context.class).invoke(singleton, context);
        Class.forName("com.google.android.keyboard.client.delight5.JniUtil", false, loader)
                .getMethod("loadLibrary", String.class).invoke(null, crashDirectory.getAbsolutePath());
    }

    static long englishVersion(String[] locales, int[] models, int[] versions) {
        if (locales.length != models.length || locales.length != versions.length) {
            throw new IllegalArgumentException("Mismatched bundled model metadata");
        }
        long version = -1;
        for (int index = 0; index < models.length; index++) {
            if (models[index] == RAW_MODEL) {
                Locale locale = Locale.forLanguageTag(locales[index].replace('_', '-'));
                if (!Locale.US.equals(locale) || versions[index] <= 0 || version != -1) {
                    throw new IllegalArgumentException("Ambiguous bundled English model");
                }
                version = versions[index];
            }
        }
        if (version == -1) {
            throw new IllegalArgumentException("Bundled English model not declared");
        }
        return version;
    }

    static void validateSegment(File apk, long offset, long length) throws IOException {
        if (!apk.isFile() || !apk.getName().endsWith(".apk") || offset < 0 || length <= 0
                || length > MAX_MODEL_BYTES || offset > apk.length() || length > apk.length() - offset) {
            throw new IOException("Invalid bundled model APK segment");
        }
    }

    private static InputStream xz(ClassLoader loader, InputStream raw) throws Exception {
        return xzStream(Class.forName("adsp", false, loader), Class.forName("adrw", false, loader), raw);
    }

    static InputStream xzStream(Class<?> reader, Class<?> cache, InputStream raw) throws Exception {
        byte[] header = new byte[12];
        new DataInputStream(raw).readFully(header);
        if (!Arrays.equals(XZ_MAGIC, Arrays.copyOf(header, XZ_MAGIC.length))) {
            throw new IOException("Bundled English model is not XZ");
        }
        Object arrays = cache.getConstructor().newInstance();
        // This APK's optimized block decoder treats every nonnegative limit as zero.
        // Its bundled MAIN uses a fixed 64 MiB dictionary; resource/output sizes remain checked.
        return (InputStream) reader
                .getConstructor(InputStream.class, int.class, boolean.class, byte[].class, cache)
                .newInstance(raw, -1, true, header, arrays);
    }

    static long copyModel(InputStream input, OutputStream output) throws IOException {
        byte[] buffer = new byte[16 * 1024];
        long size = 0;
        int count;
        while ((count = input.read(buffer)) != -1) {
            if (Thread.currentThread().isInterrupted()) {
                throw new IOException("Bundled model preparation canceled");
            }
            if (count > MAX_MODEL_BYTES - size) {
                throw new IOException("Expanded dictionary exceeds size limit");
            }
            output.write(buffer, 0, count);
            size += count;
        }
        return size;
    }

    static boolean validModel(File model) throws IOException {
        if (!model.isFile() || model.length() < 32 || model.length() > MAX_MODEL_BYTES) {
            return false;
        }
        try (DataInputStream input = new DataInputStream(new FileInputStream(model))) {
            byte[] magic = new byte[FST_MAGIC.length];
            input.readFully(magic);
            return Arrays.equals(FST_MAGIC, magic);
        }
    }

    static Object model(GboardJapaneseQwertyGlideDecoder.Wire wire, String path, long length,
            long version) throws Exception {
        if (length < 32 || length > MAX_MODEL_BYTES || version <= 0) {
            throw new IllegalArgumentException("Invalid expanded model metadata");
        }
        return wire.message("yxj", 1 | 2 | 4 | 8 | 32 | 64 | 128,
                "e", 1, "f", path, "g", 0, "h", (int) length, "i", "en", "j", "US", "l", version);
    }

    private static Object parameters(ClassLoader loader, Context context, File directory,
            GboardJapaneseQwertyGlideDecoder.Wire wire) throws Exception {
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.setLocale(Locale.US);
        Context english = context.createConfigurationContext(configuration);
        Resources resources = english.getResources();
        List<Object> fields = new ArrayList<Object>();
        fields.addAll(Arrays.<Object>asList("c", "en", "d", "US"));
        String[] names = {"e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "u", "r", "y", "z"};
        int[] ids = {0x7f141096, 0x7f1410c2, 0x7f1410bf, 0x7f1410be, 0x7f1410c8,
                0x7f1410c7, 0x7f1410c5, 0x7f1410bd, 0x7f1410c3, 0x7f1410c4,
                0x7f1410c0, 0x7f1402bc, 0x7f140005, 0x7f140b2d, 0x7f1410c6};
        for (int index = 0; index < names.length; index++) {
            fields.add(names[index]);
            fields.add(resources.getString(ids[index]));
        }
        fields.addAll(Arrays.<Object>asList("p", resources.getBoolean(0x7f050020),
                "w", resources.getBoolean(0x7f05001f),
                "t", resources.getBoolean(0x7f050007), "s", Class.forName("fyw", false, loader)
                        .getMethod("a", Context.class, Locale.class).invoke(null, english, Locale.US),
                "q", protoList(loader, "ywo", "q", split(resources.getString(0x7f1416b2))),
                "x", protoList(loader, "ywo", "x", split(resources.getString(0x7f1416b1)))));
        int presence = 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096
                | 8192 | 16384 | 32768 | 262144 | 524288 | 1048576 | 2097152 | 4194304;
        Object locale = wire.message("ywo", presence, fields.toArray());
        // Only MAIN is loaded; keep the decoder's data path separate from stock personalized models.
        return wire.message("yse", 3, "c", protoList(loader, "yse", "c", Collections.singletonList(locale)),
                "d", false, "e", directory.getAbsolutePath());
    }

    static List<String> split(String text) {
        List<String> result = new ArrayList<String>();
        for (String value : text.split(" ", -1)) {
            if (!value.isEmpty()) {
                result.add(value);
            }
        }
        return result;
    }

    private static Object protoList(ClassLoader loader, String type, String field, List<?> values)
            throws Exception {
        Object prototype = Class.forName(type, false, loader).getField("a").get(null);
        Field listField = prototype.getClass().getField(field);
        Method copy = Class.forName("aaln", false, loader)
                .getMethod("E", Class.forName("aamd", false, loader));
        @SuppressWarnings("unchecked")
        List<Object> mutable = (List<Object>) copy.invoke(null, listField.get(prototype));
        mutable.addAll(values);
        return mutable;
    }
}
