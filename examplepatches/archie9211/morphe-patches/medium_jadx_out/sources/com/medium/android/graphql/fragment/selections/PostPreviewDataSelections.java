package com.medium.android.graphql.fragment.selections;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.medium.android.graphql.type.Collection;
import com.medium.android.graphql.type.CollectionViewerEdge;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLFloat;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.PreviewContent;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.UserViewerEdge;
import com.medium.android.graphql.type.VerifiedInfo;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.nx1;
import defpackage.ox1;
import defpackage.rx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.y30;
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/PostPreviewDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__previewContent", "Ljava/util/List;", "__previewImage", "__avatar", "__viewerEdge", "__collection", "__viewerEdge1", "__verifications", "__creator", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostPreviewDataSelections {
    public static final PostPreviewDataSelections INSTANCE = new PostPreviewDataSelections();
    private static final List<sx1> __avatar;
    private static final List<sx1> __collection;
    private static final List<sx1> __creator;
    private static final List<sx1> __previewContent;
    private static final List<sx1> __previewImage;
    private static final List<sx1> __root;
    private static final List<sx1> __verifications;
    private static final List<sx1> __viewerEdge;
    private static final List<sx1> __viewerEdge1;

    private PostPreviewDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR = d46.R(nx1Var, new nx1("subtitle", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __previewContent = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("ImageMetadata");
        List<sx1> list = ImageMetadataDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list, "ImageMetadata", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __previewImage = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __avatar = listR3;
        List<sx1> listR4 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isEditor", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge = listR4;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var4 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var5 = new nx1("name", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var = ImageMetadata.type;
        sm8Var.getClass();
        nx1 nx1Var6 = new nx1("avatar", sm8Var, null, ey3Var, ey3Var, listR3);
        CollectionViewerEdge.INSTANCE.getClass();
        nx1 nx1Var7 = new nx1("viewerEdge", kyd.b(CollectionViewerEdge.type), null, ey3Var, ey3Var, listR4);
        List listQ2 = d46.Q("Collection");
        List<sx1> list2 = CollectionFollowDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list2, "Collection", listQ2, list2);
        List listQ3 = d46.Q("Collection");
        List<sx1> list3 = CollectionMuteDataSelections.INSTANCE.get__root();
        List<sx1> listR5 = d46.R(nx1Var3, nx1Var4, nx1Var5, nx1Var6, nx1Var7, ox1VarC, y30.c(list3, "Collection", listQ3, list3));
        __collection = listR5;
        List<sx1> listR6 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isUser", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewerEdge1 = listR6;
        List<sx1> listR7 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("isBookAuthor", kyd.b(GraphQLBoolean.type), null, ey3Var, ey3Var, ey3Var));
        __verifications = listR7;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var10 = new nx1("name", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        nx1 nx1Var11 = new nx1("imageId", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        UserViewerEdge.INSTANCE.getClass();
        nx1 nx1Var12 = new nx1("viewerEdge", kyd.b(UserViewerEdge.type), null, ey3Var, ey3Var, listR6);
        VerifiedInfo.INSTANCE.getClass();
        sm8 sm8Var2 = VerifiedInfo.type;
        sm8Var2.getClass();
        nx1 nx1Var13 = new nx1("verifications", sm8Var2, null, ey3Var, ey3Var, listR7);
        String str = QFTsJPDEnO.vlUUa;
        List listQ4 = d46.Q(str);
        List<sx1> list4 = UserFollowDataSelections.INSTANCE.get__root();
        ox1 ox1VarC2 = y30.c(list4, str, listQ4, list4);
        List listQ5 = d46.Q(str);
        List<sx1> list5 = UserMuteDataSelections.INSTANCE.get__root();
        ox1 ox1VarC3 = y30.c(list5, str, listQ5, list5);
        List listQ6 = d46.Q(str);
        List<sx1> list6 = UserNewsletterDataSelections.INSTANCE.get__root();
        List<sx1> listR8 = d46.R(nx1Var8, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, ox1VarC2, ox1VarC3, y30.c(list6, str, listQ6, list6));
        __creator = listR8;
        nx1 nx1Var14 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var15 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        nx1 nx1Var16 = new nx1("title", zl2Var5, null, ey3Var, ey3Var, ey3Var);
        PreviewContent.INSTANCE.getClass();
        sm8 sm8Var3 = PreviewContent.type;
        sm8Var3.getClass();
        nx1 nx1Var17 = new nx1("previewContent", sm8Var3, null, ey3Var, ey3Var, listR);
        sm8 sm8Var4 = ImageMetadata.type;
        sm8Var4.getClass();
        nx1 nx1Var18 = new nx1("previewImage", sm8Var4, null, ey3Var, ey3Var, listR2);
        GraphQLFloat.INSTANCE.getClass();
        zl2 zl2Var6 = GraphQLFloat.type;
        zl2Var6.getClass();
        nx1 nx1Var19 = new nx1("readingTime", zl2Var6, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var20 = new nx1("pinnedByCreatorAt", ka1.f(Long.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var7 = Long.type;
        zl2Var7.getClass();
        nx1 nx1Var21 = new nx1("firstPublishedAt", zl2Var7, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var8 = Long.type;
        zl2Var8.getClass();
        nx1 nx1Var22 = new nx1("updatedAt", zl2Var8, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var23 = new nx1("latestPublishedVersion", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var24 = new nx1("collection", ka1.l(Collection.INSTANCE), null, ey3Var, ey3Var, listR5);
        nx1 nx1Var25 = new nx1("creator", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR8);
        List listQ7 = d46.Q("Post");
        List<sx1> list7 = PostClapsDataSelections.INSTANCE.get__root();
        ox1 ox1VarC4 = y30.c(list7, "Post", listQ7, list7);
        List listQ8 = d46.Q("Post");
        List<sx1> list8 = ResponseCountDataSelections.INSTANCE.get__root();
        ox1 ox1VarC5 = y30.c(list8, "Post", listQ8, list8);
        List listQ9 = d46.Q("Post");
        List<sx1> list9 = PostVisibilityDataSelections.INSTANCE.get__root();
        ox1 ox1VarC6 = y30.c(list9, "Post", listQ9, list9);
        List listQ10 = d46.Q("Post");
        List<sx1> list10 = PostShareDataSelections.INSTANCE.get__root();
        ox1 ox1VarC7 = y30.c(list10, "Post", listQ10, list10);
        List listQ11 = d46.Q("Post");
        List<sx1> list11 = PostFeaturingStatusDataSelections.INSTANCE.get__root();
        ox1 ox1VarC8 = y30.c(list11, "Post", listQ11, list11);
        List listQ12 = d46.Q("Post");
        List<sx1> list12 = PostViewStateDataSelections.INSTANCE.get__root();
        ox1 ox1VarC9 = y30.c(list12, "Post", listQ12, list12);
        List listQ13 = d46.Q("Post");
        List<sx1> list13 = PostRepostCountDataSelections.INSTANCE.get__root();
        __root = d46.R(nx1Var14, nx1Var15, nx1Var16, nx1Var17, nx1Var18, nx1Var19, nx1Var20, nx1Var21, nx1Var22, nx1Var23, nx1Var24, nx1Var25, ox1VarC4, ox1VarC5, ox1VarC6, ox1VarC7, ox1VarC8, ox1VarC9, y30.c(list13, "Post", listQ13, list13));
    }
}
