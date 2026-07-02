package app.kareem.extension.tiktok.patches;

import android.content.ClipData;
import android.content.ClipDescription;
import android.net.Uri;

@SuppressWarnings("unused")
public final class TikTokShareLinksPatch {
    private static final String CUSTOM_HOST = "sticktock.kareem.one";
    private static final String DOT = ".";

    private TikTokShareLinksPatch() {
    }

    public static String rewriteShareText(String text) {
        if (text == null || text.isBlank()) {
            return text;
        }

        String rewrittenText = text;
        rewrittenText = replaceIgnoreCase(rewrittenText, host("www", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host("m", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host("vm", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host("vt", "com"), CUSTOM_HOST);
        rewrittenText = replaceIgnoreCase(rewrittenText, host(null, "com"), CUSTOM_HOST);
        return rewrittenText;
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
        String base = "tiktok" + DOT + tld;
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
}
