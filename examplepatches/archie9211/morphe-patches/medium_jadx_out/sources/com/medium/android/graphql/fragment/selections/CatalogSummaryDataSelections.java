package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.CatalogViewerEdge;
import com.medium.android.graphql.type.CatalogVisibility;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import com.medium.android.graphql.type.VerifiedInfo;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.n04;
import defpackage.nx1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CatalogSummaryDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__viewerEdge", "Ljava/util/List;", "__verifications", "__creator", "__viewerEdge1", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogSummaryDataSelections {
    public static final CatalogSummaryDataSelections INSTANCE = new CatalogSummaryDataSelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __root;
    private static final List<sx1> __verifications;
    private static final List<sx1> __viewerEdge;
    private static final List<sx1> __viewerEdge1;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isUser", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isBookAuthor", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var));
        __verifications = listR2;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var4 = new nx1("username", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var5 = new nx1("imageId", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        UserViewerEdge.INSTANCE.getClass();
        nx1 nx1Var6 = new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR);
        VerifiedInfo.INSTANCE.getClass();
        sm8 sm8Var = VerifiedInfo.type;
        sm8Var.getClass();
        nx1 nx1Var7 = new nx1("verifications", sm8Var, null, ey3Var, ey3Var, listR2);
        List listQ = d46.Q("User");
        List<sx1> list = UserNewsletterDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var, nx1Var2, nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, y30.c(list, "User", listQ, list));
        __creator = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("followersCount", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge1 = listR4;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var10 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogType.INSTANCE.getClass();
        nx1 nx1Var11 = new nx1("type", kyd.b(CatalogType.type), null, ey3Var, ey3Var, ey3Var);
        CatalogVisibility.INSTANCE.getClass();
        nx1 nx1Var12 = new nx1("visibility", kyd.b(CatalogVisibility.type), null, ey3Var, ey3Var, ey3Var);
        PredefinedCatalogType.INSTANCE.getClass();
        n04 n04Var = PredefinedCatalogType.type;
        n04Var.getClass();
        nx1 nx1Var13 = new nx1("predefined", n04Var, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var14 = new nx1("creator", y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR3);
        nx1 nx1Var15 = new nx1("version", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Long.INSTANCE.getClass();
        nx1 nx1Var16 = new nx1("itemsLastInsertedAt", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var17 = new nx1("postItemsCount", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var);
        CatalogViewerEdge.INSTANCE.getClass();
        __root = d46.R(nx1Var8, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, nx1Var14, nx1Var15, nx1Var16, nx1Var17, new nx1("viewerEdge", kyd.b(CatalogViewerEdge.type), null, ey3Var, ey3Var, listR4));
    }

    private CatalogSummaryDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
