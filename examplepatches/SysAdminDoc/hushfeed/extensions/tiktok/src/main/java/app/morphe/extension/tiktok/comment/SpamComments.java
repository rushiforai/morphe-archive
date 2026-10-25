/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.comment;

import java.util.regex.Pattern;

/**
 * Tells bot comments from people's by what they ask the reader to do (#187).
 *
 * <p>Comment spam on TikTok comes in a few set shapes: a pointer to the commenter's bio or
 * profile, a link or a spelled-out domain, a messenger handle, and follower or coin bait. Each
 * is matched as a whole phrase, so a comment that only mentions someone's bio or Telegram stays.
 * The phrases cover the languages the settings are translated into, plus French.
 */
final class SpamComments {
    private SpamComments() {
    }

    /**
     * Phrases matched on word boundaries in the normalized text. Lowercase, single spaces. Kept
     * to what a person rarely says to a stranger: "see my profile" was left out because "you can
     * see my profile picture" is ordinary talk.
     */
    private static final String[] PHRASES = {
            // English
            "check my bio", "check out my bio", "check my profile", "check out my profile",
            "look at my profile", "visit my profile", "go to my profile", "click my profile",
            "link in bio", "link in my bio", "link on my profile", "link in my profile",
            "free followers", "free likes", "free coins", "free views",
            "follow for follow", "follow 4 follow", "my onlyfans",
            // Spanish
            "mira mi perfil", "revisa mi perfil", "visita mi perfil", "link en mi bio",
            "enlace en mi bio", "link en mi perfil",
            // Portuguese
            "olha meu perfil", "veja meu perfil", "visite meu perfil", "link na bio",
            "link no meu perfil",
            // Indonesian
            "cek bio", "cek profil", "lihat profilku", "lihat profil aku",
            // Italian
            "guarda il mio profilo", "visita il mio profilo", "link nella bio",
            // French
            "lien en bio", "regarde mon profil", "va voir mon profil",
            // German
            "link in meiner bio", "schau in mein profil", "schau auf mein profil",
            // Turkish
            "profilime bak", "profilime gel", "biyografimdeki link",
            // Russian
            "ссылка в профиле", "ссылка в био", "заходи в профиль", "смотри мой профиль",
            // Azerbaijani
            "profilimə bax",
    };

    /**
     * Links and domains. A spelled-out domain needs its dot written as "(dot)" or "[dot]", or
     * one of a few top-level names right after a dot, so "I agree. Me too" never reads as a
     * domain. Short endings like .to and .me are left to the messenger shapes below because a
     * missing space after a full stop makes them out of ordinary words.
     */
    private static final Pattern LINK = Pattern.compile(
            "https?://|\\bwww\\.|\\b(?:t|wa)\\.me/"
                    + "|\\b[a-z0-9-]{2,}(?:\\.| \\. | ?[(\\[]dot[)\\]] ?)(?:com|net|org|xyz|vip|info|biz)\\b");

    /**
     * A messenger name followed by a handle, a phone number or "me": "telegram @x", "whatsapp
     * +1 555". A bare digit isn't enough, since "I use telegram 24/7" is ordinary talk.
     */
    private static final Pattern MESSENGER = Pattern.compile(
            "\\b(?:telegram|whatsapp|whats app|snapchat|wechat|kik) ?(?::|@|\\+|me\\b|id\\b)");

    /** Follow and like trading, written as one token. */
    private static final Pattern TRADE = Pattern.compile(
            "\\b(?:f4f|l4l|sub4sub|follow4follow|like4like)\\b");

    /** Whether the comment text has a spam shape. Null and blank text never do. */
    static boolean looksLikeSpam(String text) {
        if (text == null || text.isEmpty()) {
            return false;
        }
        String normalized = normalize(text);
        if (normalized.isEmpty()) {
            return false;
        }
        for (String phrase : PHRASES) {
            if (containsPhrase(normalized, phrase)) {
                return true;
            }
        }
        return LINK.matcher(normalized).find()
                || MESSENGER.matcher(normalized).find()
                || TRADE.matcher(normalized).find();
    }

    /**
     * Lowercase with every run of whitespace as one space. Zero-width characters and soft hyphens
     * go, since bots slip them between letters to get past word filters.
     */
    static String normalize(String text) {
        StringBuilder out = new StringBuilder(text.length());
        boolean pendingSpace = false;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if ((c >= 0x200B && c <= 0x200F) || c == 0x2060 || c == 0xFEFF || c == 0x00AD) {
                continue;
            }
            if (Character.isWhitespace(c) || Character.isSpaceChar(c)) {
                pendingSpace = out.length() > 0;
                continue;
            }
            if (pendingSpace) {
                out.append(' ');
                pendingSpace = false;
            }
            out.append(Character.toLowerCase(c));
        }
        return out.toString();
    }

    /** {@code phrase} in {@code text} with no letter or digit touching either end. */
    private static boolean containsPhrase(String text, String phrase) {
        int from = 0;
        while (true) {
            int at = text.indexOf(phrase, from);
            if (at < 0) {
                return false;
            }
            int end = at + phrase.length();
            boolean startClear = at == 0 || !Character.isLetterOrDigit(text.charAt(at - 1));
            boolean endClear = end == text.length() || !Character.isLetterOrDigit(text.charAt(end));
            if (startClear && endClear) {
                return true;
            }
            from = at + 1;
        }
    }
}
