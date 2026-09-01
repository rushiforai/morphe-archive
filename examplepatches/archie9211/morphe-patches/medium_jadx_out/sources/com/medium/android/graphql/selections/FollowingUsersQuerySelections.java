package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CreatorPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.PagingParamsDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserConnection;
import defpackage.b09;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/FollowingUsersQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__users", "Ljava/util/List;", "__next", "__pagingInfo", "__followingUserConnection", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowingUsersQuerySelections {
    public static final FollowingUsersQuerySelections INSTANCE = new FollowingUsersQuerySelections();
    private static final List<sx1> __followingUserConnection;
    private static final List<sx1> __next;
    private static final List<sx1> __pagingInfo;
    private static final List<sx1> __root;
    private static final List<sx1> __user;
    private static final List<sx1> __users;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("User");
        List<sx1> list = CreatorPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "User", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __users = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("PageParams");
        List<sx1> list2 = PagingParamsDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "PageParams", listQ2, list2));
        __next = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("next", b09.u(PageParams.INSTANCE), null, ey3Var, ey3Var, listR2));
        __pagingInfo = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("users", new rx1(new px1(y30.g(User.INSTANCE))), null, ey3Var, ey3Var, listR), new nx1("pagingInfo", km4.v(Paging.INSTANCE), null, ey3Var, ey3Var, listR3));
        __followingUserConnection = listR4;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        UserConnection.INSTANCE.getClass();
        sm8 sm8Var = UserConnection.type;
        sm8Var.getClass();
        mx1 mx1Var = User.__followingUserConnection_paging;
        List<sx1> listR5 = d46.R(nx1Var3, new nx1("followingUserConnection", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(ka1.d(mx1Var, "pagingOptions"))), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR5;
        sm8 sm8Var2 = User.type;
        sm8Var2.getClass();
        __root = d46.Q(new nx1("user", sm8Var2, null, ey3Var, ka1.y(lv8.j(Query.INSTANCE), new yv8(new tx1("userId"))), listR5));
    }

    private FollowingUsersQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
