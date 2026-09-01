package com.medium.android.graphql;

import com.medium.android.graphql.adapter.HighlightResponsesQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.HighlightResponsesQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.HighlightResponses;
import com.medium.android.graphql.selections.HighlightResponsesQuerySelections;
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
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u0000\n\u0002\b\u0011\b\u0086\b\u0018\u0000 >2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003?@>BE\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\n\u0010\r\u001a\u00060\u0006j\u0002`\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0012\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0011J'\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0015\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010!\u001a\u00020 H\u0016¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b#\u0010\u0011J\u0010\u0010$\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b$\u0010\u0011J\u0010\u0010%\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0018\u0010'\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\bHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0010\u0010)\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b)\u0010*J\u0014\u0010+\u001a\u00060\u0006j\u0002`\fHÆ\u0003¢\u0006\u0004\b+\u0010&JX\u0010,\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00062\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\b2\b\b\u0002\u0010\u000b\u001a\u00020\n2\f\b\u0002\u0010\r\u001a\u00060\u0006j\u0002`\fHÆ\u0001¢\u0006\u0004\b,\u0010-J\u0010\u0010.\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b.\u0010\u0011J\u0010\u0010/\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b/\u0010&J\u001a\u00102\u001a\u00020\u00182\b\u00101\u001a\u0004\u0018\u000100HÖ\u0003¢\u0006\u0004\b2\u00103R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00104\u001a\u0004\b5\u0010\u0011R\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u00104\u001a\u0004\b6\u0010\u0011R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u00107\u001a\u0004\b8\u0010&R\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\b8\u0006¢\u0006\f\n\u0004\b\t\u00109\u001a\u0004\b:\u0010(R\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010;\u001a\u0004\b<\u0010*R\u001b\u0010\r\u001a\u00060\u0006j\u0002`\f8\u0006¢\u0006\f\n\u0004\b\r\u00107\u001a\u0004\b=\u0010&¨\u0006A"}, d2 = {"Lcom/medium/android/graphql/HighlightResponsesQuery;", "Luqa;", "Lcom/medium/android/graphql/HighlightResponsesQuery$Data;", "", "postId", "groupId", "", "first", "Lzv8;", "after", "Lcom/medium/android/graphql/type/ResponseSortType;", "sortType", "Lcom/medium/android/graphql/PaginationLimit;", "threadedPostsLimit", "<init>", "(Ljava/lang/String;Ljava/lang/String;ILzv8;Lcom/medium/android/graphql/type/ResponseSortType;I)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "()I", "component4", "()Lzv8;", "component5", "()Lcom/medium/android/graphql/type/ResponseSortType;", "component6", "copy", "(Ljava/lang/String;Ljava/lang/String;ILzv8;Lcom/medium/android/graphql/type/ResponseSortType;I)Lcom/medium/android/graphql/HighlightResponsesQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getGroupId", "I", "getFirst", "Lzv8;", "getAfter", "Lcom/medium/android/graphql/type/ResponseSortType;", "getSortType", "getThreadedPostsLimit", "Companion", "Data", "PostResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class HighlightResponsesQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "8a9a435ac55ddd52983bba8066edeedf34b4e5c07da091861b6804fa2b9a8f49";
    public static final String OPERATION_NAME = "HighlightResponsesQuery";
    private final zv8 after;
    private final int first;
    private final String groupId;
    private final String postId;
    private final ResponseSortType sortType;
    private final int threadedPostsLimit;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/HighlightResponsesQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/HighlightResponsesQuery$PostResult;", "postResult", "<init>", "(Lcom/medium/android/graphql/HighlightResponsesQuery$PostResult;)V", "component1", "()Lcom/medium/android/graphql/HighlightResponsesQuery$PostResult;", "copy", "(Lcom/medium/android/graphql/HighlightResponsesQuery$PostResult;)Lcom/medium/android/graphql/HighlightResponsesQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/HighlightResponsesQuery$PostResult;", "getPostResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final PostResult postResult;

        public Data(PostResult postResult) {
            this.postResult = postResult;
        }

        public static Data copy$default(Data data, PostResult postResult, int i, Object obj) {
            if ((i & 1) != 0) {
                postResult = data.postResult;
            }
            data.getClass();
            return new Data(postResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PostResult getPostResult() {
            return this.postResult;
        }

        public final Data copy(PostResult postResult) {
            return new Data(postResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.postResult, ((Data) other).postResult);
        }

        public final PostResult getPostResult() {
            return this.postResult;
        }

        public final int hashCode() {
            PostResult postResult = this.postResult;
            if (postResult == null) {
                return 0;
            }
            return postResult.hashCode();
        }

        public final String toString() {
            return "Data(postResult=" + this.postResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/HighlightResponsesQuery$PostResult;", "", "__typename", "", "highlightResponses", "Lcom/medium/android/graphql/fragment/HighlightResponses;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightResponses;)V", "get__typename", "()Ljava/lang/String;", "getHighlightResponses", "()Lcom/medium/android/graphql/fragment/HighlightResponses;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostResult {
        private final String __typename;
        private final HighlightResponses highlightResponses;

        public PostResult(String str, HighlightResponses highlightResponses) {
            str.getClass();
            this.__typename = str;
            this.highlightResponses = highlightResponses;
        }

        public static /* synthetic */ PostResult copy$default(PostResult postResult, String str, HighlightResponses highlightResponses, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postResult.__typename;
            }
            if ((i & 2) != 0) {
                highlightResponses = postResult.highlightResponses;
            }
            return postResult.copy(str, highlightResponses);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final HighlightResponses getHighlightResponses() {
            return this.highlightResponses;
        }

        public final PostResult copy(String __typename, HighlightResponses highlightResponses) {
            __typename.getClass();
            return new PostResult(__typename, highlightResponses);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostResult)) {
                return false;
            }
            PostResult postResult = (PostResult) other;
            return g76.L(this.__typename, postResult.__typename) && g76.L(this.highlightResponses, postResult.highlightResponses);
        }

        public final HighlightResponses getHighlightResponses() {
            return this.highlightResponses;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            HighlightResponses highlightResponses = this.highlightResponses;
            return iHashCode + (highlightResponses == null ? 0 : highlightResponses.hashCode());
        }

        public final String toString() {
            return "PostResult(__typename=" + this.__typename + ", highlightResponses=" + this.highlightResponses + ")";
        }
    }

    public HighlightResponsesQuery(String str, String str2, int i, zv8 zv8Var, ResponseSortType responseSortType, int i2) {
        str.getClass();
        str2.getClass();
        zv8Var.getClass();
        responseSortType.getClass();
        this.postId = str;
        this.groupId = str2;
        this.first = i;
        this.after = zv8Var;
        this.sortType = responseSortType;
        this.threadedPostsLimit = i2;
    }

    public static /* synthetic */ HighlightResponsesQuery copy$default(HighlightResponsesQuery highlightResponsesQuery, String str, String str2, int i, zv8 zv8Var, ResponseSortType responseSortType, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = highlightResponsesQuery.postId;
        }
        if ((i3 & 2) != 0) {
            str2 = highlightResponsesQuery.groupId;
        }
        if ((i3 & 4) != 0) {
            i = highlightResponsesQuery.first;
        }
        if ((i3 & 8) != 0) {
            zv8Var = highlightResponsesQuery.after;
        }
        if ((i3 & 16) != 0) {
            responseSortType = highlightResponsesQuery.sortType;
        }
        if ((i3 & 32) != 0) {
            i2 = highlightResponsesQuery.threadedPostsLimit;
        }
        ResponseSortType responseSortType2 = responseSortType;
        int i4 = i2;
        return highlightResponsesQuery.copy(str, str2, i, zv8Var, responseSortType2, i4);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(HighlightResponsesQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getGroupId() {
        return this.groupId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getAfter() {
        return this.after;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final ResponseSortType getSortType() {
        return this.sortType;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final int getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final HighlightResponsesQuery copy(String postId, String groupId, int first, zv8 after, ResponseSortType sortType, int threadedPostsLimit) {
        postId.getClass();
        groupId.getClass();
        after.getClass();
        sortType.getClass();
        return new HighlightResponsesQuery(postId, groupId, first, after, sortType, threadedPostsLimit);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query HighlightResponsesQuery($postId: ID!, $groupId: ID!, $first: Int!, $after: String, $sortType: ResponseSortType!, $threadedPostsLimit: PaginationLimit!) { postResult(id: $postId) { __typename ...HighlightResponses } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightGroupData on HighlightGroup { __typename id startOffset endOffset responseCount paragraph { __typename name text markups { __typename ...MarkupData } } }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment HighlightResponseThreadData on HighlightGroupResponsesConnection { __typename pageInfo { __typename ...PageInfoData } edges { __typename node { __typename ...ResponseItemData autoExpandedResponses { __typename id } threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData autoExpandedResponses { __typename id } threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData id } } id } } id } } }  fragment HighlightResponses on Post { __typename latestPublishedVersion responsesLocked allowResponses postResponses { __typename count } creator { __typename id name } highlightGroup(groupId: $groupId) { __typename ...HighlightGroupData responses(first: $first, after: $after) { __typename ...HighlightResponseThreadData } } id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HighlightResponsesQuery)) {
            return false;
        }
        HighlightResponsesQuery highlightResponsesQuery = (HighlightResponsesQuery) other;
        return g76.L(this.postId, highlightResponsesQuery.postId) && g76.L(this.groupId, highlightResponsesQuery.groupId) && this.first == highlightResponsesQuery.first && g76.L(this.after, highlightResponsesQuery.after) && this.sortType == highlightResponsesQuery.sortType && this.threadedPostsLimit == highlightResponsesQuery.threadedPostsLimit;
    }

    public final zv8 getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final String getGroupId() {
        return this.groupId;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final ResponseSortType getSortType() {
        return this.sortType;
    }

    public final int getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final int hashCode() {
        return ((this.sortType.hashCode() + lv8.h(this.after, (wgd.o(this.postId.hashCode() * 31, 31, this.groupId) + this.first) * 31, 31)) * 31) + this.threadedPostsLimit;
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
        List<sx1> list = HighlightResponsesQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        HighlightResponsesQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.postId;
        String str2 = this.groupId;
        int i = this.first;
        zv8 zv8Var = this.after;
        ResponseSortType responseSortType = this.sortType;
        int i2 = this.threadedPostsLimit;
        StringBuilder sbU = y30.u("HighlightResponsesQuery(postId=", str, ", groupId=", str2, ", first=");
        sbU.append(i);
        sbU.append(", after=");
        sbU.append(zv8Var);
        sbU.append(", sortType=");
        sbU.append(responseSortType);
        sbU.append(", threadedPostsLimit=");
        sbU.append(i2);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/HighlightResponsesQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query HighlightResponsesQuery($postId: ID!, $groupId: ID!, $first: Int!, $after: String, $sortType: ResponseSortType!, $threadedPostsLimit: PaginationLimit!) { postResult(id: $postId) { __typename ...HighlightResponses } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightGroupData on HighlightGroup { __typename id startOffset endOffset responseCount paragraph { __typename name text markups { __typename ...MarkupData } } }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment HighlightResponseThreadData on HighlightGroupResponsesConnection { __typename pageInfo { __typename ...PageInfoData } edges { __typename node { __typename ...ResponseItemData autoExpandedResponses { __typename id } threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData autoExpandedResponses { __typename id } threadedPostResponses(paging: { limit: $threadedPostsLimit } , sortType: $sortType) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } posts { __typename ...ResponseItemData id } } id } } id } } }  fragment HighlightResponses on Post { __typename latestPublishedVersion responsesLocked allowResponses postResponses { __typename count } creator { __typename id name } highlightGroup(groupId: $groupId) { __typename ...HighlightGroupData responses(first: $first, after: $after) { __typename ...HighlightResponseThreadData } } id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ HighlightResponsesQuery(String str, String str2, int i, zv8 zv8Var, ResponseSortType responseSortType, int i2, int i3, gy2 gy2Var) {
        this(str, str2, i, (i3 & 8) != 0 ? xv8.a : zv8Var, responseSortType, i2);
    }
}
