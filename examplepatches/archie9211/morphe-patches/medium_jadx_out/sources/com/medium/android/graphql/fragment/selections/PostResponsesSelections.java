package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.Quote;
import com.medium.android.graphql.type.ThreadedPostResponseConnection;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
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
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PostResponsesSelections;", "", "<init>", "()V", "", "Lsx1;", "__threadedPostResponses", "Ljava/util/List;", "__highlights", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostResponsesSelections {
    public static final PostResponsesSelections INSTANCE = new PostResponsesSelections();
    private static final List<sx1> __highlights;
    private static final List<sx1> __root;
    private static final List<sx1> __threadedPostResponses;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("ThreadedPostResponseConnection");
        List<sx1> list = ResponsePostThreadDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "ThreadedPostResponseConnection", listQ, list));
        __threadedPostResponses = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Quote");
        List<sx1> list2 = HighlightDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "Quote", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __highlights = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("latestPublishedVersion", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("responsesLocked", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLBoolean.type;
        zl2Var.getClass();
        nx1 nx1Var6 = new nx1("allowResponses", zl2Var, null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Post");
        List<sx1> list3 = ResponseItemDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list3, "Post", listQ3, list3);
        ThreadedPostResponseConnection.INSTANCE.getClass();
        sm8 sm8Var = ThreadedPostResponseConnection.type;
        sm8Var.getClass();
        Post.INSTANCE.getClass();
        mx1 mx1Var = Post.__threadedPostResponses_paging;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("paging")));
        mx1 mx1Var2 = Post.__threadedPostResponses_sortType;
        nx1 nx1Var7 = new nx1("threadedPostResponses", sm8Var, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "sortType")))), listR);
        Quote.INSTANCE.getClass();
        __root = d46.R(nx1Var3, nx1Var4, nx1Var5, nx1Var6, ox1VarC, nx1Var7, new nx1("highlights", new rx1(new px1(kyd.b(Quote.type))), null, ey3Var, ey3Var, listR2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
    }

    private PostResponsesSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
