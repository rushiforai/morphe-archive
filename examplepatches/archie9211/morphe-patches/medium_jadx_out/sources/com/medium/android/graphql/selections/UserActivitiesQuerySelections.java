package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PageInfoDataSelections;
import com.medium.android.graphql.fragment.selections.UserActivityDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.UserActivitiesConnectionResult;
import com.medium.android.graphql.type.UserActivity;
import com.medium.android.graphql.type.UserActivityEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/selections/UserActivitiesQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__node", "Ljava/util/List;", "__edges", "__pageInfo", "__onUserActivitiesConnection", "__onForbidden", "__userActivitiesConnection", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserActivitiesQuerySelections {
    public static final UserActivitiesQuerySelections INSTANCE = new UserActivitiesQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __node;
    private static final List<sx1> __onForbidden;
    private static final List<sx1> __onUserActivitiesConnection;
    private static final List<sx1> __pageInfo;
    private static final List<sx1> __root;
    private static final List<sx1> __userActivitiesConnection;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("UserActivity");
        List<sx1> list = UserActivityDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "UserActivity", listQ, list), new nx1("activityName", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        UserActivity.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, new nx1("node", kyd.b(UserActivity.type), null, ey3Var, ey3Var, listR));
        __edges = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("PageInfoV2");
        List<sx1> list2 = PageInfoDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var3, y30.c(list2, "PageInfoV2", listQ2, list2));
        __pageInfo = listR3;
        UserActivityEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(new nx1("edges", new rx1(new px1(kyd.b(UserActivityEdge.type))), null, ey3Var, ey3Var, listR2), new nx1("pageInfo", km4.r(PageInfoV2.INSTANCE), null, ey3Var, ey3Var, listR3));
        __onUserActivitiesConnection = listR4;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onForbidden = listQ3;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("UserActivitiesConnection", d46.Q("UserActivitiesConnection"), listR4), new ox1("Forbidden", d46.Q("Forbidden"), listQ3));
        __userActivitiesConnection = listR5;
        UserActivitiesConnectionResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(UserActivitiesConnectionResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__userActivitiesConnection_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("userActivitiesConnection", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR5));
    }

    private UserActivitiesQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
