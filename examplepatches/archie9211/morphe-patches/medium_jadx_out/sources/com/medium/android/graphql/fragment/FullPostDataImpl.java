package com.medium.android.graphql.fragment;

import com.medium.android.graphql.fragment.FullPostDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.adapter.FullPostDataImpl_VariablesAdapter;
import com.medium.android.graphql.fragment.selections.FullPostDataSelections;
import com.medium.android.graphql.type.Post;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.i15;
import defpackage.k8;
import defpackage.ka1;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003¢\u0006\u0004\b\u0006\u0010\u0007J'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\fH\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u0015\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0018\u0010\u0017\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\"\u0010\u0019\u001a\u00020\u00002\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003HÆ\u0001¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001c\u001a\u00020\u001bHÖ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010%\u001a\u0004\b&\u0010\u0018¨\u0006'"}, d2 = {"Lcom/medium/android/graphql/fragment/FullPostDataImpl;", "Li15;", "Lcom/medium/android/graphql/fragment/FullPostData;", "Lzv8;", "Lcom/medium/android/graphql/type/PostMeteringOptions;", "postMeteringOptions", "<init>", "(Lzv8;)V", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lzv8;", "copy", "(Lzv8;)Lcom/medium/android/graphql/fragment/FullPostDataImpl;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getPostMeteringOptions", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FullPostDataImpl implements i15 {
    private final zv8 postMeteringOptions;

    public /* synthetic */ FullPostDataImpl(zv8 zv8Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var);
    }

    public static /* synthetic */ FullPostDataImpl copy$default(FullPostDataImpl fullPostDataImpl, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = fullPostDataImpl.postMeteringOptions;
        }
        return fullPostDataImpl.copy(zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(FullPostDataImpl_ResponseAdapter.FullPostData.INSTANCE, true);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getPostMeteringOptions() {
        return this.postMeteringOptions;
    }

    public final FullPostDataImpl copy(zv8 postMeteringOptions) {
        postMeteringOptions.getClass();
        return new FullPostDataImpl(postMeteringOptions);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof FullPostDataImpl) && g76.L(this.postMeteringOptions, ((FullPostDataImpl) other).postMeteringOptions);
    }

    public final zv8 getPostMeteringOptions() {
        return this.postMeteringOptions;
    }

    public final int hashCode() {
        return this.postMeteringOptions.hashCode();
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = ka1.m(Post.INSTANCE);
        List<sx1> list = FullPostDataSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        FullPostDataImpl_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "FullPostDataImpl(postMeteringOptions=" + this.postMeteringOptions + ")";
    }

    public FullPostDataImpl(zv8 zv8Var) {
        zv8Var.getClass();
        this.postMeteringOptions = zv8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public FullPostDataImpl() {
        this(null, 1, 0 == true ? 1 : 0);
    }
}
