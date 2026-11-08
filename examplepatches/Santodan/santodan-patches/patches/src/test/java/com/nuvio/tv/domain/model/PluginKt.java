package com.nuvio.tv.domain.model;

/** Host fixture for beta.10's native plugin binge-group parser. Never packaged. */
public final class PluginKt {
    public static String scraperIdFromPluginBingeGroup(String group) {
        String value = group == null ? "" : group.trim();
        String prefix = "local-plugin-";
        if (!value.startsWith(prefix)) return null;
        String scraper = value.substring(prefix.length()).split("\\|", 2)[0];
        return scraper.isBlank() ? null : scraper;
    }
}
