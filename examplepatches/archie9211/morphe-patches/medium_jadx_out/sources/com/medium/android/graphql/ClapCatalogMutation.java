package com.medium.android.graphql;

import com.medium.android.graphql.adapter.ClapCatalogMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.ClapCatalogMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogClapsData;
import com.medium.android.graphql.selections.ClapCatalogMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
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
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 +2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003,-+B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010\"\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\"\u0010\u001eJ\u001a\u0010%\u001a\u00020\u00112\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010)\u001a\u0004\b*\u0010\u001e¨\u0006."}, d2 = {"Lcom/medium/android/graphql/ClapCatalogMutation;", "Lv78;", "Lcom/medium/android/graphql/ClapCatalogMutation$Data;", "", "catalogId", "", "numClaps", "<init>", "(Ljava/lang/String;I)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()I", "copy", "(Ljava/lang/String;I)Lcom/medium/android/graphql/ClapCatalogMutation;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "I", "getNumClaps", "Companion", "Data", "ClapCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ClapCatalogMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "c418a50f8abb9befdfeb9f2786dec85d85013890c64381eabc17c22c079c0817";
    public static final String OPERATION_NAME = "ClapCatalogMutation";
    private final String catalogId;
    private final int numClaps;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ClapCatalogMutation$ClapCatalog;", "", "__typename", "", "catalogClapsData", "Lcom/medium/android/graphql/fragment/CatalogClapsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogClapsData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogClapsData", "()Lcom/medium/android/graphql/fragment/CatalogClapsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ClapCatalog {
        private final String __typename;
        private final CatalogClapsData catalogClapsData;

        public ClapCatalog(String str, CatalogClapsData catalogClapsData) {
            str.getClass();
            this.__typename = str;
            this.catalogClapsData = catalogClapsData;
        }

        public static /* synthetic */ ClapCatalog copy$default(ClapCatalog clapCatalog, String str, CatalogClapsData catalogClapsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = clapCatalog.__typename;
            }
            if ((i & 2) != 0) {
                catalogClapsData = clapCatalog.catalogClapsData;
            }
            return clapCatalog.copy(str, catalogClapsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogClapsData getCatalogClapsData() {
            return this.catalogClapsData;
        }

        public final ClapCatalog copy(String __typename, CatalogClapsData catalogClapsData) {
            __typename.getClass();
            return new ClapCatalog(__typename, catalogClapsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ClapCatalog)) {
                return false;
            }
            ClapCatalog clapCatalog = (ClapCatalog) other;
            return g76.L(this.__typename, clapCatalog.__typename) && g76.L(this.catalogClapsData, clapCatalog.catalogClapsData);
        }

        public final CatalogClapsData getCatalogClapsData() {
            return this.catalogClapsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            CatalogClapsData catalogClapsData = this.catalogClapsData;
            return iHashCode + (catalogClapsData == null ? 0 : catalogClapsData.hashCode());
        }

        public final String toString() {
            return "ClapCatalog(__typename=" + this.__typename + ", catalogClapsData=" + this.catalogClapsData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/ClapCatalogMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/ClapCatalogMutation$ClapCatalog;", "clapCatalog", "<init>", "(Lcom/medium/android/graphql/ClapCatalogMutation$ClapCatalog;)V", "component1", "()Lcom/medium/android/graphql/ClapCatalogMutation$ClapCatalog;", "copy", "(Lcom/medium/android/graphql/ClapCatalogMutation$ClapCatalog;)Lcom/medium/android/graphql/ClapCatalogMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/ClapCatalogMutation$ClapCatalog;", "getClapCatalog", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final ClapCatalog clapCatalog;

        public Data(ClapCatalog clapCatalog) {
            clapCatalog.getClass();
            this.clapCatalog = clapCatalog;
        }

        public static /* synthetic */ Data copy$default(Data data, ClapCatalog clapCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                clapCatalog = data.clapCatalog;
            }
            return data.copy(clapCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ClapCatalog getClapCatalog() {
            return this.clapCatalog;
        }

        public final Data copy(ClapCatalog clapCatalog) {
            clapCatalog.getClass();
            return new Data(clapCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.clapCatalog, ((Data) other).clapCatalog);
        }

        public final ClapCatalog getClapCatalog() {
            return this.clapCatalog;
        }

        public final int hashCode() {
            return this.clapCatalog.hashCode();
        }

        public final String toString() {
            return "Data(clapCatalog=" + this.clapCatalog + ")";
        }
    }

    public ClapCatalogMutation(String str, int i) {
        str.getClass();
        this.catalogId = str;
        this.numClaps = i;
    }

    public static /* synthetic */ ClapCatalogMutation copy$default(ClapCatalogMutation clapCatalogMutation, String str, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = clapCatalogMutation.catalogId;
        }
        if ((i2 & 2) != 0) {
            i = clapCatalogMutation.numClaps;
        }
        return clapCatalogMutation.copy(str, i);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ClapCatalogMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getNumClaps() {
        return this.numClaps;
    }

    public final ClapCatalogMutation copy(String catalogId, int numClaps) {
        catalogId.getClass();
        return new ClapCatalogMutation(catalogId, numClaps);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation ClapCatalogMutation($catalogId: String!, $numClaps: Int!) { clapCatalog(catalogId: $catalogId, numClaps: $numClaps) { __typename ...CatalogClapsData } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ClapCatalogMutation)) {
            return false;
        }
        ClapCatalogMutation clapCatalogMutation = (ClapCatalogMutation) other;
        return g76.L(this.catalogId, clapCatalogMutation.catalogId) && this.numClaps == clapCatalogMutation.numClaps;
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final int getNumClaps() {
        return this.numClaps;
    }

    public final int hashCode() {
        return (this.catalogId.hashCode() * 31) + this.numClaps;
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
        List<sx1> list = ClapCatalogMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ClapCatalogMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ho2.C(this.numClaps, "ClapCatalogMutation(catalogId=", this.catalogId, ", numClaps=", ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/ClapCatalogMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation ClapCatalogMutation($catalogId: String!, $numClaps: Int!) { clapCatalog(catalogId: $catalogId, numClaps: $numClaps) { __typename ...CatalogClapsData } }  fragment CatalogClapsData on Catalog { __typename totalClapCount: clapCount viewerEdge { __typename clapCount id } id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
