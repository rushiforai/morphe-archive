package app.kareem.extension.threads.patches;

import android.content.ClipData;
import android.content.ClipDescription;
import android.net.Uri;

@SuppressWarnings("unused")
public final class ThreadsShareLinksPatch {
    private static final String CUSTOM_HOST = "shoelace.kareem.one";
    private static final String CUSTOM_URL = "https://" + CUSTOM_HOST;
    private static final String DOT = ".";

    private ThreadsShareLinksPatch() {
    }

    public static String rewriteShareText(String text) {
        if (text == null || text.isBlank()) {
            return text;
        }

        String rewrittenText = text;
        rewrittenText = replaceIgnoreCase(rewrittenText, host("www", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host("www", "net"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host("l", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host("l", "net"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host(null, "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host(null, "net"), CUSTOM_HOST);
        return stripQueryStrings(rewrittenText);
    }

    public static String rewriteShareCharSequence(CharSequence text) {
        if (text == null) {
            return null;
        }

        return rewriteShareText(text.toString());
    }

    public static ClipData rewriteClipData(ClipData clipData) {
        if (clipData == null) {
            return null;
        }

        try {
            int itemCount = clipData.getItemCount();
            if (itemCount <= 0) {
                return clipData;
            }

            ClipData rewrittenClipData = null;
            for (int index = 0; index < itemCount; index++) {
                ClipData.Item item = clipData.getItemAt(index);
                CharSequence text = item.getText();
                String htmlText = item.getHtmlText();
                Uri uri = item.getUri();
                String rewrittenText = text == null ? null : rewriteShareText(text.toString());
                String rewrittenHtmlText = htmlText == null ? null : rewriteShareText(htmlText);
                Uri rewrittenUri = uri == null ? null : Uri.parse(rewriteShareText(uri.toString()));
                ClipData.Item rewrittenItem = new ClipData.Item(
                    rewrittenText,
                    rewrittenHtmlText,
                    item.getIntent(),
                    rewrittenUri
                );

                if (rewrittenClipData == null) {
                    ClipDescription description = clipData.getDescription();
                    rewrittenClipData = new ClipData(description, rewrittenItem);
                } else {
                    rewrittenClipData.addItem(rewrittenItem);
                }
            }

            return rewrittenClipData == null ? clipData : rewrittenClipData;
        } catch (Exception ignored) {
            return clipData;
        }
    }

    public static String rewriteShareUrl(String url) {
        return rewriteShareText(url);
    }

    private static String host(String prefix, String tld) {
        String base = "threads" + DOT + tld;
        return prefix == null ? base : prefix + DOT + base;
    }

    private static String replaceIgnoreCase(String input, String target, String replacement) {
        int targetLength = target.length();
        int start = 0;
        int match = indexOfIgnoreCase(input, target, start);
        if (match < 0) {
            return input;
        }

        StringBuilder builder = new StringBuilder(input.length() + replacement.length());
        do {
            builder.append(input, start, match);
            builder.append(replacement);
            start = match + targetLength;
            match = indexOfIgnoreCase(input, target, start);
        } while (match >= 0);

        builder.append(input, start, input.length());
        return builder.toString();
    }

    private static int indexOfIgnoreCase(String input, String target, int start) {
        int max = input.length() - target.length();
        for (int index = start; index <= max; index++) {
            if (input.regionMatches(true, index, target, 0, target.length())) {
                return index;
            }
        }

        return -1;
    }

    private static String stripQueryStrings(String input) {
        int hostStart = indexOfIgnoreCase(input, CUSTOM_HOST, 0);
        if (hostStart < 0) {
            return input;
        }

        StringBuilder builder = null;
        int copiedUntil = 0;
        while (hostStart >= 0) {
            int tokenEnd = findTokenEnd(input, hostStart + CUSTOM_HOST.length());
            int queryStart = indexOf(input, '?', hostStart + CUSTOM_HOST.length(), tokenEnd);
            if (queryStart >= 0) {
                int trailingStart = trimTrailingPunctuation(input, queryStart, tokenEnd);
                int fragmentStart = indexOf(input, '#', queryStart + 1, trailingStart);
                if (builder == null) {
                    builder = new StringBuilder(input.length());
                }

                builder.append(input, copiedUntil, queryStart);
                if (fragmentStart >= 0) {
                    builder.append(input, fragmentStart, trailingStart);
                }
                builder.append(input, trailingStart, tokenEnd);
                copiedUntil = tokenEnd;
            }

            hostStart = indexOfIgnoreCase(input, CUSTOM_HOST, tokenEnd);
        }

        if (builder == null) {
            return input;
        }

        builder.append(input, copiedUntil, input.length());
        return builder.toString();
    }

    private static int findTokenEnd(String input, int start) {
        int length = input.length();
        for (int index = start; index < length; index++) {
            if (isUrlDelimiter(input.charAt(index))) {
                return index;
            }
        }

        return length;
    }

    private static boolean isUrlDelimiter(char character) {
        return Character.isWhitespace(character) ||
            character == '"' ||
            character == '\'' ||
            character == '<' ||
            character == '>';
    }

    private static int indexOf(String input, char target, int start, int end) {
        for (int index = start; index < end; index++) {
            if (input.charAt(index) == target) {
                return index;
            }
        }

        return -1;
    }

    private static int trimTrailingPunctuation(String input, int queryStart, int tokenEnd) {
        int end = tokenEnd;
        while (end > queryStart && isTrailingPunctuation(input.charAt(end - 1))) {
            end--;
        }

        return end;
    }

    private static boolean isTrailingPunctuation(char character) {
        return character == '.' ||
            character == ',' ||
            character == '!' ||
            character == '?' ||
            character == ';' ||
            character == ':' ||
            character == ')' ||
            character == ']' ||
            character == '}';
    }
}
