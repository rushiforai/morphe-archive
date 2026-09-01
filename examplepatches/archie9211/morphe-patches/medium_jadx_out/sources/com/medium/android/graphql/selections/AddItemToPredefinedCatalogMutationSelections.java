package com.medium.android.graphql.selections;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.graphql.type.AddToPredefinedCatalogResult;
import com.medium.android.graphql.type.CatalogItemV2;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
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
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/AddItemToPredefinedCatalogMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__insertedItem", "Ljava/util/List;", "__onAddToPredefinedCatalogSucces", "__onBadRequest", "__onUnauthorized", "__addToPredefinedCatalog", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AddItemToPredefinedCatalogMutationSelections {
    public static final AddItemToPredefinedCatalogMutationSelections INSTANCE = new AddItemToPredefinedCatalogMutationSelections();
    private static final List<sx1> __addToPredefinedCatalog;
    private static final List<sx1> __insertedItem;
    private static final List<sx1> __onAddToPredefinedCatalogSucces;
    private static final List<sx1> __onBadRequest;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __root;

    private AddItemToPredefinedCatalogMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("catalogId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("catalogItemId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __insertedItem = listR;
        nx1 nx1Var = new nx1("version", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogItemV2.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var, new nx1("insertedItem", kyd.b(CatalogItemV2.type), null, ey3Var, ey3Var, listR));
        __onAddToPredefinedCatalogSucces = listR2;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onBadRequest = listQ;
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listQ2 = d46.Q(new nx1(KLTXZbnQvj.ZjYVhBGhEsSOy, zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ2;
        List<sx1> listR3 = d46.R(new nx1(CspinKvYN.cSEKwjaVosxZdF, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("AddToPredefinedCatalogSucces", d46.Q("AddToPredefinedCatalogSucces"), listR2), new ox1("BadRequest", d46.Q("BadRequest"), listQ), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ2));
        __addToPredefinedCatalog = listR3;
        AddToPredefinedCatalogResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(AddToPredefinedCatalogResult.type);
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__addToPredefinedCatalog_operation;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("operation")));
        mx1 mx1Var2 = Mutation.__addToPredefinedCatalog_type;
        __root = d46.Q(new nx1("addToPredefinedCatalog", rx1VarB, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "type")))), listR3));
    }
}
