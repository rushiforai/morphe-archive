package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CatalogClapsDataSelections;
import com.medium.android.graphql.type.CatalogResult;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
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
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/selections/CatalogUpVotersGlobalDataQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onCatalog", "Ljava/util/List;", "__catalogById", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogUpVotersGlobalDataQuerySelections {
    public static final CatalogUpVotersGlobalDataQuerySelections INSTANCE = new CatalogUpVotersGlobalDataQuerySelections();
    private static final List<sx1> __catalogById;
    private static final List<sx1> __onCatalog;
    private static final List<sx1> __root;

    static {
        Long.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(Long.type);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("clappersCount", rx1VarB, null, ey3Var, ey3Var, ey3Var), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onCatalog = listR;
        nx1 nx1Var = new nx1("__typename", y30.f(GraphQLString.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        ox1 ox1Var = new ox1("Catalog", d46.Q("Catalog"), listR);
        List listQ = d46.Q("Catalog");
        List<sx1> list = CatalogClapsDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var, ox1Var, y30.c(list, "Catalog", listQ, list));
        __catalogById = listR2;
        CatalogResult.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(CatalogResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__catalogById_catalogId;
        mx1Var.getClass();
        __root = d46.Q(new nx1("catalogById", rx1VarB2, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("catalogId"))), listR2));
    }

    private CatalogUpVotersGlobalDataQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
