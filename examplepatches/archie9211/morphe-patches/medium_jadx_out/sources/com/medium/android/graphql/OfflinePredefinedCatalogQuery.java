package com.medium.android.graphql;

import com.medium.android.graphql.adapter.OfflinePredefinedCatalogQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.OfflinePredefinedCatalogQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.OfflineCatalogResult;
import com.medium.android.graphql.selections.OfflinePredefinedCatalogQuerySelections;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.PredefinedCatalogType;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 32\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003453B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b \u0010\fJ\u0010\u0010!\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b!\u0010\"J.\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b%\u0010\fJ\u0010\u0010'\u001a\u00020&HÖ\u0001¢\u0006\u0004\b'\u0010(J\u001a\u0010+\u001a\u00020\u00132\b\u0010*\u001a\u0004\u0018\u00010)HÖ\u0003¢\u0006\u0004\b+\u0010,R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010-\u001a\u0004\b.\u0010\u001fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010/\u001a\u0004\b0\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00101\u001a\u0004\b2\u0010\"¨\u00066"}, d2 = {"Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery;", "Luqa;", "Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$Data;", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "type", "", "userId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptions", "<init>", "(Lcom/medium/android/graphql/type/PredefinedCatalogType;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "component2", "component3", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "copy", "(Lcom/medium/android/graphql/type/PredefinedCatalogType;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getType", "Ljava/lang/String;", "getUserId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptions", "Companion", "Data", "GetPredefinedCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class OfflinePredefinedCatalogQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "773a01caea956df5c7a6ca8449cd5256ae7addf90d46abdc91833dd0651af885";
    public static final String OPERATION_NAME = "OfflinePredefinedCatalog";
    private final CatalogPagingOptionsInput pagingOptions;
    private final PredefinedCatalogType type;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$GetPredefinedCatalog;", "getPredefinedCatalog", "<init>", "(Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$GetPredefinedCatalog;)V", "component1", "()Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$GetPredefinedCatalog;", "copy", "(Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$GetPredefinedCatalog;)Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$GetPredefinedCatalog;", "getGetPredefinedCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final GetPredefinedCatalog getPredefinedCatalog;

        public Data(GetPredefinedCatalog getPredefinedCatalog) {
            getPredefinedCatalog.getClass();
            this.getPredefinedCatalog = getPredefinedCatalog;
        }

        public static /* synthetic */ Data copy$default(Data data, GetPredefinedCatalog getPredefinedCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                getPredefinedCatalog = data.getPredefinedCatalog;
            }
            return data.copy(getPredefinedCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final GetPredefinedCatalog getGetPredefinedCatalog() {
            return this.getPredefinedCatalog;
        }

        public final Data copy(GetPredefinedCatalog getPredefinedCatalog) {
            getPredefinedCatalog.getClass();
            return new Data(getPredefinedCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.getPredefinedCatalog, ((Data) other).getPredefinedCatalog);
        }

        public final GetPredefinedCatalog getGetPredefinedCatalog() {
            return this.getPredefinedCatalog;
        }

        public final int hashCode() {
            return this.getPredefinedCatalog.hashCode();
        }

        public final String toString() {
            return "Data(getPredefinedCatalog=" + this.getPredefinedCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$GetPredefinedCatalog;", "", "__typename", "", "offlineCatalogResult", "Lcom/medium/android/graphql/fragment/OfflineCatalogResult;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/OfflineCatalogResult;)V", "get__typename", "()Ljava/lang/String;", "getOfflineCatalogResult", "()Lcom/medium/android/graphql/fragment/OfflineCatalogResult;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class GetPredefinedCatalog {
        private final String __typename;
        private final OfflineCatalogResult offlineCatalogResult;

        public GetPredefinedCatalog(String str, OfflineCatalogResult offlineCatalogResult) {
            str.getClass();
            offlineCatalogResult.getClass();
            this.__typename = str;
            this.offlineCatalogResult = offlineCatalogResult;
        }

        public static /* synthetic */ GetPredefinedCatalog copy$default(GetPredefinedCatalog getPredefinedCatalog, String str, OfflineCatalogResult offlineCatalogResult, int i, Object obj) {
            if ((i & 1) != 0) {
                str = getPredefinedCatalog.__typename;
            }
            if ((i & 2) != 0) {
                offlineCatalogResult = getPredefinedCatalog.offlineCatalogResult;
            }
            return getPredefinedCatalog.copy(str, offlineCatalogResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OfflineCatalogResult getOfflineCatalogResult() {
            return this.offlineCatalogResult;
        }

        public final GetPredefinedCatalog copy(String __typename, OfflineCatalogResult offlineCatalogResult) {
            __typename.getClass();
            offlineCatalogResult.getClass();
            return new GetPredefinedCatalog(__typename, offlineCatalogResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof GetPredefinedCatalog)) {
                return false;
            }
            GetPredefinedCatalog getPredefinedCatalog = (GetPredefinedCatalog) other;
            return g76.L(this.__typename, getPredefinedCatalog.__typename) && g76.L(this.offlineCatalogResult, getPredefinedCatalog.offlineCatalogResult);
        }

        public final OfflineCatalogResult getOfflineCatalogResult() {
            return this.offlineCatalogResult;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.offlineCatalogResult.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "GetPredefinedCatalog(__typename=" + this.__typename + ", offlineCatalogResult=" + this.offlineCatalogResult + ")";
        }
    }

    public OfflinePredefinedCatalogQuery(PredefinedCatalogType predefinedCatalogType, String str, CatalogPagingOptionsInput catalogPagingOptionsInput) {
        predefinedCatalogType.getClass();
        str.getClass();
        catalogPagingOptionsInput.getClass();
        this.type = predefinedCatalogType;
        this.userId = str;
        this.pagingOptions = catalogPagingOptionsInput;
    }

    public static /* synthetic */ OfflinePredefinedCatalogQuery copy$default(OfflinePredefinedCatalogQuery offlinePredefinedCatalogQuery, PredefinedCatalogType predefinedCatalogType, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            predefinedCatalogType = offlinePredefinedCatalogQuery.type;
        }
        if ((i & 2) != 0) {
            str = offlinePredefinedCatalogQuery.userId;
        }
        if ((i & 4) != 0) {
            catalogPagingOptionsInput = offlinePredefinedCatalogQuery.pagingOptions;
        }
        return offlinePredefinedCatalogQuery.copy(predefinedCatalogType, str, catalogPagingOptionsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(OfflinePredefinedCatalogQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PredefinedCatalogType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final OfflinePredefinedCatalogQuery copy(PredefinedCatalogType type, String userId, CatalogPagingOptionsInput pagingOptions) {
        type.getClass();
        userId.getClass();
        pagingOptions.getClass();
        return new OfflinePredefinedCatalogQuery(type, userId, pagingOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query OfflinePredefinedCatalog($type: PredefinedCatalogType!, $userId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { getPredefinedCatalog(type: $type, userId: $userId) { __typename ...OfflineCatalogResult } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CatalogDetailData on Catalog { __typename ...CatalogSummaryData ...CatalogClapsData id description disallowResponses itemsLastInsertedAt responsesCount viewerEdge { __typename followersCount id } creator { __typename bio membership { __typename ...membershipFragment } id } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }  fragment OfflineCatalogResult on CatalogResult { __typename ...CatalogSummaryData ...CatalogDetailData ... on Catalog { itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } paging { __typename count } } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof OfflinePredefinedCatalogQuery)) {
            return false;
        }
        OfflinePredefinedCatalogQuery offlinePredefinedCatalogQuery = (OfflinePredefinedCatalogQuery) other;
        return this.type == offlinePredefinedCatalogQuery.type && g76.L(this.userId, offlinePredefinedCatalogQuery.userId) && g76.L(this.pagingOptions, offlinePredefinedCatalogQuery.pagingOptions);
    }

    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final PredefinedCatalogType getType() {
        return this.type;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.pagingOptions.hashCode() + wgd.o(this.type.hashCode() * 31, 31, this.userId);
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
        List<sx1> list = OfflinePredefinedCatalogQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        OfflinePredefinedCatalogQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "OfflinePredefinedCatalogQuery(type=" + this.type + ", userId=" + this.userId + ", pagingOptions=" + this.pagingOptions + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/OfflinePredefinedCatalogQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query OfflinePredefinedCatalog($type: PredefinedCatalogType!, $userId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { getPredefinedCatalog(type: $type, userId: $userId) { __typename ...OfflineCatalogResult } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CatalogDetailData on Catalog { __typename ...CatalogSummaryData ...CatalogClapsData id description disallowResponses itemsLastInsertedAt responsesCount viewerEdge { __typename followersCount id } creator { __typename bio membership { __typename ...membershipFragment } id } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }  fragment OfflineCatalogResult on CatalogResult { __typename ...CatalogSummaryData ...CatalogDetailData ... on Catalog { itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } paging { __typename count } } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
