package dev.rikunode.futatabi.bridge;

/** Applies the stock parser's quote marker to already escaped post text only. */
final class FutabaQuoteMarkup {
    private FutabaQuoteMarkup() {}

    static String render(String escaped) {
        StringBuilder out = new StringBuilder();
        boolean first = true;
        for (String line : escaped.split("<br>", -1)) {
            if (!first) out.append("<br>");
            first = false;
            if (line.startsWith("&gt;")) {
                out.append("<font color=\"#789922\">").append(line).append("</font>");
            } else {
                out.append(line);
            }
        }
        return out.toString();
    }
}
