package app.morphe.extension.kicktv.chattext;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent CHAT TEXT SIZE setting with exactly two options:
 * Native (stock KICK typography) and Twitch-like (larger text + wider gap).
 *
 * <p>KICK builds the chat message style ({@code vi4.m}) from 11 sp text with a
 * 16 sp line height. Twitch TV's chat uses larger glyphs and a much airier
 * message gap; the Twitch-like preset reproduces that look.</p>
 *
 * <p>The patched code calls {@link #fontSizeSp(int)} and
 * {@link #lineHeightSp(int)} instead of the Compose {@code sp()} helper. The
 * stock values are passed in, so the patch keeps working if the app changes
 * its typography: only the chat style values are replaced.</p>
 */
public final class ChatTextPrefs {

    /** Stock values used by the chat message TextStyle (vi4.m). */
    private static final int STOCK_FONT_SP = 11;
    private static final int STOCK_LINE_HEIGHT_SP = 16;

    /** Vertical gap that KICK puts between chat message items (LazyColumn). */
    private static final float STOCK_MESSAGE_SPACING_DP = 2.0f;

    /**
     * Twitch-like gap between messages. The stock 2 dp gap is far too tight;
     * 10 dp is the tuned value that reads like Twitch TV chat on a TV screen.
     */
    private static final float TWITCH_MESSAGE_SPACING_DP = 10.0f;

    /** Two options only. Value 16 is the Twitch-like preset; 0 is Native. */
    public static final int SIZE_NATIVE = 0;
    public static final int SIZE_TWITCH = 16;

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_SIZE_SP = "chat_text_size_sp";
    private static final int DEFAULT_SIZE_SP = SIZE_TWITCH;

    private static SharedPreferences prefs;
    private static Context appContext;

    private ChatTextPrefs() {
    }

    /**
     * Called from {@code KickApplication.onCreate()} by the patch. The chat
     * TextStyle is a static initializer that can run before the activity exists,
     * so the application context has to be captured first.
     */
    public static synchronized void init(Context context) {
        if (context != null) {
            appContext = context.getApplicationContext();
        }
    }

    private static synchronized SharedPreferences getPrefs() {
        if (prefs == null) {
            Context context = appContext != null ? appContext : MorpheContext.getAppContext();
            if (context != null) {
                prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            }
        }
        return prefs;
    }

    /** Defaults to the Twitch-like preset so the patch is visible right away. */
    public static int getSizeSp() {
        SharedPreferences p = getPrefs();
        int size = p == null ? DEFAULT_SIZE_SP : p.getInt(KEY_SIZE_SP, DEFAULT_SIZE_SP);
        // Old builds stored 13/15 for intermediate presets; normalise them to
        // the closest of the two supported options.
        if (size != SIZE_NATIVE && size != SIZE_TWITCH) {
            size = DEFAULT_SIZE_SP;
        }
        return size;
    }

    public static void setSizeSp(int sizeSp) {
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putInt(KEY_SIZE_SP,
                    (sizeSp == SIZE_NATIVE || sizeSp == SIZE_TWITCH) ? sizeSp : DEFAULT_SIZE_SP)
                    .apply();
        }
    }

    public static boolean isEnabled() {
        return getSizeSp() == SIZE_TWITCH;
    }

    /** Toggle used by the SEYTTINGS button: Twitch-like -> Native -> Twitch-like. */
    public static int nextSizeSp(int current) {
        return current == SIZE_TWITCH ? SIZE_NATIVE : SIZE_TWITCH;
    }

    public static String getSizeLabel(int sizeSp) {
        return sizeSp == SIZE_TWITCH ? "Twitch-like" : "Native";
    }

    /** Line height that goes with the selected option. */
    private static int lineHeightSpFor(int sizeSp) {
        return sizeSp == SIZE_TWITCH ? 24 : STOCK_LINE_HEIGHT_SP;
    }

    /**
     * Replacement for the Compose {@code sp(int)} call used for the chat font
     * size. Returns a packed TextUnit, exactly like {@code TextUnitKt.sp()}.
     */
    public static long fontSizeSp(int stockSp) {
        int size = getSizeSp();
        if (size == SIZE_TWITCH && stockSp == STOCK_FONT_SP) {
            return packSp(SIZE_TWITCH);
        }
        return packSp(stockSp);
    }

    /** Replacement for the Compose {@code sp(int)} call for chat line height. */
    public static long lineHeightSp(int stockSp) {
        int size = getSizeSp();
        if (size == SIZE_TWITCH && stockSp == STOCK_LINE_HEIGHT_SP) {
            return packSp(lineHeightSpFor(size));
        }
        return packSp(stockSp);
    }

    /**
     * Replacement for the {@code 2.0f} argument of the chat message LazyColumn's
     * {@code Arrangement.spacedBy(...)}. Native keeps KICK's stock 2 dp gap;
     * Twitch-like uses the measured 20 dp gap.
     */
    public static float messageSpacingDp() {
        return getSizeSp() == SIZE_TWITCH ? TWITCH_MESSAGE_SPACING_DP : STOCK_MESSAGE_SPACING_DP;
    }

    /**
     * Replacement for the font-weight instance fed into the chat message
     * TextStyle ({@code vi4.m}). KICK uses {@code y23.G} = 600 (semi-bold) for
     * the whole message. Twitch chat uses a light 400 body with bold usernames,
     * so Twitch-like selects {@code y23.E} = 400 here; usernames are styled
     * separately in the app and keep their own bold weight. Native keeps the
     * original instance untouched.
     */
    public static Object messageFontWeight(Object stock) {
        if (!isEnabled()) {
            return stock;
        }
        try {
            return Class.forName("y23").getField("E").get(null);
        } catch (Throwable ignored) {
            return stock;
        }
    }

    /** Packs a value into a Compose sp TextUnit. */
    private static long packSp(int value) {
        return (((long) Float.floatToRawIntBits((float) value)) & 0xFFFFFFFFL)
                | 0x100000000L;
    }
}