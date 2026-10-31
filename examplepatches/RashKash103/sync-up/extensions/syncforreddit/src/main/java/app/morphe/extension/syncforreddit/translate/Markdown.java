package app.morphe.extension.syncforreddit.translate;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Translating text that was written as markdown, without translating the markdown.
 *
 * <p>Sync hands its own translation the text as it is drawn rather than as it was written, so
 * everything that made the text more than words — the line it sat on, the address behind a link
 * — is gone before a translation is asked for. What comes back is one paragraph with the links
 * flattened into their own words.
 *
 * <p>Here the text as written is translated instead, a line at a time so that the lines survive.
 * Anything on a line that is not language is stood in for by a numbered marker before the line
 * is sent and put back afterwards, so a sentence with a link in the middle of it is still a
 * sentence when it arrives. What is stood in for:
 *
 * <ul>
 *   <li>where a link points, a link written by reference, and an image or an emote whole
 *   <li>an address on its own or in angle brackets, and the name of a subreddit or a person
 *   <li>code between backticks
 *   <li>the marks that open and close a spoiler, and the caret that raises what follows it
 *   <li>an escaped character, and an entity written out
 *   <li>the marks that make text bold, italic or struck through
 * </ul>
 *
 * <p>Whole lines are left alone where none of them is language: a block of code fenced or
 * indented, the rule under a table, and where a link written by reference is given its address.
 * A heading, a quote and a list keep what they begin with, a table is translated a cell at a
 * time, and what a link says is translated along with the sentence it sits in.
 *
 * <p>The library on the device has nothing of its own for any of this: it will not keep so much
 * as a line break, let alone a tag. Both services abroad do — DeepL asks for XML tags with an id
 * on each and Google for HTML with the parts to leave alone marked — and a marker is what those
 * want too, so this is the shape all three can be given.
 *
 * <p>A translation is under no obligation to give a marker back, and is known to drop them,
 * repeat them and move them. So every marker is looked for afterwards, and where one did not
 * survive the line is translated again in pieces around what it must not touch. That reads worse
 * and cannot be wrong.
 */
final class Markdown {
    /** What a translation is asked of, so that this need not know which service answers. */
    interface Translates {
        String translate(String text) throws Exception;
    }

    /** Where a block of code begins or ends, inside which nothing is language. */
    private static final Pattern A_FENCE = Pattern.compile("^\\s{0,3}(```|~~~)");

    /** A line held far enough from the margin to be code rather than prose. */
    private static final Pattern INDENTED = Pattern.compile("^(?: {4}|\\t)");

    /** What that line would have to look like to be part of a list instead of code. */
    private static final Pattern A_LIST_ITEM = Pattern.compile("^\\s*(?:[-*+]\\s+|\\d+[.)]\\s+|>)");

    /** Where a link written by reference is given its address. */
    private static final Pattern A_REFERENCE = Pattern.compile("^\\s*\\[[^\\]]+\\]:\\s*\\S+");

    /** A row of a table, which is translated a cell at a time so the cells stay cells. */
    private static final Pattern A_TABLE_ROW = Pattern.compile("^\\s*\\|.*\\|\\s*$");

    /**
     * What a line may begin with and still be a line of prose: how far it is set in, any depth
     * of quoting, then at most one mark for a list or a heading.
     */
    private static final Pattern LEADING = Pattern.compile(
            "^(\\s*(?:>\\s*)*(?:[-*+]\\s+|\\d+[.)]\\s+|#{1,6}\\s+)?)");

    /**
     * What is kept as it was. In order: code between backticks; an image or an emote whole,
     * since what an emote is called is not language; a link written out in full; a link written
     * by reference; an address in angle brackets; an address on its own; the name of a subreddit
     * or a person; the marks that open and close a spoiler; the caret that raises what follows
     * it; an escaped character; and an entity written out.
     */
    private static final Pattern KEEP = Pattern.compile(
            "(`+[^`]*`+)"
                    + "|(!\\[[^\\]\\n]*\\]\\([^)\\n]*\\))"
                    + "|(\\[[^\\]\\n]*\\]\\([^)\\s]*(?:\\s+\"[^\"]*\")?\\))"
                    + "|(\\[[^\\]\\n]*\\]\\[[^\\]\\n]*\\])"
                    + "|(<[^>\\s]+>)"
                    + "|((?:https?://|www\\.)\\S+)"
                    + "|((?<![\\w/])/?[ru]/[A-Za-z0-9_][A-Za-z0-9_-]*)"
                    + "|(>!|!<)"
                    + "|(\\^\\(|\\^)"
                    + "|(\\\\[\\\\`*_{}\\[\\]()#+\\-.!>~^|])"
                    + "|(&[a-zA-Z]{2,10};|&#\\d{1,6};)");

    /** Which of those is a link written out in full, whose words are translated. */
    private static final int LINK = 3;

    /** A link written out in full, split into what it says and where it points. */
    private static final Pattern A_LINK = Pattern.compile("^\\[([^\\]\\n]*)\\](\\(.*\\))$");

    /**
     * Text made bold, italic or struck through, and what it is wrapped in. Longest first, so
     * that the marks for bold are not read as two for italic.
     */
    private static final Pattern EMPHASISED = Pattern.compile(
            "(\\*\\*\\*|___|\\*\\*|__|~~|\\*|_)(?=\\S)(.+?)(?<=\\S)\\1");

    /**
     * A marker standing in for something the translation must not touch. Letters and a number,
     * with no space in it, which is what a translation is most likely to carry across unharmed.
     */
    private static final String A_MARKER = "DNT";

    /**
     * How a marker is found again. A translation may change its case or work a space into it,
     * and it is still the marker; anything more than that and it is not.
     */
    private static final Pattern MARKER = Pattern.compile("(?i)d\\s*n\\s*t\\s*(\\d+)");

    /** Whether there is anything on a line worth asking about. */
    private static final Pattern A_LETTER = Pattern.compile("\\p{L}");

    private Markdown() {}

    /** What a marker stands for, and what has to be true of it when it comes back. */
    private static final class Stood {
        static final int ANYWHERE = 0;
        static final int WHERE_A_LINK_POINTS = 1;
        static final int OPENS_EMPHASIS = 2;
        static final int CLOSES_EMPHASIS = 3;

        final String was;
        final int mustBe;

        Stood(String was, int mustBe) {
            this.was = was;
            this.mustBe = mustBe;
        }
    }

    /**
     * @param markdown The text as it was written.
     * @param by       What translates a run of words.
     * @return The same text, translated, with everything that was not words left alone.
     */
    static String translated(String markdown, Translates by) throws Exception {
        StringBuilder said = new StringBuilder(markdown.length());
        boolean inCode = false;

        int at = 0;
        while (at <= markdown.length()) {
            int ends = markdown.indexOf('\n', at);
            boolean last = ends < 0;
            String line = markdown.substring(at, last ? markdown.length() : ends);

            said.append(line(line, inCode, by));
            if (A_FENCE.matcher(line).find()) {
                inCode = !inCode;
            }

            if (last) {
                break;
            }
            said.append('\n');
            at = ends + 1;
        }

        return said.toString();
    }

    /** @return One line, translated where any of it is language. */
    private static String line(String line, boolean inCode, Translates by) throws Exception {
        boolean isCode = inCode
                || A_FENCE.matcher(line).find()
                || (INDENTED.matcher(line).find() && !A_LIST_ITEM.matcher(line).find());

        if (isCode || !A_LETTER.matcher(line).find() || A_REFERENCE.matcher(line).find()) {
            // A blank line, a rule, a block of code, the address of a link written by
            // reference: nothing to ask about, and the line has to stay as it is.
            return line;
        }

        if (A_TABLE_ROW.matcher(line).find()) {
            return acrossCells(line, by);
        }

        Matcher leading = LEADING.matcher(line);
        String marker = leading.find() ? leading.group(1) : "";
        return marker + inLine(line.substring(marker.length()), by);
    }

    /** @return A row of a table with each cell translated, and the cells still cells. */
    private static String acrossCells(String row, Translates by) throws Exception {
        StringBuilder said = new StringBuilder(row.length());
        int from = 0;

        while (from <= row.length()) {
            int ends = row.indexOf('|', from);
            boolean last = ends < 0;
            String cell = row.substring(from, last ? row.length() : ends);

            said.append(A_LETTER.matcher(cell).find() ? inLine(cell, by) : cell);
            if (last) {
                break;
            }
            said.append('|');
            from = ends + 1;
        }

        return said.toString();
    }

    /** @return One line of prose translated, around whatever on it is not prose. */
    private static String inLine(String line, Translates by) throws Exception {
        List<Stood> stood = new ArrayList<>();
        String masked = MARKER.matcher(line).find() ? null : masked(line, stood);

        if (masked != null) {
            String restored = restored(asWords(masked, by), stood);
            if (restored != null) {
                return restored;
            }
        }

        return inPieces(line, by);
    }

    /**
     * @return The line with a marker in place of everything that must survive it, or null where
     *         there was nothing to stand in for.
     */
    private static String masked(String line, List<Stood> stood) {
        String emphasised = emphasisFrom(keptFrom(line, stood), stood);
        return stood.isEmpty() ? null : emphasised;
    }

    /** @return The line with a marker in place of everything on it that is not language. */
    private static String keptFrom(String line, List<Stood> stood) {
        StringBuilder said = new StringBuilder(line.length());
        Matcher keep = KEEP.matcher(line);
        int from = 0;

        while (keep.find()) {
            said.append(line, from, keep.start());

            String kept = keep.group();
            Matcher link = keep.group(LINK) == null ? null : A_LINK.matcher(kept);
            if (link != null && link.matches()) {
                // What a link says stays in the sentence and is translated with it. Only where
                // it points is stood in for.
                String points = link.group(2);
                said.append('[').append(link.group(1)).append("](")
                        .append(A_MARKER).append(stood.size()).append(')');
                stood.add(new Stood(points.substring(1, points.length() - 1),
                        Stood.WHERE_A_LINK_POINTS));
            } else {
                said.append(A_MARKER).append(stood.size());
                stood.add(new Stood(kept, Stood.ANYWHERE));
            }

            from = keep.end();
        }

        return said.append(line.substring(from)).toString();
    }

    /**
     * @return The line with a marker in place of the marks that emphasise text. The text itself
     *         stays in the sentence, so it is translated along with the rest of it.
     */
    private static String emphasisFrom(String line, List<Stood> stood) {
        StringBuilder said = new StringBuilder(line.length());
        Matcher emphasised = EMPHASISED.matcher(line);
        int from = 0;

        while (emphasised.find()) {
            said.append(line, from, emphasised.start());

            String marks = emphasised.group(1);
            said.append(A_MARKER).append(stood.size());
            stood.add(new Stood(marks, Stood.OPENS_EMPHASIS));

            said.append(emphasised.group(2));

            said.append(A_MARKER).append(stood.size());
            stood.add(new Stood(marks, Stood.CLOSES_EMPHASIS));

            from = emphasised.end();
        }

        return said.append(line.substring(from)).toString();
    }

    /**
     * @return The translated line with everything that was stood in for put back, or null where
     *         a marker did not come back, came back twice, or came back somewhere it cannot be
     *         put back into.
     */
    private static String restored(String translated, List<Stood> stood) {
        StringBuilder said = new StringBuilder(translated.length());
        boolean[] found = new boolean[stood.size()];
        Matcher marker = MARKER.matcher(translated);
        int from = 0;

        while (marker.find()) {
            int which;
            try {
                which = Integer.parseInt(marker.group(1));
            } catch (NumberFormatException ex) {
                return null;
            }
            if (which >= found.length || found[which]) {
                return null;
            }
            found[which] = true;

            Stood was = stood.get(which);
            if (was.mustBe == Stood.WHERE_A_LINK_POINTS
                    && !isWhereALinkPoints(translated, marker)) {
                // The brackets around it are what make it a link, and they did not survive.
                return null;
            }

            said.append(translated, from, marker.start());
            if (was.mustBe == Stood.CLOSES_EMPHASIS) {
                // Emphasis holds only where the marks are against the words. A translation is
                // free to leave a space in front of one, and often does.
                while (said.length() > 0 && said.charAt(said.length() - 1) == ' ') {
                    said.setLength(said.length() - 1);
                }
            }
            said.append(was.was);

            from = marker.end();
            if (was.mustBe == Stood.OPENS_EMPHASIS) {
                while (from < translated.length() && translated.charAt(from) == ' ') {
                    from++;
                }
            }
        }

        for (boolean each : found) {
            if (!each) {
                return null;
            }
        }

        return said.append(translated.substring(from)).toString();
    }

    /** @return Whether a marker is still sitting where a link points, brackets and all. */
    private static boolean isWhereALinkPoints(String translated, Matcher marker) {
        int opens = marker.start();
        int closes = marker.end();
        return opens >= 2
                && translated.charAt(opens - 1) == '('
                && translated.charAt(opens - 2) == ']'
                && closes < translated.length()
                && translated.charAt(closes) == ')';
    }

    /**
     * Translating a line in the pieces between what must not be touched. A sentence broken this
     * way reads worse, since each piece is translated without the rest of it for company, so it
     * is only what happens where the markers did not survive.
     *
     * @return The line translated, piece by piece.
     */
    private static String inPieces(String line, Translates by) throws Exception {
        StringBuilder said = new StringBuilder(line.length());
        Matcher keep = KEEP.matcher(line);
        int from = 0;

        while (keep.find()) {
            said.append(asWords(line.substring(from, keep.start()), by));

            String kept = keep.group();
            Matcher link = keep.group(LINK) == null ? null : A_LINK.matcher(kept);
            if (link != null && link.matches()) {
                // What a link says is words; where it points is not.
                said.append('[').append(asWords(link.group(1), by)).append(']')
                        .append(link.group(2));
            } else {
                said.append(kept);
            }

            from = keep.end();
        }

        return said.append(asWords(line.substring(from), by)).toString();
    }

    /** @return A run translated, or the run itself where there is nothing to translate. */
    private static String asWords(String run, Translates by) throws Exception {
        if (run.isEmpty() || !A_LETTER.matcher(run).find()) {
            return run;
        }

        // What sits either side of the words is spacing that belongs to the line rather than to
        // the language — two spaces at the end of a line are a line break — and a translation
        // would not necessarily give it back.
        int begins = 0;
        while (begins < run.length() && Character.isWhitespace(run.charAt(begins))) {
            begins++;
        }
        int ends = run.length();
        while (ends > begins && Character.isWhitespace(run.charAt(ends - 1))) {
            ends--;
        }

        String words = run.substring(begins, ends);
        String translated = by.translate(words);
        return run.substring(0, begins) + (translated == null ? words : translated)
                + run.substring(ends);
    }

    /** @return Whether the text is worth asking a service about at all. */
    static boolean worthTranslating(String markdown) {
        return markdown != null && A_LETTER.matcher(markdown).find();
    }
}
