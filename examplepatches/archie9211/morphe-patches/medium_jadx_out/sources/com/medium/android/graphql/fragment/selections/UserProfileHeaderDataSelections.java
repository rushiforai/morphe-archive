package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.AuthorBook;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Membership;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostConnection;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import com.medium.android.graphql.type.VerifiedInfo;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/UserProfileHeaderDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__viewerEdge", "Ljava/util/List;", "__verifications", "__posts", "__homepagePostsConnection", "__membership", "__authoredBooks", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserProfileHeaderDataSelections {
    public static final UserProfileHeaderDataSelections INSTANCE = new UserProfileHeaderDataSelections();
    private static final List<sx1> __authoredBooks;
    private static final List<sx1> __homepagePostsConnection;
    private static final List<sx1> __membership;
    private static final List<sx1> __posts;
    private static final List<sx1> __root;
    private static final List<sx1> __verifications;
    private static final List<sx1> __viewerEdge;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("isUser", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("hasList", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isBookAuthor", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var));
        __verifications = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __posts = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("posts", new px1(km4.s(Post.INSTANCE)), null, ey3Var, ey3Var, listR3));
        __homepagePostsConnection = listR4;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Membership");
        List<sx1> list = MembershipFragmentSelections.INSTANCE.get__root();
        List<sx1> listR5 = d46.R(nx1Var, y30.c(list, "Membership", listQ, list));
        __membership = listR5;
        List<sx1> listR6 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("title", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __authoredBooks = listR6;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var4 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var5 = new nx1("imageId", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var6 = new nx1("username", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("pronouns", new rx1(new px1(kyd.b(GraphQLString.type))), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var8 = new nx1("hasSubdomain", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("User");
        List<sx1> list2 = UserNewsletterDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list2, "User", listQ2, list2);
        List listQ3 = d46.Q("User");
        List<sx1> list3 = UserFollowDataSelections.INSTANCE.get__root();
        ox1 ox1VarC2 = y30.c(list3, "User", listQ3, list3);
        List listQ4 = d46.Q("User");
        List<sx1> list4 = UserMuteDataSelections.INSTANCE.get__root();
        ox1 ox1VarC3 = y30.c(list4, "User", listQ4, list4);
        List listQ5 = d46.Q("User");
        List<sx1> list5 = UserBlockDataSelections.INSTANCE.get__root();
        ox1 ox1VarC4 = y30.c(list5, "User", listQ5, list5);
        UserViewerEdge.INSTANCE.getClass();
        nx1 nx1Var9 = new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR);
        VerifiedInfo.INSTANCE.getClass();
        sm8 sm8Var = VerifiedInfo.type;
        sm8Var.getClass();
        nx1 nx1Var10 = new nx1("verifications", sm8Var, null, ey3Var, ey3Var, listR2);
        PostConnection.INSTANCE.getClass();
        sm8 sm8Var2 = PostConnection.type;
        sm8Var2.getClass();
        User.INSTANCE.getClass();
        mx1 mx1Var = User.__homepagePostsConnection_paging;
        mx1Var.getClass();
        Map mapSingletonMap = Collections.singletonMap("limit", 1);
        mapSingletonMap.getClass();
        nx1 nx1Var11 = new nx1("homepagePostsConnection", sm8Var2, null, ey3Var, ka1.y(mx1Var, new yv8(mapSingletonMap)), listR4);
        Membership.INSTANCE.getClass();
        sm8 sm8Var3 = Membership.type;
        sm8Var3.getClass();
        nx1 nx1Var12 = new nx1("membership", sm8Var3, null, ey3Var, ey3Var, listR5);
        AuthorBook.INSTANCE.getClass();
        nx1 nx1Var13 = new nx1("authoredBooks", new rx1(new px1(kyd.b(AuthorBook.type))), null, ey3Var, ey3Var, listR6);
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        nx1 nx1Var14 = new nx1("bio", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        __root = d46.R(nx1Var2, nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, nx1Var8, ox1VarC, ox1VarC2, ox1VarC3, ox1VarC4, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, nx1Var14, new nx1("aboutAsHtml", zl2Var5, null, ey3Var, ey3Var, ey3Var));
    }

    private UserProfileHeaderDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
