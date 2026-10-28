package io.github.jordanwoodson.extension.shared.twitch;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Chat appearance: text, emote and badge size, message spacing, alternating row backgrounds and plain /me
 * messages in native chat and VOD chat replay, and the width and background of the landscape chat panel. Every
 * choice starts at Twitch's look.
 */
@SuppressWarnings("unused")
public final class TwitchChatStyle {
    static final String KEY = "chat_appearance";
    static final String TEXT_SIZE = "chat_text_size";
    static final String EMOTE_SIZE = "chat_emote_size";
    static final String BADGE_SIZE = "chat_badge_size";
    static final String SPACING = "chat_message_spacing";
    static final String ALTERNATE = "chat_alternate_rows";
    static final String ME_STYLE = "chat_me_style";
    static final String LANDSCAPE_WIDTH = "chat_landscape_width";
    static final String LANDSCAPE_OPACITY = "chat_landscape_opacity";

    /** Mid grey at 8%: a little lighter on the dark chat background, a little darker on the light one. */
    static final int ALTERNATE_COLOR = 0x14808080;

    /** Set on the sender span of every other line. */
    private static final Object ODD_ROW = new Object() {
        @Override
        public String toString() {
            return "LurkOddRow";
        }
    };

    /** The message ID while a line is being built. */
    private static final ThreadLocal<String> LINE = new ThreadLocal<>();
    /** Whether each message is an odd one, in arrival order. */
    private static final Map<String, Boolean> PARITY = new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 2000;
        }
    };
    /**
     * Each scaled text view's size and minimum height before scaling, and the ones it was given: { size, minimum
     * height, given size, given minimum height }.
     */
    private static final Map<TextView, float[]> SCALED = Collections.synchronizedMap(new WeakHashMap<>());
    /**
     * Each spaced view's vertical padding and margins before spacing, then the ones it was given: { top, bottom,
     * top margin, bottom margin } twice.
     */
    private static final Map<View, int[]> SPACED = Collections.synchronizedMap(new WeakHashMap<>());
    /** The landscape chat panel's own background, while it shows another. */
    private static final Map<View, Drawable> PANEL_BACKGROUNDS = Collections.synchronizedMap(new WeakHashMap<>());

    /** Stands for the ID of a VOD chat replay line, which has none. */
    private static final String REPLAY = new String("replay");

    private static boolean nextOdd;
    private static boolean nextReplayOdd;
    private static int chatColumnId;
    private static boolean loggedFailure;

    private TwitchChatStyle() {
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /**
     * Injection point: a live or history message gets its chat list item, in arrival order, with its sender and
     * tokens. A message Chat keywords hides takes no place.
     */
    public static void onMessage(String id, Object sender, List<?> tokens) {
        if (id != null && !TwitchChatKeywords.hiddenLive(sender, tokens)) parity(id);
    }

    /**
     * Injection point: the start of the chat line builder, with the line's message style, Twitch's normal
     * message style, the message ID and the line's click configuration. Returns the style to build the line
     * with: the normal one in place of the /me ("Action") style when /me messages are plain.
     */
    public static Object beginLine(Object style, Object normal, String id, Object config) {
        LINE.set(id);
        try {
            // VOD chat replay lines have no ID, but each is built once, in order, when it is added to the list.
            if (id == null && "Other".equals(TwitchChatKeywords.source(config))) LINE.set(REPLAY);
            if (style != null && normal != null && enabled() && Settings.getInt(ME_STYLE) == 1
                    && "Action".equals(style.toString())) {
                return normal;
            }
        } catch (RuntimeException e) {
            fail(e);
        }
        return style;
    }

    /**
     * Injection point: the end of the chat line builder, with the line's sender, inline header and message spans.
     * Marks every other line's sender span; a line Chat keywords hides takes no place.
     */
    public static CharSequence markLine(CharSequence sender, CharSequence header, CharSequence message) {
        String id = LINE.get();
        LINE.set(null);
        try {
            if (id == null || sender == null || sender.length() == 0 || !alternating()
                    || TwitchChatKeywords.hidden(sender, message)) {
                return sender;
            }
            boolean odd;
            if (id == REPLAY) {
                synchronized (PARITY) {
                    odd = nextReplayOdd;
                    nextReplayOdd = !nextReplayOdd;
                }
            } else {
                odd = parity(id);
            }
            if (!odd) return sender;
            Spannable marked = sender instanceof Spannable ? (Spannable) sender : new SpannableString(sender);
            marked.setSpan(ODD_ROW, 0, marked.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            return marked;
        } catch (RuntimeException e) {
            fail(e);
            return sender;
        }
    }

    /**
     * Injection point: a chat row once bound, in native chat and VOD chat replay. Sets the text size and the
     * space around the message, and shades every other row, unless Twitch shows it selected or pressed or Chat
     * keywords tints it.
     */
    public static void bindRow(View row, TextView text) {
        try {
            if (row == null || text == null) return;
            boolean on = enabled();
            int percent = on ? Settings.getInt(TEXT_SIZE) : 0;
            scale(text, isTextPercent(percent) ? percent / 100f : 1f);
            int spacing = on ? Settings.getInt(SPACING) : 0;
            float space = isSpacing(spacing) ? spacing / 100f : 1f;
            space(row, space);
            if (text != row) space(text, space);
            CharSequence line = text.getText();
            if (on && Settings.isEnabled(ALTERNATE) && line instanceof Spanned
                    && ((Spanned) line).getSpanStart(ODD_ROW) >= 0
                    && TwitchChatKeywords.verdict(line) == TwitchChatKeywords.NONE && isStockBackground(row)) {
                row.setBackgroundColor(ALTERNATE_COLOR);
            }
        } catch (RuntimeException e) {
            fail(e);
        }
    }

    /**
     * Injection point: the size in pixels Twitch gives a chat image's box, from its size class {@code kind}
     * (Twitch's enum: Emote, GigantifiedEmote, Badge, ...). Emotes, Twitch's and third-party ones alike, and
     * badges get the chosen share of it; other images (notice icons, GIFs) keep Twitch's size.
     */
    public static int imageSize(int size, Object kind) {
        try {
            if (size <= 0 || kind == null || !enabled()) return size;
            String key = sizeKey(kind instanceof Enum ? ((Enum<?>) kind).name() : String.valueOf(kind));
            int percent = key == null ? 0 : Settings.getInt(key);
            return isImagePercent(percent) ? Math.max(1, Math.round(size * (percent / 100f))) : size;
        } catch (RuntimeException e) {
            fail(e);
            return size;
        }
    }

    /**
     * Injection point: the image scale Twitch's emote URL builder was asked for (2 in chat, 3 for gigantified
     * emotes; null for the screen's own). While emotes are drawn larger than Twitch's size, the next larger
     * image is asked for, up to Twitch's largest (3), so they stay sharp. Third-party emotes get their URL
     * through the same builder, so they follow.
     */
    public static Float emoteScale(Float scale) {
        try {
            if (scale == null || !enabled()) return scale;
            int percent = Settings.getInt(EMOTE_SIZE);
            if (!isImagePercent(percent) || percent <= 100) return scale;
            float wanted = (float) Math.min(3, Math.ceil(scale * (percent / 100f) - 0.01f));
            return wanted > scale ? Float.valueOf(wanted) : scale;
        } catch (RuntimeException e) {
            fail(e);
            return scale;
        }
    }

    /**
     * Injection point: the landscape chat panel of the player view right after Twitch sized it (20% or 30% of
     * the screen's long side). Applies the chosen width and background opacity, or Twitch's own background.
     */
    public static void landscapeChat(View panel) {
        try {
            if (panel == null) return;
            boolean on = enabled();
            int width = on ? Settings.getInt(LANDSCAPE_WIDTH) : 0;
            ViewGroup.LayoutParams params = panel.getLayoutParams();
            if (isWidth(width) && params != null) {
                DisplayMetrics metrics = panel.getResources().getDisplayMetrics();
                params.width = (int) (width / 100f * Math.max(metrics.widthPixels, metrics.heightPixels));
                panel.setLayoutParams(params);
            }
            opacity(panel, on ? Settings.getInt(LANDSCAPE_OPACITY) : 0);
        } catch (RuntimeException e) {
            fail(e);
        }
    }

    /**
     * Injection point: the native theatre's layout, with Twitch's position for the landscape chat column (0.7 of
     * the width, 0.8 on tablets). Returns the position to use, and sets the column's background opacity.
     */
    public static float landscapeChatGuide(View layout, float stock) {
        try {
            boolean on = enabled();
            View column = chatColumn(layout);
            if (column != null) opacity(column, on ? Settings.getInt(LANDSCAPE_OPACITY) : 0);
            int width = on ? Settings.getInt(LANDSCAPE_WIDTH) : 0;
            if (isWidth(width)) return 1f - width / 100f;
        } catch (RuntimeException e) {
            fail(e);
        }
        return stock;
    }

    // ---------------------------------------------------------------------------------------------

    static boolean enabled() {
        return Settings.isEnabled(KEY);
    }

    private static boolean alternating() {
        return enabled() && Settings.isEnabled(ALTERNATE);
    }

    private static boolean isWidth(int percent) {
        return percent >= 10 && percent <= 60;
    }

    static boolean isTextPercent(int percent) {
        return percent >= 50 && percent <= 200;
    }

    static boolean isImagePercent(int percent) {
        return percent >= 25 && percent <= 400;
    }

    static boolean isSpacing(int percent) {
        return percent >= 10 && percent <= 400;
    }

    /** The size setting for chat images of size class {@code kind}, or null for those that keep Twitch's size. */
    static String sizeKey(String kind) {
        switch (kind) {
            case "Emote":
            case "GigantifiedEmote":
                return EMOTE_SIZE;
            case "Badge":
                return BADGE_SIZE;
            default:
                return null;
        }
    }

    /** The theatre's chat column (chat_wrapper), found by its resource name. */
    private static View chatColumn(View layout) {
        if (layout == null) return null;
        int id = chatColumnId;
        if (id == 0) {
            String resources = layout.getId() != View.NO_ID
                    ? layout.getResources().getResourcePackageName(layout.getId())
                    : layout.getContext().getPackageName();
            chatColumnId = id = layout.getResources().getIdentifier("chat_wrapper", "id", resources);
            if (id == 0) return null;
        }
        return layout.findViewById(id);
    }

    /**
     * Shows {@code panel}'s own background color at {@code percent} opacity, or gives it back its own background
     * for anything outside 1-99.
     */
    private static void opacity(View panel, int percent) {
        Drawable own = PANEL_BACKGROUNDS.get(panel);
        if (percent > 0 && percent < 100) {
            if (own == null) {
                own = panel.getBackground();
                if (!(own instanceof ColorDrawable)) return;
                PANEL_BACKGROUNDS.put(panel, own);
            }
            int color = ((ColorDrawable) own).getColor();
            int alpha = Math.round(percent * 2.55f);
            panel.setBackground(new ColorDrawable(Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color))));
        } else if (own != null) {
            panel.setBackground(own);
            PANEL_BACKGROUNDS.remove(panel);
        }
    }

    /** Whether message {@code id} is an odd one; a message first seen here takes the next place. */
    private static boolean parity(String id) {
        synchronized (PARITY) {
            Boolean odd = PARITY.get(id);
            if (odd == null) {
                odd = nextOdd;
                nextOdd = !nextOdd;
                PARITY.put(id, odd);
            }
            return odd;
        }
    }

    /**
     * Whether a row shows Twitch's background for a line that is neither selected nor pressed (none, or
     * transparent), or a Lurk tint that a later bind may replace.
     */
    static boolean isStockBackground(View row) {
        Drawable background = row.getBackground();
        if (background == null) return true;
        if (!(background instanceof ColorDrawable)) return false;
        int color = ((ColorDrawable) background).getColor();
        return Color.alpha(color) == 0 || color == ALTERNATE_COLOR || color == TwitchChatKeywords.HIGHLIGHT_COLOR;
    }

    /**
     * Gives {@code text} {@code factor} times its own size and minimum height. Twitch sets live chat's size on
     * each bind, VOD replay's only once, and neither sets the minimum height again, so the values given last are
     * remembered to tell the two apart.
     */
    private static void scale(TextView text, float factor) {
        float size = text.getTextSize();
        float minimum = text.getMinHeight();
        float[] saved = SCALED.get(text);
        float baseSize = saved != null && size == saved[2] ? saved[0] : size;
        float baseMinimum = saved != null && minimum == saved[3] ? saved[1] : minimum;
        if (factor == 1f) {
            if (saved != null) {
                SCALED.remove(text);
                if (baseSize != size) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, baseSize);
                if (baseMinimum != minimum) text.setMinHeight(Math.round(baseMinimum));
            }
            return;
        }
        float targetSize = baseSize * factor;
        int targetMinimum = Math.round(baseMinimum * factor);
        if (targetSize != size) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, targetSize);
        if (targetMinimum != minimum) text.setMinHeight(targetMinimum);
        SCALED.put(text, new float[]{baseSize, baseMinimum, text.getTextSize(), text.getMinHeight()});
    }

    /**
     * Gives {@code view} {@code factor} times its own vertical padding and margins. Twitch sets live chat rows'
     * padding on each bind and VOD replay's only when the row is made, so the values given last are remembered
     * to tell the two apart.
     */
    private static void space(View view, float factor) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        ViewGroup.MarginLayoutParams margins = params instanceof ViewGroup.MarginLayoutParams
                ? (ViewGroup.MarginLayoutParams) params : null;
        int[] current = {view.getPaddingTop(), view.getPaddingBottom(),
                margins != null ? margins.topMargin : 0, margins != null ? margins.bottomMargin : 0};
        int[] saved = SPACED.get(view);
        int[] base = current;
        if (saved != null && current[0] == saved[4] && current[1] == saved[5] && current[2] == saved[6]
                && current[3] == saved[7]) {
            base = new int[]{saved[0], saved[1], saved[2], saved[3]};
        }
        int[] target = base;
        if (factor != 1f) {
            target = new int[4];
            for (int i = 0; i < 4; i++) target[i] = Math.round(base[i] * factor);
        }
        if (target[0] != current[0] || target[1] != current[1]) {
            view.setPadding(view.getPaddingLeft(), target[0], view.getPaddingRight(), target[1]);
        }
        if (margins != null && (target[2] != current[2] || target[3] != current[3])) {
            margins.topMargin = target[2];
            margins.bottomMargin = target[3];
            view.setLayoutParams(margins);
        }
        if (factor == 1f) {
            SPACED.remove(view);
        } else {
            SPACED.put(view, new int[]{base[0], base[1], base[2], base[3], target[0], target[1], target[2], target[3]});
        }
    }

    private static void fail(Exception e) {
        if (loggedFailure) return;
        loggedFailure = true;
        Logger.d("chat appearance: failed: " + e);
    }
}
