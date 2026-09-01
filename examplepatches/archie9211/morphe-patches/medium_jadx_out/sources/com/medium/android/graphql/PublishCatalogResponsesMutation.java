package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublishCatalogResponsesMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.PublishCatalogResponsesMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.ResponseItemData;
import com.medium.android.graphql.selections.PublishCatalogResponsesMutationSelections;
import com.medium.android.graphql.type.Delta;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.ResponseDistributionType;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.wgd;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 42\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003564B%\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u000f\u0010\rJ'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0016\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b!\u0010\rJ\u0010\u0010\"\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\"\u0010#J4\u0010$\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b&\u0010\rJ\u0010\u0010(\u001a\u00020'HÖ\u0001¢\u0006\u0004\b(\u0010)J\u001a\u0010,\u001a\u00020\u00142\b\u0010+\u001a\u0004\u0018\u00010*HÖ\u0003¢\u0006\u0004\b,\u0010-R\u001d\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010.\u001a\u0004\b/\u0010 R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u00100\u001a\u0004\b1\u0010\rR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00102\u001a\u0004\b3\u0010#¨\u00067"}, d2 = {"Lcom/medium/android/graphql/PublishCatalogResponsesMutation;", "Lv78;", "Lcom/medium/android/graphql/PublishCatalogResponsesMutation$Data;", "", "Lcom/medium/android/graphql/type/Delta;", "deltas", "", "inResponseToCatalogId", "Lcom/medium/android/graphql/type/ResponseDistributionType;", "responseDistribution", "<init>", "(Ljava/util/List;Ljava/lang/String;Lcom/medium/android/graphql/type/ResponseDistributionType;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Ljava/util/List;", "component2", "component3", "()Lcom/medium/android/graphql/type/ResponseDistributionType;", "copy", "(Ljava/util/List;Ljava/lang/String;Lcom/medium/android/graphql/type/ResponseDistributionType;)Lcom/medium/android/graphql/PublishCatalogResponsesMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/util/List;", "getDeltas", "Ljava/lang/String;", "getInResponseToCatalogId", "Lcom/medium/android/graphql/type/ResponseDistributionType;", "getResponseDistribution", "Companion", "Data", "PublishCatalogResponse", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublishCatalogResponsesMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "1ec389ac908218f80abe1d85968a15b475ce48e9f84729fb39c3b6fe53ca72d9";
    public static final String OPERATION_NAME = "PublishCatalogResponsesMutation";
    private final List<Delta> deltas;
    private final String inResponseToCatalogId;
    private final ResponseDistributionType responseDistribution;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublishCatalogResponsesMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/PublishCatalogResponsesMutation$PublishCatalogResponse;", "publishCatalogResponse", "<init>", "(Lcom/medium/android/graphql/PublishCatalogResponsesMutation$PublishCatalogResponse;)V", "component1", "()Lcom/medium/android/graphql/PublishCatalogResponsesMutation$PublishCatalogResponse;", "copy", "(Lcom/medium/android/graphql/PublishCatalogResponsesMutation$PublishCatalogResponse;)Lcom/medium/android/graphql/PublishCatalogResponsesMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublishCatalogResponsesMutation$PublishCatalogResponse;", "getPublishCatalogResponse", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final PublishCatalogResponse publishCatalogResponse;

        public Data(PublishCatalogResponse publishCatalogResponse) {
            this.publishCatalogResponse = publishCatalogResponse;
        }

        public static Data copy$default(Data data, PublishCatalogResponse publishCatalogResponse, int i, Object obj) {
            if ((i & 1) != 0) {
                publishCatalogResponse = data.publishCatalogResponse;
            }
            data.getClass();
            return new Data(publishCatalogResponse);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublishCatalogResponse getPublishCatalogResponse() {
            return this.publishCatalogResponse;
        }

        public final Data copy(PublishCatalogResponse publishCatalogResponse) {
            return new Data(publishCatalogResponse);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.publishCatalogResponse, ((Data) other).publishCatalogResponse);
        }

        public final PublishCatalogResponse getPublishCatalogResponse() {
            return this.publishCatalogResponse;
        }

        public final int hashCode() {
            PublishCatalogResponse publishCatalogResponse = this.publishCatalogResponse;
            if (publishCatalogResponse == null) {
                return 0;
            }
            return publishCatalogResponse.hashCode();
        }

        public final String toString() {
            return "Data(publishCatalogResponse=" + this.publishCatalogResponse + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublishCatalogResponsesMutation$PublishCatalogResponse;", "", "__typename", "", "responseItemData", "Lcom/medium/android/graphql/fragment/ResponseItemData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData;)V", "get__typename", "()Ljava/lang/String;", "getResponseItemData", "()Lcom/medium/android/graphql/fragment/ResponseItemData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublishCatalogResponse {
        private final String __typename;
        private final ResponseItemData responseItemData;

        public PublishCatalogResponse(String str, ResponseItemData responseItemData) {
            str.getClass();
            this.__typename = str;
            this.responseItemData = responseItemData;
        }

        public static /* synthetic */ PublishCatalogResponse copy$default(PublishCatalogResponse publishCatalogResponse, String str, ResponseItemData responseItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publishCatalogResponse.__typename;
            }
            if ((i & 2) != 0) {
                responseItemData = publishCatalogResponse.responseItemData;
            }
            return publishCatalogResponse.copy(str, responseItemData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final PublishCatalogResponse copy(String __typename, ResponseItemData responseItemData) {
            __typename.getClass();
            return new PublishCatalogResponse(__typename, responseItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublishCatalogResponse)) {
                return false;
            }
            PublishCatalogResponse publishCatalogResponse = (PublishCatalogResponse) other;
            return g76.L(this.__typename, publishCatalogResponse.__typename) && g76.L(this.responseItemData, publishCatalogResponse.responseItemData);
        }

        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            ResponseItemData responseItemData = this.responseItemData;
            return iHashCode + (responseItemData == null ? 0 : responseItemData.hashCode());
        }

        public final String toString() {
            return "PublishCatalogResponse(__typename=" + this.__typename + ", responseItemData=" + this.responseItemData + ")";
        }
    }

    public PublishCatalogResponsesMutation(List<Delta> list, String str, ResponseDistributionType responseDistributionType) {
        list.getClass();
        str.getClass();
        responseDistributionType.getClass();
        this.deltas = list;
        this.inResponseToCatalogId = str;
        this.responseDistribution = responseDistributionType;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PublishCatalogResponsesMutation copy$default(PublishCatalogResponsesMutation publishCatalogResponsesMutation, List list, String str, ResponseDistributionType responseDistributionType, int i, Object obj) {
        if ((i & 1) != 0) {
            list = publishCatalogResponsesMutation.deltas;
        }
        if ((i & 2) != 0) {
            str = publishCatalogResponsesMutation.inResponseToCatalogId;
        }
        if ((i & 4) != 0) {
            responseDistributionType = publishCatalogResponsesMutation.responseDistribution;
        }
        return publishCatalogResponsesMutation.copy(list, str, responseDistributionType);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublishCatalogResponsesMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    public final List<Delta> component1() {
        return this.deltas;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getInResponseToCatalogId() {
        return this.inResponseToCatalogId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final ResponseDistributionType getResponseDistribution() {
        return this.responseDistribution;
    }

    public final PublishCatalogResponsesMutation copy(List<Delta> deltas, String inResponseToCatalogId, ResponseDistributionType responseDistribution) {
        deltas.getClass();
        inResponseToCatalogId.getClass();
        responseDistribution.getClass();
        return new PublishCatalogResponsesMutation(deltas, inResponseToCatalogId, responseDistribution);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation PublishCatalogResponsesMutation($deltas: [Delta!]!, $inResponseToCatalogId: String!, $responseDistribution: ResponseDistributionType!) { publishCatalogResponse(deltas: $deltas, inResponseToCatalogId: $inResponseToCatalogId, responseDistribution: $responseDistribution) { __typename ...ResponseItemData } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublishCatalogResponsesMutation)) {
            return false;
        }
        PublishCatalogResponsesMutation publishCatalogResponsesMutation = (PublishCatalogResponsesMutation) other;
        return g76.L(this.deltas, publishCatalogResponsesMutation.deltas) && g76.L(this.inResponseToCatalogId, publishCatalogResponsesMutation.inResponseToCatalogId) && this.responseDistribution == publishCatalogResponsesMutation.responseDistribution;
    }

    public final List<Delta> getDeltas() {
        return this.deltas;
    }

    public final String getInResponseToCatalogId() {
        return this.inResponseToCatalogId;
    }

    public final ResponseDistributionType getResponseDistribution() {
        return this.responseDistribution;
    }

    public final int hashCode() {
        return this.responseDistribution.hashCode() + wgd.o(this.deltas.hashCode() * 31, 31, this.inResponseToCatalogId);
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
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = PublishCatalogResponsesMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublishCatalogResponsesMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PublishCatalogResponsesMutation(deltas=" + this.deltas + ", inResponseToCatalogId=" + this.inResponseToCatalogId + ", responseDistribution=" + this.responseDistribution + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublishCatalogResponsesMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation PublishCatalogResponsesMutation($deltas: [Delta!]!, $inResponseToCatalogId: String!, $responseDistribution: ResponseDistributionType!) { publishCatalogResponse(deltas: $deltas, inResponseToCatalogId: $inResponseToCatalogId, responseDistribution: $responseDistribution) { __typename ...ResponseItemData } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
