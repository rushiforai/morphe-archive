package com.medium.android.graphql.selections;

import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.graphql.fragment.selections.PagingParamsDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.SubscriberConnectionResult;
import com.medium.android.graphql.type.UserResult;
import com.medium.android.graphql.type.UserSubscriber;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.b09;
import defpackage.b1e;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/selections/GetSubscriberListQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__subscribers", "Ljava/util/List;", "__next", "__pagingInfo", "__onSubscriberConnection", "__emailSubscriberConnection", "__viewerEdge", "__onUser", "__userResult", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetSubscriberListQuerySelections {
    public static final GetSubscriberListQuerySelections INSTANCE = new GetSubscriberListQuerySelections();
    private static final List<sx1> __emailSubscriberConnection;
    private static final List<sx1> __next;
    private static final List<sx1> __onSubscriberConnection;
    private static final List<sx1> __onUser;
    private static final List<sx1> __pagingInfo;
    private static final List<sx1> __root;
    private static final List<sx1> __subscribers;
    private static final List<sx1> __userResult;
    private static final List<sx1> __viewerEdge;

    private GetSubscriberListQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        Long.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("subscribedAt", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, nx1Var3, nx1Var4, new nx1("imageId", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __subscribers = listR;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("PageParams");
        List<sx1> list = PagingParamsDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var5, y30.c(list, "PageParams", listQ, list));
        __next = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("next", b09.u(PageParams.INSTANCE), null, ey3Var, ey3Var, listR2));
        __pagingInfo = listR3;
        UserSubscriber.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(new nx1("subscribers", new rx1(new px1(kyd.b(UserSubscriber.type))), null, ey3Var, ey3Var, listR), new nx1("pagingInfo", km4.v(Paging.INSTANCE), null, ey3Var, ey3Var, listR3));
        __onSubscriberConnection = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("SubscriberConnection", d46.Q("SubscriberConnection"), listR4));
        __emailSubscriberConnection = listR5;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        SubscriberConnectionResult.INSTANCE.getClass();
        b1e b1eVar = SubscriberConnectionResult.type;
        b1eVar.getClass();
        UserViewerEdge.INSTANCE.getClass();
        mx1 mx1Var = UserViewerEdge.__emailSubscriberConnection_paging;
        mx1Var.getClass();
        List<sx1> listR6 = d46.R(nx1Var6, new nx1("emailSubscriberConnection", b1eVar, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("paging"))), listR5), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR6;
        List<sx1> listR7 = d46.R(new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR6), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onUser = listR7;
        List<sx1> listR8 = d46.R(new nx1(Plbho.mKswmBdbPqqLjsT, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR7));
        __userResult = listR8;
        UserResult.INSTANCE.getClass();
        b1e b1eVar2 = UserResult.type;
        b1eVar2.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var2 = Query.__userResult_id;
        mx1Var2.getClass();
        __root = d46.Q(new nx1("userResult", b1eVar2, null, ey3Var, ka1.y(mx1Var2, new yv8(new tx1("userId"))), listR8));
    }
}
