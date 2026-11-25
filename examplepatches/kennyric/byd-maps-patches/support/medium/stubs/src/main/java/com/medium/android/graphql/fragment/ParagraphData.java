// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class ParagraphData {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.fragment.ParagraphData$CodeBlockMetadata codeBlockMetadata;
    private final com.medium.android.graphql.fragment.ParagraphData$DropCapImage dropCapImage;
    private final java.lang.Boolean hasDropCap;
    private final java.lang.String href;
    private final java.lang.String id;
    private final com.medium.android.graphql.fragment.ParagraphData$Iframe iframe;
    private final com.medium.android.graphql.type.LayoutType layout;
    private final java.util.List markups;
    private final com.medium.android.graphql.fragment.ParagraphData$Metadata metadata;
    private final com.medium.android.graphql.fragment.ParagraphData$MixtapeMetadata mixtapeMetadata;
    private final java.lang.String name;
    private final java.lang.String text;
    private final com.medium.android.graphql.type.ParagraphType type;
    public ParagraphData(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, com.medium.android.graphql.fragment.ParagraphData$Iframe arg5, com.medium.android.graphql.type.LayoutType arg6, java.util.List arg7, com.medium.android.graphql.fragment.ParagraphData$Metadata arg8, com.medium.android.graphql.fragment.ParagraphData$MixtapeMetadata arg9, com.medium.android.graphql.type.ParagraphType arg10, java.lang.Boolean arg11, com.medium.android.graphql.fragment.ParagraphData$DropCapImage arg12, com.medium.android.graphql.fragment.ParagraphData$CodeBlockMetadata arg13) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        java.util.Objects.requireNonNull(arg7);
        this.__typename = arg0;
        this.id = arg1;
        this.name = arg2;
        this.href = arg3;
        this.text = arg4;
        this.iframe = arg5;
        this.layout = arg6;
        this.markups = arg7;
        this.metadata = arg8;
        this.mixtapeMetadata = arg9;
        this.type = arg10;
        this.hasDropCap = arg11;
        this.dropCapImage = arg12;
        this.codeBlockMetadata = arg13;
    }
    public com.medium.android.graphql.fragment.ParagraphData$CodeBlockMetadata getCodeBlockMetadata() { return this.codeBlockMetadata; }
    public com.medium.android.graphql.fragment.ParagraphData$DropCapImage getDropCapImage() { return this.dropCapImage; }
    public java.lang.Boolean getHasDropCap() { return this.hasDropCap; }
    public java.lang.String getHref() { return this.href; }
    public java.lang.String getId() { return this.id; }
    public com.medium.android.graphql.fragment.ParagraphData$Iframe getIframe() { return this.iframe; }
    public com.medium.android.graphql.type.LayoutType getLayout() { return this.layout; }
    public java.util.List getMarkups() { return this.markups; }
    public com.medium.android.graphql.fragment.ParagraphData$Metadata getMetadata() { return this.metadata; }
    public com.medium.android.graphql.fragment.ParagraphData$MixtapeMetadata getMixtapeMetadata() { return this.mixtapeMetadata; }
    public java.lang.String getName() { return this.name; }
    public java.lang.String getText() { return this.text; }
    public com.medium.android.graphql.type.ParagraphType getType() { return this.type; }
    public java.lang.String get__typename() { return this.__typename; }
}
