package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.FollowAllContactMatchesResult;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import defpackage.d46;
import defpackage.ey3;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/FollowAllContactMatchedMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__onMutationSuccess", "Ljava/util/List;", "__onUnauthorized", "__onBadRequest", "__followAllContactMatches", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowAllContactMatchedMutationSelections {
    public static final FollowAllContactMatchedMutationSelections INSTANCE = new FollowAllContactMatchedMutationSelections();
    private static final List<sx1> __followAllContactMatches;
    private static final List<sx1> __onBadRequest;
    private static final List<sx1> __onMutationSuccess;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarD = y30.d(GraphQLBoolean.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("success", rx1VarD, null, ey3Var, ey3Var, ey3Var));
        __onMutationSuccess = listQ;
        List<sx1> listQ2 = d46.Q(new nx1("message", y30.i(GraphQLString.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ2;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onBadRequest = listQ3;
        List<sx1> listR = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("MutationSuccess", d46.Q("MutationSuccess"), listQ), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ2), new ox1("BadRequest", d46.Q("BadRequest"), listQ3));
        __followAllContactMatches = listR;
        FollowAllContactMatchesResult.INSTANCE.getClass();
        __root = d46.Q(new nx1("followAllContactMatches", kyd.b(FollowAllContactMatchesResult.type), null, ey3Var, ey3Var, listR));
    }

    private FollowAllContactMatchedMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
