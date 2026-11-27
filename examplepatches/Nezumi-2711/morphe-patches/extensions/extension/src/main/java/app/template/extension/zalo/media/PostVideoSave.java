package app.template.extension.zalo.media;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

/**
 * "Tải ảnh về máy" / "Download photo" and "Tải video về máy" / "Download video" rows for the post "..." sheet
 * (BottomSheetMenuView) of Newsfeed/Timeline (menu type 1), post detail (3), profile timelines (4) and mutual feed (5).
 * Photos are saved through {@link PostPhotoSave}, videos through {@link ZaloVideoSave}. A mixed post gets both rows,
 * photo row first; both are appended after the native rows.
 *
 * Reflection is pinned to 26.11.01 (the patch check()s the class names it relies on):
 * a99.d(String) -> ze9; ze9.n (mf9); mf9.y (phu, single video: c = mp4 "uri", d = "hls");
 * mf9.M (ArrayList of xu, album: xu.a == 1 is a video, xu.b is av: yu.c = "origin" mp4, av.f = "hls");
 * row model nc2 via static mc2.a(nc2.Companion, id, icon, title, desc, Z, Drawable, String, ly8, mask).
 */
public final class PostVideoSave {
    private PostVideoSave() { }

    private static final String TAG = "PostVideoSave";
    static final int ITEM_ID = 9001; // 0x2329, video row, unused by the sheet (native ids go up to 0x2c)
    static final int PHOTO_ITEM_ID = 9002; // 0x232a, photo row
    private static final String ROW = "nc2";
    private static final String ROW_FACTORY = "mc2";

    /** What a row saves, captured at build time so the click needs no model lookup. */
    private static final class Entry {
        final int id;
        final List<String[]> videos; // {mp4, hls} for the video row
        final List<String> photos;   // origin URLs for the photo row

        Entry(int id, List<String[]> videos, List<String> photos) {
            this.id = id;
            this.videos = videos;
            this.photos = photos;
        }
    }

    /** Row object (identity; nc2 does not override equals) -> its entry. Rows are only created by mc2.a. */
    private static final Map<Object, Entry> ROWS = Collections.synchronizedMap(new WeakHashMap<Object, Entry>());

    /** j5() type 1 (Newsfeed/Timeline): the post is looked up in its feed group by id, like sld.R does. */
    @SuppressWarnings({ "rawtypes" })
    public static void addForFeed(List list, Object group, String feedId, int icon) {
        try {
            if (group == null || feedId == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu: no row, " + (group == null ? "feed group" : "feed id") + " is null");
                return;
            }
            Object post = null;
            for (Class<?> c = group.getClass(); c != null && c != Object.class && post == null; c = c.getSuperclass()) {
                for (Method method : c.getDeclaredMethods()) {
                    Class<?>[] types = method.getParameterTypes();
                    if ("d".equals(method.getName()) && types.length == 1 && types[0] == String.class
                        && !method.getReturnType().isPrimitive()) {
                        method.setAccessible(true);
                        post = method.invoke(group, feedId);
                        break;
                    }
                }
            }
            if (post == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (timeline): no row, no post for the feed id in " + group.getClass().getName());
                return;
            }
            add(list, post, icon, "type 1 timeline");
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (timeline): addForFeed failed", failure);
        }
    }

    /** j5() types 3/4/5 (post detail, profile, mutual feed): the post (ze9) is passed directly. */
    @SuppressWarnings({ "rawtypes" })
    public static void addForPost(List list, Object post, int icon, int menuType) {
        try {
            String where = "type " + menuType + (menuType == 3 ? " post detail" : menuType == 4 ? " profile"
                : menuType == 5 ? " mutual feed" : "");
            if (post == null) {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no row, post is null");
                return;
            }
            add(list, post, icon, where);
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu: addForPost failed", failure);
        }
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    private static void add(List list, Object post, int icon, String where) throws ReflectiveOperationException {
        if (list == null) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no row, item list is null");
            return;
        }
        ClassLoader loader = post.getClass().getClassLoader();
        // Photo row first (separate try: a photo failure must never cost the video row).
        try {
            addPhotoRow(list, post, icon, where, loader);
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): photo row failed", failure);
        }
        List<String[]> videos = findVideos(post, where);
        if (videos.isEmpty()) return;
        int count = videos.size();
        String title = count == 1
            ? ZaloVideoSave.text("Tải video về máy", "Download video")
            : ZaloVideoSave.text("Tải tất cả video (" + count + ")", "Download all videos (" + count + ")");
        Object row = newRow(loader, ITEM_ID, icon, title);
        if (row == null) return;
        ROWS.put(row, new Entry(ITEM_ID, videos, null));
        list.add(row);
        NezumiLog.i(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): row added for " + count + " video(s)");
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    private static void addPhotoRow(List list, Object post, int icon, String where, ClassLoader loader)
        throws ReflectiveOperationException {
        Object media = post.getClass().getField("n").get(post); // ze9.n (mf9)
        if (media == null) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no photo row, post has no media (ze9.n null)");
            return;
        }
        PostPhotoSave.Photos photos = PostPhotoSave.find(post, media, where);
        int count = photos.urls.size();
        if (photos.candidates > 0) {
            // Tells whether a menu (notably post detail, type 3) carries the full photo list.
            NezumiLog.i(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): content type " + photos.contentType + ", " + count
                + " photo URL(s) of " + photos.candidates + " photo item(s), more_photo=" + photos.morePhotos);
        }
        if (count == 0) return;
        if (photos.morePhotos > 0) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no photo row, photo list incomplete (" + count
                + " known, more_photo=" + photos.morePhotos + ")");
            return;
        }
        String title = count == 1
            ? ZaloVideoSave.text("Tải ảnh về máy", "Download photo")
            : ZaloVideoSave.text("Tải tất cả ảnh (" + count + ")", "Download all photos (" + count + ")");
        Object row = newRow(loader, PHOTO_ITEM_ID, icon, title);
        if (row == null) return;
        ROWS.put(row, new Entry(PHOTO_ITEM_ID, null, new ArrayList<>(photos.urls)));
        list.add(row);
        NezumiLog.i(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): photo row added for " + count + " photo(s)");
    }

    /** Collects every video of the post with a usable mp4 or HLS link (album items first, else the single video). */
    private static List<String[]> findVideos(Object post, String where) throws ReflectiveOperationException {
        List<String[]> videos = new ArrayList<>();
        Object media = post.getClass().getField("n").get(post); // ze9.n (mf9)
        if (media == null) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no row, post has no media (ze9.n null)");
            return videos;
        }
        Set<String> seen = new LinkedHashSet<>();
        int albumVideos = 0;
        Object album = media.getClass().getField("M").get(media); // mf9.M (ArrayList<xu>)
        if (album instanceof List) {
            for (Object entry : (List<?>) album) {
                if (entry == null) continue;
                if (entry.getClass().getField("a").getInt(entry) != 1) continue; // xu.a == 1: video
                albumVideos++;
                Object item = entry.getClass().getField("b").get(entry); // xu.b (av extends yu)
                if (item == null) continue;
                String mp4 = url(item.getClass().getField("c").get(item)); // yu.c "origin"
                String hls = url(fieldOrNull(item, "f"));                   // av.f "hls"
                addVideo(videos, seen, mp4, hls);
            }
        }
        boolean single = false;
        if (videos.isEmpty()) {
            Object video = media.getClass().getField("y").get(media); // mf9.y (phu)
            if (video != null) {
                single = true;
                addVideo(videos, seen, url(video.getClass().getField("c").get(video)), url(video.getClass().getField("d").get(video)));
            }
        }
        if (videos.isEmpty()) {
            if (albumVideos == 0 && !single) {
                NezumiLog.d(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no row, post has no video");
            } else {
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no row, " + (albumVideos > 0 ? albumVideos + " album video(s)" : "video")
                    + " without mp4/HLS URL");
            }
        }
        return videos;
    }

    private static void addVideo(List<String[]> videos, Set<String> seen, String mp4, String hls) {
        if (mp4 == null && hls == null) return;
        String key = mp4 != null ? mp4 : hls;
        if (!seen.add(key)) return;
        videos.add(new String[] { mp4, hls });
    }

    private static Object fieldOrNull(Object target, String name) {
        try {
            return target.getClass().getField(name).get(target);
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.SAVE_MEDIA, TAG, "post field " + name + " unavailable", failure);
            return null;
        }
    }

    private static String url(Object value) {
        if (!(value instanceof String)) return null;
        String url = ((String) value).trim();
        if (url.isEmpty() || "null".equals(url) || !url.startsWith("http")) return null;
        return url;
    }

    /** nc2 row through the same factory the sheet uses: mc2.a(nc2.Companion, id, icon, title, null, false, null, null, null, 0x1f0). */
    private static Object newRow(ClassLoader loader, int id, int icon, String title) {
        try {
            Class<?> rowClass = Class.forName(ROW, false, loader);
            Class<?> factoryClass = Class.forName(ROW_FACTORY, false, loader);
            Object companion = rowClass.getField("Companion").get(null);
            for (Method method : factoryClass.getDeclaredMethods()) {
                Class<?>[] t = method.getParameterTypes();
                if ("a".equals(method.getName()) && t.length == 10 && t[0] == factoryClass && t[1] == int.class
                    && t[2] == int.class && t[3] == String.class && t[4] == String.class && t[5] == boolean.class
                    && t[9] == int.class && rowClass.isAssignableFrom(method.getReturnType())) {
                    method.setAccessible(true);
                    return method.invoke(null, companion, id, icon, title, null, false, null, null, null, 0x1f0);
                }
            }
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu: no row, factory mc2.a not found");
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu: no row, row creation failed", failure);
        }
        return null;
    }

    /**
     * V6() hook: returns true when the clicked row is ours (the caller then closes the sheet and skips the native
     * handler, so no menu result is delivered).
     */
    public static boolean onClick(Object sheet, Object item) {
        try {
            if (item == null) return false;
            Entry entry = ROWS.get(item);
            if (entry == null) {
                if (!ROW.equals(item.getClass().getName())) return false;
                int id = item.getClass().getField("a").getInt(item); // rc2.a = row id
                if (id != ITEM_ID && id != PHOTO_ITEM_ID) return false;
                // Our id on a row instance we did not build: refuse rather than guess (a stale list could belong to
                // another post). Consumed so the host never sees the unknown id.
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu: clicked " + (id == PHOTO_ITEM_ID ? "photo" : "video")
                    + " row is not cached, nothing saved");
                ZaloVideoSave.toast(id == PHOTO_ITEM_ID ? PostPhotoSave.failedText()
                    : ZaloVideoSave.text("Tải video thất bại", "Video download failed"));
                return true;
            }
            if (entry.id == PHOTO_ITEM_ID) {
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "post menu: download " + entry.photos.size() + " photo(s)");
                PostPhotoSave.save(entry.photos);
            } else {
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "post menu: download " + entry.videos.size() + " video(s)");
                ZaloVideoSave.saveVideos(entry.videos);
            }
            return true;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu: onClick failed", failure);
            return false;
        }
    }
}
