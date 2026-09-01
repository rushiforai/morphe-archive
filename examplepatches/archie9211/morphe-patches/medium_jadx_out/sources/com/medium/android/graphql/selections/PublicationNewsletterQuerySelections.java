package com.medium.android.graphql.selections;

import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.NewsletterV3;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.User;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.mx1;
import defpackage.nx1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001d\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010\u0007\u001a\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/selections/PublicationNewsletterQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__newsletter", "Ljava/util/List;", "__publication", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationNewsletterQuerySelections {
    public static final PublicationNewsletterQuerySelections INSTANCE = new PublicationNewsletterQuerySelections();
    private static final List<sx1> __newsletter;
    private static final List<sx1> __publication;
    private static final List<sx1> __root;
    private static final List<sx1> __user;

    private PublicationNewsletterQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var2 = new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        nx1 nx1Var3 = new nx1("name", zl2Var, null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var2 = GraphQLString.type;
        zl2Var2.getClass();
        List<sx1> listR = d46.R(nx1Var, nx1Var2, nx1Var3, new nx1("description", zl2Var2, null, ey3Var, ey3Var, ey3Var));
        __newsletter = listR;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var5 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        NewsletterV3.INSTANCE.getClass();
        sm8 sm8Var = NewsletterV3.type;
        sm8Var.getClass();
        List<sx1> listR2 = d46.R(nx1Var4, nx1Var5, new nx1("newsletter", sm8Var, null, ey3Var, ey3Var, listR), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publication = listR2;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        zl2 zl2Var3 = GraphQLString.type;
        zl2Var3.getClass();
        List<sx1> listR3 = d46.R(nx1Var6, new nx1("email", zl2Var3, null, ey3Var, ey3Var, ey3Var), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR3;
        Publication.INSTANCE.getClass();
        sm8 sm8Var2 = Publication.type;
        sm8Var2.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__publication_id;
        mx1Var.getClass();
        nx1 nx1Var7 = new nx1("publication", sm8Var2, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("publicationId"))), listR2);
        sm8 sm8VarN = ka1.n(User.INSTANCE);
        mx1 mx1Var2 = Query.__user_id;
        __root = d46.R(nx1Var7, new nx1("user", sm8VarN, null, ey3Var, ka1.y(mx1Var2, new yv8(ka1.d(mx1Var2, mgKMENwrbHf.XJMWPljqOyaIOWU))), listR3));
    }
}
