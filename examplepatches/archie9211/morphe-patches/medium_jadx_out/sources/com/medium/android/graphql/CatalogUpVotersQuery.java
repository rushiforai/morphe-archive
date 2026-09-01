package com.medium.android.graphql;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.graphql.adapter.CatalogUpVotersQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.CatalogUpVotersQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogPagingResultData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.selections.CatalogUpVotersQuerySelections;
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
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0011\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\t./012345-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00066"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery;", "Luqa;", "Lcom/medium/android/graphql/CatalogUpVotersQuery$Data;", "", "catalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptionsInput", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)Lcom/medium/android/graphql/CatalogUpVotersQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptionsInput", "Companion", "Data", "CatalogById", "OnCatalog", "ViewerEdge", "Clappers", "Clapper", "User", "Paging", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogUpVotersQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "66405060b1fee623d03e5fc190c55a7e613acba93e034d85035d5a5284334f0a";
    public static final String OPERATION_NAME = "CatalogUpVotersQuery";
    private final String catalogId;
    private final CatalogPagingOptionsInput pagingOptionsInput;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$CatalogById;", "", "__typename", "", "onCatalog", "Lcom/medium/android/graphql/CatalogUpVotersQuery$OnCatalog;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CatalogUpVotersQuery$OnCatalog;)V", "get__typename", "()Ljava/lang/String;", "getOnCatalog", "()Lcom/medium/android/graphql/CatalogUpVotersQuery$OnCatalog;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogById {
        private final String __typename;
        private final OnCatalog onCatalog;

        public CatalogById(String str, OnCatalog onCatalog) {
            str.getClass();
            this.__typename = str;
            this.onCatalog = onCatalog;
        }

        public static /* synthetic */ CatalogById copy$default(CatalogById catalogById, String str, OnCatalog onCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogById.__typename;
            }
            if ((i & 2) != 0) {
                onCatalog = catalogById.onCatalog;
            }
            return catalogById.copy(str, onCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final CatalogById copy(String __typename, OnCatalog onCatalog) {
            __typename.getClass();
            return new CatalogById(__typename, onCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogById)) {
                return false;
            }
            CatalogById catalogById = (CatalogById) other;
            return g76.L(this.__typename, catalogById.__typename) && g76.L(this.onCatalog, catalogById.onCatalog);
        }

        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnCatalog onCatalog = this.onCatalog;
            return iHashCode + (onCatalog == null ? 0 : onCatalog.hashCode());
        }

        public final String toString() {
            return "CatalogById(__typename=" + this.__typename + ", onCatalog=" + this.onCatalog + PdtluglzAX.zWQsaO;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$Clapper;", "", "__typename", "", "user", "Lcom/medium/android/graphql/CatalogUpVotersQuery$User;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CatalogUpVotersQuery$User;)V", "get__typename", "()Ljava/lang/String;", "getUser", "()Lcom/medium/android/graphql/CatalogUpVotersQuery$User;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Clapper {
        private final String __typename;
        private final User user;

        public Clapper(String str, User user) {
            str.getClass();
            user.getClass();
            this.__typename = str;
            this.user = user;
        }

        public static /* synthetic */ Clapper copy$default(Clapper clapper, String str, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                str = clapper.__typename;
            }
            if ((i & 2) != 0) {
                user = clapper.user;
            }
            return clapper.copy(str, user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Clapper copy(String __typename, User user) {
            __typename.getClass();
            user.getClass();
            return new Clapper(__typename, user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Clapper)) {
                return false;
            }
            Clapper clapper = (Clapper) other;
            return g76.L(this.__typename, clapper.__typename) && g76.L(this.user, clapper.user);
        }

        public final User getUser() {
            return this.user;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.user.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Clapper(__typename=" + this.__typename + ", user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$Clappers;", "", "__typename", "", "clappers", "", "Lcom/medium/android/graphql/CatalogUpVotersQuery$Clapper;", "paging", "Lcom/medium/android/graphql/CatalogUpVotersQuery$Paging;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/CatalogUpVotersQuery$Paging;)V", "get__typename", "()Ljava/lang/String;", "getClappers", "()Ljava/util/List;", "getPaging", "()Lcom/medium/android/graphql/CatalogUpVotersQuery$Paging;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Clappers {
        private final String __typename;
        private final List<Clapper> clappers;
        private final Paging paging;

        public Clappers(String str, List<Clapper> list, Paging paging) {
            str.getClass();
            list.getClass();
            paging.getClass();
            this.__typename = str;
            this.clappers = list;
            this.paging = paging;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Clappers copy$default(Clappers clappers, String str, List list, Paging paging, int i, Object obj) {
            if ((i & 1) != 0) {
                str = clappers.__typename;
            }
            if ((i & 2) != 0) {
                list = clappers.clappers;
            }
            if ((i & 4) != 0) {
                paging = clappers.paging;
            }
            return clappers.copy(str, list, paging);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Clapper> component2() {
            return this.clappers;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Paging getPaging() {
            return this.paging;
        }

        public final Clappers copy(String __typename, List<Clapper> clappers, Paging paging) {
            __typename.getClass();
            clappers.getClass();
            paging.getClass();
            return new Clappers(__typename, clappers, paging);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Clappers)) {
                return false;
            }
            Clappers clappers = (Clappers) other;
            return g76.L(this.__typename, clappers.__typename) && g76.L(this.clappers, clappers.clappers) && g76.L(this.paging, clappers.paging);
        }

        public final List<Clapper> getClappers() {
            return this.clappers;
        }

        public final Paging getPaging() {
            return this.paging;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.paging.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.clappers);
        }

        public final String toString() {
            String str = this.__typename;
            List<Clapper> list = this.clappers;
            Paging paging = this.paging;
            StringBuilder sbE = b09.E("Clappers(__typename=", str, ", clappers=", ", paging=", list);
            sbE.append(paging);
            sbE.append(MaAxRJinch.pCtyQcwoFVOUG);
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/CatalogUpVotersQuery$CatalogById;", "catalogById", "<init>", "(Lcom/medium/android/graphql/CatalogUpVotersQuery$CatalogById;)V", "component1", "()Lcom/medium/android/graphql/CatalogUpVotersQuery$CatalogById;", "copy", "(Lcom/medium/android/graphql/CatalogUpVotersQuery$CatalogById;)Lcom/medium/android/graphql/CatalogUpVotersQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CatalogUpVotersQuery$CatalogById;", "getCatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$OnCatalog;", "", "viewerEdge", "Lcom/medium/android/graphql/CatalogUpVotersQuery$ViewerEdge;", "id", "", "<init>", "(Lcom/medium/android/graphql/CatalogUpVotersQuery$ViewerEdge;Ljava/lang/String;)V", "getViewerEdge", "()Lcom/medium/android/graphql/CatalogUpVotersQuery$ViewerEdge;", "getId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCatalog {
        private final String id;
        private final ViewerEdge viewerEdge;

        public OnCatalog(ViewerEdge viewerEdge, String str) {
            viewerEdge.getClass();
            str.getClass();
            this.viewerEdge = viewerEdge;
            this.id = str;
        }

        public static /* synthetic */ OnCatalog copy$default(OnCatalog onCatalog, ViewerEdge viewerEdge, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                viewerEdge = onCatalog.viewerEdge;
            }
            if ((i & 2) != 0) {
                str = onCatalog.id;
            }
            return onCatalog.copy(viewerEdge, str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnCatalog copy(ViewerEdge viewerEdge, String id) {
            viewerEdge.getClass();
            id.getClass();
            return new OnCatalog(viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnCatalog)) {
                return false;
            }
            OnCatalog onCatalog = (OnCatalog) other;
            return g76.L(this.viewerEdge, onCatalog.viewerEdge) && g76.L(this.id, onCatalog.id);
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
            return "OnCatalog(viewerEdge=" + this.viewerEdge + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$Paging;", "", "__typename", "", "catalogPagingResultData", "Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPagingResultData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogPagingResultData", "()Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$User;", "", "__typename", "", "id", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final CreatorPreviewData creatorPreviewData;
        private final String id;

        public User(String str, String str2, CreatorPreviewData creatorPreviewData) {
            str.getClass();
            str2.getClass();
            creatorPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.creatorPreviewData = creatorPreviewData;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, CreatorPreviewData creatorPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.id;
            }
            if ((i & 4) != 0) {
                creatorPreviewData = user.creatorPreviewData;
            }
            return user.copy(str, str2, creatorPreviewData);
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
        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final User copy(String __typename, String id, CreatorPreviewData creatorPreviewData) {
            __typename.getClass();
            id.getClass();
            creatorPreviewData.getClass();
            return new User(__typename, id, creatorPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.id, user.id) && g76.L(this.creatorPreviewData, user.creatorPreviewData);
        }

        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.creatorPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            CreatorPreviewData creatorPreviewData = this.creatorPreviewData;
            StringBuilder sbU = y30.u("User(__typename=", str, ", id=", str2, ", creatorPreviewData=");
            sbU.append(creatorPreviewData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$ViewerEdge;", "", "__typename", "", "clappers", "Lcom/medium/android/graphql/CatalogUpVotersQuery$Clappers;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CatalogUpVotersQuery$Clappers;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getClappers", "()Lcom/medium/android/graphql/CatalogUpVotersQuery$Clappers;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final Clappers clappers;
        private final String id;

        public ViewerEdge(String str, Clappers clappers, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.clappers = clappers;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, Clappers clappers, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                clappers = viewerEdge.clappers;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, clappers, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Clappers getClappers() {
            return this.clappers;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, Clappers clappers, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, clappers, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.clappers, viewerEdge.clappers) && g76.L(this.id, viewerEdge.id);
        }

        public final Clappers getClappers() {
            return this.clappers;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Clappers clappers = this.clappers;
            return this.id.hashCode() + ((iHashCode + (clappers == null ? 0 : clappers.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Clappers clappers = this.clappers;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", clappers=");
            sb.append(clappers);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public CatalogUpVotersQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput) {
        str.getClass();
        catalogPagingOptionsInput.getClass();
        this.catalogId = str;
        this.pagingOptionsInput = catalogPagingOptionsInput;
    }

    public static /* synthetic */ CatalogUpVotersQuery copy$default(CatalogUpVotersQuery catalogUpVotersQuery, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogUpVotersQuery.catalogId;
        }
        if ((i & 2) != 0) {
            catalogPagingOptionsInput = catalogUpVotersQuery.pagingOptionsInput;
        }
        return catalogUpVotersQuery.copy(str, catalogPagingOptionsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CatalogUpVotersQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptionsInput() {
        return this.pagingOptionsInput;
    }

    public final CatalogUpVotersQuery copy(String catalogId, CatalogPagingOptionsInput pagingOptionsInput) {
        catalogId.getClass();
        pagingOptionsInput.getClass();
        return new CatalogUpVotersQuery(catalogId, pagingOptionsInput);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query CatalogUpVotersQuery($catalogId: ID!, $pagingOptionsInput: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ... on Catalog { viewerEdge { __typename clappers(pagingOptions: $pagingOptionsInput) { __typename clappers { __typename user { __typename ...CreatorPreviewData id } } paging { __typename ...CatalogPagingResultData } } id } id } } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogUpVotersQuery)) {
            return false;
        }
        CatalogUpVotersQuery catalogUpVotersQuery = (CatalogUpVotersQuery) other;
        return g76.L(this.catalogId, catalogUpVotersQuery.catalogId) && g76.L(this.pagingOptionsInput, catalogUpVotersQuery.pagingOptionsInput);
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final CatalogPagingOptionsInput getPagingOptionsInput() {
        return this.pagingOptionsInput;
    }

    public final int hashCode() {
        return this.pagingOptionsInput.hashCode() + (this.catalogId.hashCode() * 31);
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
        List<sx1> list = CatalogUpVotersQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CatalogUpVotersQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "CatalogUpVotersQuery(catalogId=" + this.catalogId + ", pagingOptionsInput=" + this.pagingOptionsInput + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CatalogUpVotersQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query CatalogUpVotersQuery($catalogId: ID!, $pagingOptionsInput: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ... on Catalog { viewerEdge { __typename clappers(pagingOptions: $pagingOptionsInput) { __typename clappers { __typename user { __typename ...CreatorPreviewData id } } paging { __typename ...CatalogPagingResultData } } id } id } } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
