package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostFeedReason;
import com.medium.android.graphql.type.PostProviderExplanation;
import com.medium.android.graphql.type.Repost;
import com.medium.android.graphql.type.Tag;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.n04;
import defpackage.nx1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/HomeFeedItemDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__post", "Ljava/util/List;", "__tagObject", "__viewerEdge", "__interactedUsers", "__postProviderExplanation", "__feedRepost", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class HomeFeedItemDataSelections {
    public static final HomeFeedItemDataSelections INSTANCE = new HomeFeedItemDataSelections();
    private static final List<sx1> __feedRepost;
    private static final List<sx1> __interactedUsers;
    private static final List<sx1> __post;
    private static final List<sx1> __postProviderExplanation;
    private static final List<sx1> __root;
    private static final List<sx1> __tagObject;
    private static final List<sx1> __viewerEdge;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = PostPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Post", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Tag");
        List<sx1> list2 = TagDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "Tag", listQ2, list2), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __tagObject = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isUser", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var5 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var6 = new nx1("username", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var7 = new nx1("imageId", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        UserViewerEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR3));
        __interactedUsers = listR4;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PostFeedReason.INSTANCE.getClass();
        n04 n04Var = PostFeedReason.type;
        n04Var.getClass();
        nx1 nx1Var9 = new nx1("reason", n04Var, null, ey3Var, ey3Var, ey3Var);
        Tag.INSTANCE.getClass();
        sm8 sm8Var = Tag.type;
        sm8Var.getClass();
        nx1 nx1Var10 = new nx1("tagObject", sm8Var, null, ey3Var, ey3Var, listR2);
        User.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var8, nx1Var9, nx1Var10, new nx1("interactedUsers", kyd.a(User.type), null, ey3Var, ey3Var, listR4));
        __postProviderExplanation = listR5;
        nx1 nx1Var11 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var12 = new nx1("repostedAt", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        List<sx1> listR6 = d46.R(nx1Var11, nx1Var12, new nx1("note", zl2Var4, null, ey3Var, ey3Var, ey3Var));
        __feedRepost = listR6;
        nx1 nx1Var13 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var14 = new nx1("post", ka1.m(Post.INSTANCE), null, ey3Var, ey3Var, listR);
        nx1 nx1Var15 = new nx1("reason", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        PostProviderExplanation.INSTANCE.getClass();
        sm8 sm8Var2 = PostProviderExplanation.type;
        sm8Var2.getClass();
        nx1 nx1Var16 = new nx1("postProviderExplanation", sm8Var2, null, ey3Var, ey3Var, listR5);
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        nx1 nx1Var17 = new nx1("feedId", zl2Var5, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var6 = GraphQLInt.type;
        zl2Var6.getClass();
        nx1 nx1Var18 = new nx1("moduleSourceEncoding", zl2Var6, null, ey3Var, ey3Var, ey3Var);
        Repost.INSTANCE.getClass();
        sm8 sm8Var3 = Repost.type;
        sm8Var3.getClass();
        __root = d46.R(nx1Var13, nx1Var14, nx1Var15, nx1Var16, nx1Var17, nx1Var18, new nx1("feedRepost", sm8Var3, null, ey3Var, ey3Var, listR6));
    }

    private HomeFeedItemDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
