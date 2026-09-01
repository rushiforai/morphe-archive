package com.medium.android.graphql;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.medium.android.graphql.adapter.PostHighlightsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PostHighlightsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.HighlightsData;
import com.medium.android.graphql.fragment.TopHighlightResponseGroupsData;
import com.medium.android.graphql.selections.PostHighlightsQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003()'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/PostHighlightsQuery;", "Luqa;", "Lcom/medium/android/graphql/PostHighlightsQuery$Data;", "", "postId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/PostHighlightsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Companion", "Data", "PostResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostHighlightsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "09f7d07f1b49f715ae578e0344c54ab674aba1cc12ff7ec63e9b432ea8460e33";
    public static final String OPERATION_NAME = "PostHighlightsQuery";
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PostHighlightsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PostHighlightsQuery$PostResult;", "postResult", "<init>", "(Lcom/medium/android/graphql/PostHighlightsQuery$PostResult;)V", "component1", "()Lcom/medium/android/graphql/PostHighlightsQuery$PostResult;", "copy", "(Lcom/medium/android/graphql/PostHighlightsQuery$PostResult;)Lcom/medium/android/graphql/PostHighlightsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PostHighlightsQuery$PostResult;", "getPostResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return "Data(postResult=" + this.postResult + AXoTRPEGKEve.anoBHvzNFENf;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/PostHighlightsQuery$PostResult;", "", "__typename", "", "highlightsData", "Lcom/medium/android/graphql/fragment/HighlightsData;", "topHighlightResponseGroupsData", "Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightsData;Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData;)V", "get__typename", "()Ljava/lang/String;", "getHighlightsData", "()Lcom/medium/android/graphql/fragment/HighlightsData;", "getTopHighlightResponseGroupsData", "()Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostResult {
        private final String __typename;
        private final HighlightsData highlightsData;
        private final TopHighlightResponseGroupsData topHighlightResponseGroupsData;

        public PostResult(String str, HighlightsData highlightsData, TopHighlightResponseGroupsData topHighlightResponseGroupsData) {
            str.getClass();
            this.__typename = str;
            this.highlightsData = highlightsData;
            this.topHighlightResponseGroupsData = topHighlightResponseGroupsData;
        }

        public static /* synthetic */ PostResult copy$default(PostResult postResult, String str, HighlightsData highlightsData, TopHighlightResponseGroupsData topHighlightResponseGroupsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postResult.__typename;
            }
            if ((i & 2) != 0) {
                highlightsData = postResult.highlightsData;
            }
            if ((i & 4) != 0) {
                topHighlightResponseGroupsData = postResult.topHighlightResponseGroupsData;
            }
            return postResult.copy(str, highlightsData, topHighlightResponseGroupsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final HighlightsData getHighlightsData() {
            return this.highlightsData;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final TopHighlightResponseGroupsData getTopHighlightResponseGroupsData() {
            return this.topHighlightResponseGroupsData;
        }

        public final PostResult copy(String __typename, HighlightsData highlightsData, TopHighlightResponseGroupsData topHighlightResponseGroupsData) {
            __typename.getClass();
            return new PostResult(__typename, highlightsData, topHighlightResponseGroupsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostResult)) {
                return false;
            }
            PostResult postResult = (PostResult) other;
            return g76.L(this.__typename, postResult.__typename) && g76.L(this.highlightsData, postResult.highlightsData) && g76.L(this.topHighlightResponseGroupsData, postResult.topHighlightResponseGroupsData);
        }

        public final HighlightsData getHighlightsData() {
            return this.highlightsData;
        }

        public final TopHighlightResponseGroupsData getTopHighlightResponseGroupsData() {
            return this.topHighlightResponseGroupsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            HighlightsData highlightsData = this.highlightsData;
            int iHashCode2 = (iHashCode + (highlightsData == null ? 0 : highlightsData.hashCode())) * 31;
            TopHighlightResponseGroupsData topHighlightResponseGroupsData = this.topHighlightResponseGroupsData;
            return iHashCode2 + (topHighlightResponseGroupsData != null ? topHighlightResponseGroupsData.hashCode() : 0);
        }

        public final String toString() {
            return "PostResult(__typename=" + this.__typename + ", highlightsData=" + this.highlightsData + ", topHighlightResponseGroupsData=" + this.topHighlightResponseGroupsData + ")";
        }
    }

    public PostHighlightsQuery(String str) {
        str.getClass();
        this.postId = str;
    }

    public static /* synthetic */ PostHighlightsQuery copy$default(PostHighlightsQuery postHighlightsQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postHighlightsQuery.postId;
        }
        return postHighlightsQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PostHighlightsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final PostHighlightsQuery copy(String postId) {
        postId.getClass();
        return new PostHighlightsQuery(postId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PostHighlightsQuery($postId: ID!) { postResult(id: $postId) { __typename ...HighlightsData ...TopHighlightResponseGroupsData } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment HighlightGroupData on HighlightGroup { __typename id startOffset endOffset responseCount paragraph { __typename name text markups { __typename ...MarkupData } } }  fragment HighlightDataWithGroup on Quote { __typename ...HighlightData highlightGroup { __typename ...HighlightGroupData } id }  fragment HighlightsData on Post { __typename id highlights { __typename ...HighlightDataWithGroup id } }  fragment TopHighlightResponseGroupsData on Post { __typename id topHighlightResponseGroups { __typename ...HighlightGroupData } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof PostHighlightsQuery) && g76.L(this.postId, ((PostHighlightsQuery) other).postId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode();
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
        List<sx1> list = PostHighlightsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PostHighlightsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("PostHighlightsQuery(postId=", this.postId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PostHighlightsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PostHighlightsQuery($postId: ID!) { postResult(id: $postId) { __typename ...HighlightsData ...TopHighlightResponseGroupsData } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment HighlightGroupData on HighlightGroup { __typename id startOffset endOffset responseCount paragraph { __typename name text markups { __typename ...MarkupData } } }  fragment HighlightDataWithGroup on Quote { __typename ...HighlightData highlightGroup { __typename ...HighlightGroupData } id }  fragment HighlightsData on Post { __typename id highlights { __typename ...HighlightDataWithGroup id } }  fragment TopHighlightResponseGroupsData on Post { __typename id topHighlightResponseGroups { __typename ...HighlightGroupData } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
