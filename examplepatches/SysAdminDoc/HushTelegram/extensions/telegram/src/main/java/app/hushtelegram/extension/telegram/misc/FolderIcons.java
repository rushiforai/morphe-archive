/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Folder icons (#53). Telegram 13.1 draws none: a folder keeps a name and a color, and its tab
 * shows the name. HushTelegram draws its own, from icon packs, beside the folders it lists itself.
 * Each icon is picked from the folder's name, so Work gets a briefcase and Friends a group, and
 * a name it doesn't know gets a plain folder. Off, or paused, nothing is drawn.
 *
 * <p>The packs are three weights of Phosphor Icons, MIT licensed (see {@link FolderIconData}).
 */
public final class FolderIcons {
    private FolderIcons() {}

    /** The saved choice for no icons. */
    public static final String OFF = "";
    public static final String REGULAR = "regular";
    public static final String BOLD = "bold";
    public static final String FILL = "fill";

    /** The packs in the order the choice list shows them, with no icons first. */
    public static final List<String> CHOICES = Collections.unmodifiableList(Arrays.asList(OFF, REGULAR, BOLD, FILL));

    /** What each icon's drawing is measured on. */
    static final float VIEW_BOX = 256f;

    /** The icons the choice list previews, so each pack's weight shows. */
    private static final String[] PREVIEW = {"folder", "briefcase", "users", "star"};

    /**
     * The words that pick an icon, in the order they're tried. A word matches a name's word when
     * they're equal, or when it has four or more letters and the name's word starts with it, so
     * "friend" takes "Friends" and "bot" takes only "Bot".
     */
    private static final String[][] WORDS = {
            {"address-book", "contact", "contacts"},
            {"user", "personal", "private", "non", "self", "me"},
            {"briefcase", "work", "job", "jobs", "office", "business", "company", "project", "client", "career", "colleague"},
            {"house", "home", "house"},
            {"users", "group", "family", "friend", "people", "team", "community", "club", "neighbor"},
            {"megaphone", "channel", "broadcast", "announce"},
            {"robot", "bot", "ai"},
            {"bell", "unmuted", "notification", "alert"},
            {"envelope", "unread", "mail", "email", "inbox"},
            {"star", "favorite", "favourite", "star", "important", "pinned", "vip", "best"},
            {"heart", "love", "heart", "dating", "partner", "wife", "husband", "girlfriend", "boyfriend"},
            {"game-controller", "game", "gaming", "play", "fun"},
            {"shopping-cart", "shop", "shopping", "store", "buy", "order", "deal", "sale"},
            {"airplane", "travel", "trip", "flight", "vacation", "holiday", "tour"},
            {"graduation-cap", "school", "study", "class", "university", "college", "learn", "course", "education"},
            {"newspaper", "news", "read", "reading", "blog", "press"},
            {"currency-dollar", "money", "finance", "bank", "crypto", "pay", "bill", "invest", "trading", "coin"},
            {"archive", "archive", "archived", "old"},
            {"chat-circle", "chat", "message", "dm", "talk", "all"},
    };

    private static final String FALLBACK = "folder";

    private static final Map<String, Path> PATHS = new HashMap<>();

    /** Whether [value] is one of the packs, the way a settings file or the row saves it. */
    public static boolean allowed(String value) {
        return value != null && CHOICES.contains(value);
    }

    /** The pack in use now: one of {@link #CHOICES}, and {@link #OFF} when none is picked, anything else is saved, or HushTelegram is paused. */
    public static String pack() {
        if (!Utils.settingsReady()) return OFF;
        String saved = Settings.FOLDER_ICON_PACK.get();
        return allowed(saved) ? saved : OFF;
    }

    /** The name of the icon a folder called [folderName] gets. */
    public static String iconFor(String folderName) {
        if (folderName == null) return FALLBACK;
        String[] words = folderName.toLowerCase(Locale.ROOT).split("[^\\p{L}\\p{N}]+");
        for (String[] rule : WORDS) {
            for (String word : words) {
                if (word.isEmpty()) continue;
                for (int i = 1; i < rule.length; i++) {
                    String key = rule[i];
                    if (word.equals(key) || word.equals(key + "s") || key.length() >= 4 && word.startsWith(key)) return rule[0];
                }
            }
        }
        return FALLBACK;
    }

    /** The name rules, each led by the icon it picks. */
    static String[][] rulesForTests() {
        return WORDS.clone();
    }

    /** The icon names the packs hold. */
    static List<String> icons() {
        return Collections.unmodifiableList(Arrays.asList(FolderIconData.NAMES));
    }

    /** The drawing of [icon] in [pack], or null when there's no such pack or icon. */
    static String data(String pack, String icon) {
        int index = icons().indexOf(icon);
        if (index < 0) return null;
        switch (pack == null ? "" : pack) {
            case REGULAR:
                return FolderIconData.REGULAR[index];
            case BOLD:
                return FolderIconData.BOLD[index];
            case FILL:
                return FolderIconData.FILL[index];
            default:
                return null;
        }
    }

    /** An icon of [pack] drawn [size] pixels square in [color], or null for no pack or an icon it lacks. */
    public static Drawable drawable(String pack, String icon, int size, int color) {
        Path path = path(pack, icon);
        return path == null ? null : new Icon(path, size, color);
    }

    /** The icon a folder called [folderName] gets in [pack], or null for no pack. */
    public static Drawable forFolder(String pack, String folderName, int size, int color) {
        return drawable(pack, iconFor(folderName), size, color);
    }

    /** A few icons of [pack] side by side, which the choice list uses to show a pack's weight; null for no pack. */
    public static Drawable preview(String pack, int size, int gap, int color) {
        Icon[] icons = new Icon[PREVIEW.length];
        for (int i = 0; i < icons.length; i++) {
            Path path = path(pack, PREVIEW[i]);
            if (path == null) return null;
            icons[i] = new Icon(path, size, color);
        }
        return new Strip(icons, size, gap);
    }

    private static synchronized Path path(String pack, String icon) {
        String data = data(pack, icon);
        if (data == null) return null;
        String key = pack + "/" + icon;
        Path cached = PATHS.get(key);
        if (cached == null) {
            cached = build(data);
            PATHS.put(key, cached);
        }
        return cached;
    }

    /** The drawing as a path in the icon's own units. */
    static Path build(String data) {
        Path path = new Path();
        FolderIconPath.parse(data, new FolderIconPath.Sink() {
            @Override public void moveTo(float x, float y) { path.moveTo(x, y); }
            @Override public void lineTo(float x, float y) { path.lineTo(x, y); }
            @Override public void cubicTo(float x1, float y1, float x2, float y2, float x, float y) { path.cubicTo(x1, y1, x2, y2, x, y); }
            @Override public void close() { path.close(); }
        });
        return path;
    }

    /** One icon, scaled to its bounds. */
    private static final class Icon extends Drawable {
        private final Path path;
        private final int size;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Icon(Path path, int size, int color) {
            this.path = path;
            this.size = size;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(color);
            setBounds(0, 0, size, size);
        }

        @Override public void draw(Canvas canvas) {
            int saved = canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / VIEW_BOX, getBounds().height() / VIEW_BOX);
            canvas.drawPath(path, paint);
            canvas.restoreToCount(saved);
        }

        @Override public int getIntrinsicWidth() { return size; }

        @Override public int getIntrinsicHeight() { return size; }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }

        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** Several icons in a row. */
    private static final class Strip extends Drawable {
        private final Icon[] icons;
        private final int size;
        private final int gap;

        Strip(Icon[] icons, int size, int gap) {
            this.icons = icons;
            this.size = size;
            this.gap = gap;
            setBounds(0, 0, getIntrinsicWidth(), size);
        }

        @Override public void draw(Canvas canvas) {
            int saved = canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            for (Icon icon : icons) {
                icon.draw(canvas);
                canvas.translate(size + gap, 0);
            }
            canvas.restoreToCount(saved);
        }

        @Override public int getIntrinsicWidth() { return icons.length * size + (icons.length - 1) * gap; }

        @Override public int getIntrinsicHeight() { return size; }

        @Override public void setAlpha(int alpha) {
            for (Icon icon : icons) icon.setAlpha(alpha);
        }

        @Override public void setColorFilter(ColorFilter filter) {
            for (Icon icon : icons) icon.setColorFilter(filter);
        }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
