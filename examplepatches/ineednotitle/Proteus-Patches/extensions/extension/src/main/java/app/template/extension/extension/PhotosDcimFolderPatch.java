package app.template.extension.extension;

import java.lang.reflect.Field;
import java.util.Locale;

/**
 * Runtime support for the Google Photos "Fix DCIM folder classification" patch.
 *
 * Google Photos treats everything below {@code DCIM/} as part of the device
 * camera roll, so folders such as {@code DCIM/Screenshots} or {@code DCIM/Facebook}
 * end up inside the "Camera" album. These two helpers narrow the camera roll back
 * down to the folders real camera apps write to.
 *
 * Called from {@code googlephotos/DcimFolderClassificationPatch.kt}.
 */
public final class PhotosDcimFolderPatch {

    /** Folders camera apps actually use inside DCIM. */
    private static final String[] CAMERA_FOLDERS = {
            "camera", "100andro", "100media", "999andro", "100mobile", "open camera",
    };

    private PhotosDcimFolderPatch() {}

    /**
     * @param path absolute media path, may be null.
     * @return true when the path belongs to the device camera roll.
     */
    public static boolean isCameraFolderPath(String path) {
        if (path == null || path.length() == 0) return false;
        String normalized = path.toLowerCase(Locale.US).replace('\\', '/');

        int dcimIndex = normalized.lastIndexOf("/dcim/");
        if (dcimIndex < 0) return false;

        String remainder = normalized.substring(dcimIndex + "/dcim/".length());
        int slash = remainder.indexOf('/');
        String folder = slash < 0 ? remainder : remainder.substring(0, slash);

        for (String cameraFolder : CAMERA_FOLDERS) {
            if (folder.equals(cameraFolder) || folder.startsWith(cameraFolder)) return true;
        }
        // Generic camera convention: DCIM/123ABCDE (DCF), e.g. 100APPLE, 101摩托.
        return folder.length() >= 3
                && Character.isDigit(folder.charAt(0))
                && Character.isDigit(folder.charAt(1))
                && Character.isDigit(folder.charAt(2));
    }

    /**
     * Re-derives the "in camera folder" flag from the media item itself.
     *
     * The model class is app-private and obfuscated, so the path is looked up
     * reflectively: the first String field holding something that looks like an
     * absolute file path is used. When no path can be found the app's own
     * decision is left untouched.
     *
     * @param localMedia   the Google Photos media model instance.
     * @param currentValue the value the app computed.
     * @return the corrected flag.
     */
    public static boolean fixInCameraFolder(Object localMedia, boolean currentValue) {
        String path = extractPath(localMedia);
        if (path == null) return currentValue;
        return isCameraFolderPath(path);
    }

    private static String extractPath(Object localMedia) {
        if (localMedia == null) return null;
        Class<?> clazz = localMedia.getClass();
        while (clazz != null && clazz != Object.class) {
            for (Field field : clazz.getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(localMedia);
                    if (value instanceof String && looksLikePath((String) value)) {
                        return (String) value;
                    }
                } catch (Throwable ignored) {
                    // Hidden/blacklisted field or SecurityException — try the next one.
                }
            }
            clazz = clazz.getSuperclass();
        }
        return null;
    }

    private static boolean looksLikePath(String value) {
        if (value == null || value.length() < 8) return false;
        if (!value.startsWith("/")) return false;
        String lower = value.toLowerCase(Locale.US);
        return lower.contains("/dcim/") || lower.contains("/pictures/")
                || lower.contains("/movies/") || lower.contains("/download/");
    }
}
