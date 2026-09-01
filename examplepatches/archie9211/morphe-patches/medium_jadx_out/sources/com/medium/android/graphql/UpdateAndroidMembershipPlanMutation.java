package com.medium.android.graphql;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.graphql.adapter.UpdateAndroidMembershipPlanMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UpdateAndroidMembershipPlanMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.MutationSuccessData;
import com.medium.android.graphql.selections.UpdateAndroidMembershipPlanMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UpdateAndroidMembershipPlanInput;
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
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\b*+,-./0)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u00061"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation;", "Lv78;", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$Data;", "Lcom/medium/android/graphql/type/UpdateAndroidMembershipPlanInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/UpdateAndroidMembershipPlanInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/UpdateAndroidMembershipPlanInput;", "copy", "(Lcom/medium/android/graphql/type/UpdateAndroidMembershipPlanInput;)Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/UpdateAndroidMembershipPlanInput;", "getInput", "Companion", "Data", UpdateAndroidMembershipPlanMutation.OPERATION_NAME, "OnBadRequest", "OnUnauthorized", "OnNotFound", "OnForbidden", "OnConflict", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateAndroidMembershipPlanMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "7dae9b48745cbd36f9c450f4e107c096f905e6c0f1f9b88309e4e7175aad2673";
    public static final String OPERATION_NAME = "UpdateAndroidMembershipPlan";
    private final UpdateAndroidMembershipPlanInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$UpdateAndroidMembershipPlan;", "updateAndroidMembershipPlan", "<init>", "(Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$UpdateAndroidMembershipPlan;)V", "component1", "()Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$UpdateAndroidMembershipPlan;", "copy", "(Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$UpdateAndroidMembershipPlan;)Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$UpdateAndroidMembershipPlan;", "getUpdateAndroidMembershipPlan", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UpdateAndroidMembershipPlan updateAndroidMembershipPlan;

        public Data(UpdateAndroidMembershipPlan updateAndroidMembershipPlan) {
            updateAndroidMembershipPlan.getClass();
            this.updateAndroidMembershipPlan = updateAndroidMembershipPlan;
        }

        public static /* synthetic */ Data copy$default(Data data, UpdateAndroidMembershipPlan updateAndroidMembershipPlan, int i, Object obj) {
            if ((i & 1) != 0) {
                updateAndroidMembershipPlan = data.updateAndroidMembershipPlan;
            }
            return data.copy(updateAndroidMembershipPlan);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UpdateAndroidMembershipPlan getUpdateAndroidMembershipPlan() {
            return this.updateAndroidMembershipPlan;
        }

        public final Data copy(UpdateAndroidMembershipPlan updateAndroidMembershipPlan) {
            updateAndroidMembershipPlan.getClass();
            return new Data(updateAndroidMembershipPlan);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.updateAndroidMembershipPlan, ((Data) other).updateAndroidMembershipPlan);
        }

        public final UpdateAndroidMembershipPlan getUpdateAndroidMembershipPlan() {
            return this.updateAndroidMembershipPlan;
        }

        public final int hashCode() {
            return this.updateAndroidMembershipPlan.hashCode();
        }

        public final String toString() {
            return "Data(updateAndroidMembershipPlan=" + this.updateAndroidMembershipPlan + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnConflict;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnConflict {
        private final String message;

        public OnConflict(String str) {
            this.message = str;
        }

        public static OnConflict copy$default(OnConflict onConflict, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onConflict.message;
            }
            onConflict.getClass();
            return new OnConflict(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnConflict copy(String message) {
            return new OnConflict(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnConflict) && g76.L(this.message, ((OnConflict) other).message);
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
            return ev6.x("OnConflict(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnForbidden;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnForbidden {
        private final String message;

        public OnForbidden(String str) {
            this.message = str;
        }

        public static OnForbidden copy$default(OnForbidden onForbidden, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onForbidden.message;
            }
            onForbidden.getClass();
            return new OnForbidden(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnForbidden copy(String message) {
            return new OnForbidden(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnForbidden) && g76.L(this.message, ((OnForbidden) other).message);
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
            return ev6.x("OnForbidden(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u000fHÆ\u0003J[\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÆ\u0001J\u0013\u0010(\u001a\u00020)2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020,HÖ\u0001J\t\u0010-\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006."}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$UpdateAndroidMembershipPlan;", "", "__typename", "", "onBadRequest", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnBadRequest;", "onUnauthorized", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnUnauthorized;", "onNotFound", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnNotFound;", "onForbidden", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnForbidden;", "onConflict", "Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnConflict;", "mutationSuccessData", "Lcom/medium/android/graphql/fragment/MutationSuccessData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnBadRequest;Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnUnauthorized;Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnNotFound;Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnForbidden;Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnConflict;Lcom/medium/android/graphql/fragment/MutationSuccessData;)V", "get__typename", "()Ljava/lang/String;", "getOnBadRequest", "()Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnBadRequest;", "getOnUnauthorized", "()Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnUnauthorized;", "getOnNotFound", "()Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnNotFound;", "getOnForbidden", "()Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnForbidden;", "getOnConflict", "()Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$OnConflict;", "getMutationSuccessData", "()Lcom/medium/android/graphql/fragment/MutationSuccessData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UpdateAndroidMembershipPlan {
        private final String __typename;
        private final MutationSuccessData mutationSuccessData;
        private final OnBadRequest onBadRequest;
        private final OnConflict onConflict;
        private final OnForbidden onForbidden;
        private final OnNotFound onNotFound;
        private final OnUnauthorized onUnauthorized;

        public UpdateAndroidMembershipPlan(String str, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, OnNotFound onNotFound, OnForbidden onForbidden, OnConflict onConflict, MutationSuccessData mutationSuccessData) {
            str.getClass();
            this.__typename = str;
            this.onBadRequest = onBadRequest;
            this.onUnauthorized = onUnauthorized;
            this.onNotFound = onNotFound;
            this.onForbidden = onForbidden;
            this.onConflict = onConflict;
            this.mutationSuccessData = mutationSuccessData;
        }

        public static /* synthetic */ UpdateAndroidMembershipPlan copy$default(UpdateAndroidMembershipPlan updateAndroidMembershipPlan, String str, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, OnNotFound onNotFound, OnForbidden onForbidden, OnConflict onConflict, MutationSuccessData mutationSuccessData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = updateAndroidMembershipPlan.__typename;
            }
            if ((i & 2) != 0) {
                onBadRequest = updateAndroidMembershipPlan.onBadRequest;
            }
            if ((i & 4) != 0) {
                onUnauthorized = updateAndroidMembershipPlan.onUnauthorized;
            }
            if ((i & 8) != 0) {
                onNotFound = updateAndroidMembershipPlan.onNotFound;
            }
            if ((i & 16) != 0) {
                onForbidden = updateAndroidMembershipPlan.onForbidden;
            }
            if ((i & 32) != 0) {
                onConflict = updateAndroidMembershipPlan.onConflict;
            }
            if ((i & 64) != 0) {
                mutationSuccessData = updateAndroidMembershipPlan.mutationSuccessData;
            }
            OnConflict onConflict2 = onConflict;
            MutationSuccessData mutationSuccessData2 = mutationSuccessData;
            OnForbidden onForbidden2 = onForbidden;
            OnUnauthorized onUnauthorized2 = onUnauthorized;
            return updateAndroidMembershipPlan.copy(str, onBadRequest, onUnauthorized2, onNotFound, onForbidden2, onConflict2, mutationSuccessData2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnConflict getOnConflict() {
            return this.onConflict;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final MutationSuccessData getMutationSuccessData() {
            return this.mutationSuccessData;
        }

        public final UpdateAndroidMembershipPlan copy(String __typename, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, OnNotFound onNotFound, OnForbidden onForbidden, OnConflict onConflict, MutationSuccessData mutationSuccessData) {
            __typename.getClass();
            return new UpdateAndroidMembershipPlan(__typename, onBadRequest, onUnauthorized, onNotFound, onForbidden, onConflict, mutationSuccessData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UpdateAndroidMembershipPlan)) {
                return false;
            }
            UpdateAndroidMembershipPlan updateAndroidMembershipPlan = (UpdateAndroidMembershipPlan) other;
            return g76.L(this.__typename, updateAndroidMembershipPlan.__typename) && g76.L(this.onBadRequest, updateAndroidMembershipPlan.onBadRequest) && g76.L(this.onUnauthorized, updateAndroidMembershipPlan.onUnauthorized) && g76.L(this.onNotFound, updateAndroidMembershipPlan.onNotFound) && g76.L(this.onForbidden, updateAndroidMembershipPlan.onForbidden) && g76.L(this.onConflict, updateAndroidMembershipPlan.onConflict) && g76.L(this.mutationSuccessData, updateAndroidMembershipPlan.mutationSuccessData);
        }

        public final MutationSuccessData getMutationSuccessData() {
            return this.mutationSuccessData;
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnConflict getOnConflict() {
            return this.onConflict;
        }

        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode2 = (iHashCode + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            int iHashCode3 = (iHashCode2 + (onUnauthorized == null ? 0 : onUnauthorized.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnForbidden onForbidden = this.onForbidden;
            int iHashCode5 = (iHashCode4 + (onForbidden == null ? 0 : onForbidden.hashCode())) * 31;
            OnConflict onConflict = this.onConflict;
            int iHashCode6 = (iHashCode5 + (onConflict == null ? 0 : onConflict.hashCode())) * 31;
            MutationSuccessData mutationSuccessData = this.mutationSuccessData;
            return iHashCode6 + (mutationSuccessData != null ? mutationSuccessData.hashCode() : 0);
        }

        public final String toString() {
            return "UpdateAndroidMembershipPlan(__typename=" + this.__typename + ", onBadRequest=" + this.onBadRequest + ", onUnauthorized=" + this.onUnauthorized + ", onNotFound=" + this.onNotFound + ", onForbidden=" + this.onForbidden + ", onConflict=" + this.onConflict + PdtluglzAX.ypXcTeq + this.mutationSuccessData + ")";
        }
    }

    public UpdateAndroidMembershipPlanMutation(UpdateAndroidMembershipPlanInput updateAndroidMembershipPlanInput) {
        updateAndroidMembershipPlanInput.getClass();
        this.input = updateAndroidMembershipPlanInput;
    }

    public static /* synthetic */ UpdateAndroidMembershipPlanMutation copy$default(UpdateAndroidMembershipPlanMutation updateAndroidMembershipPlanMutation, UpdateAndroidMembershipPlanInput updateAndroidMembershipPlanInput, int i, Object obj) {
        if ((i & 1) != 0) {
            updateAndroidMembershipPlanInput = updateAndroidMembershipPlanMutation.input;
        }
        return updateAndroidMembershipPlanMutation.copy(updateAndroidMembershipPlanInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UpdateAndroidMembershipPlanMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final UpdateAndroidMembershipPlanInput getInput() {
        return this.input;
    }

    public final UpdateAndroidMembershipPlanMutation copy(UpdateAndroidMembershipPlanInput input) {
        input.getClass();
        return new UpdateAndroidMembershipPlanMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UpdateAndroidMembershipPlan($input: UpdateAndroidMembershipPlanInput!) { updateAndroidMembershipPlan(input: $input) { __typename ...MutationSuccessData ... on BadRequest { message } ... on Unauthorized { message } ... on NotFound { message } ... on Forbidden { message } ... on Conflict { message } } }  fragment MutationSuccessData on MutationSuccess { __typename success }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UpdateAndroidMembershipPlanMutation) && g76.L(this.input, ((UpdateAndroidMembershipPlanMutation) other).input);
    }

    public final UpdateAndroidMembershipPlanInput getInput() {
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
        List<sx1> list = UpdateAndroidMembershipPlanMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UpdateAndroidMembershipPlanMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "UpdateAndroidMembershipPlanMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UpdateAndroidMembershipPlanMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UpdateAndroidMembershipPlan($input: UpdateAndroidMembershipPlanInput!) { updateAndroidMembershipPlan(input: $input) { __typename ...MutationSuccessData ... on BadRequest { message } ... on Unauthorized { message } ... on NotFound { message } ... on Forbidden { message } ... on Conflict { message } } }  fragment MutationSuccessData on MutationSuccess { __typename success }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
