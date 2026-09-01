package com.medium.android.graphql.fragment.selections;

import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PostContent;
import com.medium.android.graphql.type.RichText;
import com.medium.android.graphql.type.Tag;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.px1;
import defpackage.rx1;
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/FullPostDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__tags", "Ljava/util/List;", "__bodyModel", "__viewerEdge", "__shareKeyCreator", "__content", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FullPostDataSelections {
    public static final FullPostDataSelections INSTANCE = new FullPostDataSelections();
    private static final List<sx1> __bodyModel;
    private static final List<sx1> __content;
    private static final List<sx1> __root;
    private static final List<sx1> __shareKeyCreator;
    private static final List<sx1> __tags;
    private static final List<sx1> __viewerEdge;

    private FullPostDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Tag");
        List<sx1> list = TagNoViewerEdgeDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Tag", listQ, list), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __tags = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("RichText");
        List<sx1> list2 = PostBodyDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "RichText", listQ2, list2));
        __bodyModel = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isUser", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var5 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var6 = new nx1("username", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        UserViewerEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, nx1Var4, nx1Var5, nx1Var6, new nx1(bPUi.srYcvuVfMuXmY, kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR3));
        __shareKeyCreator = listR4;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RichText.INSTANCE.getClass();
        nx1 nx1Var8 = new nx1("bodyModel", kyd.b(RichText.type), null, ey3Var, ey3Var, listR2);
        nx1 nx1Var9 = new nx1("isLockedPreviewOnly", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listR5 = d46.R(nx1Var7, nx1Var8, nx1Var9, new nx1("validatedShareKey", zl2Var3, null, ey3Var, ey3Var, ey3Var), new nx1("shareKeyCreator", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR4));
        __content = listR5;
        nx1 nx1Var10 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Post");
        List<sx1> list3 = PostMetaDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list3, "Post", listQ3, list3);
        List listQ4 = d46.Q("Post");
        List<sx1> list4 = LinkMetadataListSelections.INSTANCE.get__root();
        ox1 ox1VarC2 = y30.c(list4, "Post", listQ4, list4);
        List listQ5 = d46.Q("Post");
        List<sx1> list5 = PostFooterCountDataSelections.INSTANCE.get__root();
        ox1 ox1VarC3 = y30.c(list5, "Post", listQ5, list5);
        Tag.INSTANCE.getClass();
        nx1 nx1Var11 = new nx1("tags", new px1(kyd.b(Tag.type)), null, ey3Var, ey3Var, listR);
        PostContent.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(PostContent.type);
        Post.INSTANCE.getClass();
        mx1 mx1Var = Post.__content_postMeteringOptions;
        mx1Var.getClass();
        nx1 nx1Var12 = new nx1("content", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("postMeteringOptions"))), listR5);
        List listQ6 = d46.Q("Post");
        List<sx1> list6 = PostFeaturingStatusDataSelections.INSTANCE.get__root();
        ox1 ox1VarC4 = y30.c(list6, "Post", listQ6, list6);
        List listQ7 = d46.Q("Post");
        List<sx1> list7 = PostPromotionBannerDataSelections.INSTANCE.get__root();
        ox1 ox1VarC5 = y30.c(list7, "Post", listQ7, list7);
        List listQ8 = d46.Q("Post");
        List<sx1> list8 = PostRepostStateDataSelections.INSTANCE.get__root();
        ox1 ox1VarC6 = y30.c(list8, "Post", listQ8, list8);
        List listQ9 = d46.Q("Post");
        List<sx1> list9 = PostRepostCountDataSelections.INSTANCE.get__root();
        __root = d46.R(nx1Var10, ox1VarC, ox1VarC2, ox1VarC3, nx1Var11, nx1Var12, ox1VarC4, ox1VarC5, ox1VarC6, y30.c(list9, "Post", listQ9, list9), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
    }
}
