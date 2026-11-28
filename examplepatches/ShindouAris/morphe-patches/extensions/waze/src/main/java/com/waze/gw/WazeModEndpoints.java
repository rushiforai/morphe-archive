package com.waze.gw;

/** Canonical public endpoints shared by OTA and signed dataset clients. */
final class WazeModEndpoints {
    static final String PRIMARY = "https://wazemod.io.vn";
    static final String FALLBACK = "https://wazemod.chisadin.id.vn";

    private WazeModEndpoints() { }

    static String[] defaults() {
        return new String[]{PRIMARY, FALLBACK};
    }

    /** Preserve an explicit developer override; migrate either historical default to the new pair. */
    static String[] forConfiguredBase(String configured) {
        String value = trim(configured);
        if (value.length() == 0 || PRIMARY.equalsIgnoreCase(value)
                || FALLBACK.equalsIgnoreCase(value)) return defaults();
        return new String[]{value};
    }

    /** "host: reason" for one failed endpoint, so the settings card can show why each of them failed. */
    static String failure(String base, String reason) {
        String host;
        try { host = new java.net.URL(base).getHost(); } catch (Exception e) { host = base; }
        return host + ": " + reason;
    }

    /** Joins the per-endpoint failures; the last endpoint's error alone used to hide the first one's. */
    static String joinFailures(java.util.List<String> failures) {
        StringBuilder out = new StringBuilder();
        for (String f : failures) {
            if (out.length() > 0) out.append(" | ");
            out.append(f);
        }
        return out.length() == 0 ? "unknown" : out.toString();
    }

    static String trim(String value) {
        String result = value == null ? "" : value.trim();
        while (result.endsWith("/")) result = result.substring(0, result.length() - 1);
        return result;
    }
}
