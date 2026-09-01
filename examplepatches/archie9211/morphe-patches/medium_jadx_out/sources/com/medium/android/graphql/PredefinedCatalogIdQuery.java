package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PredefinedCatalogIdQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PredefinedCatalogIdQuery_VariablesAdapter;
import com.medium.android.graphql.selections.PredefinedCatalogIdQuerySelections;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.graphql.type.Query;
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
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006./012-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\nJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u001dR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\n¨\u00063"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery;", "Luqa;", "Lcom/medium/android/graphql/PredefinedCatalogIdQuery$Data;", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "type", "", "userId", "<init>", "(Lcom/medium/android/graphql/type/PredefinedCatalogType;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "component2", "copy", "(Lcom/medium/android/graphql/type/PredefinedCatalogType;Ljava/lang/String;)Lcom/medium/android/graphql/PredefinedCatalogIdQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getType", "Ljava/lang/String;", "getUserId", "Companion", "Data", "GetPredefinedCatalog", "OnCatalog", "OnForbidden", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PredefinedCatalogIdQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "7d805a28d29ca5a4758dc8c4d4673f388256387cbb2cfd2d12e459fc2e55c277";
    public static final String OPERATION_NAME = "PredefinedCatalogIdQuery";
    private final PredefinedCatalogType type;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PredefinedCatalogIdQuery$GetPredefinedCatalog;", "getPredefinedCatalog", "<init>", "(Lcom/medium/android/graphql/PredefinedCatalogIdQuery$GetPredefinedCatalog;)V", "component1", "()Lcom/medium/android/graphql/PredefinedCatalogIdQuery$GetPredefinedCatalog;", "copy", "(Lcom/medium/android/graphql/PredefinedCatalogIdQuery$GetPredefinedCatalog;)Lcom/medium/android/graphql/PredefinedCatalogIdQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PredefinedCatalogIdQuery$GetPredefinedCatalog;", "getGetPredefinedCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final GetPredefinedCatalog getPredefinedCatalog;

        public Data(GetPredefinedCatalog getPredefinedCatalog) {
            getPredefinedCatalog.getClass();
            this.getPredefinedCatalog = getPredefinedCatalog;
        }

        public static /* synthetic */ Data copy$default(Data data, GetPredefinedCatalog getPredefinedCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                getPredefinedCatalog = data.getPredefinedCatalog;
            }
            return data.copy(getPredefinedCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final GetPredefinedCatalog getGetPredefinedCatalog() {
            return this.getPredefinedCatalog;
        }

        public final Data copy(GetPredefinedCatalog getPredefinedCatalog) {
            getPredefinedCatalog.getClass();
            return new Data(getPredefinedCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.getPredefinedCatalog, ((Data) other).getPredefinedCatalog);
        }

        public final GetPredefinedCatalog getGetPredefinedCatalog() {
            return this.getPredefinedCatalog;
        }

        public final int hashCode() {
            return this.getPredefinedCatalog.hashCode();
        }

        public final String toString() {
            return "Data(getPredefinedCatalog=" + this.getPredefinedCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery$GetPredefinedCatalog;", "", "__typename", "", "onCatalog", "Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnCatalog;", "onForbidden", "Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnForbidden;", "onNotFound", "Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnNotFound;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnCatalog;Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnForbidden;Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnNotFound;)V", "get__typename", "()Ljava/lang/String;", "getOnCatalog", "()Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnCatalog;", "getOnForbidden", "()Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnForbidden;", "getOnNotFound", "()Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnNotFound;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class GetPredefinedCatalog {
        private final String __typename;
        private final OnCatalog onCatalog;
        private final OnForbidden onForbidden;
        private final OnNotFound onNotFound;

        public GetPredefinedCatalog(String str, OnCatalog onCatalog, OnForbidden onForbidden, OnNotFound onNotFound) {
            str.getClass();
            this.__typename = str;
            this.onCatalog = onCatalog;
            this.onForbidden = onForbidden;
            this.onNotFound = onNotFound;
        }

        public static /* synthetic */ GetPredefinedCatalog copy$default(GetPredefinedCatalog getPredefinedCatalog, String str, OnCatalog onCatalog, OnForbidden onForbidden, OnNotFound onNotFound, int i, Object obj) {
            if ((i & 1) != 0) {
                str = getPredefinedCatalog.__typename;
            }
            if ((i & 2) != 0) {
                onCatalog = getPredefinedCatalog.onCatalog;
            }
            if ((i & 4) != 0) {
                onForbidden = getPredefinedCatalog.onForbidden;
            }
            if ((i & 8) != 0) {
                onNotFound = getPredefinedCatalog.onNotFound;
            }
            return getPredefinedCatalog.copy(str, onCatalog, onForbidden, onNotFound);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final GetPredefinedCatalog copy(String __typename, OnCatalog onCatalog, OnForbidden onForbidden, OnNotFound onNotFound) {
            __typename.getClass();
            return new GetPredefinedCatalog(__typename, onCatalog, onForbidden, onNotFound);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof GetPredefinedCatalog)) {
                return false;
            }
            GetPredefinedCatalog getPredefinedCatalog = (GetPredefinedCatalog) other;
            return g76.L(this.__typename, getPredefinedCatalog.__typename) && g76.L(this.onCatalog, getPredefinedCatalog.onCatalog) && g76.L(this.onForbidden, getPredefinedCatalog.onForbidden) && g76.L(this.onNotFound, getPredefinedCatalog.onNotFound);
        }

        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
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
            OnCatalog onCatalog = this.onCatalog;
            int iHashCode2 = (iHashCode + (onCatalog == null ? 0 : onCatalog.hashCode())) * 31;
            OnForbidden onForbidden = this.onForbidden;
            int iHashCode3 = (iHashCode2 + (onForbidden == null ? 0 : onForbidden.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            return iHashCode3 + (onNotFound != null ? onNotFound.hashCode() : 0);
        }

        public final String toString() {
            return "GetPredefinedCatalog(__typename=" + this.__typename + ", onCatalog=" + this.onCatalog + ", onForbidden=" + this.onForbidden + ", onNotFound=" + this.onNotFound + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnCatalog;", "", "id", "", "<init>", "(Ljava/lang/String;)V", "getId", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCatalog {
        private final String id;

        public OnCatalog(String str) {
            str.getClass();
            this.id = str;
        }

        public static /* synthetic */ OnCatalog copy$default(OnCatalog onCatalog, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onCatalog.id;
            }
            return onCatalog.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnCatalog copy(String id) {
            id.getClass();
            return new OnCatalog(id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnCatalog) && g76.L(this.id, ((OnCatalog) other).id);
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.id.hashCode();
        }

        public final String toString() {
            return ev6.x("OnCatalog(id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnForbidden;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public PredefinedCatalogIdQuery(PredefinedCatalogType predefinedCatalogType, String str) {
        predefinedCatalogType.getClass();
        str.getClass();
        this.type = predefinedCatalogType;
        this.userId = str;
    }

    public static /* synthetic */ PredefinedCatalogIdQuery copy$default(PredefinedCatalogIdQuery predefinedCatalogIdQuery, PredefinedCatalogType predefinedCatalogType, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            predefinedCatalogType = predefinedCatalogIdQuery.type;
        }
        if ((i & 2) != 0) {
            str = predefinedCatalogIdQuery.userId;
        }
        return predefinedCatalogIdQuery.copy(predefinedCatalogType, str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PredefinedCatalogIdQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PredefinedCatalogType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final PredefinedCatalogIdQuery copy(PredefinedCatalogType type, String userId) {
        type.getClass();
        userId.getClass();
        return new PredefinedCatalogIdQuery(type, userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PredefinedCatalogIdQuery($type: PredefinedCatalogType!, $userId: ID!) { getPredefinedCatalog(type: $type, userId: $userId) { __typename ... on Catalog { id } ... on Forbidden { message } ... on NotFound { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PredefinedCatalogIdQuery)) {
            return false;
        }
        PredefinedCatalogIdQuery predefinedCatalogIdQuery = (PredefinedCatalogIdQuery) other;
        return this.type == predefinedCatalogIdQuery.type && g76.L(this.userId, predefinedCatalogIdQuery.userId);
    }

    public final PredefinedCatalogType getType() {
        return this.type;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + (this.type.hashCode() * 31);
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
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = PredefinedCatalogIdQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PredefinedCatalogIdQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PredefinedCatalogIdQuery(type=" + this.type + ", userId=" + this.userId + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PredefinedCatalogIdQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PredefinedCatalogIdQuery($type: PredefinedCatalogType!, $userId: ID!) { getPredefinedCatalog(type: $type, userId: $userId) { __typename ... on Catalog { id } ... on Forbidden { message } ... on NotFound { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
