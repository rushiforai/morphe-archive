package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PostSubmissionDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PublicationSubmission;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/selections/UpdateSubmissionStatusMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__post", "Ljava/util/List;", "__updateSubmissionStatus", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UpdateSubmissionStatusMutationSelections {
    public static final UpdateSubmissionStatusMutationSelections INSTANCE = new UpdateSubmissionStatusMutationSelections();
    private static final List<sx1> __post;
    private static final List<sx1> __root;
    private static final List<sx1> __updateSubmissionStatus;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = PostSubmissionDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Post", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("post", km4.s(Post.INSTANCE), null, ey3Var, ey3Var, listR), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __updateSubmissionStatus = listR2;
        PublicationSubmission.INSTANCE.getClass();
        sm8 sm8Var = PublicationSubmission.type;
        sm8Var.getClass();
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__updateSubmissionStatus_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("updateSubmissionStatus", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR2));
    }

    private UpdateSubmissionStatusMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
