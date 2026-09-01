package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CollectionPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.CreatorPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.TagDataSelections;
import com.medium.android.graphql.type.Collection;
import com.medium.android.graphql.type.CollectionConnection;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.Tag;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserConnection;
import com.medium.android.graphql.type.UserFollowedTags;
import com.medium.android.graphql.type.UserMissionControl;
import com.medium.android.graphql.type.UserMissionControlCount;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0010\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0007R\u001d\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0012\u0010\u0007\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/selections/AllFollowingQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__counts", "Ljava/util/List;", "__onUserMissionControl", "__missionControl", "__users", "__followingUserConnection", "__collections", "__followingCollectionConnection", "__tags", "__followedTags1", "__onUser", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AllFollowingQuerySelections {
    public static final AllFollowingQuerySelections INSTANCE = new AllFollowingQuerySelections();
    private static final List<sx1> __collections;
    private static final List<sx1> __counts;
    private static final List<sx1> __followedTags1;
    private static final List<sx1> __followingCollectionConnection;
    private static final List<sx1> __followingUserConnection;
    private static final List<sx1> __missionControl;
    private static final List<sx1> __onUser;
    private static final List<sx1> __onUserMissionControl;
    private static final List<sx1> __root;
    private static final List<sx1> __tags;
    private static final List<sx1> __user;
    private static final List<sx1> __users;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("followedAuthors", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLInt.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("followedCollections", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLInt.type;
        zl2Var2.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, nx1Var3, new nx1("followedTags", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __counts = listR;
        UserMissionControlCount.INSTANCE.getClass();
        sm8 sm8Var = UserMissionControlCount.type;
        sm8Var.getClass();
        List<sx1> listQ = d46.Q(new nx1("counts", sm8Var, null, ey3Var, ey3Var, listR));
        __onUserMissionControl = listQ;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("UserMissionControl", d46.Q("UserMissionControl"), listQ));
        __missionControl = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("User");
        List<sx1> list = CreatorPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var4, y30.c(list, "User", listQ2, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __users = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("users", new rx1(new px1(y30.g(User.INSTANCE))), null, ey3Var, ey3Var, listR3));
        __followingUserConnection = listR4;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Collection");
        List<sx1> list2 = CollectionPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR5 = d46.R(nx1Var5, y30.c(list2, "Collection", listQ3, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __collections = listR5;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Collection.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var6, new nx1("collections", new rx1(new px1(kyd.b(Collection.type))), null, ey3Var, ey3Var, listR5));
        __followingCollectionConnection = listR6;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ4 = d46.Q("Tag");
        List<sx1> list3 = TagDataSelections.INSTANCE.get__root();
        List<sx1> listR7 = d46.R(nx1Var7, y30.c(list3, "Tag", listQ4, list3), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __tags = listR7;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Tag.INSTANCE.getClass();
        List<sx1> listR8 = d46.R(nx1Var8, new nx1("tags", new rx1(new px1(kyd.b(Tag.type))), null, ey3Var, ey3Var, listR7));
        __followedTags1 = listR8;
        UserMissionControl.INSTANCE.getClass();
        sm8 sm8Var2 = UserMissionControl.type;
        sm8Var2.getClass();
        nx1 nx1Var9 = new nx1("missionControl", sm8Var2, null, ey3Var, ey3Var, listR2);
        UserConnection.INSTANCE.getClass();
        sm8 sm8Var3 = UserConnection.type;
        sm8Var3.getClass();
        mx1 mx1Var = User.__followingUserConnection_paging;
        nx1 nx1Var10 = new nx1("followingUserConnection", sm8Var3, null, ey3Var, ka1.y(mx1Var, new yv8(ka1.d(mx1Var, "paging"))), listR4);
        CollectionConnection.INSTANCE.getClass();
        sm8 sm8Var4 = CollectionConnection.type;
        sm8Var4.getClass();
        mx1 mx1Var2 = User.__followingCollectionConnection_paging;
        nx1 nx1Var11 = new nx1("followingCollectionConnection", sm8Var4, null, ey3Var, ka1.y(mx1Var2, new yv8(ka1.d(mx1Var2, "paging"))), listR6);
        UserFollowedTags.INSTANCE.getClass();
        sm8 sm8Var5 = UserFollowedTags.type;
        sm8Var5.getClass();
        mx1 mx1Var3 = User.__followedTags_paging;
        List<sx1> listR9 = d46.R(nx1Var9, nx1Var10, nx1Var11, new nx1("followedTags", sm8Var5, null, ey3Var, ka1.y(mx1Var3, new yv8(ka1.d(mx1Var3, "paging"))), listR8));
        __onUser = listR9;
        List<sx1> listR10 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR9), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR10;
        sm8 sm8Var6 = User.type;
        sm8Var6.getClass();
        __root = d46.Q(new nx1("user", sm8Var6, null, ey3Var, ka1.y(lv8.j(Query.INSTANCE), new yv8(new tx1("userId"))), listR10));
    }

    private AllFollowingQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
