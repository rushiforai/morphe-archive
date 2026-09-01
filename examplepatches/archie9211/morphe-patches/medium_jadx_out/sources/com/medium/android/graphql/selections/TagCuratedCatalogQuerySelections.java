package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CatalogItemPostDataSelections;
import com.medium.android.graphql.fragment.selections.CatalogItemUserDataSelections;
import com.medium.android.graphql.type.Catalog;
import com.medium.android.graphql.type.CatalogEntity;
import com.medium.android.graphql.type.CatalogItemV2;
import com.medium.android.graphql.type.CatalogItemsConnection;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.Tag;
import com.medium.android.graphql.type.TagCatalogConnection;
import com.medium.android.graphql.type.TagCatalogEdge;
import com.medium.android.graphql.type.User;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.n04;
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
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/selections/TagCuratedCatalogQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__creator", "Ljava/util/List;", "__entity", "__items", "__itemsConnection", "__node", "__edges", "__curatedLists", "__tagFromSlug", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class TagCuratedCatalogQuerySelections {
    public static final TagCuratedCatalogQuerySelections INSTANCE = new TagCuratedCatalogQuerySelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __curatedLists;
    private static final List<sx1> __edges;
    private static final List<sx1> __entity;
    private static final List<sx1> __items;
    private static final List<sx1> __itemsConnection;
    private static final List<sx1> __node;
    private static final List<sx1> __root;
    private static final List<sx1> __tagFromSlug;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __creator = listR;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = CatalogItemPostDataSelections.INSTANCE.get__root();
        ox1 ox1VarC = y30.c(list, "Post", listQ, list);
        List listQ2 = d46.Q("User");
        List<sx1> list2 = CatalogItemUserDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var3, ox1VarC, y30.c(list2, "User", listQ2, list2));
        __entity = listR2;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogEntity.INSTANCE.getClass();
        b1e b1eVar = CatalogEntity.type;
        b1eVar.getClass();
        List<sx1> listR3 = d46.R(nx1Var4, new nx1("entity", b1eVar, null, ey3Var, ey3Var, listR2), new nx1("catalogItemId", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __items = listR3;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        CatalogItemV2.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var5, new nx1("items", new rx1(new px1(kyd.b(CatalogItemV2.type))), null, ey3Var, ey3Var, listR3));
        __itemsConnection = listR4;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var8 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PredefinedCatalogType.INSTANCE.getClass();
        n04 n04Var = PredefinedCatalogType.type;
        n04Var.getClass();
        nx1 nx1Var9 = new nx1("predefined", n04Var, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var10 = new nx1("creator", y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR);
        CatalogItemsConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(CatalogItemsConnection.type);
        Catalog.INSTANCE.getClass();
        mx1 mx1Var = Catalog.__itemsConnection_pagingOptions;
        mx1Var.getClass();
        Map mapSingletonMap = Collections.singletonMap("limit", 3);
        mapSingletonMap.getClass();
        List<sx1> listR5 = d46.R(nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, new nx1("itemsConnection", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(mapSingletonMap)), listR4));
        __node = listR5;
        List<sx1> listR6 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", kyd.b(Catalog.type), null, ey3Var, ey3Var, listR5));
        __edges = listR6;
        nx1 nx1Var11 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        TagCatalogEdge.INSTANCE.getClass();
        List<sx1> listR7 = d46.R(nx1Var11, new nx1("edges", new rx1(new px1(kyd.b(TagCatalogEdge.type))), null, ey3Var, ey3Var, listR6));
        __curatedLists = listR7;
        nx1 nx1Var12 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        TagCatalogConnection.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(TagCatalogConnection.type);
        Tag.INSTANCE.getClass();
        mx1 mx1Var2 = Tag.__curatedLists_first;
        mx1Var2.getClass();
        List<sx1> listR8 = d46.R(nx1Var12, new nx1("curatedLists", rx1VarB2, null, ey3Var, ka1.y(mx1Var2, new yv8(1)), listR7), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __tagFromSlug = listR8;
        sm8 sm8Var = Tag.type;
        sm8Var.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var3 = Query.__tagFromSlug_tagSlug;
        mx1Var3.getClass();
        __root = d46.Q(new nx1("tagFromSlug", sm8Var, null, ey3Var, ka1.y(mx1Var3, new yv8(new tx1("tagSlug"))), listR8));
    }

    private TagCuratedCatalogQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
