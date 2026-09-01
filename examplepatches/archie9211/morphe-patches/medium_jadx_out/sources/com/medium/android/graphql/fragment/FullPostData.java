package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001d\b\u0086\b\u0018\u00002\u00020\u0001:\u0005OPQRSBg\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0015\u001a\u00020\u0014\u0012\u0006\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0018\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u001bJ\u0010\u0010!\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\b'\u0010(J\u0010\u0010)\u001a\u00020\u0012HÆ\u0003¢\u0006\u0004\b)\u0010*J\u0010\u0010+\u001a\u00020\u0014HÆ\u0003¢\u0006\u0004\b+\u0010,J\u0010\u0010-\u001a\u00020\u0016HÆ\u0003¢\u0006\u0004\b-\u0010.J\u0086\u0001\u0010/\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00042\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\t\u001a\u00020\u00022\b\b\u0002\u0010\u000b\u001a\u00020\n2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u00102\b\b\u0002\u0010\u0013\u001a\u00020\u00122\b\b\u0002\u0010\u0015\u001a\u00020\u00142\b\b\u0002\u0010\u0017\u001a\u00020\u0016HÆ\u0001¢\u0006\u0004\b/\u00100J\u0010\u00101\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b1\u0010\u001bJ\u0010\u00103\u001a\u000202HÖ\u0001¢\u0006\u0004\b3\u00104J\u001a\u00108\u001a\u0002072\b\u00106\u001a\u0004\u0018\u000105HÖ\u0003¢\u0006\u0004\b8\u00109R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010:\u001a\u0004\b;\u0010\u001bR\u001f\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010<\u001a\u0004\b=\u0010\u001dR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010>\u001a\u0004\b?\u0010\u001fR\u0017\u0010\t\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\t\u0010:\u001a\u0004\b@\u0010\u001bR\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010A\u001a\u0004\bB\u0010\"R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010C\u001a\u0004\bD\u0010$R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010E\u001a\u0004\bF\u0010&R\u0017\u0010\u0011\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010G\u001a\u0004\bH\u0010(R\u0017\u0010\u0013\u001a\u00020\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010I\u001a\u0004\bJ\u0010*R\u0017\u0010\u0015\u001a\u00020\u00148\u0006¢\u0006\f\n\u0004\b\u0015\u0010K\u001a\u0004\bL\u0010,R\u0017\u0010\u0017\u001a\u00020\u00168\u0006¢\u0006\f\n\u0004\b\u0017\u0010M\u001a\u0004\bN\u0010.¨\u0006T"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostData;", "Lg15;", "", "__typename", "", "Lcom/medium/android/graphql/fragment/FullPostData$Tag;", "tags", "Lcom/medium/android/graphql/fragment/FullPostData$Content;", "content", "id", "Lcom/medium/android/graphql/fragment/PostMetaData;", "postMetaData", "Lcom/medium/android/graphql/fragment/LinkMetadataList;", "linkMetadataList", "Lcom/medium/android/graphql/fragment/PostFooterCountData;", "postFooterCountData", "Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;", "postFeaturingStatusData", "Lcom/medium/android/graphql/fragment/PostPromotionBannerData;", "postPromotionBannerData", "Lcom/medium/android/graphql/fragment/PostRepostStateData;", "postRepostStateData", "Lcom/medium/android/graphql/fragment/PostRepostCountData;", "postRepostCountData", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/fragment/FullPostData$Content;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData;Lcom/medium/android/graphql/fragment/LinkMetadataList;Lcom/medium/android/graphql/fragment/PostFooterCountData;Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;Lcom/medium/android/graphql/fragment/PostPromotionBannerData;Lcom/medium/android/graphql/fragment/PostRepostStateData;Lcom/medium/android/graphql/fragment/PostRepostCountData;)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/util/List;", "component3", "()Lcom/medium/android/graphql/fragment/FullPostData$Content;", "component4", "component5", "()Lcom/medium/android/graphql/fragment/PostMetaData;", "component6", "()Lcom/medium/android/graphql/fragment/LinkMetadataList;", "component7", "()Lcom/medium/android/graphql/fragment/PostFooterCountData;", "component8", "()Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;", "component9", "()Lcom/medium/android/graphql/fragment/PostPromotionBannerData;", "component10", "()Lcom/medium/android/graphql/fragment/PostRepostStateData;", "component11", "()Lcom/medium/android/graphql/fragment/PostRepostCountData;", "copy", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/fragment/FullPostData$Content;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostMetaData;Lcom/medium/android/graphql/fragment/LinkMetadataList;Lcom/medium/android/graphql/fragment/PostFooterCountData;Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;Lcom/medium/android/graphql/fragment/PostPromotionBannerData;Lcom/medium/android/graphql/fragment/PostRepostStateData;Lcom/medium/android/graphql/fragment/PostRepostCountData;)Lcom/medium/android/graphql/fragment/FullPostData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Ljava/util/List;", "getTags", "Lcom/medium/android/graphql/fragment/FullPostData$Content;", "getContent", "getId", "Lcom/medium/android/graphql/fragment/PostMetaData;", "getPostMetaData", "Lcom/medium/android/graphql/fragment/LinkMetadataList;", "getLinkMetadataList", "Lcom/medium/android/graphql/fragment/PostFooterCountData;", "getPostFooterCountData", "Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;", "getPostFeaturingStatusData", "Lcom/medium/android/graphql/fragment/PostPromotionBannerData;", "getPostPromotionBannerData", "Lcom/medium/android/graphql/fragment/PostRepostStateData;", "getPostRepostStateData", "Lcom/medium/android/graphql/fragment/PostRepostCountData;", "getPostRepostCountData", "Tag", "Content", "BodyModel", "ShareKeyCreator", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FullPostData implements g15 {
    private final String __typename;
    private final Content content;
    private final String id;
    private final LinkMetadataList linkMetadataList;
    private final PostFeaturingStatusData postFeaturingStatusData;
    private final PostFooterCountData postFooterCountData;
    private final PostMetaData postMetaData;
    private final PostPromotionBannerData postPromotionBannerData;
    private final PostRepostCountData postRepostCountData;
    private final PostRepostStateData postRepostStateData;
    private final List<Tag> tags;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;", "", "__typename", "", "postBodyData", "Lcom/medium/android/graphql/fragment/PostBodyData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostBodyData;)V", "get__typename", "()Ljava/lang/String;", "getPostBodyData", "()Lcom/medium/android/graphql/fragment/PostBodyData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BodyModel {
        private final String __typename;
        private final PostBodyData postBodyData;

        public BodyModel(String str, PostBodyData postBodyData) {
            str.getClass();
            postBodyData.getClass();
            this.__typename = str;
            this.postBodyData = postBodyData;
        }

        public static /* synthetic */ BodyModel copy$default(BodyModel bodyModel, String str, PostBodyData postBodyData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = bodyModel.__typename;
            }
            if ((i & 2) != 0) {
                postBodyData = bodyModel.postBodyData;
            }
            return bodyModel.copy(str, postBodyData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostBodyData getPostBodyData() {
            return this.postBodyData;
        }

        public final BodyModel copy(String __typename, PostBodyData postBodyData) {
            __typename.getClass();
            postBodyData.getClass();
            return new BodyModel(__typename, postBodyData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BodyModel)) {
                return false;
            }
            BodyModel bodyModel = (BodyModel) other;
            return g76.L(this.__typename, bodyModel.__typename) && g76.L(this.postBodyData, bodyModel.postBodyData);
        }

        public final PostBodyData getPostBodyData() {
            return this.postBodyData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postBodyData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "BodyModel(__typename=" + this.__typename + ", postBodyData=" + this.postBodyData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0007HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\nHÆ\u0003J?\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\nHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u00072\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000eR\u0013\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostData$Content;", "", "__typename", "", "bodyModel", "Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;", "isLockedPreviewOnly", "", "validatedShareKey", "shareKeyCreator", "Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;ZLjava/lang/String;Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;)V", "get__typename", "()Ljava/lang/String;", "getBodyModel", "()Lcom/medium/android/graphql/fragment/FullPostData$BodyModel;", "()Z", "getValidatedShareKey", "getShareKeyCreator", "()Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Content {
        private final String __typename;
        private final BodyModel bodyModel;
        private final boolean isLockedPreviewOnly;
        private final ShareKeyCreator shareKeyCreator;
        private final String validatedShareKey;

        public Content(String str, BodyModel bodyModel, boolean z, String str2, ShareKeyCreator shareKeyCreator) {
            str.getClass();
            bodyModel.getClass();
            this.__typename = str;
            this.bodyModel = bodyModel;
            this.isLockedPreviewOnly = z;
            this.validatedShareKey = str2;
            this.shareKeyCreator = shareKeyCreator;
        }

        public static /* synthetic */ Content copy$default(Content content, String str, BodyModel bodyModel, boolean z, String str2, ShareKeyCreator shareKeyCreator, int i, Object obj) {
            if ((i & 1) != 0) {
                str = content.__typename;
            }
            if ((i & 2) != 0) {
                bodyModel = content.bodyModel;
            }
            if ((i & 4) != 0) {
                z = content.isLockedPreviewOnly;
            }
            if ((i & 8) != 0) {
                str2 = content.validatedShareKey;
            }
            if ((i & 16) != 0) {
                shareKeyCreator = content.shareKeyCreator;
            }
            ShareKeyCreator shareKeyCreator2 = shareKeyCreator;
            boolean z2 = z;
            return content.copy(str, bodyModel, z2, str2, shareKeyCreator2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final BodyModel getBodyModel() {
            return this.bodyModel;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final boolean getIsLockedPreviewOnly() {
            return this.isLockedPreviewOnly;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getValidatedShareKey() {
            return this.validatedShareKey;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final ShareKeyCreator getShareKeyCreator() {
            return this.shareKeyCreator;
        }

        public final Content copy(String __typename, BodyModel bodyModel, boolean isLockedPreviewOnly, String validatedShareKey, ShareKeyCreator shareKeyCreator) {
            __typename.getClass();
            bodyModel.getClass();
            return new Content(__typename, bodyModel, isLockedPreviewOnly, validatedShareKey, shareKeyCreator);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Content)) {
                return false;
            }
            Content content = (Content) other;
            return g76.L(this.__typename, content.__typename) && g76.L(this.bodyModel, content.bodyModel) && this.isLockedPreviewOnly == content.isLockedPreviewOnly && g76.L(this.validatedShareKey, content.validatedShareKey) && g76.L(this.shareKeyCreator, content.shareKeyCreator);
        }

        public final BodyModel getBodyModel() {
            return this.bodyModel;
        }

        public final ShareKeyCreator getShareKeyCreator() {
            return this.shareKeyCreator;
        }

        public final String getValidatedShareKey() {
            return this.validatedShareKey;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = (((this.bodyModel.hashCode() + (this.__typename.hashCode() * 31)) * 31) + (this.isLockedPreviewOnly ? 1231 : 1237)) * 31;
            String str = this.validatedShareKey;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            ShareKeyCreator shareKeyCreator = this.shareKeyCreator;
            return iHashCode2 + (shareKeyCreator != null ? shareKeyCreator.hashCode() : 0);
        }

        public final boolean isLockedPreviewOnly() {
            return this.isLockedPreviewOnly;
        }

        public final String toString() {
            return "Content(__typename=" + this.__typename + ", bodyModel=" + this.bodyModel + ", isLockedPreviewOnly=" + this.isLockedPreviewOnly + ", validatedShareKey=" + this.validatedShareKey + ", shareKeyCreator=" + this.shareKeyCreator + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\bHÆ\u0003J?\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostData$ShareKeyCreator;", "", "__typename", "", "id", "name", "username", "viewerEdge", "Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getUsername", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ShareKeyCreator {
        private final String __typename;
        private final String id;
        private final String name;
        private final String username;
        private final ViewerEdge viewerEdge;

        public ShareKeyCreator(String str, String str2, String str3, String str4, ViewerEdge viewerEdge) {
            str.getClass();
            str2.getClass();
            viewerEdge.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.username = str4;
            this.viewerEdge = viewerEdge;
        }

        public static /* synthetic */ ShareKeyCreator copy$default(ShareKeyCreator shareKeyCreator, String str, String str2, String str3, String str4, ViewerEdge viewerEdge, int i, Object obj) {
            if ((i & 1) != 0) {
                str = shareKeyCreator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = shareKeyCreator.id;
            }
            if ((i & 4) != 0) {
                str3 = shareKeyCreator.name;
            }
            if ((i & 8) != 0) {
                str4 = shareKeyCreator.username;
            }
            if ((i & 16) != 0) {
                viewerEdge = shareKeyCreator.viewerEdge;
            }
            ViewerEdge viewerEdge2 = viewerEdge;
            String str5 = str3;
            return shareKeyCreator.copy(str, str2, str5, str4, viewerEdge2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getUsername() {
            return this.username;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final ShareKeyCreator copy(String __typename, String id, String name, String username, ViewerEdge viewerEdge) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            return new ShareKeyCreator(__typename, id, name, username, viewerEdge);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ShareKeyCreator)) {
                return false;
            }
            ShareKeyCreator shareKeyCreator = (ShareKeyCreator) other;
            return g76.L(this.__typename, shareKeyCreator.__typename) && g76.L(this.id, shareKeyCreator.id) && g76.L(this.name, shareKeyCreator.name) && g76.L(this.username, shareKeyCreator.username) && g76.L(this.viewerEdge, shareKeyCreator.viewerEdge);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String getUsername() {
            return this.username;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.username;
            return this.viewerEdge.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.username;
            ViewerEdge viewerEdge = this.viewerEdge;
            StringBuilder sbU = y30.u("ShareKeyCreator(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", username=", str4, ", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostData$Tag;", "", "__typename", "", "normalizedTagSlug", "tagNoViewerEdgeData", "Lcom/medium/android/graphql/fragment/TagNoViewerEdgeData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagNoViewerEdgeData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagNoViewerEdgeData", "()Lcom/medium/android/graphql/fragment/TagNoViewerEdgeData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Tag {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagNoViewerEdgeData tagNoViewerEdgeData;

        public Tag(String str, String str2, TagNoViewerEdgeData tagNoViewerEdgeData) {
            str.getClass();
            str2.getClass();
            tagNoViewerEdgeData.getClass();
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagNoViewerEdgeData = tagNoViewerEdgeData;
        }

        public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, TagNoViewerEdgeData tagNoViewerEdgeData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tag.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagNoViewerEdgeData = tag.tagNoViewerEdgeData;
            }
            return tag.copy(str, str2, tagNoViewerEdgeData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final TagNoViewerEdgeData getTagNoViewerEdgeData() {
            return this.tagNoViewerEdgeData;
        }

        public final Tag copy(String __typename, String normalizedTagSlug, TagNoViewerEdgeData tagNoViewerEdgeData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagNoViewerEdgeData.getClass();
            return new Tag(__typename, normalizedTagSlug, tagNoViewerEdgeData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) other;
            return g76.L(this.__typename, tag.__typename) && g76.L(this.normalizedTagSlug, tag.normalizedTagSlug) && g76.L(this.tagNoViewerEdgeData, tag.tagNoViewerEdgeData);
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final TagNoViewerEdgeData getTagNoViewerEdgeData() {
            return this.tagNoViewerEdgeData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.tagNoViewerEdgeData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.normalizedTagSlug);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.normalizedTagSlug;
            TagNoViewerEdgeData tagNoViewerEdgeData = this.tagNoViewerEdgeData;
            StringBuilder sbU = y30.u("Tag(__typename=", str, ", normalizedTagSlug=", str2, ", tagNoViewerEdgeData=");
            sbU.append(tagNoViewerEdgeData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0006HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00062\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostData$ViewerEdge;", "", "__typename", "", "id", "isUser", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getId", "()Z", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isUser;

        public ViewerEdge(String str, String str2, boolean z) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.isUser = z;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                z = viewerEdge.isUser;
            }
            return viewerEdge.copy(str, str2, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final boolean getIsUser() {
            return this.isUser;
        }

        public final ViewerEdge copy(String __typename, String id, boolean isUser) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, isUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && this.isUser == viewerEdge.isUser;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return wgd.o(this.__typename.hashCode() * 31, 31, this.id) + (this.isUser ? 1231 : 1237);
        }

        public final boolean isUser() {
            return this.isUser;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return lv8.t(y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", isUser="), this.isUser, ")");
        }
    }

    public FullPostData(String str, List<Tag> list, Content content, String str2, PostMetaData postMetaData, LinkMetadataList linkMetadataList, PostFooterCountData postFooterCountData, PostFeaturingStatusData postFeaturingStatusData, PostPromotionBannerData postPromotionBannerData, PostRepostStateData postRepostStateData, PostRepostCountData postRepostCountData) {
        str.getClass();
        content.getClass();
        str2.getClass();
        postMetaData.getClass();
        linkMetadataList.getClass();
        postFooterCountData.getClass();
        postFeaturingStatusData.getClass();
        postPromotionBannerData.getClass();
        postRepostStateData.getClass();
        postRepostCountData.getClass();
        this.__typename = str;
        this.tags = list;
        this.content = content;
        this.id = str2;
        this.postMetaData = postMetaData;
        this.linkMetadataList = linkMetadataList;
        this.postFooterCountData = postFooterCountData;
        this.postFeaturingStatusData = postFeaturingStatusData;
        this.postPromotionBannerData = postPromotionBannerData;
        this.postRepostStateData = postRepostStateData;
        this.postRepostCountData = postRepostCountData;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ FullPostData copy$default(FullPostData fullPostData, String str, List list, Content content, String str2, PostMetaData postMetaData, LinkMetadataList linkMetadataList, PostFooterCountData postFooterCountData, PostFeaturingStatusData postFeaturingStatusData, PostPromotionBannerData postPromotionBannerData, PostRepostStateData postRepostStateData, PostRepostCountData postRepostCountData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = fullPostData.__typename;
        }
        if ((i & 2) != 0) {
            list = fullPostData.tags;
        }
        if ((i & 4) != 0) {
            content = fullPostData.content;
        }
        if ((i & 8) != 0) {
            str2 = fullPostData.id;
        }
        if ((i & 16) != 0) {
            postMetaData = fullPostData.postMetaData;
        }
        if ((i & 32) != 0) {
            linkMetadataList = fullPostData.linkMetadataList;
        }
        if ((i & 64) != 0) {
            postFooterCountData = fullPostData.postFooterCountData;
        }
        if ((i & 128) != 0) {
            postFeaturingStatusData = fullPostData.postFeaturingStatusData;
        }
        if ((i & 256) != 0) {
            postPromotionBannerData = fullPostData.postPromotionBannerData;
        }
        if ((i & 512) != 0) {
            postRepostStateData = fullPostData.postRepostStateData;
        }
        if ((i & 1024) != 0) {
            postRepostCountData = fullPostData.postRepostCountData;
        }
        PostRepostStateData postRepostStateData2 = postRepostStateData;
        PostRepostCountData postRepostCountData2 = postRepostCountData;
        PostFeaturingStatusData postFeaturingStatusData2 = postFeaturingStatusData;
        PostPromotionBannerData postPromotionBannerData2 = postPromotionBannerData;
        LinkMetadataList linkMetadataList2 = linkMetadataList;
        PostFooterCountData postFooterCountData2 = postFooterCountData;
        PostMetaData postMetaData2 = postMetaData;
        Content content2 = content;
        return fullPostData.copy(str, list, content2, str2, postMetaData2, linkMetadataList2, postFooterCountData2, postFeaturingStatusData2, postPromotionBannerData2, postRepostStateData2, postRepostCountData2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final PostRepostStateData getPostRepostStateData() {
        return this.postRepostStateData;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final PostRepostCountData getPostRepostCountData() {
        return this.postRepostCountData;
    }

    public final List<Tag> component2() {
        return this.tags;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final Content getContent() {
        return this.content;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final PostMetaData getPostMetaData() {
        return this.postMetaData;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final LinkMetadataList getLinkMetadataList() {
        return this.linkMetadataList;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final PostFooterCountData getPostFooterCountData() {
        return this.postFooterCountData;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final PostFeaturingStatusData getPostFeaturingStatusData() {
        return this.postFeaturingStatusData;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final PostPromotionBannerData getPostPromotionBannerData() {
        return this.postPromotionBannerData;
    }

    public final FullPostData copy(String __typename, List<Tag> tags, Content content, String id, PostMetaData postMetaData, LinkMetadataList linkMetadataList, PostFooterCountData postFooterCountData, PostFeaturingStatusData postFeaturingStatusData, PostPromotionBannerData postPromotionBannerData, PostRepostStateData postRepostStateData, PostRepostCountData postRepostCountData) {
        __typename.getClass();
        content.getClass();
        id.getClass();
        postMetaData.getClass();
        linkMetadataList.getClass();
        postFooterCountData.getClass();
        postFeaturingStatusData.getClass();
        postPromotionBannerData.getClass();
        postRepostStateData.getClass();
        postRepostCountData.getClass();
        return new FullPostData(__typename, tags, content, id, postMetaData, linkMetadataList, postFooterCountData, postFeaturingStatusData, postPromotionBannerData, postRepostStateData, postRepostCountData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof FullPostData)) {
            return false;
        }
        FullPostData fullPostData = (FullPostData) other;
        return g76.L(this.__typename, fullPostData.__typename) && g76.L(this.tags, fullPostData.tags) && g76.L(this.content, fullPostData.content) && g76.L(this.id, fullPostData.id) && g76.L(this.postMetaData, fullPostData.postMetaData) && g76.L(this.linkMetadataList, fullPostData.linkMetadataList) && g76.L(this.postFooterCountData, fullPostData.postFooterCountData) && g76.L(this.postFeaturingStatusData, fullPostData.postFeaturingStatusData) && g76.L(this.postPromotionBannerData, fullPostData.postPromotionBannerData) && g76.L(this.postRepostStateData, fullPostData.postRepostStateData) && g76.L(this.postRepostCountData, fullPostData.postRepostCountData);
    }

    public final Content getContent() {
        return this.content;
    }

    public final String getId() {
        return this.id;
    }

    public final LinkMetadataList getLinkMetadataList() {
        return this.linkMetadataList;
    }

    public final PostFeaturingStatusData getPostFeaturingStatusData() {
        return this.postFeaturingStatusData;
    }

    public final PostFooterCountData getPostFooterCountData() {
        return this.postFooterCountData;
    }

    public final PostMetaData getPostMetaData() {
        return this.postMetaData;
    }

    public final PostPromotionBannerData getPostPromotionBannerData() {
        return this.postPromotionBannerData;
    }

    public final PostRepostCountData getPostRepostCountData() {
        return this.postRepostCountData;
    }

    public final PostRepostStateData getPostRepostStateData() {
        return this.postRepostStateData;
    }

    public final List<Tag> getTags() {
        return this.tags;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        List<Tag> list = this.tags;
        return this.postRepostCountData.hashCode() + ((this.postRepostStateData.hashCode() + ((this.postPromotionBannerData.hashCode() + ((this.postFeaturingStatusData.hashCode() + ((this.postFooterCountData.hashCode() + ((this.linkMetadataList.hashCode() + ((this.postMetaData.hashCode() + wgd.o((this.content.hashCode() + ((iHashCode + (list == null ? 0 : list.hashCode())) * 31)) * 31, 31, this.id)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        List<Tag> list = this.tags;
        Content content = this.content;
        String str2 = this.id;
        PostMetaData postMetaData = this.postMetaData;
        LinkMetadataList linkMetadataList = this.linkMetadataList;
        PostFooterCountData postFooterCountData = this.postFooterCountData;
        PostFeaturingStatusData postFeaturingStatusData = this.postFeaturingStatusData;
        PostPromotionBannerData postPromotionBannerData = this.postPromotionBannerData;
        PostRepostStateData postRepostStateData = this.postRepostStateData;
        PostRepostCountData postRepostCountData = this.postRepostCountData;
        StringBuilder sbE = b09.E("FullPostData(__typename=", str, ", tags=", ", content=", list);
        sbE.append(content);
        sbE.append(", id=");
        sbE.append(str2);
        sbE.append(", postMetaData=");
        sbE.append(postMetaData);
        sbE.append(", linkMetadataList=");
        sbE.append(linkMetadataList);
        sbE.append(", postFooterCountData=");
        sbE.append(postFooterCountData);
        sbE.append(", postFeaturingStatusData=");
        sbE.append(postFeaturingStatusData);
        sbE.append(", postPromotionBannerData=");
        sbE.append(postPromotionBannerData);
        sbE.append(", postRepostStateData=");
        sbE.append(postRepostStateData);
        sbE.append(", postRepostCountData=");
        sbE.append(postRepostCountData);
        sbE.append(")");
        return sbE.toString();
    }
}
