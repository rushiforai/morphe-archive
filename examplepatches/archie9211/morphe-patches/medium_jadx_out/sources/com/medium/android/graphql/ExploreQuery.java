package com.medium.android.graphql;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.graphql.adapter.ExploreQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.ExploreQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.graphql.fragment.WhoToFollowNode;
import com.medium.android.graphql.selections.ExploreQuerySelections;
import com.medium.android.graphql.type.DiscoverPostsInput;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RecommendedTagsInput;
import com.medium.android.graphql.type.StaffPicksFeedInput;
import com.medium.android.graphql.type.TrendingPostsFeedInput;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u0000\n\u0002\b \b\u0086\b\u0018\u0000 ?2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0012@ABCDEFGHIJKLMNOP?B/\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0013\u0010\u0011J'\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0015\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010!\u001a\u00020 H\u0016¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b'\u0010(J\u0010\u0010)\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b)\u0010*J\u0010\u0010+\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b+\u0010,JB\u0010-\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\u000bHÆ\u0001¢\u0006\u0004\b-\u0010.J\u0010\u0010/\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b/\u0010\u0011J\u0010\u00100\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b0\u0010,J\u001a\u00103\u001a\u00020\u00182\b\u00102\u001a\u0004\u0018\u000101HÖ\u0003¢\u0006\u0004\b3\u00104R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00105\u001a\u0004\b6\u0010$R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00107\u001a\u0004\b8\u0010&R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00109\u001a\u0004\b:\u0010(R\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010;\u001a\u0004\b<\u0010*R\u0017\u0010\f\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010=\u001a\u0004\b>\u0010,¨\u0006Q"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery;", "Luqa;", "Lcom/medium/android/graphql/ExploreQuery$Data;", "Lcom/medium/android/graphql/type/RecommendedTagsInput;", "recommendedTagsInput", "Lcom/medium/android/graphql/type/TrendingPostsFeedInput;", "trendingPostsFeedInput", "Lcom/medium/android/graphql/type/StaffPicksFeedInput;", "staffPicksFeedInput", "Lcom/medium/android/graphql/type/DiscoverPostsInput;", "discoverPostsInput", "", "recommendedPublisher", "<init>", "(Lcom/medium/android/graphql/type/RecommendedTagsInput;Lcom/medium/android/graphql/type/TrendingPostsFeedInput;Lcom/medium/android/graphql/type/StaffPicksFeedInput;Lcom/medium/android/graphql/type/DiscoverPostsInput;I)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/RecommendedTagsInput;", "component2", "()Lcom/medium/android/graphql/type/TrendingPostsFeedInput;", "component3", "()Lcom/medium/android/graphql/type/StaffPicksFeedInput;", "component4", "()Lcom/medium/android/graphql/type/DiscoverPostsInput;", "component5", "()I", "copy", "(Lcom/medium/android/graphql/type/RecommendedTagsInput;Lcom/medium/android/graphql/type/TrendingPostsFeedInput;Lcom/medium/android/graphql/type/StaffPicksFeedInput;Lcom/medium/android/graphql/type/DiscoverPostsInput;I)Lcom/medium/android/graphql/ExploreQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/RecommendedTagsInput;", "getRecommendedTagsInput", "Lcom/medium/android/graphql/type/TrendingPostsFeedInput;", "getTrendingPostsFeedInput", "Lcom/medium/android/graphql/type/StaffPicksFeedInput;", "getStaffPicksFeedInput", "Lcom/medium/android/graphql/type/DiscoverPostsInput;", "getDiscoverPostsInput", "I", "getRecommendedPublisher", "Companion", "Data", "RecommendedTags", "Edge", "Node", "TrendingPostsFeed", "Edge1", "Node1", "Post", "StaffPicksFeed", "Item", "Post1", "DiscoverPosts", "Item1", "Post2", "RecommendedPublishers", "Edge2", "Node2", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ExploreQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "db1bd5b0700284704507f8346ccd24c613cdadd04d78ed9d46e35b0d9bd94b4f";
    public static final String OPERATION_NAME = "ExploreQuery";
    private final DiscoverPostsInput discoverPostsInput;
    private final int recommendedPublisher;
    private final RecommendedTagsInput recommendedTagsInput;
    private final StaffPicksFeedInput staffPicksFeedInput;
    private final TrendingPostsFeedInput trendingPostsFeedInput;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\b\u0086\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017JB\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\nHÆ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001b\u001a\u00020\u001aHÖ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001e\u001a\u00020\u001dHÖ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u001a\u0010#\u001a\u00020\"2\b\u0010!\u001a\u0004\u0018\u00010 HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010%\u001a\u0004\b&\u0010\u000fR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b(\u0010\u0011R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010)\u001a\u0004\b*\u0010\u0013R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010+\u001a\u0004\b,\u0010\u0015R\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010-\u001a\u0004\b.\u0010\u0017¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/ExploreQuery$RecommendedTags;", "recommendedTags", "Lcom/medium/android/graphql/ExploreQuery$TrendingPostsFeed;", "trendingPostsFeed", "Lcom/medium/android/graphql/ExploreQuery$StaffPicksFeed;", "staffPicksFeed", "Lcom/medium/android/graphql/ExploreQuery$DiscoverPosts;", "discoverPosts", "Lcom/medium/android/graphql/ExploreQuery$RecommendedPublishers;", "recommendedPublishers", "<init>", "(Lcom/medium/android/graphql/ExploreQuery$RecommendedTags;Lcom/medium/android/graphql/ExploreQuery$TrendingPostsFeed;Lcom/medium/android/graphql/ExploreQuery$StaffPicksFeed;Lcom/medium/android/graphql/ExploreQuery$DiscoverPosts;Lcom/medium/android/graphql/ExploreQuery$RecommendedPublishers;)V", "component1", "()Lcom/medium/android/graphql/ExploreQuery$RecommendedTags;", "component2", "()Lcom/medium/android/graphql/ExploreQuery$TrendingPostsFeed;", "component3", "()Lcom/medium/android/graphql/ExploreQuery$StaffPicksFeed;", "component4", "()Lcom/medium/android/graphql/ExploreQuery$DiscoverPosts;", "component5", "()Lcom/medium/android/graphql/ExploreQuery$RecommendedPublishers;", "copy", "(Lcom/medium/android/graphql/ExploreQuery$RecommendedTags;Lcom/medium/android/graphql/ExploreQuery$TrendingPostsFeed;Lcom/medium/android/graphql/ExploreQuery$StaffPicksFeed;Lcom/medium/android/graphql/ExploreQuery$DiscoverPosts;Lcom/medium/android/graphql/ExploreQuery$RecommendedPublishers;)Lcom/medium/android/graphql/ExploreQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/ExploreQuery$RecommendedTags;", "getRecommendedTags", "Lcom/medium/android/graphql/ExploreQuery$TrendingPostsFeed;", "getTrendingPostsFeed", "Lcom/medium/android/graphql/ExploreQuery$StaffPicksFeed;", "getStaffPicksFeed", "Lcom/medium/android/graphql/ExploreQuery$DiscoverPosts;", "getDiscoverPosts", "Lcom/medium/android/graphql/ExploreQuery$RecommendedPublishers;", "getRecommendedPublishers", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final DiscoverPosts discoverPosts;
        private final RecommendedPublishers recommendedPublishers;
        private final RecommendedTags recommendedTags;
        private final StaffPicksFeed staffPicksFeed;
        private final TrendingPostsFeed trendingPostsFeed;

        public Data(RecommendedTags recommendedTags, TrendingPostsFeed trendingPostsFeed, StaffPicksFeed staffPicksFeed, DiscoverPosts discoverPosts, RecommendedPublishers recommendedPublishers) {
            recommendedTags.getClass();
            trendingPostsFeed.getClass();
            staffPicksFeed.getClass();
            discoverPosts.getClass();
            recommendedPublishers.getClass();
            this.recommendedTags = recommendedTags;
            this.trendingPostsFeed = trendingPostsFeed;
            this.staffPicksFeed = staffPicksFeed;
            this.discoverPosts = discoverPosts;
            this.recommendedPublishers = recommendedPublishers;
        }

        public static /* synthetic */ Data copy$default(Data data, RecommendedTags recommendedTags, TrendingPostsFeed trendingPostsFeed, StaffPicksFeed staffPicksFeed, DiscoverPosts discoverPosts, RecommendedPublishers recommendedPublishers, int i, Object obj) {
            if ((i & 1) != 0) {
                recommendedTags = data.recommendedTags;
            }
            if ((i & 2) != 0) {
                trendingPostsFeed = data.trendingPostsFeed;
            }
            if ((i & 4) != 0) {
                staffPicksFeed = data.staffPicksFeed;
            }
            if ((i & 8) != 0) {
                discoverPosts = data.discoverPosts;
            }
            if ((i & 16) != 0) {
                recommendedPublishers = data.recommendedPublishers;
            }
            RecommendedPublishers recommendedPublishers2 = recommendedPublishers;
            StaffPicksFeed staffPicksFeed2 = staffPicksFeed;
            return data.copy(recommendedTags, trendingPostsFeed, staffPicksFeed2, discoverPosts, recommendedPublishers2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final RecommendedTags getRecommendedTags() {
            return this.recommendedTags;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final TrendingPostsFeed getTrendingPostsFeed() {
            return this.trendingPostsFeed;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final StaffPicksFeed getStaffPicksFeed() {
            return this.staffPicksFeed;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final DiscoverPosts getDiscoverPosts() {
            return this.discoverPosts;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final RecommendedPublishers getRecommendedPublishers() {
            return this.recommendedPublishers;
        }

        public final Data copy(RecommendedTags recommendedTags, TrendingPostsFeed trendingPostsFeed, StaffPicksFeed staffPicksFeed, DiscoverPosts discoverPosts, RecommendedPublishers recommendedPublishers) {
            recommendedTags.getClass();
            trendingPostsFeed.getClass();
            staffPicksFeed.getClass();
            discoverPosts.getClass();
            recommendedPublishers.getClass();
            return new Data(recommendedTags, trendingPostsFeed, staffPicksFeed, discoverPosts, recommendedPublishers);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.recommendedTags, data.recommendedTags) && g76.L(this.trendingPostsFeed, data.trendingPostsFeed) && g76.L(this.staffPicksFeed, data.staffPicksFeed) && g76.L(this.discoverPosts, data.discoverPosts) && g76.L(this.recommendedPublishers, data.recommendedPublishers);
        }

        public final DiscoverPosts getDiscoverPosts() {
            return this.discoverPosts;
        }

        public final RecommendedPublishers getRecommendedPublishers() {
            return this.recommendedPublishers;
        }

        public final RecommendedTags getRecommendedTags() {
            return this.recommendedTags;
        }

        public final StaffPicksFeed getStaffPicksFeed() {
            return this.staffPicksFeed;
        }

        public final TrendingPostsFeed getTrendingPostsFeed() {
            return this.trendingPostsFeed;
        }

        public final int hashCode() {
            return this.recommendedPublishers.hashCode() + ((this.discoverPosts.hashCode() + ((this.staffPicksFeed.hashCode() + ((this.trendingPostsFeed.hashCode() + (this.recommendedTags.hashCode() * 31)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            return "Data(recommendedTags=" + this.recommendedTags + ", trendingPostsFeed=" + this.trendingPostsFeed + ", staffPicksFeed=" + this.staffPicksFeed + ", discoverPosts=" + this.discoverPosts + ", recommendedPublishers=" + this.recommendedPublishers + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$DiscoverPosts;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/ExploreQuery$Item1;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class DiscoverPosts {
        private final String __typename;
        private final List<Item1> items;

        public DiscoverPosts(String str, List<Item1> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.items = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ DiscoverPosts copy$default(DiscoverPosts discoverPosts, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = discoverPosts.__typename;
            }
            if ((i & 2) != 0) {
                list = discoverPosts.items;
            }
            return discoverPosts.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Item1> component2() {
            return this.items;
        }

        public final DiscoverPosts copy(String __typename, List<Item1> items) {
            __typename.getClass();
            items.getClass();
            return new DiscoverPosts(__typename, items);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof DiscoverPosts)) {
                return false;
            }
            DiscoverPosts discoverPosts = (DiscoverPosts) other;
            return g76.L(this.__typename, discoverPosts.__typename) && g76.L(this.items, discoverPosts.items);
        }

        public final List<Item1> getItems() {
            return this.items;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.items.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("DiscoverPosts(__typename=", this.__typename, ", items=", ")", this.items);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/ExploreQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/ExploreQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/ExploreQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge {
        private final String __typename;
        private final Node node;

        public Edge(String str, Node node) {
            str.getClass();
            node.getClass();
            this.__typename = str;
            this.node = node;
        }

        public static /* synthetic */ Edge copy$default(Edge edge, String str, Node node, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge.__typename;
            }
            if ((i & 2) != 0) {
                node = edge.node;
            }
            return edge.copy(str, node);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node getNode() {
            return this.node;
        }

        public final Edge copy(String __typename, Node node) {
            __typename.getClass();
            node.getClass();
            return new Edge(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge)) {
                return false;
            }
            Edge edge = (Edge) other;
            return g76.L(this.__typename, edge.__typename) && g76.L(this.node, edge.node);
        }

        public final Node getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge(__typename=" + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Edge1;", "", "__typename", "", "node", "Lcom/medium/android/graphql/ExploreQuery$Node1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/ExploreQuery$Node1;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/ExploreQuery$Node1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge1 {
        private final String __typename;
        private final Node1 node;

        public Edge1(String str, Node1 node1) {
            str.getClass();
            node1.getClass();
            this.__typename = str;
            this.node = node1;
        }

        public static /* synthetic */ Edge1 copy$default(Edge1 edge1, String str, Node1 node1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge1.__typename;
            }
            if ((i & 2) != 0) {
                node1 = edge1.node;
            }
            return edge1.copy(str, node1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node1 getNode() {
            return this.node;
        }

        public final Edge1 copy(String __typename, Node1 node) {
            __typename.getClass();
            node.getClass();
            return new Edge1(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge1)) {
                return false;
            }
            Edge1 edge1 = (Edge1) other;
            return g76.L(this.__typename, edge1.__typename) && g76.L(this.node, edge1.node);
        }

        public final Node1 getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge1(__typename=" + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Edge2;", "", "__typename", "", "node", "Lcom/medium/android/graphql/ExploreQuery$Node2;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/ExploreQuery$Node2;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/ExploreQuery$Node2;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge2 {
        private final String __typename;
        private final Node2 node;

        public Edge2(String str, Node2 node2) {
            str.getClass();
            node2.getClass();
            this.__typename = str;
            this.node = node2;
        }

        public static /* synthetic */ Edge2 copy$default(Edge2 edge2, String str, Node2 node2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge2.__typename;
            }
            if ((i & 2) != 0) {
                node2 = edge2.node;
            }
            return edge2.copy(str, node2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node2 getNode() {
            return this.node;
        }

        public final Edge2 copy(String __typename, Node2 node) {
            __typename.getClass();
            node.getClass();
            return new Edge2(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge2)) {
                return false;
            }
            Edge2 edge2 = (Edge2) other;
            return g76.L(this.__typename, edge2.__typename) && g76.L(this.node, edge2.node);
        }

        public final Node2 getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge2(__typename=" + this.__typename + ", node=" + this.node + QFTsJPDEnO.aZrPabJXUQjKTXW;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Item;", "", "__typename", "", "post", "Lcom/medium/android/graphql/ExploreQuery$Post1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/ExploreQuery$Post1;)V", "get__typename", "()Ljava/lang/String;", "getPost", "()Lcom/medium/android/graphql/ExploreQuery$Post1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Item {
        private final String __typename;
        private final Post1 post;

        public Item(String str, Post1 post1) {
            str.getClass();
            this.__typename = str;
            this.post = post1;
        }

        public static /* synthetic */ Item copy$default(Item item, String str, Post1 post1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = item.__typename;
            }
            if ((i & 2) != 0) {
                post1 = item.post;
            }
            return item.copy(str, post1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Post1 getPost() {
            return this.post;
        }

        public final Item copy(String __typename, Post1 post) {
            __typename.getClass();
            return new Item(__typename, post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item)) {
                return false;
            }
            Item item = (Item) other;
            return g76.L(this.__typename, item.__typename) && g76.L(this.post, item.post);
        }

        public final Post1 getPost() {
            return this.post;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Post1 post1 = this.post;
            return iHashCode + (post1 == null ? 0 : post1.hashCode());
        }

        public final String toString() {
            return "Item(__typename=" + this.__typename + ", post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Item1;", "", "__typename", "", "post", "Lcom/medium/android/graphql/ExploreQuery$Post2;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/ExploreQuery$Post2;)V", "get__typename", "()Ljava/lang/String;", "getPost", "()Lcom/medium/android/graphql/ExploreQuery$Post2;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Item1 {
        private final String __typename;
        private final Post2 post;

        public Item1(String str, Post2 post2) {
            str.getClass();
            this.__typename = str;
            this.post = post2;
        }

        public static /* synthetic */ Item1 copy$default(Item1 item1, String str, Post2 post2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = item1.__typename;
            }
            if ((i & 2) != 0) {
                post2 = item1.post;
            }
            return item1.copy(str, post2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Post2 getPost() {
            return this.post;
        }

        public final Item1 copy(String __typename, Post2 post) {
            __typename.getClass();
            return new Item1(__typename, post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item1)) {
                return false;
            }
            Item1 item1 = (Item1) other;
            return g76.L(this.__typename, item1.__typename) && g76.L(this.post, item1.post);
        }

        public final Post2 getPost() {
            return this.post;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Post2 post2 = this.post;
            return iHashCode + (post2 == null ? 0 : post2.hashCode());
        }

        public final String toString() {
            return "Item1(__typename=" + this.__typename + ", post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Node;", "", "__typename", "", "normalizedTagSlug", "tagData", "Lcom/medium/android/graphql/fragment/TagData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagData", "()Lcom/medium/android/graphql/fragment/TagData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagData tagData;

        public Node(String str, String str2, TagData tagData) {
            lv8.C(str, str2, tagData);
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagData = tagData;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, String str2, TagData tagData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                str2 = node.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagData = node.tagData;
            }
            return node.copy(str, str2, tagData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final TagData getTagData() {
            return this.tagData;
        }

        public final Node copy(String __typename, String normalizedTagSlug, TagData tagData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagData.getClass();
            return new Node(__typename, normalizedTagSlug, tagData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.normalizedTagSlug, node.normalizedTagSlug) && g76.L(this.tagData, node.tagData);
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final TagData getTagData() {
            return this.tagData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.tagData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.normalizedTagSlug);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.normalizedTagSlug;
            TagData tagData = this.tagData;
            StringBuilder sbU = y30.u("Node(__typename=", str, ", normalizedTagSlug=", str2, peNPu.ncS);
            sbU.append(tagData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Node1;", "", "__typename", "", "post", "Lcom/medium/android/graphql/ExploreQuery$Post;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/ExploreQuery$Post;)V", "get__typename", "()Ljava/lang/String;", "getPost", "()Lcom/medium/android/graphql/ExploreQuery$Post;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node1 {
        private final String __typename;
        private final Post post;

        public Node1(String str, Post post) {
            str.getClass();
            this.__typename = str;
            this.post = post;
        }

        public static /* synthetic */ Node1 copy$default(Node1 node1, String str, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node1.__typename;
            }
            if ((i & 2) != 0) {
                post = node1.post;
            }
            return node1.copy(str, post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final Node1 copy(String __typename, Post post) {
            __typename.getClass();
            return new Node1(__typename, post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node1)) {
                return false;
            }
            Node1 node1 = (Node1) other;
            return g76.L(this.__typename, node1.__typename) && g76.L(this.post, node1.post);
        }

        public final Post getPost() {
            return this.post;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Post post = this.post;
            return iHashCode + (post == null ? 0 : post.hashCode());
        }

        public final String toString() {
            return "Node1(__typename=" + this.__typename + ", post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Node2;", "", "__typename", "", "whoToFollowNode", "Lcom/medium/android/graphql/fragment/WhoToFollowNode;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/WhoToFollowNode;)V", "get__typename", "()Ljava/lang/String;", "getWhoToFollowNode", "()Lcom/medium/android/graphql/fragment/WhoToFollowNode;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node2 {
        private final String __typename;
        private final WhoToFollowNode whoToFollowNode;

        public Node2(String str, WhoToFollowNode whoToFollowNode) {
            str.getClass();
            whoToFollowNode.getClass();
            this.__typename = str;
            this.whoToFollowNode = whoToFollowNode;
        }

        public static /* synthetic */ Node2 copy$default(Node2 node2, String str, WhoToFollowNode whoToFollowNode, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node2.__typename;
            }
            if ((i & 2) != 0) {
                whoToFollowNode = node2.whoToFollowNode;
            }
            return node2.copy(str, whoToFollowNode);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final WhoToFollowNode getWhoToFollowNode() {
            return this.whoToFollowNode;
        }

        public final Node2 copy(String __typename, WhoToFollowNode whoToFollowNode) {
            __typename.getClass();
            whoToFollowNode.getClass();
            return new Node2(__typename, whoToFollowNode);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node2)) {
                return false;
            }
            Node2 node2 = (Node2) other;
            return g76.L(this.__typename, node2.__typename) && g76.L(this.whoToFollowNode, node2.whoToFollowNode);
        }

        public final WhoToFollowNode getWhoToFollowNode() {
            return this.whoToFollowNode;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.whoToFollowNode.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Node2(__typename=" + this.__typename + PdtluglzAX.gAH + this.whoToFollowNode + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Post;", "", "__typename", "", "id", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostPreviewData", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final PostPreviewData postPreviewData;

        public Post(String str, String str2, PostPreviewData postPreviewData) {
            y30.B(str, str2, postPreviewData);
            this.__typename = str;
            this.id = str2;
            this.postPreviewData = postPreviewData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, PostPreviewData postPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                postPreviewData = post.postPreviewData;
            }
            return post.copy(str, str2, postPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final Post copy(String __typename, String id, PostPreviewData postPreviewData) {
            __typename.getClass();
            id.getClass();
            postPreviewData.getClass();
            return new Post(__typename, id, postPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.postPreviewData, post.postPreviewData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return y30.q(y30.u("Post(__typename=", str, ", id=", str2, ", postPreviewData="), this.postPreviewData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Post1;", "", "__typename", "", "id", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostPreviewData", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post1 {
        private final String __typename;
        private final String id;
        private final PostPreviewData postPreviewData;

        public Post1(String str, String str2, PostPreviewData postPreviewData) {
            y30.B(str, str2, postPreviewData);
            this.__typename = str;
            this.id = str2;
            this.postPreviewData = postPreviewData;
        }

        public static /* synthetic */ Post1 copy$default(Post1 post1, String str, String str2, PostPreviewData postPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post1.id;
            }
            if ((i & 4) != 0) {
                postPreviewData = post1.postPreviewData;
            }
            return post1.copy(str, str2, postPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final Post1 copy(String __typename, String id, PostPreviewData postPreviewData) {
            __typename.getClass();
            id.getClass();
            postPreviewData.getClass();
            return new Post1(__typename, id, postPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post1)) {
                return false;
            }
            Post1 post1 = (Post1) other;
            return g76.L(this.__typename, post1.__typename) && g76.L(this.id, post1.id) && g76.L(this.postPreviewData, post1.postPreviewData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return y30.q(y30.u("Post1(__typename=", str, ", id=", str2, ", postPreviewData="), this.postPreviewData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Post2;", "", "__typename", "", "id", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostPreviewData", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post2 {
        private final String __typename;
        private final String id;
        private final PostPreviewData postPreviewData;

        public Post2(String str, String str2, PostPreviewData postPreviewData) {
            y30.B(str, str2, postPreviewData);
            this.__typename = str;
            this.id = str2;
            this.postPreviewData = postPreviewData;
        }

        public static /* synthetic */ Post2 copy$default(Post2 post2, String str, String str2, PostPreviewData postPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post2.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post2.id;
            }
            if ((i & 4) != 0) {
                postPreviewData = post2.postPreviewData;
            }
            return post2.copy(str, str2, postPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final Post2 copy(String __typename, String id, PostPreviewData postPreviewData) {
            __typename.getClass();
            id.getClass();
            postPreviewData.getClass();
            return new Post2(__typename, id, postPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post2)) {
                return false;
            }
            Post2 post2 = (Post2) other;
            return g76.L(this.__typename, post2.__typename) && g76.L(this.id, post2.id) && g76.L(this.postPreviewData, post2.postPreviewData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return y30.q(y30.u("Post2(__typename=", str, ", id=", str2, ", postPreviewData="), this.postPreviewData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$RecommendedPublishers;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/ExploreQuery$Edge2;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RecommendedPublishers {
        private final String __typename;
        private final List<Edge2> edges;

        public RecommendedPublishers(String str, List<Edge2> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ RecommendedPublishers copy$default(RecommendedPublishers recommendedPublishers, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = recommendedPublishers.__typename;
            }
            if ((i & 2) != 0) {
                list = recommendedPublishers.edges;
            }
            return recommendedPublishers.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge2> component2() {
            return this.edges;
        }

        public final RecommendedPublishers copy(String __typename, List<Edge2> edges) {
            __typename.getClass();
            edges.getClass();
            return new RecommendedPublishers(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RecommendedPublishers)) {
                return false;
            }
            RecommendedPublishers recommendedPublishers = (RecommendedPublishers) other;
            return g76.L(this.__typename, recommendedPublishers.__typename) && g76.L(this.edges, recommendedPublishers.edges);
        }

        public final List<Edge2> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("RecommendedPublishers(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$RecommendedTags;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/ExploreQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RecommendedTags {
        private final String __typename;
        private final List<Edge> edges;

        public RecommendedTags(String str, List<Edge> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ RecommendedTags copy$default(RecommendedTags recommendedTags, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = recommendedTags.__typename;
            }
            if ((i & 2) != 0) {
                list = recommendedTags.edges;
            }
            return recommendedTags.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        public final RecommendedTags copy(String __typename, List<Edge> edges) {
            __typename.getClass();
            edges.getClass();
            return new RecommendedTags(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RecommendedTags)) {
                return false;
            }
            RecommendedTags recommendedTags = (RecommendedTags) other;
            return g76.L(this.__typename, recommendedTags.__typename) && g76.L(this.edges, recommendedTags.edges);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("RecommendedTags(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$StaffPicksFeed;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/ExploreQuery$Item;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class StaffPicksFeed {
        private final String __typename;
        private final List<Item> items;

        public StaffPicksFeed(String str, List<Item> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.items = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ StaffPicksFeed copy$default(StaffPicksFeed staffPicksFeed, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = staffPicksFeed.__typename;
            }
            if ((i & 2) != 0) {
                list = staffPicksFeed.items;
            }
            return staffPicksFeed.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Item> component2() {
            return this.items;
        }

        public final StaffPicksFeed copy(String __typename, List<Item> items) {
            __typename.getClass();
            items.getClass();
            return new StaffPicksFeed(__typename, items);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof StaffPicksFeed)) {
                return false;
            }
            StaffPicksFeed staffPicksFeed = (StaffPicksFeed) other;
            return g76.L(this.__typename, staffPicksFeed.__typename) && g76.L(this.items, staffPicksFeed.items);
        }

        public final List<Item> getItems() {
            return this.items;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.items.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("StaffPicksFeed(__typename=", this.__typename, ", items=", ")", this.items);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$TrendingPostsFeed;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/ExploreQuery$Edge1;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TrendingPostsFeed {
        private final String __typename;
        private final List<Edge1> edges;

        public TrendingPostsFeed(String str, List<Edge1> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ TrendingPostsFeed copy$default(TrendingPostsFeed trendingPostsFeed, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = trendingPostsFeed.__typename;
            }
            if ((i & 2) != 0) {
                list = trendingPostsFeed.edges;
            }
            return trendingPostsFeed.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge1> component2() {
            return this.edges;
        }

        public final TrendingPostsFeed copy(String __typename, List<Edge1> edges) {
            __typename.getClass();
            edges.getClass();
            return new TrendingPostsFeed(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TrendingPostsFeed)) {
                return false;
            }
            TrendingPostsFeed trendingPostsFeed = (TrendingPostsFeed) other;
            return g76.L(this.__typename, trendingPostsFeed.__typename) && g76.L(this.edges, trendingPostsFeed.edges);
        }

        public final List<Edge1> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("TrendingPostsFeed(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    public ExploreQuery(RecommendedTagsInput recommendedTagsInput, TrendingPostsFeedInput trendingPostsFeedInput, StaffPicksFeedInput staffPicksFeedInput, DiscoverPostsInput discoverPostsInput, int i) {
        recommendedTagsInput.getClass();
        trendingPostsFeedInput.getClass();
        staffPicksFeedInput.getClass();
        discoverPostsInput.getClass();
        this.recommendedTagsInput = recommendedTagsInput;
        this.trendingPostsFeedInput = trendingPostsFeedInput;
        this.staffPicksFeedInput = staffPicksFeedInput;
        this.discoverPostsInput = discoverPostsInput;
        this.recommendedPublisher = i;
    }

    public static /* synthetic */ ExploreQuery copy$default(ExploreQuery exploreQuery, RecommendedTagsInput recommendedTagsInput, TrendingPostsFeedInput trendingPostsFeedInput, StaffPicksFeedInput staffPicksFeedInput, DiscoverPostsInput discoverPostsInput, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            recommendedTagsInput = exploreQuery.recommendedTagsInput;
        }
        if ((i2 & 2) != 0) {
            trendingPostsFeedInput = exploreQuery.trendingPostsFeedInput;
        }
        if ((i2 & 4) != 0) {
            staffPicksFeedInput = exploreQuery.staffPicksFeedInput;
        }
        if ((i2 & 8) != 0) {
            discoverPostsInput = exploreQuery.discoverPostsInput;
        }
        if ((i2 & 16) != 0) {
            i = exploreQuery.recommendedPublisher;
        }
        int i3 = i;
        StaffPicksFeedInput staffPicksFeedInput2 = staffPicksFeedInput;
        return exploreQuery.copy(recommendedTagsInput, trendingPostsFeedInput, staffPicksFeedInput2, discoverPostsInput, i3);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ExploreQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final RecommendedTagsInput getRecommendedTagsInput() {
        return this.recommendedTagsInput;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final TrendingPostsFeedInput getTrendingPostsFeedInput() {
        return this.trendingPostsFeedInput;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final StaffPicksFeedInput getStaffPicksFeedInput() {
        return this.staffPicksFeedInput;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final DiscoverPostsInput getDiscoverPostsInput() {
        return this.discoverPostsInput;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final int getRecommendedPublisher() {
        return this.recommendedPublisher;
    }

    public final ExploreQuery copy(RecommendedTagsInput recommendedTagsInput, TrendingPostsFeedInput trendingPostsFeedInput, StaffPicksFeedInput staffPicksFeedInput, DiscoverPostsInput discoverPostsInput, int recommendedPublisher) {
        recommendedTagsInput.getClass();
        trendingPostsFeedInput.getClass();
        staffPicksFeedInput.getClass();
        discoverPostsInput.getClass();
        return new ExploreQuery(recommendedTagsInput, trendingPostsFeedInput, staffPicksFeedInput, discoverPostsInput, recommendedPublisher);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query ExploreQuery($recommendedTagsInput: RecommendedTagsInput!, $trendingPostsFeedInput: TrendingPostsFeedInput!, $staffPicksFeedInput: StaffPicksFeedInput!, $discoverPostsInput: DiscoverPostsInput!, $recommendedPublisher: Int!) { recommendedTags(input: $recommendedTagsInput) { __typename edges { __typename node { __typename ...TagData normalizedTagSlug } } } trendingPostsFeed(input: $trendingPostsFeedInput) { __typename edges { __typename node { __typename post { __typename ...PostPreviewData id } } } } staffPicksFeed(input: $staffPicksFeedInput) { __typename items { __typename post { __typename ...PostPreviewData id } } } discoverPosts(input: $discoverPostsInput) { __typename items { __typename post { __typename ...PostPreviewData id } } } recommendedPublishers(first: $recommendedPublisher, after: \"\", mode: ALL) { __typename edges { __typename node { __typename ...WhoToFollowNode } } } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }  fragment WhoToFollowNode on RecommendedPublishersConnectionEdgeNode { __typename ... on User { ...CreatorPreviewData id } ... on Collection { ...CollectionPreviewData id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ExploreQuery)) {
            return false;
        }
        ExploreQuery exploreQuery = (ExploreQuery) other;
        return g76.L(this.recommendedTagsInput, exploreQuery.recommendedTagsInput) && g76.L(this.trendingPostsFeedInput, exploreQuery.trendingPostsFeedInput) && g76.L(this.staffPicksFeedInput, exploreQuery.staffPicksFeedInput) && g76.L(this.discoverPostsInput, exploreQuery.discoverPostsInput) && this.recommendedPublisher == exploreQuery.recommendedPublisher;
    }

    public final DiscoverPostsInput getDiscoverPostsInput() {
        return this.discoverPostsInput;
    }

    public final int getRecommendedPublisher() {
        return this.recommendedPublisher;
    }

    public final RecommendedTagsInput getRecommendedTagsInput() {
        return this.recommendedTagsInput;
    }

    public final StaffPicksFeedInput getStaffPicksFeedInput() {
        return this.staffPicksFeedInput;
    }

    public final TrendingPostsFeedInput getTrendingPostsFeedInput() {
        return this.trendingPostsFeedInput;
    }

    public final int hashCode() {
        return ((this.discoverPostsInput.hashCode() + ((this.staffPicksFeedInput.hashCode() + ((this.trendingPostsFeedInput.hashCode() + (this.recommendedTagsInput.hashCode() * 31)) * 31)) * 31)) * 31) + this.recommendedPublisher;
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = ExploreQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ExploreQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        RecommendedTagsInput recommendedTagsInput = this.recommendedTagsInput;
        TrendingPostsFeedInput trendingPostsFeedInput = this.trendingPostsFeedInput;
        StaffPicksFeedInput staffPicksFeedInput = this.staffPicksFeedInput;
        DiscoverPostsInput discoverPostsInput = this.discoverPostsInput;
        int i = this.recommendedPublisher;
        StringBuilder sb = new StringBuilder("ExploreQuery(recommendedTagsInput=");
        sb.append(recommendedTagsInput);
        sb.append(", trendingPostsFeedInput=");
        sb.append(trendingPostsFeedInput);
        sb.append(", staffPicksFeedInput=");
        sb.append(staffPicksFeedInput);
        sb.append(", discoverPostsInput=");
        sb.append(discoverPostsInput);
        sb.append(", recommendedPublisher=");
        return ho2.H(sb, i, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/ExploreQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query ExploreQuery($recommendedTagsInput: RecommendedTagsInput!, $trendingPostsFeedInput: TrendingPostsFeedInput!, $staffPicksFeedInput: StaffPicksFeedInput!, $discoverPostsInput: DiscoverPostsInput!, $recommendedPublisher: Int!) { recommendedTags(input: $recommendedTagsInput) { __typename edges { __typename node { __typename ...TagData normalizedTagSlug } } } trendingPostsFeed(input: $trendingPostsFeedInput) { __typename edges { __typename node { __typename post { __typename ...PostPreviewData id } } } } staffPicksFeed(input: $staffPicksFeedInput) { __typename items { __typename post { __typename ...PostPreviewData id } } } discoverPosts(input: $discoverPostsInput) { __typename items { __typename post { __typename ...PostPreviewData id } } } recommendedPublishers(first: $recommendedPublisher, after: \"\", mode: ALL) { __typename edges { __typename node { __typename ...WhoToFollowNode } } } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }  fragment WhoToFollowNode on RecommendedPublishersConnectionEdgeNode { __typename ... on User { ...CreatorPreviewData id } ... on Collection { ...CollectionPreviewData id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
