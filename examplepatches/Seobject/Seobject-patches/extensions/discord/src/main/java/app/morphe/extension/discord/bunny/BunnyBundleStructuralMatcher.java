package app.morphe.extension.discord.bunny;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Structural matcher for Bunny's generated JavaScript.
 *
 * Matching order:
 *
 *  1. Full lexical structure.
 *  2. For simple assignment-call exemplars, assignment/callee shape.
 *
 * Both modes require exactly one candidate. Zero or multiple candidates
 * fail closed instead of guessing.
 */
final class BunnyBundleStructuralMatcher {
    private BunnyBundleStructuralMatcher() {
    }

    private static final class Token {
        final String value;
        final int start;
        final int end;

        Token(
                String value,
                int start,
                int end
        ) {
            this.value = value;
            this.start = start;
            this.end = end;
        }
    }

    private static final class Match {
        final int firstToken;
        final int lastTokenExclusive;

        Match(
                int firstToken,
                int lastTokenExclusive
        ) {
            this.firstToken = firstToken;
            this.lastTokenExclusive = lastTokenExclusive;
        }
    }

    private static final class AssignmentCallShape {
        final String left;
        final String callee;
        final boolean semicolon;

        AssignmentCallShape(
                String left,
                String callee,
                boolean semicolon
        ) {
            this.left = left;
            this.callee = callee;
            this.semicolon = semicolon;
        }
    }

    static String replaceExactlyOnce(
            String source,
            String exemplar,
            String replacement,
            String label
    ) throws IOException {
        if (source == null) {
            throw new IOException(
                    label + " source is null"
            );
        }

        if (
                exemplar == null
                        || exemplar.isEmpty()
        ) {
            throw new IOException(
                    label + " structural exemplar is empty"
            );
        }

        /*
         * BUNNY_RAW_EXACT_FAST_PATH_V3
         *
         * Prefer a unique exact exemplar when the current bundle still
         * contains it. This is deterministic and avoids unnecessary
         * whole-bundle lexical parsing.
         *
         * This is NOT a compatibility dependency: when the exact source
         * changes, the structural matching modes below are still attempted.
         */
        int rawFirst =
                source.indexOf(
                        exemplar
                );

        if (rawFirst >= 0) {
            int rawSecond =
                    source.indexOf(
                            exemplar,
                            rawFirst
                                    + exemplar.length()
                    );

            if (rawSecond >= 0) {
                throw new IOException(
                        label
                                + " structural anchor is ambiguous"
                                + " (mode=raw-exact)"
                );
            }

            int start =
                    expandLeadingIndent(
                            source,
                            rawFirst,
                            exemplar
                    );

            int end =
                    rawFirst
                            + exemplar.length();

            return source.substring(
                    0,
                    start
            )
                    + replacement
                    + source.substring(
                    end
            );
        }

        List<Token> sourceTokens =
                tokenize(source);

        List<Token> exemplarTokens =
                tokenize(exemplar);

        if (exemplarTokens.isEmpty()) {
            throw new IOException(
                    label + " structural exemplar has no tokens"
            );
        }

        List<Match> matches =
                findExactMatches(
                        sourceTokens,
                        exemplarTokens
                );

        String matchMode =
                "lexical";

        /*
         * If the full exemplar changed, a simple assignment-call can
         * still be identified from its semantic role:
         *
         *     target = resolver(...);
         *
         * The arguments are intentionally not part of the identity.
         *
         * This means path strings, argument values, and other
         * implementation details can evolve without creating a new
         * Discord-version rule.
         */
        if (matches.isEmpty()) {
            AssignmentCallShape shape =
                    parseAssignmentCallShape(
                            exemplarTokens
                    );

            if (shape != null) {
                matches =
                        findAssignmentCallMatches(
                                sourceTokens,
                                shape
                        );

                matchMode =
                        "assignment-call";
            }
        }

        if (matches.isEmpty()) {
            throw new IOException(
                    label
                            + " structural anchor was not found"
            );
        }

        if (matches.size() != 1) {
            throw new IOException(
                    label
                            + " structural anchor is ambiguous"
                            + " (mode="
                            + matchMode
                            + ", matches="
                            + matches.size()
                            + ")"
            );
        }

        Match match =
                matches.get(0);

        Token first =
                sourceTokens.get(
                        match.firstToken
                );

        Token last =
                sourceTokens.get(
                        match.lastTokenExclusive
                                - 1
                );

        int start =
                expandLeadingIndent(
                        source,
                        first.start,
                        exemplar
                );

        int end =
                last.end;

        return source.substring(
                0,
                start
        )
                + replacement
                + source.substring(
                end
        );
    }

    private static List<Match> findExactMatches(
            List<Token> source,
            List<Token> exemplar
    ) {
        ArrayList<Match> result =
                new ArrayList<>();

        if (
                exemplar.size()
                        > source.size()
        ) {
            return result;
        }

        int maximum =
                source.size()
                        - exemplar.size();

        for (
                int start = 0;
                start <= maximum;
                start++
        ) {
            boolean matches =
                    true;

            for (
                    int offset = 0;
                    offset < exemplar.size();
                    offset++
            ) {
                if (
                        !source.get(
                                start + offset
                        ).value.equals(
                                exemplar.get(
                                        offset
                                ).value
                        )
                ) {
                    matches =
                            false;
                    break;
                }
            }

            if (matches) {
                result.add(
                        new Match(
                                start,
                                start
                                        + exemplar.size()
                        )
                );
            }
        }

        return result;
    }

    private static AssignmentCallShape parseAssignmentCallShape(
            List<Token> tokens
    ) {
        if (tokens.size() < 6) {
            return null;
        }

        if (
                !isIdentifier(
                        tokens.get(0)
                )
                        || !"P:=".equals(
                        tokens.get(1).value
                )
                        || !isIdentifier(
                        tokens.get(2)
                )
                        || !"P:(".equals(
                        tokens.get(3).value
                )
        ) {
            return null;
        }

        int close =
                matchingParen(
                        tokens,
                        3
                );

        if (close < 0) {
            return null;
        }

        int next =
                close + 1;

        boolean semicolon =
                next < tokens.size()
                        && "P:;".equals(
                        tokens.get(
                                next
                        ).value
                );

        if (semicolon) {
            next++;
        }

        /*
         * The exemplar must consist solely of this assignment-call.
         * We never weaken larger/more complex structural contracts
         * automatically.
         */
        if (next != tokens.size()) {
            return null;
        }

        return new AssignmentCallShape(
                tokens.get(0).value,
                tokens.get(2).value,
                semicolon
        );
    }

    private static List<Match> findAssignmentCallMatches(
            List<Token> source,
            AssignmentCallShape shape
    ) {
        ArrayList<Match> result =
                new ArrayList<>();

        for (
                int index = 0;
                index + 4 <= source.size();
                index++
        ) {
            if (
                    !shape.left.equals(
                            source.get(
                                    index
                            ).value
                    )
                            || !"P:=".equals(
                            source.get(
                                    index + 1
                            ).value
                    )
                            || !shape.callee.equals(
                            source.get(
                                    index + 2
                            ).value
                    )
                            || !"P:(".equals(
                            source.get(
                                    index + 3
                            ).value
                    )
            ) {
                continue;
            }

            int close =
                    matchingParen(
                            source,
                            index + 3
                    );

            if (close < 0) {
                continue;
            }

            int end =
                    close + 1;

            if (shape.semicolon) {
                if (
                        end >= source.size()
                                || !"P:;".equals(
                                source.get(
                                        end
                                ).value
                        )
                ) {
                    continue;
                }

                end++;
            }

            result.add(
                    new Match(
                            index,
                            end
                    )
            );
        }

        return result;
    }

    private static int matchingParen(
            List<Token> tokens,
            int open
    ) {
        if (
                open < 0
                        || open >= tokens.size()
                        || !"P:(".equals(
                        tokens.get(
                                open
                        ).value
                )
        ) {
            return -1;
        }

        int depth =
                0;

        for (
                int index = open;
                index < tokens.size();
                index++
        ) {
            String value =
                    tokens.get(
                            index
                    ).value;

            if ("P:(".equals(value)) {
                depth++;
            } else if ("P:)".equals(value)) {
                depth--;

                if (depth == 0) {
                    return index;
                }
            }
        }

        return -1;
    }

    private static boolean isIdentifier(
            Token token
    ) {
        return (
                token != null
                        && token.value.startsWith(
                                "I:"
                        )
        );
    }

    private static int expandLeadingIndent(
            String source,
            int tokenStart,
            String exemplar
    ) {
        if (
                exemplar.isEmpty()
                        || !Character.isWhitespace(
                        exemplar.charAt(0)
                )
        ) {
            return tokenStart;
        }

        int start =
                tokenStart;

        while (start > 0) {
            char previous =
                    source.charAt(
                            start - 1
                    );

            if (
                    previous == ' '
                            || previous == '\t'
            ) {
                start--;
                continue;
            }

            break;
        }

        return start;
    }

    private static List<Token> tokenize(
            String source
    ) throws IOException {
        ArrayList<Token> tokens =
                new ArrayList<>();

        int length =
                source.length();

        int index =
                0;

        while (index < length) {
            char current =
                    source.charAt(
                            index
                    );

            if (
                    Character.isWhitespace(
                            current
                    )
            ) {
                index++;
                continue;
            }

            if (
                    current == '/'
                            && index + 1 < length
            ) {
                char next =
                        source.charAt(
                                index + 1
                        );

                if (next == '/') {
                    index += 2;

                    while (
                            index < length
                                    && source.charAt(
                                            index
                                    ) != '\n'
                    ) {
                        index++;
                    }

                    continue;
                }

                if (next == '*') {
                    int close =
                            source.indexOf(
                                    "*/",
                                    index + 2
                            );

                    if (close < 0) {
                        throw new IOException(
                                "Unterminated JavaScript block comment"
                        );
                    }

                    index =
                            close + 2;

                    continue;
                }
            }

            if (
                    current == '"'
                            || current == '\''
                            || current == '`'
            ) {
                char quote =
                        current;

                int start =
                        index;

                index++;

                while (index < length) {
                    char value =
                            source.charAt(
                                    index
                            );

                    if (value == '\\') {
                        index += 2;
                        continue;
                    }

                    index++;

                    if (value == quote) {
                        break;
                    }
                }

                if (
                        index > length
                                || source.charAt(
                                index - 1
                        ) != quote
                ) {
                    throw new IOException(
                            "Unterminated JavaScript string/template"
                    );
                }

                tokens.add(
                        new Token(
                                "S:"
                                        + normalizeStringToken(
                                        source.substring(
                                                start,
                                                index
                                        )
                                ),
                                start,
                                index
                        )
                );

                continue;
            }

            if (
                    Character.isLetter(
                            current
                    )
                            || current == '_'
                            || current == '$'
            ) {
                int start =
                        index;

                index++;

                while (index < length) {
                    char value =
                            source.charAt(
                                    index
                            );

                    if (
                            Character.isLetterOrDigit(
                                    value
                            )
                                    || value == '_'
                                    || value == '$'
                    ) {
                        index++;
                        continue;
                    }

                    break;
                }

                String identifier =
                        source.substring(
                                start,
                                index
                        );

                tokens.add(
                        new Token(
                                "I:"
                                        + normalizeIdentifier(
                                        identifier
                                ),
                                start,
                                index
                        )
                );

                continue;
            }

            if (
                    Character.isDigit(
                            current
                    )
            ) {
                int start =
                        index;

                index++;

                while (index < length) {
                    char value =
                            source.charAt(
                                    index
                            );

                    if (
                            Character.isLetterOrDigit(
                                    value
                            )
                                    || value == '.'
                                    || value == '_'
                                    || value == 'x'
                                    || value == 'X'
                    ) {
                        index++;
                        continue;
                    }

                    break;
                }

                tokens.add(
                        new Token(
                                "N:"
                                        + source.substring(
                                        start,
                                        index
                                ),
                                start,
                                index
                        )
                );

                continue;
            }

            tokens.add(
                    new Token(
                            "P:"
                                    + current,
                            index,
                            index + 1
                    )
            );

            index++;
        }

        return tokens;
    }

    private static String normalizeStringToken(
            String raw
    ) {
        if (
                raw.length() >= 2
                        && (
                        raw.charAt(0) == '"'
                                || raw.charAt(0) == '\''
                )
        ) {
            return raw.substring(
                    1,
                    raw.length() - 1
            );
        }

        return raw;
    }

    private static String normalizeIdentifier(
            String identifier
    ) {
        if (
                identifier.startsWith(
                        "import_"
                )
                        || identifier.startsWith(
                        "require_"
                )
        ) {
            int end =
                    identifier.length();

            int digitStart =
                    end;

            while (
                    digitStart > 0
                            && Character.isDigit(
                            identifier.charAt(
                                    digitStart - 1
                            )
                    )
            ) {
                digitStart--;
            }

            if (digitStart < end) {
                return identifier.substring(
                        0,
                        digitStart
                )
                        + "#";
            }
        }

        return identifier;
    }
}
