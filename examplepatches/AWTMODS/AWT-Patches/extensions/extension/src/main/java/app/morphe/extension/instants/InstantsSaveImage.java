package app.morphe.extension.instants;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;

import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * "Save to gallery" row of the friends' Instants viewer menu.
 *
 * The patch reports the viewer state ({@link #onViewerState}), which knows the current photo; the menu row
 * saves that image to Pictures/Instants when clicked. The row expects a Kotlin Function0, which
 * is created as a Proxy because the extension is compiled without the Kotlin stdlib.
 */
public final class InstantsSaveImage {
    private static final String TAG = "InstantsSaveImage";
    private static final String FOLDER = "Pictures/Instants";
    private static final String VIDEO_FOLDER = "Movies/Instants";
    private static final String MEDIA_TYPE = "com.instagram.feed.media.Media";
    // Drawable used by the app for "Save to photos"; looked up by name so a different resource id in
    // another build does not matter.
    private static final String DOWNLOAD_ICON = "instagram_download_outline_24";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    // Id given to the extra menu item. The app maps a selected id to its action enum; an id that
    // matches no entry is ignored by the app, so only onMenuSelected reacts to it.
    private static final int MENU_ITEM_ID = 90421;

    private static final String IMAGE_URL_TYPE = "com.instagram.common.typedurl.ImageUrl";

    // The viewer state; it knows which media is current, so the photo is read from it on click.
    private static volatile Object viewerState;
    private static Object onClick;

    // The class that holds the video player's static helper (Media -> video source). Passed by the
    // patch; the helper is called on demand with the current media.
    private static volatile Class<?> videoSourceClass;

    /** Called by the patched menu builder with the video player's class. */
    public static void setVideoSourceClass(Class<?> type) {
        videoSourceClass = type;
    }

    /** Called with the viewer state every time the context menu items are built. */
    public static void onViewerState(Object state) {
        viewerState = state;
    }

    /** Resource id of the app's download icon (the one of "Save to photos"), or [fallback]. */
    public static int downloadIcon(int fallback) {
        try {
            Activity activity = InstantsGalleryHelper.getActivity();
            if (activity == null) return fallback;
            int id = activity.getResources().getIdentifier(DOWNLOAD_ICON, "drawable", activity.getPackageName());
            return id != 0 ? id : fallback;
        } catch (Throwable t) {
            Log.e(TAG, "Unable to resolve the download icon", t);
            return fallback;
        }
    }

    /**
     * Gives the menu item built by the app's own factory an id of our own and, when given, the icon
     * painter. The item has two painter fields, the leading icon and a trailing one; the factory
     * fills only the leading one and leaves the other null, so the field that is not null is the
     * one to replace (the declaration order of the fields says nothing about which is which).
     */
    public static Object markMenuItem(Object item, Object painter) {
        try {
            boolean idSet = false;
            boolean painterSet = painter == null;
            for (Class<?> type = item.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    if (!idSet && field.getType() == int.class) {
                        field.setInt(item, MENU_ITEM_ID);
                        idSet = true;
                        Log.i(TAG, "menu item marked via " + type.getName() + "." + field.getName());
                    } else if (!painterSet && field.getType() != Object.class
                            && field.getType().isAssignableFrom(painter.getClass())
                            && field.get(item) != null) {
                        field.set(item, painter);
                        painterSet = true;
                        Log.i(TAG, "menu icon replaced in " + type.getName() + "." + field.getName());
                    }
                }
            }
            if (!idSet) Log.e(TAG, "Menu item has no id field");
            if (!painterSet) Log.e(TAG, "Menu item has no icon to replace");
        } catch (Throwable t) {
            Log.e(TAG, "Unable to mark menu item", t);
        }
        return item;
    }

    /** Called with the id of every selected item of the viewer's context menu. */
    public static void onMenuSelected(int id) {
        Log.i(TAG, "menu selected id=" + id + (id == MENU_ITEM_ID ? " (save)" : ""));
        if (id == MENU_ITEM_ID) save();
    }

    /** Shared Function0 for the menu row. */
    public static synchronized Object onClick() {
        if (onClick == null) {
            try {
                Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0");
                onClick = Proxy.newProxyInstance(
                        InstantsSaveImage.class.getClassLoader(),
                        new Class<?>[]{function0},
                        new ClickHandler());
            } catch (Throwable t) {
                Log.e(TAG, "Unable to create click action", t);
            }
        }
        return onClick;
    }

    private static final class ClickHandler implements InvocationHandler {
        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            switch (method.getName()) {
                case "invoke":
                    save();
                    return null;
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "equals":
                    return proxy == args[0];
                default:
                    return "InstantsSaveImage.onClick";
            }
        }
    }

    // ImageUrl's accessor names are obfuscated, so take the first public no-arg String getter
    // that returns something that looks like a location.
    private static String urlOf(Object imageUrl) {
        if (imageUrl == null) return null;
        for (Method m : imageUrl.getClass().getMethods()) {
            if (m.getParameterTypes().length != 0 || m.getReturnType() != String.class
                    || Modifier.isStatic(m.getModifiers()) || m.getDeclaringClass() == Object.class) {
                continue;
            }
            try {
                String s = (String) m.invoke(imageUrl);
                if (s != null && (s.startsWith("http") || s.startsWith("file:")
                        || s.startsWith("content:") || s.startsWith("/"))) {
                    return s;
                }
            } catch (Throwable ignored) {
                // Try the next getter.
            }
        }
        return null;
    }

    // What the viewer shows right now: the address to save and whether it is a video.
    private static final class Target {
        final String url;
        final boolean video;

        Target(String url, boolean video) {
            this.url = url;
            this.video = video;
        }
    }

    // The state's accessor for the current media is obfuscated: try its no-arg methods that return
    // an object, and take the first whose result is a media model (one that holds a Media or exposes
    // an ImageUrl).
    private static Target currentTarget() {
        Object state = viewerState;
        if (state == null) return null;
        for (Method m : state.getClass().getMethods()) {
            Class<?> returnType = m.getReturnType();
            if (m.getParameterTypes().length != 0 || returnType.isPrimitive() || returnType == String.class
                    || Modifier.isStatic(m.getModifiers()) || m.getDeclaringClass() == Object.class) {
                continue;
            }
            try {
                Object model = m.invoke(state);
                if (model == null) continue;

                Object media = fieldOfType(model, MEDIA_TYPE);
                Object source = videoSourceOf(media);
                String videoUrl = source != null ? videoUrlOf(source) : null;
                if (videoUrl != null) {
                    Log.i(TAG, "current media is a video: " + videoUrl);
                    return new Target(videoUrl, true);
                }

                String url = largestCandidateUrl(model);
                if (url == null) url = urlOf(imageUrlOf(model));
                if (url != null && isVideoThumbnail(url)) {
                    // A video whose address could not be read: do not save its still image as a photo.
                    Log.w(TAG, "video without a readable address, source=" + (source != null));
                    return new Target(null, true);
                }
                if (url != null) return new Target(url, false);
            } catch (Throwable ignored) {
                // Try the next accessor.
            }
        }
        return null;
    }

    // The video player turns a Media into its playback source with a static helper next to it.
    // Calling that helper with the current media gives the source for a video and an empty one for a
    // photo. The helper's name is obfuscated: take its (Media) -> object function by shape.
    private static Object videoSourceOf(Object media) {
        Class<?> type = videoSourceClass;
        if (media == null || type == null) return null;
        try {
            for (Method m : type.getDeclaredMethods()) {
                Class<?>[] params = m.getParameterTypes();
                if (Modifier.isStatic(m.getModifiers()) && params.length == 1 && params[0].isInstance(media)
                        && !m.getReturnType().isPrimitive() && m.getReturnType() != Void.TYPE) {
                    m.setAccessible(true);
                    return m.invoke(null, media);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Unable to read the video source", t);
        }
        return null;
    }

    // The source exposes several texts; the video address is the one that points to a media file.
    private static String videoUrlOf(Object source) {
        String fallback = null;
        for (Method m : source.getClass().getMethods()) {
            if (m.getParameterTypes().length != 0 || m.getReturnType() != String.class
                    || Modifier.isStatic(m.getModifiers()) || m.getDeclaringClass() == Object.class) {
                continue;
            }
            try {
                String s = (String) m.invoke(source);
                if (s == null || !s.startsWith("http")) continue;
                Log.i(TAG, "video source text candidate: " + s);
                if (s.contains(".mp4")) return s;
                if (fallback == null) fallback = s;
            } catch (Throwable ignored) {
                // Try the next getter.
            }
        }
        return fallback;
    }

    // Instants marks the still image of a video in its address (the "efg" parameter is base64 json
    // with a vencode_tag that names it "video_first_frame_thumbnail").
    private static boolean isVideoThumbnail(String url) {
        try {
            int start = url.indexOf("efg=");
            if (start < 0) return false;
            int end = url.indexOf('&', start);
            String value = java.net.URLDecoder.decode(url.substring(start + 4, end < 0 ? url.length() : end), "UTF-8");
            String json = new String(android.util.Base64.decode(value, android.util.Base64.URL_SAFE), "UTF-8");
            return json.contains("video_first_frame_thumbnail");
        } catch (Throwable t) {
            return false;
        }
    }

    // The model's ImageUrl is the app's display size (about 360 px). The media also keeps the full list
    // of sizes (ExtendedImageUrl candidates, with getWidth/getHeight): take the largest one. Every
    // step is looked up by type, because the accessors are obfuscated.
    private static String largestCandidateUrl(Object model) {
        try {
            Object media = fieldOfType(model, "com.instagram.feed.media.Media");
            if (media == null) return null;
            Object imageInfo = imageInfoOf(media);
            if (imageInfo == null) return null;
            Class<?> candidateType = Class.forName(
                    "com.instagram.model.mediasize.ExtendedImageUrl", false, media.getClass().getClassLoader());
            Object best = null;
            int bestWidth = -1;
            int count = 0;
            for (Method m : imageInfo.getClass().getMethods()) {
                if (m.getParameterTypes().length != 0 || !java.util.List.class.isAssignableFrom(m.getReturnType())) {
                    continue;
                }
                Object result = m.invoke(imageInfo);
                if (!(result instanceof java.util.List)) continue;
                for (Object candidate : (java.util.List<?>) result) {
                    if (!candidateType.isInstance(candidate)) continue;
                    count++;
                    int width = (Integer) candidateType.getMethod("getWidth").invoke(candidate);
                    if (width > bestWidth) {
                        bestWidth = width;
                        best = candidate;
                    }
                }
            }
            Log.i(TAG, "candidates=" + count + ", largest width=" + bestWidth);
            return best != null ? urlOf(best) : null;
        } catch (Throwable t) {
            Log.e(TAG, "Unable to read image sizes", t);
            return null;
        }
    }

    private static Object fieldOfType(Object target, String typeName) throws Exception {
        for (Class<?> type = target.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers()) && field.getType().getName().equals(typeName)) {
                    field.setAccessible(true);
                    return field.get(target);
                }
            }
        }
        return null;
    }

    // MediaExtKt has a static (Media) -> ImageInfo function with an obfuscated name.
    private static Object imageInfoOf(Object media) throws Exception {
        Class<?> ext = Class.forName("com.instagram.feed.media.MediaExtKt", false, media.getClass().getClassLoader());
        for (Method m : ext.getDeclaredMethods()) {
            Class<?>[] params = m.getParameterTypes();
            if (Modifier.isStatic(m.getModifiers()) && params.length == 1 && params[0].isInstance(media)
                    && m.getReturnType().getName().equals("com.instagram.model.mediasize.ImageInfo")) {
                m.setAccessible(true);
                return m.invoke(null, media);
            }
        }
        return null;
    }

    // The model's accessor is obfuscated too: take its no-arg method returning an ImageUrl.
    private static Object imageUrlOf(Object model) {
        if (model == null) return null;
        for (Method m : model.getClass().getMethods()) {
            if (m.getParameterTypes().length == 0 && m.getReturnType().getName().equals(IMAGE_URL_TYPE)) {
                try {
                    return m.invoke(model);
                } catch (Throwable ignored) {
                    // Try the next candidate.
                }
            }
        }
        return null;
    }

    private static void save() {
        final Target target = currentTarget();
        final Context context = context();
        Log.i(TAG, "save requested, url=" + (target != null ? target.url : null)
                + ", video=" + (target != null && target.video) + ", context=" + (context != null));
        if (context == null) return;
        if (target == null || target.url == null) {
            toast(context, target != null && target.video
                    ? InstantsStrings.videoSaveFailed(context) : InstantsStrings.noPhoto(context));
            return;
        }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            toast(context, InstantsStrings.needsAndroid10(context));
            return;
        }
        new Thread(() -> {
            try {
                Uri saved = download(context, target.url, target.video);
                Log.i(TAG, "saved to " + saved);
                if (saved != null) {
                    toast(context, target.video
                            ? InstantsStrings.videoSaved(context, VIDEO_FOLDER) : InstantsStrings.saved(context, FOLDER));
                } else {
                    toast(context, target.video
                            ? InstantsStrings.videoSaveFailed(context) : InstantsStrings.saveFailed(context));
                }
            } catch (Throwable t) {
                Log.e(TAG, "Unable to save media", t);
                toast(context, target.video
                        ? InstantsStrings.videoSaveFailed(context) : InstantsStrings.saveFailed(context));
            }
        }, "InstantsSaveImage").start();
    }

    private static Uri download(Context context, String url, boolean video) throws Exception {
        ContentResolver resolver = context.getContentResolver();
        String mime = video ? "video/mp4" : "image/jpeg";
        InputStream in;
        if (url.startsWith("http")) {
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            String type = connection.getContentType();
            Log.i(TAG, "content type " + type);
            String expected = video ? "video/" : "image/";
            if (type != null && type.startsWith(expected)) {
                mime = type;
            } else if (video) {
                // Not a playable file (for example a streaming manifest): saving it would give a broken file.
                connection.disconnect();
                return null;
            }
            in = connection.getInputStream();
        } else if (url.startsWith("/")) {
            in = new java.io.FileInputStream(url);
        } else {
            in = resolver.openInputStream(Uri.parse(url));
        }
        String extension = video ? "mp4"
                : mime.endsWith("png") ? "png" : mime.endsWith("webp") ? "webp" : "jpg";

        ContentValues values = new ContentValues();
        Uri collection;
        if (video) {
            collection = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
            values.put(MediaStore.Video.Media.DISPLAY_NAME, "Instants_" + System.currentTimeMillis() + "." + extension);
            values.put(MediaStore.Video.Media.MIME_TYPE, mime);
            values.put(MediaStore.Video.Media.RELATIVE_PATH, VIDEO_FOLDER);
            values.put(MediaStore.Video.Media.IS_PENDING, 1);
        } else {
            collection = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
            values.put(MediaStore.Images.Media.DISPLAY_NAME, "Instants_" + System.currentTimeMillis() + "." + extension);
            values.put(MediaStore.Images.Media.MIME_TYPE, mime);
            values.put(MediaStore.Images.Media.RELATIVE_PATH, FOLDER);
            values.put(MediaStore.Images.Media.IS_PENDING, 1);
        }
        Uri uri = resolver.insert(collection, values);
        if (uri == null) {
            in.close();
            return null;
        }
        try (InputStream source = in; OutputStream out = resolver.openOutputStream(uri)) {
            byte[] buffer = new byte[16 * 1024];
            int read;
            while ((read = source.read(buffer)) != -1) out.write(buffer, 0, read);
        } catch (Throwable t) {
            resolver.delete(uri, null, null);
            throw t;
        }
        values.clear();
        values.put(MediaStore.MediaColumns.IS_PENDING, 0);
        resolver.update(uri, values, null, null);
        return uri;
    }

    private static Context context() {
        Activity activity = InstantsGalleryHelper.getActivity();
        return activity != null ? activity.getApplicationContext() : null;
    }

    private static void toast(Context context, String message) {
        MAIN.post(() -> Toast.makeText(context, message, Toast.LENGTH_SHORT).show());
    }
}
