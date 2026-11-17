/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.Patterns;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Link preview rules (#79): a sent message whose link a rule covers gets its preview from the
 * rule's other site, while the text goes out as it was typed. The hook sits at the start of
 * Telegram's send of a message and hands the send a link preview of the other address, which
 * Telegram already sends as an InputMediaWebPage next to the text. A rule is one line,
 * {@code original -> alternative}, with {@code *.} in front of the original to cover its
 * subdomains too; {@code *.} in front of the alternative as well carries the subdomain over. A
 * path after the original, such as {@code x.com/*}{@code /status}, covers only links whose path
 * starts that way, {@code *} standing for any one part. The sites the rules start with make
 * previews of posts only (a profile link to fixupx.com previews its code page, kktiktok.com and
 * kkclip.com answer 404), so those rules name their sites' post paths.
 *
 * <p>Only the preview Telegram would show is changed: the one picked in the message bar, or else
 * the message's first link. Secret chats, retries, messages with their preview turned off and
 * bots' inline results stay stock, and so does a link with a user name or an unusual address.
 */
public final class LinkPreviewRules {
    /** The rules the row starts with. */
    public static final String DEFAULT_RULES = "twitter.com/*/status -> fixupx.com\n"
            + "x.com/*/status -> fixupx.com\n"
            + "*.tiktok.com/*/video -> *.kktiktok.com\n"
            + "*.tiktok.com/*/photo -> *.kktiktok.com\n"
            + "*.tiktok.com/t -> *.kktiktok.com\n"
            + "vm.tiktok.com -> vm.kktiktok.com\n"
            + "vt.tiktok.com -> vt.kktiktok.com\n"
            + "reddit.com/r/*/comments -> vxreddit.com\n"
            + "reddit.com/r/*/s -> vxreddit.com\n"
            + "instagram.com/p -> kkclip.com\n"
            + "instagram.com/reel -> kkclip.com\n"
            + "instagram.com/reels -> kkclip.com\n"
            + "instagram.com/tv -> kkclip.com\n"
            + "pixiv.net -> phixiv.net";
    /** How long the rules may be as they're kept, so they always fit in a settings file. */
    public static final int MAX_TEXT = 1000;
    private static final int MAX_HOST = 253;
    private static final int MAX_LINK = 4096;
    private static final String ARROW = "->";
    private static final String ANY = "*.";
    private static final Pattern LABEL = Pattern.compile("[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?");
    private static final Pattern SCHEME = Pattern.compile("^([A-Za-z][A-Za-z0-9+.-]*)://");
    private static final Pattern PORT = Pattern.compile("[0-9]{1,5}");
    private static final String ANY_PART = "*";
    private static final Pattern PART = Pattern.compile("\\*|[a-z0-9._~@%+-]{1,64}");
    private static final int MAX_PARTS = 8;

    private LinkPreviewRules() {}

    /**
     * One rule: [from] and its subdomains when [anySubdomain], for links whose path starts with
     * [path] ({@code *} for any one part), and the site its previews come from.
     */
    public static final class Rule {
        final String from;
        final boolean anySubdomain;
        final List<String> path;
        final String to;
        final boolean keepSubdomain;

        Rule(String from, boolean anySubdomain, List<String> path, String to, boolean keepSubdomain) {
            this.from = from;
            this.anySubdomain = anySubdomain;
            this.path = Collections.unmodifiableList(new ArrayList<>(path));
            this.to = to;
            this.keepSubdomain = keepSubdomain;
        }

        /** The rule as the editor shows it. */
        @Override
        public String toString() {
            StringBuilder written = new StringBuilder(anySubdomain ? ANY : "").append(from);
            for (String part : path) written.append('/').append(part);
            return written.append(' ').append(ARROW).append(' ').append(keepSubdomain ? ANY : "").append(to).toString();
        }
    }

    /** What a rules text holds: its rules in order, and how many lines with something on them weren't one. */
    public static final class Parsed {
        public final List<Rule> rules;
        public final int skipped;

        Parsed(List<Rule> rules, int skipped) {
            this.rules = Collections.unmodifiableList(rules);
            this.skipped = skipped;
        }

        /** The rules, one a line, as they're kept. */
        public String text() {
            StringBuilder text = new StringBuilder();
            for (Rule rule : rules) {
                if (text.length() > 0) text.append('\n');
                text.append(rule);
            }
            return text.toString();
        }
    }

    // ---- Rules ---------------------------------------------------------------------------------

    /** The rules in [typed], one a line. A line that isn't a rule is skipped and counted. */
    public static Parsed parse(@Nullable String typed) {
        List<Rule> rules = new ArrayList<>();
        int skipped = 0;
        if (typed != null) {
            for (String line : typed.split("\n")) {
                if (line.trim().isEmpty()) continue;
                Rule rule = rule(line);
                if (rule == null) {
                    skipped++;
                } else {
                    rules.add(rule);
                }
            }
        }
        return new Parsed(rules, skipped);
    }

    /** Whether [text] is rules as the editor keeps them: every line a rule, written its way, and short enough. */
    public static boolean allowed(@Nullable String text) {
        if (text == null || text.length() > MAX_TEXT) return false;
        Parsed parsed = parse(text);
        return parsed.skipped == 0 && parsed.text().equals(text);
    }

    /** The rule [line] holds, or null when it isn't one. */
    @Nullable
    static Rule rule(String line) {
        int arrow = line.indexOf(ARROW);
        if (arrow < 0 || line.indexOf(ARROW, arrow + ARROW.length()) >= 0) return null;
        String from = line.substring(0, arrow).trim().toLowerCase(Locale.ROOT);
        String to = line.substring(arrow + ARROW.length()).trim().toLowerCase(Locale.ROOT);
        boolean anySubdomain = from.startsWith(ANY);
        boolean keepSubdomain = to.startsWith(ANY);
        if (anySubdomain) from = from.substring(ANY.length());
        if (keepSubdomain) to = to.substring(ANY.length());
        // A subdomain can only be carried over from a rule that covers subdomains.
        if (keepSubdomain && !anySubdomain) return null;
        List<String> path = new ArrayList<>();
        int slash = from.indexOf('/');
        if (slash >= 0) {
            String written = from.substring(slash + 1);
            from = from.substring(0, slash);
            // One slash at the end is the same path without it.
            if (written.endsWith("/")) written = written.substring(0, written.length() - 1);
            if (!written.isEmpty()) {
                for (String part : written.split("/", -1)) {
                    if (!PART.matcher(part).matches()) return null;
                    path.add(part);
                }
            }
            if (path.size() > MAX_PARTS) return null;
        }
        if (!host(from) || !host(to) || from.equals(to)) return null;
        return new Rule(from, anySubdomain, path, to, keepSubdomain);
    }

    /** Whether [name] is a lowercase host name with at least two labels and a last one that isn't a number. */
    static boolean host(String name) {
        if (name.isEmpty() || name.length() > MAX_HOST) return false;
        String[] labels = name.split("\\.", -1);
        if (labels.length < 2) return false;
        for (String label : labels) {
            if (!LABEL.matcher(label).matches()) return false;
        }
        return !labels[labels.length - 1].matches("[0-9]+");
    }

    /**
     * [link] with its host swapped for that of the first of [rules] that covers it, its scheme,
     * port, path, query and fragment kept as they are, or null when no rule covers it. A link
     * without a scheme gets https. A {@code www.} in front of a host counts as the host itself,
     * and a rule's path is matched part by part whatever the link's letter case.
     */
    @Nullable
    public static String rewrite(@Nullable String link, List<Rule> rules) {
        if (link == null || link.isEmpty() || link.length() > MAX_LINK || rules.isEmpty()) return null;
        String scheme = "https";
        String rest = link;
        Matcher named = SCHEME.matcher(link);
        if (named.find()) {
            scheme = named.group(1).toLowerCase(Locale.ROOT);
            if (!scheme.equals("http") && !scheme.equals("https")) return null;
            rest = link.substring(named.end());
        }
        int end = rest.length();
        for (char stop : new char[] {'/', '?', '#'}) {
            int at = rest.indexOf(stop);
            if (at >= 0 && at < end) end = at;
        }
        String authority = rest.substring(0, end);
        String tail = rest.substring(end);
        // A user name in front of the host is how a link pretends to be a site it isn't.
        if (authority.indexOf('@') >= 0 || authority.startsWith("[")) return null;
        String host = authority;
        String port = null;
        int colon = authority.indexOf(':');
        if (colon >= 0) {
            host = authority.substring(0, colon);
            port = authority.substring(colon + 1);
            if (!PORT.matcher(port).matches()) return null;
        }
        host = host.toLowerCase(Locale.ROOT);
        if (host.endsWith(".")) host = host.substring(0, host.length() - 1);
        if (!host(host)) return null;
        String bare = host.startsWith("www.") ? host.substring("www.".length()) : host;
        List<String> parts = parts(tail);
        for (Rule rule : rules) {
            if (!starts(parts, rule.path)) continue;
            String swapped = swap(rule, host, bare);
            if (swapped != null) return scheme + "://" + swapped + (port != null ? ":" + port : "") + tail;
        }
        return null;
    }

    /** The parts of the path that starts [tail], lowercase, empty ones left out. */
    private static List<String> parts(String tail) {
        int end = tail.length();
        for (char stop : new char[] {'?', '#'}) {
            int at = tail.indexOf(stop);
            if (at >= 0 && at < end) end = at;
        }
        List<String> parts = new ArrayList<>();
        for (String part : tail.substring(0, end).split("/")) {
            if (!part.isEmpty()) parts.add(part.toLowerCase(Locale.ROOT));
        }
        return parts;
    }

    /** Whether [parts] begin with [path], where {@code *} is any one part. */
    private static boolean starts(List<String> parts, List<String> path) {
        if (parts.size() < path.size()) return false;
        for (int i = 0; i < path.size(); i++) {
            if (!path.get(i).equals(ANY_PART) && !path.get(i).equals(parts.get(i))) return false;
        }
        return true;
    }

    /** The host [rule] gives [host], or null when it doesn't cover it. */
    @Nullable
    private static String swap(Rule rule, String host, String bare) {
        if (bare.equals(rule.from)) return rule.to;
        if (!rule.anySubdomain || !host.endsWith("." + rule.from)) return null;
        if (!rule.keepSubdomain) return rule.to;
        return host.substring(0, host.length() - rule.from.length()) + rule.to;
    }

    /** The first link in [text] Telegram would make a preview of: a web address that isn't part of an email address. */
    @Nullable
    static String firstLink(@Nullable String text) {
        if (text == null || text.isEmpty()) return null;
        Matcher links = Patterns.WEB_URL.matcher(text);
        while (links.find()) {
            int start = links.start();
            if (start > 0 && text.charAt(start - 1) == '@') continue;
            return links.group();
        }
        return null;
    }

    /** The rules kept for the row, which start as {@link #DEFAULT_RULES}. What was saved, paused or not. */
    public static Parsed saved() {
        return parse(Settings.LINK_PREVIEW_RULE_LIST.savedValue());
    }

    /** Keeps [rules] in place of any before. Off the main thread. */
    public static boolean save(Parsed rules) {
        return Settings.LINK_PREVIEW_RULE_LIST.saveCommitted(rules.text());
    }

    // ---- Send ----------------------------------------------------------------------------------

    /**
     * Telegram's send of a message, before it reads anything from [params]. With the switch on and
     * a rule covering the link Telegram would preview, the send gets a preview of the rule's
     * address instead. Anything else, or anything that goes wrong, leaves the send as it was.
     */
    public static void send(Object params) {
        HookStatus.invoked(FamilyNames.DISABLE_DRAFT_PREVIEWS);
        try {
            if (!Utils.settingsReady() || !Settings.LINK_PREVIEW_RULES.get()) return;
            String alternative = alternative(params);
            if (alternative == null) return;
            point(params, alternative);
            HookStatus.counted(FamilyNames.DISABLE_DRAFT_PREVIEWS, "link preview rule applied");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_DRAFT_PREVIEWS, "link preview rule", t);
        }
    }

    /** The address the preview of the send in [params] should come from, or null to leave it. */
    @Nullable
    static String alternative(Object params) {
        String text = text(params);
        if (text == null || encrypted(peer(params))) return null;
        HashMap<String, String> extras = extras(params);
        if (extras != null && (extras.containsKey("query_id") || extras.containsKey("bot"))) return null;
        String chosen = chosen(params);
        String link = chosen != null ? chosen : firstLink(text);
        return rewrite(link, saved().rules);
    }

    /** Whether [dialogId] is a secret chat's, whose previews Telegram makes on the phone. */
    static boolean encrypted(long dialogId) {
        return (dialogId & 0x4000000000000000L) != 0 && (dialogId & 0x8000000000000000L) == 0;
    }

    // ---- Stubs ---------------------------------------------------------------------------------
    // Bodies written when you patch: they name Telegram's obfuscated send parameters. Until then
    // they read a Params, which is how the tests stand in for a send.

    /** A send as the tests make one. */
    interface Params {
        @Nullable String text();
        long peer();
        @Nullable HashMap<String, String> extras();
        @Nullable String chosen();
        void point(String address);
    }

    /** The text of a send that's a plain new message with its preview on, or null for anything else. */
    @Nullable
    static String text(Object params) {
        return params instanceof Params ? ((Params) params).text() : null;
    }

    /** The send's dialog. */
    static long peer(Object params) {
        return params instanceof Params ? ((Params) params).peer() : 0;
    }

    /** The extras Telegram passes some sends, a bot's inline result among them. */
    @Nullable
    static HashMap<String, String> extras(Object params) {
        return params instanceof Params ? ((Params) params).extras() : null;
    }

    /** The address of the preview picked in the message bar, "" for one without, or null when none was picked. */
    @Nullable
    static String chosen(Object params) {
        return params instanceof Params ? ((Params) params).chosen() : null;
    }

    /** Gives the send a preview of [address] still to be made, with the picked preview's size kept. */
    static void point(Object params, String address) {
        if (params instanceof Params) ((Params) params).point(address);
    }
}
