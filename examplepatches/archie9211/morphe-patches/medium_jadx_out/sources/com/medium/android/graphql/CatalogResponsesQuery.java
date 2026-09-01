package com.medium.android.graphql;

import com.medium.android.graphql.adapter.CatalogResponsesQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.CatalogResponsesQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogResponses;
import com.medium.android.graphql.selections.CatalogResponsesQuerySelections;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.ResponseSortType;
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
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 92\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003:;9B5\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0006\u0010\t\u001a\u00020\b\u0012\n\u0010\f\u001a\u00060\nj\u0002`\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0011\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0012\u0010\u0010J'\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0015\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010 \u001a\u00020\u001fH\u0016¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\"\u0010\u0010J\u0018\u0010#\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0014\u0010'\u001a\u00060\nj\u0002`\u000bHÆ\u0003¢\u0006\u0004\b'\u0010(JD\u0010)\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00052\b\b\u0002\u0010\t\u001a\u00020\b2\f\b\u0002\u0010\f\u001a\u00060\nj\u0002`\u000bHÆ\u0001¢\u0006\u0004\b)\u0010*J\u0010\u0010+\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b+\u0010\u0010J\u0010\u0010,\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b,\u0010(J\u001a\u0010/\u001a\u00020\u00172\b\u0010.\u001a\u0004\u0018\u00010-HÖ\u0003¢\u0006\u0004\b/\u00100R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00101\u001a\u0004\b2\u0010\u0010R\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u00103\u001a\u0004\b4\u0010$R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00105\u001a\u0004\b6\u0010&R\u001b\u0010\f\u001a\u00060\nj\u0002`\u000b8\u0006¢\u0006\f\n\u0004\b\f\u00107\u001a\u0004\b8\u0010(¨\u0006<"}, d2 = {"Lcom/medium/android/graphql/CatalogResponsesQuery;", "Luqa;", "Lcom/medium/android/graphql/CatalogResponsesQuery$Data;", "", "catalogId", "Lzv8;", "Lcom/medium/android/graphql/type/PagingOptions;", "paging", "Lcom/medium/android/graphql/type/ResponseSortType;", "sortType", "", "Lcom/medium/android/graphql/PaginationLimit;", "threadedPostsLimit", "<init>", "(Ljava/lang/String;Lzv8;Lcom/medium/android/graphql/type/ResponseSortType;I)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "component3", "()Lcom/medium/android/graphql/type/ResponseSortType;", "component4", "()I", "copy", "(Ljava/lang/String;Lzv8;Lcom/medium/android/graphql/type/ResponseSortType;I)Lcom/medium/android/graphql/CatalogResponsesQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Lzv8;", "getPaging", "Lcom/medium/android/graphql/type/ResponseSortType;", "getSortType", "I", "getThreadedPostsLimit", "Companion", "Data", "CatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogResponsesQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "fab04f907584d4dcba492d21adc7d546a0ccdca4d2ffdea34bc788dcb4eb5cd1";
    public static final String OPERATION_NAME = "CatalogResponsesQuery";
    private final String catalogId;
    private final zv8 paging;
    private final ResponseSortType sortType;
    private final int threadedPostsLimit;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogResponsesQuery$CatalogById;", "", "__typename", "", "catalogResponses", "Lcom/medium/android/graphql/fragment/CatalogResponses;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogResponses;)V", "get__typename", "()Ljava/lang/String;", "getCatalogResponses", "()Lcom/medium/android/graphql/fragment/CatalogResponses;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogById {
        private final String __typename;
        private final CatalogResponses catalogResponses;

        public CatalogById(String str, CatalogResponses catalogResponses) {
            str.getClass();
            this.__typename = str;
            this.catalogResponses = catalogResponses;
        }

        public static /* synthetic */ CatalogById copy$default(CatalogById catalogById, String str, CatalogResponses catalogResponses, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogById.__typename;
            }
            if ((i & 2) != 0) {
                catalogResponses = catalogById.catalogResponses;
            }
            return catalogById.copy(str, catalogResponses);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogResponses getCatalogResponses() {
            return this.catalogResponses;
        }

        public final CatalogById copy(String __typename, CatalogResponses catalogResponses) {
            __typename.getClass();
            return new CatalogById(__typename, catalogResponses);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogById)) {
                return false;
            }
            CatalogById catalogById = (CatalogById) other;
            return g76.L(this.__typename, catalogById.__typename) && g76.L(this.catalogResponses, catalogById.catalogResponses);
        }

        public final CatalogResponses getCatalogResponses() {
            return this.catalogResponses;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            CatalogResponses catalogResponses = this.catalogResponses;
            return iHashCode + (catalogResponses == null ? 0 : catalogResponses.hashCode());
        }

        public final String toString() {
            return "CatalogById(__typename=" + this.__typename + ", catalogResponses=" + this.catalogResponses + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CatalogResponsesQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/CatalogResponsesQuery$CatalogById;", "catalogById", "<init>", "(Lcom/medium/android/graphql/CatalogResponsesQuery$CatalogById;)V", "component1", "()Lcom/medium/android/graphql/CatalogResponsesQuery$CatalogById;", "copy", "(Lcom/medium/android/graphql/CatalogResponsesQuery$CatalogById;)Lcom/medium/android/graphql/CatalogResponsesQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CatalogResponsesQuery$CatalogById;", "getCatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public CatalogResponsesQuery(String str, zv8 zv8Var, ResponseSortType responseSortType, int i) {
        str.getClass();
        zv8Var.getClass();
        responseSortType.getClass();
        this.catalogId = str;
        this.paging = zv8Var;
        this.sortType = responseSortType;
        this.threadedPostsLimit = i;
    }

    public static /* synthetic */ CatalogResponsesQuery copy$default(CatalogResponsesQuery catalogResponsesQuery, String str, zv8 zv8Var, ResponseSortType responseSortType, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = catalogResponsesQuery.catalogId;
        }
        if ((i2 & 2) != 0) {
            zv8Var = catalogResponsesQuery.paging;
        }
        if ((i2 & 4) != 0) {
            responseSortType = catalogResponsesQuery.sortType;
        }
        if ((i2 & 8) != 0) {
            i = catalogResponsesQuery.threadedPostsLimit;
        }
        return catalogResponsesQuery.copy(str, zv8Var, responseSortType, i);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CatalogResponsesQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPaging() {
        return this.paging;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final ResponseSortType getSortType() {
        return this.sortType;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final int getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final CatalogResponsesQuery copy(String catalogId, zv8 paging, ResponseSortType sortType, int threadedPostsLimit) {
        catalogId.getClass();
        paging.getClass();
        sortType.getClass();
        return new CatalogResponsesQuery(catalogId, paging, sortType, threadedPostsLimit);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query CatalogResponsesQuery($catalogId: ID!, $paging: PagingOptions, $sortType: ResponseSortType!, $threadedPostsLimit: PaginationLimit!) { catalogById(catalogId: $catalogId) { __typename ...CatalogResponses } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }  fragment ResponseCatalogThreadData on ThreadedCatalogResponseConnection { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData id } autoExpandedPostIds } id } autoExpandedPostIds } id } }  fragment CatalogResponses on Catalog { __typename responsesLocked disallowResponses responsesCount creator { __typename id name } threadedCatalogResponses(paging: $paging, sortType: $sortType) { __typename ...ResponseCatalogThreadData } id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogResponsesQuery)) {
            return false;
        }
        CatalogResponsesQuery catalogResponsesQuery = (CatalogResponsesQuery) other;
        return g76.L(this.catalogId, catalogResponsesQuery.catalogId) && g76.L(this.paging, catalogResponsesQuery.paging) && this.sortType == catalogResponsesQuery.sortType && this.threadedPostsLimit == catalogResponsesQuery.threadedPostsLimit;
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final zv8 getPaging() {
        return this.paging;
    }

    public final ResponseSortType getSortType() {
        return this.sortType;
    }

    public final int getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final int hashCode() {
        return ((this.sortType.hashCode() + lv8.h(this.paging, this.catalogId.hashCode() * 31, 31)) * 31) + this.threadedPostsLimit;
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
        List<sx1> list = CatalogResponsesQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CatalogResponsesQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "CatalogResponsesQuery(catalogId=" + this.catalogId + ", paging=" + this.paging + ", sortType=" + this.sortType + ", threadedPostsLimit=" + this.threadedPostsLimit + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CatalogResponsesQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query CatalogResponsesQuery($catalogId: ID!, $paging: PagingOptions, $sortType: ResponseSortType!, $threadedPostsLimit: PaginationLimit!) { catalogById(catalogId: $catalogId) { __typename ...CatalogResponses } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }  fragment ResponseCatalogThreadData on ThreadedCatalogResponseConnection { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData id } autoExpandedPostIds } id } autoExpandedPostIds } id } }  fragment CatalogResponses on Catalog { __typename responsesLocked disallowResponses responsesCount creator { __typename id name } threadedCatalogResponses(paging: $paging, sortType: $sortType) { __typename ...ResponseCatalogThreadData } id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ CatalogResponsesQuery(String str, zv8 zv8Var, ResponseSortType responseSortType, int i, int i2, gy2 gy2Var) {
        this(str, (i2 & 2) != 0 ? xv8.a : zv8Var, responseSortType, i);
    }
}
