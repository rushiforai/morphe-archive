package com.medium.android.graphql;

import androidx.work.impl.yX.VrhD;
import com.medium.android.graphql.adapter.UpdateCatalogMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UpdateCatalogMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.selections.UpdateCatalogMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UpdateCatalogInput;
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
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006./012-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00063"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation;", "Lv78;", "Lcom/medium/android/graphql/UpdateCatalogMutation$Data;", "", "catalogId", "Lcom/medium/android/graphql/type/UpdateCatalogInput;", "attributes", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/UpdateCatalogInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/UpdateCatalogInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/UpdateCatalogInput;)Lcom/medium/android/graphql/UpdateCatalogMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Lcom/medium/android/graphql/type/UpdateCatalogInput;", "getAttributes", "Companion", "Data", UpdateCatalogMutation.OPERATION_NAME, "OnBadRequest", "OnForbidden", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateCatalogMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "1b4b8e292a41799e5d2b1d7ec2ede27b35f852c8ea2074b504e5783a0cb7d5da";
    public static final String OPERATION_NAME = "UpdateCatalog";
    private final UpdateCatalogInput attributes;
    private final String catalogId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UpdateCatalogMutation$UpdateCatalog;", "updateCatalog", "<init>", "(Lcom/medium/android/graphql/UpdateCatalogMutation$UpdateCatalog;)V", "component1", "()Lcom/medium/android/graphql/UpdateCatalogMutation$UpdateCatalog;", "copy", "(Lcom/medium/android/graphql/UpdateCatalogMutation$UpdateCatalog;)Lcom/medium/android/graphql/UpdateCatalogMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UpdateCatalogMutation$UpdateCatalog;", "getUpdateCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UpdateCatalog updateCatalog;

        public Data(UpdateCatalog updateCatalog) {
            updateCatalog.getClass();
            this.updateCatalog = updateCatalog;
        }

        public static /* synthetic */ Data copy$default(Data data, UpdateCatalog updateCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                updateCatalog = data.updateCatalog;
            }
            return data.copy(updateCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UpdateCatalog getUpdateCatalog() {
            return this.updateCatalog;
        }

        public final Data copy(UpdateCatalog updateCatalog) {
            updateCatalog.getClass();
            return new Data(updateCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.updateCatalog, ((Data) other).updateCatalog);
        }

        public final UpdateCatalog getUpdateCatalog() {
            return this.updateCatalog;
        }

        public final int hashCode() {
            return this.updateCatalog.hashCode();
        }

        public final String toString() {
            return "Data(updateCatalog=" + this.updateCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation$OnBadRequest;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation$OnForbidden;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u000bHÆ\u0003JC\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation$UpdateCatalog;", "", "__typename", "", "onBadRequest", "Lcom/medium/android/graphql/UpdateCatalogMutation$OnBadRequest;", "onForbidden", "Lcom/medium/android/graphql/UpdateCatalogMutation$OnForbidden;", "onNotFound", "Lcom/medium/android/graphql/UpdateCatalogMutation$OnNotFound;", "catalogPreviewData", "Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateCatalogMutation$OnBadRequest;Lcom/medium/android/graphql/UpdateCatalogMutation$OnForbidden;Lcom/medium/android/graphql/UpdateCatalogMutation$OnNotFound;Lcom/medium/android/graphql/fragment/CatalogPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getOnBadRequest", "()Lcom/medium/android/graphql/UpdateCatalogMutation$OnBadRequest;", "getOnForbidden", "()Lcom/medium/android/graphql/UpdateCatalogMutation$OnForbidden;", "getOnNotFound", "()Lcom/medium/android/graphql/UpdateCatalogMutation$OnNotFound;", "getCatalogPreviewData", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UpdateCatalog {
        private final String __typename;
        private final CatalogPreviewData catalogPreviewData;
        private final OnBadRequest onBadRequest;
        private final OnForbidden onForbidden;
        private final OnNotFound onNotFound;

        public UpdateCatalog(String str, OnBadRequest onBadRequest, OnForbidden onForbidden, OnNotFound onNotFound, CatalogPreviewData catalogPreviewData) {
            str.getClass();
            this.__typename = str;
            this.onBadRequest = onBadRequest;
            this.onForbidden = onForbidden;
            this.onNotFound = onNotFound;
            this.catalogPreviewData = catalogPreviewData;
        }

        public static /* synthetic */ UpdateCatalog copy$default(UpdateCatalog updateCatalog, String str, OnBadRequest onBadRequest, OnForbidden onForbidden, OnNotFound onNotFound, CatalogPreviewData catalogPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = updateCatalog.__typename;
            }
            if ((i & 2) != 0) {
                onBadRequest = updateCatalog.onBadRequest;
            }
            if ((i & 4) != 0) {
                onForbidden = updateCatalog.onForbidden;
            }
            if ((i & 8) != 0) {
                onNotFound = updateCatalog.onNotFound;
            }
            if ((i & 16) != 0) {
                catalogPreviewData = updateCatalog.catalogPreviewData;
            }
            CatalogPreviewData catalogPreviewData2 = catalogPreviewData;
            OnForbidden onForbidden2 = onForbidden;
            return updateCatalog.copy(str, onBadRequest, onForbidden2, onNotFound, catalogPreviewData2);
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
        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final CatalogPreviewData getCatalogPreviewData() {
            return this.catalogPreviewData;
        }

        public final UpdateCatalog copy(String __typename, OnBadRequest onBadRequest, OnForbidden onForbidden, OnNotFound onNotFound, CatalogPreviewData catalogPreviewData) {
            __typename.getClass();
            return new UpdateCatalog(__typename, onBadRequest, onForbidden, onNotFound, catalogPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UpdateCatalog)) {
                return false;
            }
            UpdateCatalog updateCatalog = (UpdateCatalog) other;
            return g76.L(this.__typename, updateCatalog.__typename) && g76.L(this.onBadRequest, updateCatalog.onBadRequest) && g76.L(this.onForbidden, updateCatalog.onForbidden) && g76.L(this.onNotFound, updateCatalog.onNotFound) && g76.L(this.catalogPreviewData, updateCatalog.catalogPreviewData);
        }

        public final CatalogPreviewData getCatalogPreviewData() {
            return this.catalogPreviewData;
        }

        public final OnBadRequest getOnBadRequest() {
            return this.onBadRequest;
        }

        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnBadRequest onBadRequest = this.onBadRequest;
            int iHashCode2 = (iHashCode + (onBadRequest == null ? 0 : onBadRequest.hashCode())) * 31;
            OnForbidden onForbidden = this.onForbidden;
            int iHashCode3 = (iHashCode2 + (onForbidden == null ? 0 : onForbidden.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            CatalogPreviewData catalogPreviewData = this.catalogPreviewData;
            return iHashCode4 + (catalogPreviewData != null ? catalogPreviewData.hashCode() : 0);
        }

        public final String toString() {
            return "UpdateCatalog(__typename=" + this.__typename + VrhD.meAVtciLb + this.onBadRequest + ", onForbidden=" + this.onForbidden + ", onNotFound=" + this.onNotFound + ", catalogPreviewData=" + this.catalogPreviewData + ")";
        }
    }

    public UpdateCatalogMutation(String str, UpdateCatalogInput updateCatalogInput) {
        str.getClass();
        updateCatalogInput.getClass();
        this.catalogId = str;
        this.attributes = updateCatalogInput;
    }

    public static /* synthetic */ UpdateCatalogMutation copy$default(UpdateCatalogMutation updateCatalogMutation, String str, UpdateCatalogInput updateCatalogInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = updateCatalogMutation.catalogId;
        }
        if ((i & 2) != 0) {
            updateCatalogInput = updateCatalogMutation.attributes;
        }
        return updateCatalogMutation.copy(str, updateCatalogInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UpdateCatalogMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final UpdateCatalogInput getAttributes() {
        return this.attributes;
    }

    public final UpdateCatalogMutation copy(String catalogId, UpdateCatalogInput attributes) {
        catalogId.getClass();
        attributes.getClass();
        return new UpdateCatalogMutation(catalogId, attributes);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UpdateCatalog($catalogId: String!, $attributes: UpdateCatalogInput!) { updateCatalog(catalogId: $catalogId, attributes: $attributes) { __typename ...CatalogPreviewData ... on BadRequest { message } ... on Forbidden { message } ... on NotFound { message } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateCatalogMutation)) {
            return false;
        }
        UpdateCatalogMutation updateCatalogMutation = (UpdateCatalogMutation) other;
        return g76.L(this.catalogId, updateCatalogMutation.catalogId) && g76.L(this.attributes, updateCatalogMutation.attributes);
    }

    public final UpdateCatalogInput getAttributes() {
        return this.attributes;
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final int hashCode() {
        return this.attributes.hashCode() + (this.catalogId.hashCode() * 31);
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
        List<sx1> list = UpdateCatalogMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UpdateCatalogMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "UpdateCatalogMutation(catalogId=" + this.catalogId + ", attributes=" + this.attributes + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UpdateCatalogMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UpdateCatalog($catalogId: String!, $attributes: UpdateCatalogInput!) { updateCatalog(catalogId: $catalogId, attributes: $attributes) { __typename ...CatalogPreviewData ... on BadRequest { message } ... on Forbidden { message } ... on NotFound { message } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
