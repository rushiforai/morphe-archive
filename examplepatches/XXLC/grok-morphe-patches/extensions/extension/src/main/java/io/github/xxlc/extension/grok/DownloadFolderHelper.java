package io.github.xxlc.extension.grok;

import java.util.Locale;

/** Classifies download folder by MIME type or file extension. */
public final class DownloadFolderHelper {
    private static final String FOLDER_ROOT = "Download/Grok";
    private static final String FOLDER_PICTURES = "Download/Grok/Pictures";
    private static final String FOLDER_VIDEOS = "Download/Grok/Videos";

    private DownloadFolderHelper() {
    }

    /** True when MIME type or file extension indicates the file is an image or video. */
    public static boolean isMedia(String mime, String fileName) {
        String folder = resolveFolder(mime, fileName);
        return FOLDER_PICTURES.equals(folder) || FOLDER_VIDEOS.equals(folder);
    }

    public static String resolveFolder(String mime, String fileName) {
        try {
            if (mime != null) {
                String normalizedMime = mime.trim().toLowerCase(Locale.ROOT);
                int semi = normalizedMime.indexOf(';');
                if (semi >= 0) {
                    normalizedMime = normalizedMime.substring(0, semi).trim();
                }
                if (normalizedMime.startsWith("image/")) {
                    return FOLDER_PICTURES;
                }
                if (normalizedMime.startsWith("video/")) {
                    return FOLDER_VIDEOS;
                }
            }
            if (fileName != null) {
                String clean = fileName.trim();
                int q = clean.indexOf('?');
                if (q >= 0) {
                    clean = clean.substring(0, q);
                }
                int hash = clean.indexOf('#');
                if (hash >= 0) {
                    clean = clean.substring(0, hash);
                }
                int dot = clean.lastIndexOf('.');
                if (dot >= 0 && dot + 1 < clean.length()) {
                    String ext = clean.substring(dot + 1).toLowerCase(Locale.ROOT);
                    if (isImageExtension(ext)) {
                        return FOLDER_PICTURES;
                    }
                    if (isVideoExtension(ext)) {
                        return FOLDER_VIDEOS;
                    }
                }
            }
        } catch (Throwable ignored) {
            // Do not throw exceptions to the app's download thread.
        }
        return FOLDER_ROOT;
    }

    public static String resolveDownloadManagerSubPath(String mime, String fileName) {
        String folder = resolveFolder(mime, fileName);
        String subFolder = folder.startsWith("Download/") ? folder.substring("Download/".length()) : "Grok";
        return subFolder + "/" + safeFileName(fileName);
    }

    /** Keeps only the final file name: strips path separators and "." or ".." segments to avoid escaping Download/Grok. */
    static String safeFileName(String fileName) {
        String name = fileName == null ? "" : fileName.replace('\\', '/');
        name = name.substring(name.lastIndexOf('/') + 1).trim();
        if (name.isEmpty() || ".".equals(name) || "..".equals(name)) {
            return "DownloadedFile";
        }
        return name;
    }

    private static boolean isImageExtension(String ext) {
        return "jpg".equals(ext)
                || "jpeg".equals(ext)
                || "png".equals(ext)
                || "webp".equals(ext)
                || "gif".equals(ext)
                || "heic".equals(ext)
                || "heif".equals(ext)
                || "avif".equals(ext)
                || "bmp".equals(ext)
                || "tif".equals(ext)
                || "tiff".equals(ext)
                || "jfif".equals(ext);
    }

    private static boolean isVideoExtension(String ext) {
        return "mp4".equals(ext)
                || "mov".equals(ext)
                || "webm".equals(ext)
                || "mkv".equals(ext)
                || "3gp".equals(ext)
                || "avi".equals(ext)
                || "m4v".equals(ext)
                || "mpg".equals(ext)
                || "mpeg".equals(ext)
                || "ogv".equals(ext)
                || "ts".equals(ext);
    }
}
