package com.medium.android.graphql;

import com.medium.android.graphql.adapter.FollowedCatalogsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.FollowedCatalogsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogPagingResultData;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.selections.FollowedCatalogsQuerySelections;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007./0123-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00064"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery;", "Luqa;", "Lcom/medium/android/graphql/FollowedCatalogsQuery$Data;", "", "userId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptions", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)Lcom/medium/android/graphql/FollowedCatalogsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptions", "Companion", "Data", "User", "ViewerEdge", "FollowingCatalogsConnection", "Catalog", "Paging", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FollowedCatalogsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "7eafa1f63717889fddc4230efbe4ce0a0c2eefe1119e153e6e1eda7f1f39902a";
    public static final String OPERATION_NAME = "FollowedCatalogsQuery";
    private final CatalogPagingOptionsInput pagingOptions;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$Catalog;", "", "__typename", "", "id", "catalogPreviewData", "Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCatalogPreviewData", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/FollowedCatalogsQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/FollowedCatalogsQuery$User;)V", "component1", "()Lcom/medium/android/graphql/FollowedCatalogsQuery$User;", "copy", "(Lcom/medium/android/graphql/FollowedCatalogsQuery$User;)Lcom/medium/android/graphql/FollowedCatalogsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/FollowedCatalogsQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final User user;

        public Data(User user) {
            this.user = user;
        }

        public static Data copy$default(Data data, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                user = data.user;
            }
            data.getClass();
            return new Data(user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Data copy(User user) {
            return new Data(user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.user, ((Data) other).user);
        }

        public final User getUser() {
            return this.user;
        }

        public final int hashCode() {
            User user = this.user;
            if (user == null) {
                return 0;
            }
            return user.hashCode();
        }

        public final String toString() {
            return "Data(user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$FollowingCatalogsConnection;", "", "__typename", "", "catalogs", "", "Lcom/medium/android/graphql/FollowedCatalogsQuery$Catalog;", "paging", "Lcom/medium/android/graphql/FollowedCatalogsQuery$Paging;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/FollowedCatalogsQuery$Paging;)V", "get__typename", "()Ljava/lang/String;", "getCatalogs", "()Ljava/util/List;", "getPaging", "()Lcom/medium/android/graphql/FollowedCatalogsQuery$Paging;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowingCatalogsConnection {
        private final String __typename;
        private final List<Catalog> catalogs;
        private final Paging paging;

        public FollowingCatalogsConnection(String str, List<Catalog> list, Paging paging) {
            str.getClass();
            list.getClass();
            paging.getClass();
            this.__typename = str;
            this.catalogs = list;
            this.paging = paging;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ FollowingCatalogsConnection copy$default(FollowingCatalogsConnection followingCatalogsConnection, String str, List list, Paging paging, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followingCatalogsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = followingCatalogsConnection.catalogs;
            }
            if ((i & 4) != 0) {
                paging = followingCatalogsConnection.paging;
            }
            return followingCatalogsConnection.copy(str, list, paging);
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

        public final FollowingCatalogsConnection copy(String __typename, List<Catalog> catalogs, Paging paging) {
            __typename.getClass();
            catalogs.getClass();
            paging.getClass();
            return new FollowingCatalogsConnection(__typename, catalogs, paging);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowingCatalogsConnection)) {
                return false;
            }
            FollowingCatalogsConnection followingCatalogsConnection = (FollowingCatalogsConnection) other;
            return g76.L(this.__typename, followingCatalogsConnection.__typename) && g76.L(this.catalogs, followingCatalogsConnection.catalogs) && g76.L(this.paging, followingCatalogsConnection.paging);
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
            StringBuilder sbE = b09.E("FollowingCatalogsConnection(__typename=", str, ", catalogs=", ", paging=", list);
            sbE.append(paging);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$Paging;", "", "__typename", "", "catalogPagingResultData", "Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPagingResultData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogPagingResultData", "()Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$User;", "", "__typename", "", "viewerEdge", "Lcom/medium/android/graphql/FollowedCatalogsQuery$ViewerEdge;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedCatalogsQuery$ViewerEdge;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getViewerEdge", "()Lcom/medium/android/graphql/FollowedCatalogsQuery$ViewerEdge;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final ViewerEdge viewerEdge;

        public User(String str, ViewerEdge viewerEdge, String str2) {
            str.getClass();
            viewerEdge.getClass();
            str2.getClass();
            this.__typename = str;
            this.viewerEdge = viewerEdge;
            this.id = str2;
        }

        public static /* synthetic */ User copy$default(User user, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                viewerEdge = user.viewerEdge;
            }
            if ((i & 4) != 0) {
                str2 = user.id;
            }
            return user.copy(str, viewerEdge, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final User copy(String __typename, ViewerEdge viewerEdge, String id) {
            __typename.getClass();
            viewerEdge.getClass();
            id.getClass();
            return new User(__typename, viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.viewerEdge, user.viewerEdge) && g76.L(this.id, user.id);
        }

        public final String getId() {
            return this.id;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.viewerEdge.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            ViewerEdge viewerEdge = this.viewerEdge;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("User(__typename=");
            sb.append(str);
            sb.append(", viewerEdge=");
            sb.append(viewerEdge);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$ViewerEdge;", "", "__typename", "", "followingCatalogsConnection", "Lcom/medium/android/graphql/FollowedCatalogsQuery$FollowingCatalogsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedCatalogsQuery$FollowingCatalogsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFollowingCatalogsConnection", "()Lcom/medium/android/graphql/FollowedCatalogsQuery$FollowingCatalogsConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final FollowingCatalogsConnection followingCatalogsConnection;
        private final String id;

        public ViewerEdge(String str, FollowingCatalogsConnection followingCatalogsConnection, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.followingCatalogsConnection = followingCatalogsConnection;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, FollowingCatalogsConnection followingCatalogsConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                followingCatalogsConnection = viewerEdge.followingCatalogsConnection;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, followingCatalogsConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final FollowingCatalogsConnection getFollowingCatalogsConnection() {
            return this.followingCatalogsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, FollowingCatalogsConnection followingCatalogsConnection, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, followingCatalogsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.followingCatalogsConnection, viewerEdge.followingCatalogsConnection) && g76.L(this.id, viewerEdge.id);
        }

        public final FollowingCatalogsConnection getFollowingCatalogsConnection() {
            return this.followingCatalogsConnection;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            FollowingCatalogsConnection followingCatalogsConnection = this.followingCatalogsConnection;
            return this.id.hashCode() + ((iHashCode + (followingCatalogsConnection == null ? 0 : followingCatalogsConnection.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            FollowingCatalogsConnection followingCatalogsConnection = this.followingCatalogsConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", followingCatalogsConnection=");
            sb.append(followingCatalogsConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public FollowedCatalogsQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput) {
        str.getClass();
        catalogPagingOptionsInput.getClass();
        this.userId = str;
        this.pagingOptions = catalogPagingOptionsInput;
    }

    public static /* synthetic */ FollowedCatalogsQuery copy$default(FollowedCatalogsQuery followedCatalogsQuery, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = followedCatalogsQuery.userId;
        }
        if ((i & 2) != 0) {
            catalogPagingOptionsInput = followedCatalogsQuery.pagingOptions;
        }
        return followedCatalogsQuery.copy(str, catalogPagingOptionsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(FollowedCatalogsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final FollowedCatalogsQuery copy(String userId, CatalogPagingOptionsInput pagingOptions) {
        userId.getClass();
        pagingOptions.getClass();
        return new FollowedCatalogsQuery(userId, pagingOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query FollowedCatalogsQuery($userId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { user(id: $userId) { __typename viewerEdge { __typename followingCatalogsConnection(pagingOptions: $pagingOptions) { __typename catalogs { __typename ...CatalogPreviewData id } paging { __typename ...CatalogPagingResultData } } id } id } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof FollowedCatalogsQuery)) {
            return false;
        }
        FollowedCatalogsQuery followedCatalogsQuery = (FollowedCatalogsQuery) other;
        return g76.L(this.userId, followedCatalogsQuery.userId) && g76.L(this.pagingOptions, followedCatalogsQuery.pagingOptions);
    }

    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.pagingOptions.hashCode() + (this.userId.hashCode() * 31);
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
        List<sx1> list = FollowedCatalogsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        FollowedCatalogsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "FollowedCatalogsQuery(userId=" + this.userId + ", pagingOptions=" + this.pagingOptions + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/FollowedCatalogsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query FollowedCatalogsQuery($userId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { user(id: $userId) { __typename viewerEdge { __typename followingCatalogsConnection(pagingOptions: $pagingOptions) { __typename catalogs { __typename ...CatalogPreviewData id } paging { __typename ...CatalogPagingResultData } } id } id } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
