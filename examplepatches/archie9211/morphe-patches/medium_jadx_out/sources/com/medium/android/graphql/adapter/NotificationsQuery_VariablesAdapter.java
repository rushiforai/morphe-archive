package com.medium.android.graphql.adapter;

import com.medium.android.graphql.NotificationsQuery;
import com.medium.android.graphql.type.adapter.PagingOptions_InputAdapter;
import defpackage.ae6;
import defpackage.k8;
import defpackage.sv0;
import defpackage.yl2;
import defpackage.yv8;
import defpackage.zm7;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J-\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/NotificationsQuery_VariablesAdapter;", "", "<init>", "()V", "Lae6;", "writer", "Lcom/medium/android/graphql/NotificationsQuery;", "value", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lcom/medium/android/graphql/NotificationsQuery;Lyl2;Z)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class NotificationsQuery_VariablesAdapter {
    public static final NotificationsQuery_VariablesAdapter INSTANCE = new NotificationsQuery_VariablesAdapter();

    private NotificationsQuery_VariablesAdapter() {
    }

    public final void serializeVariables(ae6 writer, NotificationsQuery value, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        value.getClass();
        customScalarAdapters.getClass();
        if (value.getActivityTypes() instanceof yv8) {
            writer.t0("activityTypes");
            zm7 zm7Var = new zm7(k8.a);
            yv8 yv8Var = (yv8) value.getActivityTypes();
            yv8Var.getClass();
            Object obj = yv8Var.a;
            if (obj == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, obj);
            }
        }
        if (value.getPagingInfo() instanceof yv8) {
            writer.t0("pagingInfo");
            sv0 sv0VarC = k8.c(PagingOptions_InputAdapter.INSTANCE, false);
            yv8 yv8Var2 = (yv8) value.getPagingInfo();
            yv8Var2.getClass();
            Object obj2 = yv8Var2.a;
            if (obj2 == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, obj2);
            }
        }
    }
}
