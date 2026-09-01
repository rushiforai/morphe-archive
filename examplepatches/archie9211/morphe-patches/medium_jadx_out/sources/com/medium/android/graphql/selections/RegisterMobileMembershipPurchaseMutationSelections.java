package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.RegisterMobileMembershipPurchaseResult;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000e\u0010\u0007\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/selections/RegisterMobileMembershipPurchaseMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__onMembershipV2", "Ljava/util/List;", "__onBadRequest", "__onUnauthorized", "__onNotFound", "__onForbidden", "__onConflict", "__registerMobileMembershipPurchase", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RegisterMobileMembershipPurchaseMutationSelections {
    public static final RegisterMobileMembershipPurchaseMutationSelections INSTANCE = new RegisterMobileMembershipPurchaseMutationSelections();
    private static final List<sx1> __onBadRequest;
    private static final List<sx1> __onConflict;
    private static final List<sx1> __onForbidden;
    private static final List<sx1> __onMembershipV2;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __registerMobileMembershipPurchase;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("id", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onMembershipV2 = listQ;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onBadRequest = listQ2;
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ3;
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("message", zl2Var3, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ4;
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        List<sx1> listQ5 = d46.Q(new nx1("message", zl2Var4, null, ey3Var, ey3Var, ey3Var));
        __onForbidden = listQ5;
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        List<sx1> listQ6 = d46.Q(new nx1("message", zl2Var5, null, ey3Var, ey3Var, ey3Var));
        __onConflict = listQ6;
        List<sx1> listR = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("MembershipV2", d46.Q("MembershipV2"), listQ), new ox1("BadRequest", d46.Q("BadRequest"), listQ2), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ3), new ox1("NotFound", d46.Q("NotFound"), listQ4), new ox1("Forbidden", d46.Q("Forbidden"), listQ5), new ox1("Conflict", d46.Q("Conflict"), listQ6));
        __registerMobileMembershipPurchase = listR;
        RegisterMobileMembershipPurchaseResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(RegisterMobileMembershipPurchaseResult.type);
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__registerMobileMembershipPurchase_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("registerMobileMembershipPurchase", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR));
    }

    private RegisterMobileMembershipPurchaseMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
