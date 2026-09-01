package com.medium.android.graphql;

import com.medium.android.graphql.adapter.RepostPostMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.RepostPostMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.PostRepostCountData;
import com.medium.android.graphql.fragment.PostRepostStateData;
import com.medium.android.graphql.selections.RepostPostMutationSelections;
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
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006./012-B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0018\u0010\u001d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ,\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00063"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation;", "Lv78;", "Lcom/medium/android/graphql/RepostPostMutation$Data;", "", "targetPostId", "Lzv8;", "note", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/RepostPostMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetPostId", "Lzv8;", "getNote", "Companion", "Data", "Repost", "OnPost", "OnRepostError", "OnRateLimited", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class RepostPostMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d0f291de048ae8cf011a6533394dd57f843d29190bb0a36e7370a9b42667f487";
    public static final String OPERATION_NAME = "RepostPostMutation";
    private final zv8 note;
    private final String targetPostId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/RepostPostMutation$Repost;", "repost", "<init>", "(Lcom/medium/android/graphql/RepostPostMutation$Repost;)V", "component1", "()Lcom/medium/android/graphql/RepostPostMutation$Repost;", "copy", "(Lcom/medium/android/graphql/RepostPostMutation$Repost;)Lcom/medium/android/graphql/RepostPostMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/RepostPostMutation$Repost;", "getRepost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final Repost repost;

        public Data(Repost repost) {
            this.repost = repost;
        }

        public static Data copy$default(Data data, Repost repost, int i, Object obj) {
            if ((i & 1) != 0) {
                repost = data.repost;
            }
            data.getClass();
            return new Data(repost);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Repost getRepost() {
            return this.repost;
        }

        public final Data copy(Repost repost) {
            return new Data(repost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.repost, ((Data) other).repost);
        }

        public final Repost getRepost() {
            return this.repost;
        }

        public final int hashCode() {
            Repost repost = this.repost;
            if (repost == null) {
                return 0;
            }
            return repost.hashCode();
        }

        public final String toString() {
            return "Data(repost=" + this.repost + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0007HÆ\u0003J'\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation$OnPost;", "", "id", "", "postRepostStateData", "Lcom/medium/android/graphql/fragment/PostRepostStateData;", "postRepostCountData", "Lcom/medium/android/graphql/fragment/PostRepostCountData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostRepostStateData;Lcom/medium/android/graphql/fragment/PostRepostCountData;)V", "getId", "()Ljava/lang/String;", "getPostRepostStateData", "()Lcom/medium/android/graphql/fragment/PostRepostStateData;", "getPostRepostCountData", "()Lcom/medium/android/graphql/fragment/PostRepostCountData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation$OnRateLimited;", "", "rateLimitedMessage", "", "<init>", "(Ljava/lang/String;)V", "getRateLimitedMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRateLimited {
        private final String rateLimitedMessage;

        public OnRateLimited(String str) {
            this.rateLimitedMessage = str;
        }

        public static OnRateLimited copy$default(OnRateLimited onRateLimited, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRateLimited.rateLimitedMessage;
            }
            onRateLimited.getClass();
            return new OnRateLimited(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getRateLimitedMessage() {
            return this.rateLimitedMessage;
        }

        public final OnRateLimited copy(String rateLimitedMessage) {
            return new OnRateLimited(rateLimitedMessage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnRateLimited) && g76.L(this.rateLimitedMessage, ((OnRateLimited) other).rateLimitedMessage);
        }

        public final String getRateLimitedMessage() {
            return this.rateLimitedMessage;
        }

        public final int hashCode() {
            String str = this.rateLimitedMessage;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnRateLimited(rateLimitedMessage=", this.rateLimitedMessage, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation$OnRepostError;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation$Repost;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/RepostPostMutation$OnPost;", "onRepostError", "Lcom/medium/android/graphql/RepostPostMutation$OnRepostError;", "onRateLimited", "Lcom/medium/android/graphql/RepostPostMutation$OnRateLimited;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/RepostPostMutation$OnPost;Lcom/medium/android/graphql/RepostPostMutation$OnRepostError;Lcom/medium/android/graphql/RepostPostMutation$OnRateLimited;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/RepostPostMutation$OnPost;", "getOnRepostError", "()Lcom/medium/android/graphql/RepostPostMutation$OnRepostError;", "getOnRateLimited", "()Lcom/medium/android/graphql/RepostPostMutation$OnRateLimited;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Repost {
        private final String __typename;
        private final OnPost onPost;
        private final OnRateLimited onRateLimited;
        private final OnRepostError onRepostError;

        public Repost(String str, OnPost onPost, OnRepostError onRepostError, OnRateLimited onRateLimited) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost;
            this.onRepostError = onRepostError;
            this.onRateLimited = onRateLimited;
        }

        public static /* synthetic */ Repost copy$default(Repost repost, String str, OnPost onPost, OnRepostError onRepostError, OnRateLimited onRateLimited, int i, Object obj) {
            if ((i & 1) != 0) {
                str = repost.__typename;
            }
            if ((i & 2) != 0) {
                onPost = repost.onPost;
            }
            if ((i & 4) != 0) {
                onRepostError = repost.onRepostError;
            }
            if ((i & 8) != 0) {
                onRateLimited = repost.onRateLimited;
            }
            return repost.copy(str, onPost, onRepostError, onRateLimited);
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

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        public final Repost copy(String __typename, OnPost onPost, OnRepostError onRepostError, OnRateLimited onRateLimited) {
            __typename.getClass();
            return new Repost(__typename, onPost, onRepostError, onRateLimited);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Repost)) {
                return false;
            }
            Repost repost = (Repost) other;
            return g76.L(this.__typename, repost.__typename) && g76.L(this.onPost, repost.onPost) && g76.L(this.onRepostError, repost.onRepostError) && g76.L(this.onRateLimited, repost.onRateLimited);
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
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
            int iHashCode3 = (iHashCode2 + (onRepostError == null ? 0 : onRepostError.hashCode())) * 31;
            OnRateLimited onRateLimited = this.onRateLimited;
            return iHashCode3 + (onRateLimited != null ? onRateLimited.hashCode() : 0);
        }

        public final String toString() {
            return "Repost(__typename=" + this.__typename + ", onPost=" + this.onPost + ", onRepostError=" + this.onRepostError + ", onRateLimited=" + this.onRateLimited + ")";
        }
    }

    public RepostPostMutation(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.targetPostId = str;
        this.note = zv8Var;
    }

    public static /* synthetic */ RepostPostMutation copy$default(RepostPostMutation repostPostMutation, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = repostPostMutation.targetPostId;
        }
        if ((i & 2) != 0) {
            zv8Var = repostPostMutation.note;
        }
        return repostPostMutation.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(RepostPostMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getNote() {
        return this.note;
    }

    public final RepostPostMutation copy(String targetPostId, zv8 note) {
        targetPostId.getClass();
        note.getClass();
        return new RepostPostMutation(targetPostId, note);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation RepostPostMutation($targetPostId: ID!, $note: String) { repost(targetPostId: $targetPostId, note: $note) { __typename ... on Post { ...PostRepostStateData ...PostRepostCountData id } ... on RepostError { message } ... on RateLimited { rateLimitedMessage: message } } }  fragment PostRepostStateData on Post { __typename id allowReposts viewerEdge { __typename id hasReposted repostNote } }  fragment PostRepostCountData on Post { __typename id repostCount }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RepostPostMutation)) {
            return false;
        }
        RepostPostMutation repostPostMutation = (RepostPostMutation) other;
        return g76.L(this.targetPostId, repostPostMutation.targetPostId) && g76.L(this.note, repostPostMutation.note);
    }

    public final zv8 getNote() {
        return this.note;
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final int hashCode() {
        return this.note.hashCode() + (this.targetPostId.hashCode() * 31);
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
        List<sx1> list = RepostPostMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        RepostPostMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "RepostPostMutation(targetPostId=" + this.targetPostId + ", note=" + this.note + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/RepostPostMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation RepostPostMutation($targetPostId: ID!, $note: String) { repost(targetPostId: $targetPostId, note: $note) { __typename ... on Post { ...PostRepostStateData ...PostRepostCountData id } ... on RepostError { message } ... on RateLimited { rateLimitedMessage: message } } }  fragment PostRepostStateData on Post { __typename id allowReposts viewerEdge { __typename id hasReposted repostNote } }  fragment PostRepostCountData on Post { __typename id repostCount }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ RepostPostMutation(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
