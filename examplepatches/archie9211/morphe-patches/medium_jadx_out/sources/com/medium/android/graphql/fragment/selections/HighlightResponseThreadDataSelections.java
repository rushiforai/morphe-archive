package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.HighlightGroupResponsesEdge;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.ThreadedPostResponseConnection;
import defpackage.b09;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
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
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0012\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0007R\u001a\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\u0007R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010\u0007R\u001d\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0007\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/HighlightResponseThreadDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__pageInfo", "Ljava/util/List;", "__autoExpandedResponses", "__next", "__pagingInfo", "__autoExpandedResponses1", "__next1", "__pagingInfo1", "__posts1", "__threadedPostResponses1", "__posts", "__threadedPostResponses", "__node", "__edges", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class HighlightResponseThreadDataSelections {
    public static final HighlightResponseThreadDataSelections INSTANCE = new HighlightResponseThreadDataSelections();
    private static final List<sx1> __autoExpandedResponses;
    private static final List<sx1> __autoExpandedResponses1;
    private static final List<sx1> __edges;
    private static final List<sx1> __next;
    private static final List<sx1> __next1;
    private static final List<sx1> __node;
    private static final List<sx1> __pageInfo;
    private static final List<sx1> __pagingInfo;
    private static final List<sx1> __pagingInfo1;
    private static final List<sx1> __posts;
    private static final List<sx1> __posts1;
    private static final List<sx1> __root;
    private static final List<sx1> __threadedPostResponses;
    private static final List<sx1> __threadedPostResponses1;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("PageInfoV2");
        List<sx1> list = PageInfoDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "PageInfoV2", listQ, list));
        __pageInfo = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __autoExpandedResponses = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("PageParams");
        PagingParamsDataSelections pagingParamsDataSelections = PagingParamsDataSelections.INSTANCE;
        List<sx1> list2 = pagingParamsDataSelections.get__root();
        List<sx1> listR3 = d46.R(nx1Var2, y30.c(list2, "PageParams", listQ2, list2));
        __next = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("next", b09.u(PageParams.INSTANCE), null, ey3Var, ey3Var, listR3));
        __pagingInfo = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __autoExpandedResponses1 = listR5;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("PageParams");
        List<sx1> list3 = pagingParamsDataSelections.get__root();
        List<sx1> listR6 = d46.R(nx1Var3, y30.c(list3, "PageParams", listQ3, list3));
        __next1 = listR6;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var = PageParams.type;
        sm8Var.getClass();
        List<sx1> listR7 = d46.R(nx1Var4, new nx1("next", sm8Var, null, ey3Var, ey3Var, listR6));
        __pagingInfo1 = listR7;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ4 = d46.Q("Post");
        ResponseItemDataSelections responseItemDataSelections = ResponseItemDataSelections.INSTANCE;
        List<sx1> list4 = responseItemDataSelections.get__root();
        List<sx1> listR8 = d46.R(nx1Var5, y30.c(list4, "Post", listQ4, list4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __posts1 = listR8;
        List<sx1> listR9 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("pagingInfo", km4.v(Paging.INSTANCE), null, ey3Var, ey3Var, listR7), new nx1("posts", new px1(km4.s(Post.INSTANCE)), null, ey3Var, ey3Var, listR8));
        __threadedPostResponses1 = listR9;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ5 = d46.Q("Post");
        List<sx1> list5 = responseItemDataSelections.get__root();
        ox1 ox1VarC = y30.c(list5, "Post", listQ5, list5);
        nx1 nx1Var7 = new nx1("autoExpandedResponses", new px1(kyd.b(Post.type)), null, ey3Var, ey3Var, listR5);
        ThreadedPostResponseConnection.INSTANCE.getClass();
        sm8 sm8Var2 = ThreadedPostResponseConnection.type;
        sm8Var2.getClass();
        mx1 mx1Var = Post.__threadedPostResponses_paging;
        mx1Var.getClass();
        Map mapSingletonMap = Collections.singletonMap("limit", new tx1("threadedPostsLimit"));
        mapSingletonMap.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(mapSingletonMap));
        mx1 mx1Var2 = Post.__threadedPostResponses_sortType;
        List<sx1> listR10 = d46.R(nx1Var6, ox1VarC, nx1Var7, new nx1("threadedPostResponses", sm8Var2, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "sortType")))), listR9), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __posts = listR10;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var3 = Paging.type;
        sm8Var3.getClass();
        List<sx1> listR11 = d46.R(nx1Var8, new nx1("pagingInfo", sm8Var3, null, ey3Var, ey3Var, listR4), new nx1("posts", new px1(kyd.b(Post.type)), null, ey3Var, ey3Var, listR10));
        __threadedPostResponses = listR11;
        nx1 nx1Var9 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ6 = d46.Q("Post");
        List<sx1> list6 = responseItemDataSelections.get__root();
        ox1 ox1VarC2 = y30.c(list6, "Post", listQ6, list6);
        nx1 nx1Var10 = new nx1("autoExpandedResponses", new px1(kyd.b(Post.type)), null, ey3Var, ey3Var, listR2);
        sm8 sm8Var4 = ThreadedPostResponseConnection.type;
        sm8Var4.getClass();
        mx1 mx1Var3 = Post.__threadedPostResponses_paging;
        mx1Var3.getClass();
        Map mapSingletonMap2 = Collections.singletonMap("limit", new tx1("threadedPostsLimit"));
        mapSingletonMap2.getClass();
        lx1 lx1Var2 = new lx1(mx1Var3, new yv8(mapSingletonMap2));
        mx1 mx1Var4 = Post.__threadedPostResponses_sortType;
        List<sx1> listR12 = d46.R(nx1Var9, ox1VarC2, nx1Var10, new nx1("threadedPostResponses", sm8Var4, null, ey3Var, d46.R(lx1Var2, new lx1(mx1Var4, new yv8(ka1.d(mx1Var4, "sortType")))), listR11), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node = listR12;
        List<sx1> listR13 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", kyd.b(Post.type), null, ey3Var, ey3Var, listR12));
        __edges = listR13;
        nx1 nx1Var11 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var12 = new nx1("pageInfo", km4.r(PageInfoV2.INSTANCE), null, ey3Var, ey3Var, listR);
        HighlightGroupResponsesEdge.INSTANCE.getClass();
        __root = d46.R(nx1Var11, nx1Var12, new nx1("edges", new rx1(new px1(kyd.b(HighlightGroupResponsesEdge.type))), null, ey3Var, ey3Var, listR13));
    }

    private HighlightResponseThreadDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
