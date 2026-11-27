package app.template.extension.zalo.media;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

/** Hooks that unhide Zalo's native "Save" for profile avatar/cover and Story. Every hook fails safe. */
public final class SaveMedia {
    private SaveMedia() { }

    private static final String TAG = "SaveMedia";

    /**
     * FeedImageViewer.f8(): the original value is the "prevent screenshot" flag which diverts the "..." menu to
     * report-only. The flag itself stays untouched everywhere else (FLAG_SECURE), only this menu choice changes.
     */
    public static boolean allowProtectedMenu(boolean preventScreenshot) {
        return false;
    }

    /** FeedImageViewer.y8(): the "owner is friend" menu field; true makes the native Download item eligible. */
    public static boolean treatAsFriend(boolean isFriend) {
        return true;
    }

    /**
     * BottomSheetMenuView.j5() type 7 (feed video player): the native "Download video" item is limited to the
     * viewer's own videos. Returning true offers it for every video that has a progressive mp4 (the original
     * mp4-present check still runs first, so HLS-only videos stay hidden).
     */
    public static boolean unlockFeedVideoDownload() {
        return true;
    }

    /**
     * BottomSheetMenuView.j5() type 6 (FeedImageViewer): {@code blocked} is "is a video and not own". Returns
     * false (offer the native Download) only when the video has a progressive mp4 the native saver can use;
     * otherwise, or on any failure, the original value.
     * Reflection is pinned to 26.11.01: PhotoViewfull.b -> ItemAlbumMobile.q1 -> zw9.F(ze9) -> phu.c ("uri").
     */
    public static boolean allowAlbumVideo(boolean blocked, Object menuData) {
        if (!blocked || menuData == null) return blocked;
        try {
            Object item = field(menuData, "b");
            Object feedItem = item == null ? null : field(item, "q1");
            if (feedItem == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "allowAlbumVideo: kept hidden, no feed item (b/q1 null)");
                return blocked;
            }
            Object media = albumVideoMedia(feedItem);
            Object url = media == null ? null : field(media, "c");
            if (url instanceof String && !((String) url).trim().isEmpty()) return false;
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "allowAlbumVideo: kept hidden, no progressive mp4 (media "
                + (media == null ? "null" : "without uri") + ")");
            return blocked;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "allowAlbumVideo", failure);
            return blocked;
        }
    }

    /** zw9.F(ze9): the feed item's video media (phu), same lookup the native saver uses. */
    private static Object albumVideoMedia(Object feedItem) throws ReflectiveOperationException {
        Class<?> owner = Class.forName("zw9", false, feedItem.getClass().getClassLoader());
        for (Method method : owner.getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if ("F".equals(method.getName()) && Modifier.isStatic(method.getModifiers()) && types.length == 1
                && types[0].isInstance(feedItem) && method.getReturnType() != void.class) {
                method.setAccessible(true);
                return method.invoke(null, feedItem);
            }
        }
        throw new NoSuchMethodException("zw9.F");
    }

    private static volatile String lastStoryLog;

    /** Story menu: offer native Download (id 36) for a story the viewer can already see. */
    public static boolean canSaveStory(Object story) {
        if (story == null) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "canSaveStory: story is null -> no Download");
            return false;
        }
        try {
            int type = intField(story, "d");
            int status = intField(story, "p");
            // Same guards as the own-story block: not type 3 (other) / 18, and not a disabled (1, 5) story.
            boolean allowed = type != 3 && type != 18 && status != 1 && status != 5;
            logStoryOnce("canSaveStory: d=" + type + " p=" + status
                + " i(url)=" + describeUrl(stringField(story, "i"))
                + " j(urlHls)=" + describeUrl(stringField(story, "j"))
                + " -> " + (allowed ? "Download" : "no Download"), story);
            return allowed;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "canSaveStory", failure);
            return false;
        }
    }

    /**
     * Diagnostics only, sld.Q() prologue: logs which branch builds the menu of a story. Only the "plain" branch
     * reaches the Download hook; the Zalo-Video-story and emoji-status branches return/skip before it.
     */
    public static void logStoryMenu(boolean own, boolean ads, boolean zaloVideoStory, boolean emojiStatus, Object story) {
        try {
            String branch = own ? "own story (native menu)"
                : ads ? "ads story (kvr.g==2, no Download)"
                : zaloVideoStory ? "Zalo Video story (kvr.g==3, returns before Download hook)"
                : emojiStatus ? "emoji-status story (z920.c, skips Download hook)"
                : "plain story (Download hook reachable)";
            logStoryOnce("storyMenu: " + branch, story);
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "logStoryMenu", failure);
        }
    }

    /** The story menu is rebuilt often; skip repeats of the same line for the same story. */
    private static void logStoryOnce(String message, Object story) {
        String key = System.identityHashCode(story) + "|" + message;
        if (key.equals(lastStoryLog)) return;
        lastStoryLog = key;
        NezumiLog.w(Patch.SAVE_MEDIA, TAG, message);
    }

    private static String describeUrl(String url) {
        if (url == null || url.trim().isEmpty()) return "empty";
        String lower = url.toLowerCase();
        return lower.contains(".m3u8") ? "hls" : lower.contains(".mp4") ? "mp4" : "present";
    }

    private static int intField(Object target, String name) throws ReflectiveOperationException {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getInt(target);
    }

    private static String stringField(Object target, String name) {
        try {
            Object value = field(target, name);
            return value instanceof String ? (String) value : null;
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.SAVE_MEDIA, TAG, "string field " + name + " unavailable", failure);
            return null;
        }
    }

    private static Object field(Object target, String name) throws ReflectiveOperationException {
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException notHere) {
                // Expected while walking up the hierarchy; logcat only.
                NezumiLog.d(Patch.SAVE_MEDIA, TAG, name + " not declared on " + c.getName() + ", trying superclass");
            }
        }
        throw new NoSuchFieldException(name);
    }
}
