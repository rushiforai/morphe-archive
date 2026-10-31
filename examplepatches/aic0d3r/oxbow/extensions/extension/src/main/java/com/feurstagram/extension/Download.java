package com.feurstagram.extension;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Oxbow downloads: adds Instagram's own "Download" item to every post menu and saves
 * the original photo or video.
 *
 * Instagram's Media model is a view over a native Pando tree (LiveTreeJNI), whose
 * fields are keyed by String.hashCode() of the API field name ("image_versions2",
 * "video_versions", "carousel_media"...). LiveTreeJNI and TreeJNI keep their real
 * names across releases, so this reads stable API field names instead of obfuscated
 * getters. The only network traffic is the CDN fetch of the file itself, handed to
 * the system DownloadManager (progress notification, no storage permission needed).
 */
public final class Download {

    private static final String TAG = "OxbowDownload";
    private static final String FOLDER = "Oxbow";
    private static final String COPY_CAPTION = "Copy caption";
    // shortcut: borrows Instagram's fundraiser-link row (copy icon, never on normal posts), so a fundraiser post's own row would also copy the caption; add a dedicated enum value to fix.
    private static final String COPY_CAPTION_OPTION = "COPY_FUNDRAISER_LINK";

    private Download() {}

    /** Instagram's own "Download" string id; the patch rewrites this body with the real one. */
    static int labelRes() {
        return 0;
    }

    /**
     * Hook, called while Instagram builds a post's overflow options: adds its native DOWNLOAD
     * option (own icon, own label) through Instagram's own row adder, found by shape:
     * static (state, Option, creator, CharSequence, ArrayList, boolean).
     */
    public static void addMenuItem(Object creator, ArrayList<Object> options) {
        if (Config.isDownloadEnabled()) addOption(creator, options, "DOWNLOAD", label(creator));
        if (Config.isCopyCaptionEnabled()) addOption(creator, options, COPY_CAPTION_OPTION, COPY_CAPTION);
    }

    private static void addOption(Object creator, ArrayList<Object> options, String name, CharSequence label) {
        try {
            for (Method m : creator.getClass().getDeclaredMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (p.length != 6 || p[2] != creator.getClass() || p[4] != ArrayList.class
                        || p[5] != boolean.class || !p[1].isEnum()
                        || !p[1].getName().endsWith("MediaOption$Option")) continue;
                @SuppressWarnings({"unchecked", "rawtypes"})
                Object option = Enum.valueOf((Class) p[1], name);
                m.setAccessible(true);
                m.invoke(null, null, option, creator, label, options, false);
                return;
            }
            Log.w(TAG, "menu row adder not found");
        } catch (Throwable t) {
            Log.w(TAG, "could not add the menu item", t);
        }
    }

    /**
     * Hook: Instagram shows only a fixed whitelist of options on posts that are not yours
     * (see more / see fewer / report...). Lets DOWNLOAD through, just above Report; the sheet
     * sorts its rows by this list's order.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static List<Object> allowInMenu(List<Object> allowed) {
        try {
            if (allowed.isEmpty()) return allowed;
            Class option = ((Enum) allowed.get(0)).getDeclaringClass();
            List<Object> out = new ArrayList<>(allowed);
            if (Config.isDownloadEnabled()) allowAboveReport(out, option, "DOWNLOAD");
            if (Config.isCopyCaptionEnabled()) allowAboveReport(out, option, COPY_CAPTION_OPTION);
            return out;
        } catch (Throwable t) {
            return allowed;
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static void allowAboveReport(List<Object> out, Class option, String name) {
        Object o = Enum.valueOf(option, name);
        if (out.contains(o)) return;
        int report = out.indexOf(Enum.valueOf(option, "REPORT"));
        out.add(report < 0 ? out.size() : report, o);
    }

    private static String label(Object creator) {
        try {
            for (Field f : creator.getClass().getDeclaredFields()) {
                if (!Context.class.isAssignableFrom(f.getType())) continue;
                f.setAccessible(true);
                Context context = (Context) f.get(creator);
                if (context != null && labelRes() != 0) return context.getString(labelRes());
            }
        } catch (Throwable ignored) {
        }
        return "Download";
    }

    // ---- Stories and highlights: their menu rows are plain labels, matched by text. ----

    private static String storyLabel() {
        try {
            Context context = Config.getAppContext();
            if (context != null && labelRes() != 0) return context.getString(labelRes());
        } catch (Throwable ignored) {
        }
        return "Download";
    }

    private static boolean isStoryLabel(CharSequence label) {
        return label != null && storyLabel().contentEquals(label);
    }

    /** Hook: appends our label to a story menu's label list. */
    public static CharSequence[] addStoryItem(CharSequence[] labels) {
        if (labels == null || !Config.isDownloadEnabled()) return labels;
        for (CharSequence l : labels) if (isStoryLabel(l)) return labels;
        CharSequence[] out = java.util.Arrays.copyOf(labels, labels.length + 1);
        out[labels.length] = storyLabel();
        return out;
    }

    /** Hook: Instagram's native download icon for our row, 0 to let Instagram decide. */
    public static int storyIcon(CharSequence label) {
        return isStoryLabel(label) ? iconOf("DOWNLOAD") : 0;
    }

    private static int iconOf(String name) {
        try {
            Class<?> option = Class.forName("com.instagram.feed.media.mediaoption.MediaOption$Option");
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object value = Enum.valueOf((Class) option, name);
            return option.getField("iconDrawable").getInt(value);
        } catch (Throwable t) {
            return 0;
        }
    }

    /** Hook: true when the tapped story row is ours (then it is handled here). */
    public static boolean storyClick(Object helper, CharSequence label) {
        if (!isStoryLabel(label)) return false;
        Context context = null;
        Object media = null;
        try {
            for (Field f : helper.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                if (context == null && android.app.Activity.class.isAssignableFrom(f.getType())) {
                    context = (Context) f.get(helper);
                } else if (media == null && f.getType().getName().equals("com.instagram.model.reels.ReelItem")) {
                    Object item = f.get(helper);
                    // The story's own media is ReelItem's final Media field.
                    for (Field m : item == null ? new Field[0] : item.getClass().getDeclaredFields()) {
                        if (m.getType().getName().equals("com.instagram.feed.media.Media")
                                && java.lang.reflect.Modifier.isFinal(m.getModifiers())) {
                            m.setAccessible(true);
                            media = m.get(item);
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "story lookup failed", t);
        }
        if (context == null) context = Config.getAppContext();
        if (media == null) toast(context, "Couldn't download this story");
        else download(context, media, -1);
        return true;
    }

    /** Hook: true when the tapped overflow option is Instagram's native DOWNLOAD. */
    public static boolean isDownload(Object option) {
        return Config.isDownloadEnabled()
                && option instanceof Enum && "DOWNLOAD".equals(((Enum<?>) option).name());
    }

    /** Hook: true when the tapped overflow option is one of ours (Download or Copy caption). */
    public static boolean isOurs(Object option) {
        return isDownload(option) || isCopyCaption(option);
    }

    private static boolean isCopyCaption(Object option) {
        return Config.isCopyCaptionEnabled()
                && option instanceof Enum && COPY_CAPTION_OPTION.equals(((Enum<?>) option).name());
    }

    /** Hook: handles a tapped overflow option of ours; {@code index} is the carousel slide on screen. */
    public static void feedClick(Object option, Context context, Object media, int index) {
        if (isCopyCaption(option)) copyCaption(context, media);
        else {
            // A long-press on the row replays its click with this window open: all slides.
            boolean all = SystemClock.uptimeMillis() < sAllSlidesUntil;
            sAllSlidesUntil = 0;
            download(context, media, all ? -1 : index);
        }
    }

    private static long sAllSlidesUntil;

    /**
     * Long-press on the "Download" row of a post's overflow menu saves every slide even with the setting
     * off. The rows are Instagram-built views, so each is found by its label once the sheet is up
     * and its click is replayed with {@link #sAllSlidesUntil} set; a post that is no carousel
     * downloads as usual. Installed by Hiders on the window's layout passes.
     */
    static void holdForAllSlides(View root, Context context) {
        if (!Config.isDownloadEnabled()) return;
        int sheetId = Hiders.resolveId(context, "layout_container_bottom_sheet");
        View sheet = sheetId == 0 ? null : root.findViewById(sheetId);
        if (sheet != null) holdRows(sheet, storyLabel());
    }

    private static void holdRows(View view, String label) {
        if (view instanceof TextView && label.contentEquals(((TextView) view).getText())) {
            View row = (View) view.getParent();
            for (View v : new View[] {view, row}) {
                if (v.isClickable() && !v.hasOnLongClickListeners()) v.setOnLongClickListener(h -> {
                    sAllSlidesUntil = SystemClock.uptimeMillis() + 1500;
                    return h.performClick();
                });
            }
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) holdRows(group.getChildAt(i), label);
        }
    }

    /** Copies the post's caption; never throws. */
    static void copyCaption(Context context, Object media) {
        try {
            Node root = Node.of(media);
            Node caption = root == null ? null : root.tree("caption");
            String text = caption == null ? null : caption.string("text");
            if (text == null || text.isEmpty()) {
                toast(context, "No caption to copy");
                return;
            }
            ((android.content.ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE))
                    .setPrimaryClip(android.content.ClipData.newPlainText("caption", text));
            toast(context, "Caption copied");
        } catch (Throwable t) {
            Log.w(TAG, "copy caption failed", t);
            toast(context, "Couldn't copy the caption");
        }
    }

    // ---- Reels viewer (reels opened from DMs, search...) ----

    /**
     * Hook, as the reels viewer opens one of its menu sheets: adds a Download row (Instagram's
     * own row builder, icon and label) just above the last row (Report). Instagram has six
     * variants of that menu and only some carry its own Download, so this one is ours.
     */
    public static void addClipsRow(Object helper, Object view, Object sheet) {
        if (!(Config.isDownloadEnabled() || Config.isCopyCaptionEnabled()) || helper == null || sheet == null) return;
        try {
            Context context = null;
            Object media = null;
            for (Field f : helper.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                if (context == null && android.app.Activity.class.isAssignableFrom(f.getType())) {
                    context = (Context) f.get(helper);
                } else if (media == null && f.getType().getName().equals("com.instagram.feed.media.Media")) {
                    media = f.get(helper);
                }
            }
            if (context == null || media == null) return;
            java.util.LinkedList<Object> rows = null;
            for (Field f : sheet.getClass().getDeclaredFields()) {
                if (f.getType() != java.util.LinkedList.class) continue;
                f.setAccessible(true);
                rows = (java.util.LinkedList<Object>) f.get(sheet);
            }
            if (rows == null || rows.isEmpty()) return; // sub-sheets start empty
            Method add = null;
            for (Method m : sheet.getClass().getDeclaredMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (p.length == 7 && p[0] == Context.class && p[1] == android.view.View.OnClickListener.class
                        && p[2] == String.class && p[3] == String.class && p[4] == int.class
                        && p[5] == boolean.class && p[6] == boolean.class) add = m;
            }
            if (add == null) return;
            add.setAccessible(true);
            final Context ctx = context;
            final Object item = media;
            if (Config.isDownloadEnabled() && !hasRow(rows, storyLabel())) {
                addClipsRow(add, sheet, rows, ctx, storyLabel(), iconOf("DOWNLOAD"), () -> download(ctx, item, -1));
            }
            if (Config.isCopyCaptionEnabled() && !hasRow(rows, COPY_CAPTION)) {
                addClipsRow(add, sheet, rows, ctx, COPY_CAPTION, iconOf(COPY_CAPTION_OPTION), () -> copyCaption(ctx, item));
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not add the reels menu row", t);
        }
    }

    private static void addClipsRow(Method add, Object sheet, java.util.LinkedList<Object> rows, Context ctx,
            String label, int icon, Runnable action) throws Exception {
        android.view.View.OnClickListener onClick = v -> {
            action.run();
            // Instagram's own rows close the sheet; it lives in the activity, so Back does.
            if (ctx instanceof android.app.Activity) ((android.app.Activity) ctx).onBackPressed();
        };
        add.invoke(sheet, ctx, onClick, label, null, icon, false, false);
        if (rows.size() >= 2) rows.add(rows.size() - 2, rows.removeLast()); // above Report
    }

    private static boolean hasRow(java.util.List<Object> rows, String label) {
        for (Object row : rows) {
            for (Field f : row.getClass().getDeclaredFields()) {
                if (f.getType() != String.class && f.getType() != CharSequence.class) continue;
                try {
                    f.setAccessible(true);
                    Object value = f.get(row);
                    if (value != null && label.contentEquals((CharSequence) value)) return true;
                } catch (Throwable ignored) {
                }
            }
        }
        return false;
    }

    /** Hook: reels menu click. True when it was our Download (then handled here). */
    public static boolean clipsOption(Context context, Object media, Object option) {
        if (!isDownload(option)) return false;
        download(context, media, -1);
        return true;
    }

    // ---- Profile pictures: long-press the avatar on someone's profile ----

    /**
     * Hook on the profile avatar long-press. Saves the HD profile picture and consumes the
     * press (true); false lets Instagram do its own thing (story peek), e.g. on your profile.
     */
    public static boolean profileAvatarLongPress(Object session, String userId) {
        if (!Config.isDownloadEnabled() || session == null || userId == null) return false;
        Context context = Config.getAppContext();
        try {
            Field own = session.getClass().getField("userId");
            if (userId.equals(own.get(session))) return false;
            Object user = cachedUser(session, userId);
            if (user == null) return false;
            String url = hdProfilePicture(user);
            if (url == null) return false;
            Node node = Node.of(user);
            String name = node == null ? null : node.string("username");
            String base = ((name == null ? userId : name) + "_profile_picture").replaceAll("[^A-Za-z0-9._-]", "_");
            enqueue(context, url, base + ".jpg", false);
            toast(context, "Downloading profile picture…");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "profile picture failed", t);
            return false;
        }
    }

    /** UserCache.forSession(session).get(userId), found by shape: the map holding User values. */
    private static Object cachedUser(Object session, String userId) throws Exception {
        ClassLoader cl = session.getClass().getClassLoader();
        Class<?> cacheClass = Class.forName("com.instagram.user.model.UserCache", false, cl);
        Class<?> userClass = Class.forName("com.instagram.user.model.User", false, cl);
        Object cache = null;
        for (Method m : cacheClass.getDeclaredMethods()) {
            if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) && m.getReturnType() == cacheClass
                    && m.getParameterTypes().length == 1 && m.getParameterTypes()[0].isInstance(session)) {
                m.setAccessible(true);
                cache = m.invoke(null, session);
                break;
            }
        }
        if (cache == null) return null;
        for (Field f : cacheClass.getDeclaredFields()) {
            if (!java.util.Map.class.isAssignableFrom(f.getType())) continue;
            f.setAccessible(true);
            Object map = f.get(cache);
            Object user = map == null ? null : ((java.util.Map<?, ?>) map).get(userId);
            if (userClass.isInstance(user)) return user;
        }
        return null;
    }

    /**
     * The widest HD profile picture: hd_profile_pic_url_info through Instagram's own getter
     * (by return type, it also covers users built from JSON), and hd_multiple_profile_picture_urls
     * from the tree.
     */
    private static String hdProfilePicture(Object user) {
        String best = null;
        int bestWidth = -1;
        try {
            for (Method m : user.getClass().getMethods()) {
                if (m.getParameterTypes().length != 0
                        || !m.getReturnType().getName().equals("com.instagram.api.schemas.ProfilePicUrlInfo")) continue;
                Object info = m.invoke(user);
                if (info == null) continue;
                best = (String) info.getClass().getMethod("getUrl").invoke(info);
                Object w = info.getClass().getMethod("getWidth").invoke(info);
                bestWidth = w instanceof Number ? ((Number) w).intValue() : 0;
            }
        } catch (Throwable ignored) {
        }
        try {
            Node node = Node.of(user);
            if (node != null) {
                for (Node c : node.list("hd_multiple_profile_picture_urls")) {
                    String url = c.string("url");
                    if (url != null && c.integer("width") > bestWidth) {
                        best = url;
                        bestWidth = c.integer("width");
                    }
                }
                Node info = best == null ? node.tree("hd_profile_pic_url_info") : null;
                if (info != null) best = info.string("url");
                // The hd field can carry a small variant (seen on Instagram 453), so when what
                // came back is below 1080, upgrade the regular avatar's CDN size segment
                // instead of saving whatever the tree handed over.
                if (bestWidth < 1080) {
                    String small = node.string("profile_pic_url");
                    if (small != null) {
                        best = small.replaceAll("/s\\d+x\\d+/", "/s1080x1080/")
                            .replaceAll("stp=([^&]*?)s\\d+x\\d+", "stp=$1s1080x1080");
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        Log.i(TAG, "profile picture " + bestWidth + "px");
        return best;
    }

    /**
     * Hook: saves the post. {@code index} is the carousel slide on screen, or -1
     * for "all slides". Never throws: a failure must not break Instagram's menu.
     */
    public static void download(Context context, Object media, int index) {
        try {
            Node root = Node.of(media);
            if (root == null) throw new IllegalStateException("no media tree");

            List<Node> items = new ArrayList<>();
            List<Node> carousel = carouselOf(media);
            if (Config.isDownloadAllSlides()) index = -1;
            if (!carousel.isEmpty()) {
                if (index >= 0 && index < carousel.size()) items.add(carousel.get(index));
                else items.addAll(carousel);
            } else {
                items.add(root);
            }

            String base = fileBase(root);
            int saved = 0;
            for (int i = 0; i < items.size(); i++) {
                String[] best = bestUrl(items.get(i));
                if (best == null) continue;
                String suffix = items.size() > 1 ? "_" + (i + 1) : (carousel.size() > 1 ? "_" + (index + 1) : "");
                enqueue(context, best[0], base + suffix + best[1], ".mp4".equals(best[1]));
                saved++;
            }
            if (saved == 0) throw new IllegalStateException("no downloadable url");
            toast(context, saved == 1 ? "Downloading…" : "Downloading " + saved + " items…");
        } catch (Throwable t) {
            Log.w(TAG, "download failed", t);
            toast(context, "Couldn't download this post");
        }
    }

    /** Name of Media's carousel_media getter (List of Media); the patch rewrites this body. */
    static String carouselGetter() {
        return null;
    }

    /**
     * Carousel slides as nodes. Read through Media's own getter: it wraps each slide in a
     * Media of its own, whereas slides read straight off the tree carry no field schema.
     */
    private static List<Node> carouselOf(Object media) throws Exception {
        List<Node> out = new ArrayList<>();
        if (carouselGetter() == null) return out;
        Object slides = media.getClass().getMethod(carouselGetter()).invoke(media);
        if (slides instanceof List) {
            for (Object slide : (List<?>) slides) {
                Node node = slide == null ? null : Node.of(slide);
                if (node != null) out.add(node);
            }
        }
        return out;
    }

    /** {url, extension} of the largest video, else the largest image. */
    static String[] bestUrl(Node item) {
        String video = largest(item.list("video_versions"));
        if (video != null) return new String[] {video, ".mp4"};
        Node images = item.tree("image_versions2");
        String image = images == null ? null : largest(images.list("candidates"));
        return image == null ? null : new String[] {image, ".jpg"};
    }

    private static String largest(List<Node> candidates) {
        String best = null;
        long bestArea = -1;
        for (Node c : candidates) {
            String url = c.string("url");
            long area = (long) c.integer("width") * c.integer("height");
            if (url != null && area > bestArea) {
                best = url;
                bestArea = area;
            }
        }
        return best;
    }

    /** "username_shortcode", safe for file names. */
    static String fileBase(Node root) {
        Node user = root.tree("user");
        String name = user == null ? null : user.string("username");
        String code = root.string("code");
        String base = (name == null ? "instagram" : name) + "_" + (code == null ? System.currentTimeMillis() : code);
        return base.replaceAll("[^A-Za-z0-9._-]", "_");
    }

    /**
     * One Pando node read by API field name: the Media's LiveTreeJNI at the root, TreeJNI
     * below it. Both key fields by String.hashCode(); only the getter names differ.
     */
    static final class Node {
        private final Object target;
        private final boolean live;
        private final Class<?> treeClass;

        private Node(Object target, boolean live, Class<?> treeClass) {
            this.target = target;
            this.live = live;
            this.treeClass = treeClass;
        }

        static Node of(Object media) throws Exception {
            for (Class<?> c = media.getClass(); c != null; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (!f.getType().getName().equals("com.instagram.pando.livetree.LiveTreeJNI")) continue;
                    f.setAccessible(true);
                    Object liveTree = f.get(media);
                    if (liveTree == null) continue;
                    Class<?> tree = Class.forName("com.facebook.pando.TreeJNI", false, media.getClass().getClassLoader());
                    return new Node(liveTree, true, tree);
                }
            }
            return null;
        }

        private Object call(String liveName, String treeName, String field, boolean withClass) {
            try {
                String name = live ? liveName : treeName;
                Method m = withClass
                        ? target.getClass().getMethod(name, int.class, Class.class)
                        : target.getClass().getMethod(name, int.class);
                return withClass ? m.invoke(target, field.hashCode(), treeClass) : m.invoke(target, field.hashCode());
            } catch (Throwable t) {
                return null; // missing field or getter: treated as absent
            }
        }

        Node tree(String field) {
            Object o = call("getOptionalTreeValueNative", "getTreeValueByHashCode", field, true);
            return o == null ? null : new Node(o, false, treeClass);
        }

        List<Node> list(String field) {
            List<Node> out = new ArrayList<>();
            Object o = call("getOptionalTreeListNative", "getOptionalTreeListByHashCode", field, true);
            if (o instanceof List) for (Object e : (List<?>) o) if (e != null) out.add(new Node(e, false, treeClass));
            return out;
        }

        String string(String field) {
            Object o = call("getOptionalStringValueNative", "getStringValueByHashCode", field, false);
            return o instanceof String ? (String) o : null;
        }

        int integer(String field) {
            Object o = call("getOptionalIntValueNative", "getOptionalIntValueByHashCode", field, false);
            return o instanceof Integer ? (Integer) o : 0;
        }
    }

    private static void enqueue(Context context, String url, String fileName, boolean video) {
        DownloadManager dm = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                .setTitle(fileName)
                .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                .setDestinationInExternalPublicDir(
                        video ? Environment.DIRECTORY_MOVIES : Environment.DIRECTORY_PICTURES,
                        FOLDER + "/" + fileName);
        dm.enqueue(request);
    }

    private static void toast(Context context, String text) {
        try {
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }
}
