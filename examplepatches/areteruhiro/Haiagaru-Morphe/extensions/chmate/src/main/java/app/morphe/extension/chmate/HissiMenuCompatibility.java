package app.morphe.extension.chmate;

/** Repairs the stock Hissi host filter before ChMate expands menu templates. */
public final class HissiMenuCompatibility {
    private HissiMenuCompatibility() {}

    public static String rewriteTemplate(String template) {
        if (template == null || !template.contains("://hissi.org/read.php/")) {
            return template;
        }
        // Keep the old hosts working, including when domain conversion is disabled.
        // Do not change the destination, ID/date expansion, or the menu preference.
        return template.replace("{$host[match:[25]ch.net$]}",
                "{$host[match:(^|\\.)(2ch\\.net|5ch\\.(net|io))$]}");
    }
}
