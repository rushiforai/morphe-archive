package com.medium.android.graphql.fragment.selections;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PostReposterSelections;", "", "<init>", "()V", "", "Lsx1;", "__viewerEdge", "Ljava/util/List;", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostReposterSelections {
    public static final PostReposterSelections INSTANCE = new PostReposterSelections();
    private static final List<sx1> __root;
    private static final List<sx1> __user;
    private static final List<sx1> __viewerEdge;

    private PostReposterSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        String str = PqkdNGCEoxOKZk.sIzfMeaSt;
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1(str, rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("isUser", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("User");
        List<sx1> list = CreatorPreviewDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "User", listQ, list);
        UserViewerEdge.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var, ox1VarC, new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        __root = d46.R(nx1Var2, new nx1("note", zl2Var, null, ey3Var, ey3Var, ey3Var), new nx1("hideTime", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("user", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR2));
    }
}
