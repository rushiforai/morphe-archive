package app.userinsights.extension;

import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextPaint;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Finds usernames, profile pages and the "hidden profile" message on a Reddit screen by reading
 * its accessibility tree. This does not depend on Reddit's (obfuscated) code, so it keeps working
 * across app updates as long as the visible text stays similar.
 */
final class ScreenScanner {
    private static final int MAX_NODES = 1500;
    private static final int MAX_DUMP_LINES = 500;

    private static final String NAME = "([A-Za-z0-9_-]{3,20})";
    /** Separators Reddit puts between header parts: bullet, middle dot, comma. */
    private static final String SEP = "[\\u2022\\u00B7,]";
    /** "4h", "4 hr. ago", "4 hours ago", "just now". */
    private static final String TIME_TOKEN =
            "(?:\\d+\\s?(?:s|m|h|d|w|mo|y|yr|yrs|min|mins|hr|hrs|sec|secs|day|days|wk|wks)\\.?(?:\\s+ago)?"
                    + "|\\d+\\s+(?:second|minute|hour|day|week|month|year)s?(?:\\s+ago)?"
                    + "|(?:an?|one)\\s+(?:second|minute|hour|day|week|month|year)\\s+ago"
                    + "|just now)";
    private static final String TAGS = "(?:OP|MOD|Mod|Admin|ADMIN|Edited|edited)";

    /** "u/name" on its own. */
    private static final Pattern U_EXACT = Pattern.compile("^\\s*u/" + NAME + "\\s*$");
    /** "u/name • 3h" and similar headers. */
    private static final Pattern U_LEADING = Pattern.compile("^\\s*u/" + NAME + "\\s*" + SEP);
    /**
     * "name 4h", "name OP 4h", "name • 4h", "name, 4h, flair".
     * The time must end the line or be followed by a separator, so a comment body such as
     * "Waited 3h for this" is not taken for a header.
     */
    private static final Pattern NAME_TIME = Pattern.compile(
            "^" + NAME + "(?:[\\s\\u2022\\u00B7,]+" + TAGS + ")?[\\s\\u2022\\u00B7,]+" + TIME_TOKEN
                    + "(?=[ \\t]*(?:[\\u2022\\u00B7,\\r\\n]|$))",
            Pattern.CASE_INSENSITIVE);
    /** A bare name candidate. */
    private static final Pattern BARE_NAME = Pattern.compile("^" + NAME + "$");
    /** "3h", "• 3h", "3h ago", "2mo", "just now", "Edited 1h". */
    private static final Pattern TIME = Pattern.compile(
            "^" + SEP + "?\\s*(?:edited\\s+)?(?:" + TIME_TOKEN + "|now)\\s*$", Pattern.CASE_INSENSITIVE);
    private static final Pattern DOT = Pattern.compile("^\\s*" + SEP + "\\s*$");
    private static final Pattern TAG = Pattern.compile("^\\s*" + TAGS + "\\s*$");

    /** Content descriptions of whole comments/posts (TalkBack labels). */
    private static final Pattern DESC_U = Pattern.compile("(?<![A-Za-z0-9_/-])u/" + NAME + "(?![A-Za-z0-9_-])");
    private static final Pattern DESC_BY = Pattern.compile(
            "\\b(?:comment|reply|post|posted|commented|replied|written)\\s+by\\s+(?:u/)?" + NAME + "(?![A-Za-z0-9_-])",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern DESC_AUTHOR = Pattern.compile(
            "\\bauthor[:,]?\\s+(?:u/)?" + NAME + "(?![A-Za-z0-9_-])", Pattern.CASE_INSENSITIVE);
    private static final Pattern DESC_NAME_AGO = Pattern.compile(
            "^" + NAME + "[,.]?\\s+(?:\\d+|an?|one)\\s+(?:second|minute|hour|day|week|month|year)s?\\s+ago",
            Pattern.CASE_INSENSITIVE);

    /** Labels of profile pictures next to names, such as "underthestarlights avatar". */
    private static final Pattern DESC_AVATAR = Pattern.compile(
            "^(?:(?:u/)?" + NAME + "(?:'s)?\\s+(?:avatar|profile (?:picture|image|icon)|snoovatar)"
                    + "|(?:avatar|profile (?:picture|image|icon)|snoovatar)\\s+(?:for|of)\\s+(?:u/)?([A-Za-z0-9_-]{3,20}))\\s*$",
            Pattern.CASE_INSENSITIVE);

    /** The message Reddit shows on profiles that hide their activity. */
    private static final Pattern HIDDEN = Pattern.compile(
            "(keeps?\\s+(?:their|this|his|her)\\s+(?:profile|activity|account|posts|comments)[^.]{0,30}(?:hidden|private)"
                    + "|likes\\s+to\\s+keep"
                    + "|(?:profile|activity|history|posts and comments)\\s+(?:is|are)\\s+(?:hidden|private)"
                    + "|(?:hid|hides|hidden)\\s+(?:their|this|his|her)\\s+(?:profile|activity|posts|comments|history)"
                    + "|has\\s+hidden)",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern NAME_IN_HIDDEN = Pattern.compile(
            "(?:u/)?" + NAME + "\\s+(?:likes\\s+to\\s+keep|keeps|has\\s+hidden|hid|hides)", Pattern.CASE_INSENSITIVE);

    /** The reply bar under comments, which covers the comment below it. */
    private static final Pattern COMPOSER = Pattern.compile(
            "^\\s*\\+?\\s*(?:join the conversation|add a comment|write a comment|add a reply|reply to .{1,40})\\s*$",
            Pattern.CASE_INSENSITIVE);

    /** Tab labels of a profile page. */
    private static final Set<String> PROFILE_TABS = new HashSet<>(Arrays.asList(
            "posts", "comments", "about", "overview"));

    private static final Set<String> STOP_WORDS = new HashSet<>(Arrays.asList(
            "reply", "replies", "share", "award", "awards", "vote", "votes", "upvote", "downvote", "join", "joined",
            "follow", "following", "followers", "sort", "best", "top", "new", "hot", "rising", "controversial", "old",
            "comments", "comment", "more", "edited", "pinned", "locked", "moderator", "mod", "mods", "admin", "op",
            "search", "home", "answers", "chat", "inbox", "create", "communities", "community", "popular", "latest",
            "trending", "promoted", "sponsored", "save", "saved", "hide", "hidden", "report", "block", "copy",
            "translate", "translated", "view", "show", "collapse", "expand", "profile", "about", "posts", "post",
            "overview", "karma", "nsfw", "spoiler", "video", "image", "images", "gallery", "link", "poll", "live",
            "reddit", "settings", "cancel", "done", "back", "close", "menu", "open", "see", "all", "notifications",
            "avatar", "today", "yesterday", "now", "ago", "deleted", "removed", "unknown", "anonymous", "guest",
            "media", "text", "feed", "default", "card", "compact", "classic", "games", "shop", "premium", "coins",
            "online", "members", "member", "subscribers", "rules", "wiki", "sidebar", "edit", "delete", "send",
            "username", "user", "users", "you", "me", "your", "this", "that", "here", "there", "and", "the",
            "just", "level", "contributor", "visitors", "contributions", "achievements"));

    static final class Hit {
        final String user;
        /** Where the name (and the time after it, if found) is on screen. */
        final Rect bounds;
        /** True when the name came from a whole comment/post, not a one-line header. */
        final boolean merged;
        /**
         * The header text ("name 4h") when the node may be wider than its text,
         * so the pills can go right after the text instead of after the node.
         */
        final String headerText;
        /** True for the u/name header of a profile page. */
        boolean profileHeader;
        /** Screen x where the header text ("name 4h") really ends, or -1 if unknown. */
        int textRight = -1;
        /** Bounds of the list the name is in (screen), or null. Pills stay inside it. */
        Rect container;

        Hit(String user, Rect bounds, boolean merged, String headerText) {
            this.user = user;
            this.bounds = bounds;
            this.merged = merged;
            this.headerText = headerText;
        }
    }

    static final class Result {
        final List<Hit> hits = new ArrayList<>();
        /** User of the profile page on screen, hidden or not. */
        String profileUser;
        /** Set when the profile hides its activity. */
        String hiddenUser;
        Rect hiddenBounds;
        /** Bottom of the profile tabs (Posts/Comments/About), or -1. */
        int profileContentTop = -1;
        String dump;
    }

    private static final class Node {
        String text;
        String desc;
        final Rect bounds = new Rect();
        boolean clickable;
        String cls;
        String viewId;
        int depth;
        AccessibilityNodeInfo info;
        /** Bounds of the nearest scrollable ancestor (the list), or null. */
        Rect container;
    }

    private ScreenScanner() {
    }

    static Result scan(AccessibilityNodeInfo root, boolean dump, DisplayMetrics metrics) {
        float density = metrics.density;
        TextPaint paint = new TextPaint(TextPaint.ANTI_ALIAS_FLAG);
        paint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14, metrics));
        List<Node> nodes = flatten(root);
        Result result = new Result();
        if (dump) {
            result.dump = buildDump(nodes);
        }

        int maxRowHeight = (int) (72 * density);
        Set<String> usedBounds = new HashSet<>();
        List<Hit> avatarHits = new ArrayList<>();

        for (int i = 0; i < nodes.size(); i++) {
            Node node = nodes.get(i);
            String text = node.text;

            if (text != null && text.length() <= 400) {
                boolean tall = node.bounds.height() > maxRowHeight;
                boolean shortText = text.length() <= 60;

                // u/name on its own, or at the start of a header such as "u/name • 3h".
                Matcher m = U_EXACT.matcher(text);
                boolean exact = m.find();
                if (!exact) {
                    m = U_LEADING.matcher(text);
                    if (!m.find() || (tall && shortText)) {
                        m = null;
                    }
                }
                if (m != null) {
                    Hit hit = addHit(result, usedBounds, m.group(1), node.bounds, tall,
                            tall ? null : text.trim());
                    if (hit != null) {
                        hit.profileHeader = exact;
                        hit.container = node.container;
                        if (!tall) {
                            hit.textRight = textRight(node, text, shortText ? text.length() : m.end(1), paint, density);
                        }
                    }
                    continue;
                }

                // "name 4h", "name OP 4h", "name • 4h", "name, 4h, flair".
                m = NAME_TIME.matcher(text);
                if (m.find() && isPlausibleName(m.group(1))) {
                    boolean merged = tall && !shortText;
                    Hit hit = addHit(result, usedBounds, m.group(1), node.bounds, merged, m.group(0));
                    if (hit != null) {
                        hit.container = node.container;
                        if (!merged) {
                            hit.textRight = textRight(node, text, m.end(), paint, density);
                        }
                    }
                    continue;
                }

                // A bare name followed by the time on the same row, as separate nodes.
                if (shortText && !tall) {
                    m = BARE_NAME.matcher(text.trim());
                    if (m.find() && isPlausibleName(m.group(1)) && node.bounds.height() > 0) {
                        int timeIndex = followingTime(nodes, i);
                        if (timeIndex >= 0) {
                            // Put the pills after the time, not between the name and the time.
                            Node time = nodes.get(timeIndex);
                            Rect header = new Rect(node.bounds);
                            header.union(time.bounds);
                            Hit hit = addHit(result, usedBounds, m.group(1), header, false, null);
                            if (hit != null) {
                                hit.container = node.container;
                                int nameRight = textRight(node, text, text.length(), paint, density);
                                String timeText = time.text != null ? time.text : time.desc;
                                int timeRight = time.text != null
                                        ? textRight(time, timeText, timeText.length(), paint, density)
                                        : time.bounds.right;
                                hit.textRight = Math.max(nameRight, timeRight);
                            }
                            continue;
                        }
                    }
                }
            }

            // Labels of whole comments/posts, used when the name is not a separate node.
            String desc = node.desc;
            if (desc != null && desc.length() <= 400) {
                boolean tall = node.bounds.height() > maxRowHeight;

                // "name, 4 hours ago, ..." as a label.
                Matcher header = NAME_TIME.matcher(desc);
                if (header.find() && isPlausibleName(header.group(1))) {
                    Hit hit = addHit(result, usedBounds, header.group(1), node.bounds, tall && desc.length() > 60,
                            text == null ? header.group(0) : null);
                    if (hit != null) {
                        hit.container = node.container;
                    }
                    continue;
                }

                // A profile picture with the name in its label: the name is written right next to it.
                Matcher avatar = DESC_AVATAR.matcher(desc.trim());
                if (avatar.find()) {
                    String user = avatar.group(1) != null ? avatar.group(1) : avatar.group(2);
                    if (isPlausibleName(user) && node.bounds.height() <= maxRowHeight) {
                        Hit avatarHit = new Hit(user, new Rect(node.bounds), false, user + " 00h");
                        avatarHit.container = node.container;
                        avatarHits.add(avatarHit);
                    }
                    continue;
                }

                String user = null;
                Matcher m = DESC_BY.matcher(desc);
                if (m.find()) {
                    user = m.group(1);
                } else if ((m = DESC_AUTHOR.matcher(desc)).find()) {
                    user = m.group(1);
                } else if ((m = DESC_NAME_AGO.matcher(desc)).find() && isPlausibleName(m.group(1))) {
                    user = m.group(1);
                } else if (desc.length() <= 60 && (m = DESC_U.matcher(desc)).find()) {
                    user = m.group(1);
                }
                if (user != null) {
                    boolean merged = node.bounds.height() > maxRowHeight;
                    Hit hit = addHit(result, usedBounds, user, node.bounds, merged, null);
                    if (hit != null) {
                        hit.container = node.container;
                    }
                }
            }
        }

        addAvatarHits(result, usedBounds, avatarHits, density);
        removeMergedDuplicates(result.hits);
        removeCovered(nodes, result.hits);
        findProfile(nodes, result);
        findHiddenProfile(nodes, result);
        return result;
    }

    private static boolean isPlausibleName(String name) {
        if (name == null || name.length() < 3) {
            return false;
        }
        String lower = name.toLowerCase(Locale.ROOT);
        if (STOP_WORDS.contains(lower)) {
            return false;
        }
        // All digits, or a time like "12h", is not a name.
        return !lower.matches("\\d+") && !lower.matches("\\d+(s|m|h|d|w|mo|y|yr|k)");
    }

    /** Index of the time node that follows a name on the same row, or -1. */
    private static int followingTime(List<Node> nodes, int index) {
        Node name = nodes.get(index);
        int checked = 0;
        for (int j = index + 1; j < nodes.size() && checked < 5; j++) {
            Node next = nodes.get(j);
            String text = next.text != null ? next.text : next.desc;
            if (text == null || text.trim().isEmpty()) {
                continue;
            }
            checked++;
            if (!sameRow(name.bounds, next.bounds)) {
                return -1;
            }
            String trimmed = text.trim();
            if (TIME.matcher(trimmed).matches()) {
                return j;
            }
            if (DOT.matcher(trimmed).matches() || TAG.matcher(trimmed).matches()) {
                continue;
            }
            // Flair or another label between the name and the time: keep looking a little.
        }
        return -1;
    }

    private static boolean sameRow(Rect a, Rect b) {
        if (b.height() <= 0) {
            return true;
        }
        int tolerance = Math.max(a.height(), b.height());
        return Math.abs(a.centerY() - b.centerY()) <= tolerance;
    }

    private static Hit addHit(Result result, Set<String> usedBounds, String user, Rect bounds,
                              boolean merged, String headerText) {
        if (bounds.width() <= 0 || bounds.height() <= 0) {
            return null;
        }
        if (!usedBounds.add(bounds.flattenToString())) {
            return null;
        }
        Hit hit = new Hit(user, new Rect(bounds), merged, headerText);
        result.hits.add(hit);
        return hit;
    }

    /**
     * Adds names known only from a profile picture's label, when the name was not found as text.
     * The name is written to the right of the picture, on its first line.
     */
    private static void addAvatarHits(Result result, Set<String> usedBounds, List<Hit> avatarHits, float density) {
        for (Hit avatar : avatarHits) {
            boolean found = false;
            for (Hit hit : result.hits) {
                if (hit.user.equalsIgnoreCase(avatar.user)
                        && Math.abs(hit.bounds.top - avatar.bounds.top) < avatar.bounds.height() + 40 * density) {
                    found = true;
                    break;
                }
            }
            if (found) {
                continue;
            }
            int left = avatar.bounds.right + (int) (8 * density);
            int lineHeight = (int) (22 * density);
            // Wide on purpose: the pills are placed after the measured "name 00h" text.
            Rect line = new Rect(left, avatar.bounds.top, left + (int) (2000 * density), avatar.bounds.top + lineHeight);
            Hit hit = addHit(result, usedBounds, avatar.user, line, false, avatar.headerText);
            if (hit != null) {
                hit.container = avatar.container;
            }
        }
    }

    /**
     * Screen x where text[0, end) ends inside a node. Exact when Android can report character
     * positions (Compose text can); otherwise measured.
     */
    private static int textRight(Node node, String text, int end, TextPaint paint, float density) {
        end = Math.max(1, Math.min(end, text.length()));
        String firstLine = text.split("\n", 2)[0];
        boolean wholeText = end >= text.trim().length();
        // A node about as wide as its text ends where its text ends.
        if (wholeText && node.bounds.width() <= paint.measureText(firstLine) + 24 * density) {
            return node.bounds.right;
        }
        int exact = characterRight(node.info, end - 1);
        if (exact > 0) {
            return Math.min(node.bounds.right, exact);
        }
        String part = text.substring(0, end).split("\n", 2)[0];
        int measured = (int) Math.ceil(paint.measureText(part) * 1.05f);
        return Math.min(node.bounds.right, node.bounds.left + measured);
    }

    /** Right edge on screen of one character of a text node, or -1. */
    private static int characterRight(AccessibilityNodeInfo info, int index) {
        if (info == null || index < 0 || Build.VERSION.SDK_INT < 26) {
            return -1;
        }
        try {
            String key = AccessibilityNodeInfo.EXTRA_DATA_TEXT_CHARACTER_LOCATION_KEY;
            List<String> available = info.getAvailableExtraData();
            if (available == null || !available.contains(key)) {
                return -1;
            }
            Bundle args = new Bundle();
            args.putInt(AccessibilityNodeInfo.EXTRA_DATA_TEXT_CHARACTER_LOCATION_ARG_START_INDEX, index);
            args.putInt(AccessibilityNodeInfo.EXTRA_DATA_TEXT_CHARACTER_LOCATION_ARG_LENGTH, 1);
            if (!info.refreshWithExtraData(key, args)) {
                return -1;
            }
            Parcelable[] boxes = info.getExtras().getParcelableArray(key);
            if (boxes != null && boxes.length > 0 && boxes[0] instanceof RectF) {
                RectF box = (RectF) boxes[0];
                if (box.right > 0) {
                    return (int) Math.ceil(box.right);
                }
            }
        } catch (Throwable ignored) {
            // Not supported by this node.
        }
        return -1;
    }

    /**
     * Drops names that are covered by the reply bar, or outside the visible part of their list
     * (such as a comment that is scrolled under the bar at the bottom).
     */
    private static void removeCovered(List<Node> nodes, List<Hit> hits) {
        List<Rect> covers = new ArrayList<>();
        for (Node node : nodes) {
            String label = node.text != null ? node.text : node.desc;
            if (node.cls.endsWith("EditText") || (label != null && label.length() <= 60 && COMPOSER.matcher(label).find())) {
                covers.add(node.bounds);
            }
        }
        List<Hit> remove = new ArrayList<>();
        for (Hit hit : hits) {
            if (hit.container != null && (hit.bounds.centerY() < hit.container.top
                    || hit.bounds.centerY() > hit.container.bottom)) {
                remove.add(hit);
                continue;
            }
            for (Rect cover : covers) {
                if (Rect.intersects(cover, hit.bounds) && hit.bounds.centerY() >= cover.top - 4) {
                    remove.add(hit);
                    break;
                }
            }
        }
        hits.removeAll(remove);
    }

    /** Drops a whole-comment hit when the same name was also found as its own text inside it. */
    private static void removeMergedDuplicates(List<Hit> hits) {
        List<Hit> remove = new ArrayList<>();
        for (Hit merged : hits) {
            if (!merged.merged) {
                continue;
            }
            for (Hit exact : hits) {
                if (!exact.merged && exact.user.equalsIgnoreCase(merged.user)
                        && merged.bounds.contains(exact.bounds.centerX(), exact.bounds.centerY())) {
                    remove.add(merged);
                    break;
                }
            }
        }
        hits.removeAll(remove);
    }

    /** A profile page shows "u/name" and tabs such as Posts and Comments. */
    private static void findProfile(List<Node> nodes, Result result) {
        Hit header = null;
        for (Hit hit : result.hits) {
            if (hit.profileHeader && (header == null || hit.bounds.top < header.bounds.top)) {
                header = hit;
            }
        }
        int tabs = 0;
        int tabsBottom = -1;
        for (Node node : nodes) {
            String text = node.text != null ? node.text : node.desc;
            if (text == null || text.length() > 20) {
                continue;
            }
            String lower = text.trim().toLowerCase(Locale.ROOT);
            if (PROFILE_TABS.contains(lower)) {
                tabs++;
                tabsBottom = Math.max(tabsBottom, node.bounds.bottom);
            }
        }
        if (tabs >= 2) {
            result.profileContentTop = tabsBottom;
            if (header != null) {
                result.profileUser = header.user;
            }
        }
    }

    private static void findHiddenProfile(List<Node> nodes, Result result) {
        for (int i = 0; i < nodes.size(); i++) {
            Node node = nodes.get(i);
            String text = node.text != null ? node.text : node.desc;
            if (text == null || text.length() > 300 || !HIDDEN.matcher(text).find()) {
                continue;
            }

            String user = null;
            Matcher inMessage = NAME_IN_HIDDEN.matcher(text);
            if (inMessage.find() && isPlausibleName(inMessage.group(1))) {
                user = inMessage.group(1);
            }
            if (user == null) {
                user = result.profileUser;
            }
            if (user == null) {
                // The profile header usually shows u/name near the top.
                Hit top = null;
                for (Hit hit : result.hits) {
                    if (top == null || hit.bounds.top < top.bounds.top) {
                        top = hit;
                    }
                }
                if (top != null) {
                    user = top.user;
                }
            }
            if (user == null) {
                // Nearest plausible bare name above the message.
                for (int j = i - 1; j >= 0; j--) {
                    String candidate = nodes.get(j).text;
                    if (candidate == null) {
                        continue;
                    }
                    Matcher m = BARE_NAME.matcher(candidate.trim());
                    if (m.find() && isPlausibleName(m.group(1))) {
                        user = m.group(1);
                        break;
                    }
                }
            }
            if (user != null) {
                result.hiddenUser = user;
                result.hiddenBounds = new Rect(node.bounds);
                if (result.profileUser == null) {
                    result.profileUser = user;
                }
                return;
            }
        }
    }

    private static List<Node> flatten(AccessibilityNodeInfo root) {
        List<Node> out = new ArrayList<>();
        ArrayDeque<AccessibilityNodeInfo> stack = new ArrayDeque<>();
        ArrayDeque<Integer> depths = new ArrayDeque<>();
        ArrayDeque<Rect[]> containers = new ArrayDeque<>();
        stack.push(root);
        depths.push(0);
        containers.push(new Rect[]{null});

        while (!stack.isEmpty() && out.size() < MAX_NODES) {
            AccessibilityNodeInfo info = stack.pop();
            int depth = depths.pop();
            Rect container = containers.pop()[0];
            if (info == null) {
                continue;
            }
            try {
                if (!info.isVisibleToUser()) {
                    continue;
                }
                Node node = new Node();
                CharSequence text = info.getText();
                CharSequence desc = info.getContentDescription();
                node.text = text == null ? null : text.toString();
                node.desc = desc == null ? null : desc.toString();
                info.getBoundsInScreen(node.bounds);
                node.clickable = info.isClickable();
                CharSequence cls = info.getClassName();
                node.cls = cls == null ? "" : cls.toString();
                node.viewId = info.getViewIdResourceName();
                node.depth = depth;
                node.info = info;
                node.container = container;
                out.add(node);

                // Children of a scrollable node (a list) are inside it.
                Rect childContainer = info.isScrollable() ? new Rect(node.bounds) : container;
                // Push children in reverse so they are visited in order.
                int count = info.getChildCount();
                for (int c = count - 1; c >= 0; c--) {
                    AccessibilityNodeInfo child = info.getChild(c);
                    if (child != null) {
                        stack.push(child);
                        depths.push(depth + 1);
                        containers.push(new Rect[]{childContainer});
                    }
                }
            } catch (Throwable ignored) {
                // Node went stale while reading.
            }
        }
        return out;
    }

    private static String buildDump(List<Node> nodes) {
        StringBuilder sb = new StringBuilder("User Insights screen dump (")
                .append(nodes.size()).append(" nodes)\n");
        int lines = 0;
        for (Node node : nodes) {
            if (node.text == null && node.desc == null && !node.clickable) {
                continue;
            }
            if (lines++ >= MAX_DUMP_LINES) {
                sb.append("...\n");
                break;
            }
            for (int d = 0; d < Math.min(node.depth, 20); d++) {
                sb.append(' ');
            }
            String cls = node.cls;
            int dot = cls.lastIndexOf('.');
            sb.append(dot >= 0 ? cls.substring(dot + 1) : cls);
            if (node.text != null) {
                sb.append(" text=\"").append(shorten(node.text)).append('"');
            }
            if (node.desc != null) {
                sb.append(" desc=\"").append(shorten(node.desc)).append('"');
            }
            if (node.viewId != null) {
                sb.append(" id=").append(node.viewId);
            }
            if (node.clickable) {
                sb.append(" [click]");
            }
            sb.append(' ').append(node.bounds.toShortString()).append('\n');
        }
        return sb.toString();
    }

    private static String shorten(String s) {
        String oneLine = s.replace('\n', ' ');
        return oneLine.length() > 120 ? oneLine.substring(0, 120) + "…" : oneLine;
    }
}
