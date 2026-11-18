// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class ImageMetadataData {
    private final java.lang.String __typename;
    private final java.lang.String alt;
    private final java.lang.Double focusPercentX;
    private final java.lang.Double focusPercentY;
    private final java.lang.String id;
    private final java.lang.Integer originalHeight;
    private final java.lang.Integer originalWidth;
    public ImageMetadataData(java.lang.String arg0, java.lang.String arg1, java.lang.Integer arg2, java.lang.Integer arg3, java.lang.Double arg4, java.lang.Double arg5, java.lang.String arg6) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        this.__typename = arg0;
        this.id = arg1;
        this.originalWidth = arg2;
        this.originalHeight = arg3;
        this.focusPercentX = arg4;
        this.focusPercentY = arg5;
        this.alt = arg6;
    }
    public java.lang.String getAlt() { return this.alt; }
    public java.lang.Double getFocusPercentX() { return this.focusPercentX; }
    public java.lang.Double getFocusPercentY() { return this.focusPercentY; }
    public java.lang.String getId() { return this.id; }
    public java.lang.Integer getOriginalHeight() { return this.originalHeight; }
    public java.lang.Integer getOriginalWidth() { return this.originalWidth; }
    public java.lang.String get__typename() { return this.__typename; }
}
