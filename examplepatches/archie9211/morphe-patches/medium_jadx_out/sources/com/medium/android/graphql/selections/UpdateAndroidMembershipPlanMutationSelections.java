package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.MutationSuccessDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UpdateAndroidMembershipPlanResult;
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
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/selections/UpdateAndroidMembershipPlanMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__onBadRequest", "Ljava/util/List;", "__onUnauthorized", "__onNotFound", "__onForbidden", "__onConflict", "__updateAndroidMembershipPlan", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UpdateAndroidMembershipPlanMutationSelections {
    public static final UpdateAndroidMembershipPlanMutationSelections INSTANCE = new UpdateAndroidMembershipPlanMutationSelections();
    private static final List<sx1> __onBadRequest;
    private static final List<sx1> __onConflict;
    private static final List<sx1> __onForbidden;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __root;
    private static final List<sx1> __updateAndroidMembershipPlan;

    static {
        zl2 zl2VarI = y30.i(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("message", zl2VarI, null, ey3Var, ey3Var, ey3Var));
        __onBadRequest = listQ;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ2;
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ3;
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("message", zl2Var3, null, ey3Var, ey3Var, ey3Var));
        __onForbidden = listQ4;
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        List<sx1> listQ5 = d46.Q(new nx1("message", zl2Var4, null, ey3Var, ey3Var, ey3Var));
        __onConflict = listQ5;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ6 = d46.Q("MutationSuccess");
        List<sx1> list = MutationSuccessDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "MutationSuccess", listQ6, list), new ox1("BadRequest", d46.Q("BadRequest"), listQ), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ2), new ox1("NotFound", d46.Q("NotFound"), listQ3), new ox1("Forbidden", d46.Q("Forbidden"), listQ4), new ox1("Conflict", d46.Q("Conflict"), listQ5));
        __updateAndroidMembershipPlan = listR;
        UpdateAndroidMembershipPlanResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(UpdateAndroidMembershipPlanResult.type);
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__updateAndroidMembershipPlan_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("updateAndroidMembershipPlan", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR));
    }

    private UpdateAndroidMembershipPlanMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
