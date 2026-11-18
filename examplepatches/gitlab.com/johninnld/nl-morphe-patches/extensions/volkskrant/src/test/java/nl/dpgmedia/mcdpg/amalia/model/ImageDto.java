package nl.dpgmedia.mcdpg.amalia.model;

import java.util.Map;

/** Test double with the production constructor signature. */
public final class ImageDto {
    private final String alt;
    private final String src;
    private final String baseUrl;
    private final Map<String, String> params;

    public ImageDto(String alt, String src, String baseUrl, Map<String, String> params) {
        this.alt = alt;
        this.src = src;
        this.baseUrl = baseUrl;
        this.params = params;
    }

    public String getAlt() {
        return alt;
    }

    public String getSrc() {
        return src;
    }

    public String getBaseUrl() {
        return baseUrl;
    }

    public Map<String, String> getParams() {
        return params;
    }
}
