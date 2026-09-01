package com.medium.android.graphql;

import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.graphql.adapter.UpdateUserPreferenceValueMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UpdateUserPreferenceValueMutation_VariablesAdapter;
import com.medium.android.graphql.selections.UpdateUserPreferenceValueMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UserPreferenceInput;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007/01234.B\u001d\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0016\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ*\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00122\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u001d\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001f¨\u00065"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation;", "Lv78;", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$Data;", "", "userId", "", "Lcom/medium/android/graphql/type/UserPreferenceInput;", "preferences", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Ljava/util/List;", "getPreferences", "Companion", "Data", "UpdateUserPreferences", "OnMutationSuccess", "OnBadRequest", "OnUnauthorized", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateUserPreferenceValueMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "7c3c2cd10f1cdaf0158617a09783483ae7e70c7b335dcc1b512861b1a433de20";
    public static final String OPERATION_NAME = "UpdateUserPreferenceValueMutation";
    private final List<UserPreferenceInput> preferences;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$UpdateUserPreferences;", "updateUserPreferences", "<init>", "(Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$UpdateUserPreferences;)V", "component1", "()Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$UpdateUserPreferences;", "copy", "(Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$UpdateUserPreferences;)Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$UpdateUserPreferences;", "getUpdateUserPreferences", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UpdateUserPreferences updateUserPreferences;

        public Data(UpdateUserPreferences updateUserPreferences) {
            updateUserPreferences.getClass();
            this.updateUserPreferences = updateUserPreferences;
        }

        public static /* synthetic */ Data copy$default(Data data, UpdateUserPreferences updateUserPreferences, int i, Object obj) {
            if ((i & 1) != 0) {
                updateUserPreferences = data.updateUserPreferences;
            }
            return data.copy(updateUserPreferences);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UpdateUserPreferences getUpdateUserPreferences() {
            return this.updateUserPreferences;
        }

        public final Data copy(UpdateUserPreferences updateUserPreferences) {
            updateUserPreferences.getClass();
            return new Data(updateUserPreferences);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.updateUserPreferences, ((Data) other).updateUserPreferences);
        }

        public final UpdateUserPreferences getUpdateUserPreferences() {
            return this.updateUserPreferences;
        }

        public final int hashCode() {
            return this.updateUserPreferences.hashCode();
        }

        public final String toString() {
            return "Data(updateUserPreferences=" + this.updateUserPreferences + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnMutationSuccess;", "", "success", "", "<init>", "(Z)V", "getSuccess", "()Z", "component1", "copy", "equals", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return ev6.x(bPUi.BIYP, this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u000bHÆ\u0003JC\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$UpdateUserPreferences;", "", "__typename", "", "onMutationSuccess", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnMutationSuccess;", "onBadRequest", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnBadRequest;", "onUnauthorized", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnUnauthorized;", "onNotFound", "Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnNotFound;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnMutationSuccess;Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnBadRequest;Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnUnauthorized;Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnNotFound;)V", "get__typename", "()Ljava/lang/String;", "getOnMutationSuccess", "()Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnMutationSuccess;", "getOnBadRequest", "()Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnBadRequest;", "getOnUnauthorized", "()Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnUnauthorized;", "getOnNotFound", "()Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$OnNotFound;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UpdateUserPreferences {
        private final String __typename;
        private final OnBadRequest onBadRequest;
        private final OnMutationSuccess onMutationSuccess;
        private final OnNotFound onNotFound;
        private final OnUnauthorized onUnauthorized;

        public UpdateUserPreferences(String str, OnMutationSuccess onMutationSuccess, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, OnNotFound onNotFound) {
            str.getClass();
            this.__typename = str;
            this.onMutationSuccess = onMutationSuccess;
            this.onBadRequest = onBadRequest;
            this.onUnauthorized = onUnauthorized;
            this.onNotFound = onNotFound;
        }

        public static /* synthetic */ UpdateUserPreferences copy$default(UpdateUserPreferences updateUserPreferences, String str, OnMutationSuccess onMutationSuccess, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, OnNotFound onNotFound, int i, Object obj) {
            if ((i & 1) != 0) {
                str = updateUserPreferences.__typename;
            }
            if ((i & 2) != 0) {
                onMutationSuccess = updateUserPreferences.onMutationSuccess;
            }
            if ((i & 4) != 0) {
                onBadRequest = updateUserPreferences.onBadRequest;
            }
            if ((i & 8) != 0) {
                onUnauthorized = updateUserPreferences.onUnauthorized;
            }
            if ((i & 16) != 0) {
                onNotFound = updateUserPreferences.onNotFound;
            }
            OnNotFound onNotFound2 = onNotFound;
            OnBadRequest onBadRequest2 = onBadRequest;
            return updateUserPreferences.copy(str, onMutationSuccess, onBadRequest2, onUnauthorized, onNotFound2);
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
        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final UpdateUserPreferences copy(String __typename, OnMutationSuccess onMutationSuccess, OnBadRequest onBadRequest, OnUnauthorized onUnauthorized, OnNotFound onNotFound) {
            __typename.getClass();
            return new UpdateUserPreferences(__typename, onMutationSuccess, onBadRequest, onUnauthorized, onNotFound);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UpdateUserPreferences)) {
                return false;
            }
            UpdateUserPreferences updateUserPreferences = (UpdateUserPreferences) other;
            return g76.L(this.__typename, updateUserPreferences.__typename) && g76.L(this.onMutationSuccess, updateUserPreferences.onMutationSuccess) && g76.L(this.onBadRequest, updateUserPreferences.onBadRequest) && g76.L(this.onUnauthorized, updateUserPreferences.onUnauthorized) && g76.L(this.onNotFound, updateUserPreferences.onNotFound);
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
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode3 = (iHashCode2 + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            int iHashCode4 = (iHashCode3 + (onUnauthorized == null ? 0 : onUnauthorized.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            return iHashCode4 + (onNotFound != null ? onNotFound.hashCode() : 0);
        }

        public final String toString() {
            return "UpdateUserPreferences(__typename=" + this.__typename + ", onMutationSuccess=" + this.onMutationSuccess + ", onBadRequest=" + this.onBadRequest + ", onUnauthorized=" + this.onUnauthorized + ", onNotFound=" + this.onNotFound + ")";
        }
    }

    public UpdateUserPreferenceValueMutation(String str, List<UserPreferenceInput> list) {
        str.getClass();
        list.getClass();
        this.userId = str;
        this.preferences = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ UpdateUserPreferenceValueMutation copy$default(UpdateUserPreferenceValueMutation updateUserPreferenceValueMutation, String str, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = updateUserPreferenceValueMutation.userId;
        }
        if ((i & 2) != 0) {
            list = updateUserPreferenceValueMutation.preferences;
        }
        return updateUserPreferenceValueMutation.copy(str, list);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UpdateUserPreferenceValueMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final List<UserPreferenceInput> component2() {
        return this.preferences;
    }

    public final UpdateUserPreferenceValueMutation copy(String userId, List<UserPreferenceInput> preferences) {
        userId.getClass();
        preferences.getClass();
        return new UpdateUserPreferenceValueMutation(userId, preferences);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UpdateUserPreferenceValueMutation($userId: String!, $preferences: [UserPreferenceInput!]!) { updateUserPreferences(input: { userId: $userId preferences: $preferences } ) { __typename ... on MutationSuccess { success } ... on BadRequest { message } ... on Unauthorized { message } ... on NotFound { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateUserPreferenceValueMutation)) {
            return false;
        }
        UpdateUserPreferenceValueMutation updateUserPreferenceValueMutation = (UpdateUserPreferenceValueMutation) other;
        return g76.L(this.userId, updateUserPreferenceValueMutation.userId) && g76.L(this.preferences, updateUserPreferenceValueMutation.preferences);
    }

    public final List<UserPreferenceInput> getPreferences() {
        return this.preferences;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.preferences.hashCode() + (this.userId.hashCode() * 31);
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
        List<sx1> list = UpdateUserPreferenceValueMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UpdateUserPreferenceValueMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ka1.s("UpdateUserPreferenceValueMutation(userId=", this.userId, ", preferences=", ")", this.preferences);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UpdateUserPreferenceValueMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UpdateUserPreferenceValueMutation($userId: String!, $preferences: [UserPreferenceInput!]!) { updateUserPreferences(input: { userId: $userId preferences: $preferences } ) { __typename ... on MutationSuccess { success } ... on BadRequest { message } ... on Unauthorized { message } ... on NotFound { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
