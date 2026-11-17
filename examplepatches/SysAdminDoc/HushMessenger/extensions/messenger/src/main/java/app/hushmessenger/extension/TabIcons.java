package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * #186: plain outlined icons in the bar at the bottom, and a picture of your own on any tab. The bar builds one icon
 * per tab, and the patch hands each drawable over on its way in, named for the tab that drew it, so a tab keeps its own
 * icon and nothing else in the bar moves.
 *
 * <p>An outlined icon takes the color Messenger drew the stock one in, read off that drawable as it arrives, so the
 * selected tab stays the colored one and a dark theme stays dark. A picture of your own keeps its own colors. Off,
 * Pause, safe mode, a tab Hush has no icon for and every failure keep Messenger's own icon.
 */
public final class TabIcons {
    static final String KEY = "tab_icons";
    /** The tabs the settings page offers a picture for, in the order the bar draws them. */
    static final String[] SHOWN = {"inbox", "montage", "people", "calls", "metaai", "jewel", "more", "mesetting"};
    /** A tab's key, as the patch writes it: the name of the tab's own plugin class, lowercased. */
    private static final Pattern NAME = Pattern.compile("[a-z][a-z0-9]{1,39}");
    /** The copy of a picked picture, in Messenger's files. */
    static final String PICTURE = "hushmessenger-tab-";
    /** A tab icon draws about 24 dp, so this stays sharp on every phone and the file stays small. */
    static final int MAX_SIDE = 128;
    /** The size an icon takes when Messenger's own drawable says nothing, in dp. */
    static final int FALLBACK_SIDE_DP = 24;
    /** How opaque a pixel has to be to count towards the color an outlined icon takes. */
    private static final int SOLID = 200;

    /** The outlined icon each tab takes while it has no picture of its own. */
    private static final Map<String, String> PLAIN = new LinkedHashMap<>();

    static {
        PLAIN.put("inbox", SettingsIcons.CHATS);
        PLAIN.put("montage", SettingsIcons.STORIES);
        PLAIN.put("people", SettingsIcons.PERSON);
        PLAIN.put("calls", SettingsIcons.PHONE);
        PLAIN.put("metaai", SettingsIcons.AI);
        PLAIN.put("muse", SettingsIcons.AI);
        PLAIN.put("jewel", SettingsIcons.FEED);
        PLAIN.put("more", SettingsIcons.MENU);
        PLAIN.put("mesetting", SettingsIcons.SETTINGS);
        PLAIN.put("search", SettingsIcons.SEARCH);
        PLAIN.put("games", SettingsIcons.PLAYBACK);
        PLAIN.put("homebase", SettingsIcons.PLACE);
        PLAIN.put("closefriends", SettingsIcons.LIKE);
        PLAIN.put("businesstools", SettingsIcons.TOOLS);
        PLAIN.put("privatereply", SettingsIcons.COMMENTS);
        PLAIN.put("socialmessengercreation", SettingsIcons.WRITING);
    }

    /** Each tab's picture, read again only when its file changed. */
    private static final Map<String, Bitmap> PICTURES = new HashMap<>();
    private static final Map<String, String> READ_AT = new HashMap<>();

    private TabIcons() { }

    /**
     * The icon the tab named [key] draws: your picture, a plain outlined one, or Messenger's own. Never throws, and
     * never returns null, so the register the patch reads this back into holds a drawable either way.
     */
    public static Drawable tabIcon(Drawable stock, String key) {
        try {
            if (key == null || !NAME.matcher(key).matches() || !Settings.wouldUse(KEY)) return stock;
            Context context = Settings.appContext;
            if (context == null) return stock;
            Drawable made = make(context, key, stock);
            if (made == null) return stock;
            Settings.activeAt.put(KEY, System.currentTimeMillis());
            return made;
        } catch (RuntimeException | OutOfMemoryError error) {
            Settings.hookFailed(KEY, "Can't put your tab icon in", error);
            return stock;
        }
    }

    /** The icon for [key], or null to keep Messenger's own. */
    private static Drawable make(Context context, String key, Drawable stock) {
        int side = side(stock);
        Bitmap picture = picture(file(context, key));
        if (picture != null) return draw(context, picture, side, null);
        String plain = PLAIN.get(key);
        if (plain == null) return null;
        Integer color = colorOf(stock, side);
        // A drawable that hasn't loaded has no color to take, and a guess would be the wrong one in a dark theme.
        return color == null ? null : draw(context, SettingsIcons.bitmap(plain), side, color);
    }

    /** The side Messenger drew its own icon at, so a replacement sits where the stock one did. */
    private static int side(Drawable stock) {
        int width = stock == null ? 0 : stock.getIntrinsicWidth();
        int height = stock == null ? 0 : stock.getIntrinsicHeight();
        int side = Math.max(width, height);
        if (side > 0) return side;
        return Math.round(FALLBACK_SIDE_DP * android.content.res.Resources.getSystem().getDisplayMetrics().density);
    }

    /** [source] drawn to a square of [side], whole and centered, in [tint] when there is one. */
    private static Drawable draw(Context context, Bitmap source, int side, Integer tint) {
        Bitmap fit = Bitmap.createBitmap(side, side, Bitmap.Config.ARGB_8888);
        float scale = Math.min(side / (float) source.getWidth(), side / (float) source.getHeight());
        int width = Math.max(1, Math.round(source.getWidth() * scale));
        int height = Math.max(1, Math.round(source.getHeight() * scale));
        int left = (side - width) / 2, top = (side - height) / 2;
        new Canvas(fit).drawBitmap(source, null, new Rect(left, top, left + width, top + height), null);
        fit.setDensity(Bitmap.DENSITY_NONE);
        BitmapDrawable made = new BitmapDrawable(context.getResources(), fit);
        made.setTargetDensity(Bitmap.DENSITY_NONE);
        if (tint != null) made.setTint(tint);
        return made;
    }

    /**
     * The color Messenger drew [stock] in: the solid pixel that comes up most often once it's drawn. Null when it draws
     * nothing solid, which is a drawable still loading or one that's all but see-through.
     */
    static Integer colorOf(Drawable stock, int side) {
        if (stock == null) return null;
        int at = Math.max(1, Math.min(side, 48));
        Bitmap shot = Bitmap.createBitmap(at, at, Bitmap.Config.ARGB_8888);
        Rect was = new Rect(stock.getBounds());
        try {
            stock.setBounds(0, 0, at, at);
            stock.draw(new Canvas(shot));
        } finally {
            stock.setBounds(was);
        }
        int[] pixels = new int[at * at];
        shot.getPixels(pixels, 0, at, 0, 0, at, at);
        shot.recycle();
        Map<Integer, Integer> counts = new HashMap<>();
        int best = 0, seen = 0;
        for (int pixel : pixels) {
            if (Color.alpha(pixel) < SOLID) continue;
            int opaque = pixel | 0xff000000;
            int count = counts.merge(opaque, 1, Integer::sum);
            if (count > seen) {
                seen = count;
                best = opaque;
            }
        }
        return seen == 0 ? null : best;
    }

    /** The copy of the picture picked for [key]. */
    static File file(Context context, String key) {
        return new File(context.getFilesDir(), PICTURE + key + ".png");
    }

    /** The saved picture for a tab, read again only when its file changed. Null when there's none or it won't decode. */
    private static Bitmap picture(File copy) {
        String signature = signature(copy);
        synchronized (PICTURES) {
            if (signature == null) {
                PICTURES.remove(copy.getName());
                READ_AT.remove(copy.getName());
                return null;
            }
            Bitmap read = PICTURES.get(copy.getName());
            if (read != null && signature.equals(READ_AT.get(copy.getName()))) return read;
            read = decode(copy);
            if (read == null) {
                android.util.Log.w("HushMessenger", "A tab icon won't decode, so Messenger's own icon stays");
                return null;
            }
            PICTURES.put(copy.getName(), read);
            READ_AT.put(copy.getName(), signature);
            return read;
        }
    }

    /** A saved picture's time and size, or null when there's no picture. */
    static String signature(File copy) {
        return copy.isFile() ? copy.lastModified() + "\n" + copy.length() : null;
    }

    private static Bitmap decode(File copy) {
        try {
            byte[] bytes = java.nio.file.Files.readAllBytes(copy.toPath());
            Bitmap read = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            return read == null || read.getWidth() <= 0 || read.getHeight() <= 0 ? null : read;
        } catch (java.io.IOException | RuntimeException unreadable) {
            return null;
        }
    }

    /** A picture was picked or taken away, so the next bar reads the files again. */
    static void forget() {
        synchronized (PICTURES) {
            PICTURES.clear();
            READ_AT.clear();
        }
    }

    /**
     * What a restart would draw, for the restart row: every shown tab's picture, in order, while the switch is in
     * effect. The bar is built once as Messenger opens, so a picked picture waits for a restart.
     */
    static String inUse(Context context) {
        if (!Settings.wouldUse(KEY)) return "";
        StringBuilder line = new StringBuilder();
        for (String key : SHOWN) {
            String signature = signature(file(context, key));
            line.append(key).append('=').append(signature == null ? "plain" : signature).append('\n');
        }
        return line.toString();
    }

    /** The tabs the settings page lists, as an ordered list. */
    static List<String> shown() {
        return Arrays.asList(SHOWN);
    }
}
