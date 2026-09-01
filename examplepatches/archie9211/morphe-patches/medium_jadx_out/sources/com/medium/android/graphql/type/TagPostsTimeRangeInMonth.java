package com.medium.android.graphql.type;

import defpackage.ev6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/type/TagPostsTimeRangeInMonth;", "", "year", "", "month", "<init>", "(II)V", "getYear", "()I", "getMonth", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TagPostsTimeRangeInMonth {
    private final int month;
    private final int year;

    public TagPostsTimeRangeInMonth(int i, int i2) {
        this.year = i;
        this.month = i2;
    }

    public static TagPostsTimeRangeInMonth copy$default(TagPostsTimeRangeInMonth tagPostsTimeRangeInMonth, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = tagPostsTimeRangeInMonth.year;
        }
        if ((i3 & 2) != 0) {
            i2 = tagPostsTimeRangeInMonth.month;
        }
        tagPostsTimeRangeInMonth.getClass();
        return new TagPostsTimeRangeInMonth(i, i2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getYear() {
        return this.year;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getMonth() {
        return this.month;
    }

    public final TagPostsTimeRangeInMonth copy(int year, int month) {
        return new TagPostsTimeRangeInMonth(year, month);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TagPostsTimeRangeInMonth)) {
            return false;
        }
        TagPostsTimeRangeInMonth tagPostsTimeRangeInMonth = (TagPostsTimeRangeInMonth) other;
        return this.year == tagPostsTimeRangeInMonth.year && this.month == tagPostsTimeRangeInMonth.month;
    }

    public final int getMonth() {
        return this.month;
    }

    public final int getYear() {
        return this.year;
    }

    public final int hashCode() {
        return (this.year * 31) + this.month;
    }

    public final String toString() {
        return ev6.s(this.year, this.month, "TagPostsTimeRangeInMonth(year=", ", month=", ")");
    }
}
