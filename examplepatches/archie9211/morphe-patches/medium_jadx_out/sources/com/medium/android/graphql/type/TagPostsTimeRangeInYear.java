package com.medium.android.graphql.type;

import defpackage.ev6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u0003HÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/type/TagPostsTimeRangeInYear;", "", "year", "", "<init>", "(I)V", "getYear", "()I", "component1", "copy", "equals", "", "other", "hashCode", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TagPostsTimeRangeInYear {
    private final int year;

    public TagPostsTimeRangeInYear(int i) {
        this.year = i;
    }

    public static TagPostsTimeRangeInYear copy$default(TagPostsTimeRangeInYear tagPostsTimeRangeInYear, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = tagPostsTimeRangeInYear.year;
        }
        tagPostsTimeRangeInYear.getClass();
        return new TagPostsTimeRangeInYear(i);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getYear() {
        return this.year;
    }

    public final TagPostsTimeRangeInYear copy(int year) {
        return new TagPostsTimeRangeInYear(year);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof TagPostsTimeRangeInYear) && this.year == ((TagPostsTimeRangeInYear) other).year;
    }

    public final int getYear() {
        return this.year;
    }

    public final int hashCode() {
        return this.year;
    }

    public final String toString() {
        return ev6.w("TagPostsTimeRangeInYear(year=", this.year, ")");
    }
}
