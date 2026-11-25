// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class MediaResourceData {
    private final java.lang.String __typename;
    private final java.lang.String id;
    private final java.lang.String iframeSrc;
    private final java.lang.String thumbnailUrl;
    public MediaResourceData(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        this.__typename = arg0;
        this.id = arg1;
        this.iframeSrc = arg2;
        this.thumbnailUrl = arg3;
    }
    public java.lang.String getId() { return this.id; }
    public java.lang.String getIframeSrc() { return this.iframeSrc; }
    public java.lang.String getThumbnailUrl() { return this.thumbnailUrl; }
    public java.lang.String get__typename() { return this.__typename; }
}
