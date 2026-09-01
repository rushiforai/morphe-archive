package com.medium.android.graphql.fragment.selections;

import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.NewsletterV3;
import com.medium.android.graphql.type.Tag;
import com.medium.android.graphql.type.User;
import defpackage.d46;
import defpackage.ey3;
import defpackage.kyd;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010\u0007\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/fragment/selections/DraftDataSelections;", "", "<init>", "()V", "", "Lsx1;", "__newsletterV3", "Ljava/util/List;", "__creator", "__tags", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DraftDataSelections {
    public static final DraftDataSelections INSTANCE = new DraftDataSelections();
    private static final List<sx1> __creator;
    private static final List<sx1> __newsletterV3;
    private static final List<sx1> __root;
    private static final List<sx1> __tags;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var), new nx1("subscribersCount", y30.h(GraphQLInt.INSTANCE), null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __newsletterV3 = listR;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        nx1 nx1Var4 = new nx1("imageId", zl2Var2, null, ey3Var, ey3Var, ey3Var);
        NewsletterV3.INSTANCE.getClass();
        sm8 sm8Var = NewsletterV3.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var, nx1Var2, nx1Var3, nx1Var4, new nx1("newsletterV3", sm8Var, null, ey3Var, ey3Var, listR));
        __creator = listR2;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Tag");
        List<sx1> list = TagDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var5, y30.c(list, "Tag", listQ, list), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __tags = listR3;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var7 = new nx1("creator", y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR2);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        nx1 nx1Var8 = new nx1("title", zl2Var3, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var4 = GraphQLString.type;
        zl2Var4.getClass();
        nx1 nx1Var9 = new nx1("featuredImageId", zl2Var4, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var5 = GraphQLString.type;
        zl2Var5.getClass();
        nx1 nx1Var10 = new nx1("subtitle", zl2Var5, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var11 = new nx1("curationEligible", y30.d(GraphQLBoolean.INSTANCE), null, ey3Var, ey3Var, ey3Var);
        Tag.INSTANCE.getClass();
        __root = d46.R(nx1Var6, nx1Var7, nx1Var8, nx1Var9, nx1Var10, nx1Var11, new nx1("tags", new rx1(new px1(kyd.b(Tag.type))), null, ey3Var, ey3Var, listR3), new nx1("imageIds", new rx1(new px1(kyd.b(GraphQLString.type))), null, ey3Var, ey3Var, ey3Var));
    }

    private DraftDataSelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
