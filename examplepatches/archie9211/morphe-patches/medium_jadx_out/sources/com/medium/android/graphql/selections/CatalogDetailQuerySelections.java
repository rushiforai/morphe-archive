package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CatalogDetailDataSelections;
import com.medium.android.graphql.type.CatalogResult;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010\u0007\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/selections/CatalogDetailQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onForbidden", "Ljava/util/List;", "__onNotFound", "__catalogById", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogDetailQuerySelections {
    public static final CatalogDetailQuerySelections INSTANCE = new CatalogDetailQuerySelections();
    private static final List<sx1> __catalogById;
    private static final List<sx1> __onForbidden;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __root;

    static {
        zl2 zl2VarI = y30.i(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("message", zl2VarI, null, ey3Var, ey3Var, ey3Var));
        __onForbidden = listQ;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ2;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Catalog");
        List<sx1> list = CatalogDetailDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Catalog", listQ3, list), new ox1("Forbidden", d46.Q("Forbidden"), listQ), new ox1("NotFound", d46.Q("NotFound"), listQ2));
        __catalogById = listR;
        CatalogResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CatalogResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__catalogById_catalogId;
        mx1Var.getClass();
        __root = d46.Q(new nx1("catalogById", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("catalogId"))), listR));
    }

    private CatalogDetailQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
