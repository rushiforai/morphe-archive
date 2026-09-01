package com.medium.android.graphql;

import com.medium.android.graphql.adapter.CatalogDetailQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.CatalogDetailQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.selections.CatalogDetailQuerySelections;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005()*+'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/CatalogDetailQuery;", "Luqa;", "Lcom/medium/android/graphql/CatalogDetailQuery$Data;", "", "catalogId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/CatalogDetailQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Companion", "Data", "CatalogById", "OnForbidden", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogDetailQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "fabbf4c6dd8a1cb0a452b3761e043756c7b3e4280d6e6a8645ca433670e5cfd2";
    public static final String OPERATION_NAME = "CatalogDetailQuery";
    private final String catalogId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J7\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;", "", "__typename", "", "onForbidden", "Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;", "onNotFound", "Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;", "catalogDetailData", "Lcom/medium/android/graphql/fragment/CatalogDetailData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;Lcom/medium/android/graphql/fragment/CatalogDetailData;)V", "get__typename", "()Ljava/lang/String;", "getOnForbidden", "()Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;", "getOnNotFound", "()Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;", "getCatalogDetailData", "()Lcom/medium/android/graphql/fragment/CatalogDetailData;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogById {
        private final String __typename;
        private final CatalogDetailData catalogDetailData;
        private final OnForbidden onForbidden;
        private final OnNotFound onNotFound;

        public CatalogById(String str, OnForbidden onForbidden, OnNotFound onNotFound, CatalogDetailData catalogDetailData) {
            str.getClass();
            this.__typename = str;
            this.onForbidden = onForbidden;
            this.onNotFound = onNotFound;
            this.catalogDetailData = catalogDetailData;
        }

        public static /* synthetic */ CatalogById copy$default(CatalogById catalogById, String str, OnForbidden onForbidden, OnNotFound onNotFound, CatalogDetailData catalogDetailData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogById.__typename;
            }
            if ((i & 2) != 0) {
                onForbidden = catalogById.onForbidden;
            }
            if ((i & 4) != 0) {
                onNotFound = catalogById.onNotFound;
            }
            if ((i & 8) != 0) {
                catalogDetailData = catalogById.catalogDetailData;
            }
            return catalogById.copy(str, onForbidden, onNotFound, catalogDetailData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnForbidden getOnForbidden() {
            return this.onForbidden;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final CatalogDetailData getCatalogDetailData() {
            return this.catalogDetailData;
        }

        public final CatalogById copy(String __typename, OnForbidden onForbidden, OnNotFound onNotFound, CatalogDetailData catalogDetailData) {
            __typename.getClass();
            return new CatalogById(__typename, onForbidden, onNotFound, catalogDetailData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogById)) {
                return false;
            }
            CatalogById catalogById = (CatalogById) other;
            return g76.L(this.__typename, catalogById.__typename) && g76.L(this.onForbidden, catalogById.onForbidden) && g76.L(this.onNotFound, catalogById.onNotFound) && g76.L(this.catalogDetailData, catalogById.catalogDetailData);
        }

        public final CatalogDetailData getCatalogDetailData() {
            return this.catalogDetailData;
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
            OnForbidden onForbidden = this.onForbidden;
            int iHashCode2 = (iHashCode + (onForbidden == null ? 0 : onForbidden.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode3 = (iHashCode2 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            CatalogDetailData catalogDetailData = this.catalogDetailData;
            return iHashCode3 + (catalogDetailData != null ? catalogDetailData.hashCode() : 0);
        }

        public final String toString() {
            return "CatalogById(__typename=" + this.__typename + ", onForbidden=" + this.onForbidden + ", onNotFound=" + this.onNotFound + ", catalogDetailData=" + this.catalogDetailData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CatalogDetailQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;", "catalogById", "<init>", "(Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;)V", "component1", "()Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;", "copy", "(Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;)Lcom/medium/android/graphql/CatalogDetailQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;", "getCatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final CatalogById catalogById;

        public Data(CatalogById catalogById) {
            catalogById.getClass();
            this.catalogById = catalogById;
        }

        public static /* synthetic */ Data copy$default(Data data, CatalogById catalogById, int i, Object obj) {
            if ((i & 1) != 0) {
                catalogById = data.catalogById;
            }
            return data.copy(catalogById);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final CatalogById getCatalogById() {
            return this.catalogById;
        }

        public final Data copy(CatalogById catalogById) {
            catalogById.getClass();
            return new Data(catalogById);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.catalogById, ((Data) other).catalogById);
        }

        public final CatalogById getCatalogById() {
            return this.catalogById;
        }

        public final int hashCode() {
            return this.catalogById.hashCode();
        }

        public final String toString() {
            return "Data(catalogById=" + this.catalogById + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public CatalogDetailQuery(String str) {
        str.getClass();
        this.catalogId = str;
    }

    public static /* synthetic */ CatalogDetailQuery copy$default(CatalogDetailQuery catalogDetailQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogDetailQuery.catalogId;
        }
        return catalogDetailQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CatalogDetailQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    public final CatalogDetailQuery copy(String catalogId) {
        catalogId.getClass();
        return new CatalogDetailQuery(catalogId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query CatalogDetailQuery($catalogId: ID!) { catalogById(catalogId: $catalogId) { __typename ...CatalogDetailData ... on Forbidden { message } ... on NotFound { message } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CatalogDetailData on Catalog { __typename ...CatalogSummaryData ...CatalogClapsData id description disallowResponses itemsLastInsertedAt responsesCount viewerEdge { __typename followersCount id } creator { __typename bio membership { __typename ...membershipFragment } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof CatalogDetailQuery) && g76.L(this.catalogId, ((CatalogDetailQuery) other).catalogId);
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final int hashCode() {
        return this.catalogId.hashCode();
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
        List<sx1> list = CatalogDetailQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CatalogDetailQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("CatalogDetailQuery(catalogId=", this.catalogId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CatalogDetailQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query CatalogDetailQuery($catalogId: ID!) { catalogById(catalogId: $catalogId) { __typename ...CatalogDetailData ... on Forbidden { message } ... on NotFound { message } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CatalogDetailData on Catalog { __typename ...CatalogSummaryData ...CatalogClapsData id description disallowResponses itemsLastInsertedAt responsesCount viewerEdge { __typename followersCount id } creator { __typename bio membership { __typename ...membershipFragment } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
