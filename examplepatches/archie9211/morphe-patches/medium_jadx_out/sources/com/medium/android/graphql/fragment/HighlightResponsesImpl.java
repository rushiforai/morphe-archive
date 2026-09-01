package com.medium.android.graphql.fragment;

import com.medium.android.graphql.fragment.HighlightResponsesImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.adapter.HighlightResponsesImpl_VariablesAdapter;
import com.medium.android.graphql.fragment.selections.HighlightResponsesSelections;
import com.medium.android.graphql.type.Post;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.i15;
import defpackage.k8;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001BS\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0007\u0012\u0016\b\u0002\u0010\n\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0005j\u0004\u0018\u0001`\t0\u0007\u0012\u0010\b\u0002\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u0007¢\u0006\u0004\b\r\u0010\u000eJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b \u0010!J\u0018\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0007HÆ\u0003¢\u0006\u0004\b\"\u0010#J\u001e\u0010$\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0005j\u0004\u0018\u0001`\t0\u0007HÆ\u0003¢\u0006\u0004\b$\u0010#J\u0018\u0010%\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u0007HÆ\u0003¢\u0006\u0004\b%\u0010#J`\u0010&\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00072\u0016\b\u0002\u0010\n\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0005j\u0004\u0018\u0001`\t0\u00072\u0010\b\u0002\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u0007HÆ\u0001¢\u0006\u0004\b&\u0010'J\u0010\u0010(\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b(\u0010\u001fJ\u0010\u0010)\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b)\u0010!J\u001a\u0010,\u001a\u00020\u00132\b\u0010+\u001a\u0004\u0018\u00010*HÖ\u0003¢\u0006\u0004\b,\u0010-R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010.\u001a\u0004\b/\u0010\u001fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00100\u001a\u0004\b1\u0010!R\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00078\u0006¢\u0006\f\n\u0004\b\b\u00102\u001a\u0004\b3\u0010#R%\u0010\n\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0005j\u0004\u0018\u0001`\t0\u00078\u0006¢\u0006\f\n\u0004\b\n\u00102\u001a\u0004\b4\u0010#R\u001f\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u00078\u0006¢\u0006\f\n\u0004\b\f\u00102\u001a\u0004\b5\u0010#¨\u00066"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl;", "Li15;", "Lcom/medium/android/graphql/fragment/HighlightResponses;", "", "groupId", "", "first", "Lzv8;", "after", "Lcom/medium/android/graphql/PaginationLimit;", "threadedPostsLimit", "Lcom/medium/android/graphql/type/ResponseSortType;", "sortType", "<init>", "(Ljava/lang/String;ILzv8;Lzv8;Lzv8;)V", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Ljava/lang/String;", "component2", "()I", "component3", "()Lzv8;", "component4", "component5", "copy", "(Ljava/lang/String;ILzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/fragment/HighlightResponsesImpl;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getGroupId", "I", "getFirst", "Lzv8;", "getAfter", "getThreadedPostsLimit", "getSortType", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class HighlightResponsesImpl implements i15 {
    private final zv8 after;
    private final int first;
    private final String groupId;
    private final zv8 sortType;
    private final zv8 threadedPostsLimit;

    public HighlightResponsesImpl(String str, int i, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3) {
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        this.groupId = str;
        this.first = i;
        this.after = zv8Var;
        this.threadedPostsLimit = zv8Var2;
        this.sortType = zv8Var3;
    }

    public static /* synthetic */ HighlightResponsesImpl copy$default(HighlightResponsesImpl highlightResponsesImpl, String str, int i, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = highlightResponsesImpl.groupId;
        }
        if ((i2 & 2) != 0) {
            i = highlightResponsesImpl.first;
        }
        if ((i2 & 4) != 0) {
            zv8Var = highlightResponsesImpl.after;
        }
        if ((i2 & 8) != 0) {
            zv8Var2 = highlightResponsesImpl.threadedPostsLimit;
        }
        if ((i2 & 16) != 0) {
            zv8Var3 = highlightResponsesImpl.sortType;
        }
        zv8 zv8Var4 = zv8Var3;
        zv8 zv8Var5 = zv8Var;
        return highlightResponsesImpl.copy(str, i, zv8Var5, zv8Var2, zv8Var4);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(HighlightResponsesImpl_ResponseAdapter.HighlightResponses.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getGroupId() {
        return this.groupId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getAfter() {
        return this.after;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getSortType() {
        return this.sortType;
    }

    public final HighlightResponsesImpl copy(String groupId, int first, zv8 after, zv8 threadedPostsLimit, zv8 sortType) {
        groupId.getClass();
        after.getClass();
        threadedPostsLimit.getClass();
        sortType.getClass();
        return new HighlightResponsesImpl(groupId, first, after, threadedPostsLimit, sortType);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HighlightResponsesImpl)) {
            return false;
        }
        HighlightResponsesImpl highlightResponsesImpl = (HighlightResponsesImpl) other;
        return g76.L(this.groupId, highlightResponsesImpl.groupId) && this.first == highlightResponsesImpl.first && g76.L(this.after, highlightResponsesImpl.after) && g76.L(this.threadedPostsLimit, highlightResponsesImpl.threadedPostsLimit) && g76.L(this.sortType, highlightResponsesImpl.sortType);
    }

    public final zv8 getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final String getGroupId() {
        return this.groupId;
    }

    public final zv8 getSortType() {
        return this.sortType;
    }

    public final zv8 getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final int hashCode() {
        return this.sortType.hashCode() + lv8.h(this.threadedPostsLimit, lv8.h(this.after, ((this.groupId.hashCode() * 31) + this.first) * 31, 31), 31);
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = ka1.m(Post.INSTANCE);
        List<sx1> list = HighlightResponsesSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        HighlightResponsesImpl_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.groupId;
        int i = this.first;
        zv8 zv8Var = this.after;
        zv8 zv8Var2 = this.threadedPostsLimit;
        zv8 zv8Var3 = this.sortType;
        StringBuilder sbT = y30.t(i, "HighlightResponsesImpl(groupId=", str, ", first=", ", after=");
        sbT.append(zv8Var);
        sbT.append(", threadedPostsLimit=");
        sbT.append(zv8Var2);
        sbT.append(", sortType=");
        return km4.B(sbT, zv8Var3, ")");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ HighlightResponsesImpl(String str, int i, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i2, gy2 gy2Var) {
        int i3 = i2 & 4;
        xv8 xv8Var = xv8.a;
        this(str, i, i3 != 0 ? xv8Var : zv8Var, (i2 & 8) != 0 ? xv8Var : zv8Var2, (i2 & 16) != 0 ? xv8Var : zv8Var3);
    }
}
