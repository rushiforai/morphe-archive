package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/UserProfileHeaderResultSelections;", "", "<init>", "()V", "", "Lsx1;", "__onUser", "Ljava/util/List;", "__onGraphqlEmptyId", "__onNotFound", "__onSuspended", "__onBlocked", "__onAccountSuspended", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserProfileHeaderResultSelections {
    public static final UserProfileHeaderResultSelections INSTANCE = new UserProfileHeaderResultSelections();
    private static final List<sx1> __onAccountSuspended;
    private static final List<sx1> __onBlocked;
    private static final List<sx1> __onGraphqlEmptyId;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __onSuspended;
    private static final List<sx1> __onUser;
    private static final List<sx1> __root;

    private UserProfileHeaderResultSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        String str = mgKMENwrbHf.KNH;
        List listQ = d46.Q(str);
        List<sx1> list = UserProfileHeaderDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, str, listQ, list);
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(ox1VarC, new nx1("id", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onUser = listR;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onGraphqlEmptyId = listQ2;
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listQ3 = d46.Q(new nx1("message", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ3;
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listQ4 = d46.Q(new nx1("message", zl2Var3, null, ey3Var, ey3Var, ey3Var));
        __onSuspended = listQ4;
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        List<sx1> listQ5 = d46.Q(new nx1("message", zl2Var4, null, ey3Var, ey3Var, ey3Var));
        __onBlocked = listQ5;
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        List<sx1> listQ6 = d46.Q(new nx1("message", zl2Var5, null, ey3Var, ey3Var, ey3Var));
        __onAccountSuspended = listQ6;
        __root = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1(str, d46.Q(str), listR), new ox1("GraphqlEmptyId", d46.Q("GraphqlEmptyId"), listQ2), new ox1("NotFound", d46.Q("NotFound"), listQ3), new ox1("Suspended", d46.Q("Suspended"), listQ4), new ox1("Blocked", d46.Q("Blocked"), listQ5), new ox1("AccountSuspended", d46.Q("AccountSuspended"), listQ6));
    }
}
