// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class PostMetaData {
    private final java.lang.String __typename;
    private final java.lang.Boolean allowResponses;
    private final java.lang.String canonicalUrl;
    private final com.medium.android.graphql.fragment.PostMetaData$Collection collection;
    private final com.medium.android.graphql.fragment.PostMetaData$Creator creator;
    private final java.lang.String detectedLanguage;
    private final java.lang.Long firstPublishedAt;
    private final java.lang.String id;
    private final com.medium.android.graphql.type.InResponseToEntityType inResponseToEntityType;
    private final com.medium.android.graphql.fragment.PostMetaData$InResponseToMediaResource inResponseToMediaResource;
    private final com.medium.android.graphql.fragment.PostMetaData$InResponseToPostResult inResponseToPostResult;
    private final java.lang.Boolean isLocked;
    private final boolean isNewsletter;
    private final boolean isProxyPost;
    private final java.lang.String latestPublishedVersion;
    private final java.lang.String mediumUrl;
    private final java.lang.Long pinnedByCreatorAt;
    private final com.medium.android.graphql.fragment.PostClapsData postClapsData;
    private final com.medium.android.graphql.fragment.PostMenuData postMenuData;
    private final com.medium.android.graphql.fragment.PostVisibilityData postVisibilityData;
    private final com.medium.android.graphql.fragment.PostMetaData$PreviewContent previewContent;
    private final com.medium.android.graphql.fragment.PostMetaData$PreviewImage previewImage;
    private final java.lang.Double readingTime;
    private final com.medium.android.graphql.fragment.ResponseCountData responseCountData;
    private final java.lang.String title;
    private final java.lang.Long updatedAt;
    private final com.medium.android.graphql.fragment.PostMetaData$ViewerEdge viewerEdge;
    private final com.medium.android.graphql.type.PostVisibilityType visibility;
    public PostMetaData(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, com.medium.android.graphql.type.PostVisibilityType arg3, com.medium.android.graphql.fragment.PostMetaData$ViewerEdge arg4, java.lang.String arg5, java.lang.String arg6, java.lang.Double arg7, java.lang.Long arg8, java.lang.Boolean arg9, java.lang.Boolean arg10, boolean arg11, java.lang.String arg12, java.lang.Long arg13, com.medium.android.graphql.fragment.PostMetaData$PreviewImage arg14, com.medium.android.graphql.fragment.PostMetaData$InResponseToPostResult arg15, com.medium.android.graphql.fragment.PostMetaData$InResponseToMediaResource arg16, com.medium.android.graphql.type.InResponseToEntityType arg17, java.lang.String arg18, com.medium.android.graphql.fragment.PostMetaData$Collection arg19, com.medium.android.graphql.fragment.PostMetaData$Creator arg20, com.medium.android.graphql.fragment.PostMetaData$PreviewContent arg21, java.lang.Long arg22, boolean arg23, com.medium.android.graphql.fragment.PostClapsData arg24, com.medium.android.graphql.fragment.ResponseCountData arg25, com.medium.android.graphql.fragment.PostVisibilityData arg26, com.medium.android.graphql.fragment.PostMenuData arg27) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        java.util.Objects.requireNonNull(arg3);
        java.util.Objects.requireNonNull(arg4);
        java.util.Objects.requireNonNull(arg12);
        this.__typename = arg0;
        this.id = arg1;
        this.title = arg2;
        this.visibility = arg3;
        this.viewerEdge = arg4;
        this.detectedLanguage = arg5;
        this.mediumUrl = arg6;
        this.readingTime = arg7;
        this.updatedAt = arg8;
        this.isLocked = arg9;
        this.allowResponses = arg10;
        this.isProxyPost = arg11;
        this.latestPublishedVersion = arg12;
        this.firstPublishedAt = arg13;
        this.previewImage = arg14;
        this.inResponseToPostResult = arg15;
        this.inResponseToMediaResource = arg16;
        this.inResponseToEntityType = arg17;
        this.canonicalUrl = arg18;
        this.collection = arg19;
        this.creator = arg20;
        this.previewContent = arg21;
        this.pinnedByCreatorAt = arg22;
        this.isNewsletter = arg23;
        this.postClapsData = arg24;
        this.responseCountData = arg25;
        this.postVisibilityData = arg26;
        this.postMenuData = arg27;
    }
    public java.lang.Boolean getAllowResponses() { return this.allowResponses; }
    public java.lang.String getCanonicalUrl() { return this.canonicalUrl; }
    public com.medium.android.graphql.fragment.PostMetaData$Collection getCollection() { return this.collection; }
    public com.medium.android.graphql.fragment.PostMetaData$Creator getCreator() { return this.creator; }
    public java.lang.String getDetectedLanguage() { return this.detectedLanguage; }
    public java.lang.Long getFirstPublishedAt() { return this.firstPublishedAt; }
    public java.lang.String getId() { return this.id; }
    public com.medium.android.graphql.type.InResponseToEntityType getInResponseToEntityType() { return this.inResponseToEntityType; }
    public com.medium.android.graphql.fragment.PostMetaData$InResponseToMediaResource getInResponseToMediaResource() { return this.inResponseToMediaResource; }
    public com.medium.android.graphql.fragment.PostMetaData$InResponseToPostResult getInResponseToPostResult() { return this.inResponseToPostResult; }
    public java.lang.String getLatestPublishedVersion() { return this.latestPublishedVersion; }
    public java.lang.String getMediumUrl() { return this.mediumUrl; }
    public java.lang.Long getPinnedByCreatorAt() { return this.pinnedByCreatorAt; }
    public com.medium.android.graphql.fragment.PostClapsData getPostClapsData() { return this.postClapsData; }
    public com.medium.android.graphql.fragment.PostMenuData getPostMenuData() { return this.postMenuData; }
    public com.medium.android.graphql.fragment.PostVisibilityData getPostVisibilityData() { return this.postVisibilityData; }
    public com.medium.android.graphql.fragment.PostMetaData$PreviewContent getPreviewContent() { return this.previewContent; }
    public com.medium.android.graphql.fragment.PostMetaData$PreviewImage getPreviewImage() { return this.previewImage; }
    public java.lang.Double getReadingTime() { return this.readingTime; }
    public com.medium.android.graphql.fragment.ResponseCountData getResponseCountData() { return this.responseCountData; }
    public java.lang.String getTitle() { return this.title; }
    public java.lang.Long getUpdatedAt() { return this.updatedAt; }
    public com.medium.android.graphql.fragment.PostMetaData$ViewerEdge getViewerEdge() { return this.viewerEdge; }
    public com.medium.android.graphql.type.PostVisibilityType getVisibility() { return this.visibility; }
    public java.lang.String get__typename() { return this.__typename; }
    public java.lang.Boolean isLocked() { return this.isLocked; }
    public boolean isNewsletter() { return this.isNewsletter; }
    public boolean isProxyPost() { return this.isProxyPost; }
}
