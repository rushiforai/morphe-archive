package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.DigestDataSelections;
import com.medium.android.graphql.type.DigestByIdResponse;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/DigestByIdQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onDigest", "Ljava/util/List;", "__onNotFound", "__digestById", "__viewer", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DigestByIdQuerySelections {
    public static final DigestByIdQuerySelections INSTANCE = new DigestByIdQuerySelections();
    private static final List<sx1> __digestById;
    private static final List<sx1> __onDigest;
    private static final List<sx1> __onNotFound;
    private static final List<sx1> __root;
    private static final List<sx1> __viewer;

    static {
        List listQ = d46.Q("Digest");
        List<sx1> list = DigestDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "Digest", listQ, list);
        rx1 rx1VarE = y30.e(GraphQLID.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(ox1VarC, new nx1("id", rx1VarE, null, ey3Var, ey3Var, ey3Var));
        __onDigest = listR;
        List<sx1> listQ2 = d46.Q(new nx1("message", y30.i(GraphQLString.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onNotFound = listQ2;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Digest", d46.Q("Digest"), listR), new ox1("NotFound", d46.Q("NotFound"), listQ2));
        __digestById = listR2;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        DigestByIdResponse.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(DigestByIdResponse.type);
        User.INSTANCE.getClass();
        mx1 mx1Var = User.__digestById_id;
        mx1Var.getClass();
        List<sx1> listR3 = d46.R(nx1Var, new nx1("digestById", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("digestId"))), listR2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewer = listR3;
        sm8 sm8Var = User.type;
        sm8Var.getClass();
        __root = d46.Q(new nx1("viewer", sm8Var, null, ey3Var, ey3Var, listR3));
    }

    private DigestByIdQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
