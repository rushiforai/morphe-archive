// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class FullPostData$BodyModel {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.fragment.PostBodyData postBodyData;
    public FullPostData$BodyModel(java.lang.String arg0, com.medium.android.graphql.fragment.PostBodyData arg1) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        this.__typename = arg0;
        this.postBodyData = arg1;
    }
    public com.medium.android.graphql.fragment.PostBodyData getPostBodyData() { return this.postBodyData; }
    public java.lang.String get__typename() { return this.__typename; }
}
