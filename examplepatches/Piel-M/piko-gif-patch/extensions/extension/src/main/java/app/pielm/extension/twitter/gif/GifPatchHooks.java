package app.pielm.extension.twitter.gif;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Runtime hooks injected into Piko's Twitter extension and X's downloader classes.
 *
 * Implements:
 * - Case A: Native conversion of Twitter GIF MP4 streams to animated .gif files.
 * - Case B: "GIF" labeling and .gif / .mp4 variant choices inside Piko's NativeDownloader dialog.
 * - Case C: Native .gif conversion when downloading a GIF from X's built-in 3-dots media sheet.
 */
@SuppressWarnings({"unused", "unchecked", "rawtypes"})
public final class GifPatchHooks {
    private static final String TAG = "PikoGifPatch";
    private static final int MEDIA_TYPE_GIF = 2;
    private static final int MEDIA_TYPE_VIDEO = 1;
    private static final Pattern TWEET_VIDEO_ID_PATTERN = Pattern.compile("/tweet_video/([^/?#.]+)");

    // Cached reflection handles for app.morphe.extension.twitter.entity.Media
    private static Class<?> mediaClass;
    private static Constructor<?> mediaConstructor;
    private static Field mediaTypeField;
    private static Field mediaUrlField;
    private static Field mediaExtField;
    private static Field mediaResField;

    // Cached reflection handles for app.morphe.extension.twitter.patches.nativeFeatures.downloader.DownloadItem
    private static Class<?> downloadItemClass;
    private static Field itemLabelField;
    private static Field itemSubtitleField;
    private static Field itemFileNameField;
    private static Field itemMediaField;
    private static Field itemVariantsField;

    private GifPatchHooks() {
    }

    /**
     * Version of the patch bundle. The body is replaced at patch time with the real version.
     */
    public static String getPatchVersion() {
        return "dev";
    }

    /**
     * Human readable list of GIF integrations that were hooked. Replaced at patch time.
     */
    public static String getEnabledIntegrations() {
        return "";
    }

    public static boolean isTwitterGifUrl(String url) {
        if (url == null) return false;
        return url.contains("/tweet_video/") || url.endsWith(".gif") || url.contains(".gif?");
    }

    /**
     * Hooked at the end of {@code app.morphe.extension.twitter.entity.ExtMediaEntities.getVideos()}.
     * When a media entity is a Twitter GIF (/tweet_video/*.mp4), exposes two variants:
     * 1) Primary (index 0): Animated GIF (.gif)
     * 2) Secondary (index 1): Original MP4 video (.mp4)
     */
    public static ArrayList onGetVideosReturn(ArrayList videoArrayList) {
        if (videoArrayList == null || videoArrayList.isEmpty()) {
            return videoArrayList;
        }
        try {
            Object firstItem = videoArrayList.get(0);
            if (firstItem == null) return videoArrayList;
            ensureMediaReflection(firstItem.getClass());

            String url = (String) mediaUrlField.get(firstItem);
            if (!isTwitterGifUrl(url)) {
                return videoArrayList;
            }

            String rawRes = (String) mediaResField.get(firstItem);
            String cleanRes = (rawRes != null && !rawRes.isEmpty()) ? rawRes : "";
            String gifVariantLabel = cleanRes.isEmpty() ? "GIF" : ("GIF • " + cleanRes);
            String mp4VariantLabel = cleanRes.isEmpty() ? "MP4" : ("MP4 • " + cleanRes);

            Object gifMedia = mediaConstructor.newInstance(MEDIA_TYPE_GIF, url, "gif", gifVariantLabel);
            Object mp4Media = mediaConstructor.newInstance(MEDIA_TYPE_VIDEO, url, "mp4", mp4VariantLabel);

            ArrayList updated = new ArrayList(2);
            updated.add(gifMedia);
            updated.add(mp4Media);
            return updated;
        } catch (Throwable e) {
            Log.e(TAG, "onGetVideosReturn error", e);
            return videoArrayList;
        }
    }

    /**
     * Hooked at the end of {@code NativeDownloader.buildDownloadItems(Context, String, ArrayList)}.
     * Relabels GIF items as "GIF X" instead of "Video X" and strips variant labels from output filenames.
     */
    public static ArrayList onBuildDownloadItemsReturn(ArrayList items) {
        if (items == null || items.isEmpty()) {
            return items;
        }
        try {
            for (int i = 0; i < items.size(); i++) {
                Object downloadItem = items.get(i);
                if (downloadItem == null) continue;
                ensureDownloadItemReflection(downloadItem.getClass());

                Object mainMedia = itemMediaField.get(downloadItem);
                if (mainMedia == null) continue;
                ensureMediaReflection(mainMedia.getClass());

                int type = mediaTypeField.getInt(mainMedia);
                String ext = (String) mediaExtField.get(mainMedia);
                String url = (String) mediaUrlField.get(mainMedia);

                if (type == MEDIA_TYPE_GIF || "gif".equalsIgnoreCase(ext) || isTwitterGifUrl(url)) {
                    itemLabelField.set(downloadItem, "GIF " + (i + 1));

                    String mainFileName = (String) itemFileNameField.get(downloadItem);
                    if (mainFileName != null) {
                        itemFileNameField.set(downloadItem, GifDownloadManager.stripVariantSuffix(mainFileName));
                    }

                    List variants = (List) itemVariantsField.get(downloadItem);
                    if (variants != null) {
                        for (int j = 0; j < variants.size(); j++) {
                            Object variantItem = variants.get(j);
                            if (variantItem == null) continue;
                            String variantFileName = (String) itemFileNameField.get(variantItem);
                            if (variantFileName != null) {
                                itemFileNameField.set(variantItem, GifDownloadManager.stripVariantSuffix(variantFileName));
                            }
                        }
                    }
                }
            }
        } catch (Throwable e) {
            Log.e(TAG, "onBuildDownloadItemsReturn error", e);
        }
        return items;
    }

    /**
     * Hooked at the start of {@code app.morphe.extension.twitter.Utils.downloadFile(String url, String mediaName, String ext)}.
     * Returns {@code true} if the download was intercepted and handled as a native .gif conversion.
     */
    public static boolean interceptPikoDownloadFile(String url, String mediaName, String ext) {
        try {
            if ("gif".equalsIgnoreCase(ext)) {
                GifDownloadManager.enqueueGifDownload(url, mediaName);
                return true;
            }
        } catch (Throwable e) {
            Log.e(TAG, "interceptPikoDownloadFile error", e);
        }
        return false;
    }

    /**
     * Hooked in Piko's {@code DownloadPatch.downloadVideoMedia(Object, Object)} and X's native video/GIF downloader (Case C).
     * Intercepts downloads of Twitter GIFs (/tweet_video/*.mp4) triggered from X's 3-dots media options sheet.
     */
    public static boolean interceptNativeXDownload(Object downloaderInstance, Object downloadData) {
        if (downloadData == null) return false;
        try {
            String url = extractUrlFromDownloadData(downloadData);
            if (isTwitterGifUrl(url)) {
                String fileName = extractGifFileNameFromUrl(url);
                GifDownloadManager.enqueueGifDownload(url, fileName);
                return true;
            }
        } catch (Throwable e) {
            Log.e(TAG, "interceptNativeXDownload error", e);
        }
        return false;
    }

    private static String extractUrlFromDownloadData(Object downloadData) {
        Class<?> cls = downloadData.getClass();
        try {
            Field f = cls.getDeclaredField("a");
            f.setAccessible(true);
            Object val = f.get(downloadData);
            if (val instanceof String && ((String) val).startsWith("http")) {
                return (String) val;
            }
        } catch (Throwable ignored) {
        }
        for (Field field : cls.getDeclaredFields()) {
            if (field.getType() == String.class) {
                try {
                    field.setAccessible(true);
                    String val = (String) field.get(downloadData);
                    if (val != null && val.startsWith("http")) {
                        return val;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static String extractGifFileNameFromUrl(String url) {
        Matcher m = TWEET_VIDEO_ID_PATTERN.matcher(url);
        if (m.find()) {
            return "gif_" + m.group(1);
        }
        return "gif_" + System.currentTimeMillis();
    }

    private static synchronized void ensureMediaReflection(Class<?> clazz) throws NoSuchMethodException, NoSuchFieldException {
        if (mediaClass == clazz && mediaConstructor != null) return;
        mediaClass = clazz;
        mediaConstructor = clazz.getDeclaredConstructor(int.class, String.class, String.class, String.class);
        mediaConstructor.setAccessible(true);
        mediaTypeField = clazz.getDeclaredField("type");
        mediaTypeField.setAccessible(true);
        mediaUrlField = clazz.getDeclaredField("url");
        mediaUrlField.setAccessible(true);
        mediaExtField = clazz.getDeclaredField("ext");
        mediaExtField.setAccessible(true);
        mediaResField = clazz.getDeclaredField("resolution");
        mediaResField.setAccessible(true);
    }

    private static synchronized void ensureDownloadItemReflection(Class<?> clazz) throws NoSuchFieldException {
        if (downloadItemClass == clazz && itemLabelField != null) return;
        downloadItemClass = clazz;
        itemLabelField = clazz.getDeclaredField("labelText");
        itemLabelField.setAccessible(true);
        itemSubtitleField = clazz.getDeclaredField("subtitleText");
        itemSubtitleField.setAccessible(true);
        itemFileNameField = clazz.getDeclaredField("fileName");
        itemFileNameField.setAccessible(true);
        itemMediaField = clazz.getDeclaredField("media");
        itemMediaField.setAccessible(true);
        itemVariantsField = clazz.getDeclaredField("variants");
        itemVariantsField.setAccessible(true);
    }
}
