package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.CatalogViewerEdge;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Membership;
import com.medium.android.graphql.type.User;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010\u0007\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CatalogDetailDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__viewerEdge", "Ljava/util/List;", "__membership", "__creator", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogDetailDataSelections {
    public static final CatalogDetailDataSelections INSTANCE = new CatalogDetailDataSelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __membership;
    private static final List<sx1> __root;
    private static final List<sx1> __viewerEdge;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("followersCount", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Membership");
        List<sx1> list = MembershipFragmentSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var, y30.c(list, "Membership", listQ, list));
        __membership = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("bio", zl2Var, null, ey3Var, ey3Var, ey3Var);
        Membership.INSTANCE.getClass();
        sm8 sm8Var = Membership.type;
        sm8Var.getClass();
        List<sx1> listR3 = d46.R(nx1Var2, nx1Var3, new nx1("membership", sm8Var, null, ey3Var, ey3Var, listR2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __creator = listR3;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Catalog");
        List<sx1> list2 = CatalogSummaryDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list2, "Catalog", listQ2, list2);
        List listQ3 = d46.Q("Catalog");
        List<sx1> list3 = CatalogClapsDataSelections.INSTANCE.get__root();
        ox1 ox1VarC2 = y30.c(list3, "Catalog", listQ3, list3);
        nx1 nx1Var5 = new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var6 = new nx1("description", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("disallowResponses", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        Long.INSTANCE.getClass();
        nx1 nx1Var8 = new nx1("itemsLastInsertedAt", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("responsesCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        CatalogViewerEdge.INSTANCE.getClass();
        __root = d46.R(nx1Var4, ox1VarC, ox1VarC2, nx1Var5, nx1Var6, nx1Var7, nx1Var8, nx1Var9, new nx1("viewerEdge", kyd.b(CatalogViewerEdge.type), null, ey3Var, ey3Var, listR), new nx1("creator", y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR3));
    }

    private CatalogDetailDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
