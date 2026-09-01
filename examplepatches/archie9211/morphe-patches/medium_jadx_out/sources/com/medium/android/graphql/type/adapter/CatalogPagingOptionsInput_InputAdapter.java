package com.medium.android.graphql.type.adapter;

import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import defpackage.ae6;
import defpackage.c8;
import defpackage.fd6;
import defpackage.k8;
import defpackage.sv0;
import defpackage.y30;
import defpackage.yl2;
import defpackage.yv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/type/adapter/CatalogPagingOptionsInput_InputAdapter;", "Lc8;", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogPagingOptionsInput_InputAdapter implements c8 {
    public static final CatalogPagingOptionsInput_InputAdapter INSTANCE = new CatalogPagingOptionsInput_InputAdapter();

    private CatalogPagingOptionsInput_InputAdapter() {
    }

    @Override // defpackage.c8
    public final CatalogPagingOptionsInput fromJson(fd6 reader, yl2 customScalarAdapters) {
        throw y30.l(reader, customScalarAdapters, "Input type used in output position");
    }

    @Override // defpackage.c8
    public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogPagingOptionsInput value) {
        writer.getClass();
        customScalarAdapters.getClass();
        value.getClass();
        if (value.getCursor() instanceof yv8) {
            writer.t0("cursor");
            sv0 sv0VarC = k8.c(CatalogPagingCursorInput_InputAdapter.INSTANCE, false);
            yv8 yv8Var = (yv8) value.getCursor();
            yv8Var.getClass();
            Object obj = yv8Var.a;
            if (obj == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, obj);
            }
        }
        writer.t0("limit");
        k8.b.toJson(writer, customScalarAdapters, Integer.valueOf(value.getLimit()));
    }

    @Override // defpackage.c8
    public final /* bridge */ /* synthetic */ Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        fromJson(fd6Var, yl2Var);
        throw null;
    }
}
