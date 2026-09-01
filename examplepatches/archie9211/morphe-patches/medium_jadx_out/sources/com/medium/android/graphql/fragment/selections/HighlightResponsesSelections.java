package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.HighlightGroup;
import com.medium.android.graphql.type.HighlightGroupResponsesConnection;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostResponses;
import com.medium.android.graphql.type.User;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/HighlightResponsesSelections;", "", "<init>", "()V", "", "Lsx1;", "__postResponses", "Ljava/util/List;", "__creator", "__responses", "__highlightGroup", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class HighlightResponsesSelections {
    public static final HighlightResponsesSelections INSTANCE = new HighlightResponsesSelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __highlightGroup;
    private static final List<sx1> __postResponses;
    private static final List<sx1> __responses;
    private static final List<sx1> __root;

    private HighlightResponsesSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1(mgKMENwrbHf.wfIvSUtoN, y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __postResponses = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var, nx1Var2, new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __creator = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("HighlightGroupResponsesConnection");
        List<sx1> list = HighlightResponseThreadDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var3, y30.c(list, "HighlightGroupResponsesConnection", listQ, list));
        __responses = listR3;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("HighlightGroup");
        List<sx1> list2 = HighlightGroupDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list2, "HighlightGroup", listQ2, list2);
        HighlightGroupResponsesConnection.INSTANCE.getClass();
        sm8 sm8Var = HighlightGroupResponsesConnection.type;
        sm8Var.getClass();
        HighlightGroup.INSTANCE.getClass();
        mx1 mx1Var = HighlightGroup.__responses_after;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("after")));
        mx1 mx1Var2 = HighlightGroup.__responses_first;
        List<sx1> listR4 = d46.R(nx1Var4, ox1VarC, new nx1("responses", sm8Var, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "first")))), listR3));
        __highlightGroup = listR4;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var6 = new nx1("latestPublishedVersion", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("responsesLocked", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLBoolean.type;
        zl2Var2.getClass();
        nx1 nx1Var8 = new nx1("allowResponses", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        PostResponses.INSTANCE.getClass();
        sm8 sm8Var2 = PostResponses.type;
        sm8Var2.getClass();
        nx1 nx1Var9 = new nx1("postResponses", sm8Var2, null, ey3Var, ey3Var, listR);
        nx1 nx1Var10 = new nx1("creator", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR2);
        sm8 sm8Var3 = HighlightGroup.type;
        sm8Var3.getClass();
        Post.INSTANCE.getClass();
        mx1 mx1Var3 = Post.__highlightGroup_groupId;
        mx1Var3.getClass();
        __root = d46.R(nx1Var5, nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, new nx1("highlightGroup", sm8Var3, null, ey3Var, ka1.y(mx1Var3, new yv8(new tx1("groupId"))), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
    }
}
