package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLString;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001d\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0007\u001a\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PostPreviewWithSubmissionDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__root", "Ljava/util/List;", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostPreviewWithSubmissionDataSelections {
    public static final PostPreviewWithSubmissionDataSelections INSTANCE = new PostPreviewWithSubmissionDataSelections();
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = PostPreviewDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "Post", listQ, list);
        List listQ2 = d46.Q("Post");
        List<sx1> list2 = PostSubmissionDataSelections.INSTANCE.get__root();
        __root = d46.R(nx1Var, ox1VarC, y30.c(list2, "Post", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
    }

    private PostPreviewWithSubmissionDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
