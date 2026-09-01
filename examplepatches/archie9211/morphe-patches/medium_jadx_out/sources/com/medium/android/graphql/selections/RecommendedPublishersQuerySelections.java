package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CollectionPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.CreatorPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.PageInfoDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RecommendedPublishersConnection;
import com.medium.android.graphql.type.RecommendedPublishersConnectionEdge;
import com.medium.android.graphql.type.RecommendedPublishersConnectionEdgeNode;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/selections/RecommendedPublishersQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onUser", "Ljava/util/List;", "__onCollection", "__node", "__edges", "__pageInfo", "__recommendedPublishers", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RecommendedPublishersQuerySelections {
    public static final RecommendedPublishersQuerySelections INSTANCE = new RecommendedPublishersQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __node;
    private static final List<sx1> __onCollection;
    private static final List<sx1> __onUser;
    private static final List<sx1> __pageInfo;
    private static final List<sx1> __recommendedPublishers;
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
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR), new ox1("Collection", d46.Q("Collection"), listR2));
        __node = listR3;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedPublishersConnectionEdgeNode.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var, new nx1("node", kyd.b(RecommendedPublishersConnectionEdgeNode.type), null, ey3Var, ey3Var, listR3));
        __edges = listR4;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("PageInfoV2");
        List<sx1> list3 = PageInfoDataSelections.INSTANCE.get__root();
        List<sx1> listR5 = d46.R(nx1Var2, y30.c(list3, "PageInfoV2", listQ3, list3));
        __pageInfo = listR5;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedPublishersConnectionEdge.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var3, new nx1("edges", new rx1(new px1(kyd.b(RecommendedPublishersConnectionEdge.type))), null, ey3Var, ey3Var, listR4), new nx1("pageInfo", km4.r(PageInfoV2.INSTANCE), null, ey3Var, ey3Var, listR5));
        __recommendedPublishers = listR6;
        RecommendedPublishersConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(RecommendedPublishersConnection.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__recommendedPublishers_after;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("after")));
        mx1 mx1Var2 = Query.__recommendedPublishers_first;
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "first")));
        mx1 mx1Var3 = Query.__recommendedPublishers_mode;
        __root = d46.Q(new nx1("recommendedPublishers", rx1VarB, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var3, new yv8(ka1.d(mx1Var3, "mode")))), listR6));
    }

    private RecommendedPublishersQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
