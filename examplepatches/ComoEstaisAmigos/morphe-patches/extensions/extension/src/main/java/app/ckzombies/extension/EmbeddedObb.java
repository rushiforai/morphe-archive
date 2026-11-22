package app.ckzombies.extension;

import android.app.Activity;
import android.content.res.AssetFileDescriptor;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Treats the OBB packed in the APK as the file Glu's engine opens for SPECIAL_RES.
 *
 * Glu calls that file a GPK, "Glu package": a CBigFile_v2 (FGIB) blob, not an Android
 * expansion. {@code GluDownloadResMgr.findGPKFile} / {@code findGPKFileInDir} look for it
 * by that name, then stash the path in {@code GPK_FILENAME} and skip unpacking with
 * {@code DO_NOT_UNPACK_GPK}. The on-disk extension is not part of the format. Play ships
 * the same bytes as {@code .obb}; a loose copy can be {@code .gpk}. Native FileMgr never
 * checks the suffix, only the path Java hands it.
 *
 * When that file sits in {@code assets/} the "file" is the APK, so event 100/102 starts
 * have to land on the STORED asset's FGIB payload, not on the zip PK header. {@link #path()}
 * records that base from the APK's zip directory ({@code openFd} is only a fallback),
 * {@link #findEmbedded()} points {@code GPK_FILENAME} at the APK, and {@link #adjustEvent}
 * / {@link #adjustOffset} add the base to events 100 and 101 and to the movie player's
 * offset.
 */
@SuppressWarnings("unused")
public final class EmbeddedObb {

    public static final String ASSET_NAME = "main.310.com.glu.android.zombsniper.obb";
    static final String ASSET_ENTRY = "assets/" + ASSET_NAME;

    private static final String RESDL = "com.glu.platform.android.resdl.";
    private static final String GAMELET = RESDL + "GameLet";

    static String resolvedPath;
    static int base;
    static boolean missing;

    private EmbeddedObb() {
    }

    /** APK path when the packed OBB is present; null after a failed lookup. */
    public static synchronized String path() {
        if (resolvedPath != null) {
            return resolvedPath;
        }
        if (missing) {
            return null;
        }
        Activity ctx = activity();
        if (ctx == null) {
            return null;
        }
        String apkPath = ctx.getApplicationInfo().sourceDir;
        if (apkPath == null) {
            return null;
        }
        File apk = new File(apkPath);
        if (accept(apk, openFdOffset(ctx))) {
            resolvedPath = apkPath;
            return resolvedPath;
        }
        if (accept(apk, ApkObbLayout.storedPayloadOffset(apk, ASSET_ENTRY))) {
            resolvedPath = apkPath;
            return resolvedPath;
        }
        missing = true;
        base = 0;
        return null;
    }

    public static int base() {
        return path() != null ? base : 0;
    }

    public static int adjustEvent(int event, int value) {
        return ApkObbLayout.adjustEvent(event, value, base());
    }

    public static int adjustOffset(int offset) {
        return offset + base();
    }

    /**
     * The APK as the file {@code findGPKFile} should return, after the same download-screen
     * side effects Glu's own packed build ran: dummy file.big, no leftover partial downloads.
     * Returns null when the asset is missing, so {@code findGPKFile} falls through to the
     * OBB folder.
     */
    public static File findEmbedded() {
        String resolved = path();
        if (resolved == null) {
            return null;
        }
        File apk = new File(resolved);
        try {
            // Glu's name for this blob. The bytes are the Play OBB; the field is still GPK.
            setStatic(RESDL + "GluDownloadResMgr", "GPK_FILENAME", resolved);
            setStatic(GAMELET, "DO_NOT_UNPACK_GPK", Boolean.TRUE);
            String dir = (String) call(RESDL + "GluUtil", "getResourceSDDirFilename");
            dir = (String) call(RESDL + "GluUtil", "filePathWithEnder", dir);
            new File(dir).mkdirs();
            call(RESDL + "GluUtil", "createNoMedia", dir);
            int size = ((Number) call(RESDL + "GluDownloadResMgr", "getSpecialFileSize")).intValue();
            call(RESDL + "ResDL", "onSuccessfulLaunch", 1, size);
            try {
                call(RESDL + "GluDownloadResMgr", "deleteSpecialFiles", true);
                call(RESDL + "ResFileDownloadView", "deleteResFile");
                String resource = (String) getStatic(GAMELET, "RESOURCE_FILENAME");
                call(RESDL + "GluDownloadResMgr", "createDummyPrimaryResource", dir + resource);
            } catch (Exception ignored) {
                // Hand's own catch: the APK is still the GPK even if the dummy file.big fails.
            }
        } catch (Throwable ignored) {
            // GPK_FILENAME may already be set; native reads still work off the returned File.
        }
        return apk;
    }

    static synchronized void reset() {
        resolvedPath = null;
        base = 0;
        missing = false;
    }

    private static boolean accept(File apk, long offset) {
        if (offset < 0L || offset > Integer.MAX_VALUE || !ApkObbLayout.isFgib(apk, offset)) {
            return false;
        }
        base = (int) offset;
        return true;
    }

    private static Activity activity() {
        try {
            Object ctx = Class.forName(RESDL + "ResDL").getMethod("getContext").invoke(null);
            return ctx instanceof Activity ? (Activity) ctx : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static long openFdOffset(Activity ctx) {
        AssetFileDescriptor fd = null;
        try {
            fd = ctx.getAssets().openFd(ASSET_NAME);
            return fd.getStartOffset();
        } catch (Throwable ignored) {
            return -1L;
        } finally {
            if (fd != null) {
                try {
                    fd.close();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static Object call(String className, String methodName, Object... args) throws Exception {
        Class<?>[] types = new Class<?>[args.length];
        for (int i = 0; i < args.length; i++) {
            types[i] = unboxedType(args[i]);
        }
        Method method = Class.forName(className).getMethod(methodName, types);
        method.setAccessible(true);
        return method.invoke(null, args);
    }

    private static void setStatic(String className, String fieldName, Object value) throws Exception {
        Field field = Class.forName(className).getField(fieldName);
        field.setAccessible(true);
        field.set(null, value);
    }

    private static Object getStatic(String className, String fieldName) throws Exception {
        Field field = Class.forName(className).getField(fieldName);
        field.setAccessible(true);
        return field.get(null);
    }

    private static Class<?> unboxedType(Object arg) {
        if (arg instanceof Integer) {
            return int.class;
        }
        if (arg instanceof Boolean) {
            return boolean.class;
        }
        if (arg instanceof Long) {
            return long.class;
        }
        return arg.getClass();
    }
}
