package com.medium.android.graphql.selections;

import com.drew.imaging.riff.pvS.uuLAxLN;
import com.medium.android.graphql.fragment.selections.CatalogPagingResultDataSelections;
import com.medium.android.graphql.fragment.selections.CatalogPreviewDataSelections;
import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.CatalogPagingResult;
import com.medium.android.graphql.type.CatalogsConnection;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.UserResult;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
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
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0010\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0007R\u001d\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0012\u0010\u0007\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/selections/UserCatalogsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__catalogs", "Ljava/util/List;", "__paging", "__catalogsConnection", "__viewerEdge", "__onUser", "__onGraphqlEmptyId", "__onNotFound", "__onSuspended", "__onBlocked", "__onAccountSuspended", "__userResult", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserCatalogsQuerySelections {
    public static final UserCatalogsQuerySelections INSTANCE = new UserCatalogsQuerySelections();
    private static final List<sx1> __catalogs;
    private static final List<sx1> __catalogsConnection;
    private static final List<sx1> __onAccountSuspended;
    private static final List<sx1> __onBlocked;
    private static final List<sx1> __onGraphqlEmptyId;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __onSuspended;
    private static final List<sx1> __onUser;
    private static final List<sx1> __paging;
    private static final List<sx1> __root;
    private static final List<sx1> __userResult;
    private static final List<sx1> __viewerEdge;

    private UserCatalogsQuerySelections() {
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
        __catalogsConnection = listR3;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogsConnection.INSTANCE.getClass();
        sm8 sm8Var = CatalogsConnection.type;
        sm8Var.getClass();
        UserViewerEdge.INSTANCE.getClass();
        mx1 mx1Var = UserViewerEdge.__catalogsConnection_pagingOptions;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("pagingOptions")));
        mx1 mx1Var2 = UserViewerEdge.__catalogsConnection_type;
        List<sx1> listR4 = d46.R(nx1Var5, new nx1("catalogsConnection", sm8Var, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "type")))), listR3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR4;
        List<sx1> listR5 = d46.R(new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onUser = listR5;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onGraphqlEmptyId = listQ3;
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("message", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ4;
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listQ5 = d46.Q(new nx1("message", zl2Var3, null, ey3Var, ey3Var, ey3Var));
        __onSuspended = listQ5;
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        List<sx1> listQ6 = d46.Q(new nx1("message", zl2Var4, null, ey3Var, ey3Var, ey3Var));
        __onBlocked = listQ6;
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        List<sx1> listQ7 = d46.Q(new nx1("message", zl2Var5, null, ey3Var, ey3Var, ey3Var));
        __onAccountSuspended = listQ7;
        List<sx1> listR6 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR5), new ox1("GraphqlEmptyId", d46.Q("GraphqlEmptyId"), listQ3), new ox1("NotFound", d46.Q("NotFound"), listQ4), new ox1("Suspended", d46.Q("Suspended"), listQ5), new ox1("Blocked", d46.Q("Blocked"), listQ6), new ox1("AccountSuspended", d46.Q("AccountSuspended"), listQ7));
        __userResult = listR6;
        UserResult.INSTANCE.getClass();
        b1e b1eVar = UserResult.type;
        b1eVar.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var3 = Query.__userResult_id;
        mx1Var3.getClass();
        __root = d46.Q(new nx1(uuLAxLN.Sjf, b1eVar, null, ey3Var, ka1.y(mx1Var3, new yv8(new tx1("userId"))), listR6));
    }
}
