/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Carries a message's formatting through an outside translation, which only knows plain text.
 *
 * <p>Bold, italic, underline, strikethrough, quotes and text links go to the service as numbered
 * tags around the words they cover, {@code <b0>like this</b0>}, so they follow those words in the
 * translation. Everything whose words have to stay exactly as written goes as a placeholder,
 * {@code <x1/>}, and gets its original words back afterwards: spoilers (whose words never leave the
 * phone, so they can't show uncovered), custom emoji, links, @mentions, #hashtags and the rest. A
 * tag the service breaks only loses its formatting. A placeholder it loses or repeats, or a spoiler
 * that can't be marked, leaves the whole message as written.
 */
final class TranslateMarkup {
    private TranslateMarkup() {}

    /** How the extension reads a Telegram entity and makes one at another place. */
    interface Entities {
        int offset(Object entity) throws ReflectiveOperationException;

        int length(Object entity) throws ReflectiveOperationException;

        /** A new entity like [entity], over [length] characters from [offset]. */
        Object copy(Object entity, int offset, int length) throws ReflectiveOperationException;
    }

    /** What goes to the service, and what reading its answer back needs. */
    static final class Marked {
        final String text;
        final String original;
        final Map<Integer, Mark> marks;

        Marked(String text, String original, Map<Integer, Mark> marks) {
            this.text = text;
            this.original = original;
            this.marks = marks;
        }

        /** Whether the text goes as it is, with no formatting to carry. */
        boolean plain() {
            return marks.isEmpty();
        }
    }

    /** The translation with its formatting back. */
    static final class Restored {
        final String text;
        final ArrayList<Object> entities;

        Restored(String text, ArrayList<Object> entities) {
            this.text = text;
            this.entities = entities;
        }
    }

    /** One tag or placeholder, and the entities that ride inside a placeholder. */
    static final class Mark {
        final Object entity;
        final char letter;
        final int start;
        final int end;
        final List<Object[]> inside = new ArrayList<>();

        Mark(Object entity, char letter, int start, int end) {
            this.entity = entity;
            this.letter = letter;
            this.start = start;
            this.end = end;
        }

        boolean placeholder() {
            return letter == KEEP;
        }
    }

    static final char KEEP = 'x';
    /** Anything shaped like a tag or placeholder this writes. */
    static final Pattern TAG = Pattern.compile("<(/?)([a-z])(\\d{1,4})(/?)>");

    /** The letter a translated kind's tag uses, or {@link #KEEP} for words that stay as written. */
    static char letter(Object entity) {
        String name = entity.getClass().getName();
        if (name.endsWith("TL_messageEntityBold")) return 'b';
        if (name.endsWith("TL_messageEntityItalic")) return 'i';
        if (name.endsWith("TL_messageEntityUnderline")) return 'u';
        if (name.endsWith("TL_messageEntityStrike")) return 's';
        if (name.endsWith("TL_messageEntityBlockquote")) return 'q';
        if (name.endsWith("TL_messageEntityTextUrl")) return 'a';
        return KEEP;
    }

    static boolean spoiler(Object entity) {
        return entity.getClass().getName().endsWith("TL_messageEntitySpoiler");
    }

    /**
     * The text to send for [text] with [entities], or null when the message has to stay as
     * written: a spoiler that can't be marked, so its words would go out and come back uncovered.
     */
    static Marked mark(String text, List<?> entities, Entities access) throws ReflectiveOperationException {
        Map<Integer, Mark> none = Collections.emptyMap();
        if (entities == null || entities.isEmpty()) return new Marked(text, text, none);
        boolean spoilers = false;
        List<Mark> keeps = new ArrayList<>();
        List<Mark> tags = new ArrayList<>();
        Map<Mark, Integer> index = new HashMap<>();
        for (int n = 0; n < entities.size(); n++) {
            Object entity = entities.get(n);
            if (entity == null) continue;
            boolean hidden = spoiler(entity);
            spoilers |= hidden;
            int start = access.offset(entity);
            int length = access.length(entity);
            if (start < 0 || length <= 0 || start + length > text.length()) {
                if (hidden) return null;
                continue;
            }
            Mark mark = new Mark(entity, letter(entity), start, start + length);
            index.put(mark, n);
            (mark.placeholder() ? keeps : tags).add(mark);
        }
        // Text that already holds something shaped like a tag would be read back wrong, so it goes as it is.
        if (TAG.matcher(text).find()) return spoilers ? null : new Marked(text, text, none);

        Comparator<Mark> order = (a, b) -> a.start != b.start ? Integer.compare(a.start, b.start) : Integer.compare(b.end, a.end);
        keeps.sort(order);
        List<Mark> outer = new ArrayList<>();
        for (Mark keep : keeps) {
            Mark last = outer.isEmpty() ? null : outer.get(outer.size() - 1);
            if (last == null || keep.start >= last.end) {
                outer.add(keep);
            } else if (keep.end <= last.end) {
                last.inside.add(new Object[] {keep.entity, keep.start - last.start, keep.end - keep.start});
            } else if (spoiler(keep.entity) || spoiler(last.entity)) {
                return null;
            }
            // Otherwise two kept runs cross, and the later one loses its entity.
        }

        tags.sort(order);
        List<Mark> placed = new ArrayList<>();
        Deque<Mark> open = new ArrayDeque<>();
        for (Mark tag : tags) {
            Mark around = containing(outer, tag);
            if (around != null) {
                around.inside.add(new Object[] {tag.entity, tag.start - around.start, tag.end - tag.start});
                continue;
            }
            // Half over a kept run, its words can't move with the translation.
            if (crossesAny(outer, tag)) continue;
            while (!open.isEmpty() && open.peek().end <= tag.start) open.pop();
            if (!open.isEmpty() && tag.end > open.peek().end) continue;
            open.push(tag);
            placed.add(tag);
        }

        Map<Integer, Mark> marks = new HashMap<>();
        for (Mark mark : outer) marks.put(index.get(mark), mark);
        for (Mark mark : placed) marks.put(index.get(mark), mark);
        if (marks.isEmpty()) return spoilers ? null : new Marked(text, text, none);

        List<Mark> starts = new ArrayList<>(placed);
        starts.addAll(outer);
        starts.sort(order);
        StringBuilder out = new StringBuilder(text.length() + 16 * marks.size());
        Deque<Mark> closing = new ArrayDeque<>();
        int next = 0;
        int at = 0;
        while (true) {
            while (!closing.isEmpty() && closing.peek().end == at) {
                Mark tag = closing.pop();
                out.append("</").append(tag.letter).append(index.get(tag)).append('>');
            }
            if (at >= text.length()) break;
            Mark keep = null;
            while (next < starts.size() && starts.get(next).start == at) {
                Mark mark = starts.get(next++);
                if (mark.placeholder()) {
                    keep = mark;
                } else {
                    out.append('<').append(mark.letter).append(index.get(mark)).append('>');
                    closing.push(mark);
                }
            }
            if (keep != null) {
                out.append('<').append(KEEP).append(index.get(keep)).append("/>");
                at = keep.end;
            } else {
                out.append(text.charAt(at++));
            }
        }
        return new Marked(out.toString(), text, marks);
    }

    private static Mark containing(List<Mark> outer, Mark tag) {
        for (Mark keep : outer) {
            if (tag.start >= keep.start && tag.end <= keep.end) return keep;
        }
        return null;
    }

    private static boolean crossesAny(List<Mark> outer, Mark tag) {
        for (Mark keep : outer) {
            boolean overlaps = tag.start < keep.end && keep.start < tag.end;
            boolean holds = tag.start <= keep.start && keep.end <= tag.end;
            if (overlaps && !holds) return true;
        }
        return false;
    }

    /**
     * Reads [answer], the translation of {@code marked.text}, back into text and entities, or null
     * when the message has to stay as written: a placeholder lost or repeated.
     */
    static Restored restore(Marked marked, String answer, Entities access) throws ReflectiveOperationException {
        if (marked.plain()) return new Restored(answer, new ArrayList<>());
        StringBuilder out = new StringBuilder(answer.length());
        Map<Integer, Integer> opened = new HashMap<>();
        Map<Integer, int[]> closed = new HashMap<>();
        Map<Integer, Integer> kept = new HashMap<>();
        List<Integer> broken = new ArrayList<>();
        Deque<Integer> stack = new ArrayDeque<>();
        Matcher matcher = TAG.matcher(answer);
        int from = 0;
        while (matcher.find()) {
            out.append(answer, from, matcher.start());
            from = matcher.end();
            int n;
            try {
                n = Integer.parseInt(matcher.group(3));
            } catch (NumberFormatException unreadable) {
                continue;
            }
            Mark mark = marked.marks.get(n);
            // Something tag-shaped the text never had is the service's own, and goes.
            if (mark == null || mark.letter != matcher.group(2).charAt(0)) continue;
            boolean close = !matcher.group(1).isEmpty();
            boolean self = !matcher.group(4).isEmpty();
            if (mark.placeholder()) {
                if (close || !self || kept.containsKey(n)) return null;
                kept.put(n, out.length());
                out.append(marked.original, mark.start, mark.end);
            } else if (self) {
                broken.add(n);
            } else if (!close) {
                if (opened.containsKey(n)) {
                    broken.add(n);
                } else {
                    opened.put(n, out.length());
                    stack.push(n);
                }
            } else if (stack.contains(n)) {
                // Tags opened inside this one and still open crossed it, and lose their formatting.
                while (stack.peek().intValue() != n) broken.add(stack.pop());
                stack.pop();
                closed.put(n, new int[] {opened.get(n), out.length()});
            } else {
                broken.add(n);
            }
        }
        out.append(answer, from, answer.length());
        for (Map.Entry<Integer, Mark> entry : marked.marks.entrySet()) {
            if (entry.getValue().placeholder() && !kept.containsKey(entry.getKey())) return null;
        }

        List<Object[]> made = new ArrayList<>();
        for (Map.Entry<Integer, int[]> entry : closed.entrySet()) {
            int n = entry.getKey();
            int[] range = entry.getValue();
            if (broken.contains(n) || range[1] <= range[0]) continue;
            made.add(new Object[] {range[0], n, access.copy(marked.marks.get(n).entity, range[0], range[1] - range[0])});
        }
        for (Map.Entry<Integer, Integer> entry : kept.entrySet()) {
            Mark mark = marked.marks.get(entry.getKey());
            int start = entry.getValue();
            made.add(new Object[] {start, entry.getKey(), access.copy(mark.entity, start, mark.end - mark.start)});
            for (Object[] inner : mark.inside) {
                int at = start + (int) inner[1];
                made.add(new Object[] {at, entry.getKey(), access.copy(inner[0], at, (int) inner[2])});
            }
        }
        made.sort((a, b) -> (int) a[0] != (int) b[0] ? Integer.compare((int) a[0], (int) b[0]) : Integer.compare((int) a[1], (int) b[1]));
        ArrayList<Object> entities = new ArrayList<>(made.size());
        for (Object[] each : made) entities.add(each[2]);
        return new Restored(out.toString(), entities);
    }

    /** Telegram's entities, read and made by reflection under the build's names. */
    static final class TelegramEntities implements Entities {
        @Override public int offset(Object entity) throws ReflectiveOperationException {
            return HostNames.field(entity.getClass(), "offset").getInt(entity);
        }

        @Override public int length(Object entity) throws ReflectiveOperationException {
            return HostNames.field(entity.getClass(), "length").getInt(entity);
        }

        @Override public Object copy(Object entity, int offset, int length) throws ReflectiveOperationException {
            Class<?> type = entity.getClass();
            Object made = type.getConstructor().newInstance();
            for (Field field : type.getFields()) {
                int modifiers = field.getModifiers();
                if (Modifier.isStatic(modifiers) || Modifier.isFinal(modifiers)) continue;
                field.set(made, field.get(entity));
            }
            HostNames.field(type, "offset").setInt(made, offset);
            HostNames.field(type, "length").setInt(made, length);
            return made;
        }
    }
}
