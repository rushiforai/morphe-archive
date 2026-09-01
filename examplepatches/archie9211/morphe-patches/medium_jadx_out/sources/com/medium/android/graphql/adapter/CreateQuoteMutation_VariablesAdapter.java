package com.medium.android.graphql.adapter;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.CreateQuoteMutation;
import com.medium.android.graphql.type.adapter.StreamItemQuoteType_ResponseAdapter;
import defpackage.ae6;
import defpackage.fa4;
import defpackage.k8;
import defpackage.uob;
import defpackage.yl2;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J-\u0010\r\u001a\u00020\f2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lcom/medium/android/graphql/adapter/CreateQuoteMutation_VariablesAdapter;", "", "<init>", "()V", "Lae6;", "writer", "Lcom/medium/android/graphql/CreateQuoteMutation;", "value", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lcom/medium/android/graphql/CreateQuoteMutation;Lyl2;Z)V", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreateQuoteMutation_VariablesAdapter {
    public static final CreateQuoteMutation_VariablesAdapter INSTANCE = new CreateQuoteMutation_VariablesAdapter();

    private CreateQuoteMutation_VariablesAdapter() {
    }

    public final void serializeVariables(ae6 writer, CreateQuoteMutation value, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        value.getClass();
        customScalarAdapters.getClass();
        writer.t0("targetPostId");
        fa4 fa4Var = k8.a;
        fa4Var.toJson(writer, customScalarAdapters, value.getTargetPostId());
        writer.t0("targetPostVersionId");
        fa4Var.toJson(writer, customScalarAdapters, value.getTargetPostVersionId());
        writer.t0(ZVsviyDAr.ofjHYdjz);
        StreamItemQuoteType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getQuoteType());
        writer.t0("startOffset");
        uob uobVar = k8.b;
        uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getStartOffset()));
        writer.t0("endOffset");
        uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getEndOffset()));
        writer.t0("targetParagraphNames");
        List<String> targetParagraphNames = value.getTargetParagraphNames();
        targetParagraphNames.getClass();
        writer.n();
        Iterator<T> it2 = targetParagraphNames.iterator();
        while (it2.hasNext()) {
            fa4Var.toJson(writer, customScalarAdapters, it2.next());
        }
        writer.k();
    }
}
