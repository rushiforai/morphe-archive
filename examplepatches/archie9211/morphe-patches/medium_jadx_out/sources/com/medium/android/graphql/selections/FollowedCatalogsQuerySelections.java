package com.medium.android.graphql.selections;

import androidx.core.widget.nRCC.nGxjfIr;
import com.medium.android.graphql.fragment.selections.CatalogPagingResultDataSelections;
import com.medium.android.graphql.fragment.selections.CatalogPreviewDataSelections;
import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.CatalogPagingResult;
import com.medium.android.graphql.type.CatalogsConnection;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.mx1;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/FollowedCatalogsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__catalogs", "Ljava/util/List;", "__paging", "__followingCatalogsConnection", "__viewerEdge", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowedCatalogsQuerySelections {
    public static final FollowedCatalogsQuerySelections INSTANCE = new FollowedCatalogsQuerySelections();
    private static final List<sx1> __catalogs;
    private static final List<sx1> __followingCatalogsConnection;
    private static final List<sx1> __paging;
    private static final List<sx1> __root;
    private static final List<sx1> __user;
    private static final List<sx1> __viewerEdge;

    private FollowedCatalogsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Catalog");
        List<sx1> list = CatalogPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Catalog", listQ, list), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __catalogs = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("CatalogPagingResult");
        List<sx1> list2 = CatalogPagingResultDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "CatalogPagingResult", listQ2, list2));
        __paging = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Catalog.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("catalogs", new rx1(new px1(kyd.b(Catalog.type))), null, ey3Var, ey3Var, listR);
        CatalogPagingResult.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var3, nx1Var4, new nx1("paging", kyd.b(CatalogPagingResult.type), null, ey3Var, ey3Var, listR2));
        __followingCatalogsConnection = listR3;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogsConnection.INSTANCE.getClass();
        sm8 sm8Var = CatalogsConnection.type;
        sm8Var.getClass();
        UserViewerEdge.INSTANCE.getClass();
        mx1 mx1Var = UserViewerEdge.__followingCatalogsConnection_pagingOptions;
        mx1Var.getClass();
        List<sx1> listR4 = d46.R(nx1Var5, new nx1("followingCatalogsConnection", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("pagingOptions"))), listR3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR5;
        __root = d46.Q(new nx1("user", ka1.n(User.INSTANCE), null, ey3Var, ka1.y(lv8.j(Query.INSTANCE), new yv8(new tx1(nGxjfIr.GNlHGyJOmU))), listR5));
    }
}
