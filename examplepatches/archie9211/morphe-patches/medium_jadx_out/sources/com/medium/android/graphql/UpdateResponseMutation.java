package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UpdateResponseMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UpdateResponseMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.ResponseItemData;
import com.medium.android.graphql.selections.UpdateResponseMutationSelections;
import com.medium.android.graphql.type.Delta;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0086\b\u0018\u0000 22\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006345672B%\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\bH\u0016¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\bH\u0016¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\bH\u0016¢\u0006\u0004\b\u000f\u0010\rJ'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0016\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b#\u0010\rJ4\u0010$\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b&\u0010\rJ\u0010\u0010'\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b'\u0010\"J\u001a\u0010*\u001a\u00020\u00142\b\u0010)\u001a\u0004\u0018\u00010(HÖ\u0003¢\u0006\u0004\b*\u0010+R\u001d\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010,\u001a\u0004\b-\u0010 R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010.\u001a\u0004\b/\u0010\"R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00100\u001a\u0004\b1\u0010\r¨\u00068"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation;", "Lv78;", "Lcom/medium/android/graphql/UpdateResponseMutation$Data;", "", "Lcom/medium/android/graphql/type/Delta;", "deltas", "", "latestRev", "", "responseId", "<init>", "(Ljava/util/List;ILjava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Ljava/util/List;", "component2", "()I", "component3", "copy", "(Ljava/util/List;ILjava/lang/String;)Lcom/medium/android/graphql/UpdateResponseMutation;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/util/List;", "getDeltas", "I", "getLatestRev", "Ljava/lang/String;", "getResponseId", "Companion", "Data", "UpdatePostResponse", "ItemType", "OnStreamItemPostSimpleResponse", "Post", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateResponseMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "782826f0d93e0aa54b8fa78aed50595421b80e9b4f3c2e0aa1f1cf1cdf596f64";
    public static final String OPERATION_NAME = "UpdateResponseMutation";
    private final List<Delta> deltas;
    private final int latestRev;
    private final String responseId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UpdateResponseMutation$UpdatePostResponse;", "updatePostResponse", "<init>", "(Lcom/medium/android/graphql/UpdateResponseMutation$UpdatePostResponse;)V", "component1", "()Lcom/medium/android/graphql/UpdateResponseMutation$UpdatePostResponse;", "copy", "(Lcom/medium/android/graphql/UpdateResponseMutation$UpdatePostResponse;)Lcom/medium/android/graphql/UpdateResponseMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UpdateResponseMutation$UpdatePostResponse;", "getUpdatePostResponse", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UpdatePostResponse updatePostResponse;

        public Data(UpdatePostResponse updatePostResponse) {
            this.updatePostResponse = updatePostResponse;
        }

        public static Data copy$default(Data data, UpdatePostResponse updatePostResponse, int i, Object obj) {
            if ((i & 1) != 0) {
                updatePostResponse = data.updatePostResponse;
            }
            data.getClass();
            return new Data(updatePostResponse);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UpdatePostResponse getUpdatePostResponse() {
            return this.updatePostResponse;
        }

        public final Data copy(UpdatePostResponse updatePostResponse) {
            return new Data(updatePostResponse);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.updatePostResponse, ((Data) other).updatePostResponse);
        }

        public final UpdatePostResponse getUpdatePostResponse() {
            return this.updatePostResponse;
        }

        public final int hashCode() {
            UpdatePostResponse updatePostResponse = this.updatePostResponse;
            if (updatePostResponse == null) {
                return 0;
            }
            return updatePostResponse.hashCode();
        }

        public final String toString() {
            return "Data(updatePostResponse=" + this.updatePostResponse + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation$ItemType;", "", "__typename", "", "onStreamItemPostSimpleResponse", "Lcom/medium/android/graphql/UpdateResponseMutation$OnStreamItemPostSimpleResponse;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateResponseMutation$OnStreamItemPostSimpleResponse;)V", "get__typename", "()Ljava/lang/String;", "getOnStreamItemPostSimpleResponse", "()Lcom/medium/android/graphql/UpdateResponseMutation$OnStreamItemPostSimpleResponse;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ItemType {
        private final String __typename;
        private final OnStreamItemPostSimpleResponse onStreamItemPostSimpleResponse;

        public ItemType(String str, OnStreamItemPostSimpleResponse onStreamItemPostSimpleResponse) {
            str.getClass();
            this.__typename = str;
            this.onStreamItemPostSimpleResponse = onStreamItemPostSimpleResponse;
        }

        public static /* synthetic */ ItemType copy$default(ItemType itemType, String str, OnStreamItemPostSimpleResponse onStreamItemPostSimpleResponse, int i, Object obj) {
            if ((i & 1) != 0) {
                str = itemType.__typename;
            }
            if ((i & 2) != 0) {
                onStreamItemPostSimpleResponse = itemType.onStreamItemPostSimpleResponse;
            }
            return itemType.copy(str, onStreamItemPostSimpleResponse);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnStreamItemPostSimpleResponse getOnStreamItemPostSimpleResponse() {
            return this.onStreamItemPostSimpleResponse;
        }

        public final ItemType copy(String __typename, OnStreamItemPostSimpleResponse onStreamItemPostSimpleResponse) {
            __typename.getClass();
            return new ItemType(__typename, onStreamItemPostSimpleResponse);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ItemType)) {
                return false;
            }
            ItemType itemType = (ItemType) other;
            return g76.L(this.__typename, itemType.__typename) && g76.L(this.onStreamItemPostSimpleResponse, itemType.onStreamItemPostSimpleResponse);
        }

        public final OnStreamItemPostSimpleResponse getOnStreamItemPostSimpleResponse() {
            return this.onStreamItemPostSimpleResponse;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnStreamItemPostSimpleResponse onStreamItemPostSimpleResponse = this.onStreamItemPostSimpleResponse;
            return iHashCode + (onStreamItemPostSimpleResponse == null ? 0 : onStreamItemPostSimpleResponse.hashCode());
        }

        public final String toString() {
            return "ItemType(__typename=" + this.__typename + ", onStreamItemPostSimpleResponse=" + this.onStreamItemPostSimpleResponse + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation$OnStreamItemPostSimpleResponse;", "", "post", "Lcom/medium/android/graphql/UpdateResponseMutation$Post;", "<init>", "(Lcom/medium/android/graphql/UpdateResponseMutation$Post;)V", "getPost", "()Lcom/medium/android/graphql/UpdateResponseMutation$Post;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnStreamItemPostSimpleResponse {
        private final Post post;

        public OnStreamItemPostSimpleResponse(Post post) {
            this.post = post;
        }

        public static OnStreamItemPostSimpleResponse copy$default(OnStreamItemPostSimpleResponse onStreamItemPostSimpleResponse, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                post = onStreamItemPostSimpleResponse.post;
            }
            onStreamItemPostSimpleResponse.getClass();
            return new OnStreamItemPostSimpleResponse(post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final OnStreamItemPostSimpleResponse copy(Post post) {
            return new OnStreamItemPostSimpleResponse(post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnStreamItemPostSimpleResponse) && g76.L(this.post, ((OnStreamItemPostSimpleResponse) other).post);
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
            return "OnStreamItemPostSimpleResponse(post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation$Post;", "", "__typename", "", "id", "responseItemData", "Lcom/medium/android/graphql/fragment/ResponseItemData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getResponseItemData", "()Lcom/medium/android/graphql/fragment/ResponseItemData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final ResponseItemData responseItemData;

        public Post(String str, String str2, ResponseItemData responseItemData) {
            str.getClass();
            str2.getClass();
            responseItemData.getClass();
            this.__typename = str;
            this.id = str2;
            this.responseItemData = responseItemData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, ResponseItemData responseItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                responseItemData = post.responseItemData;
            }
            return post.copy(str, str2, responseItemData);
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
        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final Post copy(String __typename, String id, ResponseItemData responseItemData) {
            __typename.getClass();
            id.getClass();
            responseItemData.getClass();
            return new Post(__typename, id, responseItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.responseItemData, post.responseItemData);
        }

        public final String getId() {
            return this.id;
        }

        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.responseItemData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ResponseItemData responseItemData = this.responseItemData;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", responseItemData=");
            sbU.append(responseItemData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation$UpdatePostResponse;", "", "__typename", "", "itemType", "Lcom/medium/android/graphql/UpdateResponseMutation$ItemType;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateResponseMutation$ItemType;)V", "get__typename", "()Ljava/lang/String;", "getItemType", "()Lcom/medium/android/graphql/UpdateResponseMutation$ItemType;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UpdatePostResponse {
        private final String __typename;
        private final ItemType itemType;

        public UpdatePostResponse(String str, ItemType itemType) {
            str.getClass();
            itemType.getClass();
            this.__typename = str;
            this.itemType = itemType;
        }

        public static /* synthetic */ UpdatePostResponse copy$default(UpdatePostResponse updatePostResponse, String str, ItemType itemType, int i, Object obj) {
            if ((i & 1) != 0) {
                str = updatePostResponse.__typename;
            }
            if ((i & 2) != 0) {
                itemType = updatePostResponse.itemType;
            }
            return updatePostResponse.copy(str, itemType);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ItemType getItemType() {
            return this.itemType;
        }

        public final UpdatePostResponse copy(String __typename, ItemType itemType) {
            __typename.getClass();
            itemType.getClass();
            return new UpdatePostResponse(__typename, itemType);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UpdatePostResponse)) {
                return false;
            }
            UpdatePostResponse updatePostResponse = (UpdatePostResponse) other;
            return g76.L(this.__typename, updatePostResponse.__typename) && g76.L(this.itemType, updatePostResponse.itemType);
        }

        public final ItemType getItemType() {
            return this.itemType;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.itemType.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "UpdatePostResponse(__typename=" + this.__typename + ", itemType=" + this.itemType + ")";
        }
    }

    public UpdateResponseMutation(List<Delta> list, int i, String str) {
        list.getClass();
        str.getClass();
        this.deltas = list;
        this.latestRev = i;
        this.responseId = str;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ UpdateResponseMutation copy$default(UpdateResponseMutation updateResponseMutation, List list, int i, String str, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            list = updateResponseMutation.deltas;
        }
        if ((i2 & 2) != 0) {
            i = updateResponseMutation.latestRev;
        }
        if ((i2 & 4) != 0) {
            str = updateResponseMutation.responseId;
        }
        return updateResponseMutation.copy(list, i, str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UpdateResponseMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    public final List<Delta> component1() {
        return this.deltas;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getLatestRev() {
        return this.latestRev;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getResponseId() {
        return this.responseId;
    }

    public final UpdateResponseMutation copy(List<Delta> deltas, int latestRev, String responseId) {
        deltas.getClass();
        responseId.getClass();
        return new UpdateResponseMutation(deltas, latestRev, responseId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UpdateResponseMutation($deltas: [Delta!]!, $latestRev: Int!, $responseId: ID!) { updatePostResponse(deltas: $deltas, latestRev: $latestRev, responseId: $responseId) { __typename itemType { __typename ... on StreamItemPostSimpleResponse { post { __typename ...ResponseItemData id } } } } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateResponseMutation)) {
            return false;
        }
        UpdateResponseMutation updateResponseMutation = (UpdateResponseMutation) other;
        return g76.L(this.deltas, updateResponseMutation.deltas) && this.latestRev == updateResponseMutation.latestRev && g76.L(this.responseId, updateResponseMutation.responseId);
    }

    public final List<Delta> getDeltas() {
        return this.deltas;
    }

    public final int getLatestRev() {
        return this.latestRev;
    }

    public final String getResponseId() {
        return this.responseId;
    }

    public final int hashCode() {
        return this.responseId.hashCode() + (((this.deltas.hashCode() * 31) + this.latestRev) * 31);
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
        List<sx1> list = UpdateResponseMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UpdateResponseMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        List<Delta> list = this.deltas;
        int i = this.latestRev;
        String str = this.responseId;
        StringBuilder sb = new StringBuilder("UpdateResponseMutation(deltas=");
        sb.append(list);
        sb.append(", latestRev=");
        sb.append(i);
        sb.append(", responseId=");
        return ka1.v(sb, str, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UpdateResponseMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UpdateResponseMutation($deltas: [Delta!]!, $latestRev: Int!, $responseId: ID!) { updatePostResponse(deltas: $deltas, latestRev: $latestRev, responseId: $responseId) { __typename itemType { __typename ... on StreamItemPostSimpleResponse { post { __typename ...ResponseItemData id } } } } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment MarkupData on Markup { __typename name type start end href title rel type anchorType userId creatorIds }  fragment HighlightData on Quote { __typename id userId startOffset endOffset paragraphs { __typename id name text markups { __typename ...MarkupData } } user { __typename id name } post { __typename id title } }  fragment ResponseItemData on Post { __typename id responseRootPost { __typename responseDepth post { __typename id creator { __typename id name } } } inResponseToPostResult { __typename ... on Post { id } } inResponseToCatalogResult { __typename ... on Catalog { id } } creator { __typename id name imageId membership { __typename ...membershipFragment } viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } pronouns ...UserBlockData } ...PostClapsData ...ResponseCountData firstPublishedAt latestPublishedAt inResponseToMediaResource { __typename ... on MediaResource { mediumQuote { __typename ...HighlightData id } } id } content { __typename bodyModel { __typename paragraphs { __typename id text type markups { __typename ...MarkupData } } } } latestRev }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
