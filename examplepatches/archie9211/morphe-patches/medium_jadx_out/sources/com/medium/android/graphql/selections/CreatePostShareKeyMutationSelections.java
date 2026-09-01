package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.CreatePostShareKeyResult;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/selections/CreatePostShareKeyMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__onPostShareKey", "Ljava/util/List;", "__createPostShareKey", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreatePostShareKeyMutationSelections {
    public static final CreatePostShareKeyMutationSelections INSTANCE = new CreatePostShareKeyMutationSelections();
    private static final List<sx1> __createPostShareKey;
    private static final List<sx1> __onPostShareKey;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("key", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onPostShareKey = listQ;
        List<sx1> listR = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("PostShareKey", d46.Q("PostShareKey"), listQ));
        __createPostShareKey = listR;
        CreatePostShareKeyResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CreatePostShareKeyResult.type);
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__createPostShareKey_postId;
        mx1Var.getClass();
        __root = d46.Q(new nx1("createPostShareKey", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("postId"))), listR));
    }

    private CreatePostShareKeyMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
