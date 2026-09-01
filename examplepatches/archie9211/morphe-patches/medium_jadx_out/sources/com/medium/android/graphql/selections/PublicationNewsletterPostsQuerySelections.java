package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PageInfoDataSelections;
import com.medium.android.graphql.fragment.selections.PostPreviewDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.NewsletterV3;
import com.medium.android.graphql.type.NewsletterV3PostConnection;
import com.medium.android.graphql.type.NewsletterV3PostEdge;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.Publication;
import com.medium.android.graphql.type.Query;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lx1;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.px1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0007\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/selections/PublicationNewsletterPostsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__node", "Ljava/util/List;", "__edges", "__pageInfo", "__postsConnection", "__newsletter", "__publication", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationNewsletterPostsQuerySelections {
    public static final PublicationNewsletterPostsQuerySelections INSTANCE = new PublicationNewsletterPostsQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __newsletter;
    private static final List<sx1> __node;
    private static final List<sx1> __pageInfo;
    private static final List<sx1> __postsConnection;
    private static final List<sx1> __publication;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Post");
        List<sx1> list = PostPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Post", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", ka1.m(Post.INSTANCE), null, ey3Var, ey3Var, listR));
        __edges = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("PageInfoV2");
        List<sx1> list2 = PageInfoDataSelections.INSTANCE.get__root();
        List<sx1> listR3 = d46.R(nx1Var2, y30.c(list2, "PageInfoV2", listQ2, list2));
        __pageInfo = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        NewsletterV3PostEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, new nx1("edges", new px1(kyd.b(NewsletterV3PostEdge.type)), null, ey3Var, ey3Var, listR2), new nx1("pageInfo", km4.r(PageInfoV2.INSTANCE), null, ey3Var, ey3Var, listR3));
        __postsConnection = listR4;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        NewsletterV3PostConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(NewsletterV3PostConnection.type);
        NewsletterV3.INSTANCE.getClass();
        mx1 mx1Var = NewsletterV3.__postsConnection_after;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("after")));
        mx1 mx1Var2 = NewsletterV3.__postsConnection_first;
        List<sx1> listR5 = d46.R(nx1Var4, new nx1("postsConnection", rx1VarB, null, ey3Var, d46.R(lx1Var, new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "first")))), listR4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __newsletter = listR5;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var = NewsletterV3.type;
        sm8Var.getClass();
        List<sx1> listR6 = d46.R(nx1Var5, new nx1("newsletter", sm8Var, null, ey3Var, ey3Var, listR5), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __publication = listR6;
        Publication.INSTANCE.getClass();
        sm8 sm8Var2 = Publication.type;
        sm8Var2.getClass();
        Query.INSTANCE.getClass();
        mx1 mx1Var3 = Query.__publication_id;
        mx1Var3.getClass();
        __root = d46.Q(new nx1("publication", sm8Var2, null, ey3Var, ka1.y(mx1Var3, new yv8(new tx1("publicationId"))), listR6));
    }

    private PublicationNewsletterPostsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
