// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class FullPostData$Content {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.fragment.FullPostData$BodyModel bodyModel;
    private final boolean isLockedPreviewOnly;
    private final com.medium.android.graphql.fragment.FullPostData$ShareKeyCreator shareKeyCreator;
    private final java.lang.String validatedShareKey;
    public FullPostData$Content(java.lang.String arg0, com.medium.android.graphql.fragment.FullPostData$BodyModel arg1, boolean arg2, java.lang.String arg3, com.medium.android.graphql.fragment.FullPostData$ShareKeyCreator arg4) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        this.__typename = arg0;
        this.bodyModel = arg1;
        this.isLockedPreviewOnly = arg2;
        this.validatedShareKey = arg3;
        this.shareKeyCreator = arg4;
    }
    public com.medium.android.graphql.fragment.FullPostData$BodyModel getBodyModel() { return this.bodyModel; }
    public com.medium.android.graphql.fragment.FullPostData$ShareKeyCreator getShareKeyCreator() { return this.shareKeyCreator; }
    public java.lang.String getValidatedShareKey() { return this.validatedShareKey; }
    public java.lang.String get__typename() { return this.__typename; }
    public boolean isLockedPreviewOnly() { return this.isLockedPreviewOnly; }
}
