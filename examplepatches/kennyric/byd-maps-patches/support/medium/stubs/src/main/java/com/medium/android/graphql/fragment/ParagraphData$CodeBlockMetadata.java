// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class ParagraphData$CodeBlockMetadata {
    private final java.lang.String __typename;
    private final java.lang.String lang;
    private final com.medium.android.graphql.type.SyntaxHighlightMode mode;
    public ParagraphData$CodeBlockMetadata(java.lang.String arg0, java.lang.String arg1, com.medium.android.graphql.type.SyntaxHighlightMode arg2) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg2);
        this.__typename = arg0;
        this.lang = arg1;
        this.mode = arg2;
    }
    public java.lang.String getLang() { return this.lang; }
    public com.medium.android.graphql.type.SyntaxHighlightMode getMode() { return this.mode; }
    public java.lang.String get__typename() { return this.__typename; }
}
