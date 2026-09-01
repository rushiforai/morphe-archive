package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.CatalogEntity;
import com.medium.android.graphql.type.CatalogItemV2;
import com.medium.android.graphql.type.CatalogItemsConnection;
import com.medium.android.graphql.type.CatalogPagingResult;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.ImageMetadata;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
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
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/CatalogPreviewDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__previewImage", "Ljava/util/List;", "__onPost", "__entity", "__items", "__paging", "__itemsConnection", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogPreviewDataSelections {
    public static final CatalogPreviewDataSelections INSTANCE = new CatalogPreviewDataSelections();
    private static final List<sx1> __entity;
    private static final List<sx1> __items;
    private static final List<sx1> __itemsConnection;
    private static final List<sx1> __onPost;
    private static final List<sx1> __paging;
    private static final List<sx1> __previewImage;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("ImageMetadata");
        List<sx1> list = ImageMetadataDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "ImageMetadata", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __previewImage = listR;
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        ImageMetadata.INSTANCE.getClass();
        sm8 sm8Var = ImageMetadata.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, new nx1("previewImage", sm8Var, null, ey3Var, ey3Var, listR));
        __onPost = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        ox1 ox1Var = new ox1("Post", d46.Q("Post"), listR2);
        List listQ2 = d46.Q("User");
        List<sx1> list2 = CatalogItemUserDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var3, ox1Var, y30.c(list2, "User", listQ2, list2));
        __entity = listR3;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("catalogItemId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogEntity.INSTANCE.getClass();
        b1e b1eVar = CatalogEntity.type;
        b1eVar.getClass();
        List<sx1> listR4 = d46.R(nx1Var4, nx1Var5, new nx1("entity", b1eVar, null, ey3Var, ey3Var, listR3));
        __items = listR4;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        GraphQLInt.INSTANCE.getClass();
        List<sx1> listR5 = d46.R(nx1Var6, new nx1("count", kyd.b(GraphQLInt.type), null, ey3Var, ey3Var, ey3Var));
        __paging = listR5;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogItemV2.INSTANCE.getClass();
        nx1 nx1Var8 = new nx1("items", new rx1(new px1(kyd.b(CatalogItemV2.type))), null, ey3Var, ey3Var, listR4);
        CatalogPagingResult.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var7, nx1Var8, new nx1("paging", kyd.b(CatalogPagingResult.type), null, ey3Var, ey3Var, listR5));
        __itemsConnection = listR6;
        nx1 nx1Var9 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Catalog");
        List<sx1> list3 = CatalogSummaryDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list3, "Catalog", listQ3, list3);
        nx1 nx1Var10 = new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        CatalogItemsConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CatalogItemsConnection.type);
        Catalog.INSTANCE.getClass();
        mx1 mx1Var = Catalog.__itemsConnection_pagingOptions;
        mx1Var.getClass();
        Map mapSingletonMap = Collections.singletonMap("limit", 10);
        mapSingletonMap.getClass();
        __root = d46.R(nx1Var9, ox1VarC, nx1Var10, new nx1("itemsConnection", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(mapSingletonMap)), listR6));
    }

    private CatalogPreviewDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
