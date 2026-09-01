package com.medium.android.graphql.selections;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.graphql.type.CrossoutMobilePlan;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MembershipFrequency;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.MobilePlan;
import com.medium.android.graphql.type.MobilePlanConfigResult;
import com.medium.android.graphql.type.Offer;
import com.medium.android.graphql.type.OfferColorScheme;
import com.medium.android.graphql.type.OfferMetadata;
import com.medium.android.graphql.type.Query;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000e\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001d\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u0007\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/selections/MobilePlanConfigQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__metadata", "Ljava/util/List;", "__offer", "__referencePlan", "__crossoutPlan", "__plans", "__onMobilePlanConfig", "__onBadRequest", "__onUnauthorized", "__mobilePlanConfig", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MobilePlanConfigQuerySelections {
    public static final MobilePlanConfigQuerySelections INSTANCE = new MobilePlanConfigQuerySelections();
    private static final List<sx1> __crossoutPlan;
    private static final List<sx1> __metadata;
    private static final List<sx1> __mobilePlanConfig;
    private static final List<sx1> __offer;
    private static final List<sx1> __onBadRequest;
    private static final List<sx1> __onMobilePlanConfig;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __plans;
    private static final List<sx1> __referencePlan;
    private static final List<sx1> __root;

    private MobilePlanConfigQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var2 = new nx1("pill", zl2Var, null, ey3Var, ey3Var, ey3Var);
        OfferColorScheme.INSTANCE.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, new nx1("colorScheme", kyd.b(OfferColorScheme.type), null, ey3Var, ey3Var, ey3Var), new nx1("cta", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("plansPageTagline", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("tagline", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("valueProposition", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __metadata = listR;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("couponCode", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        OfferMetadata.INSTANCE.getClass();
        sm8 sm8Var = OfferMetadata.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var3, nx1Var4, nx1Var5, new nx1("metadata", sm8Var, null, ey3Var, ey3Var, listR));
        __offer = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("membershipPlanId", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __referencePlan = listR3;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        MobilePlan.INSTANCE.getClass();
        nx1 nx1Var7 = new nx1("referencePlan", kyd.b(MobilePlan.type), null, ey3Var, ey3Var, listR3);
        GraphQLInt.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var6, nx1Var7, new nx1("units", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var));
        __crossoutPlan = listR4;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var9 = new nx1("basePlanId", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var10 = new nx1("productId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        MembershipType.INSTANCE.getClass();
        nx1 nx1Var11 = new nx1("membershipType", kyd.b(MembershipType.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var12 = new nx1("membershipPlanId", kyd.b(GraphQLID.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var13 = new nx1("promoOfferId", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        CrossoutMobilePlan.INSTANCE.getClass();
        sm8 sm8Var2 = CrossoutMobilePlan.type;
        sm8Var2.getClass();
        List<sx1> listR5 = d46.R(nx1Var8, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, new nx1("crossoutPlan", sm8Var2, null, ey3Var, ey3Var, listR4));
        __plans = listR5;
        MembershipFrequency.INSTANCE.getClass();
        nx1 nx1Var14 = new nx1("defaultFrequency", kyd.b(MembershipFrequency.type), null, ey3Var, ey3Var, ey3Var);
        Offer.INSTANCE.getClass();
        sm8 sm8Var3 = Offer.type;
        sm8Var3.getClass();
        List<sx1> listR6 = d46.R(nx1Var14, new nx1("offer", sm8Var3, null, ey3Var, ey3Var, listR2), new nx1("plans", new rx1(new px1(kyd.b(MobilePlan.type))), null, ey3Var, ey3Var, listR5));
        __onMobilePlanConfig = listR6;
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        List<sx1> listQ = d46.Q(new nx1("message", zl2Var4, null, ey3Var, ey3Var, ey3Var));
        __onBadRequest = listQ;
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("message", zl2Var5, null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ2;
        nx1 nx1Var15 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        ox1 ox1Var = new ox1("MobilePlanConfig", d46.Q("MobilePlanConfig"), listR6);
        ox1 ox1Var2 = new ox1("BadRequest", d46.Q("BadRequest"), listQ);
        String str = PqkdNGCEoxOKZk.VEMFIEXCW;
        List<sx1> listR7 = d46.R(nx1Var15, ox1Var, ox1Var2, new ox1(str, d46.Q(str), listQ2));
        __mobilePlanConfig = listR7;
        MobilePlanConfigResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(MobilePlanConfigResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__mobilePlanConfig_input;
        mx1Var.getClass();
        __root = d46.Q(new nx1("mobilePlanConfig", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("input"))), listR7));
    }
}
