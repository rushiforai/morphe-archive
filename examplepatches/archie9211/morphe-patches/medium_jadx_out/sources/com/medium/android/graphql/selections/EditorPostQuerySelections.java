package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CatalogPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.HighlightDataSelections;
import com.medium.android.graphql.fragment.selections.PostClapsDataSelections;
import com.medium.android.graphql.type.CatalogResult;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MediaResource;
import com.medium.android.graphql.type.PostResult;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.Quote;
import com.medium.android.graphql.type.User;
import defpackage.b1e;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000e\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001d\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u0007\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/selections/EditorPostQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__creator", "Ljava/util/List;", "__onPost1", "__inResponseToPostResult", "__mediumQuote", "__inResponseToMediaResource", "__onCatalog", "__inResponseToCatalogResult", "__onPost", "__postResult", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class EditorPostQuerySelections {
    public static final EditorPostQuerySelections INSTANCE = new EditorPostQuerySelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __inResponseToCatalogResult;
    private static final List<sx1> __inResponseToMediaResource;
    private static final List<sx1> __inResponseToPostResult;
    private static final List<sx1> __mediumQuote;
    private static final List<sx1> __onCatalog;
    private static final List<sx1> __onPost;
    private static final List<sx1> __onPost1;
    private static final List<sx1> __postResult;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __creator = listR;
        nx1 nx1Var3 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var4 = new nx1("title", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("responsesCount", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = PostClapsDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var3, nx1Var4, nx1Var5, y30.c(list, "Post", listQ, list), new nx1("creator", ka1.n(User.INSTANCE), null, ey3Var, ey3Var, listR));
        __onPost1 = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Post", d46.Q("Post"), listR2));
        __inResponseToPostResult = listR3;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Quote");
        List<sx1> list2 = HighlightDataSelections.INSTANCE.get__root();
        List<sx1> listR4 = d46.R(nx1Var6, y30.c(list2, "Quote", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __mediumQuote = listR4;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Quote.INSTANCE.getClass();
        sm8 sm8Var = Quote.type;
        sm8Var.getClass();
        List<sx1> listR5 = d46.R(nx1Var7, new nx1("mediumQuote", sm8Var, null, ey3Var, ey3Var, listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __inResponseToMediaResource = listR5;
        List listQ3 = d46.Q("Catalog");
        List<sx1> list3 = CatalogPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR6 = d46.R(y30.c(list3, "Catalog", listQ3, list3), new nx1("id", y30.e(GraphQLID.INSTANCE), null, ey3Var, ey3Var, ey3Var));
        __onCatalog = listR6;
        List<sx1> listR7 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Catalog", d46.Q("Catalog"), listR6));
        __inResponseToCatalogResult = listR7;
        PostResult.INSTANCE.getClass();
        b1e b1eVar = PostResult.type;
        b1eVar.getClass();
        nx1 nx1Var8 = new nx1("inResponseToPostResult", b1eVar, null, ey3Var, ey3Var, listR3);
        MediaResource.INSTANCE.getClass();
        sm8 sm8Var2 = MediaResource.type;
        sm8Var2.getClass();
        nx1 nx1Var9 = new nx1("inResponseToMediaResource", sm8Var2, null, ey3Var, ey3Var, listR5);
        CatalogResult.INSTANCE.getClass();
        b1e b1eVar2 = CatalogResult.type;
        b1eVar2.getClass();
        List<sx1> listR8 = d46.R(nx1Var8, nx1Var9, new nx1("inResponseToCatalogResult", b1eVar2, null, ey3Var, ey3Var, listR7), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onPost = listR8;
        List<sx1> listR9 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Post", d46.Q("Post"), listR8));
        __postResult = listR9;
        b1e b1eVar3 = PostResult.type;
        b1eVar3.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__postResult_id;
        mx1Var.getClass();
        __root = d46.Q(new nx1("postResult", b1eVar3, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("postId"))), listR9));
    }

    private EditorPostQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
