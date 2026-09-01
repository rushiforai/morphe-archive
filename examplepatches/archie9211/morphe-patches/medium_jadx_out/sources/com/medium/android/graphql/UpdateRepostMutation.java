package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UpdateRepostMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UpdateRepostMutation_VariablesAdapter;
import com.medium.android.graphql.selections.UpdateRepostMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UpdateRepostInput;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006*+,-.)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation;", "Lv78;", "Lcom/medium/android/graphql/UpdateRepostMutation$Data;", "Lcom/medium/android/graphql/type/UpdateRepostInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/UpdateRepostInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/UpdateRepostInput;", "copy", "(Lcom/medium/android/graphql/type/UpdateRepostInput;)Lcom/medium/android/graphql/UpdateRepostMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/UpdateRepostInput;", "getInput", "Companion", "Data", "UpdateRepost", "OnRepost", "OnRepostError", "OnRateLimited", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateRepostMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "da587ec1533df948c40f5d6aa2cf313e2b59b19877ddba981dff34cb36ca81fc";
    public static final String OPERATION_NAME = "UpdateRepostMutation";
    private final UpdateRepostInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UpdateRepostMutation$UpdateRepost;", "updateRepost", "<init>", "(Lcom/medium/android/graphql/UpdateRepostMutation$UpdateRepost;)V", "component1", "()Lcom/medium/android/graphql/UpdateRepostMutation$UpdateRepost;", "copy", "(Lcom/medium/android/graphql/UpdateRepostMutation$UpdateRepost;)Lcom/medium/android/graphql/UpdateRepostMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UpdateRepostMutation$UpdateRepost;", "getUpdateRepost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UpdateRepost updateRepost;

        public Data(UpdateRepost updateRepost) {
            this.updateRepost = updateRepost;
        }

        public static Data copy$default(Data data, UpdateRepost updateRepost, int i, Object obj) {
            if ((i & 1) != 0) {
                updateRepost = data.updateRepost;
            }
            data.getClass();
            return new Data(updateRepost);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UpdateRepost getUpdateRepost() {
            return this.updateRepost;
        }

        public final Data copy(UpdateRepost updateRepost) {
            return new Data(updateRepost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.updateRepost, ((Data) other).updateRepost);
        }

        public final UpdateRepost getUpdateRepost() {
            return this.updateRepost;
        }

        public final int hashCode() {
            UpdateRepost updateRepost = this.updateRepost;
            if (updateRepost == null) {
                return 0;
            }
            return updateRepost.hashCode();
        }

        public final String toString() {
            return "Data(updateRepost=" + this.updateRepost + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation$OnRateLimited;", "", "rateLimitedMessage", "", "<init>", "(Ljava/lang/String;)V", "getRateLimitedMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation$OnRepost;", "", "postId", "", "note", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getPostId", "()Ljava/lang/String;", "getNote", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRepost {
        private final String note;
        private final String postId;

        public OnRepost(String str, String str2) {
            str.getClass();
            this.postId = str;
            this.note = str2;
        }

        public static /* synthetic */ OnRepost copy$default(OnRepost onRepost, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRepost.postId;
            }
            if ((i & 2) != 0) {
                str2 = onRepost.note;
            }
            return onRepost.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getPostId() {
            return this.postId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNote() {
            return this.note;
        }

        public final OnRepost copy(String postId, String note) {
            postId.getClass();
            return new OnRepost(postId, note);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnRepost)) {
                return false;
            }
            OnRepost onRepost = (OnRepost) other;
            return g76.L(this.postId, onRepost.postId) && g76.L(this.note, onRepost.note);
        }

        public final String getNote() {
            return this.note;
        }

        public final String getPostId() {
            return this.postId;
        }

        public final int hashCode() {
            int iHashCode = this.postId.hashCode() * 31;
            String str = this.note;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return ev6.y("OnRepost(postId=", this.postId, ", note=", this.note, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation$OnRepostError;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation$UpdateRepost;", "", "__typename", "", "onRepost", "Lcom/medium/android/graphql/UpdateRepostMutation$OnRepost;", "onRepostError", "Lcom/medium/android/graphql/UpdateRepostMutation$OnRepostError;", "onRateLimited", "Lcom/medium/android/graphql/UpdateRepostMutation$OnRateLimited;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateRepostMutation$OnRepost;Lcom/medium/android/graphql/UpdateRepostMutation$OnRepostError;Lcom/medium/android/graphql/UpdateRepostMutation$OnRateLimited;)V", "get__typename", "()Ljava/lang/String;", "getOnRepost", "()Lcom/medium/android/graphql/UpdateRepostMutation$OnRepost;", "getOnRepostError", "()Lcom/medium/android/graphql/UpdateRepostMutation$OnRepostError;", "getOnRateLimited", "()Lcom/medium/android/graphql/UpdateRepostMutation$OnRateLimited;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UpdateRepost {
        private final String __typename;
        private final OnRateLimited onRateLimited;
        private final OnRepost onRepost;
        private final OnRepostError onRepostError;

        public UpdateRepost(String str, OnRepost onRepost, OnRepostError onRepostError, OnRateLimited onRateLimited) {
            str.getClass();
            this.__typename = str;
            this.onRepost = onRepost;
            this.onRepostError = onRepostError;
            this.onRateLimited = onRateLimited;
        }

        public static /* synthetic */ UpdateRepost copy$default(UpdateRepost updateRepost, String str, OnRepost onRepost, OnRepostError onRepostError, OnRateLimited onRateLimited, int i, Object obj) {
            if ((i & 1) != 0) {
                str = updateRepost.__typename;
            }
            if ((i & 2) != 0) {
                onRepost = updateRepost.onRepost;
            }
            if ((i & 4) != 0) {
                onRepostError = updateRepost.onRepostError;
            }
            if ((i & 8) != 0) {
                onRateLimited = updateRepost.onRateLimited;
            }
            return updateRepost.copy(str, onRepost, onRepostError, onRateLimited);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnRepost getOnRepost() {
            return this.onRepost;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnRepostError getOnRepostError() {
            return this.onRepostError;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        public final UpdateRepost copy(String __typename, OnRepost onRepost, OnRepostError onRepostError, OnRateLimited onRateLimited) {
            __typename.getClass();
            return new UpdateRepost(__typename, onRepost, onRepostError, onRateLimited);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UpdateRepost)) {
                return false;
            }
            UpdateRepost updateRepost = (UpdateRepost) other;
            return g76.L(this.__typename, updateRepost.__typename) && g76.L(this.onRepost, updateRepost.onRepost) && g76.L(this.onRepostError, updateRepost.onRepostError) && g76.L(this.onRateLimited, updateRepost.onRateLimited);
        }

        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        public final OnRepost getOnRepost() {
            return this.onRepost;
        }

        public final OnRepostError getOnRepostError() {
            return this.onRepostError;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnRepost onRepost = this.onRepost;
            int iHashCode2 = (iHashCode + (onRepost == null ? 0 : onRepost.hashCode())) * 31;
            OnRepostError onRepostError = this.onRepostError;
            int iHashCode3 = (iHashCode2 + (onRepostError == null ? 0 : onRepostError.hashCode())) * 31;
            OnRateLimited onRateLimited = this.onRateLimited;
            return iHashCode3 + (onRateLimited != null ? onRateLimited.hashCode() : 0);
        }

        public final String toString() {
            return "UpdateRepost(__typename=" + this.__typename + ", onRepost=" + this.onRepost + ", onRepostError=" + this.onRepostError + ", onRateLimited=" + this.onRateLimited + ")";
        }
    }

    public UpdateRepostMutation(UpdateRepostInput updateRepostInput) {
        updateRepostInput.getClass();
        this.input = updateRepostInput;
    }

    public static /* synthetic */ UpdateRepostMutation copy$default(UpdateRepostMutation updateRepostMutation, UpdateRepostInput updateRepostInput, int i, Object obj) {
        if ((i & 1) != 0) {
            updateRepostInput = updateRepostMutation.input;
        }
        return updateRepostMutation.copy(updateRepostInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UpdateRepostMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final UpdateRepostInput getInput() {
        return this.input;
    }

    public final UpdateRepostMutation copy(UpdateRepostInput input) {
        input.getClass();
        return new UpdateRepostMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UpdateRepostMutation($input: UpdateRepostInput!) { updateRepost(input: $input) { __typename ... on Repost { postId note } ... on RepostError { message } ... on RateLimited { rateLimitedMessage: message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UpdateRepostMutation) && g76.L(this.input, ((UpdateRepostMutation) other).input);
    }

    public final UpdateRepostInput getInput() {
        return this.input;
    }

    public final int hashCode() {
        return this.input.hashCode();
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
        List<sx1> list = UpdateRepostMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UpdateRepostMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "UpdateRepostMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UpdateRepostMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UpdateRepostMutation($input: UpdateRepostInput!) { updateRepost(input: $input) { __typename ... on Repost { postId note } ... on RepostError { message } ... on RateLimited { rateLimitedMessage: message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
