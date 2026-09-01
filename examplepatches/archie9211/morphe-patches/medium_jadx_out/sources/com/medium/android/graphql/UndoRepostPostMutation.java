package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UndoRepostPostMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UndoRepostPostMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.PostRepostCountData;
import com.medium.android.graphql.fragment.PostRepostStateData;
import com.medium.android.graphql.selections.UndoRepostPostMutationSelections;
import com.medium.android.graphql.type.Mutation;
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
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005()*+'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/UndoRepostPostMutation;", "Lv78;", "Lcom/medium/android/graphql/UndoRepostPostMutation$Data;", "", "targetPostId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/UndoRepostPostMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetPostId", "Companion", "Data", "UndoRepost", "OnPost", "OnRepostError", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UndoRepostPostMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "ca6f442b1020fa9a0a67076bc564737e2113f0783cf365f919251120892a24b7";
    public static final String OPERATION_NAME = "UndoRepostPostMutation";
    private final String targetPostId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UndoRepostPostMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UndoRepostPostMutation$UndoRepost;", "undoRepost", "<init>", "(Lcom/medium/android/graphql/UndoRepostPostMutation$UndoRepost;)V", "component1", "()Lcom/medium/android/graphql/UndoRepostPostMutation$UndoRepost;", "copy", "(Lcom/medium/android/graphql/UndoRepostPostMutation$UndoRepost;)Lcom/medium/android/graphql/UndoRepostPostMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UndoRepostPostMutation$UndoRepost;", "getUndoRepost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UndoRepost undoRepost;

        public Data(UndoRepost undoRepost) {
            this.undoRepost = undoRepost;
        }

        public static Data copy$default(Data data, UndoRepost undoRepost, int i, Object obj) {
            if ((i & 1) != 0) {
                undoRepost = data.undoRepost;
            }
            data.getClass();
            return new Data(undoRepost);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UndoRepost getUndoRepost() {
            return this.undoRepost;
        }

        public final Data copy(UndoRepost undoRepost) {
            return new Data(undoRepost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.undoRepost, ((Data) other).undoRepost);
        }

        public final UndoRepost getUndoRepost() {
            return this.undoRepost;
        }

        public final int hashCode() {
            UndoRepost undoRepost = this.undoRepost;
            if (undoRepost == null) {
                return 0;
            }
            return undoRepost.hashCode();
        }

        public final String toString() {
            return "Data(undoRepost=" + this.undoRepost + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0007HÆ\u0003J'\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/UndoRepostPostMutation$OnPost;", "", "id", "", "postRepostStateData", "Lcom/medium/android/graphql/fragment/PostRepostStateData;", "postRepostCountData", "Lcom/medium/android/graphql/fragment/PostRepostCountData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostRepostStateData;Lcom/medium/android/graphql/fragment/PostRepostCountData;)V", "getId", "()Ljava/lang/String;", "getPostRepostStateData", "()Lcom/medium/android/graphql/fragment/PostRepostStateData;", "getPostRepostCountData", "()Lcom/medium/android/graphql/fragment/PostRepostCountData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost {
        private final String id;
        private final PostRepostCountData postRepostCountData;
        private final PostRepostStateData postRepostStateData;

        public OnPost(String str, PostRepostStateData postRepostStateData, PostRepostCountData postRepostCountData) {
            str.getClass();
            postRepostStateData.getClass();
            postRepostCountData.getClass();
            this.id = str;
            this.postRepostStateData = postRepostStateData;
            this.postRepostCountData = postRepostCountData;
        }

        public static /* synthetic */ OnPost copy$default(OnPost onPost, String str, PostRepostStateData postRepostStateData, PostRepostCountData postRepostCountData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPost.id;
            }
            if ((i & 2) != 0) {
                postRepostStateData = onPost.postRepostStateData;
            }
            if ((i & 4) != 0) {
                postRepostCountData = onPost.postRepostCountData;
            }
            return onPost.copy(str, postRepostStateData, postRepostCountData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostRepostStateData getPostRepostStateData() {
            return this.postRepostStateData;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostRepostCountData getPostRepostCountData() {
            return this.postRepostCountData;
        }

        public final OnPost copy(String id, PostRepostStateData postRepostStateData, PostRepostCountData postRepostCountData) {
            id.getClass();
            postRepostStateData.getClass();
            postRepostCountData.getClass();
            return new OnPost(id, postRepostStateData, postRepostCountData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPost)) {
                return false;
            }
            OnPost onPost = (OnPost) other;
            return g76.L(this.id, onPost.id) && g76.L(this.postRepostStateData, onPost.postRepostStateData) && g76.L(this.postRepostCountData, onPost.postRepostCountData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostRepostCountData getPostRepostCountData() {
            return this.postRepostCountData;
        }

        public final PostRepostStateData getPostRepostStateData() {
            return this.postRepostStateData;
        }

        public final int hashCode() {
            return this.postRepostCountData.hashCode() + ((this.postRepostStateData.hashCode() + (this.id.hashCode() * 31)) * 31);
        }

        public final String toString() {
            return "OnPost(id=" + this.id + ", postRepostStateData=" + this.postRepostStateData + ", postRepostCountData=" + this.postRepostCountData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UndoRepostPostMutation$OnRepostError;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRepostError {
        private final String message;

        public OnRepostError(String str) {
            str.getClass();
            this.message = str;
        }

        public static /* synthetic */ OnRepostError copy$default(OnRepostError onRepostError, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRepostError.message;
            }
            return onRepostError.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnRepostError copy(String message) {
            message.getClass();
            return new OnRepostError(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnRepostError) && g76.L(this.message, ((OnRepostError) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            return this.message.hashCode();
        }

        public final String toString() {
            return ev6.x("OnRepostError(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/UndoRepostPostMutation$UndoRepost;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/UndoRepostPostMutation$OnPost;", "onRepostError", "Lcom/medium/android/graphql/UndoRepostPostMutation$OnRepostError;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UndoRepostPostMutation$OnPost;Lcom/medium/android/graphql/UndoRepostPostMutation$OnRepostError;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/UndoRepostPostMutation$OnPost;", "getOnRepostError", "()Lcom/medium/android/graphql/UndoRepostPostMutation$OnRepostError;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UndoRepost {
        private final String __typename;
        private final OnPost onPost;
        private final OnRepostError onRepostError;

        public UndoRepost(String str, OnPost onPost, OnRepostError onRepostError) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost;
            this.onRepostError = onRepostError;
        }

        public static /* synthetic */ UndoRepost copy$default(UndoRepost undoRepost, String str, OnPost onPost, OnRepostError onRepostError, int i, Object obj) {
            if ((i & 1) != 0) {
                str = undoRepost.__typename;
            }
            if ((i & 2) != 0) {
                onPost = undoRepost.onPost;
            }
            if ((i & 4) != 0) {
                onRepostError = undoRepost.onRepostError;
            }
            return undoRepost.copy(str, onPost, onRepostError);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPost getOnPost() {
            return this.onPost;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnRepostError getOnRepostError() {
            return this.onRepostError;
        }

        public final UndoRepost copy(String __typename, OnPost onPost, OnRepostError onRepostError) {
            __typename.getClass();
            return new UndoRepost(__typename, onPost, onRepostError);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UndoRepost)) {
                return false;
            }
            UndoRepost undoRepost = (UndoRepost) other;
            return g76.L(this.__typename, undoRepost.__typename) && g76.L(this.onPost, undoRepost.onPost) && g76.L(this.onRepostError, undoRepost.onRepostError);
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final OnRepostError getOnRepostError() {
            return this.onRepostError;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPost onPost = this.onPost;
            int iHashCode2 = (iHashCode + (onPost == null ? 0 : onPost.hashCode())) * 31;
            OnRepostError onRepostError = this.onRepostError;
            return iHashCode2 + (onRepostError != null ? onRepostError.hashCode() : 0);
        }

        public final String toString() {
            return "UndoRepost(__typename=" + this.__typename + ", onPost=" + this.onPost + ", onRepostError=" + this.onRepostError + ")";
        }
    }

    public UndoRepostPostMutation(String str) {
        str.getClass();
        this.targetPostId = str;
    }

    public static /* synthetic */ UndoRepostPostMutation copy$default(UndoRepostPostMutation undoRepostPostMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = undoRepostPostMutation.targetPostId;
        }
        return undoRepostPostMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UndoRepostPostMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final UndoRepostPostMutation copy(String targetPostId) {
        targetPostId.getClass();
        return new UndoRepostPostMutation(targetPostId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UndoRepostPostMutation($targetPostId: ID!) { undoRepost(targetPostId: $targetPostId) { __typename ... on Post { ...PostRepostStateData ...PostRepostCountData id } ... on RepostError { message } } }  fragment PostRepostStateData on Post { __typename id allowReposts viewerEdge { __typename id hasReposted repostNote } }  fragment PostRepostCountData on Post { __typename id repostCount }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UndoRepostPostMutation) && g76.L(this.targetPostId, ((UndoRepostPostMutation) other).targetPostId);
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final int hashCode() {
        return this.targetPostId.hashCode();
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
        List<sx1> list = UndoRepostPostMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UndoRepostPostMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("UndoRepostPostMutation(targetPostId=", this.targetPostId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UndoRepostPostMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UndoRepostPostMutation($targetPostId: ID!) { undoRepost(targetPostId: $targetPostId) { __typename ... on Post { ...PostRepostStateData ...PostRepostCountData id } ... on RepostError { message } } }  fragment PostRepostStateData on Post { __typename id allowReposts viewerEdge { __typename id hasReposted repostNote } }  fragment PostRepostCountData on Post { __typename id repostCount }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
