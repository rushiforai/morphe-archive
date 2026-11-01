// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql;
public final class FullPostQuery$Post {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.fragment.FullPostData fullPostData;
    private final java.lang.String id;
    public FullPostQuery$Post(java.lang.String arg0, java.lang.String arg1, com.medium.android.graphql.fragment.FullPostData arg2) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        java.util.Objects.requireNonNull(arg2);
        this.__typename = arg0;
        this.id = arg1;
        this.fullPostData = arg2;
    }
    public com.medium.android.graphql.fragment.FullPostData getFullPostData() { return this.fullPostData; }
    public java.lang.String getId() { return this.id; }
    public java.lang.String get__typename() { return this.__typename; }
}
