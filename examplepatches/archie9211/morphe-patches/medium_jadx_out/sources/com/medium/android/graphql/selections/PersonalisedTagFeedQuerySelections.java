package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.PagingParamsDataSelections;
import com.medium.android.graphql.fragment.selections.TopicFeedItemDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.PersonalisedTagFeedResult;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.TagFeedItem;
import defpackage.b09;
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
import defpackage.sx1;
import defpackage.tx1;
import defpackage.y30;
import defpackage.yv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001d\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0007\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/graphql/selections/PersonalisedTagFeedQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__items", "Ljava/util/List;", "__next", "__pagingInfo", "__personalisedTagFeed", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PersonalisedTagFeedQuerySelections {
    public static final PersonalisedTagFeedQuerySelections INSTANCE = new PersonalisedTagFeedQuerySelections();
    private static final List<sx1> __items;
    private static final List<sx1> __next;
    private static final List<sx1> __pagingInfo;
    private static final List<sx1> __personalisedTagFeed;
    private static final List<sx1> __root;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("TagFeedItem");
        List<sx1> list = TopicFeedItemDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "TagFeedItem", listQ, list));
        __items = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("PageParams");
        List<sx1> list2 = PagingParamsDataSelections.INSTANCE.get__root();
        List<sx1> listR2 = d46.R(nx1Var2, y30.c(list2, "PageParams", listQ2, list2));
        __next = listR2;
        List<sx1> listR3 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("next", b09.u(PageParams.INSTANCE), null, ey3Var, ey3Var, listR2));
        __pagingInfo = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        TagFeedItem.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var3, new nx1("items", new rx1(new px1(kyd.b(TagFeedItem.type))), null, ey3Var, ey3Var, listR), new nx1("pagingInfo", km4.v(Paging.INSTANCE), null, ey3Var, ey3Var, listR3));
        __personalisedTagFeed = listR4;
        PersonalisedTagFeedResult.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(PersonalisedTagFeedResult.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__personalisedTagFeed_paging;
        mx1Var.getClass();
        lx1 lx1Var = new lx1(mx1Var, new yv8(new tx1("paging")));
        mx1 mx1Var2 = Query.__personalisedTagFeed_skipCache;
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "skipCache")));
        mx1 mx1Var3 = Query.__personalisedTagFeed_tagSlug;
        __root = d46.Q(new nx1("personalisedTagFeed", rx1VarB, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var3, new yv8(ka1.d(mx1Var3, "tagSlug")))), listR4));
    }

    private PersonalisedTagFeedQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
