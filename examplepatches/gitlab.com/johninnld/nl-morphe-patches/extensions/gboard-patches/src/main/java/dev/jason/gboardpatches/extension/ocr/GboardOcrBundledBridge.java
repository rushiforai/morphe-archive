package dev.jason.gboardpatches.extension.ocr;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.Log;

import com.google.android.gms.dynamic.ObjectWrapper;
import com.google.mlkit.vision.common.InputImage;
import com.google.mlkit.vision.text.bundled.common.BundledTextRecognizerCreator;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Runs Gboard's OCR with the recognition pipeline bundled in this extension.
 *
 * Play Services refuses its module download to a re-signed Gboard, so the stock recogniser can
 * never be built. Gboard asks an interface for a recogniser, so this returns a Proxy that
 * implements it and answers with results in Gboard's own result classes, which are obfuscated
 * and therefore reached by name here.
 */
public final class GboardOcrBundledBridge {
    private static final String TAG = "GboardPatches";
    private static final String RECOGNIZER_INTERFACE =
            "com.google.mlkit.vision.text.TextRecognizer";
    private static final String OPTIONS_CLASS =
            "com.google.android.gms.internal.mlkit_vision_text_bundled_common.zbnx";
    /** The Latin recognition configuration Gboard's own OCR uses. */
    private static final String MODEL =
            "taser_tflite_gocrlatin_mbv2_scriptid_aksara_layout_gcn_mobile";
    /** ML Kit's image-format constant for a Bitmap input. */
    private static final int IMAGE_FORMAT_BITMAP = -1;
    /** Asset directory holding that model's engine binaries and submodels. */
    private static final String MODEL_ASSET_DIR = "mlkit-google-ocr-models";

    private static final Object RECOGNIZER_LOCK = new Object();
    private static Object recognizer;

    private GboardOcrBundledBridge() {
    }

    /**
     * Builds the recogniser and returns it inside Gboard's Optional. Never throws: Gboard treats
     * an empty Optional as "no OCR available" and keeps the keyboard alive, which is what the
     * stock provider does when its module is missing.
     */
    public static Object createOptional() {
        ClassLoader classLoader = GboardOcrBundledBridge.class.getClassLoader();
        try {
            Object proxy = Proxy.newProxyInstance(
                    classLoader,
                    new Class<?>[]{Class.forName(RECOGNIZER_INTERFACE, false, classLoader)},
                    new RecognizerHandler(classLoader));
            Class<?> optional = Class.forName("j$.util.Optional", false, classLoader);
            return optional.getMethod("of", Object.class).invoke(null, proxy);
        } catch (Throwable failure) {
            Log.w(TAG, "Bundled OCR recogniser unavailable", failure);
            try {
                Class<?> optional = Class.forName("j$.util.Optional", false, classLoader);
                return optional.getMethod("empty").invoke(null);
            } catch (Throwable ignored) {
                return null;
            }
        }
    }

    /**
     * Recognises text in a bitmap and returns the plain text, newest line first order preserved.
     * Used by the settings page's image picker, which cannot go through Gboard's camera UI.
     */
    public static String recognizeText(Bitmap bitmap) {
        try {
            ClassLoader cl = GboardOcrBundledBridge.class.getClassLoader();
            Object imageHolder = Class.forName("aaat", false, cl)
                    .getDeclaredConstructor(Bitmap.class).newInstance(bitmap);
            Object optional = createOptional();
            Object recognizer = optional.getClass().getMethod("get").invoke(optional);
            java.lang.reflect.Method process = null;
            for (java.lang.reflect.Method candidate : recognizer.getClass().getMethods()) {
                if (candidate.getName().equals("b") && candidate.getParameterCount() == 1) {
                    process = candidate;
                    break;
                }
            }
            if (process == null) {
                return "";
            }
            Object task = process.invoke(recognizer, imageHolder);
            // lxp.e() completes to Gboard's zxo text object; its a() blocks each carry b() text.
            Object text = Class.forName("lxp", false, cl).getMethod("e").invoke(task);
            if (text == null) {
                return "";
            }
            StringBuilder joined = new StringBuilder();
            for (Object block : (java.util.List<?>) text.getClass().getMethod("a").invoke(text)) {
                Object blockText = block.getClass().getMethod("b").invoke(block);
                if (blockText == null || blockText.toString().isEmpty()) {
                    continue;
                }
                if (joined.length() > 0) {
                    joined.append('\n');
                }
                joined.append(blockText);
            }
            return joined.toString();
        } catch (Throwable failure) {
            Log.w(TAG, "Bundled OCR image recognition failed", failure);
            return "";
        }
    }

    private static final class RecognizerHandler implements InvocationHandler {
        private final ClassLoader gboard;

        RecognizerHandler(ClassLoader gboard) {
            this.gboard = gboard;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            switch (method.getName()) {
                case "b":
                    // Gboard hands over its own image holder: { volatile Bitmap a; int b; int c; }
                    return processImage(args != null && args.length > 0 ? args[0] : null);
                case "a":
                    // The model ships with the app, so there is nothing to download.
                    return emptyModuleSpecs();
                case "close":
                    return null;
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "equals":
                    return proxy == (args != null && args.length > 0 ? args[0] : null);
                case "toString":
                    return "GboardOcrBundled";
                default:
                    return defaultValue(method.getReturnType());
            }
        }

        private Object processImage(Object imageHolder) {
            try {
                Bitmap bitmap = readBitmap(imageHolder);
                if (bitmap == null) {
                    throw new IllegalArgumentException("OCR image has no bitmap");
                }
                Object[] lines = recognize(bitmap);
                return completeTask(transcribe(lines));
            } catch (Throwable failure) {
                Log.w(TAG, "Bundled OCR failed", failure);
                return failedTask(failure);
            }
        }

        private Object[] recognize(Bitmap bitmap) throws Exception {
            // The pipeline is called directly: ML Kit's client SDK would need its component
            // registry, which collides with Gboard's own obfuscated copy of the same library.
            Object engine = pipelineEngine();
            ClassLoader loader = GboardOcrBundledBridge.class.getClassLoader();
            Class<?> imageWrapper = Class.forName("com.google.android.gms.dynamic.IObjectWrapper");
            Class<?> requestClass = Class.forName(OPTIONS_CLASS, false, loader);
            // The call needs its request descriptor: width, height, rotation, format, timestamp.
            Object request = requestClass
                    .getConstructor(Integer.TYPE, Integer.TYPE, Integer.TYPE, Integer.TYPE, Long.TYPE)
                    .newInstance(IMAGE_FORMAT_BITMAP, bitmap.getWidth(), bitmap.getHeight(), 0,
                            System.currentTimeMillis());
            java.lang.reflect.Method process = engine.getClass().getMethod("zbb",
                    imageWrapper, requestClass, Boolean.TYPE);
            Object result = process.invoke(engine, ObjectWrapper.wrap(bitmap), request, Boolean.FALSE);
            if (result == null) {
                return new Object[0];
            }
            try {
                Object status = result.getClass().getMethod("zbc").invoke(result);
                if (status != null) {
                    Log.i(TAG, "OCR pipeline status=" + status + " detail="
                            + status.getClass().getMethod("zbb").invoke(status)
                            + " ok=" + status.getClass().getMethod("zbd").invoke(status));
                }
            } catch (Throwable ignored) {
                // Status is diagnostic only.
            }
            // The pipeline returns its payload in zbb(): a holder whose zba is the full text
            // and whose zbb is the list of text blocks.
            Object payload = result.getClass().getMethod("zbb").invoke(result);
            if (payload == null) {
                return new Object[0];
            }
            Object text = readObject(payload, "zba");
            Object blocks = readObject(payload, "zbb");
            Log.i(TAG, "OCR payload text=" + text);
            if (blocks instanceof java.util.List) {
                java.util.List<?> list = (java.util.List<?>) blocks;
                Log.i(TAG, "OCR payload blocks=" + list.size());
                if (!list.isEmpty() && list.get(0) != null) {
                    Object first = list.get(0);
                    StringBuilder shape = new StringBuilder(first.getClass().getName()).append(" {");
                    for (java.lang.reflect.Field field : first.getClass().getDeclaredFields()) {
                        field.setAccessible(true);
                        try {
                            Object value = field.get(first);
                            if (value instanceof Object[]) {
                                value = "array[" + ((Object[]) value).length + "]";
                            }
                            shape.append(field.getName()).append('=').append(value).append(' ');
                        } catch (Throwable ignored) {
                            // Skip inaccessible fields.
                        }
                    }
                    Log.i(TAG, "OCR element shape: " + shape.append('}'));
                }
                return list.toArray();
            }
            return new Object[0];
        }

        /**
         * Builds Gboard's Text graph from the pipeline payload: zxo(blocks) -> aaba(block) ->
         * aaay(line). Fields are classified by type rather than name because the pipeline's
         * holders differ per model release: a String is the text (or the language tag), a Rect
         * is the box, a Point[] is the corner polygon and an array is the children.
         */
        private Object transcribe(Object[] blocks) throws Exception {
            Class<?> textClass = Class.forName("zxo", false, gboard);
            Class<?> blockClass = Class.forName("aaba", false, gboard);
            Class<?> lineClass = Class.forName("aaay", false, gboard);
            // Elements are plain aaaz nodes; Gboard's jih walks a line's children at that type.
            Class<?> elementClass = Class.forName("aaaz", false, gboard);

            Constructor<?> textConstructor = textClass.getDeclaredConstructor(List.class);
            Constructor<?> blockConstructor = blockClass.getDeclaredConstructor(
                    String.class, Rect.class, List.class, String.class, List.class);
            Constructor<?> lineConstructor = lineClass.getDeclaredConstructor(
                    String.class, Rect.class, List.class, String.class, List.class, Float.TYPE);
            Constructor<?> elementConstructor = elementClass.getDeclaredConstructor(
                    String.class, Rect.class, List.class, String.class);
            textConstructor.setAccessible(true);
            blockConstructor.setAccessible(true);
            lineConstructor.setAccessible(true);
            elementConstructor.setAccessible(true);

            List<Object> blockObjects = new ArrayList<Object>();
            for (Object rawBlock : blocks) {
                if (rawBlock == null) {
                    continue;
                }
                Rect bounds = boundsOf(rawBlock);
                String language = languageOf(rawBlock);
                List<Object> lineObjects = new ArrayList<Object>();
                List<Object> children = childrenOf(rawBlock);
                for (Object rawLine : children) {
                    Rect lineBounds = boundsOf(rawLine);
                    List<Object> elementObjects = new ArrayList<Object>();
                    for (Object rawElement : childrenOf(rawLine)) {
                        Rect elementBounds = boundsOf(rawElement);
                        elementObjects.add(elementConstructor.newInstance(
                                textOf(rawElement),
                                elementBounds,
                                cornersOf(elementBounds),
                                language));
                    }
                    lineObjects.add(lineConstructor.newInstance(
                            textOf(rawLine),
                            lineBounds,
                            cornersOf(lineBounds),
                            language,
                            elementObjects,
                            confidenceOf(rawLine)));
                }
                blockObjects.add(blockConstructor.newInstance(
                        textOf(rawBlock),
                        bounds,
                        cornersOf(bounds),
                        language,
                        lineObjects));
            }
            return textConstructor.newInstance(blockObjects);
        }

        private Object completeTask(Object result) {
            try {
                Class<?> taskImplClass = Class.forName("lxp", false, gboard);
                Object task = taskImplClass.getDeclaredConstructor().newInstance();
                taskImplClass.getMethod("q", Object.class).invoke(task, result);
                return task;
            } catch (Throwable failure) {
                Log.w(TAG, "Bundled OCR could not wrap its result", failure);
                return failedTask(failure);
            }
        }

        private Object failedTask(Throwable failure) {
            try {
                Class<?> taskImplClass = Class.forName("lxp", false, gboard);
                Object task = taskImplClass.getDeclaredConstructor().newInstance();
                taskImplClass.getMethod("o", Exception.class).invoke(task, asException(failure));
                return task;
            } catch (Throwable ignored) {
                throw new IllegalStateException("Bundled OCR failed", failure);
            }
        }

        private Object emptyModuleSpecs() {
            try {
                Class<?> spec = Class.forName("kzf", false, gboard);
                return Array.newInstance(spec, 0);
            } catch (Throwable failure) {
                return Array.newInstance(Object.class, 0);
            }
        }
    }

    /**
     * The engine reads its models from a real directory, not from assets, so the shipped tree is
     * extracted once and its parent passed as the model directory.
     */
    private static File extractModels(Context context) throws Exception {
        File root = new File(context.getFilesDir(), "mlkit-ocr-models");
        File tree = new File(root, "mlkit-google-ocr-models");
        File marker = new File(tree, "taser/rpn_text_detection_tflite_mobile_mbv2.binarypb");
        if (!marker.isFile()) {
            copyAssetTree(context, "mlkit-google-ocr-models", tree);
        }
        if (!marker.isFile()) {
            throw new IllegalStateException("OCR models were not extracted");
        }
        // The engine resolves <modelDir>/taser/... itself, so hand it the model tree.
        return tree;
    }

    private static void copyAssetTree(Context context, String assetPath, File destination)
            throws Exception {
        String[] children = context.getAssets().list(assetPath);
        if (children != null && children.length > 0) {
            if (!destination.isDirectory() && !destination.mkdirs()) {
                throw new IllegalStateException("Cannot create " + destination);
            }
            for (String child : children) {
                copyAssetTree(context, assetPath + "/" + child, new File(destination, child));
            }
            return;
        }
        File parent = destination.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
            throw new IllegalStateException("Cannot create " + parent);
        }
        try (InputStream input = context.getAssets().open(assetPath);
             FileOutputStream output = new FileOutputStream(destination)) {
            byte[] buffer = new byte[64 * 1024];
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read > 0) {
                    output.write(buffer, 0, read);
                }
            }
            output.getFD().sync();
        }
    }

    /**
     * Copies the pipeline out of assets once and loads it, so ML Kit finds it already there.
     *
     * The extracted file must be read-only: since {@code targetSdk 37} the linker rejects a
     * library passed to {@code System.load()} that the app can still write, with
     * {@code UnsatisfiedLinkError: Attempt to load writable file}. Debug images do not enforce
     * that, which is why this only failed on a real device.
     */
    private static void loadPipeline(Context context) throws Exception {
        String abi = android.os.Build.SUPPORTED_ABIS.length > 0
                ? android.os.Build.SUPPORTED_ABIS[0] : "arm64-v8a";
        String asset = "mlkit-ocr/" + abi + "/libmlkit_google_ocr_pipeline.so";
        File target = new File(context.getFilesDir(), asset);
        long shippedLength;
        try (InputStream probe = context.getAssets().open(asset)) {
            shippedLength = probe.available();
        } catch (Throwable failure) {
            shippedLength = -1;
        }
        if (target.isFile() && shippedLength > 0 && target.length() != shippedLength) {
            // A different build ships different bytes; the file is read-only, so drop it first.
            makeWritable(target);
            if (!target.delete()) {
                throw new IllegalStateException("Cannot replace " + target);
            }
        }
        if (!target.isFile() || target.length() == 0) {
            File parent = target.getParentFile();
            if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
                throw new IllegalStateException("Cannot create " + parent);
            }
            try (InputStream input = context.getAssets().open(asset);
                 FileOutputStream output = new FileOutputStream(target)) {
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = input.read(buffer)) >= 0) {
                    if (read > 0) {
                        output.write(buffer, 0, read);
                    }
                }
                output.getFD().sync();
            }
        }
        makeReadOnly(target);
        System.load(target.getAbsolutePath());
    }

    private static void makeReadOnly(File file) {
        if (!file.setReadOnly()) {
            Log.w(TAG, "Could not mark " + file + " read-only");
        }
        try {
            android.system.Os.chmod(file.getAbsolutePath(), 0444);
        } catch (Throwable ignored) {
            // setReadOnly() already cleared the write bits on every release so far.
        }
    }

    private static void makeWritable(File file) {
        try {
            android.system.Os.chmod(file.getAbsolutePath(), 0644);
        } catch (Throwable ignored) {
            // Best effort: deletion works through the writable parent directory anyway.
        }
    }

    /** Builds the pipeline engine once, with the shipped models and Latin configuration. */
    private static Object pipelineEngine() throws Exception {
        synchronized (RECOGNIZER_LOCK) {
            if (recognizer != null) {
                return recognizer;
            }
            Context context = currentApplication();
            if (context == null) {
                throw new IllegalStateException("OCR needs an application context");
            }
            loadPipeline(context);
            File modelRoot = extractModels(context);
            ClassLoader loader = GboardOcrBundledBridge.class.getClassLoader();
            Class<?> optionsClass = Class.forName(
                    "com.google.mlkit.vision.text.pipeline.VkpTextRecognizerOptions", false, loader);
            Object builder = optionsClass.getMethod("builder", String.class, String.class, String.class)
                    .invoke(null, MODEL, MODEL_ASSET_DIR, "en");
            Object options = builder.getClass().getMethod("build").invoke(builder);
            Class<?> engineClass = Class.forName(
                    "com.google.mlkit.vision.text.pipeline.zbi", false, loader);
            recognizer = engineClass.getMethod("zba", Context.class, optionsClass)
                    .invoke(null, context, options);
            return recognizer;
        }
    }

    private static Bitmap readBitmap(Object holder) throws Exception {
        if (holder instanceof Bitmap) {
            return (Bitmap) holder;
        }
        if (holder == null) {
            return null;
        }
        Field bitmap = holder.getClass().getDeclaredField("a");
        bitmap.setAccessible(true);
        Object value = bitmap.get(holder);
        return value instanceof Bitmap ? (Bitmap) value : null;
    }

    private static final java.util.regex.Pattern LANGUAGE_TAG =
            java.util.regex.Pattern.compile("[a-z]{2,3}(-[A-Za-z]+)?");

    private static List<Object> childrenOf(Object holder) {
        for (java.lang.reflect.Field field : holder.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            try {
                Object value = field.get(holder);
                if (value instanceof Object[]) {
                    Object[] array = (Object[]) value;
                    // A Point[] is the corner polygon, not children.
                    if (array.length > 0 && array[0] instanceof Point) {
                        continue;
                    }
                    return java.util.Arrays.asList(array);
                }
                if (value instanceof List) {
                    List<?> list = (List<?>) value;
                    if (!list.isEmpty() && list.get(0) instanceof Point) {
                        continue;
                    }
                    return new ArrayList<Object>(list);
                }
            } catch (Throwable ignored) {
                // Skip inaccessible fields.
            }
        }
        return Collections.emptyList();
    }

    private static String textOf(Object holder) {
        String best = "";
        for (java.lang.reflect.Field field : holder.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            try {
                Object value = field.get(holder);
                if (value instanceof String) {
                    String text = (String) value;
                    if (text.length() > best.length() && !LANGUAGE_TAG.matcher(text).matches()) {
                        best = text;
                    }
                }
            } catch (Throwable ignored) {
                // Skip inaccessible fields.
            }
        }
        return best;
    }

    private static String languageOf(Object holder) {
        for (java.lang.reflect.Field field : holder.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            try {
                Object value = field.get(holder);
                if (value instanceof String && LANGUAGE_TAG.matcher((String) value).matches()) {
                    return (String) value;
                }
            } catch (Throwable ignored) {
                // Skip inaccessible fields.
            }
        }
        return "";
    }

    private static float confidenceOf(Object holder) {
        for (java.lang.reflect.Field field : holder.getClass().getDeclaredFields()) {
            if (field.getType() != Float.TYPE) {
                continue;
            }
            field.setAccessible(true);
            try {
                return field.getFloat(holder);
            } catch (Throwable ignored) {
                // Skip inaccessible fields.
            }
        }
        return 0f;
    }

    private static Rect boundsOf(Object holder) {
        for (java.lang.reflect.Field field : holder.getClass().getDeclaredFields()) {
            if (field.getType() != Rect.class) {
                continue;
            }
            field.setAccessible(true);
            try {
                Object value = field.get(holder);
                if (value instanceof Rect) {
                    return new Rect((Rect) value);
                }
            } catch (Throwable ignored) {
                // Skip inaccessible fields.
            }
        }
        return new Rect();
    }

    private static Rect readBounds(Object line) throws Exception {
        for (String name : new String[]{"zbd", "zbb", "zbc"}) {
            try {
                Field field = line.getClass().getDeclaredField(name);
                field.setAccessible(true);
                Object bounds = field.get(line);
                if (bounds == null) {
                    continue;
                }
                int left = readInt(bounds, "zba");
                int top = readInt(bounds, "zbb");
                int right = readInt(bounds, "zbc");
                int bottom = readInt(bounds, "zbd");
                return new Rect(left, top, right, bottom);
            } catch (NoSuchFieldException ignored) {
                // Try the next bounds field.
            }
        }
        return new Rect();
    }

    private static List<Point> cornersOf(Rect rect) {
        List<Point> corners = new ArrayList<Point>(4);
        corners.add(new Point(rect.left, rect.top));
        corners.add(new Point(rect.right, rect.top));
        corners.add(new Point(rect.right, rect.bottom));
        corners.add(new Point(rect.left, rect.bottom));
        return corners;
    }

    private static int readInt(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getInt(owner);
    }

    private static float readFloat(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.getFloat(owner);
        } catch (Throwable ignored) {
            return 0f;
        }
    }

    /** Reads an array field holding a block's children (lines or elements). */
    private static List<Object> readChildren(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            Object value = field.get(owner);
            if (value instanceof Object[]) {
                return java.util.Arrays.asList((Object[]) value);
            }
        } catch (Throwable ignored) {
            // No children on this build.
        }
        return Collections.emptyList();
    }

    private static Object readObject(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(owner);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String readString(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            Object value = field.get(owner);
            return value instanceof String ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Exception asException(Throwable failure) {
        return failure instanceof Exception
                ? (Exception) failure
                : new IllegalStateException(failure);
    }

    private static Context currentApplication() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method current = activityThread.getMethod("currentApplication");
            Object application = current.invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive()) {
            return null;
        }
        if (type == Boolean.TYPE) {
            return Boolean.FALSE;
        }
        if (type == Character.TYPE) {
            return Character.valueOf('\0');
        }
        if (type == Byte.TYPE) {
            return Byte.valueOf((byte) 0);
        }
        if (type == Short.TYPE) {
            return Short.valueOf((short) 0);
        }
        if (type == Integer.TYPE) {
            return Integer.valueOf(0);
        }
        if (type == Long.TYPE) {
            return Long.valueOf(0L);
        }
        if (type == Float.TYPE) {
            return Float.valueOf(0f);
        }
        return Double.valueOf(0d);
    }
}
