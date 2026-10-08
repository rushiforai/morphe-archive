/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * One pattern line of a word list, a regular expression written between slashes, compiled for a
 * matcher that can't hang the feed.
 *
 * <p>Android's {@link java.util.regex} hands the text to ICU's backtracking matcher as a string,
 * so neither a step-counting CharSequence nor a thread interrupt can stop it, and a pattern such
 * as {@code (a+)+b} takes longer than the universe on a long post. This one never backtracks: it
 * walks every way a pattern can match at once, one character at a time (a Thompson NFA), so its
 * work grows with the text times the pattern and no faster, and it counts every step against a
 * {@link Budget}. When a post's budget runs out the matcher says {@link Result#TOO_SLOW} and the
 * word filter keeps the post.
 *
 * <p>The syntax is the everyday part of Java's: literals, {@code .}, classes such as
 * {@code [a-z]} and {@code [^0-9]}, {@code \d \w \s} and their capitals, {@code \b \B}, {@code ^}
 * and {@code $} at line ends, groups {@code ( )} and {@code (?: )}, {@code |}, and the
 * quantifiers {@code * + ?} and {@code {n} {n,} {n,m}} (a lazy {@code ?} after one is accepted and
 * changes nothing, since only whether a post matches matters). {@code \w}, {@code \d} and
 * {@code \b} know every script's letters and digits. Capital letters never matter. A
 * backreference, a lookaround, an inline flag, a possessive quantifier or an escape this doesn't
 * know is refused when the list is saved rather than read some other way.
 *
 * <p>Compiling is bounded too. Every part of the pattern knows how many instructions it writes,
 * counted as it's parsed, so a pattern whose counted repeats would write out more than
 * {@link #MAX_PROGRAM} is refused before anything is written, and a repeat of a part that writes
 * nothing, such as {@code (){100}}, is refused as having nothing to repeat. Without that, stacked
 * repeats of an empty group made billions of compile steps out of a few characters, on the main
 * thread as the list was typed.
 */
final class PostPattern {
    /** The most a counted repeat may ask for, {@code {n,m}} with m at most this. */
    static final int MAX_REPEAT = 100;
    /** The most instructions a pattern compiles to, its counted repeats written out. */
    static final int MAX_PROGRAM = 2000;

    /** What a search found. */
    enum Result { MATCH, NO_MATCH, TOO_SLOW }

    /** The steps one post may take across every pattern it's read against. */
    static final class Budget {
        private long left;

        Budget(long steps) {
            left = steps;
        }

        /** Spends one step: false once there are none left. */
        boolean spend() {
            return --left >= 0;
        }
    }

    // Instructions.
    private static final int CHAR = 0;
    private static final int ANY = 1;
    private static final int CLASS = 2;
    private static final int SPLIT = 3;
    private static final int JUMP = 4;
    private static final int LINE_START = 5;
    private static final int LINE_END = 6;
    private static final int WORD_EDGE = 7;
    private static final int NOT_WORD_EDGE = 8;
    private static final int MATCH = 9;

    private final int[] op;
    private final int[] x;
    private final int[] y;
    private final CharClass[] classes;
    /**
     * Which ASCII characters can be the first of a match, or null when the pattern can match
     * nothing at all (so every position starts one) and the check is no use. A position whose
     * character isn't in it starts no match, so the matcher doesn't spend steps adding the start
     * there. A character past ASCII always counts.
     */
    private final boolean[] firstAscii;

    private PostPattern(int[] op, int[] x, int[] y, CharClass[] classes) {
        this.op = op;
        this.x = x;
        this.y = y;
        this.classes = classes;
        this.firstAscii = firstAscii();
    }

    /** The characters the instructions the start reaches without reading anything take, or null when it reaches a match. */
    private boolean[] firstAscii() {
        boolean[] first = new boolean[128];
        boolean[] visited = new boolean[op.length];
        int[] stack = new int[op.length * 2 + 2];
        int top = 0;
        stack[top++] = 0;
        while (top > 0) {
            int pc = stack[--top];
            if (visited[pc]) continue;
            visited[pc] = true;
            switch (op[pc]) {
                case MATCH:
                    return null;
                case JUMP:
                    stack[top++] = x[pc];
                    break;
                case SPLIT:
                    stack[top++] = y[pc];
                    stack[top++] = x[pc];
                    break;
                case LINE_START:
                case LINE_END:
                case WORD_EDGE:
                case NOT_WORD_EDGE:
                    // Taken as passing: more positions are tried than needed, never fewer.
                    stack[top++] = pc + 1;
                    break;
                default:
                    for (int point = 0; point < first.length; point++) {
                        boolean takes;
                        switch (op[pc]) {
                            case CHAR: takes = x[pc] == fold(point); break;
                            case ANY: takes = point != '\n'; break;
                            default: takes = classes[x[pc]].matches(point);
                        }
                        if (takes) first[point] = true;
                    }
            }
        }
        return first;
    }

    /** A pattern that can't be read, and why, for a test. */
    static final class Invalid extends Exception {
        Invalid(String why) {
            super(why, null, false, false);
        }
    }

    /** [body] compiled, or null when it isn't a pattern this reads. */
    @Nullable
    static PostPattern compileOrNull(String body) {
        try {
            return compile(body);
        } catch (Invalid invalid) {
            return null;
        }
    }

    static PostPattern compile(String body) throws Invalid {
        Parser parser = new Parser(body);
        Node tree = parser.alternation();
        if (parser.at < body.length()) throw new Invalid("unmatched )");
        // The size is known before anything is written: one too large never gets written out.
        if (tree.size >= MAX_PROGRAM) throw new Invalid("pattern too large");
        Program program = new Program();
        program.emit(tree);
        program.add(MATCH, 0, 0);
        return new PostPattern(program.op(), program.x(), program.y(),
                program.classes.toArray(new CharClass[0]));
    }

    /**
     * Whether the pattern matches anywhere in [text], spending [budget] one step per state it
     * visits. Never throws for any text.
     */
    Result find(CharSequence text, Budget budget) {
        int states = op.length;
        // Each list holds a state once: [*Seen] marks the states in it with the generation it
        // was built in, so the start added at the next position finds the ones already there.
        int[] current = new int[states];
        int[] currentSeen = new int[states];
        int[] next = new int[states];
        int[] nextSeen = new int[states];
        int[] stack = new int[states * 2 + 2];
        int currentSize = 0;
        int generation = 1;
        int length = text.length();
        for (int pos = 0; ; ) {
            // A match may start here, as well as go on from any earlier start, unless the
            // character here can't be the first of one.
            if (pos < length ? mayStart(text.charAt(pos)) : firstAscii == null) {
                int added = add(0, pos, text, current, currentSeen, currentSize, generation, stack, budget);
                if (added == FOUND) return Result.MATCH;
                if (added == OUT) return Result.TOO_SLOW;
                currentSize = added;
            }
            if (pos >= length) return Result.NO_MATCH;

            int point = Character.codePointAt(text, pos);
            int after = pos + Character.charCount(point);
            int folded = fold(point);
            int nextSize = 0;
            generation++;
            for (int i = 0; i < currentSize; i++) {
                if (!budget.spend()) return Result.TOO_SLOW;
                int pc = current[i];
                boolean takes;
                switch (op[pc]) {
                    case CHAR: takes = x[pc] == folded; break;
                    case ANY: takes = point != '\n'; break;
                    case CLASS: takes = classes[x[pc]].matches(point); break;
                    default: takes = false;
                }
                if (!takes) continue;
                int result = add(pc + 1, after, text, next, nextSeen, nextSize, generation, stack, budget);
                if (result == FOUND) return Result.MATCH;
                if (result == OUT) return Result.TOO_SLOW;
                nextSize = result;
            }
            int[] swap = current;
            current = next;
            next = swap;
            swap = currentSeen;
            currentSeen = nextSeen;
            nextSeen = swap;
            currentSize = nextSize;
            pos = after;
        }
    }

    /** Whether a match can start at a position holding [c]: any character past ASCII can. */
    private boolean mayStart(char c) {
        return firstAscii == null || c >= firstAscii.length || firstAscii[c];
    }

    private static final int FOUND = -1;
    private static final int OUT = -2;

    /**
     * Adds the thread at [start] to the list, following every jump, split and assertion at
     * [pos] without reading a character. [seen] marks a state already added for this position by
     * [generation]. Answers the list's new size, {@link #FOUND} at a match, {@link #OUT} when the
     * budget ran out.
     */
    private int add(int start, int pos, CharSequence text, int[] list, int[] seen, int size, int generation,
            int[] stack, Budget budget) {
        int top = 0;
        stack[top++] = start;
        while (top > 0) {
            int pc = stack[--top];
            if (seen[pc] == generation) continue;
            seen[pc] = generation;
            if (!budget.spend()) return OUT;
            switch (op[pc]) {
                case MATCH:
                    return FOUND;
                case JUMP:
                    stack[top++] = x[pc];
                    break;
                case SPLIT:
                    // Second pushed first, so the first way is followed first.
                    stack[top++] = y[pc];
                    stack[top++] = x[pc];
                    break;
                case LINE_START:
                    if (pos == 0 || text.charAt(pos - 1) == '\n') stack[top++] = pc + 1;
                    break;
                case LINE_END:
                    if (pos == text.length() || text.charAt(pos) == '\n') stack[top++] = pc + 1;
                    break;
                case WORD_EDGE:
                    if (wordBefore(text, pos) != wordAfter(text, pos)) stack[top++] = pc + 1;
                    break;
                case NOT_WORD_EDGE:
                    if (wordBefore(text, pos) == wordAfter(text, pos)) stack[top++] = pc + 1;
                    break;
                default:
                    list[size++] = pc;
            }
        }
        return size;
    }

    private static boolean wordBefore(CharSequence text, int pos) {
        return pos > 0 && word(Character.codePointBefore(text, pos));
    }

    private static boolean wordAfter(CharSequence text, int pos) {
        return pos < text.length() && word(Character.codePointAt(text, pos));
    }

    static boolean word(int point) {
        return Character.isLetterOrDigit(point) || point == '_' || Character.getType(point) == Character.NON_SPACING_MARK;
    }

    /** Capital letters aside: the same answer for every case of a letter. */
    static int fold(int point) {
        return Character.toLowerCase(Character.toUpperCase(point));
    }

    // The tree a pattern parses into.

    private abstract static class Node {
        /** The instructions {@link Program#emit} writes for it, never more than {@link #MAX_PROGRAM}. */
        final int size;

        Node(long size) throws Invalid {
            if (size > MAX_PROGRAM) throw new Invalid("pattern too large");
            this.size = (int) size;
        }
    }

    private static final class Literal extends Node {
        final int point;

        Literal(int point) throws Invalid {
            super(1);
            this.point = point;
        }
    }

    private static final class Simple extends Node {
        /** {@link #ANY}, {@link #LINE_START}, {@link #LINE_END}, {@link #WORD_EDGE} or {@link #NOT_WORD_EDGE}. */
        final int op;

        Simple(int op) throws Invalid {
            super(1);
            this.op = op;
        }
    }

    private static final class ClassNode extends Node {
        final CharClass chars;

        ClassNode(CharClass chars) throws Invalid {
            super(1);
            this.chars = chars;
        }
    }

    private static final class Sequence extends Node {
        final List<Node> parts;

        Sequence(List<Node> parts) throws Invalid {
            super(sum(parts, 0));
            this.parts = parts;
        }
    }

    private static final class Choice extends Node {
        final List<Node> ways;

        /** Each way but the last gets a split before it and a jump after it. */
        Choice(List<Node> ways) throws Invalid {
            super(sum(ways, 2L * (ways.size() - 1)));
            this.ways = ways;
        }
    }

    private static final class Repeat extends Node {
        final Node body;
        final int min;
        /** -1 for no upper bound. */
        final int max;

        /**
         * The required copies, then either a split, one more copy and a jump back, or a split and
         * a copy for each optional one.
         */
        Repeat(Node body, int min, int max) throws Invalid {
            super((long) min * body.size + (max == -1 ? body.size + 2L : (long) (max - min) * (body.size + 1)));
            this.body = body;
            this.min = min;
            this.max = max;
        }
    }

    /** [extra] plus the size of every node in [nodes]. Each is at most MAX_PROGRAM, so a long holds it. */
    private static long sum(List<Node> nodes, long extra) {
        long total = extra;
        for (Node node : nodes) total += node.size;
        return total;
    }

    /** A set of characters: ranges, the shorthand classes, and whether it's negated. */
    static final class CharClass {
        private final List<int[]> ranges = new ArrayList<>();
        private final List<Integer> shorthands = new ArrayList<>();
        private boolean negated;

        boolean matches(int point) {
            boolean in = contains(point) || contains(Character.toLowerCase(point))
                    || contains(Character.toUpperCase(point));
            return in != negated;
        }

        private boolean contains(int point) {
            for (int[] range : ranges) {
                if (point >= range[0] && point <= range[1]) return true;
            }
            for (int shorthand : shorthands) {
                if (shorthandMatches(shorthand, point)) return true;
            }
            return false;
        }
    }

    /** {@code d w s} and their capitals: whether [point] is in the class the letter names. */
    private static boolean shorthandMatches(int letter, int point) {
        boolean in;
        switch (Character.toLowerCase(letter)) {
            case 'd': in = Character.isDigit(point); break;
            case 'w': in = word(point); break;
            default: in = Character.isWhitespace(point) || Character.isSpaceChar(point);
        }
        return Character.isUpperCase(letter) != in;
    }

    private static final class Parser {
        final String text;
        int at;

        Parser(String text) {
            this.text = text;
        }

        boolean more() {
            return at < text.length();
        }

        int peek() {
            return text.codePointAt(at);
        }

        int take() {
            int point = text.codePointAt(at);
            at += Character.charCount(point);
            return point;
        }

        Node alternation() throws Invalid {
            List<Node> ways = new ArrayList<>();
            ways.add(sequence());
            while (more() && peek() == '|') {
                at++;
                ways.add(sequence());
            }
            return ways.size() == 1 ? ways.get(0) : new Choice(ways);
        }

        Node sequence() throws Invalid {
            List<Node> parts = new ArrayList<>();
            while (more() && peek() != '|' && peek() != ')') {
                Node atom = atom();
                parts.add(quantified(atom));
            }
            return parts.size() == 1 ? parts.get(0) : new Sequence(parts);
        }

        Node quantified(Node atom) throws Invalid {
            while (more()) {
                int start = at;
                int min;
                int max;
                int point = peek();
                if (point == '*') {
                    at++;
                    min = 0;
                    max = -1;
                } else if (point == '+') {
                    at++;
                    min = 1;
                    max = -1;
                } else if (point == '?') {
                    at++;
                    min = 0;
                    max = 1;
                } else if (point == '{') {
                    int[] bounds = bounds();
                    if (bounds == null) {
                        at = start;
                        return atom;
                    }
                    min = bounds[0];
                    max = bounds[1];
                } else {
                    return atom;
                }
                if (more() && peek() == '?') at++;
                else if (more() && peek() == '+') throw new Invalid("possessive quantifier");
                // An empty group, or a part already repeated no times, writes nothing to copy.
                if (atom.size == 0) throw new Invalid("nothing to repeat");
                atom = new Repeat(atom, min, max);
            }
            return atom;
        }

        /** {@code {n}}, {@code {n,}} or {@code {n,m}} at [at], or null (and [at] unmoved) when it isn't one. */
        @Nullable
        int[] bounds() throws Invalid {
            int start = at;
            at++;
            int min = number();
            if (min < 0) {
                at = start;
                return null;
            }
            int max = min;
            if (more() && peek() == ',') {
                at++;
                max = more() && peek() == '}' ? -1 : number();
                if (max == -2 || (max < 0 && max != -1)) {
                    at = start;
                    return null;
                }
            }
            if (!more() || peek() != '}') {
                at = start;
                return null;
            }
            at++;
            if (min > MAX_REPEAT || max > MAX_REPEAT) throw new Invalid("repeat too large");
            if (max != -1 && max < min) throw new Invalid("repeat bounds out of order");
            return new int[] {min, max};
        }

        /** The digits at [at] as a number, -2 when there are none; past {@link #MAX_REPEAT} is MAX_REPEAT + 1. */
        int number() {
            int start = at;
            long value = 0;
            while (more() && peek() >= '0' && peek() <= '9') {
                value = Math.min(value * 10 + (take() - '0'), MAX_REPEAT + 1);
            }
            return at == start ? -2 : (int) value;
        }

        Node atom() throws Invalid {
            int point = take();
            switch (point) {
                case '(':
                    if (more() && peek() == '?') {
                        if (at + 1 < text.length() && text.charAt(at + 1) == ':') {
                            at += 2;
                        } else {
                            throw new Invalid("lookaround, named group or inline flag");
                        }
                    }
                    Node inside = alternation();
                    if (!more() || peek() != ')') throw new Invalid("unclosed group");
                    at++;
                    return inside;
                case '[':
                    return new ClassNode(charClass());
                case '.':
                    return new Simple(ANY);
                case '^':
                    return new Simple(LINE_START);
                case '$':
                    return new Simple(LINE_END);
                case '*':
                case '+':
                case '?':
                    throw new Invalid("nothing to repeat");
                case '\\':
                    return escape();
                default:
                    return new Literal(point);
            }
        }

        Node escape() throws Invalid {
            if (!more()) throw new Invalid("trailing backslash");
            int point = take();
            switch (point) {
                case 'd': case 'D': case 'w': case 'W': case 's': case 'S': {
                    CharClass chars = new CharClass();
                    chars.shorthands.add(point);
                    return new ClassNode(chars);
                }
                case 'b':
                    return new Simple(WORD_EDGE);
                case 'B':
                    return new Simple(NOT_WORD_EDGE);
                default:
                    return new Literal(escapedChar(point));
            }
        }

        /** The character an escape outside the shorthands stands for. */
        int escapedChar(int point) throws Invalid {
            switch (point) {
                case 'n': return '\n';
                case 't': return '\t';
                case 'r': return '\r';
                case 'f': return '\f';
                case 'u': {
                    if (at + 4 > text.length()) throw new Invalid("short \\u escape");
                    int value = 0;
                    for (int i = 0; i < 4; i++) {
                        int digit = Character.digit(text.charAt(at + i), 16);
                        if (digit < 0) throw new Invalid("bad \\u escape");
                        value = value * 16 + digit;
                    }
                    at += 4;
                    return value;
                }
                default:
                    // A letter or digit escape this doesn't know would mean something in Java's
                    // syntax (a backreference, \p{...}, \A) that this would read some other way.
                    if (Character.isLetterOrDigit(point)) throw new Invalid("unsupported escape");
                    return point;
            }
        }

        CharClass charClass() throws Invalid {
            CharClass chars = new CharClass();
            if (more() && peek() == '^') {
                at++;
                chars.negated = true;
            }
            boolean first = true;
            while (true) {
                if (!more()) throw new Invalid("unclosed class");
                int point = take();
                if (point == ']' && !first) return chars;
                first = false;
                int low;
                if (point == '\\') {
                    if (!more()) throw new Invalid("unclosed class");
                    int escaped = take();
                    if ("dDwWsS".indexOf(escaped) >= 0) {
                        chars.shorthands.add(escaped);
                        continue;
                    }
                    low = escapedChar(escaped);
                } else {
                    low = point;
                }
                int high = low;
                if (more() && peek() == '-' && at + 1 < text.length() && text.charAt(at + 1) != ']') {
                    at++;
                    int end = take();
                    if (end == '\\') {
                        if (!more()) throw new Invalid("unclosed class");
                        int escaped = take();
                        if ("dDwWsS".indexOf(escaped) >= 0) throw new Invalid("range to a class");
                        end = escapedChar(escaped);
                    }
                    high = end;
                    if (high < low) throw new Invalid("range out of order");
                }
                chars.ranges.add(new int[] {low, high});
            }
        }
    }

    /** Instructions as they're written, then frozen into the pattern's arrays. */
    private static final class Program {
        private int[] op = new int[16];
        private int[] x = new int[16];
        private int[] y = new int[16];
        private int size;
        final List<CharClass> classes = new ArrayList<>();

        int add(int code, int a, int b) throws Invalid {
            if (size == MAX_PROGRAM) throw new Invalid("pattern too large");
            if (size == op.length) {
                op = java.util.Arrays.copyOf(op, size * 2);
                x = java.util.Arrays.copyOf(x, size * 2);
                y = java.util.Arrays.copyOf(y, size * 2);
            }
            op[size] = code;
            x[size] = a;
            y[size] = b;
            return size++;
        }

        void emit(Node node) throws Invalid {
            // A part that writes nothing has nothing to walk through either.
            if (node.size == 0) return;
            if (node instanceof Literal) {
                add(CHAR, fold(((Literal) node).point), 0);
            } else if (node instanceof Simple) {
                add(((Simple) node).op, 0, 0);
            } else if (node instanceof ClassNode) {
                classes.add(((ClassNode) node).chars);
                add(CLASS, classes.size() - 1, 0);
            } else if (node instanceof Sequence) {
                for (Node part : ((Sequence) node).parts) emit(part);
            } else if (node instanceof Choice) {
                List<Node> ways = ((Choice) node).ways;
                List<Integer> jumps = new ArrayList<>();
                for (int i = 0; i < ways.size() - 1; i++) {
                    int split = add(SPLIT, 0, 0);
                    x[split] = size;
                    emit(ways.get(i));
                    jumps.add(add(JUMP, 0, 0));
                    y[split] = size;
                }
                emit(ways.get(ways.size() - 1));
                for (int jump : jumps) x[jump] = size;
            } else if (node instanceof Repeat) {
                Repeat repeat = (Repeat) node;
                for (int i = 0; i < repeat.min; i++) emit(repeat.body);
                if (repeat.max == -1) {
                    int split = add(SPLIT, 0, 0);
                    x[split] = size;
                    emit(repeat.body);
                    add(JUMP, split, 0);
                    y[split] = size;
                } else {
                    List<Integer> splits = new ArrayList<>();
                    for (int i = repeat.min; i < repeat.max; i++) {
                        int split = add(SPLIT, 0, 0);
                        x[split] = size;
                        splits.add(split);
                        emit(repeat.body);
                    }
                    for (int split : splits) y[split] = size;
                }
            }
        }

        int[] op() {
            return java.util.Arrays.copyOf(op, size);
        }

        int[] x() {
            return java.util.Arrays.copyOf(x, size);
        }

        int[] y() {
            return java.util.Arrays.copyOf(y, size);
        }
    }
}
