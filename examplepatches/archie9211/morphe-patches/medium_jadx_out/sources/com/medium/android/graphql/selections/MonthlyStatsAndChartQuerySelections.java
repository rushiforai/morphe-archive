package com.medium.android.graphql.selections;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.medium.android.graphql.fragment.selections.MonthlyChartPostStatsPointSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostStats;
import com.medium.android.graphql.type.PostStatsPoint;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RelayPostConnection;
import com.medium.android.graphql.type.RelayPostEdge;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserPostsAggregateTimeseriesStatsResponse;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/selections/MonthlyStatsAndChartQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__totalStats", "Ljava/util/List;", "__points", "__onAggregatePostTimeseriesStats", "__postsAggregateTimeseriesStats", "__node", "__edges", "__postsConnection", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MonthlyStatsAndChartQuerySelections {
    public static final MonthlyStatsAndChartQuerySelections INSTANCE = new MonthlyStatsAndChartQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __node;
    private static final List<sx1> __onAggregatePostTimeseriesStats;
    private static final List<sx1> __points;
    private static final List<sx1> __postsAggregateTimeseriesStats;
    private static final List<sx1> __postsConnection;
    private static final List<sx1> __root;
    private static final List<sx1> __totalStats;
    private static final List<sx1> __user;

    private MonthlyStatsAndChartQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("presentations", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("viewers", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readers", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("netFollowersGained", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("netSubscribersGained", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var));
        __totalStats = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("PostStatsPoint");
        List<sx1> list = MonthlyChartPostStatsPointSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var, y30.c(list, "PostStatsPoint", listQ, list));
        __points = listR2;
        PostStats.INSTANCE.getClass();
        nx1 nx1Var2 = new nx1("totalStats", kyd.b(PostStats.type), null, ey3Var, ey3Var, listR);
        PostStatsPoint.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var2, new nx1("points", new rx1(new px1(kyd.b(PostStatsPoint.type))), null, ey3Var, ey3Var, listR2));
        __onAggregatePostTimeseriesStats = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("AggregatePostTimeseriesStats", d46.Q("AggregatePostTimeseriesStats"), listR3));
        __postsAggregateTimeseriesStats = listR4;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = Long.type;
        zl2Var.getClass();
        List<sx1> listR5 = d46.R(nx1Var3, new nx1("firstPublishedAt", zl2Var, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node = listR5;
        List<sx1> listR6 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", km4.s(Post.INSTANCE), null, ey3Var, ey3Var, listR5));
        __edges = listR6;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RelayPostEdge.INSTANCE.getClass();
        List<sx1> listR7 = d46.R(nx1Var4, new nx1("edges", new rx1(kyd.a(RelayPostEdge.type)), null, ey3Var, ey3Var, listR6));
        __postsConnection = listR7;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        UserPostsAggregateTimeseriesStatsResponse.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(UserPostsAggregateTimeseriesStatsResponse.type);
        User.INSTANCE.getClass();
        mx1 mx1Var = User.__postsAggregateTimeseriesStats_input;
        mx1Var.getClass();
        nx1 nx1Var6 = new nx1("postsAggregateTimeseriesStats", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR4);
        RelayPostConnection.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(RelayPostConnection.type);
        mx1 mx1Var2 = User.__postsConnection_after;
        mx1Var2.getClass();
        lx1 lx1Var = new lx1(mx1Var2, new yv8(""));
        mx1 mx1Var3 = User.__postsConnection_filter;
        mx1Var3.getClass();
        Map mapSingletonMap = Collections.singletonMap("published", Boolean.TRUE);
        mapSingletonMap.getClass();
        lx1 lx1Var2 = new lx1(mx1Var3, new yv8(mapSingletonMap));
        mx1 mx1Var4 = User.__postsConnection_first;
        mx1Var4.getClass();
        lx1 lx1Var3 = new lx1(mx1Var4, new yv8(25));
        mx1 mx1Var5 = User.__postsConnection_orderBy;
        mx1Var5.getClass();
        Map mapSingletonMap2 = Collections.singletonMap("publishedAt", "ASC");
        mapSingletonMap2.getClass();
        List<sx1> listR8 = d46.R(nx1Var5, nx1Var6, new nx1("postsConnection", rx1VarB2, null, ey3Var, d46.R(lx1Var, lx1Var2, lx1Var3, new lx1(mx1Var5, new yv8(mapSingletonMap2))), listR7), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR8;
        sm8 sm8Var = User.type;
        sm8Var.getClass();
        __root = d46.Q(new nx1(kSWQKWZ.sPmbNXMk, sm8Var, null, ey3Var, ka1.y(lv8.j(Query.INSTANCE), new yv8(new tx1("userId"))), listR8));
    }
}
