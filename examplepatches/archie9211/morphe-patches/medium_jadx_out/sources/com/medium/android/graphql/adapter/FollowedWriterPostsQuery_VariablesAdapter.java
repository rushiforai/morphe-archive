package com.medium.android.graphql.adapter;

import com.medium.android.graphql.FollowedWriterPostsQuery;
import com.medium.android.graphql.type.adapter.PagingOptions_InputAdapter;
import defpackage.ae6;
import defpackage.k8;
import defpackage.xl8;
import defpackage.yl2;
import defpackage.yv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J-\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/FollowedWriterPostsQuery_VariablesAdapter;", "", "<init>", "()V", "Lae6;", "writer", "Lcom/medium/android/graphql/FollowedWriterPostsQuery;", "value", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lcom/medium/android/graphql/FollowedWriterPostsQuery;Lyl2;Z)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowedWriterPostsQuery_VariablesAdapter {
    public static final FollowedWriterPostsQuery_VariablesAdapter INSTANCE = new FollowedWriterPostsQuery_VariablesAdapter();

    private FollowedWriterPostsQuery_VariablesAdapter() {
    }

    public final void serializeVariables(ae6 writer, FollowedWriterPostsQuery value, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        value.getClass();
        customScalarAdapters.getClass();
        writer.t0("writerId");
        k8.a.toJson(writer, customScalarAdapters, value.getWriterId());
        if (value.getPagingInfo() instanceof yv8) {
            writer.t0("pagingInfo");
            xl8 xl8Var = new xl8(k8.c(PagingOptions_InputAdapter.INSTANCE, false));
            yv8 yv8Var = (yv8) value.getPagingInfo();
            yv8Var.getClass();
            xl8Var.toJson(writer, customScalarAdapters, yv8Var.a);
        }
    }
}
