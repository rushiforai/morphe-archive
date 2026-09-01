package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SearchCatalogsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.SearchCatalogsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.SearchCatalogResults;
import com.medium.android.graphql.selections.SearchCatalogsQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.km4;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 22\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000534562B3\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\rJ'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\rJ\u0018\u0010 \u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b \u0010!J\u0018\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005HÆ\u0003¢\u0006\u0004\b\"\u0010!J>\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00052\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005HÆ\u0001¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b%\u0010\rJ\u0010\u0010'\u001a\u00020&HÖ\u0001¢\u0006\u0004\b'\u0010(J\u001a\u0010+\u001a\u00020\u00142\b\u0010*\u001a\u0004\u0018\u00010)HÖ\u0003¢\u0006\u0004\b+\u0010,R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010-\u001a\u0004\b.\u0010\rR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010/\u001a\u0004\b0\u0010!R\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00058\u0006¢\u0006\f\n\u0004\b\t\u0010/\u001a\u0004\b1\u0010!¨\u00067"}, d2 = {"Lcom/medium/android/graphql/SearchCatalogsQuery;", "Luqa;", "Lcom/medium/android/graphql/SearchCatalogsQuery$Data;", "", "query", "Lzv8;", "Lcom/medium/android/graphql/type/SearchPagingOptions;", "pagingOptions", "Lcom/medium/android/graphql/type/SearchOptions;", "algoliaOptions", "<init>", "(Ljava/lang/String;Lzv8;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "component3", "copy", "(Ljava/lang/String;Lzv8;Lzv8;)Lcom/medium/android/graphql/SearchCatalogsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getQuery", "Lzv8;", "getPagingOptions", "getAlgoliaOptions", "Companion", "Data", "Search", "OnSearch", "Catalogs", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SearchCatalogsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "cb5f77b6ad76461a8e1648366943a24997ce23fa5799d87b2eb45730497f8ef6";
    public static final String OPERATION_NAME = "SearchCatalogsQuery";
    private final zv8 algoliaOptions;
    private final zv8 pagingOptions;
    private final String query;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/SearchCatalogsQuery$Catalogs;", "", "__typename", "", "searchCatalogResults", "Lcom/medium/android/graphql/fragment/SearchCatalogResults;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/SearchCatalogResults;)V", "get__typename", "()Ljava/lang/String;", "getSearchCatalogResults", "()Lcom/medium/android/graphql/fragment/SearchCatalogResults;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Catalogs {
        private final String __typename;
        private final SearchCatalogResults searchCatalogResults;

        public Catalogs(String str, SearchCatalogResults searchCatalogResults) {
            str.getClass();
            this.__typename = str;
            this.searchCatalogResults = searchCatalogResults;
        }

        public static /* synthetic */ Catalogs copy$default(Catalogs catalogs, String str, SearchCatalogResults searchCatalogResults, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogs.__typename;
            }
            if ((i & 2) != 0) {
                searchCatalogResults = catalogs.searchCatalogResults;
            }
            return catalogs.copy(str, searchCatalogResults);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final SearchCatalogResults getSearchCatalogResults() {
            return this.searchCatalogResults;
        }

        public final Catalogs copy(String __typename, SearchCatalogResults searchCatalogResults) {
            __typename.getClass();
            return new Catalogs(__typename, searchCatalogResults);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Catalogs)) {
                return false;
            }
            Catalogs catalogs = (Catalogs) other;
            return g76.L(this.__typename, catalogs.__typename) && g76.L(this.searchCatalogResults, catalogs.searchCatalogResults);
        }

        public final SearchCatalogResults getSearchCatalogResults() {
            return this.searchCatalogResults;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            SearchCatalogResults searchCatalogResults = this.searchCatalogResults;
            return iHashCode + (searchCatalogResults == null ? 0 : searchCatalogResults.hashCode());
        }

        public final String toString() {
            return "Catalogs(__typename=" + this.__typename + ", searchCatalogResults=" + this.searchCatalogResults + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SearchCatalogsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/SearchCatalogsQuery$Search;", "search", "<init>", "(Lcom/medium/android/graphql/SearchCatalogsQuery$Search;)V", "component1", "()Lcom/medium/android/graphql/SearchCatalogsQuery$Search;", "copy", "(Lcom/medium/android/graphql/SearchCatalogsQuery$Search;)Lcom/medium/android/graphql/SearchCatalogsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SearchCatalogsQuery$Search;", "getSearch", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Search search;

        public Data(Search search) {
            search.getClass();
            this.search = search;
        }

        public static /* synthetic */ Data copy$default(Data data, Search search, int i, Object obj) {
            if ((i & 1) != 0) {
                search = data.search;
            }
            return data.copy(search);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Search getSearch() {
            return this.search;
        }

        public final Data copy(Search search) {
            search.getClass();
            return new Data(search);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.search, ((Data) other).search);
        }

        public final Search getSearch() {
            return this.search;
        }

        public final int hashCode() {
            return this.search.hashCode();
        }

        public final String toString() {
            return "Data(search=" + this.search + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/SearchCatalogsQuery$OnSearch;", "", "catalogs", "Lcom/medium/android/graphql/SearchCatalogsQuery$Catalogs;", "<init>", "(Lcom/medium/android/graphql/SearchCatalogsQuery$Catalogs;)V", "getCatalogs", "()Lcom/medium/android/graphql/SearchCatalogsQuery$Catalogs;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnSearch {
        private final Catalogs catalogs;

        public OnSearch(Catalogs catalogs) {
            this.catalogs = catalogs;
        }

        public static OnSearch copy$default(OnSearch onSearch, Catalogs catalogs, int i, Object obj) {
            if ((i & 1) != 0) {
                catalogs = onSearch.catalogs;
            }
            onSearch.getClass();
            return new OnSearch(catalogs);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Catalogs getCatalogs() {
            return this.catalogs;
        }

        public final OnSearch copy(Catalogs catalogs) {
            return new OnSearch(catalogs);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnSearch) && g76.L(this.catalogs, ((OnSearch) other).catalogs);
        }

        public final Catalogs getCatalogs() {
            return this.catalogs;
        }

        public final int hashCode() {
            Catalogs catalogs = this.catalogs;
            if (catalogs == null) {
                return 0;
            }
            return catalogs.hashCode();
        }

        public final String toString() {
            return "OnSearch(catalogs=" + this.catalogs + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/SearchCatalogsQuery$Search;", "", "__typename", "", "onSearch", "Lcom/medium/android/graphql/SearchCatalogsQuery$OnSearch;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/SearchCatalogsQuery$OnSearch;)V", "get__typename", "()Ljava/lang/String;", "getOnSearch", "()Lcom/medium/android/graphql/SearchCatalogsQuery$OnSearch;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Search {
        private final String __typename;
        private final OnSearch onSearch;

        public Search(String str, OnSearch onSearch) {
            str.getClass();
            this.__typename = str;
            this.onSearch = onSearch;
        }

        public static /* synthetic */ Search copy$default(Search search, String str, OnSearch onSearch, int i, Object obj) {
            if ((i & 1) != 0) {
                str = search.__typename;
            }
            if ((i & 2) != 0) {
                onSearch = search.onSearch;
            }
            return search.copy(str, onSearch);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnSearch getOnSearch() {
            return this.onSearch;
        }

        public final Search copy(String __typename, OnSearch onSearch) {
            __typename.getClass();
            return new Search(__typename, onSearch);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Search)) {
                return false;
            }
            Search search = (Search) other;
            return g76.L(this.__typename, search.__typename) && g76.L(this.onSearch, search.onSearch);
        }

        public final OnSearch getOnSearch() {
            return this.onSearch;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnSearch onSearch = this.onSearch;
            return iHashCode + (onSearch == null ? 0 : onSearch.hashCode());
        }

        public final String toString() {
            return "Search(__typename=" + this.__typename + ", onSearch=" + this.onSearch + ")";
        }
    }

    public SearchCatalogsQuery(String str, zv8 zv8Var, zv8 zv8Var2) {
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        this.query = str;
        this.pagingOptions = zv8Var;
        this.algoliaOptions = zv8Var2;
    }

    public static /* synthetic */ SearchCatalogsQuery copy$default(SearchCatalogsQuery searchCatalogsQuery, String str, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = searchCatalogsQuery.query;
        }
        if ((i & 2) != 0) {
            zv8Var = searchCatalogsQuery.pagingOptions;
        }
        if ((i & 4) != 0) {
            zv8Var2 = searchCatalogsQuery.algoliaOptions;
        }
        return searchCatalogsQuery.copy(str, zv8Var, zv8Var2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SearchCatalogsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getQuery() {
        return this.query;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPagingOptions() {
        return this.pagingOptions;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getAlgoliaOptions() {
        return this.algoliaOptions;
    }

    public final SearchCatalogsQuery copy(String query, zv8 pagingOptions, zv8 algoliaOptions) {
        query.getClass();
        pagingOptions.getClass();
        algoliaOptions.getClass();
        return new SearchCatalogsQuery(query, pagingOptions, algoliaOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query SearchCatalogsQuery($query: String!, $pagingOptions: SearchPagingOptions, $algoliaOptions: SearchOptions) { search(query: $query) { __typename ... on Search { catalogs(pagingOptions: $pagingOptions, algoliaOptions: $algoliaOptions) { __typename ...SearchCatalogResults } } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment SearchCatalogResults on SearchCatalog { __typename queryId items { __typename algoliaObjectId ...CatalogPreviewData id } pagingInfo { __typename next { __typename ...PagingParamsData } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SearchCatalogsQuery)) {
            return false;
        }
        SearchCatalogsQuery searchCatalogsQuery = (SearchCatalogsQuery) other;
        return g76.L(this.query, searchCatalogsQuery.query) && g76.L(this.pagingOptions, searchCatalogsQuery.pagingOptions) && g76.L(this.algoliaOptions, searchCatalogsQuery.algoliaOptions);
    }

    public final zv8 getAlgoliaOptions() {
        return this.algoliaOptions;
    }

    public final zv8 getPagingOptions() {
        return this.pagingOptions;
    }

    public final String getQuery() {
        return this.query;
    }

    public final int hashCode() {
        return this.algoliaOptions.hashCode() + lv8.h(this.pagingOptions, this.query.hashCode() * 31, 31);
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
        List<sx1> list = SearchCatalogsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SearchCatalogsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.query;
        zv8 zv8Var = this.pagingOptions;
        zv8 zv8Var2 = this.algoliaOptions;
        StringBuilder sb = new StringBuilder("SearchCatalogsQuery(query=");
        sb.append(str);
        sb.append(", pagingOptions=");
        sb.append(zv8Var);
        sb.append(", algoliaOptions=");
        return km4.B(sb, zv8Var2, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SearchCatalogsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query SearchCatalogsQuery($query: String!, $pagingOptions: SearchPagingOptions, $algoliaOptions: SearchOptions) { search(query: $query) { __typename ... on Search { catalogs(pagingOptions: $pagingOptions, algoliaOptions: $algoliaOptions) { __typename ...SearchCatalogResults } } } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment CatalogSummaryData on Catalog { __typename id name type visibility predefined creator { __typename id name username imageId viewerEdge { __typename id isUser } verifications { __typename isBookAuthor } ...UserNewsletterData } version itemsLastInsertedAt postItemsCount viewerEdge { __typename id followersCount } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogPreviewData on Catalog { __typename ...CatalogSummaryData id itemsConnection(pagingOptions: { limit: 10 } ) { __typename items { __typename catalogItemId entity { __typename ... on Post { id previewImage { __typename ...ImageMetadataData id } } ...CatalogItemUserData } } paging { __typename count } } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment SearchCatalogResults on SearchCatalog { __typename queryId items { __typename algoliaObjectId ...CatalogPreviewData id } pagingInfo { __typename next { __typename ...PagingParamsData } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SearchCatalogsQuery(String str, zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 2;
        xv8 xv8Var = xv8.a;
        this(str, i2 != 0 ? xv8Var : zv8Var, (i & 4) != 0 ? xv8Var : zv8Var2);
    }
}
