package com.music.bitchord.data.sources;

public final class SourceConfig {
    public final String id, label, baseUrl;
    public final SourceKind kind;
    public final boolean enabled, allowDownloads, checkValidLossless;

    public SourceConfig(
            String id,
            SourceKind kind,
            String label,
            String baseUrl,
            boolean enabled,
            boolean allowDownloads,
            boolean checkValidLossless) {
        this.id = id;
        this.kind = kind;
        this.label = label;
        this.baseUrl = baseUrl;
        this.enabled = enabled;
        this.allowDownloads = allowDownloads;
        this.checkValidLossless = checkValidLossless;
    }

    public String getId() {
        return id;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public String getBaseUrl() {
        return baseUrl;
    }
}
