/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.text.SpannableStringBuilder;
import android.text.Spanned;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The person's own touches on the chat list's title. The chat list builds its title once, in
 * createView: Telegram's logo as an ImageSpan over the app name. {@link #decorate} gets it before
 * the action bar does. With the chat list title switch on and a saved title, that text replaces
 * the logo and its span, so the title view draws it in its own bold face and theme color, and it
 * stays when the title shrinks on scroll or the theme changes. Then a space and the saved emoji
 * text go after the title, marked with a {@link Suffix} span. Nothing goes to Telegram's servers,
 * and the Premium emoji status, which the action bar draws on its own beside the title, is left
 * alone. Independent of the holiday switch: the holiday logo hat finds the logo through
 * {@link #titleEnd}, so the two work together or apart.
 */
public final class TitleEmoji {
    /** The most the emoji text may hold, in Unicode code points: room for a couple of joined emoji. */
    public static final int MAX_CODE_POINTS = 16;
    /** The most the chat list title may hold, in Unicode code points: it shares the top bar with its buttons. */
    public static final int MAX_TITLE_CODE_POINTS = 24;
    /** Keeps the text on the logo's line. */
    private static final char SPACE = (char) 0xa0;

    private TitleEmoji() {}

    /** Marks what {@link #decorate} added, so the title Telegram built can still be told apart. */
    static final class Suffix {}

    /** Called with the chat list's title after Telegram spans its logo, before the action bar gets it. */
    public static void decorate(SpannableStringBuilder title) {
        HookStatus.invoked(FamilyNames.HOLIDAY_LOOK);
        if (title == null) return;
        rename(title);
        String text = text();
        if (text.isEmpty()) return;
        try {
            title.append(SPACE + text, new Suffix(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            HookStatus.counted(FamilyNames.HOLIDAY_LOOK, "title emoji shown");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "title emoji", t);
        }
    }

    /** The person's title in place of Telegram's logo and app name, when there's one to show. */
    private static void rename(SpannableStringBuilder title) {
        String name = ownTitle();
        if (name.isEmpty()) return;
        try {
            // The logo's span goes with the app name it covers, so only the text is left to draw.
            title.clearSpans();
            title.replace(0, title.length(), name);
            HookStatus.counted(FamilyNames.HOLIDAY_LOOK, "chat list title shown");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "chat list title", t);
        }
    }

    /** The saved text, cleaned, or empty while paused, before the settings load or when unreadable. */
    static String text() {
        try {
            if (!Utils.settingsReady()) return "";
            String cleaned = clean(Settings.TITLE_EMOJI.get());
            return allowed(cleaned) ? cleaned : "";
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "title emoji read", t);
            return "";
        }
    }

    /**
     * The saved chat list title, cleaned, when its switch is on. Empty, which keeps Telegram's own
     * title, while the switch is off or paused, with nothing saved, before the settings load or
     * when unreadable.
     */
    static String ownTitle() {
        try {
            if (!Utils.settingsReady() || !Settings.CHAT_LIST_TITLE.get()) return "";
            String cleaned = clean(Settings.CHAT_LIST_TITLE_TEXT.get());
            return titleAllowed(cleaned) ? cleaned : "";
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "chat list title read", t);
            return "";
        }
    }

    /**
     * The text as it would be saved: no control or direction characters (a right-to-left mark
     * would turn the title around), no line breaks, and single spaces with none at either end.
     * Emoji joiners and variation selectors stay, since joined emoji need them.
     */
    public static String clean(String text) {
        if (text == null) return "";
        StringBuilder out = new StringBuilder(text.length());
        boolean space = false;
        for (int i = 0; i < text.length(); ) {
            int c = text.codePointAt(i);
            i += Character.charCount(c);
            if (Character.isWhitespace(c) || Character.isSpaceChar(c)) {
                space = out.length() > 0;
                continue;
            }
            if (Character.isISOControl(c) || direction(c)) continue;
            if (space) out.append(' ');
            space = false;
            out.appendCodePoint(c);
        }
        return out.toString();
    }

    /** Whether {@code text} can be saved as it is: already clean, and short enough. Empty is allowed: it shows nothing. */
    public static boolean allowed(String text) {
        return fits(text, MAX_CODE_POINTS);
    }

    /** Whether {@code text} can be saved as the chat list title. Empty is allowed: it keeps Telegram's own title. */
    public static boolean titleAllowed(String text) {
        return fits(text, MAX_TITLE_CODE_POINTS);
    }

    private static boolean fits(String text, int most) {
        return text != null && clean(text).equals(text) && text.codePointCount(0, text.length()) <= most;
    }

    /**
     * Where the title Telegram built ends: at the one {@link Suffix} this class added when it runs
     * to the end of the text, otherwise at the end itself.
     */
    static int titleEnd(Spanned title) {
        int end = title.length();
        Suffix[] added = title.getSpans(0, end, Suffix.class);
        if (added.length != 1 || title.getSpanEnd(added[0]) != end) return end;
        return title.getSpanStart(added[0]);
    }

    private static boolean direction(int c) {
        return c == 0x061c || c == 0x200e || c == 0x200f || (c >= 0x202a && c <= 0x202e) || (c >= 0x2066 && c <= 0x2069);
    }
}
