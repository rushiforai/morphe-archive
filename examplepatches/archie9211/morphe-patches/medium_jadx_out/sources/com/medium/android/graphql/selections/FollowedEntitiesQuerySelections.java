package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.FollowedPublicationDataSelections;
import com.medium.android.graphql.fragment.selections.FollowedWriterDataSelections;
import com.medium.android.graphql.fragment.selections.PageInfoDataSelections;
import com.medium.android.graphql.type.FollowedEntitiesConnection;
import com.medium.android.graphql.type.FollowedEntityEdge;
import com.medium.android.graphql.type.FollowedEntityNode;
import com.medium.android.graphql.type.FollowedEntityV2;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lv8;
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
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000f\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001d\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0007\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/selections/FollowedEntitiesQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onUser", "Ljava/util/List;", "__onPublication", "__entity", "__node", "__edges", "__pageInfo", "__onFollowedEntitiesConnection", "__followedEntitiesConnection", "__viewerEdge", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowedEntitiesQuerySelections {
    public static final FollowedEntitiesQuerySelections INSTANCE = new FollowedEntitiesQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __entity;
    private static final List<sx1> __followedEntitiesConnection;
    private static final List<sx1> __node;
    private static final List<sx1> __onFollowedEntitiesConnection;
    private static final List<sx1> __onPublication;
    private static final List<sx1> __onUser;
    private static final List<sx1> __pageInfo;
    private static final List<sx1> __root;
    private static final List<sx1> __user;
    private static final List<sx1> __viewerEdge;

    static {
        List listQ = d46.Q("User");
        List<sx1> list = FollowedWriterDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "User", listQ, list);
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(ox1VarC, new nx1("id", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onUser = listR;
        List listQ2 = d46.Q("Publication");
        List<sx1> list2 = FollowedPublicationDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(y30.c(list2, "Publication", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onPublication = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR), new ox1("Publication", d46.Q("Publication"), listR2));
        __entity = listR3;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        FollowedEntityV2.INSTANCE.getClass();
        b1e b1eVar = FollowedEntityV2.type;
        b1eVar.getClass();
        List<sx1> listR4 = d46.R(nx1Var, new nx1("entity", b1eVar, null, ey3Var, ey3Var, listR3));
        __node = listR4;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("hasUnread", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("lastPublishedAt", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        FollowedEntityNode.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var2, nx1Var3, nx1Var4, new nx1("node", kyd.b(FollowedEntityNode.type), null, ey3Var, ey3Var, listR4));
        __edges = listR5;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("PageInfoV2");
        List<sx1> list3 = PageInfoDataSelections.INSTANCE.get__root();
        List<sx1> listR6 = d46.R(nx1Var5, y30.c(list3, "PageInfoV2", listQ3, list3));
        __pageInfo = listR6;
        FollowedEntityEdge.INSTANCE.getClass();
        List<sx1> listR7 = d46.R(new nx1("edges", new rx1(new px1(kyd.b(FollowedEntityEdge.type))), null, ey3Var, ey3Var, listR5), new nx1("pageInfo", km4.r(PageInfoV2.INSTANCE), null, ey3Var, ey3Var, listR6));
        __onFollowedEntitiesConnection = listR7;
        List<sx1> listR8 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("FollowedEntitiesConnection", d46.Q("FollowedEntitiesConnection"), listR7));
        __followedEntitiesConnection = listR8;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        FollowedEntitiesConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(FollowedEntitiesConnection.type);
        UserViewerEdge.INSTANCE.getClass();
        mx1 mx1Var = UserViewerEdge.__followedEntitiesConnection_after;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("after")));
        mx1 mx1Var2 = UserViewerEdge.__followedEntitiesConnection_first;
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "first")));
        mx1 mx1Var3 = UserViewerEdge.__followedEntitiesConnection_input;
        mx1Var3.getClass();
        Map mapSingletonMap = Collections.singletonMap("orderBy", "lastPublishedAt desc");
        mapSingletonMap.getClass();
        List<sx1> listR9 = d46.R(nx1Var6, new nx1("followedEntitiesConnection", rx1VarB, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var3, new yv8(mapSingletonMap))), listR8), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR9;
        List<sx1> listR10 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR9), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR10;
        __root = d46.Q(new nx1("user", ka1.n(User.INSTANCE), null, ey3Var, ka1.y(lv8.j(Query.INSTANCE), new yv8(new tx1("userId"))), listR10));
    }

    private FollowedEntitiesQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
