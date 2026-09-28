package app.morphe.extension.chmate;

/** Repairs the stock Hissi host filter before ChMate expands menu templates. */
public final class HissiMenuCompatibility {
    private HissiMenuCompatibility() {}

    public static String rewriteTemplate(String template) {
        if (template == null || !template.contains("://hissi.org/read.php/")) {
            return template;
        }
        String stockFilter = "{$host[match:[25]ch.net$]}";
        String compatibleFilter = "{$host[match:(^|\\.)(2ch\\.net|5ch\\.(net|io))$]}";
        if (!template.contains(stockFilter) && !template.contains(compatibleFilter)) {
            return template;
        }
        // Keep the old hosts working, including when domain conversion is disabled.
        // Do not change the destination, ID/date expansion, or the menu preference.
        String rewritten = template.replace("http://hissi.org/read.php/",
                "haiagaru-hissi://hissi.org/read.php/")
                .replace("https://hissi.org/read.php/",
                        "haiagaru-hissis://hissi.org/read.php/");
        return rewritten.replace(stockFilter, compatibleFilter);
    }
}
