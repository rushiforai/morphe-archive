package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.CatalogResult;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.CatalogVisibility;
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
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/CatalogEditInfoQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onCatalog", "Ljava/util/List;", "__onForbidden", "__onNotFound", "__catalogById", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogEditInfoQuerySelections {
    public static final CatalogEditInfoQuerySelections INSTANCE = new CatalogEditInfoQuerySelections();
    private static final List<sx1> __catalogById;
    private static final List<sx1> __onCatalog;
    private static final List<sx1> __onForbidden;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarE = y30.e(GraphQLID.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("id", rx1VarE, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("name", y30.f(GraphQLString.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("description", zl2Var, null, ey3Var, ey3Var, ey3Var);
        CatalogVisibility.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("visibility", kyd.b(CatalogVisibility.type), null, ey3Var, ey3Var, ey3Var);
        CatalogType.INSTANCE.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, nx1Var3, nx1Var4, new nx1("type", kyd.b(CatalogType.type), null, ey3Var, ey3Var, ey3Var));
        __onCatalog = listR;
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listQ = d46.Q(new nx1("message", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __onForbidden = listQ;
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("message", zl2Var3, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ2;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Catalog", d46.Q("Catalog"), listR), new ox1("Forbidden", d46.Q("Forbidden"), listQ), new ox1("NotFound", d46.Q("NotFound"), listQ2));
        __catalogById = listR2;
        CatalogResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CatalogResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__catalogById_catalogId;
        mx1Var.getClass();
        __root = d46.Q(new nx1("catalogById", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("catalogId"))), listR2));
    }

    private CatalogEditInfoQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
