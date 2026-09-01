package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CatalogItemDataSelections;
import com.medium.android.graphql.fragment.selections.CatalogPagingResultDataSelections;
import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.CatalogItemV2;
import com.medium.android.graphql.type.CatalogItemsConnection;
import com.medium.android.graphql.type.CatalogPagingResult;
import com.medium.android.graphql.type.CatalogResult;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/CatalogItemsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__items", "Ljava/util/List;", "__paging", "__itemsConnection", "__onCatalog", "__catalogById", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogItemsQuerySelections {
    public static final CatalogItemsQuerySelections INSTANCE = new CatalogItemsQuerySelections();
    private static final List<sx1> __catalogById;
    private static final List<sx1> __items;
    private static final List<sx1> __itemsConnection;
    private static final List<sx1> __onCatalog;
    private static final List<sx1> __paging;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("CatalogItemV2");
        List<sx1> list = CatalogItemDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "CatalogItemV2", listQ, list), new nx1("catalogItemId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __items = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("CatalogPagingResult");
        List<sx1> list2 = CatalogPagingResultDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "CatalogPagingResult", listQ2, list2));
        __paging = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogItemV2.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("items", new rx1(new px1(kyd.b(CatalogItemV2.type))), null, ey3Var, ey3Var, listR);
        CatalogPagingResult.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var3, nx1Var4, new nx1("paging", kyd.b(CatalogPagingResult.type), null, ey3Var, ey3Var, listR2));
        __itemsConnection = listR3;
        CatalogItemsConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CatalogItemsConnection.type);
        Catalog.INSTANCE.getClass();
        mx1 mx1Var = Catalog.__itemsConnection_pagingOptions;
        mx1Var.getClass();
        List<sx1> listR4 = d46.R(new nx1("itemsConnection", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("pagingOptions"))), listR3), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onCatalog = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Catalog", d46.Q("Catalog"), listR4));
        __catalogById = listR5;
        CatalogResult.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(CatalogResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var2 = Query.__catalogById_catalogId;
        mx1Var2.getClass();
        __root = d46.Q(new nx1("catalogById", rx1VarB2, null, ey3Var, ka1.y(mx1Var2, new yv8(new tx1("catalogId"))), listR5));
    }

    private CatalogItemsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
