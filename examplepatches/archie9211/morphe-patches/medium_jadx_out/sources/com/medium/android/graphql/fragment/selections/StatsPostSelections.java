package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.Currency;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Money;
import com.medium.android.graphql.type.PostEarnings;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.SummaryPostStat;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/StatsPostSelections;", "", "<init>", "()V", "", "Lsx1;", "__creator", "Ljava/util/List;", "__total", "__earnings", "__totalStats", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class StatsPostSelections {
    public static final StatsPostSelections INSTANCE = new StatsPostSelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __earnings;
    private static final List<sx1> __root;
    private static final List<sx1> __total;
    private static final List<sx1> __totalStats;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, nx1Var3, new nx1("imageId", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __creator = listR;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Currency.INSTANCE.getClass();
        nx1 nx1Var5 = new nx1("currencyCode", kyd.b(Currency.type), "currency", ey3Var, ey3Var, ey3Var);
        GraphQLInt.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var4, nx1Var5, new nx1("nanos", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var), new nx1("units", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var));
        __total = listR2;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Money.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var6, new nx1("total", kyd.b(Money.type), null, ey3Var, ey3Var, listR2));
        __earnings = listR3;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLInt.type;
        zl2Var3.getClass();
        nx1 nx1Var8 = new nx1("presentations", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLInt.type;
        zl2Var4.getClass();
        nx1 nx1Var9 = new nx1("views", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = GraphQLInt.type;
        zl2Var5.getClass();
        List<sx1> listR4 = d46.R(nx1Var7, nx1Var8, nx1Var9, new nx1("reads", zl2Var5, null, ey3Var, ey3Var, ey3Var));
        __totalStats = listR4;
        nx1 nx1Var10 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var11 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var6 = GraphQLString.type;
        zl2Var6.getClass();
        nx1 nx1Var12 = new nx1("title", zl2Var6, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var13 = new nx1("creator", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR);
        nx1 nx1Var14 = new nx1("firstPublishedAt", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var7 = Long.type;
        zl2Var7.getClass();
        nx1 nx1Var15 = new nx1("firstBoostedAt", zl2Var7, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var16 = new nx1("isLocked", ka1.e(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        PostVisibilityType.INSTANCE.getClass();
        nx1 nx1Var17 = new nx1("visibility", kyd.b(PostVisibilityType.type), null, ey3Var, ey3Var, ey3Var);
        PostEarnings.INSTANCE.getClass();
        sm8 sm8Var = PostEarnings.type;
        sm8Var.getClass();
        nx1 nx1Var18 = new nx1("earnings", sm8Var, null, ey3Var, ey3Var, listR3);
        SummaryPostStat.INSTANCE.getClass();
        sm8 sm8Var2 = SummaryPostStat.type;
        sm8Var2.getClass();
        __root = d46.R(nx1Var10, nx1Var11, nx1Var12, nx1Var13, nx1Var14, nx1Var15, nx1Var16, nx1Var17, nx1Var18, new nx1("totalStats", sm8Var2, null, ey3Var, ey3Var, listR4), new nx1("isFeaturedInPublishedPublication", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var));
    }

    private StatsPostSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
