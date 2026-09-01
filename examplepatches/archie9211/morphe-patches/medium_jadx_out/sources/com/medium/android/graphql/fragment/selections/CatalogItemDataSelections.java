package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.CatalogEntity;
import com.medium.android.graphql.type.CatalogItemAnnotation;
import com.medium.android.graphql.type.GraphQLString;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CatalogItemDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__entity", "Ljava/util/List;", "__userAnnotation", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogItemDataSelections {
    public static final CatalogItemDataSelections INSTANCE = new CatalogItemDataSelections();
    private static final List<sx1> __entity;
    private static final List<sx1> __root;
    private static final List<sx1> __userAnnotation;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = CatalogItemPostDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "Post", listQ, list);
        List listQ2 = d46.Q("User");
        List<sx1> list2 = CatalogItemUserDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, ox1VarC, y30.c(list2, "User", listQ2, list2));
        __entity = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, new nx1("annotation", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __userAnnotation = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("catalogItemId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("catalogId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogEntity.INSTANCE.getClass();
        b1e b1eVar = CatalogEntity.type;
        b1eVar.getClass();
        nx1 nx1Var6 = new nx1("entity", b1eVar, null, ey3Var, ey3Var, listR);
        CatalogItemAnnotation.INSTANCE.getClass();
        sm8 sm8Var = CatalogItemAnnotation.type;
        sm8Var.getClass();
        __root = d46.R(nx1Var3, nx1Var4, nx1Var5, nx1Var6, new nx1("userAnnotation", sm8Var, null, ey3Var, ey3Var, listR2));
    }

    private CatalogItemDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
