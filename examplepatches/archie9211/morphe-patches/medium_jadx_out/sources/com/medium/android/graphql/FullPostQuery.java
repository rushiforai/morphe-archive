package com.medium.android.graphql;

import com.medium.android.graphql.adapter.FullPostQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.FullPostQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.selections.FullPostQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003/0.B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ,\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00122\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001f¨\u00061"}, d2 = {"Lcom/medium/android/graphql/FullPostQuery;", "Luqa;", "Lcom/medium/android/graphql/FullPostQuery$Data;", "", "postId", "Lzv8;", "Lcom/medium/android/graphql/type/PostMeteringOptions;", "postMeteringOptions", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/FullPostQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Lzv8;", "getPostMeteringOptions", "Companion", "Data", "Post", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FullPostQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d61fbc531b6b803efa841fc49b1ac73d77aa5208bc1a971afeccee0ae24b3337";
    public static final String OPERATION_NAME = "FullPostQuery";
    private final String postId;
    private final zv8 postMeteringOptions;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/FullPostQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/FullPostQuery$Post;", "post", "<init>", "(Lcom/medium/android/graphql/FullPostQuery$Post;)V", "component1", "()Lcom/medium/android/graphql/FullPostQuery$Post;", "copy", "(Lcom/medium/android/graphql/FullPostQuery$Post;)Lcom/medium/android/graphql/FullPostQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/FullPostQuery$Post;", "getPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Post post;

        public Data(Post post) {
            this.post = post;
        }

        public static Data copy$default(Data data, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                post = data.post;
            }
            data.getClass();
            return new Data(post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final Data copy(Post post) {
            return new Data(post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.post, ((Data) other).post);
        }

        public final Post getPost() {
            return this.post;
        }

        public final int hashCode() {
            Post post = this.post;
            if (post == null) {
                return 0;
            }
            return post.hashCode();
        }

        public final String toString() {
            return "Data(post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FullPostQuery$Post;", "", "__typename", "", "id", "fullPostData", "Lcom/medium/android/graphql/fragment/FullPostData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/FullPostData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getFullPostData", "()Lcom/medium/android/graphql/fragment/FullPostData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final FullPostData fullPostData;
        private final String id;

        public Post(String str, String str2, FullPostData fullPostData) {
            str.getClass();
            str2.getClass();
            fullPostData.getClass();
            this.__typename = str;
            this.id = str2;
            this.fullPostData = fullPostData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, FullPostData fullPostData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                fullPostData = post.fullPostData;
            }
            return post.copy(str, str2, fullPostData);
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
        public final FullPostData getFullPostData() {
            return this.fullPostData;
        }

        public final Post copy(String __typename, String id, FullPostData fullPostData) {
            __typename.getClass();
            id.getClass();
            fullPostData.getClass();
            return new Post(__typename, id, fullPostData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.fullPostData, post.fullPostData);
        }

        public final FullPostData getFullPostData() {
            return this.fullPostData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.fullPostData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            FullPostData fullPostData = this.fullPostData;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", fullPostData=");
            sbU.append(fullPostData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public FullPostQuery(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.postId = str;
        this.postMeteringOptions = zv8Var;
    }

    public static /* synthetic */ FullPostQuery copy$default(FullPostQuery fullPostQuery, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = fullPostQuery.postId;
        }
        if ((i & 2) != 0) {
            zv8Var = fullPostQuery.postMeteringOptions;
        }
        return fullPostQuery.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(FullPostQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPostMeteringOptions() {
        return this.postMeteringOptions;
    }

    public final FullPostQuery copy(String postId, zv8 postMeteringOptions) {
        postId.getClass();
        postMeteringOptions.getClass();
        return new FullPostQuery(postId, postMeteringOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query FullPostQuery($postId: ID!, $postMeteringOptions: PostMeteringOptions) { post(id: $postId) { __typename id ...FullPostData } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment InResponseToPost on Post { __typename id title creator { __typename name id } ...PostClapsData responsesCount }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment CollectionNewsletterData on Collection { __typename id newsletterV3 { __typename showPromo ...NewsletterData id } }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostMenuData on Post { __typename id title creator { __typename ...UserFollowData id } collection { __typename ...CollectionFollowData id } }  fragment PostMetaData on Post { __typename id title visibility ...PostClapsData ...ResponseCountData viewerEdge { __typename id paywall { __typename type creatorSpotlights { __typename name jobTitle: title company imageId: miroId hideOnMediumScreen: hideOnSmallScreen } } shareKey } detectedLanguage mediumUrl readingTime updatedAt isLocked allowResponses isProxyPost latestPublishedVersion firstPublishedAt previewImage { __typename ...ImageMetadataData id } inResponseToPostResult { __typename ...InResponseToPost } inResponseToMediaResource { __typename mediumQuote { __typename ...HighlightData id } id } inResponseToEntityType canonicalUrl collection { __typename id slug name shortDescription description avatar { __typename id ...ImageMetadataData } viewerEdge { __typename id isFollowing isEditor canEditPosts canEditOwnPosts isMuting } ...CollectionNewsletterData ...CollectionFollowData latestPostsConnection(paging: { limit: 1 } ) { __typename posts { __typename id latestPublishedAt } } } creator { __typename id name username bio tippingLink imageId twitterScreenName hasSubdomain viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserBlockData ...UserFollowData ...UserNewsletterData ...UserMuteData adminCollections { __typename id } } previewContent { __typename subtitle } pinnedByCreatorAt isNewsletter ...PostVisibilityData ...PostMenuData }  fragment LinkMetadataList on Post { __typename id linkMetadataList { __typename url alts { __typename type url } } }  fragment PostFooterCountData on Post { __typename id ...PostClapsData ...ResponseCountData responsesLocked mediumUrl title collection { __typename id viewerEdge { __typename id isMuting isFollowing } } creator { __typename id viewerEdge { __typename id isMuting isFollowing } } }  fragment TagNoViewerEdgeData on Tag { __typename id normalizedTagSlug displayTitle }  fragment SectionData on Section { __typename name startIndex }  fragment MediaResourceData on MediaResource { __typename id iframeSrc thumbnailUrl }  fragment IframeData on Iframe { __typename iframeHeight iframeWidth mediaResource { __typename ...MediaResourceData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment MixtapeMetadataData on MixtapeMetadata { __typename mediaResourceId href thumbnailImageId mediaResource { __typename mediumCatalog { __typename ...CatalogPreviewData id } id } }  fragment ParagraphData on Paragraph { __typename id name href text iframe { __typename ...IframeData } layout markups { __typename ...MarkupData } metadata { __typename ...ImageMetadataData id } mixtapeMetadata { __typename ...MixtapeMetadataData } type hasDropCap dropCapImage { __typename ...ImageMetadataData id } codeBlockMetadata { __typename lang mode } }  fragment PostBodyData on RichText { __typename sections { __typename ...SectionData } paragraphs { __typename id ...ParagraphData } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostPromotionBannerData on Post { __typename id viewerEdge { __typename promotionBanner(input: { platform: MOBILE } ) { __typename actionUrl altText dimension miroId { __typename large small } } id } }  fragment PostRepostStateData on Post { __typename id allowReposts viewerEdge { __typename id hasReposted repostNote } }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment FullPostData on Post { __typename ...PostMetaData ...LinkMetadataList ...PostFooterCountData tags { __typename ...TagNoViewerEdgeData normalizedTagSlug } content(postMeteringOptions: $postMeteringOptions) { __typename bodyModel { __typename ...PostBodyData } isLockedPreviewOnly validatedShareKey shareKeyCreator { __typename id name username viewerEdge { __typename id isUser } } } ...PostFeaturingStatusData ...PostPromotionBannerData ...PostRepostStateData ...PostRepostCountData id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof FullPostQuery)) {
            return false;
        }
        FullPostQuery fullPostQuery = (FullPostQuery) other;
        return g76.L(this.postId, fullPostQuery.postId) && g76.L(this.postMeteringOptions, fullPostQuery.postMeteringOptions);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final zv8 getPostMeteringOptions() {
        return this.postMeteringOptions;
    }

    public final int hashCode() {
        return this.postMeteringOptions.hashCode() + (this.postId.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = FullPostQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        FullPostQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "FullPostQuery(postId=" + this.postId + ", postMeteringOptions=" + this.postMeteringOptions + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/FullPostQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query FullPostQuery($postId: ID!, $postMeteringOptions: PostMeteringOptions) { post(id: $postId) { __typename id ...FullPostData } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment InResponseToPost on Post { __typename id title creator { __typename name id } ...PostClapsData responsesCount }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment CollectionNewsletterData on Collection { __typename id newsletterV3 { __typename showPromo ...NewsletterData id } }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostMenuData on Post { __typename id title creator { __typename ...UserFollowData id } collection { __typename ...CollectionFollowData id } }  fragment PostMetaData on Post { __typename id title visibility ...PostClapsData ...ResponseCountData viewerEdge { __typename id paywall { __typename type creatorSpotlights { __typename name jobTitle: title company imageId: miroId hideOnMediumScreen: hideOnSmallScreen } } shareKey } detectedLanguage mediumUrl readingTime updatedAt isLocked allowResponses isProxyPost latestPublishedVersion firstPublishedAt previewImage { __typename ...ImageMetadataData id } inResponseToPostResult { __typename ...InResponseToPost } inResponseToMediaResource { __typename mediumQuote { __typename ...HighlightData id } id } inResponseToEntityType canonicalUrl collection { __typename id slug name shortDescription description avatar { __typename id ...ImageMetadataData } viewerEdge { __typename id isFollowing isEditor canEditPosts canEditOwnPosts isMuting } ...CollectionNewsletterData ...CollectionFollowData latestPostsConnection(paging: { limit: 1 } ) { __typename posts { __typename id latestPublishedAt } } } creator { __typename id name username bio tippingLink imageId twitterScreenName hasSubdomain viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserBlockData ...UserFollowData ...UserNewsletterData ...UserMuteData adminCollections { __typename id } } previewContent { __typename subtitle } pinnedByCreatorAt isNewsletter ...PostVisibilityData ...PostMenuData }  fragment LinkMetadataList on Post { __typename id linkMetadataList { __typename url alts { __typename type url } } }  fragment PostFooterCountData on Post { __typename id ...PostClapsData ...ResponseCountData responsesLocked mediumUrl title collection { __typename id viewerEdge { __typename id isMuting isFollowing } } creator { __typename id viewerEdge { __typename id isMuting isFollowing } } }  fragment TagNoViewerEdgeData on Tag { __typename id normalizedTagSlug displayTitle }  fragment SectionData on Section { __typename name startIndex }  fragment MediaResourceData on MediaResource { __typename id iframeSrc thumbnailUrl }  fragment IframeData on Iframe { __typename iframeHeight iframeWidth mediaResource { __typename ...MediaResourceData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment MixtapeMetadataData on MixtapeMetadata { __typename mediaResourceId href thumbnailImageId mediaResource { __typename mediumCatalog { __typename ...CatalogPreviewData id } id } }  fragment ParagraphData on Paragraph { __typename id name href text iframe { __typename ...IframeData } layout markups { __typename ...MarkupData } metadata { __typename ...ImageMetadataData id } mixtapeMetadata { __typename ...MixtapeMetadataData } type hasDropCap dropCapImage { __typename ...ImageMetadataData id } codeBlockMetadata { __typename lang mode } }  fragment PostBodyData on RichText { __typename sections { __typename ...SectionData } paragraphs { __typename id ...ParagraphData } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostPromotionBannerData on Post { __typename id viewerEdge { __typename promotionBanner(input: { platform: MOBILE } ) { __typename actionUrl altText dimension miroId { __typename large small } } id } }  fragment PostRepostStateData on Post { __typename id allowReposts viewerEdge { __typename id hasReposted repostNote } }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment FullPostData on Post { __typename ...PostMetaData ...LinkMetadataList ...PostFooterCountData tags { __typename ...TagNoViewerEdgeData normalizedTagSlug } content(postMeteringOptions: $postMeteringOptions) { __typename bodyModel { __typename ...PostBodyData } isLockedPreviewOnly validatedShareKey shareKeyCreator { __typename id name username viewerEdge { __typename id isUser } } } ...PostFeaturingStatusData ...PostPromotionBannerData ...PostRepostStateData ...PostRepostCountData id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ FullPostQuery(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
