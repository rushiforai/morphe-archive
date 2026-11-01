package nl.johninnl.monetwuplay;

/** Dedicated boundary for this repository's Wuplay preview-channel publisher. */
public final class WuplayCatalogPolicy {
    public static final String OWNER = "app.wuplay.androidtv";
    public static final String PROVIDER_PREFIX = "santodan-launcher/wuplay/";
    private WuplayCatalogPolicy() {}

    public static boolean accepts(String owner, String provider, String title, String type) {
        return OWNER.equals(owner) && provider != null && provider.startsWith(PROVIDER_PREFIX) &&
            title != null && !title.trim().isEmpty() && "TYPE_PREVIEW".equals(type);
    }
}
