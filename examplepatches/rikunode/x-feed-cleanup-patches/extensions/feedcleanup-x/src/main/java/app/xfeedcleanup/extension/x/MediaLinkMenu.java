package app.xfeedcleanup.extension.x;

import android.app.Activity;
import android.app.AlertDialog;
import android.net.Uri;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Adds Copy media URL to an X post's options menu without modifying Ahmed's
 * extension classes. An unexpected app model is left to the original menu.
 */
@SuppressWarnings("unused")
public final class MediaLinkMenu {
    private static final String ACTION_NAME = "ViewDebugDialog";
    private static final Pattern MEDIA_START = Pattern.compile("(?=MediaContent(?:Video|Gif|Image)\\()");
    private static final Pattern VARIANT = Pattern.compile(
        "MediaVariant\\(url=(https://[^,\\s)]+), bitRate=(\\d+|null), contentType=([^)]+)\\)");
    private static final Pattern IMAGE = Pattern.compile("imageUrl=(https://pbs\\.twimg\\.com/[^,)\\s]+)");
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static volatile Object galleryCopyUrlAction;

    private MediaLinkMenu() {}

    // The patch writes the actual obfuscated enum/group names at patch time.
    private static String actionClass() { return ""; }
    private static String groupClass() { return ""; }

    public static void setActivity(Activity value) {
        activity = new WeakReference<>(value);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List<?> options(boolean shown, List<?> groups) {
        if (!shown || groups == null) return groups;
        try {
            Class<?> group = Class.forName(groupClass());
            Constructor<?> ctor = group.getDeclaredConstructor(List.class);
            ctor.setAccessible(true);
            Class<? extends Enum> action = (Class<? extends Enum>) Class.forName(actionClass());
            Object option = Enum.valueOf(action, ACTION_NAME);
            ArrayList<Object> result = new ArrayList<>(groups);
            result.add(ctor.newInstance(java.util.Collections.singletonList(option)));
            return result;
        } catch (Exception | LinkageError ignored) {
            return groups;
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Map<?, ?> labels(boolean shown, Map<?, ?> original) {
        if (!shown) return original;
        try {
            Class<? extends Enum> action = (Class<? extends Enum>) Class.forName(actionClass());
            Object option = Enum.valueOf(action, ACTION_NAME);
            Map result = original == null ? new LinkedHashMap() : new LinkedHashMap(original);
            result.put(option, java.util.Locale.getDefault().getLanguage().equals("ja")
                ? "メディアURLをコピー" : "Copy media URL");
            return result;
        } catch (Exception | LinkageError ignored) {
            return original;
        }
    }

    public static boolean onOption(Context appContext, Object post, Object event) {
        if (event == null) return false;
        try {
            Class<?> action = Class.forName(actionClass());
            for (Field field : event.getClass().getDeclaredFields()) {
                if (field.getType() != action) continue;
                field.setAccessible(true);
                Object selected = field.get(event);
                if (!(selected instanceof Enum)
                        || !ACTION_NAME.equals(((Enum<?>) selected).name())) return false;
                Activity active = activity.get();
                Context context = active != null ? active : appContext;
                List<String> links = mediaLinks(String.valueOf(post));
                if (links.isEmpty()) {
                    Toast.makeText(context, "No media URL available", Toast.LENGTH_SHORT).show();
                } else {
                    ClipboardManager clipboard =
                        (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (clipboard != null) {
                        clipboard.setPrimaryClip(ClipData.newPlainText(
                            "media_urls", String.join("\n", links)));
                        Toast.makeText(context,
                            links.size() == 1 ? "Media URL copied" : "Media URLs copied",
                            Toast.LENGTH_SHORT).show();
                    }
                }
                return true;
            }
        } catch (Exception | LinkageError ignored) {
            // Preserve X's original selection handling on unknown versions.
        }
        return false;
    }


    /**
     * Adds one new row to X's existing image long-press sheet, without changing
     * the four native actions. The callback id is a marker implementing X's
     * otherwise method-free PhotoAction interface; no private classes are
     * required on the extension compile classpath.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void appendGalleryCopyUrlAction(List<?> rows) {
        if (rows == null || rows.isEmpty()) return;
        try {
            Object copyRow = null;
            for (Object row : rows) {
                if (row == null || !"com.x.ui.common.sheets.a".equals(row.getClass().getName())) continue;
                Field key = row.getClass().getDeclaredField("a");
                key.setAccessible(true);
                Object id = key.get(row);
                if (id != null && "com.x.media.p".equals(id.getClass().getName())) {
                    copyRow = row;
                    break;
                }
            }
            if (copyRow == null) return;
            Class<?> actionType = Class.forName("com.x.media.t");
            Object marker = galleryCopyUrlAction;
            if (marker == null) {
                synchronized (MediaLinkMenu.class) {
                    marker = galleryCopyUrlAction;
                    if (marker == null) {
                        marker = Proxy.newProxyInstance(actionType.getClassLoader(),
                            new Class<?>[]{actionType}, (self, method, args) -> {
                                if ("equals".equals(method.getName())) return self == args[0];
                                if ("hashCode".equals(method.getName())) return System.identityHashCode(self);
                                if ("toString".equals(method.getName())) return "CopyMediaUrl";
                                return null;
                            });
                        galleryCopyUrlAction = marker;
                    }
                }
            }
            Field iconField = copyRow.getClass().getDeclaredField("b");
            iconField.setAccessible(true);
            Object icon = iconField.get(copyRow);
            for (Constructor<?> ctor : copyRow.getClass().getDeclaredConstructors()) {
                Class<?>[] args = ctor.getParameterTypes();
                if (args.length == 6 && args[0] == Object.class && args[2] == String.class
                        && args[3] == String.class && args[4] == Boolean.class
                        && args[5] == int.class) {
                    ctor.setAccessible(true);
                    String label = "ja".equals(java.util.Locale.getDefault().getLanguage())
                        ? "メディアURLをコピー" : "Copy media URL";
                    Object newRow = ctor.newInstance(marker, icon, label, null, null, 40);
                    ((List) rows).add(newRow);
                    return;
                }
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            // Unknown build: leave the native long-press sheet untouched.
        }
    }

    /** Handles only the extra gallery row; native selections retain their handlers. */
    public static boolean handleGalleryCopyUrl(Object gallery, Object event) {
        Object marker = galleryCopyUrlAction;
        if (marker == null || gallery == null || event == null
                || !"com.x.media.n0".equals(event.getClass().getName())) return false;
        try {
            Field chosenField = event.getClass().getDeclaredField("a");
            chosenField.setAccessible(true);
            if (chosenField.get(event) != marker) return false;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
        Activity screen = activity.get();
        try {
            gallery.getClass().getDeclaredMethod("h").invoke(gallery); // dismiss sheet
            Field mediaField = gallery.getClass().getDeclaredField("B");
            mediaField.setAccessible(true);
            Object media = mediaField.get(gallery);
            String url = galleryMediaUrl(media);
            if (screen != null && !screen.isFinishing() && !screen.isDestroyed()) {
                if (url != null) {
                    ClipboardManager clipboard = (ClipboardManager)
                        screen.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText("media_url", url));
                    Toast.makeText(screen, "ja".equals(java.util.Locale.getDefault().getLanguage())
                        ? "メディアURLをコピーしました" : "Media URL copied", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(screen, "ja".equals(java.util.Locale.getDefault().getLanguage())
                        ? "メディアURLを取得できません" : "Media URL unavailable", Toast.LENGTH_SHORT).show();
                }
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            if (screen != null && !screen.isFinishing() && !screen.isDestroyed()) {
                Toast.makeText(screen, "Media URL unavailable", Toast.LENGTH_SHORT).show();
            }
        }
        return true; // Never dispatch our marker to X's sealed action handler.
    }

    /** Resolves only the selected gallery item, never the post thumbnail. */
    private static String galleryMediaUrl(Object media) throws ReflectiveOperationException {
        if (media == null) return null;
        if ("com.x.models.t4".equals(media.getClass().getName())) {
            Class<?> photo = Class.forName("com.x.models.t4");
            Method original = Class.forName("com.x.media.imageloader.i").getDeclaredMethod("e", photo);
            original.setAccessible(true);
            Object value = original.invoke(null, media);
            if (!(value instanceof String)) return null;
            Uri uri = Uri.parse((String) value);
            return "https".equalsIgnoreCase(uri.getScheme())
                && "pbs.twimg.com".equalsIgnoreCase(uri.getHost())
                && uri.getPath() != null && uri.getPath().startsWith("/media/")
                ? (String) value : null;
        }
        if ("com.x.models.w4".equals(media.getClass().getName())
                || "com.x.models.q4".equals(media.getClass().getName())) {
            List<String> urls = mediaLinks(String.valueOf(media));
            return urls.isEmpty() ? null : urls.get(0);
        }
        return null;
    }

    /**
     * Video player download entry point. The direct CDN URL is obtained from the
     * downloader's media argument, not from the post URL or preview image.
     *
     * Returns false when the expected X internals cannot be resolved, so the
     * original video-save action remains available and unchanged.
     */
    public static boolean handleVideoDownload(Object downloader, Object media) {
        if (downloader == null || media == null) return false;
        try {
            Field urlField = media.getClass().getDeclaredField("a");
            urlField.setAccessible(true);
            Object value = urlField.get(media);
            if (!(value instanceof String)) return false;
            final String url = (String) value;
            Uri parsed = Uri.parse(url);
            String host = parsed.getHost();
            if (!"https".equalsIgnoreCase(parsed.getScheme()) || host == null ||
                !(host.equals("video.twimg.com") || host.equals("pbs.twimg.com")
                    || host.equals("ton.twimg.com"))) return false;

            // Piko documents the unmodified native video save method as b(media).
            // If it cannot be located, do not replace the native download path.
            Method save = downloader.getClass().getDeclaredMethod("b", media.getClass());
            save.setAccessible(true);
            Activity context = activity.get();
            if (context == null || context.isFinishing() || context.isDestroyed()) {
                Field activityField = downloader.getClass().getDeclaredField("a");
                activityField.setAccessible(true);
                Object valueContext = activityField.get(downloader);
                context = valueContext instanceof Activity ? (Activity) valueContext : null;
            }
            if (context == null || context.isFinishing() || context.isDestroyed()) return false;
            final Activity screen = context;
            boolean japanese = "ja".equals(java.util.Locale.getDefault().getLanguage());
            String[] options = japanese
                    ? new String[]{"動画を保存", "メディアURLをコピー"}
                    : new String[]{"Save video", "Copy media URL"};
            new AlertDialog.Builder(screen)
                    .setItems(options, (dialog, which) -> {
                        if (which == 0) {
                            try {
                                save.invoke(downloader, media);
                            } catch (Exception e) {
                                Toast.makeText(screen, "Video save failed", Toast.LENGTH_SHORT).show();
                            }
                        } else if (which == 1) {
                            ClipboardManager clipboard =
                                    (ClipboardManager) screen.getSystemService(Context.CLIPBOARD_SERVICE);
                            if (clipboard != null) {
                                clipboard.setPrimaryClip(ClipData.newPlainText("video_url", url));
                                Toast.makeText(screen, japanese
                                    ? "動画のURLをコピーしました" : "Video URL copied",
                                    Toast.LENGTH_SHORT).show();
                            }
                        }
                    })
                    .setNegativeButton(japanese ? "キャンセル" : "Cancel", null)
                    .show();
            return true;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
            // Unsupported APK: retain the native download path.
            return false;
        }
    }

    /** Chooses a video's highest bit-rate MP4 and normalizes images to original size. */
    public static List<String> mediaLinks(String description) {
        LinkedHashSet<String> links = new LinkedHashSet<>();
        if (description == null) return new ArrayList<>(links);
        for (String segment : MEDIA_START.split(description)) {
            if (segment.startsWith("MediaContentVideo(") || segment.startsWith("MediaContentGif(")) {
                Matcher variants = VARIANT.matcher(segment);
                String best = null;
                long bestBitrate = -1;
                while (variants.find()) {
                    if (!variants.group(3).contains("mp4")) continue;
                    long bitrate;
                    try { bitrate = variants.group(2).equals("null") ? 0 : Long.parseLong(variants.group(2)); }
                    catch (NumberFormatException ignored) { continue; }
                    if (bitrate > bestBitrate) {
                        bestBitrate = bitrate;
                        best = variants.group(1);
                    }
                }
                if (best != null) links.add(best);
            } else if (segment.startsWith("MediaContentImage(")) {
                Matcher image = IMAGE.matcher(segment);
                if (image.find()) {
                    String url = image.group(1);
                    int query = url.indexOf('?');
                    String base = query >= 0 ? url.substring(0, query) : url;
                    links.add(base + "?name=orig");
                }
            }
        }
        return new ArrayList<>(links);
    }
}
