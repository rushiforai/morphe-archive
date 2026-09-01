package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.DailyPostEarning;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostEarnings;
import com.medium.android.graphql.type.PostStatsDailyBundle;
import com.medium.android.graphql.type.PostStatsDailyBundleBucket;
import com.medium.android.graphql.type.PostStatsDailyBundleMembershipType;
import com.medium.android.graphql.type.Query;
import defpackage.d46;
import defpackage.ei7;
import defpackage.ey3;
import defpackage.f09;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/GetPostStatMonthlyQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__buckets", "Ljava/util/List;", "__postStatsDailyBundle", "__dailyEarnings", "__earnings", "__post", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetPostStatMonthlyQuerySelections {
    public static final GetPostStatMonthlyQuerySelections INSTANCE = new GetPostStatMonthlyQuerySelections();
    private static final List<sx1> __buckets;
    private static final List<sx1> __dailyEarnings;
    private static final List<sx1> __earnings;
    private static final List<sx1> __post;
    private static final List<sx1> __postStatsDailyBundle;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        Long.INSTANCE.getClass();
        nx1 nx1Var2 = new nx1("dayStartsAt", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        PostStatsDailyBundleMembershipType.INSTANCE.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, new nx1("membershipType", kyd.b(PostStatsDailyBundleMembershipType.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatClappedCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatHighlightedCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatInitiallyFollowedAuthorFromThisPostCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatRepliedCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatRepostedCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatViewedCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var), new nx1("readersThatReadCount", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var));
        __buckets = listR;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PostStatsDailyBundleBucket.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var3, new nx1("buckets", new rx1(new px1(kyd.b(PostStatsDailyBundleBucket.type))), null, ey3Var, ey3Var, listR));
        __postStatsDailyBundle = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("amount", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = Long.type;
        zl2Var.getClass();
        List<sx1> listR3 = d46.R(nx1Var4, nx1Var5, new nx1("periodStartedAt", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __dailyEarnings = listR3;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        DailyPostEarning.INSTANCE.getClass();
        px1 px1Var = new px1(kyd.b(DailyPostEarning.type));
        PostEarnings.INSTANCE.getClass();
        mx1 mx1Var = PostEarnings.__dailyEarnings_endAt;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("endTime")));
        mx1 mx1Var2 = PostEarnings.__dailyEarnings_startAt;
        List<sx1> listR4 = d46.R(nx1Var6, new nx1("dailyEarnings", px1Var, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "startTime")))), listR3));
        __earnings = listR4;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = Long.type;
        zl2Var2.getClass();
        nx1 nx1Var8 = new nx1("firstPublishedAt", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("isLocked", ka1.e(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var = PostEarnings.type;
        sm8Var.getClass();
        List<sx1> listR5 = d46.R(nx1Var7, nx1Var8, nx1Var9, new nx1("earnings", sm8Var, null, ey3Var, ey3Var, listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR5;
        PostStatsDailyBundle.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(PostStatsDailyBundle.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var3 = Query.__postStatsDailyBundle_postStatsDailyBundleInput;
        mx1Var3.getClass();
        nx1 nx1Var10 = new nx1("postStatsDailyBundle", rx1VarB, null, ey3Var, ka1.y(mx1Var3, new yv8(ei7.Q(new f09("postId", new tx1("postId")), new f09("fromDayStartsAt", new tx1("startTime")), new f09("toDayStartsAt", new tx1("endTime"))))), listR2);
        sm8 sm8VarM = ka1.m(Post.INSTANCE);
        mx1 mx1Var4 = Query.__post_id;
        __root = d46.R(nx1Var10, new nx1("post", sm8VarM, null, ey3Var, ka1.y(mx1Var4, new yv8(ka1.d(mx1Var4, "postId"))), listR5));
    }

    private GetPostStatMonthlyQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
