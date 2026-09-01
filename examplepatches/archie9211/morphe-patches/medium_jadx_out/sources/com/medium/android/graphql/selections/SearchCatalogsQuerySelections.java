package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.SearchCatalogResultsSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.Search;
import com.medium.android.graphql.type.SearchCatalogResult;
import com.medium.android.graphql.type.SearchResult;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010\u0007\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/selections/SearchCatalogsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__catalogs", "Ljava/util/List;", "__onSearch", "__search", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SearchCatalogsQuerySelections {
    public static final SearchCatalogsQuerySelections INSTANCE = new SearchCatalogsQuerySelections();
    private static final List<sx1> __catalogs;
    private static final List<sx1> __onSearch;
    private static final List<sx1> __root;
    private static final List<sx1> __search;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("SearchCatalog");
        List<sx1> list = SearchCatalogResultsSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "SearchCatalog", listQ, list));
        __catalogs = listR;
        SearchCatalogResult.INSTANCE.getClass();
        b1e b1eVar = SearchCatalogResult.type;
        b1eVar.getClass();
        Search.INSTANCE.getClass();
        mx1 mx1Var = Search.__catalogs_algoliaOptions;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("algoliaOptions")));
        mx1 mx1Var2 = Search.__catalogs_pagingOptions;
        List<sx1> listQ2 = d46.Q(new nx1("catalogs", b1eVar, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "pagingOptions")))), listR));
        __onSearch = listQ2;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Search", d46.Q("Search"), listQ2));
        __search = listR2;
        SearchResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(SearchResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var3 = Query.__search_query;
        mx1Var3.getClass();
        __root = d46.Q(new nx1("search", rx1VarB, null, ey3Var, ka1.y(mx1Var3, new yv8(new tx1("query"))), listR2));
    }

    private SearchCatalogsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
