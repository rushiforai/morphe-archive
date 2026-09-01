package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublishPostResponseMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.PublishPostResponseMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.ResponseItemData;
import com.medium.android.graphql.selections.PublishPostResponseMutationSelections;
import com.medium.android.graphql.type.Delta;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.ResponseDistributionType;
import defpackage.ae6;
import defpackage.b09;
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
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0086\b\u0018\u0000 :2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004;<=:B7\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0011\u0010\u000fJ'\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0015\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b!\u0010\u000fJ\u0016\u0010\"\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b$\u0010%J\u0018\u0010&\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\nHÆ\u0003¢\u0006\u0004\b&\u0010'JF\u0010(\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\t\u001a\u00020\b2\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\nHÆ\u0001¢\u0006\u0004\b(\u0010)J\u0010\u0010*\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b*\u0010\u000fJ\u0010\u0010,\u001a\u00020+HÖ\u0001¢\u0006\u0004\b,\u0010-J\u001a\u00100\u001a\u00020\u00162\b\u0010/\u001a\u0004\u0018\u00010.HÖ\u0003¢\u0006\u0004\b0\u00101R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00102\u001a\u0004\b3\u0010\u000fR\u001d\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u00104\u001a\u0004\b5\u0010#R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00106\u001a\u0004\b7\u0010%R\u001f\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\n8\u0006¢\u0006\f\n\u0004\b\u000b\u00108\u001a\u0004\b9\u0010'¨\u0006>"}, d2 = {"Lcom/medium/android/graphql/PublishPostResponseMutation;", "Lv78;", "Lcom/medium/android/graphql/PublishPostResponseMutation$Data;", "", "inResponseToPostId", "", "Lcom/medium/android/graphql/type/Delta;", "deltas", "Lcom/medium/android/graphql/type/ResponseDistributionType;", "responseDistribution", "Lzv8;", "inResponseToQuoteId", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/type/ResponseDistributionType;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Ljava/util/List;", "component3", "()Lcom/medium/android/graphql/type/ResponseDistributionType;", "component4", "()Lzv8;", "copy", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/type/ResponseDistributionType;Lzv8;)Lcom/medium/android/graphql/PublishPostResponseMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getInResponseToPostId", "Ljava/util/List;", "getDeltas", "Lcom/medium/android/graphql/type/ResponseDistributionType;", "getResponseDistribution", "Lzv8;", "getInResponseToQuoteId", "Companion", "Data", "PublishPostThreadedResponse", "OnPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublishPostResponseMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "7a13698686f664791a81f16f25245f858ef9447b0090a8c13ed4c2efa1593e93";
    public static final String OPERATION_NAME = "PublishPostResponseMutation";
    private final List<Delta> deltas;
    private final String inResponseToPostId;
    private final zv8 inResponseToQuoteId;
    private final ResponseDistributionType responseDistribution;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublishPostResponseMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/PublishPostResponseMutation$PublishPostThreadedResponse;", "publishPostThreadedResponse", "<init>", "(Lcom/medium/android/graphql/PublishPostResponseMutation$PublishPostThreadedResponse;)V", "component1", "()Lcom/medium/android/graphql/PublishPostResponseMutation$PublishPostThreadedResponse;", "copy", "(Lcom/medium/android/graphql/PublishPostResponseMutation$PublishPostThreadedResponse;)Lcom/medium/android/graphql/PublishPostResponseMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublishPostResponseMutation$PublishPostThreadedResponse;", "getPublishPostThreadedResponse", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final PublishPostThreadedResponse publishPostThreadedResponse;

        public Data(PublishPostThreadedResponse publishPostThreadedResponse) {
            this.publishPostThreadedResponse = publishPostThreadedResponse;
        }

        public static Data copy$default(Data data, PublishPostThreadedResponse publishPostThreadedResponse, int i, Object obj) {
            if ((i & 1) != 0) {
                publishPostThreadedResponse = data.publishPostThreadedResponse;
            }
            data.getClass();
            return new Data(publishPostThreadedResponse);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublishPostThreadedResponse getPublishPostThreadedResponse() {
            return this.publishPostThreadedResponse;
        }

        public final Data copy(PublishPostThreadedResponse publishPostThreadedResponse) {
            return new Data(publishPostThreadedResponse);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.publishPostThreadedResponse, ((Data) other).publishPostThreadedResponse);
        }

        public final PublishPostThreadedResponse getPublishPostThreadedResponse() {
            return this.publishPostThreadedResponse;
        }

        public final int hashCode() {
            PublishPostThreadedResponse publishPostThreadedResponse = this.publishPostThreadedResponse;
            if (publishPostThreadedResponse == null) {
                return 0;
            }
            return publishPostThreadedResponse.hashCode();
        }

        public final String toString() {
            return "Data(publishPostThreadedResponse=" + this.publishPostThreadedResponse + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/PublishPostResponseMutation$OnPost;", "", "responseItemData", "Lcom/medium/android/graphql/fragment/ResponseItemData;", "<init>", "(Lcom/medium/android/graphql/fragment/ResponseItemData;)V", "getResponseItemData", "()Lcom/medium/android/graphql/fragment/ResponseItemData;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost {
        private final ResponseItemData responseItemData;

        public OnPost(ResponseItemData responseItemData) {
            responseItemData.getClass();
            this.responseItemData = responseItemData;
        }

        public static /* synthetic */ OnPost copy$default(OnPost onPost, ResponseItemData responseItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                responseItemData = onPost.responseItemData;
            }
            return onPost.copy(responseItemData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final OnPost copy(ResponseItemData responseItemData) {
            responseItemData.getClass();
            return new OnPost(responseItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPost) && g76.L(this.responseItemData, ((OnPost) other).responseItemData);
        }

        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final int hashCode() {
            return this.responseItemData.hashCode();
        }

        public final String toString() {
            return "OnPost(responseItemData=" + this.responseItemData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PublishPostResponseMutation$PublishPostThreadedResponse;", "", "__typename", "", "id", "onPost", "Lcom/medium/android/graphql/PublishPostResponseMutation$OnPost;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/PublishPostResponseMutation$OnPost;)V", "get__typename", "()Ljava/lang/String;", "getId", "getOnPost", "()Lcom/medium/android/graphql/PublishPostResponseMutation$OnPost;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublishPostThreadedResponse {
        private final String __typename;
        private final String id;
        private final OnPost onPost;

        public PublishPostThreadedResponse(String str, String str2, OnPost onPost) {
            str.getClass();
            str2.getClass();
            onPost.getClass();
            this.__typename = str;
            this.id = str2;
            this.onPost = onPost;
        }

        public static /* synthetic */ PublishPostThreadedResponse copy$default(PublishPostThreadedResponse publishPostThreadedResponse, String str, String str2, OnPost onPost, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publishPostThreadedResponse.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publishPostThreadedResponse.id;
            }
            if ((i & 4) != 0) {
                onPost = publishPostThreadedResponse.onPost;
            }
            return publishPostThreadedResponse.copy(str, str2, onPost);
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
        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final PublishPostThreadedResponse copy(String __typename, String id, OnPost onPost) {
            __typename.getClass();
            id.getClass();
            onPost.getClass();
            return new PublishPostThreadedResponse(__typename, id, onPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublishPostThreadedResponse)) {
                return false;
            }
            PublishPostThreadedResponse publishPostThreadedResponse = (PublishPostThreadedResponse) other;
            return g76.L(this.__typename, publishPostThreadedResponse.__typename) && g76.L(this.id, publishPostThreadedResponse.id) && g76.L(this.onPost, publishPostThreadedResponse.onPost);
        }

        public final String getId() {
            return this.id;
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onPost.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            OnPost onPost = this.onPost;
            StringBuilder sbU = y30.u("PublishPostThreadedResponse(__typename=", str, ", id=", str2, ", onPost=");
            sbU.append(onPost);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PublishPostResponseMutation(String str, List<Delta> list, ResponseDistributionType responseDistributionType, zv8 zv8Var) {
        str.getClass();
        list.getClass();
        responseDistributionType.getClass();
        zv8Var.getClass();
        this.inResponseToPostId = str;
        this.deltas = list;
        this.responseDistribution = responseDistributionType;
        this.inResponseToQuoteId = zv8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PublishPostResponseMutation copy$default(PublishPostResponseMutation publishPostResponseMutation, String str, List list, ResponseDistributionType responseDistributionType, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publishPostResponseMutation.inResponseToPostId;
        }
        if ((i & 2) != 0) {
            list = publishPostResponseMutation.deltas;
        }
        if ((i & 4) != 0) {
            responseDistributionType = publishPostResponseMutation.responseDistribution;
        }
        if ((i & 8) != 0) {
            zv8Var = publishPostResponseMutation.inResponseToQuoteId;
        }
        return publishPostResponseMutation.copy(str, list, responseDistributionType, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublishPostResponseMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getInResponseToPostId() {
        return this.inResponseToPostId;
    }

    public final List<Delta> component2() {
        return this.deltas;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final ResponseDistributionType getResponseDistribution() {
        return this.responseDistribution;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getInResponseToQuoteId() {
        return this.inResponseToQuoteId;
    }

    public final PublishPostResponseMutation copy(String inResponseToPostId, List<Delta> deltas, ResponseDistributionType responseDistribution, zv8 inResponseToQuoteId) {
        inResponseToPostId.getClass();
        deltas.getClass();
        responseDistribution.getClass();
        inResponseToQuoteId.getClass();
        return new PublishPostResponseMutation(inResponseToPostId, deltas, responseDistribution, inResponseToQuoteId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation PublishPostResponseMutation($inResponseToPostId: ID!, $deltas: [Delta!]!, $responseDistribution: ResponseDistributionType!, $inResponseToQuoteId: ID) { publishPostThreadedResponse(inResponseToPostId: $inResponseToPostId, deltas: $deltas, inResponseToQuoteId: $inResponseToQuoteId, responseDistribution: $responseDistribution) { __typename ... on Post { ...ResponseItemData } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublishPostResponseMutation)) {
            return false;
        }
        PublishPostResponseMutation publishPostResponseMutation = (PublishPostResponseMutation) other;
        return g76.L(this.inResponseToPostId, publishPostResponseMutation.inResponseToPostId) && g76.L(this.deltas, publishPostResponseMutation.deltas) && this.responseDistribution == publishPostResponseMutation.responseDistribution && g76.L(this.inResponseToQuoteId, publishPostResponseMutation.inResponseToQuoteId);
    }

    public final List<Delta> getDeltas() {
        return this.deltas;
    }

    public final String getInResponseToPostId() {
        return this.inResponseToPostId;
    }

    public final zv8 getInResponseToQuoteId() {
        return this.inResponseToQuoteId;
    }

    public final ResponseDistributionType getResponseDistribution() {
        return this.responseDistribution;
    }

    public final int hashCode() {
        return this.inResponseToQuoteId.hashCode() + ((this.responseDistribution.hashCode() + wgd.p(this.inResponseToPostId.hashCode() * 31, 31, this.deltas)) * 31);
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
        List<sx1> list = PublishPostResponseMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublishPostResponseMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.inResponseToPostId;
        List<Delta> list = this.deltas;
        ResponseDistributionType responseDistributionType = this.responseDistribution;
        zv8 zv8Var = this.inResponseToQuoteId;
        StringBuilder sbE = b09.E("PublishPostResponseMutation(inResponseToPostId=", str, ", deltas=", ", responseDistribution=", list);
        sbE.append(responseDistributionType);
        sbE.append(", inResponseToQuoteId=");
        sbE.append(zv8Var);
        sbE.append(")");
        return sbE.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublishPostResponseMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation PublishPostResponseMutation($inResponseToPostId: ID!, $deltas: [Delta!]!, $responseDistribution: ResponseDistributionType!, $inResponseToQuoteId: ID) { publishPostThreadedResponse(inResponseToPostId: $inResponseToPostId, deltas: $deltas, inResponseToQuoteId: $inResponseToQuoteId, responseDistribution: $responseDistribution) { __typename ... on Post { ...ResponseItemData } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ PublishPostResponseMutation(String str, List list, ResponseDistributionType responseDistributionType, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, list, responseDistributionType, (i & 8) != 0 ? xv8.a : zv8Var);
    }
}
