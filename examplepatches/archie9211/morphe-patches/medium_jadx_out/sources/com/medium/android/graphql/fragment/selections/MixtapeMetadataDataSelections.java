package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MediaResource;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/MixtapeMetadataDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__mediumCatalog", "Ljava/util/List;", "__mediaResource", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MixtapeMetadataDataSelections {
    public static final MixtapeMetadataDataSelections INSTANCE = new MixtapeMetadataDataSelections();
    private static final List<sx1> __mediaResource;
    private static final List<sx1> __mediumCatalog;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Catalog");
        List<sx1> list = CatalogPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Catalog", listQ, list), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __mediumCatalog = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Catalog.INSTANCE.getClass();
        sm8 sm8Var = Catalog.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, new nx1("mediumCatalog", sm8Var, null, ey3Var, ey3Var, listR), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __mediaResource = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var4 = new nx1("mediaResourceId", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var5 = new nx1("href", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var6 = new nx1("thumbnailImageId", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        MediaResource.INSTANCE.getClass();
        sm8 sm8Var2 = MediaResource.type;
        sm8Var2.getClass();
        __root = d46.R(nx1Var3, nx1Var4, nx1Var5, nx1Var6, new nx1("mediaResource", sm8Var2, null, ey3Var, ey3Var, listR2));
    }

    private MixtapeMetadataDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
