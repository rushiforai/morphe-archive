package com.medium.android.graphql.adapter;

import com.medium.android.graphql.EditCatalogItemsMutation;
import com.medium.android.graphql.type.CatalogItemMutateOperationInput;
import com.medium.android.graphql.type.adapter.CatalogItemMutateOperationInput_InputAdapter;
import defpackage.ae6;
import defpackage.fa4;
import defpackage.k8;
import defpackage.sv0;
import defpackage.yl2;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J-\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/EditCatalogItemsMutation_VariablesAdapter;", "", "<init>", "()V", "Lae6;", "writer", "Lcom/medium/android/graphql/EditCatalogItemsMutation;", "value", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lcom/medium/android/graphql/EditCatalogItemsMutation;Lyl2;Z)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class EditCatalogItemsMutation_VariablesAdapter {
    public static final EditCatalogItemsMutation_VariablesAdapter INSTANCE = new EditCatalogItemsMutation_VariablesAdapter();

    private EditCatalogItemsMutation_VariablesAdapter() {
    }

    public final void serializeVariables(ae6 writer, EditCatalogItemsMutation value, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        value.getClass();
        customScalarAdapters.getClass();
        writer.t0("catalogId");
        fa4 fa4Var = k8.a;
        fa4Var.toJson(writer, customScalarAdapters, value.getCatalogId());
        writer.t0("operations");
        sv0 sv0VarC = k8.c(CatalogItemMutateOperationInput_InputAdapter.INSTANCE, false);
        List<CatalogItemMutateOperationInput> operations = value.getOperations();
        operations.getClass();
        writer.n();
        Iterator<T> it2 = operations.iterator();
        while (it2.hasNext()) {
            sv0VarC.toJson(writer, customScalarAdapters, it2.next());
        }
        writer.k();
        writer.t0("version");
        fa4Var.toJson(writer, customScalarAdapters, value.getVersion());
    }
}
