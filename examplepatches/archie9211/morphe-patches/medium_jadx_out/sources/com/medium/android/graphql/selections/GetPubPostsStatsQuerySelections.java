package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PageInfoDataSelections;
import com.medium.android.graphql.fragment.selections.StatsPostSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RelayPublicationPostConnection;
import com.medium.android.graphql.type.RelayPublicationPostEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/GetPubPostsStatsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__node", "Ljava/util/List;", "__edges", "__pageInfo", "__publicationPostsConnection", "__publicationByRef", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetPubPostsStatsQuerySelections {
    public static final GetPubPostsStatsQuerySelections INSTANCE = new GetPubPostsStatsQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __node;
    private static final List<sx1> __pageInfo;
    private static final List<sx1> __publicationByRef;
    private static final List<sx1> __publicationPostsConnection;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = StatsPostSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Post", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", km4.s(Post.INSTANCE), null, ey3Var, ey3Var, listR));
        __edges = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("PageInfoV2");
        List<sx1> list2 = PageInfoDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var2, y30.c(list2, "PageInfoV2", listQ2, list2));
        __pageInfo = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RelayPublicationPostEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, new nx1("edges", new rx1(kyd.a(RelayPublicationPostEdge.type)), null, ey3Var, ey3Var, listR2), new nx1("pageInfo", km4.r(PageInfoV2.INSTANCE), null, ey3Var, ey3Var, listR3));
        __publicationPostsConnection = listR4;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RelayPublicationPostConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(RelayPublicationPostConnection.type);
        Publication.INSTANCE.getClass();
        mx1 mx1Var = Publication.__publicationPostsConnection_after;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("after")));
        mx1 mx1Var2 = Publication.__publicationPostsConnection_filter;
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "filter")));
        mx1 mx1Var3 = Publication.__publicationPostsConnection_first;
        lx1 lx1Var3 = new lx1(mx1Var3, new yv8(ka1.d(mx1Var3, "first")));
        mx1 mx1Var4 = Publication.__publicationPostsConnection_orderBy;
        List<sx1> listR5 = d46.R(nx1Var4, new nx1("publicationPostsConnection", rx1VarB, null, ey3Var, d46.R(lx1Var, lx1Var2, lx1Var3, new lx1(mx1Var4, new yv8(ka1.d(mx1Var4, "orderBy")))), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publicationByRef = listR5;
        sm8 sm8Var = Publication.type;
        sm8Var.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var5 = Query.__publicationByRef_ref;
        mx1Var5.getClass();
        __root = d46.Q(new nx1("publicationByRef", sm8Var, null, ey3Var, ka1.y(mx1Var5, new yv8(new tx1("ref"))), listR5));
    }

    private GetPubPostsStatsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
