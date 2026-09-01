package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.MembershipStatus;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.MobilePlan;
import com.medium.android.graphql.type.PaymentProvider;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/MembershipStatusQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__mobilePlan", "Ljava/util/List;", "__membership", "__viewerEdge", "__viewer", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipStatusQuerySelections {
    public static final MembershipStatusQuerySelections INSTANCE = new MembershipStatusQuerySelections();
    private static final List<sx1> __membership;
    private static final List<sx1> __mobilePlan;
    private static final List<sx1> __root;
    private static final List<sx1> __viewer;
    private static final List<sx1> __viewerEdge;

    private MembershipStatusQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("productId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __mobilePlan = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("isCancelled", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("expiresAt", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        PaymentProvider.INSTANCE.getClass();
        nx1 nx1Var4 = new nx1("paymentProvider", kyd.b(PaymentProvider.type), null, ey3Var, ey3Var, ey3Var);
        MembershipType.INSTANCE.getClass();
        nx1 nx1Var5 = new nx1("membershipType", kyd.b(MembershipType.type), "membershipProductType", ey3Var, ey3Var, ey3Var);
        nx1 nx1Var6 = new nx1("membershipId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("startedAt", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var8 = new nx1("membershipPlanId", zl2Var, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("isGrantedPremium", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var);
        MobilePlan.INSTANCE.getClass();
        sm8 sm8Var = MobilePlan.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var, nx1Var2, nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, nx1Var8, nx1Var9, new nx1("mobilePlan", sm8Var, null, ey3Var, ey3Var, listR));
        __membership = listR2;
        nx1 nx1Var10 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        MembershipStatus.INSTANCE.getClass();
        sm8 sm8Var2 = MembershipStatus.type;
        sm8Var2.getClass();
        List<sx1> listR3 = d46.R(nx1Var10, new nx1("membership", sm8Var2, null, ey3Var, ey3Var, listR2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR3;
        nx1 nx1Var11 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        UserViewerEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var11, new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewer = listR4;
        __root = d46.Q(new nx1(dpBiLjNeNsiASg.ETXfWWfBmRiGE, ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR4));
    }
}
