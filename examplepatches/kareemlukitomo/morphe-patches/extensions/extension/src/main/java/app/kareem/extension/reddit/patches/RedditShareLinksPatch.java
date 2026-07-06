package app.kareem.extension.reddit.patches;

import android.content.ClipData;
import android.content.ClipDescription;
import android.net.Uri;

@SuppressWarnings("unused")
public final class RedditShareLinksPatch {
    private static final String CUSTOM_HOST = "redlib.kareem.one";
    private static final String DOT = ".";

    private RedditShareLinksPatch() {
    }

    public static String rewriteShareText(String text) {
        if (text == null || text.isBlank()) {
            return text;
        }

        String rewrittenText = text;
        rewrittenText = replaceIgnoreCase(rewrittenText, host("www", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host(null, "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, shortHost(), CUSTOM_HOST + "/comments");
        return stripQueryFromCustomHostLinks(rewrittenText);
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

    private static String host(String prefix, String tld) {
        String base = "reddit" + DOT + tld;
        return prefix == null ? base : prefix + DOT + base;
    }

    private static String shortHost() {
        return "redd" + DOT + "it";
    }

    private static String stripQueryFromCustomHostLinks(String text) {
        String marker = CUSTOM_HOST;
        int searchStart = 0;
        int hostIndex = indexOfIgnoreCase(text, marker, searchStart);
        if (hostIndex < 0) {
            return text;
        }

        StringBuilder builder = new StringBuilder(text.length());
        int copiedUntil = 0;
        while (hostIndex >= 0) {
            int queryStart = text.indexOf('?', hostIndex + marker.length());
            if (queryStart < 0) {
                break;
            }

            int linkEnd = findLinkEnd(text, queryStart + 1);
            int fragmentStart = text.indexOf('#', queryStart + 1);
            if (fragmentStart >= 0 && fragmentStart < linkEnd) {
                builder.append(text, copiedUntil, queryStart);
                builder.append(text, fragmentStart, linkEnd);
            } else {
                builder.append(text, copiedUntil, queryStart);
            }
            copiedUntil = linkEnd;
            searchStart = linkEnd;
            hostIndex = indexOfIgnoreCase(text, marker, searchStart);
        }

        if (copiedUntil == 0) {
            return text;
        }

        builder.append(text, copiedUntil, text.length());
        return builder.toString();
    }

    private static int findLinkEnd(String text, int start) {
        for (int index = start; index < text.length(); index++) {
            char character = text.charAt(index);
            if (Character.isWhitespace(character) || character == '"' || character == '\'' || character == '<' || character == '>') {
                return index;
            }
        }

        return text.length();
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
}
