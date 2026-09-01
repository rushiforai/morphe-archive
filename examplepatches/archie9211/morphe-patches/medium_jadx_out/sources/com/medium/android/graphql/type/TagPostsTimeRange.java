package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.km4;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0004¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0018\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0004HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u000eJ>\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00042\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0004HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0013\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\fR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u001a\u0004\b\u001f\u0010\u000eR\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00048\u0006¢\u0006\f\n\u0004\b\b\u0010\u001e\u001a\u0004\b \u0010\u000e¨\u0006!"}, d2 = {"Lcom/medium/android/graphql/type/TagPostsTimeRange;", "", "Lcom/medium/android/graphql/type/TagPostsTimeRangeKind;", "kind", "Lzv8;", "Lcom/medium/android/graphql/type/TagPostsTimeRangeInYear;", "inYear", "Lcom/medium/android/graphql/type/TagPostsTimeRangeInMonth;", "inMonth", "<init>", "(Lcom/medium/android/graphql/type/TagPostsTimeRangeKind;Lzv8;Lzv8;)V", "component1", "()Lcom/medium/android/graphql/type/TagPostsTimeRangeKind;", "component2", "()Lzv8;", "component3", "copy", "(Lcom/medium/android/graphql/type/TagPostsTimeRangeKind;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/TagPostsTimeRange;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/TagPostsTimeRangeKind;", "getKind", "Lzv8;", "getInYear", "getInMonth", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TagPostsTimeRange {
    private final zv8 inMonth;
    private final zv8 inYear;
    private final TagPostsTimeRangeKind kind;

    public TagPostsTimeRange(TagPostsTimeRangeKind tagPostsTimeRangeKind, zv8 zv8Var, zv8 zv8Var2) {
        tagPostsTimeRangeKind.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        this.kind = tagPostsTimeRangeKind;
        this.inYear = zv8Var;
        this.inMonth = zv8Var2;
    }

    public static /* synthetic */ TagPostsTimeRange copy$default(TagPostsTimeRange tagPostsTimeRange, TagPostsTimeRangeKind tagPostsTimeRangeKind, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            tagPostsTimeRangeKind = tagPostsTimeRange.kind;
        }
        if ((i & 2) != 0) {
            zv8Var = tagPostsTimeRange.inYear;
        }
        if ((i & 4) != 0) {
            zv8Var2 = tagPostsTimeRange.inMonth;
        }
        return tagPostsTimeRange.copy(tagPostsTimeRangeKind, zv8Var, zv8Var2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final TagPostsTimeRangeKind getKind() {
        return this.kind;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getInYear() {
        return this.inYear;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getInMonth() {
        return this.inMonth;
    }

    public final TagPostsTimeRange copy(TagPostsTimeRangeKind kind, zv8 inYear, zv8 inMonth) {
        kind.getClass();
        inYear.getClass();
        inMonth.getClass();
        return new TagPostsTimeRange(kind, inYear, inMonth);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TagPostsTimeRange)) {
            return false;
        }
        TagPostsTimeRange tagPostsTimeRange = (TagPostsTimeRange) other;
        return this.kind == tagPostsTimeRange.kind && g76.L(this.inYear, tagPostsTimeRange.inYear) && g76.L(this.inMonth, tagPostsTimeRange.inMonth);
    }

    public final zv8 getInMonth() {
        return this.inMonth;
    }

    public final zv8 getInYear() {
        return this.inYear;
    }

    public final TagPostsTimeRangeKind getKind() {
        return this.kind;
    }

    public final int hashCode() {
        return this.inMonth.hashCode() + lv8.h(this.inYear, this.kind.hashCode() * 31, 31);
    }

    public final String toString() {
        TagPostsTimeRangeKind tagPostsTimeRangeKind = this.kind;
        zv8 zv8Var = this.inYear;
        zv8 zv8Var2 = this.inMonth;
        StringBuilder sb = new StringBuilder("TagPostsTimeRange(kind=");
        sb.append(tagPostsTimeRangeKind);
        sb.append(", inYear=");
        sb.append(zv8Var);
        sb.append(", inMonth=");
        return km4.B(sb, zv8Var2, ")");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ TagPostsTimeRange(TagPostsTimeRangeKind tagPostsTimeRangeKind, zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 2;
        xv8 xv8Var = xv8.a;
        this(tagPostsTimeRangeKind, i2 != 0 ? xv8Var : zv8Var, (i & 4) != 0 ? xv8Var : zv8Var2);
    }
}
