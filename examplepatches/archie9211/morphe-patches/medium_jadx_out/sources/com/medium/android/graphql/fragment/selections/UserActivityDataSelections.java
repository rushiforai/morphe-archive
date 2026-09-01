package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Markup;
import com.medium.android.graphql.type.MarkupType;
import com.medium.android.graphql.type.Paragraph;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostContent;
import com.medium.android.graphql.type.Quote;
import com.medium.android.graphql.type.ResponseRootPost;
import com.medium.android.graphql.type.RichText;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.n04;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000e\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001d\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u0007\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/UserActivityDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__post1", "Ljava/util/List;", "__responseRootPost", "__post", "__quote", "__markups", "__paragraphs", "__bodyModel", "__content", "__responsePost", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserActivityDataSelections {
    public static final UserActivityDataSelections INSTANCE = new UserActivityDataSelections();
    private static final List<sx1> __bodyModel;
    private static final List<sx1> __content;
    private static final List<sx1> __markups;
    private static final List<sx1> __paragraphs;
    private static final List<sx1> __post;
    private static final List<sx1> __post1;
    private static final List<sx1> __quote;
    private static final List<sx1> __responsePost;
    private static final List<sx1> __responseRootPost;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        PostPreviewDataSelections postPreviewDataSelections = PostPreviewDataSelections.INSTANCE;
        List<sx1> list = postPreviewDataSelections.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Post", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post1 = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("post", ka1.m(Post.INSTANCE), null, ey3Var, ey3Var, listR));
        __responseRootPost = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Post");
        List<sx1> list2 = postPreviewDataSelections.get__root();
        ox1 ox1VarC = y30.c(list2, "Post", listQ2, list2);
        ResponseRootPost.INSTANCE.getClass();
        sm8 sm8Var = ResponseRootPost.type;
        sm8Var.getClass();
        List<sx1> listR3 = d46.R(nx1Var2, ox1VarC, new nx1("responseRootPost", sm8Var, null, ey3Var, ey3Var, listR2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Quote");
        List<sx1> list3 = HighlightDataSelections.INSTANCE.get__root();
        List<sx1> listR4 = d46.R(nx1Var3, y30.c(list3, "Quote", listQ3, list3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __quote = listR4;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        MarkupType.INSTANCE.getClass();
        n04 n04Var = MarkupType.type;
        n04Var.getClass();
        nx1 nx1Var5 = new nx1("type", n04Var, null, ey3Var, ey3Var, ey3Var);
        GraphQLInt.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var4, nx1Var5, new nx1("start", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var), new nx1("end", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var));
        __markups = listR5;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var8 = new nx1("text", zl2Var, null, ey3Var, ey3Var, ey3Var);
        Markup.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var6, nx1Var7, nx1Var8, new nx1("markups", new rx1(new px1(kyd.b(Markup.type))), null, ey3Var, ey3Var, listR5));
        __paragraphs = listR6;
        nx1 nx1Var9 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Paragraph.INSTANCE.getClass();
        List<sx1> listR7 = d46.R(nx1Var9, new nx1("paragraphs", new rx1(new px1(kyd.b(Paragraph.type))), null, ey3Var, ey3Var, listR6));
        __bodyModel = listR7;
        nx1 nx1Var10 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RichText.INSTANCE.getClass();
        List<sx1> listR8 = d46.R(nx1Var10, new nx1("bodyModel", kyd.b(RichText.type), null, ey3Var, ey3Var, listR7));
        __content = listR8;
        nx1 nx1Var11 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var12 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PostContent.INSTANCE.getClass();
        List<sx1> listR9 = d46.R(nx1Var11, nx1Var12, new nx1("content", kyd.b(PostContent.type), null, ey3Var, ey3Var, listR8));
        __responsePost = listR9;
        nx1 nx1Var13 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var14 = new nx1("activityName", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var15 = new nx1("activityType", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Long.INSTANCE.getClass();
        nx1 nx1Var16 = new nx1("occurredAt", kyd.b(Long.type), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var2 = Post.type;
        sm8Var2.getClass();
        nx1 nx1Var17 = new nx1("post", sm8Var2, null, ey3Var, ey3Var, listR3);
        Quote.INSTANCE.getClass();
        sm8 sm8Var3 = Quote.type;
        sm8Var3.getClass();
        nx1 nx1Var18 = new nx1("quote", sm8Var3, null, ey3Var, ey3Var, listR4);
        sm8 sm8Var4 = Post.type;
        sm8Var4.getClass();
        __root = d46.R(nx1Var13, nx1Var14, nx1Var15, nx1Var16, nx1Var17, nx1Var18, new nx1("responsePost", sm8Var4, null, ey3Var, ey3Var, listR9));
    }

    private UserActivityDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
