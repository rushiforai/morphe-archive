package app.morphe.extension.kicktv.chattext;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent CHAT TEXT SIZE setting.
 *
 * <p>KICK builds the chat message style (`vi4.m`) from 11 sp text with a
 * 16 sp line height. That is noticeably smaller than Twitch on Android TV,
 * which uses larger glyphs with a tight line height.</p>
 *
 * <p>The patched code calls {@link #fontSizeSp(int)} and
 * {@link #lineHeightSp(int)} instead of the Compose `sp()` helper. The stock
 * values are passed in, so the patch keeps working if the app changes its
 * typography: only the chat style values are replaced.</p>
 */
public final class ChatTextPrefs {

    /** Stock values used by the chat message TextStyle (vi4.m). */
    private static final int STOCK_FONT_SP = 11;
    private static final int STOCK_LINE_HEIGHT_SP = 16;

    /** Selectable chat font sizes. 0 keeps the stock 11 sp text. */
    public static final int SIZE_OFF = 0;
    public static final int SIZE_13 = 13;
    public static final int SIZE_15 = 15;
    public static final int SIZE_16 = 16;

    private static final String PREFS_NAME = "morphe_kicktv";
    private static final String KEY_SIZE_SP = "chat_text_size_sp";
    private static final int DEFAULT_SIZE_SP = SIZE_16;

    private static SharedPreferences prefs;
    private static Context appContext;

    private ChatTextPrefs() {
    }

    /**
     * Called from `KickApplication.onCreate()` by the patch. The chat TextStyle
     * is a static initializer that can run before the activity exists, so the
     * application context has to be captured first: otherwise the preference
     * would not be readable and the setting would never take effect.
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

    /** Defaults to the biggest size so the patch is visible right away. */
    public static int getSizeSp() {
        SharedPreferences p = getPrefs();
        int size = p == null ? DEFAULT_SIZE_SP : p.getInt(KEY_SIZE_SP, DEFAULT_SIZE_SP);
        return isValidSize(size) ? size : DEFAULT_SIZE_SP;
    }

    public static void setSizeSp(int sizeSp) {
        SharedPreferences p = getPrefs();
        if (p != null) {
            p.edit().putInt(KEY_SIZE_SP, isValidSize(sizeSp) ? sizeSp : DEFAULT_SIZE_SP).apply();
        }
    }

    public static boolean isEnabled() {
        return getSizeSp() != SIZE_OFF;
    }

    /** Cycle used by the SEYTTINGS button: 16 -> 15 -> 13 -> Off -> 16. */
    public static int nextSizeSp(int current) {
        switch (current) {
            case SIZE_16:
                return SIZE_15;
            case SIZE_15:
                return SIZE_13;
            case SIZE_13:
                return SIZE_OFF;
            default:
                return SIZE_16;
        }
    }

    public static String getSizeLabel(int sizeSp) {
        switch (sizeSp) {
            case SIZE_16:
                return "Biggest (16 sp)";
            case SIZE_15:
                return "Bigger (15 sp)";
            case SIZE_13:
                return "Twitch (13 sp)";
            default:
                return "Off (stock 11 sp)";
        }
    }

    /** Line height that goes with each chat font size. */
    private static int lineHeightSpFor(int sizeSp) {
        switch (sizeSp) {
            case SIZE_16:
                return 24;
            case SIZE_15:
                return 22;
            case SIZE_13:
                return 20;
            default:
                return STOCK_LINE_HEIGHT_SP;
        }
    }

    private static boolean isValidSize(int sizeSp) {
        return sizeSp == SIZE_OFF
                || sizeSp == SIZE_13
                || sizeSp == SIZE_15
                || sizeSp == SIZE_16;
    }

    /**
     * Replacement for the Compose `sp(int)` call used for the chat font size.
     * Returns a packed TextUnit, exactly like `TextUnitKt.sp()`.
     */
    public static long fontSizeSp(int stockSp) {
        int size = getSizeSp();
        if (size != SIZE_OFF && stockSp == STOCK_FONT_SP) {
            return packSp(size);
        }
        return packSp(stockSp);
    }

    /**
     * Replacement for the Compose `sp(int)` call used for the chat line height.
     */
    public static long lineHeightSp(int stockSp) {
        int size = getSizeSp();
        if (size != SIZE_OFF && stockSp == STOCK_LINE_HEIGHT_SP) {
            return packSp(lineHeightSpFor(size));
        }
        return packSp(stockSp);
    }

    /**
     * Packs a value into a Compose sp TextUnit: the raw float bits in the low
     * 32 bits and the sp unit type marker in the high bits.
     */
    private static long packSp(int value) {
        return (((long) Float.floatToRawIntBits((float) value)) & 0xFFFFFFFFL)
                | 0x100000000L;
    }
}
