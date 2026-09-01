package com.medium.android.graphql.adapter;

import com.medium.android.graphql.ExploreQuery;
import com.medium.android.graphql.type.adapter.DiscoverPostsInput_InputAdapter;
import com.medium.android.graphql.type.adapter.RecommendedTagsInput_InputAdapter;
import com.medium.android.graphql.type.adapter.StaffPicksFeedInput_InputAdapter;
import com.medium.android.graphql.type.adapter.TrendingPostsFeedInput_InputAdapter;
import defpackage.ae6;
import defpackage.k8;
import defpackage.yl2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J-\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/ExploreQuery_VariablesAdapter;", "", "<init>", "()V", "Lae6;", "writer", "Lcom/medium/android/graphql/ExploreQuery;", "value", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lcom/medium/android/graphql/ExploreQuery;Lyl2;Z)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ExploreQuery_VariablesAdapter {
    public static final ExploreQuery_VariablesAdapter INSTANCE = new ExploreQuery_VariablesAdapter();

    private ExploreQuery_VariablesAdapter() {
    }

    public final void serializeVariables(ae6 writer, ExploreQuery value, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        value.getClass();
        customScalarAdapters.getClass();
        writer.t0("recommendedTagsInput");
        k8.c(RecommendedTagsInput_InputAdapter.INSTANCE, false).toJson(writer, customScalarAdapters, value.getRecommendedTagsInput());
        writer.t0("trendingPostsFeedInput");
        k8.c(TrendingPostsFeedInput_InputAdapter.INSTANCE, false).toJson(writer, customScalarAdapters, value.getTrendingPostsFeedInput());
        writer.t0("staffPicksFeedInput");
        k8.c(StaffPicksFeedInput_InputAdapter.INSTANCE, false).toJson(writer, customScalarAdapters, value.getStaffPicksFeedInput());
        writer.t0("discoverPostsInput");
        k8.c(DiscoverPostsInput_InputAdapter.INSTANCE, false).toJson(writer, customScalarAdapters, value.getDiscoverPostsInput());
        writer.t0("recommendedPublisher");
        k8.b.toJson(writer, customScalarAdapters, Integer.valueOf(value.getRecommendedPublisher()));
    }
}
