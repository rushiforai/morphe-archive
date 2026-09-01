package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.Collection;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.LinkedAccounts;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.MastodonAccount;
import com.medium.android.graphql.type.Membership;
import com.medium.android.graphql.type.PartnerProgramEnrollment;
import com.medium.android.graphql.type.PartnerProgramV4EnrollmentStatus;
import com.medium.android.graphql.type.SocialStats;
import com.medium.android.graphql.type.UserViewerEdge;
import com.medium.android.graphql.type.VerifiedInfo;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CurrentUserDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__socialStats", "Ljava/util/List;", "__membership", "__viewerEdge", "__verifications", "__partnerProgramEnrollment", "__adminCollections", "__mastodon", "__linkedAccounts", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CurrentUserDataSelections {
    public static final CurrentUserDataSelections INSTANCE = new CurrentUserDataSelections();
    private static final List<sx1> __adminCollections;
    private static final List<sx1> __linkedAccounts;
    private static final List<sx1> __mastodon;
    private static final List<sx1> __membership;
    private static final List<sx1> __partnerProgramEnrollment;
    private static final List<sx1> __root;
    private static final List<sx1> __socialStats;
    private static final List<sx1> __verifications;
    private static final List<sx1> __viewerEdge;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("followerCount", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = Long.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("followingCount", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = Long.type;
        zl2Var2.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, nx1Var3, new nx1("collectionFollowingCount", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __socialStats = listR;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Membership");
        List<sx1> list = MembershipFragmentSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var4, y30.c(list, "Membership", listQ, list));
        __membership = listR2;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var6 = new nx1("facebookDisplayName", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("hasList", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = Long.type;
        zl2Var4.getClass();
        nx1 nx1Var8 = new nx1("firstOpenedAndroidApp", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = Long.type;
        zl2Var5.getClass();
        List<sx1> listR3 = d46.R(nx1Var5, nx1Var6, nx1Var7, nx1Var8, new nx1("lastPostCreatedAt", zl2Var5, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isBookAuthor", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var));
        __verifications = listR4;
        nx1 nx1Var9 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PartnerProgramV4EnrollmentStatus.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var9, new nx1("status", kyd.b(PartnerProgramV4EnrollmentStatus.type), null, ey3Var, ey3Var, ey3Var));
        __partnerProgramEnrollment = listR5;
        nx1 nx1Var10 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var11 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var6 = GraphQLString.type;
        zl2Var6.getClass();
        List<sx1> listR6 = d46.R(nx1Var10, nx1Var11, new nx1("name", zl2Var6, null, ey3Var, ey3Var, ey3Var));
        __adminCollections = listR6;
        List<sx1> listR7 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("domain", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("username", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __mastodon = listR7;
        nx1 nx1Var12 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        MastodonAccount.INSTANCE.getClass();
        sm8 sm8Var = MastodonAccount.type;
        sm8Var.getClass();
        List<sx1> listR8 = d46.R(nx1Var12, new nx1("mastodon", sm8Var, null, ey3Var, ey3Var, listR7));
        __linkedAccounts = listR8;
        nx1 nx1Var13 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var14 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var7 = GraphQLString.type;
        zl2Var7.getClass();
        nx1 nx1Var15 = new nx1("name", zl2Var7, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var8 = GraphQLString.type;
        zl2Var8.getClass();
        nx1 nx1Var16 = new nx1("username", zl2Var8, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var9 = GraphQLString.type;
        zl2Var9.getClass();
        nx1 nx1Var17 = new nx1("imageId", zl2Var9, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var10 = GraphQLString.type;
        zl2Var10.getClass();
        nx1 nx1Var18 = new nx1("bio", zl2Var10, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var11 = GraphQLString.type;
        zl2Var11.getClass();
        nx1 nx1Var19 = new nx1("aboutAsHtml", zl2Var11, null, ey3Var, ey3Var, ey3Var);
        SocialStats.INSTANCE.getClass();
        sm8 sm8Var2 = SocialStats.type;
        sm8Var2.getClass();
        nx1 nx1Var20 = new nx1("socialStats", sm8Var2, null, ey3Var, ey3Var, listR);
        Membership.INSTANCE.getClass();
        sm8 sm8Var3 = Membership.type;
        sm8Var3.getClass();
        nx1 nx1Var21 = new nx1("membership", sm8Var3, null, ey3Var, ey3Var, listR2);
        zl2 zl2Var12 = GraphQLBoolean.type;
        zl2Var12.getClass();
        nx1 nx1Var22 = new nx1("isMembershipTrialEligible", zl2Var12, null, ey3Var, ey3Var, ey3Var);
        UserViewerEdge.INSTANCE.getClass();
        nx1 nx1Var23 = new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR3);
        nx1 nx1Var24 = new nx1("twitterScreenName", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        VerifiedInfo.INSTANCE.getClass();
        sm8 sm8Var4 = VerifiedInfo.type;
        sm8Var4.getClass();
        nx1 nx1Var25 = new nx1("verifications", sm8Var4, null, ey3Var, ey3Var, listR4);
        PartnerProgramEnrollment.INSTANCE.getClass();
        sm8 sm8Var5 = PartnerProgramEnrollment.type;
        sm8Var5.getClass();
        nx1 nx1Var26 = new nx1("partnerProgramEnrollment", sm8Var5, null, ey3Var, ey3Var, listR5);
        Collection.INSTANCE.getClass();
        nx1 nx1Var27 = new nx1("adminCollections", new rx1(new px1(kyd.b(Collection.type))), null, ey3Var, ey3Var, listR6);
        zl2 zl2Var13 = GraphQLBoolean.type;
        zl2Var13.getClass();
        nx1 nx1Var28 = new nx1("allowEmailAddressSharingEditorWriter", zl2Var13, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var29 = new nx1("pronouns", new rx1(new px1(kyd.b(GraphQLString.type))), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var30 = new nx1("isSuspended", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var31 = new nx1("twitterScreenName", kyd.b(GraphQLString.type), "xDisplayName", ey3Var, ey3Var, ey3Var);
        LinkedAccounts.INSTANCE.getClass();
        sm8 sm8Var6 = LinkedAccounts.type;
        sm8Var6.getClass();
        __root = d46.R(nx1Var13, nx1Var14, nx1Var15, nx1Var16, nx1Var17, nx1Var18, nx1Var19, nx1Var20, nx1Var21, nx1Var22, nx1Var23, nx1Var24, nx1Var25, nx1Var26, nx1Var27, nx1Var28, nx1Var29, nx1Var30, nx1Var31, new nx1("linkedAccounts", sm8Var6, null, ey3Var, ey3Var, listR8));
    }

    private CurrentUserDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
