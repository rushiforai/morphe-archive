package com.medium.android.graphql.selections;

import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.graphql.fragment.selections.PostPreviewDataSelections;
import com.medium.android.graphql.fragment.selections.TagDataSelections;
import com.medium.android.graphql.fragment.selections.WhoToFollowNodeSelections;
import com.medium.android.graphql.type.DiscoverPostsResult;
import com.medium.android.graphql.type.FeedItemConnection;
import com.medium.android.graphql.type.FeedItemEdge;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.HomeFeedItem;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RecommendedPublishersConnection;
import com.medium.android.graphql.type.RecommendedPublishersConnectionEdge;
import com.medium.android.graphql.type.RecommendedPublishersConnectionEdgeNode;
import com.medium.android.graphql.type.RecommendedTagEdge;
import com.medium.android.graphql.type.RecommendedTagsConnection;
import com.medium.android.graphql.type.StaffPicksFeedResult;
import com.medium.android.graphql.type.Tag;
import defpackage.d46;
import defpackage.ey3;
import defpackage.ka1;
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
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0015\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0007R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0007R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u0007R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u0007R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0007R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u0007R\u001a\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u0007R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0007R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\u0007R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0007R\u001a\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\u0007R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010\u0007R\u001a\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010\u0007R\u001a\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010\u0007R\u001a\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010\u0007R\u001d\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0007\u001a\u0004\b\u0018\u0010\u0019¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/selections/ExploreQuerySelections;", "", "<init>", "()V", "", "Lsx1;", "__node", "Ljava/util/List;", "__edges", "__recommendedTags", "__post", "__node1", "__edges1", "__trendingPostsFeed", "__post1", "__items", "__staffPicksFeed", "__post2", "__items1", "__discoverPosts", "__node2", "__edges2", "__recommendedPublishers", "__root", "get__root", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ExploreQuerySelections {
    public static final ExploreQuerySelections INSTANCE = new ExploreQuerySelections();
    private static final List<sx1> __discoverPosts;
    private static final List<sx1> __edges;
    private static final List<sx1> __edges1;
    private static final List<sx1> __edges2;
    private static final List<sx1> __items;
    private static final List<sx1> __items1;
    private static final List<sx1> __node;
    private static final List<sx1> __node1;
    private static final List<sx1> __node2;
    private static final List<sx1> __post;
    private static final List<sx1> __post1;
    private static final List<sx1> __post2;
    private static final List<sx1> __recommendedPublishers;
    private static final List<sx1> __recommendedTags;
    private static final List<sx1> __root;
    private static final List<sx1> __staffPicksFeed;
    private static final List<sx1> __trendingPostsFeed;

    private ExploreQuerySelections() {
    }

    public final List<sx1> get__root() {
        return __root;
    }

    static {
        rx1 rx1VarF = y30.f(GraphQLString.INSTANCE);
        ey3 ey3Var = ey3.a;
        nx1 nx1Var = new nx1("__typename", rx1VarF, null, ey3Var, ey3Var, ey3Var);
        List listQ = d46.Q("Tag");
        List<sx1> list = TagDataSelections.INSTANCE.get__root();
        List<sx1> listR = d46.R(nx1Var, y30.c(list, "Tag", listQ, list), new nx1("normalizedTagSlug", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __node = listR;
        nx1 nx1Var2 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        Tag.INSTANCE.getClass();
        List<sx1> listR2 = d46.R(nx1Var2, new nx1("node", kyd.b(Tag.type), null, ey3Var, ey3Var, listR));
        __edges = listR2;
        nx1 nx1Var3 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedTagEdge.INSTANCE.getClass();
        List<sx1> listR3 = d46.R(nx1Var3, new nx1("edges", new rx1(new px1(kyd.b(RecommendedTagEdge.type))), null, ey3Var, ey3Var, listR2));
        __recommendedTags = listR3;
        nx1 nx1Var4 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ2 = d46.Q("Post");
        PostPreviewDataSelections postPreviewDataSelections = PostPreviewDataSelections.INSTANCE;
        List<sx1> list2 = postPreviewDataSelections.get__root();
        List<sx1> listR4 = d46.R(nx1Var4, y30.c(list2, "Post", listQ2, list2), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post = listR4;
        List<sx1> listR5 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("post", ka1.m(Post.INSTANCE), null, ey3Var, ey3Var, listR4));
        __node1 = listR5;
        nx1 nx1Var5 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        HomeFeedItem.INSTANCE.getClass();
        List<sx1> listR6 = d46.R(nx1Var5, new nx1("node", kyd.b(HomeFeedItem.type), null, ey3Var, ey3Var, listR5));
        __edges1 = listR6;
        nx1 nx1Var6 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        FeedItemEdge.INSTANCE.getClass();
        List<sx1> listR7 = d46.R(nx1Var6, new nx1("edges", new rx1(new px1(kyd.b(FeedItemEdge.type))), null, ey3Var, ey3Var, listR6));
        __trendingPostsFeed = listR7;
        nx1 nx1Var7 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ3 = d46.Q("Post");
        List<sx1> list3 = postPreviewDataSelections.get__root();
        List<sx1> listR8 = d46.R(nx1Var7, y30.c(list3, "Post", listQ3, list3), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post1 = listR8;
        nx1 nx1Var8 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var = Post.type;
        sm8Var.getClass();
        List<sx1> listR9 = d46.R(nx1Var8, new nx1(bPUi.ZkPu, sm8Var, null, ey3Var, ey3Var, listR8));
        __items = listR9;
        List<sx1> listR10 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("items", new rx1(new px1(kyd.b(HomeFeedItem.type))), null, ey3Var, ey3Var, listR9));
        __staffPicksFeed = listR10;
        nx1 nx1Var9 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listQ4 = d46.Q("Post");
        List<sx1> list4 = postPreviewDataSelections.get__root();
        List<sx1> listR11 = d46.R(nx1Var9, y30.c(list4, "Post", listQ4, list4), new nx1("id", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var));
        __post2 = listR11;
        nx1 nx1Var10 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        sm8 sm8Var2 = Post.type;
        sm8Var2.getClass();
        List<sx1> listR12 = d46.R(nx1Var10, new nx1("post", sm8Var2, null, ey3Var, ey3Var, listR11));
        __items1 = listR12;
        List<sx1> listR13 = d46.R(new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var), new nx1("items", new rx1(new px1(kyd.b(HomeFeedItem.type))), null, ey3Var, ey3Var, listR12));
        __discoverPosts = listR13;
        nx1 nx1Var11 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        List listR14 = d46.R("User", "Collection");
        List<sx1> list5 = WhoToFollowNodeSelections.INSTANCE.get__root();
        List<sx1> listR15 = d46.R(nx1Var11, y30.c(list5, "RecommendedPublishersConnectionEdgeNode", listR14, list5));
        __node2 = listR15;
        nx1 nx1Var12 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedPublishersConnectionEdgeNode.INSTANCE.getClass();
        List<sx1> listR16 = d46.R(nx1Var12, new nx1("node", kyd.b(RecommendedPublishersConnectionEdgeNode.type), null, ey3Var, ey3Var, listR15));
        __edges2 = listR16;
        nx1 nx1Var13 = new nx1("__typename", kyd.b(GraphQLString.type), null, ey3Var, ey3Var, ey3Var);
        RecommendedPublishersConnectionEdge.INSTANCE.getClass();
        List<sx1> listR17 = d46.R(nx1Var13, new nx1("edges", new rx1(new px1(kyd.b(RecommendedPublishersConnectionEdge.type))), null, ey3Var, ey3Var, listR16));
        __recommendedPublishers = listR17;
        RecommendedTagsConnection.INSTANCE.getClass();
        rx1 rx1VarB = kyd.b(RecommendedTagsConnection.type);
        Query.INSTANCE.getClass();
        mx1 mx1Var = Query.__recommendedTags_input;
        mx1Var.getClass();
        nx1 nx1Var14 = new nx1("recommendedTags", rx1VarB, null, ey3Var, ka1.y(mx1Var, new yv8(new tx1("recommendedTagsInput"))), listR3);
        FeedItemConnection.INSTANCE.getClass();
        rx1 rx1VarB2 = kyd.b(FeedItemConnection.type);
        mx1 mx1Var2 = Query.__trendingPostsFeed_input;
        nx1 nx1Var15 = new nx1("trendingPostsFeed", rx1VarB2, null, ey3Var, ka1.y(mx1Var2, new yv8(ka1.d(mx1Var2, "trendingPostsFeedInput"))), listR7);
        StaffPicksFeedResult.INSTANCE.getClass();
        rx1 rx1VarB3 = kyd.b(StaffPicksFeedResult.type);
        mx1 mx1Var3 = Query.__staffPicksFeed_input;
        nx1 nx1Var16 = new nx1("staffPicksFeed", rx1VarB3, null, ey3Var, ka1.y(mx1Var3, new yv8(ka1.d(mx1Var3, "staffPicksFeedInput"))), listR10);
        DiscoverPostsResult.INSTANCE.getClass();
        rx1 rx1VarB4 = kyd.b(DiscoverPostsResult.type);
        mx1 mx1Var4 = Query.__discoverPosts_input;
        nx1 nx1Var17 = new nx1("discoverPosts", rx1VarB4, null, ey3Var, ka1.y(mx1Var4, new yv8(ka1.d(mx1Var4, "discoverPostsInput"))), listR13);
        RecommendedPublishersConnection.INSTANCE.getClass();
        rx1 rx1VarB5 = kyd.b(RecommendedPublishersConnection.type);
        mx1 mx1Var5 = Query.__recommendedPublishers_after;
        mx1Var5.getClass();
        lx1 lx1Var = new lx1(mx1Var5, new yv8(""));
        mx1 mx1Var6 = Query.__recommendedPublishers_first;
        lx1 lx1Var2 = new lx1(mx1Var6, new yv8(ka1.d(mx1Var6, "recommendedPublisher")));
        mx1 mx1Var7 = Query.__recommendedPublishers_mode;
        mx1Var7.getClass();
        __root = d46.R(nx1Var14, nx1Var15, nx1Var16, nx1Var17, new nx1("recommendedPublishers", rx1VarB5, null, ey3Var, d46.R(lx1Var, lx1Var2, new lx1(mx1Var7, new yv8("ALL"))), listR17));
    }
}
