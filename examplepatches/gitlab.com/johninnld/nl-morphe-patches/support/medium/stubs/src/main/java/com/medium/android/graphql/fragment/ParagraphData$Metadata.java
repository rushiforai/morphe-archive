// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class ParagraphData$Metadata {
    private final java.lang.String __typename;
    private final java.lang.String id;
    private final com.medium.android.graphql.fragment.ImageMetadataData imageMetadataData;
    public ParagraphData$Metadata(java.lang.String arg0, java.lang.String arg1, com.medium.android.graphql.fragment.ImageMetadataData arg2) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        java.util.Objects.requireNonNull(arg2);
        this.__typename = arg0;
        this.id = arg1;
        this.imageMetadataData = arg2;
    }
    public java.lang.String getId() { return this.id; }
    public com.medium.android.graphql.fragment.ImageMetadataData getImageMetadataData() { return this.imageMetadataData; }
    public java.lang.String get__typename() { return this.__typename; }
}
