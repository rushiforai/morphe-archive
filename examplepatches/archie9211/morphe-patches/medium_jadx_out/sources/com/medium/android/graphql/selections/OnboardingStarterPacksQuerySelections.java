package com.medium.android.graphql.selections;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.medium.android.graphql.type.FollowedEntityV2;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.OnboardingStarterPacksResult;
import com.medium.android.graphql.type.StarterPack;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000e\u0010\u0007\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/selections/OnboardingStarterPacksQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__writerConnections", "Ljava/util/List;", "__onUser", "__onPublication", "__recommendedPublishers", "__starterPacks", "__onOnboardingStarterPacks", "__onboardingStarterPacks", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class OnboardingStarterPacksQuerySelections {
    public static final OnboardingStarterPacksQuerySelections INSTANCE = new OnboardingStarterPacksQuerySelections();
    private static final List<sx1> __onOnboardingStarterPacks;
    private static final List<sx1> __onPublication;
    private static final List<sx1> __onUser;
    private static final List<sx1> __onboardingStarterPacks;
    private static final List<sx1> __recommendedPublishers;
    private static final List<sx1> __root;
    private static final List<sx1> __starterPacks;
    private static final List<sx1> __writerConnections;

    private OnboardingStarterPacksQuerySelections() {
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
        List<sx1> listR = d46.R(nx1Var, new nx1("imageId", zl2Var, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __writerConnections = listR;
        List<sx1> listQ = d46.Q(new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onUser = listQ;
        List<sx1> listQ2 = d46.Q(new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onPublication = listQ2;
        List<sx1> listR2 = d46.R(new nx1(HrUBqHumRuLe.Jnw, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listQ), new ox1("Publication", d46.Q("Publication"), listQ2));
        __recommendedPublishers = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("categoryName", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("writerConnections", new rx1(new px1(y30.g(User.INSTANCE))), null, ey3Var, ey3Var, listR);
        FollowedEntityV2.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var2, nx1Var3, nx1Var4, nx1Var5, new nx1("recommendedPublishers", new rx1(new px1(kyd.b(FollowedEntityV2.type))), null, ey3Var, ey3Var, listR2));
        __starterPacks = listR3;
        StarterPack.INSTANCE.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("starterPacks", new rx1(new px1(kyd.b(StarterPack.type))), null, ey3Var, ey3Var, listR3));
        __onOnboardingStarterPacks = listQ3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("OnboardingStarterPacks", d46.Q("OnboardingStarterPacks"), listQ3));
        __onboardingStarterPacks = listR4;
        OnboardingStarterPacksResult.INSTANCE.getClass();
        __root = d46.Q(new nx1("onboardingStarterPacks", kyd.b(OnboardingStarterPacksResult.type), null, ey3Var, ey3Var, listR4));
    }
}
