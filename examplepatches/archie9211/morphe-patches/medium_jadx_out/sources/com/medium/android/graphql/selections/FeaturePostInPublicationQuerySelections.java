package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.Collection;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import com.medium.android.graphql.type.VerifiedInfo;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/selections/FeaturePostInPublicationQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__verifications", "Ljava/util/List;", "__creator", "__avatar", "__collection", "__publicationsFeaturingPost", "__post", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FeaturePostInPublicationQuerySelections {
    public static final FeaturePostInPublicationQuerySelections INSTANCE = new FeaturePostInPublicationQuerySelections();
    private static final List<sx1> __avatar;
    private static final List<sx1> __collection;
    private static final List<sx1> __creator;
    private static final List<sx1> __post;
    private static final List<sx1> __publicationsFeaturingPost;
    private static final List<sx1> __root;
    private static final List<sx1> __verifications;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("isBookAuthor", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __verifications = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        VerifiedInfo.INSTANCE.getClass();
        sm8 sm8Var = VerifiedInfo.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var, nx1Var2, nx1Var3, new nx1("verifications", sm8Var, null, ey3Var, ey3Var, listR));
        __creator = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __avatar = listR3;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var6 = new nx1("name", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var2 = ImageMetadata.type;
        sm8Var2.getClass();
        List<sx1> listR4 = d46.R(nx1Var4, nx1Var5, nx1Var6, new nx1("avatar", sm8Var2, null, ey3Var, ey3Var, listR3));
        __collection = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publicationsFeaturingPost = listR5;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var8 = new nx1("title", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var9 = new nx1("creator", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR2);
        nx1 nx1Var10 = new nx1("collection", ka1.l(Collection.INSTANCE), null, ey3Var, ey3Var, listR4);
        Publication.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var7, nx1Var8, nx1Var9, nx1Var10, new nx1("publicationsFeaturingPost", new rx1(new px1(kyd.b(Publication.type))), null, ey3Var, ey3Var, listR5), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR6;
        sm8 sm8VarM = ka1.m(Post.INSTANCE);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__post_id;
        mx1Var.getClass();
        __root = d46.Q(new nx1("post", sm8VarM, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("postId"))), listR6));
    }

    private FeaturePostInPublicationQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
