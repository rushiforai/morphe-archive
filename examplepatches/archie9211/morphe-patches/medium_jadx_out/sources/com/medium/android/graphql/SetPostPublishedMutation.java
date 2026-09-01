package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SetPostPublishedMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SetPostPublishedMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SetPostPublishedMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.SetPostPublishedInput;
import defpackage.ae6;
import defpackage.b09;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0011\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000b*+,-./0123)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u00064"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation;", "Lv78;", "Lcom/medium/android/graphql/SetPostPublishedMutation$Data;", "Lcom/medium/android/graphql/type/SetPostPublishedInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/SetPostPublishedInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/SetPostPublishedInput;", "copy", "(Lcom/medium/android/graphql/type/SetPostPublishedInput;)Lcom/medium/android/graphql/SetPostPublishedMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/SetPostPublishedInput;", "getInput", "Companion", "Data", "SetPostPublished", "OnMutationSuccess", "OnRateLimited", "OnAccountSuspended", "OnPublishingRestrictedBannedLinks", "OnUnauthorized", "OnNotFound", "OnBadRequest", "OnAlreadyExists", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostPublishedMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "a35c5eb7e047ad7c9b3fd3ca7715eea7df1b87f2e8a6ce7e816af3ba4ed68df2";
    public static final String OPERATION_NAME = "SetPostPublishedMutation";
    private final SetPostPublishedInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SetPostPublishedMutation$SetPostPublished;", "setPostPublished", "<init>", "(Lcom/medium/android/graphql/SetPostPublishedMutation$SetPostPublished;)V", "component1", "()Lcom/medium/android/graphql/SetPostPublishedMutation$SetPostPublished;", "copy", "(Lcom/medium/android/graphql/SetPostPublishedMutation$SetPostPublished;)Lcom/medium/android/graphql/SetPostPublishedMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SetPostPublishedMutation$SetPostPublished;", "getSetPostPublished", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostPublished setPostPublished;

        public Data(SetPostPublished setPostPublished) {
            setPostPublished.getClass();
            this.setPostPublished = setPostPublished;
        }

        public static /* synthetic */ Data copy$default(Data data, SetPostPublished setPostPublished, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostPublished = data.setPostPublished;
            }
            return data.copy(setPostPublished);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostPublished getSetPostPublished() {
            return this.setPostPublished;
        }

        public final Data copy(SetPostPublished setPostPublished) {
            setPostPublished.getClass();
            return new Data(setPostPublished);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostPublished, ((Data) other).setPostPublished);
        }

        public final SetPostPublished getSetPostPublished() {
            return this.setPostPublished;
        }

        public final int hashCode() {
            return this.setPostPublished.hashCode();
        }

        public final String toString() {
            return "Data(setPostPublished=" + this.setPostPublished + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnAccountSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAccountSuspended {
        private final String message;

        public OnAccountSuspended(String str) {
            this.message = str;
        }

        public static OnAccountSuspended copy$default(OnAccountSuspended onAccountSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAccountSuspended.message;
            }
            onAccountSuspended.getClass();
            return new OnAccountSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnAccountSuspended copy(String message) {
            return new OnAccountSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnAccountSuspended) && g76.L(this.message, ((OnAccountSuspended) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnAccountSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnAlreadyExists;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAlreadyExists {
        private final String message;

        public OnAlreadyExists(String str) {
            this.message = str;
        }

        public static OnAlreadyExists copy$default(OnAlreadyExists onAlreadyExists, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAlreadyExists.message;
            }
            onAlreadyExists.getClass();
            return new OnAlreadyExists(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnAlreadyExists copy(String message) {
            return new OnAlreadyExists(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnAlreadyExists) && g76.L(this.message, ((OnAlreadyExists) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnAlreadyExists(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBadRequest {
        private final String message;

        public OnBadRequest(String str) {
            this.message = str;
        }

        public static OnBadRequest copy$default(OnBadRequest onBadRequest, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBadRequest.message;
            }
            onBadRequest.getClass();
            return new OnBadRequest(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBadRequest copy(String message) {
            return new OnBadRequest(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBadRequest) && g76.L(this.message, ((OnBadRequest) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnBadRequest(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnMutationSuccess;", "", "success", "", "<init>", "(Z)V", "getSuccess", "()Z", "component1", "copy", "equals", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMutationSuccess {
        private final boolean success;

        public OnMutationSuccess(boolean z) {
            this.success = z;
        }

        public static OnMutationSuccess copy$default(OnMutationSuccess onMutationSuccess, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                z = onMutationSuccess.success;
            }
            onMutationSuccess.getClass();
            return new OnMutationSuccess(z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final boolean getSuccess() {
            return this.success;
        }

        public final OnMutationSuccess copy(boolean success) {
            return new OnMutationSuccess(success);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMutationSuccess) && this.success == ((OnMutationSuccess) other).success;
        }

        public final boolean getSuccess() {
            return this.success;
        }

        public final int hashCode() {
            return this.success ? 1231 : 1237;
        }

        public final String toString() {
            return b09.z("OnMutationSuccess(success=", ")", this.success);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnNotFound {
        private final String message;

        public OnNotFound(String str) {
            this.message = str;
        }

        public static OnNotFound copy$default(OnNotFound onNotFound, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onNotFound.message;
            }
            onNotFound.getClass();
            return new OnNotFound(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnNotFound copy(String message) {
            return new OnNotFound(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnNotFound) && g76.L(this.message, ((OnNotFound) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnNotFound(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnPublishingRestrictedBannedLinks;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublishingRestrictedBannedLinks {
        private final String message;

        public OnPublishingRestrictedBannedLinks(String str) {
            this.message = str;
        }

        public static OnPublishingRestrictedBannedLinks copy$default(OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPublishingRestrictedBannedLinks.message;
            }
            onPublishingRestrictedBannedLinks.getClass();
            return new OnPublishingRestrictedBannedLinks(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnPublishingRestrictedBannedLinks copy(String message) {
            return new OnPublishingRestrictedBannedLinks(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPublishingRestrictedBannedLinks) && g76.L(this.message, ((OnPublishingRestrictedBannedLinks) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnPublishingRestrictedBannedLinks(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnRateLimited;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRateLimited {
        private final String message;

        public OnRateLimited(String str) {
            this.message = str;
        }

        public static OnRateLimited copy$default(OnRateLimited onRateLimited, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRateLimited.message;
            }
            onRateLimited.getClass();
            return new OnRateLimited(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnRateLimited copy(String message) {
            return new OnRateLimited(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnRateLimited) && g76.L(this.message, ((OnRateLimited) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnRateLimited(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUnauthorized {
        private final String message;

        public OnUnauthorized(String str) {
            this.message = str;
        }

        public static OnUnauthorized copy$default(OnUnauthorized onUnauthorized, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUnauthorized.message;
            }
            onUnauthorized.getClass();
            return new OnUnauthorized(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnUnauthorized copy(String message) {
            return new OnUnauthorized(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUnauthorized) && g76.L(this.message, ((OnUnauthorized) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnUnauthorized(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B_\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\u0004\b\u0014\u0010\u0015J\t\u0010(\u001a\u00020\u0003HÆ\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010*\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010+\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010,\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010-\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010.\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\u000b\u0010/\u001a\u0004\u0018\u00010\u0011HÆ\u0003J\u000b\u00100\u001a\u0004\u0018\u00010\u0013HÆ\u0003Js\u00101\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0013HÆ\u0001J\u0013\u00102\u001a\u0002032\b\u00104\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00105\u001a\u000206HÖ\u0001J\t\u00107\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b \u0010!R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\b\n\u0000\u001a\u0004\b&\u0010'¨\u00068"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$SetPostPublished;", "", "__typename", "", "onMutationSuccess", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnMutationSuccess;", "onRateLimited", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnRateLimited;", "onAccountSuspended", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnAccountSuspended;", "onPublishingRestrictedBannedLinks", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnPublishingRestrictedBannedLinks;", "onUnauthorized", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnUnauthorized;", "onNotFound", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnNotFound;", "onBadRequest", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnBadRequest;", "onAlreadyExists", "Lcom/medium/android/graphql/SetPostPublishedMutation$OnAlreadyExists;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/SetPostPublishedMutation$OnMutationSuccess;Lcom/medium/android/graphql/SetPostPublishedMutation$OnRateLimited;Lcom/medium/android/graphql/SetPostPublishedMutation$OnAccountSuspended;Lcom/medium/android/graphql/SetPostPublishedMutation$OnPublishingRestrictedBannedLinks;Lcom/medium/android/graphql/SetPostPublishedMutation$OnUnauthorized;Lcom/medium/android/graphql/SetPostPublishedMutation$OnNotFound;Lcom/medium/android/graphql/SetPostPublishedMutation$OnBadRequest;Lcom/medium/android/graphql/SetPostPublishedMutation$OnAlreadyExists;)V", "get__typename", "()Ljava/lang/String;", "getOnMutationSuccess", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnMutationSuccess;", "getOnRateLimited", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnRateLimited;", "getOnAccountSuspended", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnAccountSuspended;", "getOnPublishingRestrictedBannedLinks", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnPublishingRestrictedBannedLinks;", "getOnUnauthorized", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnUnauthorized;", "getOnNotFound", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnNotFound;", "getOnBadRequest", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnBadRequest;", "getOnAlreadyExists", "()Lcom/medium/android/graphql/SetPostPublishedMutation$OnAlreadyExists;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostPublished {
        private final String __typename;
        private final OnAccountSuspended onAccountSuspended;
        private final OnAlreadyExists onAlreadyExists;
        private final OnBadRequest onBadRequest;
        private final OnMutationSuccess onMutationSuccess;
        private final OnNotFound onNotFound;
        private final OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks;
        private final OnRateLimited onRateLimited;
        private final OnUnauthorized onUnauthorized;

        public SetPostPublished(String str, OnMutationSuccess onMutationSuccess, OnRateLimited onRateLimited, OnAccountSuspended onAccountSuspended, OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks, OnUnauthorized onUnauthorized, OnNotFound onNotFound, OnBadRequest onBadRequest, OnAlreadyExists onAlreadyExists) {
            str.getClass();
            this.__typename = str;
            this.onMutationSuccess = onMutationSuccess;
            this.onRateLimited = onRateLimited;
            this.onAccountSuspended = onAccountSuspended;
            this.onPublishingRestrictedBannedLinks = onPublishingRestrictedBannedLinks;
            this.onUnauthorized = onUnauthorized;
            this.onNotFound = onNotFound;
            this.onBadRequest = onBadRequest;
            this.onAlreadyExists = onAlreadyExists;
        }

        public static /* synthetic */ SetPostPublished copy$default(SetPostPublished setPostPublished, String str, OnMutationSuccess onMutationSuccess, OnRateLimited onRateLimited, OnAccountSuspended onAccountSuspended, OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks, OnUnauthorized onUnauthorized, OnNotFound onNotFound, OnBadRequest onBadRequest, OnAlreadyExists onAlreadyExists, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostPublished.__typename;
            }
            if ((i & 2) != 0) {
                onMutationSuccess = setPostPublished.onMutationSuccess;
            }
            if ((i & 4) != 0) {
                onRateLimited = setPostPublished.onRateLimited;
            }
            if ((i & 8) != 0) {
                onAccountSuspended = setPostPublished.onAccountSuspended;
            }
            if ((i & 16) != 0) {
                onPublishingRestrictedBannedLinks = setPostPublished.onPublishingRestrictedBannedLinks;
            }
            if ((i & 32) != 0) {
                onUnauthorized = setPostPublished.onUnauthorized;
            }
            if ((i & 64) != 0) {
                onNotFound = setPostPublished.onNotFound;
            }
            if ((i & 128) != 0) {
                onBadRequest = setPostPublished.onBadRequest;
            }
            if ((i & 256) != 0) {
                onAlreadyExists = setPostPublished.onAlreadyExists;
            }
            OnBadRequest onBadRequest2 = onBadRequest;
            OnAlreadyExists onAlreadyExists2 = onAlreadyExists;
            OnUnauthorized onUnauthorized2 = onUnauthorized;
            OnNotFound onNotFound2 = onNotFound;
            OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks2 = onPublishingRestrictedBannedLinks;
            OnRateLimited onRateLimited2 = onRateLimited;
            return setPostPublished.copy(str, onMutationSuccess, onRateLimited2, onAccountSuspended, onPublishingRestrictedBannedLinks2, onUnauthorized2, onNotFound2, onBadRequest2, onAlreadyExists2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnMutationSuccess getOnMutationSuccess() {
            return this.onMutationSuccess;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnPublishingRestrictedBannedLinks getOnPublishingRestrictedBannedLinks() {
            return this.onPublishingRestrictedBannedLinks;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final OnAlreadyExists getOnAlreadyExists() {
            return this.onAlreadyExists;
        }

        public final SetPostPublished copy(String __typename, OnMutationSuccess onMutationSuccess, OnRateLimited onRateLimited, OnAccountSuspended onAccountSuspended, OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks, OnUnauthorized onUnauthorized, OnNotFound onNotFound, OnBadRequest onBadRequest, OnAlreadyExists onAlreadyExists) {
            __typename.getClass();
            return new SetPostPublished(__typename, onMutationSuccess, onRateLimited, onAccountSuspended, onPublishingRestrictedBannedLinks, onUnauthorized, onNotFound, onBadRequest, onAlreadyExists);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostPublished)) {
                return false;
            }
            SetPostPublished setPostPublished = (SetPostPublished) other;
            return g76.L(this.__typename, setPostPublished.__typename) && g76.L(this.onMutationSuccess, setPostPublished.onMutationSuccess) && g76.L(this.onRateLimited, setPostPublished.onRateLimited) && g76.L(this.onAccountSuspended, setPostPublished.onAccountSuspended) && g76.L(this.onPublishingRestrictedBannedLinks, setPostPublished.onPublishingRestrictedBannedLinks) && g76.L(this.onUnauthorized, setPostPublished.onUnauthorized) && g76.L(this.onNotFound, setPostPublished.onNotFound) && g76.L(this.onBadRequest, setPostPublished.onBadRequest) && g76.L(this.onAlreadyExists, setPostPublished.onAlreadyExists);
        }

        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final OnAlreadyExists getOnAlreadyExists() {
            return this.onAlreadyExists;
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnMutationSuccess getOnMutationSuccess() {
            return this.onMutationSuccess;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnPublishingRestrictedBannedLinks getOnPublishingRestrictedBannedLinks() {
            return this.onPublishingRestrictedBannedLinks;
        }

        public final OnRateLimited getOnRateLimited() {
            return this.onRateLimited;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnMutationSuccess onMutationSuccess = this.onMutationSuccess;
            int iHashCode2 = (iHashCode + (onMutationSuccess == null ? 0 : onMutationSuccess.hashCode())) * 31;
            OnRateLimited onRateLimited = this.onRateLimited;
            int iHashCode3 = (iHashCode2 + (onRateLimited == null ? 0 : onRateLimited.hashCode())) * 31;
            OnAccountSuspended onAccountSuspended = this.onAccountSuspended;
            int iHashCode4 = (iHashCode3 + (onAccountSuspended == null ? 0 : onAccountSuspended.hashCode())) * 31;
            OnPublishingRestrictedBannedLinks onPublishingRestrictedBannedLinks = this.onPublishingRestrictedBannedLinks;
            int iHashCode5 = (iHashCode4 + (onPublishingRestrictedBannedLinks == null ? 0 : onPublishingRestrictedBannedLinks.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            int iHashCode6 = (iHashCode5 + (onUnauthorized == null ? 0 : onUnauthorized.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode7 = (iHashCode6 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode8 = (iHashCode7 + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnAlreadyExists onAlreadyExists = this.onAlreadyExists;
            return iHashCode8 + (onAlreadyExists != null ? onAlreadyExists.hashCode() : 0);
        }

        public final String toString() {
            return "SetPostPublished(__typename=" + this.__typename + ", onMutationSuccess=" + this.onMutationSuccess + ", onRateLimited=" + this.onRateLimited + ", onAccountSuspended=" + this.onAccountSuspended + ", onPublishingRestrictedBannedLinks=" + this.onPublishingRestrictedBannedLinks + ", onUnauthorized=" + this.onUnauthorized + ", onNotFound=" + this.onNotFound + ", onBadRequest=" + this.onBadRequest + ", onAlreadyExists=" + this.onAlreadyExists + ")";
        }
    }

    public SetPostPublishedMutation(SetPostPublishedInput setPostPublishedInput) {
        setPostPublishedInput.getClass();
        this.input = setPostPublishedInput;
    }

    public static /* synthetic */ SetPostPublishedMutation copy$default(SetPostPublishedMutation setPostPublishedMutation, SetPostPublishedInput setPostPublishedInput, int i, Object obj) {
        if ((i & 1) != 0) {
            setPostPublishedInput = setPostPublishedMutation.input;
        }
        return setPostPublishedMutation.copy(setPostPublishedInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SetPostPublishedMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final SetPostPublishedInput getInput() {
        return this.input;
    }

    public final SetPostPublishedMutation copy(SetPostPublishedInput input) {
        input.getClass();
        return new SetPostPublishedMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SetPostPublishedMutation($input: SetPostPublishedInput!) { setPostPublished(input: $input) { __typename ... on MutationSuccess { success } ... on RateLimited { message } ... on AccountSuspended { message } ... on PublishingRestrictedBannedLinks { message } ... on Unauthorized { message } ... on NotFound { message } ... on BadRequest { message } ... on AlreadyExists { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SetPostPublishedMutation) && g76.L(this.input, ((SetPostPublishedMutation) other).input);
    }

    public final SetPostPublishedInput getInput() {
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
        List<sx1> list = SetPostPublishedMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SetPostPublishedMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SetPostPublishedMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SetPostPublishedMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SetPostPublishedMutation($input: SetPostPublishedInput!) { setPostPublished(input: $input) { __typename ... on MutationSuccess { success } ... on RateLimited { message } ... on AccountSuspended { message } ... on PublishingRestrictedBannedLinks { message } ... on Unauthorized { message } ... on NotFound { message } ... on BadRequest { message } ... on AlreadyExists { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
