package com.medium.android.graphql.adapter;

import com.medium.android.graphql.CatalogItemsQuery;
import com.medium.android.graphql.type.adapter.CatalogPagingOptionsInput_InputAdapter;
import defpackage.ae6;
import defpackage.k8;
import defpackage.yl2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J-\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_VariablesAdapter;", "", "<init>", "()V", "Lae6;", "writer", "Lcom/medium/android/graphql/CatalogItemsQuery;", "value", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lcom/medium/android/graphql/CatalogItemsQuery;Lyl2;Z)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogItemsQuery_VariablesAdapter {
    public static final CatalogItemsQuery_VariablesAdapter INSTANCE = new CatalogItemsQuery_VariablesAdapter();

    private CatalogItemsQuery_VariablesAdapter() {
    }

    public final void serializeVariables(ae6 writer, CatalogItemsQuery value, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        value.getClass();
        customScalarAdapters.getClass();
        writer.t0("catalogId");
        k8.a.toJson(writer, customScalarAdapters, value.getCatalogId());
        writer.t0("pagingOptions");
        k8.c(CatalogPagingOptionsInput_InputAdapter.INSTANCE, false).toJson(writer, customScalarAdapters, value.getPagingOptions());
    }
}
