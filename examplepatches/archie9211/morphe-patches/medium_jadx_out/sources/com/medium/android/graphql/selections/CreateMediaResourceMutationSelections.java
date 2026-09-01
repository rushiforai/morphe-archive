package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MediaResource;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.PreviewContent;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001d\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\f\u0010\u0007\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/selections/CreateMediaResourceMutationSelections;", "", "<init>", "()V", "", "Lsx1;", "__previewContent", "Ljava/util/List;", "__mediumPost", "__mediumCatalog", "__onMediaResource", "__createMediaResource", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreateMediaResourceMutationSelections {
    public static final CreateMediaResourceMutationSelections INSTANCE = new CreateMediaResourceMutationSelections();
    private static final List<sx1> __createMediaResource;
    private static final List<sx1> __mediumCatalog;
    private static final List<sx1> __mediumPost;
    private static final List<sx1> __onMediaResource;
    private static final List<sx1> __previewContent;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR = d46.R(nx1Var, new nx1("subtitle", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __previewContent = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PreviewContent.INSTANCE.getClass();
        sm8 sm8Var = PreviewContent.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, nx1Var3, new nx1("previewContent", sm8Var, null, ey3Var, ey3Var, listR));
        __mediumPost = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listR3 = d46.R(nx1Var4, nx1Var5, new nx1("description", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __mediumCatalog = listR3;
        nx1 nx1Var6 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var7 = new nx1("iframeSrc", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var8 = new nx1("iframeWidth", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLInt.type;
        zl2Var4.getClass();
        nx1 nx1Var9 = new nx1("iframeHeight", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        nx1 nx1Var10 = new nx1("thumbnailUrl", zl2Var5, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var6 = GraphQLString.type;
        zl2Var6.getClass();
        nx1 nx1Var11 = new nx1("thumbnailImageId", zl2Var6, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var7 = GraphQLString.type;
        zl2Var7.getClass();
        nx1 nx1Var12 = new nx1("title", zl2Var7, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var8 = GraphQLString.type;
        zl2Var8.getClass();
        nx1 nx1Var13 = new nx1("description", zl2Var8, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var14 = new nx1("mediumPost", ka1.m(Post.INSTANCE), null, ey3Var, ey3Var, listR2);
        Catalog.INSTANCE.getClass();
        sm8 sm8Var2 = Catalog.type;
        sm8Var2.getClass();
        List<sx1> listR4 = d46.R(nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, nx1Var11, nx1Var12, nx1Var13, nx1Var14, new nx1("mediumCatalog", sm8Var2, null, ey3Var, ey3Var, listR3));
        __onMediaResource = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("MediaResource", d46.Q("MediaResource"), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __createMediaResource = listR5;
        MediaResource.INSTANCE.getClass();
        sm8 sm8Var3 = MediaResource.type;
        sm8Var3.getClass();
        Mutation.INSTANCE.getClass();
        mx1 mx1Var = Mutation.__createMediaResource_url;
        mx1Var.getClass();
        __root = d46.Q(new nx1("createMediaResource", sm8Var3, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("url"))), listR5));
    }

    private CreateMediaResourceMutationSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
