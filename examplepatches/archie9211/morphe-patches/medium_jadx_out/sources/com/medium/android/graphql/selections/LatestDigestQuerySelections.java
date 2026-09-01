package com.medium.android.graphql.selections;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.fragment.selections.DigestDataSelections;
import com.medium.android.graphql.type.Digest;
import com.medium.android.graphql.type.DigestEdge;
import com.medium.android.graphql.type.DigestsConnectionResponse;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/LatestDigestQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__node", "Ljava/util/List;", "__edges", "__onDigestsConnection", "__digestsConnection", "__viewer", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LatestDigestQuerySelections {
    public static final LatestDigestQuerySelections INSTANCE = new LatestDigestQuerySelections();
    private static final List<sx1> __digestsConnection;
    private static final List<sx1> __edges;
    private static final List<sx1> __node;
    private static final List<sx1> __onDigestsConnection;
    private static final List<sx1> __root;
    private static final List<sx1> __viewer;

    private LatestDigestQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Digest");
        List<sx1> list = DigestDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Digest", listQ, list), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __node = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Digest.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, new nx1("node", kyd.b(Digest.type), null, ey3Var, ey3Var, listR));
        __edges = listR2;
        DigestEdge.INSTANCE.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("edges", new rx1(new px1(kyd.b(DigestEdge.type))), null, ey3Var, ey3Var, listR2));
        __onDigestsConnection = listQ2;
        List<sx1> listR3 = d46.R(new nx1(ZVsviyDAr.WUb, kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("DigestsConnection", d46.Q("DigestsConnection"), listQ2));
        __digestsConnection = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        DigestsConnectionResponse.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(DigestsConnectionResponse.type);
        User.INSTANCE.getClass();
        mx1 mx1Var = User.__digestsConnection_after;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(""));
        mx1 mx1Var2 = User.__digestsConnection_first;
        mx1Var2.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, new nx1("digestsConnection", rx1VarB, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(1))), listR3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewer = listR4;
        sm8 sm8Var = User.type;
        sm8Var.getClass();
        __root = d46.Q(new nx1("viewer", sm8Var, null, ey3Var, ey3Var, listR4));
    }
}
