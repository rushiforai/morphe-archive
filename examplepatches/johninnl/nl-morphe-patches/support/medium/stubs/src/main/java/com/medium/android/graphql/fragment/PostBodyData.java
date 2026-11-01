// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class PostBodyData {
    private final java.lang.String __typename;
    private final java.util.List paragraphs;
    private final java.util.List sections;
    public PostBodyData(java.lang.String arg0, java.util.List arg1, java.util.List arg2) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        java.util.Objects.requireNonNull(arg2);
        this.__typename = arg0;
        this.sections = arg1;
        this.paragraphs = arg2;
    }
    public java.util.List getParagraphs() { return this.paragraphs; }
    public java.util.List getSections() { return this.sections; }
    public java.lang.String get__typename() { return this.__typename; }
}
