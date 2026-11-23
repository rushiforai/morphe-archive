package app.mightymorphing.extension.joey;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.util.SparseIntArray;

/**
 * Icon packs for Modern UI. Each pack replaces about twenty of Joey's icons (votes, save,
 * comment, share, menu and so on). Joey loads its icons through AppCompat and through its own
 * helper, and both now ask here for the drawable id to use. The pack is read once per launch,
 * so a change applies after a restart. With Modern off, or the Joey pack, nothing changes.
 */
public final class ModernIcons {
    static final String KEY = "icon_pack";
    static final String[] IDS = {"", "chunky", "rounded", "capsule", "atomic", "deco"};
    static final String[] NAMES = {
            "Joey (default)", "Chunky Silhouette", "Soft Rounded", "Capsule Rams",
            "Mid-Century Atomic", "Streamline Deco",
    };

    /** Joey's drawables that a pack replaces. Pack files are mm_icon_<pack>_<name>. */
    private static final String[] JOEY = {
            "upvote_arrow_outline", "upvote_arrow_filled", "downvote_arrow_outline", "downvote_arrow_filled",
            "star_outline", "star", "commentoutline", "share", "more", "menu", "search", "reply_outline",
            "link", "download", "home", "settings_outline", "award_outline", "checkbox_marked",
            "alert_circle", "earth",
            // Second batch
            "eye_off_outline", "mic_outline", "text_content_type", "weblink", "tts", "pencil_outline", "delete",
            "double_up", "up", "down", "show_more", "sort", "refresh", "time", "slideshow", "filter_outline",
            "flag_outline", "block", "copy", "openexternally", "live", "routes", "pan_up", "previous", "next",
            "play", "stop", "compass", "arrow_back_ios", "lock_outline", "archive_outline", "info_outline",
            "share_variant", "plus", "plus_outline", "label_outline", "email_outline", "shield_outline",
            "book_open_variant", "bookmark_plus_outline", "close", "save_as_floppy", "add_friend", "message_plus",
            "dots_horizontal", "quill", "list_bulleted_type", "notification_remove_all", "animation_outline",
            "bold", "bulletlist", "clear_format", "code", "emoticon_open_mouth", "folder_outline", "fpe",
            "heading", "image_outline", "italic", "numberslist", "preview", "quote", "redo", "strikethrough",
            "superscript", "table", "undo",
    };

    /**
     * Joey wraps some icons in an *_inset drawable (a plain wrapper with no inset values), and a few of
     * its names differ from the pack's. Pairs of {Joey drawable, pack icon name}.
     */
    private static final String[][] ALIASES = {
            {"arrow_up_bold_inset", "pan_up"}, {"eye_off_inset", "eye_off_outline"},
            {"reply_inset", "reply_outline"}, {"close_inset", "close"}, {"plus_inset", "plus"},
            {"message_plus_inset", "message_plus"}, {"quill_inset", "quill"},
            {"list_bulleted_type_inset", "list_bulleted_type"},
            {"notification_remove_all_inset", "notification_remove_all"},
    };

    /** A few icons from a pack, for the picker. Zero when the pack lacks one. */
    static final String[] SAMPLE = {"upvote_arrow_outline", "commentoutline", "share", "star_outline", "award_outline"};

    static int sampleId(Context context, String pack, String name) {
        Resources res = context.getResources();
        String pkg = context.getPackageName();
        return res.getIdentifier(pack.isEmpty() ? name : "mm_icon_" + pack + "_" + name, "drawable", pkg);
    }

    /** The pack's drawable for a Joey drawable name, or null when the pack does not replace it. */
    static android.graphics.drawable.Drawable packed(Context context, String name) {
        try {
            int from = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
            if (from == 0) return null;
            int to = swap(context, from);
            return to == from ? null : context.getDrawable(to);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static volatile SparseIntArray sMap;

    private ModernIcons() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE);
    }

    static String saved(Context context) {
        return prefs(context).getString(KEY, "");
    }

    static void save(Context context, String pack) {
        prefs(context).edit().putString(KEY, pack).commit();
    }

    static int index(String pack) {
        for (int i = 0; i < IDS.length; i++) if (IDS[i].equals(pack)) return i;
        return 0;
    }

    /** The pack this launch is using, which can differ from the saved one until a restart. */
    static String running(Context context) {
        String pack = sRunning;
        return pack != null ? pack : saved(context);
    }

    private static volatile String sRunning;

    /** f.a.b (AppCompatResources.getDrawable) and zd.x0.e. Returns the id to load instead. */
    public static int swap(Context context, int id) {
        SparseIntArray map = sMap;
        if (map == null) map = build(context);
        return map.get(id, id);
    }

    private static synchronized SparseIntArray build(Context context) {
        if (sMap != null) return sMap;
        SparseIntArray map = new SparseIntArray();
        try {
            Context source = context != null ? context : ModernUi.getContext();
            if (source != null) {
                String pack = saved(source);
                sRunning = pack;
                if (!pack.isEmpty() && ModernUi.isModernUiEnabled(source)) {
                    Resources res = source.getResources();
                    String pkg = source.getPackageName();
                    for (String name : JOEY) {
                        int from = res.getIdentifier(name, "drawable", pkg);
                        int to = res.getIdentifier("mm_icon_" + pack + "_" + name, "drawable", pkg);
                        if (from != 0 && to != 0) map.put(from, to);
                    }
                    for (String[] alias : ALIASES) {
                        int from = res.getIdentifier(alias[0], "drawable", pkg);
                        int to = res.getIdentifier("mm_icon_" + pack + "_" + alias[1], "drawable", pkg);
                        if (from != 0 && to != 0) map.put(from, to);
                    }
                    for (String name : JOEY) {
                        int from = res.getIdentifier(name + "_inset", "drawable", pkg);
                        int to = res.getIdentifier("mm_icon_" + pack + "_" + name, "drawable", pkg);
                        if (from != 0 && to != 0 && map.indexOfKey(from) < 0) map.put(from, to);
                    }
                }
            } else {
                // Too early to know. Ask again next time.
                return map;
            }
        } catch (Throwable ignored) {
        }
        sMap = map;
        return map;
    }
}
