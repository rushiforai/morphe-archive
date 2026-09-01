package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UserCatalogsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.UserCatalogsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogPagingResultData;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.selections.UserCatalogsQuerySelections;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0017\b\u0086\b\u0018\u0000 42\b\u0012\u0004\u0012\u00020\u00020\u0001:\r56789:;<=>?@4B'\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\rJ'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\rJ\u0010\u0010 \u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b \u0010!J\u0016\u0010\"\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0003¢\u0006\u0004\b\"\u0010#J4\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0001¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b&\u0010\rJ\u0010\u0010(\u001a\u00020'HÖ\u0001¢\u0006\u0004\b(\u0010)J\u001a\u0010,\u001a\u00020\u00142\b\u0010+\u001a\u0004\u0018\u00010*HÖ\u0003¢\u0006\u0004\b,\u0010-R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010.\u001a\u0004\b/\u0010\rR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00100\u001a\u0004\b1\u0010!R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0006¢\u0006\f\n\u0004\b\t\u00102\u001a\u0004\b3\u0010#¨\u0006A"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery;", "Luqa;", "Lcom/medium/android/graphql/UserCatalogsQuery$Data;", "", "userId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptions", "Lzv8;", "Lcom/medium/android/graphql/type/CatalogType;", "type", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "component3", "()Lzv8;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;Lzv8;)Lcom/medium/android/graphql/UserCatalogsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptions", "Lzv8;", "getType", "Companion", "Data", "UserResult", "OnUser", "ViewerEdge", "CatalogsConnection", "Catalog", "Paging", "OnGraphqlEmptyId", "OnNotFound", "OnSuspended", "OnBlocked", "OnAccountSuspended", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserCatalogsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "b9dae54067da4394abbbfb078394b63ec2f0fba7f7bd8e99785a881153e9b791";
    public static final String OPERATION_NAME = "UserCatalogsQuery";
    private final CatalogPagingOptionsInput pagingOptions;
    private final zv8 type;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$Catalog;", "", "__typename", "", "id", "catalogPreviewData", "Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCatalogPreviewData", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Catalog {
        private final String __typename;
        private final CatalogPreviewData catalogPreviewData;
        private final String id;

        public Catalog(String str, String str2, CatalogPreviewData catalogPreviewData) {
            str.getClass();
            str2.getClass();
            catalogPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.catalogPreviewData = catalogPreviewData;
        }

        public static /* synthetic */ Catalog copy$default(Catalog catalog, String str, String str2, CatalogPreviewData catalogPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalog.__typename;
            }
            if ((i & 2) != 0) {
                str2 = catalog.id;
            }
            if ((i & 4) != 0) {
                catalogPreviewData = catalog.catalogPreviewData;
            }
            return catalog.copy(str, str2, catalogPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final CatalogPreviewData getCatalogPreviewData() {
            return this.catalogPreviewData;
        }

        public final Catalog copy(String __typename, String id, CatalogPreviewData catalogPreviewData) {
            __typename.getClass();
            id.getClass();
            catalogPreviewData.getClass();
            return new Catalog(__typename, id, catalogPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Catalog)) {
                return false;
            }
            Catalog catalog = (Catalog) other;
            return g76.L(this.__typename, catalog.__typename) && g76.L(this.id, catalog.id) && g76.L(this.catalogPreviewData, catalog.catalogPreviewData);
        }

        public final CatalogPreviewData getCatalogPreviewData() {
            return this.catalogPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.catalogPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            CatalogPreviewData catalogPreviewData = this.catalogPreviewData;
            StringBuilder sbU = y30.u("Catalog(__typename=", str, ", id=", str2, ", catalogPreviewData=");
            sbU.append(catalogPreviewData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$CatalogsConnection;", "", "__typename", "", "catalogs", "", "Lcom/medium/android/graphql/UserCatalogsQuery$Catalog;", "paging", "Lcom/medium/android/graphql/UserCatalogsQuery$Paging;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/UserCatalogsQuery$Paging;)V", "get__typename", "()Ljava/lang/String;", "getCatalogs", "()Ljava/util/List;", "getPaging", "()Lcom/medium/android/graphql/UserCatalogsQuery$Paging;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogsConnection {
        private final String __typename;
        private final List<Catalog> catalogs;
        private final Paging paging;

        public CatalogsConnection(String str, List<Catalog> list, Paging paging) {
            str.getClass();
            list.getClass();
            paging.getClass();
            this.__typename = str;
            this.catalogs = list;
            this.paging = paging;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ CatalogsConnection copy$default(CatalogsConnection catalogsConnection, String str, List list, Paging paging, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = catalogsConnection.catalogs;
            }
            if ((i & 4) != 0) {
                paging = catalogsConnection.paging;
            }
            return catalogsConnection.copy(str, list, paging);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Catalog> component2() {
            return this.catalogs;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Paging getPaging() {
            return this.paging;
        }

        public final CatalogsConnection copy(String __typename, List<Catalog> catalogs, Paging paging) {
            __typename.getClass();
            catalogs.getClass();
            paging.getClass();
            return new CatalogsConnection(__typename, catalogs, paging);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogsConnection)) {
                return false;
            }
            CatalogsConnection catalogsConnection = (CatalogsConnection) other;
            return g76.L(this.__typename, catalogsConnection.__typename) && g76.L(this.catalogs, catalogsConnection.catalogs) && g76.L(this.paging, catalogsConnection.paging);
        }

        public final List<Catalog> getCatalogs() {
            return this.catalogs;
        }

        public final Paging getPaging() {
            return this.paging;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.paging.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.catalogs);
        }

        public final String toString() {
            String str = this.__typename;
            List<Catalog> list = this.catalogs;
            Paging paging = this.paging;
            StringBuilder sbE = b09.E("CatalogsConnection(__typename=", str, ", catalogs=", ", paging=", list);
            sbE.append(paging);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/UserCatalogsQuery$UserResult;", "userResult", "<init>", "(Lcom/medium/android/graphql/UserCatalogsQuery$UserResult;)V", "component1", "()Lcom/medium/android/graphql/UserCatalogsQuery$UserResult;", "copy", "(Lcom/medium/android/graphql/UserCatalogsQuery$UserResult;)Lcom/medium/android/graphql/UserCatalogsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UserCatalogsQuery$UserResult;", "getUserResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final UserResult userResult;

        public Data(UserResult userResult) {
            this.userResult = userResult;
        }

        public static Data copy$default(Data data, UserResult userResult, int i, Object obj) {
            if ((i & 1) != 0) {
                userResult = data.userResult;
            }
            data.getClass();
            return new Data(userResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UserResult getUserResult() {
            return this.userResult;
        }

        public final Data copy(UserResult userResult) {
            return new Data(userResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.userResult, ((Data) other).userResult);
        }

        public final UserResult getUserResult() {
            return this.userResult;
        }

        public final int hashCode() {
            UserResult userResult = this.userResult;
            if (userResult == null) {
                return 0;
            }
            return userResult.hashCode();
        }

        public final String toString() {
            return "Data(userResult=" + this.userResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$OnAccountSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$OnBlocked;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBlocked {
        private final String message;

        public OnBlocked(String str) {
            this.message = str;
        }

        public static OnBlocked copy$default(OnBlocked onBlocked, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBlocked.message;
            }
            onBlocked.getClass();
            return new OnBlocked(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBlocked copy(String message) {
            return new OnBlocked(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBlocked) && g76.L(this.message, ((OnBlocked) other).message);
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
            return ev6.x("OnBlocked(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$OnGraphqlEmptyId;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnGraphqlEmptyId {
        private final String message;

        public OnGraphqlEmptyId(String str) {
            this.message = str;
        }

        public static OnGraphqlEmptyId copy$default(OnGraphqlEmptyId onGraphqlEmptyId, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onGraphqlEmptyId.message;
            }
            onGraphqlEmptyId.getClass();
            return new OnGraphqlEmptyId(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnGraphqlEmptyId copy(String message) {
            return new OnGraphqlEmptyId(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnGraphqlEmptyId) && g76.L(this.message, ((OnGraphqlEmptyId) other).message);
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
            return ev6.x("OnGraphqlEmptyId(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$OnSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnSuspended {
        private final String message;

        public OnSuspended(String str) {
            this.message = str;
        }

        public static OnSuspended copy$default(OnSuspended onSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onSuspended.message;
            }
            onSuspended.getClass();
            return new OnSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnSuspended copy(String message) {
            return new OnSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnSuspended) && g76.L(this.message, ((OnSuspended) other).message);
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
            return ev6.x("OnSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$OnUser;", "", "viewerEdge", "Lcom/medium/android/graphql/UserCatalogsQuery$ViewerEdge;", "id", "", "<init>", "(Lcom/medium/android/graphql/UserCatalogsQuery$ViewerEdge;Ljava/lang/String;)V", "getViewerEdge", "()Lcom/medium/android/graphql/UserCatalogsQuery$ViewerEdge;", "getId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final String id;
        private final ViewerEdge viewerEdge;

        public OnUser(ViewerEdge viewerEdge, String str) {
            viewerEdge.getClass();
            str.getClass();
            this.viewerEdge = viewerEdge;
            this.id = str;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, ViewerEdge viewerEdge, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                viewerEdge = onUser.viewerEdge;
            }
            if ((i & 2) != 0) {
                str = onUser.id;
            }
            return onUser.copy(viewerEdge, str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnUser copy(ViewerEdge viewerEdge, String id) {
            viewerEdge.getClass();
            id.getClass();
            return new OnUser(viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.viewerEdge, onUser.viewerEdge) && g76.L(this.id, onUser.id);
        }

        public final String getId() {
            return this.id;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.viewerEdge.hashCode() * 31);
        }

        public final String toString() {
            return "OnUser(viewerEdge=" + this.viewerEdge + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$Paging;", "", "__typename", "", "catalogPagingResultData", "Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPagingResultData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogPagingResultData", "()Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paging {
        private final String __typename;
        private final CatalogPagingResultData catalogPagingResultData;

        public Paging(String str, CatalogPagingResultData catalogPagingResultData) {
            str.getClass();
            catalogPagingResultData.getClass();
            this.__typename = str;
            this.catalogPagingResultData = catalogPagingResultData;
        }

        public static /* synthetic */ Paging copy$default(Paging paging, String str, CatalogPagingResultData catalogPagingResultData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paging.__typename;
            }
            if ((i & 2) != 0) {
                catalogPagingResultData = paging.catalogPagingResultData;
            }
            return paging.copy(str, catalogPagingResultData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogPagingResultData getCatalogPagingResultData() {
            return this.catalogPagingResultData;
        }

        public final Paging copy(String __typename, CatalogPagingResultData catalogPagingResultData) {
            __typename.getClass();
            catalogPagingResultData.getClass();
            return new Paging(__typename, catalogPagingResultData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paging)) {
                return false;
            }
            Paging paging = (Paging) other;
            return g76.L(this.__typename, paging.__typename) && g76.L(this.catalogPagingResultData, paging.catalogPagingResultData);
        }

        public final CatalogPagingResultData getCatalogPagingResultData() {
            return this.catalogPagingResultData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.catalogPagingResultData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Paging(__typename=" + this.__typename + ", catalogPagingResultData=" + this.catalogPagingResultData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u000fHÆ\u0003J[\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÆ\u0001J\u0013\u0010(\u001a\u00020)2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020,HÖ\u0001J\t\u0010-\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006."}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$UserResult;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/UserCatalogsQuery$OnUser;", "onGraphqlEmptyId", "Lcom/medium/android/graphql/UserCatalogsQuery$OnGraphqlEmptyId;", "onNotFound", "Lcom/medium/android/graphql/UserCatalogsQuery$OnNotFound;", "onSuspended", "Lcom/medium/android/graphql/UserCatalogsQuery$OnSuspended;", "onBlocked", "Lcom/medium/android/graphql/UserCatalogsQuery$OnBlocked;", "onAccountSuspended", "Lcom/medium/android/graphql/UserCatalogsQuery$OnAccountSuspended;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UserCatalogsQuery$OnUser;Lcom/medium/android/graphql/UserCatalogsQuery$OnGraphqlEmptyId;Lcom/medium/android/graphql/UserCatalogsQuery$OnNotFound;Lcom/medium/android/graphql/UserCatalogsQuery$OnSuspended;Lcom/medium/android/graphql/UserCatalogsQuery$OnBlocked;Lcom/medium/android/graphql/UserCatalogsQuery$OnAccountSuspended;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/UserCatalogsQuery$OnUser;", "getOnGraphqlEmptyId", "()Lcom/medium/android/graphql/UserCatalogsQuery$OnGraphqlEmptyId;", "getOnNotFound", "()Lcom/medium/android/graphql/UserCatalogsQuery$OnNotFound;", "getOnSuspended", "()Lcom/medium/android/graphql/UserCatalogsQuery$OnSuspended;", "getOnBlocked", "()Lcom/medium/android/graphql/UserCatalogsQuery$OnBlocked;", "getOnAccountSuspended", "()Lcom/medium/android/graphql/UserCatalogsQuery$OnAccountSuspended;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UserResult {
        private final String __typename;
        private final OnAccountSuspended onAccountSuspended;
        private final OnBlocked onBlocked;
        private final OnGraphqlEmptyId onGraphqlEmptyId;
        private final OnNotFound onNotFound;
        private final OnSuspended onSuspended;
        private final OnUser onUser;

        public UserResult(String str, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
            this.onGraphqlEmptyId = onGraphqlEmptyId;
            this.onNotFound = onNotFound;
            this.onSuspended = onSuspended;
            this.onBlocked = onBlocked;
            this.onAccountSuspended = onAccountSuspended;
        }

        public static /* synthetic */ UserResult copy$default(UserResult userResult, String str, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended, int i, Object obj) {
            if ((i & 1) != 0) {
                str = userResult.__typename;
            }
            if ((i & 2) != 0) {
                onUser = userResult.onUser;
            }
            if ((i & 4) != 0) {
                onGraphqlEmptyId = userResult.onGraphqlEmptyId;
            }
            if ((i & 8) != 0) {
                onNotFound = userResult.onNotFound;
            }
            if ((i & 16) != 0) {
                onSuspended = userResult.onSuspended;
            }
            if ((i & 32) != 0) {
                onBlocked = userResult.onBlocked;
            }
            if ((i & 64) != 0) {
                onAccountSuspended = userResult.onAccountSuspended;
            }
            OnBlocked onBlocked2 = onBlocked;
            OnAccountSuspended onAccountSuspended2 = onAccountSuspended;
            OnSuspended onSuspended2 = onSuspended;
            OnGraphqlEmptyId onGraphqlEmptyId2 = onGraphqlEmptyId;
            return userResult.copy(str, onUser, onGraphqlEmptyId2, onNotFound, onSuspended2, onBlocked2, onAccountSuspended2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUser getOnUser() {
            return this.onUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnSuspended getOnSuspended() {
            return this.onSuspended;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final UserResult copy(String __typename, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended) {
            __typename.getClass();
            return new UserResult(__typename, onUser, onGraphqlEmptyId, onNotFound, onSuspended, onBlocked, onAccountSuspended);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UserResult)) {
                return false;
            }
            UserResult userResult = (UserResult) other;
            return g76.L(this.__typename, userResult.__typename) && g76.L(this.onUser, userResult.onUser) && g76.L(this.onGraphqlEmptyId, userResult.onGraphqlEmptyId) && g76.L(this.onNotFound, userResult.onNotFound) && g76.L(this.onSuspended, userResult.onSuspended) && g76.L(this.onBlocked, userResult.onBlocked) && g76.L(this.onAccountSuspended, userResult.onAccountSuspended);
        }

        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnSuspended getOnSuspended() {
            return this.onSuspended;
        }

        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnUser onUser = this.onUser;
            int iHashCode2 = (iHashCode + (onUser == null ? 0 : onUser.hashCode())) * 31;
            OnGraphqlEmptyId onGraphqlEmptyId = this.onGraphqlEmptyId;
            int iHashCode3 = (iHashCode2 + (onGraphqlEmptyId == null ? 0 : onGraphqlEmptyId.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnSuspended onSuspended = this.onSuspended;
            int iHashCode5 = (iHashCode4 + (onSuspended == null ? 0 : onSuspended.hashCode())) * 31;
            OnBlocked onBlocked = this.onBlocked;
            int iHashCode6 = (iHashCode5 + (onBlocked == null ? 0 : onBlocked.hashCode())) * 31;
            OnAccountSuspended onAccountSuspended = this.onAccountSuspended;
            return iHashCode6 + (onAccountSuspended != null ? onAccountSuspended.hashCode() : 0);
        }

        public final String toString() {
            return "UserResult(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onGraphqlEmptyId=" + this.onGraphqlEmptyId + ", onNotFound=" + this.onNotFound + ", onSuspended=" + this.onSuspended + ", onBlocked=" + this.onBlocked + ", onAccountSuspended=" + this.onAccountSuspended + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$ViewerEdge;", "", "__typename", "", "catalogsConnection", "Lcom/medium/android/graphql/UserCatalogsQuery$CatalogsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UserCatalogsQuery$CatalogsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getCatalogsConnection", "()Lcom/medium/android/graphql/UserCatalogsQuery$CatalogsConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final CatalogsConnection catalogsConnection;
        private final String id;

        public ViewerEdge(String str, CatalogsConnection catalogsConnection, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.catalogsConnection = catalogsConnection;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, CatalogsConnection catalogsConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                catalogsConnection = viewerEdge.catalogsConnection;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, catalogsConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogsConnection getCatalogsConnection() {
            return this.catalogsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, CatalogsConnection catalogsConnection, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, catalogsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.catalogsConnection, viewerEdge.catalogsConnection) && g76.L(this.id, viewerEdge.id);
        }

        public final CatalogsConnection getCatalogsConnection() {
            return this.catalogsConnection;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            CatalogsConnection catalogsConnection = this.catalogsConnection;
            return this.id.hashCode() + ((iHashCode + (catalogsConnection == null ? 0 : catalogsConnection.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            CatalogsConnection catalogsConnection = this.catalogsConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder(AEVqIoD.vgXpUBsfHHGE);
            sb.append(str);
            sb.append(", catalogsConnection=");
            sb.append(catalogsConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public UserCatalogsQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput, zv8 zv8Var) {
        str.getClass();
        catalogPagingOptionsInput.getClass();
        zv8Var.getClass();
        this.userId = str;
        this.pagingOptions = catalogPagingOptionsInput;
        this.type = zv8Var;
    }

    public static /* synthetic */ UserCatalogsQuery copy$default(UserCatalogsQuery userCatalogsQuery, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userCatalogsQuery.userId;
        }
        if ((i & 2) != 0) {
            catalogPagingOptionsInput = userCatalogsQuery.pagingOptions;
        }
        if ((i & 4) != 0) {
            zv8Var = userCatalogsQuery.type;
        }
        return userCatalogsQuery.copy(str, catalogPagingOptionsInput, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UserCatalogsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getType() {
        return this.type;
    }

    public final UserCatalogsQuery copy(String userId, CatalogPagingOptionsInput pagingOptions, zv8 type) {
        userId.getClass();
        pagingOptions.getClass();
        type.getClass();
        return new UserCatalogsQuery(userId, pagingOptions, type);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query UserCatalogsQuery($userId: ID!, $pagingOptions: CatalogPagingOptionsInput!, $type: CatalogType! = LISTS ) { userResult(id: $userId) { __typename ... on User { viewerEdge { __typename catalogsConnection(pagingOptions: $pagingOptions, type: $type) { __typename catalogs { __typename ...CatalogPreviewData id } paging { __typename ...CatalogPagingResultData } } id } id } ... on GraphqlEmptyId { message } ... on NotFound { message } ... on Suspended { message } ... on Blocked { message } ... on AccountSuspended { message } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserCatalogsQuery)) {
            return false;
        }
        UserCatalogsQuery userCatalogsQuery = (UserCatalogsQuery) other;
        return g76.L(this.userId, userCatalogsQuery.userId) && g76.L(this.pagingOptions, userCatalogsQuery.pagingOptions) && g76.L(this.type, userCatalogsQuery.type);
    }

    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final zv8 getType() {
        return this.type;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.type.hashCode() + ((this.pagingOptions.hashCode() + (this.userId.hashCode() * 31)) * 31);
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
        List<sx1> list = UserCatalogsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UserCatalogsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.userId;
        CatalogPagingOptionsInput catalogPagingOptionsInput = this.pagingOptions;
        zv8 zv8Var = this.type;
        StringBuilder sb = new StringBuilder("UserCatalogsQuery(userId=");
        sb.append(str);
        sb.append(", pagingOptions=");
        sb.append(catalogPagingOptionsInput);
        sb.append(", type=");
        return km4.B(sb, zv8Var, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UserCatalogsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query UserCatalogsQuery($userId: ID!, $pagingOptions: CatalogPagingOptionsInput!, $type: CatalogType! = LISTS ) { userResult(id: $userId) { __typename ... on User { viewerEdge { __typename catalogsConnection(pagingOptions: $pagingOptions, type: $type) { __typename catalogs { __typename ...CatalogPreviewData id } paging { __typename ...CatalogPagingResultData } } id } id } ... on GraphqlEmptyId { message } ... on NotFound { message } ... on Suspended { message } ... on Blocked { message } ... on AccountSuspended { message } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ UserCatalogsQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, catalogPagingOptionsInput, (i & 4) != 0 ? xv8.a : zv8Var);
    }
}
