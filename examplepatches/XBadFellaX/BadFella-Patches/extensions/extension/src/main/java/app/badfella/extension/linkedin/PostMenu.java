package app.badfella.extension.linkedin;

import android.app.Activity;
import android.net.Uri;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Adds Copy text, Download photos and videos, and Save document as PDF to the ⋯ menu of feed posts.
 * <p>
 * The menu is a server driven page (feed-control-menu-page) with one row per item (feed-control-menu-save, ...).
 * The Save row is copied with its label replaced and its tap action (the component's triggers) replaced by a
 * navigate to URL action for badfellapatches://post/{action}?u={post}, which PostActionActivity handles. LinkedIn
 * starts external URLs with an ACTION_VIEW intent, the same way BadFella Patches' Settings row worked.
 * <p>
 * The text, media and document of a post are remembered when the feed loads it (feed-full-update), by the post's
 * URNs, which the menu page carries too.
 */
final class PostMenu {
    static final String SCHEME = "badfellapatches";
    static final String HOST = "post";

    private static final String PAGE = "feed-control-menu-page";
    private static final String ROW_MARKER = "feed-control-menu-";
    private static final String TEMPLATE = "feed-control-menu-save";
    private static final Pattern POST_URN = Pattern.compile("urn:li:(?:activity|ugcPost|share):\\d+");
    private static final Pattern DOCUMENT_URN = Pattern.compile("urn:li:digitalmediaAsset:([A-Za-z0-9_-]+)");

    /** Field of a component holding its tap action (Component.triggers), and the wrapper of a URL action. */
    private static final int TRIGGERS_FIELD = 25;
    private static final int VIEW_TRACKING_FIELD = 26;
    private static final int ACTION_TYPE = 26628;
    private static final int URL_NAVIGATION_TYPE_EXTERNAL = 1;

    private static final int MAX_POSTS = 300;

    static final class Post {
        String text;
        List<MediaItem> media = new ArrayList<>();
        Set<String> documentIds = new LinkedHashSet<>();
    }

    private static final Map<String, Post> posts = new LinkedHashMap<String, Post>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Post> eldest) {
            return size() > MAX_POSTS;
        }
    };

    /** Signatures of recently remembered payloads.
     *  feed-full-update components are transformed again for every viewport-visibility sample while a post is on
     *  screen, and nothing in the post changes between those samples, so the same payload is parsed only once. */
    private static final Map<Long, Boolean> remembered = new LinkedHashMap<Long, Boolean>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Long, Boolean> eldest) {
            return size() > MAX_POSTS;
        }
    };

    private static long signature(byte[] payload) {
        return ((long) payload.length << 32) ^ Arrays.hashCode(payload);
    }

    private PostMenu() {
    }

    // region Remembering posts

    /** Called with the payload of every feed post (feed-full-update). */
    static void remember(byte[] payload) {
        if (payload == null || !Settings.postMenu()) return;
        long signature = signature(payload);
        synchronized (remembered) {
            if (remembered.containsKey(signature)) return;
        }
        try {
            ProtoScanner scanner = ProtoScanner.scan(payload);
            List<String> strings = scanner.strings;
            Set<String> urns = new LinkedHashSet<>();
            Post post = new Post();
            for (String s : strings) {
                Matcher m = POST_URN.matcher(s);
                while (m.find()) urns.add(m.group());
                Matcher d = DOCUMENT_URN.matcher(s);
                while (d.find()) post.documentIds.add(d.group(1));
            }
            if (!urns.isEmpty()) {
                post.text = PostCommentary.text(payload);
                post.media = MediaItem.extract(scanner, false);
                synchronized (posts) {
                    for (String urn : urns) posts.put(urn, post);
                }
            }
            synchronized (remembered) {
                remembered.put(signature, Boolean.TRUE);
            }
        } catch (Throwable t) {
            Diagnostics.error("post menu remember failed", t);
        }
    }

    // endregion

    // region The menu

    /** Called with every SDUI component before it is transformed; returns it, or a copy with the items added. */
    static Object inject(Object component, byte[] bytes) {
        try {
            if (!Settings.postMenu() || bytes == null || !ProtoEdit.contains(bytes, PAGE)
                    || !ProtoEdit.contains(bytes, TEMPLATE) || ProtoEdit.contains(bytes, SCHEME + "://")) {
                return component;
            }
            String urn = null;
            for (String s : ProtoScanner.scan(bytes).strings) {
                Matcher m = POST_URN.matcher(s);
                if (m.find()) {
                    urn = m.group();
                    break;
                }
            }
            if (urn == null) return component;
            Post post;
            synchronized (posts) {
                post = posts.get(urn);
            }
            List<String[]> items = new ArrayList<>();
            if (post == null || post.text != null) {
                items.add(new String[]{"copy", I18n.tr("Copy text"), "badfella-post-copy-text"});
            }
            if (post != null && !post.media.isEmpty()) {
                items.add(new String[]{"download", I18n.tr("Download photos and videos"), "badfella-post-download"});
            }
            if (post != null && document(post) != null) {
                items.add(new String[]{"pdf", I18n.tr("Save document as PDF"), "badfella-post-pdf"});
            }
            if (items.isEmpty()) return component;
            byte[] edited = addRows(bytes, urn, items);
            if (edited == null) return component;
            Object copy = component.getClass().getMethod("parseFrom", byte[].class).invoke(null, (Object) edited);
            Settings.debugLog("post menu: added " + items.size() + " items");
            return copy != null ? copy : component;
        } catch (Throwable t) {
            Diagnostics.error("post menu failed", t);
            return component;
        }
    }

    /** Walks down to the message whose repeated field holds the rows and inserts the new rows after Save. */
    private static byte[] addRows(byte[] message, String urn, List<String[]> items) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null) return null;
        int rows = 0;
        for (ProtoEdit.Field field : fields) {
            if (isRow(field)) rows++;
        }
        for (int i = 0; i < fields.size(); i++) {
            ProtoEdit.Field field = fields.get(i);
            if (field.wireType != 2 || field.number == VIEW_TRACKING_FIELD || !ProtoEdit.contains(field.data, TEMPLATE)) {
                continue;
            }
            if (rows > 1) {
                for (int k = items.size() - 1; k >= 0; k--) {
                    String[] item = items.get(k);
                    ProtoEdit.Field row = row(field, urn, item[0], item[1], item[2]);
                    if (row == null) return null;
                    fields.add(i + 1, row);
                }
            } else {
                byte[] inner = addRows(field.data, urn, items);
                if (inner == null) return null;
                field.data = inner;
            }
            return ProtoEdit.write(fields);
        }
        return null;
    }

    private static boolean isRow(ProtoEdit.Field field) {
        return field.wireType == 2 && field.number != VIEW_TRACKING_FIELD && ProtoEdit.contains(field.data, ROW_MARKER)
                && !ProtoEdit.contains(field.data, PAGE);
    }

    /** A copy of the Save row with our label, view name and action; null if the row's layout is unexpected. */
    private static ProtoEdit.Field row(ProtoEdit.Field template, String urn, String action, String label, String viewName) {
        ProtoEdit.Field row = template.copy();
        List<ProtoEdit.Field> fields = ProtoEdit.parse(row.data);
        if (fields == null) return null;
        boolean direct = false;
        for (ProtoEdit.Field field : fields) if (field.number == TRIGGERS_FIELD && field.wireType == 2) direct = true;
        if (!direct) {
            // A row in a wrapper: copy the wrapper and edit the row inside it.
            boolean edited = false;
            for (ProtoEdit.Field field : fields) {
                if (field.wireType == 2 && field.number != VIEW_TRACKING_FIELD && ProtoEdit.contains(field.data, TEMPLATE)) {
                    ProtoEdit.Field inner = row(field, urn, action, label, viewName);
                    if (inner == null) return null;
                    field.data = inner.data;
                    edited = true;
                }
            }
            if (!edited) return null;
            row.data = relabel(ProtoEdit.write(fields), label, viewName);
            return row;
        }
        List<ProtoEdit.Field> kept = new ArrayList<>();
        boolean replaced = false;
        for (ProtoEdit.Field field : fields) {
            if (field.number == TRIGGERS_FIELD) {
                if (!replaced) kept.add(urlAction(url(action, urn)));
                replaced = true;
            } else {
                kept.add(field);
            }
        }
        MenuIconIds.Result icons = new MenuIconIds.Result();
        byte[] built = MenuIconIds.swap(ProtoEdit.write(kept), action, icons);
        row.data = relabel(built, label, viewName);
        return row;
    }

    /**
     * Replaces the view name, and the Save label in any language: the shortest plain text of the row. Other plain
     * texts (a subtitle such as "Save for later") are cleared, so they don't describe Save under the new label.
     */
    private static byte[] relabel(byte[] data, String label, String viewName) {
        byte[] result = ProtoEdit.replaceString(data, TEMPLATE, viewName);
        List<String> texts = new ArrayList<>();
        for (String s : ProtoScanner.scan(result).strings) {
            if (s.length() > 60 || s.trim().isEmpty() || s.equals(viewName) || s.contains(":") || s.contains("/")
                    || s.contains("-") || s.contains("_") || texts.contains(s)) {
                continue;
            }
            texts.add(s);
        }
        if (texts.isEmpty()) return result;
        String shortest = texts.get(0);
        for (String s : texts) if (s.length() < shortest.length()) shortest = s;
        for (String s : texts) result = ProtoEdit.replaceString(result, s, s.equals(shortest) ? label : "");
        return result;
    }

    private static String url(String action, String urn) {
        return SCHEME + "://" + HOST + "/" + action + "?u=" + Uri.encode(urn);
    }

    /** { 1: { 5: { 1: ACTION_TYPE, 2: { 2: { 1: url, 2: External } } } }, 2: "" } as in LinkedIn's Help Center link. */
    private static ProtoEdit.Field urlAction(String url) {
        return ProtoEdit.message(TRIGGERS_FIELD,
                ProtoEdit.message(1,
                        ProtoEdit.message(5,
                                ProtoEdit.varintField(1, ACTION_TYPE),
                                ProtoEdit.message(2,
                                        ProtoEdit.message(2,
                                                ProtoEdit.string(1, url),
                                                ProtoEdit.varintField(2, URL_NAVIGATION_TYPE_EXTERNAL))))),
                ProtoEdit.string(2, ""));
    }

    // endregion

    // region Actions (PostActionActivity)

    static void perform(Activity activity, Uri uri) {
        String action = uri.getLastPathSegment();
        String urn = uri.getQueryParameter("u");
        Post post;
        synchronized (posts) {
            post = urn == null ? null : posts.get(urn);
        }
        if (post == null) {
            Downloads.toast(activity, "Scroll to the post again, then try once more");
            return;
        }
        switch (action == null ? "" : action) {
            case "copy":
                if (post.text == null) {
                    Downloads.toast(activity, "This post has no text");
                } else {
                    TextSelectionOverlay.copy(activity, post.text);
                }
                break;
            case "download":
                int started = 0;
                boolean allVideos = true;
                for (MediaItem item : post.media) {
                    if (Downloads.enqueue(activity, item.url, item.assetId, item.video)) started++;
                    allVideos &= item.video;
                }
                if (started > 0) Downloads.toastStarted(activity, started, allVideos);
                break;
            case "pdf":
                DocumentPdf.Doc doc = document(post);
                if (doc == null) {
                    Downloads.toast(activity, "Open the document once, then try again");
                } else {
                    DocumentPdf.save(activity, doc);
                }
                break;
            default:
                break;
        }
    }

    private static DocumentPdf.Doc document(Post post) {
        for (String id : post.documentIds) {
            DocumentPdf.Doc doc = DocumentPdf.byId(id);
            if (doc != null) return doc;
        }
        return null;
    }

    // endregion
}
