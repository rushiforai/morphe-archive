package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.PredefinedCatalogType;
import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0002 !B+\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0004¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0016\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0016\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00070\u0004HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u000eJ:\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0004HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\fJ\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\fR\u001d\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001e\u0010\u000eR\u001d\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u00048\u0006¢\u0006\f\n\u0004\b\b\u0010\u001d\u001a\u0004\b\u001f\u0010\u000e¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData;", "Lg15;", "", "__typename", "", "Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData$PredefinedContainingThi;", "predefinedContainingThis", "Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData$CatalogsContainingThi;", "catalogsContainingThis", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/util/List;", "component3", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Ljava/util/List;", "getPredefinedContainingThis", "getCatalogsContainingThis", "PredefinedContainingThi", "CatalogsContainingThi", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class EntityCatalogsConnectionData implements g15 {
    private final String __typename;
    private final List<CatalogsContainingThi> catalogsContainingThis;
    private final List<PredefinedContainingThi> predefinedContainingThis;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0003J-\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData$CatalogsContainingThi;", "", "__typename", "", "catalogId", "catalogItemIds", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getCatalogId", "getCatalogItemIds", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogsContainingThi {
        private final String __typename;
        private final String catalogId;
        private final List<String> catalogItemIds;

        public CatalogsContainingThi(String str, String str2, List<String> list) {
            str.getClass();
            str2.getClass();
            list.getClass();
            this.__typename = str;
            this.catalogId = str2;
            this.catalogItemIds = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ CatalogsContainingThi copy$default(CatalogsContainingThi catalogsContainingThi, String str, String str2, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogsContainingThi.__typename;
            }
            if ((i & 2) != 0) {
                str2 = catalogsContainingThi.catalogId;
            }
            if ((i & 4) != 0) {
                list = catalogsContainingThi.catalogItemIds;
            }
            return catalogsContainingThi.copy(str, str2, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getCatalogId() {
            return this.catalogId;
        }

        public final List<String> component3() {
            return this.catalogItemIds;
        }

        public final CatalogsContainingThi copy(String __typename, String catalogId, List<String> catalogItemIds) {
            __typename.getClass();
            catalogId.getClass();
            catalogItemIds.getClass();
            return new CatalogsContainingThi(__typename, catalogId, catalogItemIds);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogsContainingThi)) {
                return false;
            }
            CatalogsContainingThi catalogsContainingThi = (CatalogsContainingThi) other;
            return g76.L(this.__typename, catalogsContainingThi.__typename) && g76.L(this.catalogId, catalogsContainingThi.catalogId) && g76.L(this.catalogItemIds, catalogsContainingThi.catalogItemIds);
        }

        public final String getCatalogId() {
            return this.catalogId;
        }

        public final List<String> getCatalogItemIds() {
            return this.catalogItemIds;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.catalogItemIds.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.catalogId);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.catalogId;
            return b09.B(y30.u("CatalogsContainingThi(__typename=", str, ", catalogId=", str2, ", catalogItemIds="), this.catalogItemIds, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\u0003¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0003J\t\u0010\u0017\u001a\u00020\bHÆ\u0003J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003JA\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\r¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData$PredefinedContainingThi;", "", "__typename", "", "catalogId", "catalogItemIds", "", "predefined", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "version", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/type/PredefinedCatalogType;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getCatalogId", "getCatalogItemIds", "()Ljava/util/List;", "getPredefined", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getVersion", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PredefinedContainingThi {
        private final String __typename;
        private final String catalogId;
        private final List<String> catalogItemIds;
        private final PredefinedCatalogType predefined;
        private final String version;

        public PredefinedContainingThi(String str, String str2, List<String> list, PredefinedCatalogType predefinedCatalogType, String str3) {
            str.getClass();
            str2.getClass();
            list.getClass();
            predefinedCatalogType.getClass();
            str3.getClass();
            this.__typename = str;
            this.catalogId = str2;
            this.catalogItemIds = list;
            this.predefined = predefinedCatalogType;
            this.version = str3;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PredefinedContainingThi copy$default(PredefinedContainingThi predefinedContainingThi, String str, String str2, List list, PredefinedCatalogType predefinedCatalogType, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = predefinedContainingThi.__typename;
            }
            if ((i & 2) != 0) {
                str2 = predefinedContainingThi.catalogId;
            }
            if ((i & 4) != 0) {
                list = predefinedContainingThi.catalogItemIds;
            }
            if ((i & 8) != 0) {
                predefinedCatalogType = predefinedContainingThi.predefined;
            }
            if ((i & 16) != 0) {
                str3 = predefinedContainingThi.version;
            }
            String str4 = str3;
            List list2 = list;
            return predefinedContainingThi.copy(str, str2, list2, predefinedCatalogType, str4);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getCatalogId() {
            return this.catalogId;
        }

        public final List<String> component3() {
            return this.catalogItemIds;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getVersion() {
            return this.version;
        }

        public final PredefinedContainingThi copy(String __typename, String catalogId, List<String> catalogItemIds, PredefinedCatalogType predefined, String version) {
            __typename.getClass();
            catalogId.getClass();
            catalogItemIds.getClass();
            predefined.getClass();
            version.getClass();
            return new PredefinedContainingThi(__typename, catalogId, catalogItemIds, predefined, version);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PredefinedContainingThi)) {
                return false;
            }
            PredefinedContainingThi predefinedContainingThi = (PredefinedContainingThi) other;
            return g76.L(this.__typename, predefinedContainingThi.__typename) && g76.L(this.catalogId, predefinedContainingThi.catalogId) && g76.L(this.catalogItemIds, predefinedContainingThi.catalogItemIds) && this.predefined == predefinedContainingThi.predefined && g76.L(this.version, predefinedContainingThi.version);
        }

        public final String getCatalogId() {
            return this.catalogId;
        }

        public final List<String> getCatalogItemIds() {
            return this.catalogItemIds;
        }

        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        public final String getVersion() {
            return this.version;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.version.hashCode() + ((this.predefined.hashCode() + wgd.p(wgd.o(this.__typename.hashCode() * 31, 31, this.catalogId), 31, this.catalogItemIds)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.catalogId;
            List<String> list = this.catalogItemIds;
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            String str3 = this.version;
            StringBuilder sbU = y30.u("PredefinedContainingThi(__typename=", str, ", catalogId=", str2, ", catalogItemIds=");
            sbU.append(list);
            sbU.append(", predefined=");
            sbU.append(predefinedCatalogType);
            sbU.append(", version=");
            return ka1.v(sbU, str3, ")");
        }
    }

    public EntityCatalogsConnectionData(String str, List<PredefinedContainingThi> list, List<CatalogsContainingThi> list2) {
        str.getClass();
        list.getClass();
        list2.getClass();
        this.__typename = str;
        this.predefinedContainingThis = list;
        this.catalogsContainingThis = list2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ EntityCatalogsConnectionData copy$default(EntityCatalogsConnectionData entityCatalogsConnectionData, String str, List list, List list2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = entityCatalogsConnectionData.__typename;
        }
        if ((i & 2) != 0) {
            list = entityCatalogsConnectionData.predefinedContainingThis;
        }
        if ((i & 4) != 0) {
            list2 = entityCatalogsConnectionData.catalogsContainingThis;
        }
        return entityCatalogsConnectionData.copy(str, list, list2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    public final List<PredefinedContainingThi> component2() {
        return this.predefinedContainingThis;
    }

    public final List<CatalogsContainingThi> component3() {
        return this.catalogsContainingThis;
    }

    public final EntityCatalogsConnectionData copy(String __typename, List<PredefinedContainingThi> predefinedContainingThis, List<CatalogsContainingThi> catalogsContainingThis) {
        __typename.getClass();
        predefinedContainingThis.getClass();
        catalogsContainingThis.getClass();
        return new EntityCatalogsConnectionData(__typename, predefinedContainingThis, catalogsContainingThis);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EntityCatalogsConnectionData)) {
            return false;
        }
        EntityCatalogsConnectionData entityCatalogsConnectionData = (EntityCatalogsConnectionData) other;
        return g76.L(this.__typename, entityCatalogsConnectionData.__typename) && g76.L(this.predefinedContainingThis, entityCatalogsConnectionData.predefinedContainingThis) && g76.L(this.catalogsContainingThis, entityCatalogsConnectionData.catalogsContainingThis);
    }

    public final List<CatalogsContainingThi> getCatalogsContainingThis() {
        return this.catalogsContainingThis;
    }

    public final List<PredefinedContainingThi> getPredefinedContainingThis() {
        return this.predefinedContainingThis;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.catalogsContainingThis.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.predefinedContainingThis);
    }

    public final String toString() {
        String str = this.__typename;
        List<PredefinedContainingThi> list = this.predefinedContainingThis;
        return b09.B(b09.E("EntityCatalogsConnectionData(__typename=", str, ", predefinedContainingThis=", ", catalogsContainingThis=", list), this.catalogsContainingThis, ")");
    }
}
