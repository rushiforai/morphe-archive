package com.medium.android.graphql.selections;

import com.medium.android.graphql.fragment.selections.CollectionPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.CreatorPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.TagDataSelections;
import com.medium.android.graphql.type.ContactsEdge;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.MatchedContactsResult;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RecommendedPublishersConnection;
import com.medium.android.graphql.type.RecommendedPublishersConnectionEdge;
import com.medium.android.graphql.type.RecommendedPublishersConnectionEdgeNode;
import com.medium.android.graphql.type.RecommendedTagEdge;
import com.medium.android.graphql.type.RecommendedTagsConnection;
import com.medium.android.graphql.type.Tag;
import com.medium.android.graphql.type.User;
import defpackage.b1e;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
import defpackage.kyd;
import defpackage.lx1;
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
import defpackage.zl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0016\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0007R\u001a\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\u0007R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010\u0007R\u001a\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010\u0007R\u001a\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010\u0007R\u001a\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010\u0007R\u001a\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010\u0007R\u001d\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0018\u0010\u0007\u001a\u0004\b\u0019\u0010\u001a¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/selections/AllSuggestionsQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__onUser", "Ljava/util/List;", "__node", "__edges", "__recommendedPublishers", "__onCollection", "__node1", "__edges1", "__recommendedPublishers1", "__node2", "__edges2", "__recommendedTags", "__node3", "__edges3", "__onMatchedContactsConnection", "__onUnauthorized", "__matchedContactsConnection", "__viewer", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AllSuggestionsQuerySelections {
    public static final AllSuggestionsQuerySelections INSTANCE = new AllSuggestionsQuerySelections();
    private static final List<sx1> __edges;
    private static final List<sx1> __edges1;
    private static final List<sx1> __edges2;
    private static final List<sx1> __edges3;
    private static final List<sx1> __matchedContactsConnection;
    private static final List<sx1> __node;
    private static final List<sx1> __node1;
    private static final List<sx1> __node2;
    private static final List<sx1> __node3;
    private static final List<sx1> __onCollection;
    private static final List<sx1> __onMatchedContactsConnection;
    private static final List<sx1> __onUnauthorized;
    private static final List<sx1> __onUser;
    private static final List<sx1> __recommendedPublishers;
    private static final List<sx1> __recommendedPublishers1;
    private static final List<sx1> __recommendedTags;
    private static final List<sx1> __root;
    private static final List<sx1> __viewer;

    static {
        List listQ = d46.Q("User");
        CreatorPreviewDataSelections creatorPreviewDataSelections = CreatorPreviewDataSelections.INSTANCE;
        List<sx1> list = creatorPreviewDataSelections.get__root();
        ox1 ox1VarC = y30.c(list, "User", listQ, list);
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        List<sx1> listR = d46.R(ox1VarC, new nx1("id", rx1VarF, null, ey3Var, ey3Var, ey3Var));
        __onUser = listR;
        List<sx1> listR2 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("User", d46.Q("User"), listR));
        __node = listR2;
        nx1 nx1Var = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedPublishersConnectionEdgeNode.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var, new nx1("node", kyd.b(RecommendedPublishersConnectionEdgeNode.type), null, ey3Var, ey3Var, listR2));
        __edges = listR3;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedPublishersConnectionEdge.INSTANCE.getClass();
        List<sx1> listR4 = d46.R(nx1Var2, new nx1("edges", new rx1(new px1(kyd.b(RecommendedPublishersConnectionEdge.type))), null, ey3Var, ey3Var, listR3));
        __recommendedPublishers = listR4;
        List listQ2 = d46.Q("Collection");
        List<sx1> list2 = CollectionPreviewDataSelections.INSTANCE.get__root();
        List<sx1> listR5 = d46.R(y30.c(list2, "Collection", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __onCollection = listR5;
        List<sx1> listR6 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("Collection", d46.Q("Collection"), listR5));
        __node1 = listR6;
        List<sx1> listR7 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", kyd.b(RecommendedPublishersConnectionEdgeNode.type), null, ey3Var, ey3Var, listR6));
        __edges1 = listR7;
        List<sx1> listR8 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("edges", new rx1(new px1(kyd.b(RecommendedPublishersConnectionEdge.type))), null, ey3Var, ey3Var, listR7));
        __recommendedPublishers1 = listR8;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Tag");
        List<sx1> list3 = TagDataSelections.INSTANCE.get__root();
        List<sx1> listR9 = d46.R(nx1Var3, y30.c(list3, "Tag", listQ3, list3), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node2 = listR9;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Tag.INSTANCE.getClass();
        List<sx1> listR10 = d46.R(nx1Var4, new nx1("node", kyd.b(Tag.type), null, ey3Var, ey3Var, listR9));
        __edges2 = listR10;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedTagEdge.INSTANCE.getClass();
        List<sx1> listR11 = d46.R(nx1Var5, new nx1("edges", new rx1(new px1(kyd.b(RecommendedTagEdge.type))), null, ey3Var, ey3Var, listR10));
        __recommendedTags = listR11;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ4 = d46.Q("User");
        List<sx1> list4 = creatorPreviewDataSelections.get__root();
        List<sx1> listR12 = d46.R(nx1Var6, y30.c(list4, "User", listQ4, list4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node3 = listR12;
        List<sx1> listR13 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("node", y30.g(User.INSTANCE), null, ey3Var, ey3Var, listR12));
        __edges3 = listR13;
        ContactsEdge.INSTANCE.getClass();
        List<sx1> listQ5 = d46.Q(new nx1("edges", new rx1(new px1(kyd.b(ContactsEdge.type))), null, ey3Var, ey3Var, listR13));
        __onMatchedContactsConnection = listQ5;
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        List<sx1> listQ6 = d46.Q(new nx1("message", zl2Var, null, ey3Var, ey3Var, ey3Var));
        __onUnauthorized = listQ6;
        List<sx1> listR14 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new ox1("MatchedContactsConnection", d46.Q("MatchedContactsConnection"), listQ5), new ox1("Unauthorized", d46.Q("Unauthorized"), listQ6));
        __matchedContactsConnection = listR14;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        MatchedContactsResult.INSTANCE.getClass();
        b1e b1eVar = MatchedContactsResult.type;
        b1eVar.getClass();
        mx1 mx1Var = User.__matchedContactsConnection_after;
        lx1 lx1Var = new lx1(mx1Var, new yv8(ka1.d(mx1Var, "after")));
        mx1 mx1Var2 = User.__matchedContactsConnection_first;
        lx1 lx1Var2 = new lx1(mx1Var2, new yv8(ka1.d(mx1Var2, "first")));
        mx1 mx1Var3 = User.__matchedContactsConnection_includeFollowedUsers;
        mx1Var3.getClass();
        List<sx1> listR15 = d46.R(nx1Var7, new nx1("matchedContactsConnection", b1eVar, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var3, new yv8(Boolean.FALSE))), listR14), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __viewer = listR15;
        RecommendedPublishersConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(RecommendedPublishersConnection.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var4 = Query.__recommendedPublishers_after;
        mx1Var4.getClass();
        lx1 lx1Var3 = new lx1(mx1Var4, new yv8(new tx1("after")));
        mx1 mx1Var5 = Query.__recommendedPublishers_first;
        lx1 lx1Var4 = new lx1(mx1Var5, new yv8(ka1.d(mx1Var5, "first")));
        mx1 mx1Var6 = Query.__recommendedPublishers_mode;
        nx1 nx1Var8 = new nx1("recommendedPublishers", rx1VarB, "writers", ey3Var, d46.R(lx1Var3, lx1Var4, new lx1(mx1Var6, new yv8(ka1.d(mx1Var6, "mode")))), listR4);
        rx1 rx1VarB2 = kyd.b(RecommendedPublishersConnection.type);
        mx1 mx1Var7 = Query.__recommendedPublishers_after;
        lx1 lx1Var5 = new lx1(mx1Var7, new yv8(ka1.d(mx1Var7, "after")));
        mx1 mx1Var8 = Query.__recommendedPublishers_first;
        lx1 lx1Var6 = new lx1(mx1Var8, new yv8(ka1.d(mx1Var8, "first")));
        mx1 mx1Var9 = Query.__recommendedPublishers_mode;
        nx1 nx1Var9 = new nx1("recommendedPublishers", rx1VarB2, "publications", ey3Var, d46.R(lx1Var5, lx1Var6, new lx1(mx1Var9, new yv8(ka1.d(mx1Var9, "mode")))), listR8);
        RecommendedTagsConnection.INSTANCE.getClass();
        rx1 rx1VarB3 = kyd.b(RecommendedTagsConnection.type);
        mx1 mx1Var10 = Query.__recommendedTags_input;
        nx1 nx1Var10 = new nx1("recommendedTags", rx1VarB3, null, ey3Var, ka1.y(mx1Var10, new yv8(ka1.d(mx1Var10, "recommendedTagsInput"))), listR11);
        sm8 sm8Var = User.type;
        sm8Var.getClass();
        __root = d46.R(nx1Var8, nx1Var9, nx1Var10, new nx1("viewer", sm8Var, null, ey3Var, ey3Var, listR15));
    }

    private AllSuggestionsQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }
}
