package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.AnchorType;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MarkupType;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.n04;
import defpackage.nx1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001d\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0007\u001a\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/MarkupDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__root", "Ljava/util/List;", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MarkupDataSelections {
    public static final MarkupDataSelections INSTANCE = new MarkupDataSelections();
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var2 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        MarkupType.INSTANCE.getClass();
        n04 n04Var = MarkupType.type;
        n04Var.getClass();
        nx1 nx1Var3 = new nx1("type", n04Var, null, ey3Var, ey3Var, ey3Var);
        GraphQLInt.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("start", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("end", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var6 = new nx1("href", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var7 = new nx1("title", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        nx1 nx1Var8 = new nx1("rel", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        n04 n04Var2 = MarkupType.type;
        n04Var2.getClass();
        nx1 nx1Var9 = new nx1("type", n04Var2, null, ey3Var, ey3Var, ey3Var);
        AnchorType.INSTANCE.getClass();
        n04 n04Var3 = AnchorType.type;
        n04Var3.getClass();
        nx1 nx1Var10 = new nx1("anchorType", n04Var3, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        __root = d46.R(nx1Var, nx1Var2, nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, new nx1("userId", zl2Var5, null, ey3Var, ey3Var, ey3Var), new nx1("creatorIds", kyd.a(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
    }

    private MarkupDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
