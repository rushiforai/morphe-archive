package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLString;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/WhoToFollowNodeSelections;", "", "<init>", "()V", "", "Lsx1;", "__onUser", "Ljava/util/List;", "__onCollection", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class WhoToFollowNodeSelections {
    public static final WhoToFollowNodeSelections INSTANCE = new WhoToFollowNodeSelections();
    private static final List<sx1> __onCollection;
    private static final List<sx1> __onUser;
    private static final List<sx1> __root;

    static {
        List listQ = d46.Q("User");
        List<sx1> list = CreatorPreviewDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "User", listQ, list);
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(ox1VarC, new nx1("id", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onUser = listR;
        List listQ2 = d46.Q("Collection");
        List<sx1> list2 = CollectionPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(y30.c(list2, "Collection", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onCollection = listR2;
        __root = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR), new ox1("Collection", d46.Q("Collection"), listR2));
    }

    private WhoToFollowNodeSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
