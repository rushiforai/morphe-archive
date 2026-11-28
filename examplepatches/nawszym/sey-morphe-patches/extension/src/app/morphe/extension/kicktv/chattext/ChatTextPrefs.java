package app.morphe.extension.kicktv.chattext;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.util.List;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Persistent CHAT TEXT SIZE setting with exactly two options:
 * Native (stock KICK typography) and Twitch-like (larger text + wider gap +
 * lighter message bodies with bold usernames).
 *
 * <p>KICK builds the chat message style ({@code vi4.m}) from 11 sp text with a
 * 16 sp line height. Twitch TV's chat uses larger glyphs, a much airier message
 * gap, regular-weight messages and semi-bold usernames.</p>
 */
public final class ChatTextPrefs {

    /** Stock values used by the chat message TextStyle (vi4.m). */
    private static final int STOCK_FONT_SP = 11;
    private static final int STOCK_LINE_HEIGHT_SP = 16;

    /** Vertical gap that KICK puts between chat message items (LazyColumn). */
    private static final float STOCK_MESSAGE_SPACING_DP = 2.0f;

    /** Twitch-like gap between messages, tuned for a TV screen. */
    private static final float TWITCH_MESSAGE_SPACING_DP = 6.0f;

    /** Two options only. Value 15 is the Twitch-like preset; 0 is Native. */
    public static final int SIZE_NATIVE = 0;
    public static final int SIZE_TWITCH = 15;

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
        return sizeSp == SIZE_TWITCH ? 20 : STOCK_LINE_HEIGHT_SP;
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

    /** Native keeps KICK's 2 dp gap; Twitch-like uses the tuned 6 dp gap. */
    public static float messageSpacingDp() {
        return getSizeSp() == SIZE_TWITCH ? TWITCH_MESSAGE_SPACING_DP : STOCK_MESSAGE_SPACING_DP;
    }

    /**
     * Replacement for the font-weight instance fed into the chat message
     * TextStyle ({@code vi4.m}). Native keeps KICK's 600 (semi-bold); Twitch-like
     * selects 400 so the message body reads lighter. Usernames are handled
     * separately by {@link #boldUsernames(Object)}.
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

    /**
     * KICK renders a chat line as one {@code hn} CharSequence whose username is
     * a {@code rb8} SpanStyle with {@code fontWeight = null}. With the base
     * style lightened to 400 that makes the username light too. Set the span's
     * weight to 600 (semi-bold) so usernames stay bold like Twitch chat.
     *
     * <p>Called from {@code hp1.I} before the line is drawn. Badge/emote spans
     * are skipped by checking the covered text: only a real name segment is
     * changed. Everything is wrapped in try/catch so a patched app never
     * crashes because of a tweak.</p>
     */
    public static void boldUsernames(Object text) {
        if (!isEnabled() || text == null) {
            return;
        }
        try {
            Object bold = Class.forName("y23").getField("G").get(null);
            String body = (String) text.getClass().getField("B").get(text);
            Object spansObject = text.getClass().getField("A").get(text);
            if (!(spansObject instanceof List) || body == null) {
                return;
            }
            for (Object span : (List<?>) spansObject) {
                try {
                    Object style = span.getClass().getField("a").get(span);
                    if (!"rb8".equals(style.getClass().getName())) {
                        continue;
                    }
                    int start = span.getClass().getField("b").getInt(span);
                    int end = span.getClass().getField("c").getInt(span);
                    if (start < 0 || end > body.length() || start >= end) {
                        continue;
                    }
                    String segment = body.substring(start, end);
                    if (segment.contains("[image]") || segment.contains("[emote]")
                            || segment.trim().isEmpty()) {
                        continue;
                    }
                    Field weight = style.getClass().getDeclaredField("c");
                    weight.setAccessible(true);
                    if (weight.get(style) == null) {
                        weight.set(style, bold);
                    }
                } catch (Throwable ignored) {
                    // Never crash chat because of one malformed span.
                }
            }
        } catch (Throwable ignored) {
            // Native and older builds simply keep the stock typography.
        }
    }

    /** Packs a value into a Compose sp TextUnit. */
    private static long packSp(int value) {
        return (((long) Float.floatToRawIntBits((float) value)) & 0xFFFFFFFFL)
                | 0x100000000L;
    }
}
