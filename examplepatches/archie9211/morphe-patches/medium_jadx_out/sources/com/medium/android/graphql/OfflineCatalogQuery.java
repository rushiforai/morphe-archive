package com.medium.android.graphql;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.adapter.OfflineCatalogQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.OfflineCatalogQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.OfflineCatalogResult;
import com.medium.android.graphql.selections.OfflineCatalogQuerySelections;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003./-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00060"}, d2 = {"Lcom/medium/android/graphql/OfflineCatalogQuery;", "Luqa;", "Lcom/medium/android/graphql/OfflineCatalogQuery$Data;", "", "catalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptions", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)Lcom/medium/android/graphql/OfflineCatalogQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptions", "Companion", "Data", "CatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class OfflineCatalogQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "177b26f72521e97355e938f2c2be06cc065ddd81e5c9a4bc4fc793b0dbdd1a88";
    public static final String OPERATION_NAME = "OfflineCatalogQuery";
    private final String catalogId;
    private final CatalogPagingOptionsInput pagingOptions;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OfflineCatalogQuery$CatalogById;", "", "__typename", "", "offlineCatalogResult", "Lcom/medium/android/graphql/fragment/OfflineCatalogResult;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/OfflineCatalogResult;)V", "get__typename", "()Ljava/lang/String;", "getOfflineCatalogResult", "()Lcom/medium/android/graphql/fragment/OfflineCatalogResult;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogById {
        private final String __typename;
        private final OfflineCatalogResult offlineCatalogResult;

        public CatalogById(String str, OfflineCatalogResult offlineCatalogResult) {
            str.getClass();
            offlineCatalogResult.getClass();
            this.__typename = str;
            this.offlineCatalogResult = offlineCatalogResult;
        }

        public static /* synthetic */ CatalogById copy$default(CatalogById catalogById, String str, OfflineCatalogResult offlineCatalogResult, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogById.__typename;
            }
            if ((i & 2) != 0) {
                offlineCatalogResult = catalogById.offlineCatalogResult;
            }
            return catalogById.copy(str, offlineCatalogResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OfflineCatalogResult getOfflineCatalogResult() {
            return this.offlineCatalogResult;
        }

        public final CatalogById copy(String __typename, OfflineCatalogResult offlineCatalogResult) {
            __typename.getClass();
            offlineCatalogResult.getClass();
            return new CatalogById(__typename, offlineCatalogResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogById)) {
                return false;
            }
            CatalogById catalogById = (CatalogById) other;
            return g76.L(this.__typename, catalogById.__typename) && g76.L(this.offlineCatalogResult, catalogById.offlineCatalogResult);
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
            return "CatalogById(__typename=" + this.__typename + ", offlineCatalogResult=" + this.offlineCatalogResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/OfflineCatalogQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/OfflineCatalogQuery$CatalogById;", "catalogById", "<init>", "(Lcom/medium/android/graphql/OfflineCatalogQuery$CatalogById;)V", "component1", "()Lcom/medium/android/graphql/OfflineCatalogQuery$CatalogById;", "copy", "(Lcom/medium/android/graphql/OfflineCatalogQuery$CatalogById;)Lcom/medium/android/graphql/OfflineCatalogQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/OfflineCatalogQuery$CatalogById;", "getCatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final CatalogById catalogById;

        public Data(CatalogById catalogById) {
            catalogById.getClass();
            this.catalogById = catalogById;
        }

        public static /* synthetic */ Data copy$default(Data data, CatalogById catalogById, int i, Object obj) {
            if ((i & 1) != 0) {
                catalogById = data.catalogById;
            }
            return data.copy(catalogById);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final CatalogById getCatalogById() {
            return this.catalogById;
        }

        public final Data copy(CatalogById catalogById) {
            catalogById.getClass();
            return new Data(catalogById);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.catalogById, ((Data) other).catalogById);
        }

        public final CatalogById getCatalogById() {
            return this.catalogById;
        }

        public final int hashCode() {
            return this.catalogById.hashCode();
        }

        public final String toString() {
            return "Data(catalogById=" + this.catalogById + ")";
        }
    }

    public OfflineCatalogQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput) {
        str.getClass();
        catalogPagingOptionsInput.getClass();
        this.catalogId = str;
        this.pagingOptions = catalogPagingOptionsInput;
    }

    public static /* synthetic */ OfflineCatalogQuery copy$default(OfflineCatalogQuery offlineCatalogQuery, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = offlineCatalogQuery.catalogId;
        }
        if ((i & 2) != 0) {
            catalogPagingOptionsInput = offlineCatalogQuery.pagingOptions;
        }
        return offlineCatalogQuery.copy(str, catalogPagingOptionsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(OfflineCatalogQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final OfflineCatalogQuery copy(String catalogId, CatalogPagingOptionsInput pagingOptions) {
        catalogId.getClass();
        pagingOptions.getClass();
        return new OfflineCatalogQuery(catalogId, pagingOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query OfflineCatalogQuery($catalogId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ...OfflineCatalogResult } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CatalogDetailData on Catalog { __typename ...CatalogSummaryData ...CatalogClapsData id description disallowResponses itemsLastInsertedAt responsesCount viewerEdge { __typename followersCount id } creator { __typename bio membership { __typename ...membershipFragment } id } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }  fragment OfflineCatalogResult on CatalogResult { __typename ...CatalogSummaryData ...CatalogDetailData ... on Catalog { itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } paging { __typename count } } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof OfflineCatalogQuery)) {
            return false;
        }
        OfflineCatalogQuery offlineCatalogQuery = (OfflineCatalogQuery) other;
        return g76.L(this.catalogId, offlineCatalogQuery.catalogId) && g76.L(this.pagingOptions, offlineCatalogQuery.pagingOptions);
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final int hashCode() {
        return this.pagingOptions.hashCode() + (this.catalogId.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = OfflineCatalogQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        OfflineCatalogQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "OfflineCatalogQuery(catalogId=" + this.catalogId + ", pagingOptions=" + this.pagingOptions + ")";
    }

    @Override // defpackage.hv8
    public final String id() {
        return ZVsviyDAr.LvunZNelfGypsUG;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/OfflineCatalogQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query OfflineCatalogQuery($catalogId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ...OfflineCatalogResult } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CatalogDetailData on Catalog { __typename ...CatalogSummaryData ...CatalogClapsData id description disallowResponses itemsLastInsertedAt responsesCount viewerEdge { __typename followersCount id } creator { __typename bio membership { __typename ...membershipFragment } id } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }  fragment OfflineCatalogResult on CatalogResult { __typename ...CatalogSummaryData ...CatalogDetailData ... on Catalog { itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } paging { __typename count } } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
