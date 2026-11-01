// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class MarkupData {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.type.AnchorType anchorType;
    private final java.util.List creatorIds;
    private final int end;
    private final java.lang.String href;
    private final java.lang.String name;
    private final java.lang.String rel;
    private final int start;
    private final java.lang.String title;
    private final com.medium.android.graphql.type.MarkupType type;
    private final java.lang.String userId;
    public MarkupData(java.lang.String arg0, java.lang.String arg1, com.medium.android.graphql.type.MarkupType arg2, int arg3, int arg4, java.lang.String arg5, java.lang.String arg6, java.lang.String arg7, com.medium.android.graphql.type.AnchorType arg8, java.lang.String arg9, java.util.List arg10) {
        java.util.Objects.requireNonNull(arg0);
        this.__typename = arg0;
        this.name = arg1;
        this.type = arg2;
        this.start = arg3;
        this.end = arg4;
        this.href = arg5;
        this.title = arg6;
        this.rel = arg7;
        this.anchorType = arg8;
        this.userId = arg9;
        this.creatorIds = arg10;
    }
    public com.medium.android.graphql.type.AnchorType getAnchorType() { return this.anchorType; }
    public java.util.List getCreatorIds() { return this.creatorIds; }
    public int getEnd() { return this.end; }
    public java.lang.String getHref() { return this.href; }
    public java.lang.String getName() { return this.name; }
    public java.lang.String getRel() { return this.rel; }
    public int getStart() { return this.start; }
    public java.lang.String getTitle() { return this.title; }
    public com.medium.android.graphql.type.MarkupType getType() { return this.type; }
    public java.lang.String getUserId() { return this.userId; }
    public java.lang.String get__typename() { return this.__typename; }
}
