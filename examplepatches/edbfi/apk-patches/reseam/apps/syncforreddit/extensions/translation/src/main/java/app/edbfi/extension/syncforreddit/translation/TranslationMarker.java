// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

final class TranslationMarker {
    private TranslationMarker() {}

    static boolean matches(CharSequence raw, CharSequence attribution) {
        if (raw == null) return false;
        String text = raw.toString();
        String spacing = "&nbsp;&nbsp;&nbsp;";
        String sourceLanguage = "^*&#40;";
        String renderedSourceLanguage = "<sup><em>&#40;";
        // The stock worker reads processed HTML. Recognize both formats and Sync's older linked badge.
        return text.contains("\n\n" + attribution + spacing + sourceLanguage)
                || text.contains("<p>" + attribution + spacing + renderedSourceLanguage)
                || text.contains("[" + attribution + "](translate)" + spacing + sourceLanguage)
                || text.contains("<a href=\"translate\">" + attribution + "</a>" + spacing + renderedSourceLanguage);
    }
}
