package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PostRepostCountDataSelections;
import com.medium.android.graphql.fragment.selections.PostRepostStateDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.RepostResult;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/RepostPostMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__onPost", "Ljava/util/List;", "__onRepostError", "__onRateLimited", "__repost", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RepostPostMutationSelections {
    public static final RepostPostMutationSelections INSTANCE = new RepostPostMutationSelections();
    private static final List<sx1> __onPost;
    private static final List<sx1> __onRateLimited;
    private static final List<sx1> __onRepostError;
    private static final List<sx1> __repost;
    private static final List<sx1> __root;

    static {
        List listQ = d46.Q("Post");
        List<sx1> list = PostRepostStateDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "Post", listQ, list);
        List listQ2 = d46.Q("Post");
        List<sx1> list2 = PostRepostCountDataSelections.INSTANCE.get__root();
        ox1 ox1VarC2 = y30.c(list2, "Post", listQ2, list2);
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(ox1VarC, ox1VarC2, new nx1("id", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onPost = listR;
        List<sx1> listQ3 = d46.Q(new nx1("message", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onRepostError = listQ3;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("message", zl2Var, "rateLimitedMessage", ey3Var, ey3Var, ey3Var));
        __onRateLimited = listQ4;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Post", d46.Q("Post"), listR), new ox1("RepostError", d46.Q("RepostError"), listQ3), new ox1("RateLimited", d46.Q("RateLimited"), listQ4));
        __repost = listR2;
        RepostResult.INSTANCE.getClass();
        b1e b1eVar = RepostResult.type;
        b1eVar.getClass();
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__repost_note;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("note")));
        mx1 mx1Var2 = Mutation.__repost_targetPostId;
        __root = d46.Q(new nx1("repost", b1eVar, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "targetPostId")))), listR2));
    }

    private RepostPostMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
