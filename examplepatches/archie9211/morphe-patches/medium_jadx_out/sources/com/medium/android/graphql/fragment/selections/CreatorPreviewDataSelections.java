package com.medium.android.graphql.fragment.selections;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Membership;
import com.medium.android.graphql.type.NewsletterV3;
import com.medium.android.graphql.type.SocialStats;
import com.medium.android.graphql.type.VerifiedInfo;
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

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CreatorPreviewDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__verifications", "Ljava/util/List;", "__membership", "__socialStats", "__newsletterV3", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreatorPreviewDataSelections {
    public static final CreatorPreviewDataSelections INSTANCE = new CreatorPreviewDataSelections();
    private static final List<sx1> __membership;
    private static final List<sx1> __newsletterV3;
    private static final List<sx1> __root;
    private static final List<sx1> __socialStats;
    private static final List<sx1> __verifications;

    private CreatorPreviewDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("isBookAuthor", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __verifications = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Membership");
        List<sx1> list = MembershipFragmentSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var, y30.c(list, "Membership", listQ, list));
        __membership = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("followerCount", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __socialStats = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __newsletterV3 = listR4;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var4 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var5 = new nx1("imageId", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var6 = new nx1("bio", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        VerifiedInfo.INSTANCE.getClass();
        sm8 sm8Var = VerifiedInfo.type;
        sm8Var.getClass();
        nx1 nx1Var7 = new nx1("verifications", sm8Var, null, ey3Var, ey3Var, listR);
        Membership.INSTANCE.getClass();
        sm8 sm8Var2 = Membership.type;
        sm8Var2.getClass();
        nx1 nx1Var8 = new nx1(AXoTRPEGKEve.KFQIISeNAS, sm8Var2, null, ey3Var, ey3Var, listR2);
        SocialStats.INSTANCE.getClass();
        sm8 sm8Var3 = SocialStats.type;
        sm8Var3.getClass();
        nx1 nx1Var9 = new nx1("socialStats", sm8Var3, null, ey3Var, ey3Var, listR3);
        NewsletterV3.INSTANCE.getClass();
        sm8 sm8Var4 = NewsletterV3.type;
        sm8Var4.getClass();
        nx1 nx1Var10 = new nx1("newsletterV3", sm8Var4, null, ey3Var, ey3Var, listR4);
        List listQ2 = d46.Q("User");
        List<sx1> list2 = UserFollowDataSelections.INSTANCE.get__root();
        __root = d46.R(nx1Var2, nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, y30.c(list2, "User", listQ2, list2));
    }
}
