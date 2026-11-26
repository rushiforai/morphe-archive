/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.content.Context;
import android.text.format.DateUtils;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Edits the author rows of posts and comments: takes out the Follow or Connect button and the connection degree, and
 * shows when a post went up instead of its age.
 *
 * <p>The age is a text of its own ("17h • Edited • "). The time behind it comes from the ids in the post's payload: an
 * activity, share or ugcPost id holds its creation time in milliseconds above its lowest 22 bits.
 */
final class PostHeader {
    private static final Pattern DEGREE = Pattern.compile("[\\s\u00a0]*•\\s*(1st|2nd|3rd\\+?)\\s*");
    /** The degree at the end of a commenter's "Name • 2nd". */
    private static final Pattern NAME_DEGREE = Pattern.compile("•[\\s\u00a0]*(1st|2nd|3rd\\+?)[\\s\u00a0]*$");
    private static final Pattern AGE = Pattern.compile("(\\d+)(s|m|h|d|w|mo|yr) •.*", Pattern.DOTALL);
    private static final Pattern POST_ID = Pattern.compile("urn:li:(share|ugcPost|activity):(\\d{19})");
    private static final long DAY = DateUtils.DAY_IN_MILLIS;

    private PostHeader() {
    }

    /** The components these switches edit. */
    static final Set<String> VIEWS = new HashSet<>(Arrays.asList(
            "feed-full-update", "comment-container", "comment-actor-description", "reply-actor-description"));

    /**
     * Applies the header switches to a component.
     *
     * @param viewName one of {@link #VIEWS}
     * @param component the payload of the component
     * @return the edited payload, or {@code component} itself when nothing changed
     */
    static byte[] edit(String viewName, byte[] component) {
        if (viewName.equals("feed-full-update")) return editPost(component);
        if (viewName.equals("comment-container")) {
            return Settings.hidePostFollow() ? removeCommentFollow(component) : component;
        }
        return Settings.hideDegree() ? removeNameDegree(component) : component;
    }

    /**
     * Takes the Follow button out of a comment. The button is one case per following state of a switch, and a case
     * without its component leaves the whole comment blank, so what goes is the row child (field 7) that holds the
     * switch: the outermost one with the button and without the author's name.
     */
    private static byte[] removeCommentFollow(byte[] comment) {
        String follow = "edge-creation-follow-action";
        return ProtoEdit.editMessages(comment, follow, fields -> fields.removeIf(field -> field.number == 7
                && field.wireType == 2 && ProtoEdit.contains(field.data, follow)
                && !ProtoEdit.contains(field.data, "actor-description")));
    }

    /** Cuts the degree off a commenter's name, which is one text with it. */
    private static byte[] removeNameDegree(byte[] description) {
        return ProtoEdit.editMessages(description, "•", fields -> {
            for (ProtoEdit.Field field : fields) {
                if (field.number != 1 || field.wireType != 2) continue;
                String text = new String(field.data, StandardCharsets.UTF_8);
                Matcher degree = NAME_DEGREE.matcher(text);
                if (!degree.find()) continue;
                // The spaces before the bullet stay, as the verified badge sits in them.
                field.data = text.substring(0, degree.start()).getBytes(StandardCharsets.UTF_8);
                trimRanges(fields, degree.start());
                return true;
            }
            return false;
        });
    }

    /**
     * Fits the ranges of a text (start in field 1, length in field 2) to a shorter text: drops those past its end and
     * shortens those that cross it.
     */
    private static void trimRanges(List<ProtoEdit.Field> text, int length) {
        for (Iterator<ProtoEdit.Field> it = text.iterator(); it.hasNext(); ) {
            ProtoEdit.Field range = it.next();
            if (range.number != 2 || range.wireType != 2) continue;
            List<ProtoEdit.Field> parts = ProtoEdit.parse(range.data);
            if (parts == null) continue;
            long start = 0;
            long size = 0;
            for (ProtoEdit.Field part : parts) {
                if (part.wireType != 0) continue;
                if (part.number == 1) start = ProtoEdit.varintValue(part);
                if (part.number == 2) size = ProtoEdit.varintValue(part);
            }
            if (start >= length) {
                it.remove();
            } else if (start + size > length) {
                for (int i = 0; i < parts.size(); i++) {
                    if (parts.get(i).number == 2 && parts.get(i).wireType == 0) {
                        parts.set(i, ProtoEdit.varintField(2, length - start));
                    }
                }
                range.data = ProtoEdit.write(parts);
            }
        }
    }

    private static byte[] editPost(byte[] post) {
        if (Settings.hidePostFollow()) post = ProtoEdit.removeComponents(post, "relationship-building-button");
        boolean degree = Settings.hideDegree();
        Context context = Settings.exactPostTime() ? Settings.context() : null;
        if (!degree && context == null) return post;
        List<Object[]> ids = context == null ? null : postIds(post);
        // Both texts hold a bullet, so only the parts of the post with one are looked into.
        return ProtoEdit.editMessages(post, "•", fields -> {
            // A text message holds its text in field 1 and each styled range or inline icon in a field 2.
            for (ProtoEdit.Field field : fields) {
                if (field.number != 1 || field.wireType != 2) continue;
                String text = new String(field.data, StandardCharsets.UTF_8);
                if (degree && DEGREE.matcher(text).matches()) {
                    // What precedes the bullet stays, as the verified badge sits in it.
                    String kept = text.substring(0, text.indexOf('•'));
                    field.data = (kept.isEmpty() ? "\u200b" : kept).getBytes(StandardCharsets.UTF_8);
                    return true;
                }
                Matcher age = AGE.matcher(text);
                if (context == null || !age.matches()) continue;
                long time = postTime(ids, Long.parseLong(age.group(1)), unit(age.group(2)), System.currentTimeMillis());
                if (time == 0) continue;
                String date = DateUtils.formatDateTime(context, time,
                        DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_TIME | DateUtils.FORMAT_ABBREV_MONTH);
                field.data = (date + text.substring(age.end(2))).getBytes(StandardCharsets.UTF_8);
                shiftRanges(fields, age.end(2), date.length() - age.end(2));
                return true;
            }
            return false;
        });
    }

    /** Moves the ranges of a text (their start in field 1) that begin at {@code from} or later by {@code shift}. */
    private static void shiftRanges(List<ProtoEdit.Field> text, int from, int shift) {
        for (ProtoEdit.Field range : text) {
            if (range.number != 2 || range.wireType != 2) continue;
            List<ProtoEdit.Field> parts = ProtoEdit.parse(range.data);
            if (parts == null) continue;
            for (int i = 0; i < parts.size(); i++) {
                ProtoEdit.Field start = parts.get(i);
                if (start.number == 1 && start.wireType == 0 && ProtoEdit.varintValue(start) >= from) {
                    parts.set(i, ProtoEdit.varintField(1, ProtoEdit.varintValue(start) + shift));
                }
            }
            range.data = ProtoEdit.write(parts);
        }
    }

    /** The {kind, creation time} of every post id in the payload. */
    private static List<Object[]> postIds(byte[] post) {
        List<Object[]> ids = new ArrayList<>();
        Matcher matcher = POST_ID.matcher(new String(post, StandardCharsets.ISO_8859_1));
        while (matcher.find()) {
            ids.add(new Object[]{matcher.group(1), Long.parseLong(matcher.group(2)) >>> 22});
        }
        return ids;
    }

    private static long unit(String unit) {
        switch (unit) {
            case "s":
                return DateUtils.SECOND_IN_MILLIS;
            case "m":
                return DateUtils.MINUTE_IN_MILLIS;
            case "h":
                return DateUtils.HOUR_IN_MILLIS;
            case "d":
                return DAY;
            case "w":
                return 7 * DAY;
            case "mo":
                return 30 * DAY;
            default:
                return 365 * DAY;
        }
    }

    /**
     * The creation time that fits an age label: the newest one about as old as the label says. A post also carries the
     * ids of what it reposts, and an activity id can be newer than the post (someone's like), so the id of a share or
     * ugcPost comes first.
     *
     * @return the time in milliseconds, or 0 when no id fits and the label should stay
     */
    private static long postTime(List<Object[]> ids, long count, long unit, long now) {
        // A day on top of the label's range covers a post that was loaded a while ago.
        long youngest = count * unit * 9 / 10 - DateUtils.MINUTE_IN_MILLIS;
        long oldest = (count + 1) * unit * 6 / 5 + DAY;
        long content = 0;
        long activity = 0;
        for (Object[] id : ids) {
            long time = (Long) id[1];
            long age = now - time;
            if (age < youngest || age > oldest) continue;
            if ("activity".equals(id[0])) activity = Math.max(activity, time);
            else content = Math.max(content, time);
        }
        return content != 0 ? content : activity;
    }
}
