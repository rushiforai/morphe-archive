package com.medium.android.graphql.fragment.selections;

import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.ThreadedCatalogResponseConnection;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CatalogResponsesSelections;", "", "<init>", "()V", "", "Lsx1;", "__creator", "Ljava/util/List;", "__threadedCatalogResponses", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogResponsesSelections {
    public static final CatalogResponsesSelections INSTANCE = new CatalogResponsesSelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __root;
    private static final List<sx1> __threadedCatalogResponses;

    private CatalogResponsesSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __creator = listR;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("ThreadedCatalogResponseConnection");
        List<sx1> list = ResponseCatalogThreadDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var3, y30.c(list, "ThreadedCatalogResponseConnection", listQ, list));
        __threadedCatalogResponses = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("responsesLocked", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var6 = new nx1("disallowResponses", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var);
        Long.INSTANCE.getClass();
        nx1 nx1Var7 = new nx1("responsesCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var8 = new nx1(KLTXZbnQvj.URAm, y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR);
        ThreadedCatalogResponseConnection.INSTANCE.getClass();
        sm8 sm8Var = ThreadedCatalogResponseConnection.type;
        sm8Var.getClass();
        Catalog.INSTANCE.getClass();
        mx1 mx1Var = Catalog.__threadedCatalogResponses_paging;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("paging")));
        mx1 mx1Var2 = Catalog.__threadedCatalogResponses_sortType;
        __root = d46.R(nx1Var4, nx1Var5, nx1Var6, nx1Var7, nx1Var8, new nx1("threadedCatalogResponses", sm8Var, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "sortType")))), listR2), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
    }
}
