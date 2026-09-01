package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CatalogPagingResultDataSelections;
import com.medium.android.graphql.fragment.selections.CreatorPreviewDataSelections;
import com.medium.android.graphql.type.CatalogClapper;
import com.medium.android.graphql.type.CatalogClapperConnection;
import com.medium.android.graphql.type.CatalogPagingResult;
import com.medium.android.graphql.type.CatalogResult;
import com.medium.android.graphql.type.CatalogViewerEdge;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000e\u0010\u0007\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/selections/CatalogUpVotersQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__user", "Ljava/util/List;", "__clappers1", "__paging", "__clappers", "__viewerEdge", "__onCatalog", "__catalogById", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogUpVotersQuerySelections {
    public static final CatalogUpVotersQuerySelections INSTANCE = new CatalogUpVotersQuerySelections();
    private static final List<sx1> __catalogById;
    private static final List<sx1> __clappers;
    private static final List<sx1> __clappers1;
    private static final List<sx1> __onCatalog;
    private static final List<sx1> __paging;
    private static final List<sx1> __root;
    private static final List<sx1> __user;
    private static final List<sx1> __viewerEdge;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("User");
        List<sx1> list = CreatorPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "User", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("user", y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR));
        __clappers1 = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("CatalogPagingResult");
        List<sx1> list2 = CatalogPagingResultDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var2, y30.c(list2, "CatalogPagingResult", listQ2, list2));
        __paging = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogClapper.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("clappers", new rx1(new px1(kyd.b(CatalogClapper.type))), null, ey3Var, ey3Var, listR2);
        CatalogPagingResult.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, nx1Var4, new nx1("paging", kyd.b(CatalogPagingResult.type), null, ey3Var, ey3Var, listR3));
        __clappers = listR4;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogClapperConnection.INSTANCE.getClass();
        sm8 sm8Var = CatalogClapperConnection.type;
        sm8Var.getClass();
        CatalogViewerEdge.INSTANCE.getClass();
        mx1 mx1Var = CatalogViewerEdge.__clappers_pagingOptions;
        mx1Var.getClass();
        List<sx1> listR5 = d46.R(nx1Var5, new nx1("clappers", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("pagingOptionsInput"))), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR5;
        List<sx1> listR6 = d46.R(new nx1("viewerEdge", kyd.b(CatalogViewerEdge.type), null, ey3Var, ey3Var, listR5), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onCatalog = listR6;
        List<sx1> listR7 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Catalog", d46.Q("Catalog"), listR6));
        __catalogById = listR7;
        CatalogResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CatalogResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var2 = Query.__catalogById_catalogId;
        mx1Var2.getClass();
        __root = d46.Q(new nx1("catalogById", rx1VarB, null, ey3Var, ka1.y(mx1Var2, new yv8(new tx1("catalogId"))), listR7));
    }

    private CatalogUpVotersQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
