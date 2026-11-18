// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class FullPostData {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.fragment.FullPostData$Content content;
    private final com.medium.android.graphql.fragment.CustomFooterData customFooterData;
    private final java.lang.String id;
    private final com.medium.android.graphql.fragment.LinkMetadataList linkMetadataList;
    private final com.medium.android.graphql.fragment.PostFeaturingStatusData postFeaturingStatusData;
    private final com.medium.android.graphql.fragment.PostFooterCountData postFooterCountData;
    private final com.medium.android.graphql.fragment.PostMetaData postMetaData;
    private final com.medium.android.graphql.fragment.PostPromotionBannerData postPromotionBannerData;
    private final com.medium.android.graphql.fragment.PostRepostCountData postRepostCountData;
    private final com.medium.android.graphql.fragment.PostRepostStateData postRepostStateData;
    private final java.util.List tags;
    public FullPostData(java.lang.String arg0, java.util.List arg1, com.medium.android.graphql.fragment.FullPostData$Content arg2, java.lang.String arg3, com.medium.android.graphql.fragment.PostMetaData arg4, com.medium.android.graphql.fragment.LinkMetadataList arg5, com.medium.android.graphql.fragment.PostFooterCountData arg6, com.medium.android.graphql.fragment.CustomFooterData arg7, com.medium.android.graphql.fragment.PostFeaturingStatusData arg8, com.medium.android.graphql.fragment.PostPromotionBannerData arg9, com.medium.android.graphql.fragment.PostRepostStateData arg10, com.medium.android.graphql.fragment.PostRepostCountData arg11) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg2);
        java.util.Objects.requireNonNull(arg3);
        java.util.Objects.requireNonNull(arg4);
        java.util.Objects.requireNonNull(arg5);
        java.util.Objects.requireNonNull(arg6);
        java.util.Objects.requireNonNull(arg7);
        java.util.Objects.requireNonNull(arg8);
        java.util.Objects.requireNonNull(arg9);
        java.util.Objects.requireNonNull(arg10);
        java.util.Objects.requireNonNull(arg11);
        this.__typename = arg0;
        this.tags = arg1;
        this.content = arg2;
        this.id = arg3;
        this.postMetaData = arg4;
        this.linkMetadataList = arg5;
        this.postFooterCountData = arg6;
        this.customFooterData = arg7;
        this.postFeaturingStatusData = arg8;
        this.postPromotionBannerData = arg9;
        this.postRepostStateData = arg10;
        this.postRepostCountData = arg11;
    }
    public com.medium.android.graphql.fragment.FullPostData$Content getContent() { return this.content; }
    public com.medium.android.graphql.fragment.CustomFooterData getCustomFooterData() { return this.customFooterData; }
    public java.lang.String getId() { return this.id; }
    public com.medium.android.graphql.fragment.LinkMetadataList getLinkMetadataList() { return this.linkMetadataList; }
    public com.medium.android.graphql.fragment.PostFeaturingStatusData getPostFeaturingStatusData() { return this.postFeaturingStatusData; }
    public com.medium.android.graphql.fragment.PostFooterCountData getPostFooterCountData() { return this.postFooterCountData; }
    public com.medium.android.graphql.fragment.PostMetaData getPostMetaData() { return this.postMetaData; }
    public com.medium.android.graphql.fragment.PostPromotionBannerData getPostPromotionBannerData() { return this.postPromotionBannerData; }
    public com.medium.android.graphql.fragment.PostRepostCountData getPostRepostCountData() { return this.postRepostCountData; }
    public com.medium.android.graphql.fragment.PostRepostStateData getPostRepostStateData() { return this.postRepostStateData; }
    public java.util.List getTags() { return this.tags; }
    public java.lang.String get__typename() { return this.__typename; }
}
