// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class IframeData {
    private final java.lang.String __typename;
    private final java.lang.Integer iframeHeight;
    private final java.lang.Integer iframeWidth;
    private final com.medium.android.graphql.fragment.IframeData$MediaResource mediaResource;
    public IframeData(java.lang.String arg0, java.lang.Integer arg1, java.lang.Integer arg2, com.medium.android.graphql.fragment.IframeData$MediaResource arg3) {
        java.util.Objects.requireNonNull(arg0);
        this.__typename = arg0;
        this.iframeHeight = arg1;
        this.iframeWidth = arg2;
        this.mediaResource = arg3;
    }
    public java.lang.Integer getIframeHeight() { return this.iframeHeight; }
    public java.lang.Integer getIframeWidth() { return this.iframeWidth; }
    public com.medium.android.graphql.fragment.IframeData$MediaResource getMediaResource() { return this.mediaResource; }
    public java.lang.String get__typename() { return this.__typename; }
}
