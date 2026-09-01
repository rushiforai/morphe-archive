package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SearchPostsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.SearchPostsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.SearchPostResults;
import com.medium.android.graphql.selections.SearchPostsQuerySelections;
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
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 22\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000534562B3\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\rJ'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\rJ\u0018\u0010 \u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b \u0010!J\u0018\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005HÆ\u0003¢\u0006\u0004\b\"\u0010!J>\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00052\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005HÆ\u0001¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b%\u0010\rJ\u0010\u0010'\u001a\u00020&HÖ\u0001¢\u0006\u0004\b'\u0010(J\u001a\u0010+\u001a\u00020\u00142\b\u0010*\u001a\u0004\u0018\u00010)HÖ\u0003¢\u0006\u0004\b+\u0010,R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010-\u001a\u0004\b.\u0010\rR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010/\u001a\u0004\b0\u0010!R\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00058\u0006¢\u0006\f\n\u0004\b\t\u0010/\u001a\u0004\b1\u0010!¨\u00067"}, d2 = {"Lcom/medium/android/graphql/SearchPostsQuery;", "Luqa;", "Lcom/medium/android/graphql/SearchPostsQuery$Data;", "", "query", "Lzv8;", "Lcom/medium/android/graphql/type/SearchPagingOptions;", "pagingOptions", "Lcom/medium/android/graphql/type/SearchOptions;", "algoliaOptions", "<init>", "(Ljava/lang/String;Lzv8;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "component3", "copy", "(Ljava/lang/String;Lzv8;Lzv8;)Lcom/medium/android/graphql/SearchPostsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getQuery", "Lzv8;", "getPagingOptions", "getAlgoliaOptions", "Companion", "Data", "Search", "OnSearch", "Posts", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SearchPostsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "a5fc61898ae97c47ec0f42c1568847e41188abb353974b13530a6ae69fe724c2";
    public static final String OPERATION_NAME = "SearchPostsQuery";
    private final zv8 algoliaOptions;
    private final zv8 pagingOptions;
    private final String query;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SearchPostsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/SearchPostsQuery$Search;", "search", "<init>", "(Lcom/medium/android/graphql/SearchPostsQuery$Search;)V", "component1", "()Lcom/medium/android/graphql/SearchPostsQuery$Search;", "copy", "(Lcom/medium/android/graphql/SearchPostsQuery$Search;)Lcom/medium/android/graphql/SearchPostsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SearchPostsQuery$Search;", "getSearch", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/SearchPostsQuery$OnSearch;", "", "posts", "Lcom/medium/android/graphql/SearchPostsQuery$Posts;", "<init>", "(Lcom/medium/android/graphql/SearchPostsQuery$Posts;)V", "getPosts", "()Lcom/medium/android/graphql/SearchPostsQuery$Posts;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnSearch {
        private final Posts posts;

        public OnSearch(Posts posts) {
            this.posts = posts;
        }

        public static OnSearch copy$default(OnSearch onSearch, Posts posts, int i, Object obj) {
            if ((i & 1) != 0) {
                posts = onSearch.posts;
            }
            onSearch.getClass();
            return new OnSearch(posts);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Posts getPosts() {
            return this.posts;
        }

        public final OnSearch copy(Posts posts) {
            return new OnSearch(posts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnSearch) && g76.L(this.posts, ((OnSearch) other).posts);
        }

        public final Posts getPosts() {
            return this.posts;
        }

        public final int hashCode() {
            Posts posts = this.posts;
            if (posts == null) {
                return 0;
            }
            return posts.hashCode();
        }

        public final String toString() {
            return "OnSearch(posts=" + this.posts + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/SearchPostsQuery$Posts;", "", "__typename", "", "searchPostResults", "Lcom/medium/android/graphql/fragment/SearchPostResults;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/SearchPostResults;)V", "get__typename", "()Ljava/lang/String;", "getSearchPostResults", "()Lcom/medium/android/graphql/fragment/SearchPostResults;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Posts {
        private final String __typename;
        private final SearchPostResults searchPostResults;

        public Posts(String str, SearchPostResults searchPostResults) {
            str.getClass();
            this.__typename = str;
            this.searchPostResults = searchPostResults;
        }

        public static /* synthetic */ Posts copy$default(Posts posts, String str, SearchPostResults searchPostResults, int i, Object obj) {
            if ((i & 1) != 0) {
                str = posts.__typename;
            }
            if ((i & 2) != 0) {
                searchPostResults = posts.searchPostResults;
            }
            return posts.copy(str, searchPostResults);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final SearchPostResults getSearchPostResults() {
            return this.searchPostResults;
        }

        public final Posts copy(String __typename, SearchPostResults searchPostResults) {
            __typename.getClass();
            return new Posts(__typename, searchPostResults);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Posts)) {
                return false;
            }
            Posts posts = (Posts) other;
            return g76.L(this.__typename, posts.__typename) && g76.L(this.searchPostResults, posts.searchPostResults);
        }

        public final SearchPostResults getSearchPostResults() {
            return this.searchPostResults;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            SearchPostResults searchPostResults = this.searchPostResults;
            return iHashCode + (searchPostResults == null ? 0 : searchPostResults.hashCode());
        }

        public final String toString() {
            return "Posts(__typename=" + this.__typename + ", searchPostResults=" + this.searchPostResults + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/SearchPostsQuery$Search;", "", "__typename", "", "onSearch", "Lcom/medium/android/graphql/SearchPostsQuery$OnSearch;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/SearchPostsQuery$OnSearch;)V", "get__typename", "()Ljava/lang/String;", "getOnSearch", "()Lcom/medium/android/graphql/SearchPostsQuery$OnSearch;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public SearchPostsQuery(String str, zv8 zv8Var, zv8 zv8Var2) {
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        this.query = str;
        this.pagingOptions = zv8Var;
        this.algoliaOptions = zv8Var2;
    }

    public static /* synthetic */ SearchPostsQuery copy$default(SearchPostsQuery searchPostsQuery, String str, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = searchPostsQuery.query;
        }
        if ((i & 2) != 0) {
            zv8Var = searchPostsQuery.pagingOptions;
        }
        if ((i & 4) != 0) {
            zv8Var2 = searchPostsQuery.algoliaOptions;
        }
        return searchPostsQuery.copy(str, zv8Var, zv8Var2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SearchPostsQuery_ResponseAdapter.Data.INSTANCE, false);
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

    public final SearchPostsQuery copy(String query, zv8 pagingOptions, zv8 algoliaOptions) {
        query.getClass();
        pagingOptions.getClass();
        algoliaOptions.getClass();
        return new SearchPostsQuery(query, pagingOptions, algoliaOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query SearchPostsQuery($query: String!, $pagingOptions: SearchPagingOptions, $algoliaOptions: SearchOptions) { search(query: $query) { __typename ... on Search { posts(pagingOptions: $pagingOptions, algoliaOptions: $algoliaOptions) { __typename ...SearchPostResults } } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment PostSearchData on Post { __typename algoliaObjectId ...PostPreviewData id }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment SearchPostResults on SearchPost { __typename queryId items { __typename ...PostSearchData id } pagingInfo { __typename next { __typename ...PagingParamsData } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SearchPostsQuery)) {
            return false;
        }
        SearchPostsQuery searchPostsQuery = (SearchPostsQuery) other;
        return g76.L(this.query, searchPostsQuery.query) && g76.L(this.pagingOptions, searchPostsQuery.pagingOptions) && g76.L(this.algoliaOptions, searchPostsQuery.algoliaOptions);
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
        List<sx1> list = SearchPostsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SearchPostsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.query;
        zv8 zv8Var = this.pagingOptions;
        zv8 zv8Var2 = this.algoliaOptions;
        StringBuilder sb = new StringBuilder("SearchPostsQuery(query=");
        sb.append(str);
        sb.append(", pagingOptions=");
        sb.append(zv8Var);
        sb.append(", algoliaOptions=");
        return km4.B(sb, zv8Var2, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SearchPostsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query SearchPostsQuery($query: String!, $pagingOptions: SearchPagingOptions, $algoliaOptions: SearchOptions) { search(query: $query) { __typename ... on Search { posts(pagingOptions: $pagingOptions, algoliaOptions: $algoliaOptions) { __typename ...SearchPostResults } } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment PostSearchData on Post { __typename algoliaObjectId ...PostPreviewData id }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment SearchPostResults on SearchPost { __typename queryId items { __typename ...PostSearchData id } pagingInfo { __typename next { __typename ...PagingParamsData } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SearchPostsQuery(String str, zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 2;
        xv8 xv8Var = xv8.a;
        this(str, i2 != 0 ? xv8Var : zv8Var, (i & 4) != 0 ? xv8Var : zv8Var2);
    }
}
