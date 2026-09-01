package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.HighlightDataSelections;
import com.medium.android.graphql.fragment.selections.PagingParamsDataSelections;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.Quote;
import com.medium.android.graphql.type.StreamConnection;
import com.medium.android.graphql.type.StreamItem;
import com.medium.android.graphql.type.StreamItemType;
import com.medium.android.graphql.type.User;
import defpackage.b09;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.km4;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.mx1;
import defpackage.nx1;
import defpackage.ox1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001d\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0007\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/selections/UserPostHighlightsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__quote", "Ljava/util/List;", "__onStreamItemQuotePreview", "__itemType", "__stream", "__next", "__pagingInfo", "__highlightsStreamConnection", "__user", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserPostHighlightsQuerySelections {
    public static final UserPostHighlightsQuerySelections INSTANCE = new UserPostHighlightsQuerySelections();
    private static final List<sx1> __highlightsStreamConnection;
    private static final List<sx1> __itemType;
    private static final List<sx1> __next;
    private static final List<sx1> __onStreamItemQuotePreview;
    private static final List<sx1> __pagingInfo;
    private static final List<sx1> __quote;
    private static final List<sx1> __root;
    private static final List<sx1> __stream;
    private static final List<sx1> __user;

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Quote");
        List<sx1> list = HighlightDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Quote", listQ, list), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __quote = listR;
        Quote.INSTANCE.getClass();
        sm8 sm8Var = Quote.type;
        sm8Var.getClass();
        List<sx1> listQ2 = d46.Q(new nx1("quote", sm8Var, null, ey3Var, ey3Var, listR));
        __onStreamItemQuotePreview = listQ2;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("StreamItemQuotePreview", d46.Q("StreamItemQuotePreview"), listQ2));
        __itemType = listR2;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        StreamItemType.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var2, new nx1("itemType", kyd.b(StreamItemType.type), null, ey3Var, ey3Var, listR2));
        __stream = listR3;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("PageParams");
        List<sx1> list2 = PagingParamsDataSelections.INSTANCE.get__root();
        List<sx1> listR4 = d46.R(nx1Var3, y30.c(list2, "PageParams", listQ3, list2));
        __next = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("next", b09.u(PageParams.INSTANCE), null, ey3Var, ey3Var, listR4));
        __pagingInfo = listR5;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        StreamItem.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var4, new nx1("stream", new rx1(new px1(kyd.b(StreamItem.type))), null, ey3Var, ey3Var, listR3), new nx1("pagingInfo", km4.v(Paging.INSTANCE), null, ey3Var, ey3Var, listR5));
        __highlightsStreamConnection = listR6;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        StreamConnection.INSTANCE.getClass();
        sm8 sm8Var2 = StreamConnection.type;
        sm8Var2.getClass();
        User.INSTANCE.getClass();
        mx1 mx1Var = User.__highlightsStreamConnection_paging;
        mx1Var.getClass();
        List<sx1> listR7 = d46.R(nx1Var5, new nx1("highlightsStreamConnection", sm8Var2, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("paging"))), listR6), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __user = listR7;
        sm8 sm8Var3 = User.type;
        sm8Var3.getClass();
        __root = d46.Q(new nx1("user", sm8Var3, null, ey3Var, ka1.y(lv8.j(Query.INSTANCE), new yv8(new tx1("userId"))), listR7));
    }

    private UserPostHighlightsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
