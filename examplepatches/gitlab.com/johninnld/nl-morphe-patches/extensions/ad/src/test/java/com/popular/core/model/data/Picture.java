package com.popular.core.model.data;

/** JVM test stub of the @Keep picture model; getters survive minification. */
public final class Picture {
    private final String url;
    private final String croppedUrl;
    private final String imageDomainUrl;

    public Picture(String url, String croppedUrl, String imageDomainUrl) {
        this.url = url;
        this.croppedUrl = croppedUrl;
        this.imageDomainUrl = imageDomainUrl;
    }

    public String getUrl() { return url; }
    public String getCroppedUrl() { return croppedUrl; }
    public String getImageDomainUrl() { return imageDomainUrl; }
}
