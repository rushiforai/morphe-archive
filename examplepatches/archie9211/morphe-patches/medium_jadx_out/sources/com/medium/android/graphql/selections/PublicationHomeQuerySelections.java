package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PublicationSectionsSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.PublicationPage;
import com.medium.android.graphql.type.Query;
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
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0007\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/selections/PublicationHomeQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__homepage", "Ljava/util/List;", "__publication", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationHomeQuerySelections {
    public static final PublicationHomeQuerySelections INSTANCE = new PublicationHomeQuerySelections();
    private static final List<sx1> __homepage;
    private static final List<sx1> __publication;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("PublicationPage");
        List<sx1> list = PublicationSectionsSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "PublicationPage", listQ, list));
        __homepage = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        nx1 nx1Var3 = new nx1("name", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        PublicationPage.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, nx1Var3, new nx1("homepage", kyd.b(PublicationPage.type), null, ey3Var, ey3Var, listR), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publication = listR2;
        Publication.INSTANCE.getClass();
        sm8 sm8Var = Publication.type;
        sm8Var.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__publication_id;
        mx1Var.getClass();
        __root = d46.Q(new nx1("publication", sm8Var, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("publicationId"))), listR2));
    }

    private PublicationHomeQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
