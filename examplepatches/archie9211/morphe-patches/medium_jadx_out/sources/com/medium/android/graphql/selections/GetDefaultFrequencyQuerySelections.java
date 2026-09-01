package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MembershipFrequency;
import com.medium.android.graphql.type.MembershipPlansResult;
import com.medium.android.graphql.type.Query;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/selections/GetDefaultFrequencyQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onMembershipPlansResult", "Ljava/util/List;", "__membershipPlans", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetDefaultFrequencyQuerySelections {
    public static final GetDefaultFrequencyQuerySelections INSTANCE = new GetDefaultFrequencyQuerySelections();
    private static final List<sx1> __membershipPlans;
    private static final List<sx1> __onMembershipPlansResult;
    private static final List<sx1> __root;

    static {
        MembershipFrequency.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(MembershipFrequency.type);
        ey3 ey3Var = ey3.a;
        List<sx1> listQ = d46.Q(new nx1("defaultFrequency", rx1VarB, null, ey3Var, ey3Var, ey3Var));
        __onMembershipPlansResult = listQ;
        List<sx1> listR = d46.R(new nx1("__typename", y30.f(GraphQLString.INSTANCE), null, ey3Var, ey3Var, ey3Var), new ox1("MembershipPlansResult", d46.Q("MembershipPlansResult"), listQ));
        __membershipPlans = listR;
        MembershipPlansResult.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(MembershipPlansResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__membershipPlans_platform;
        mx1Var.getClass();
        __root = d46.Q(new nx1("membershipPlans", rx1VarB2, null, ey3Var, ka1.y(mx1Var, new yv8("ANDROID")), listR));
    }

    private GetDefaultFrequencyQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
