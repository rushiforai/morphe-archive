package com.medium.android.graphql.fragment;

import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.graphql.fragment.ResponsePostThreadDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.adapter.ResponsePostThreadDataImpl_VariablesAdapter;
import com.medium.android.graphql.fragment.selections.ResponsePostThreadDataSelections;
import com.medium.android.graphql.type.ThreadedPostResponseConnection;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.i15;
import defpackage.k8;
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
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0002\b\u0007\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B1\u0012\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0004j\u0004\u0018\u0001`\u00050\u0003\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0003¢\u0006\u0004\b\t\u0010\nJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u001e\u0010\u001a\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0004j\u0004\u0018\u0001`\u00050\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0018\u0010\u001c\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001bJ:\u0010\u001d\u001a\u00020\u00002\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0004j\u0004\u0018\u0001`\u00050\u00032\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010 \u001a\u00020\u001fHÖ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\"\u0010#J\u001a\u0010&\u001a\u00020\u000f2\b\u0010%\u001a\u0004\u0018\u00010$HÖ\u0003¢\u0006\u0004\b&\u0010'R%\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0004j\u0004\u0018\u0001`\u00050\u00038\u0006¢\u0006\f\n\u0004\b\u0006\u0010(\u001a\u0004\b)\u0010\u001bR\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00038\u0006¢\u0006\f\n\u0004\b\b\u0010(\u001a\u0004\b*\u0010\u001b¨\u0006+"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponsePostThreadDataImpl;", "Li15;", "Lcom/medium/android/graphql/fragment/ResponsePostThreadData;", "Lzv8;", "", "Lcom/medium/android/graphql/PaginationLimit;", "threadedPostsLimit", "Lcom/medium/android/graphql/type/ResponseSortType;", "sortType", "<init>", "(Lzv8;Lzv8;)V", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lzv8;", "component2", "copy", "(Lzv8;Lzv8;)Lcom/medium/android/graphql/fragment/ResponsePostThreadDataImpl;", "", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getThreadedPostsLimit", "getSortType", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ResponsePostThreadDataImpl implements i15 {
    private final zv8 sortType;
    private final zv8 threadedPostsLimit;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ ResponsePostThreadDataImpl(zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2);
    }

    public static /* synthetic */ ResponsePostThreadDataImpl copy$default(ResponsePostThreadDataImpl responsePostThreadDataImpl, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = responsePostThreadDataImpl.threadedPostsLimit;
        }
        if ((i & 2) != 0) {
            zv8Var2 = responsePostThreadDataImpl.sortType;
        }
        return responsePostThreadDataImpl.copy(zv8Var, zv8Var2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ResponsePostThreadDataImpl_ResponseAdapter.ResponsePostThreadData.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getSortType() {
        return this.sortType;
    }

    public final ResponsePostThreadDataImpl copy(zv8 threadedPostsLimit, zv8 sortType) {
        threadedPostsLimit.getClass();
        sortType.getClass();
        return new ResponsePostThreadDataImpl(threadedPostsLimit, sortType);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ResponsePostThreadDataImpl)) {
            return false;
        }
        ResponsePostThreadDataImpl responsePostThreadDataImpl = (ResponsePostThreadDataImpl) other;
        return g76.L(this.threadedPostsLimit, responsePostThreadDataImpl.threadedPostsLimit) && g76.L(this.sortType, responsePostThreadDataImpl.sortType);
    }

    public final zv8 getSortType() {
        return this.sortType;
    }

    public final zv8 getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final int hashCode() {
        return this.sortType.hashCode() + (this.threadedPostsLimit.hashCode() * 31);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ResponsePostThreadDataImpl_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "ResponsePostThreadDataImpl(threadedPostsLimit=" + this.threadedPostsLimit + ", sortType=" + this.sortType + ")";
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        ThreadedPostResponseConnection.INSTANCE.getClass();
        sm8 sm8Var = ThreadedPostResponseConnection.type;
        sm8Var.getClass();
        List<sx1> list = ResponsePostThreadDataSelections.INSTANCE.get__root();
        list.getClass();
        String str = OphtYB.XpOoyr;
        ey3 ey3Var = ey3.a;
        return new nx1(str, sm8Var, null, ey3Var, ey3Var, list);
    }

    public ResponsePostThreadDataImpl(zv8 zv8Var, zv8 zv8Var2) {
        zv8Var.getClass();
        zv8Var2.getClass();
        this.threadedPostsLimit = zv8Var;
        this.sortType = zv8Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ResponsePostThreadDataImpl() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
