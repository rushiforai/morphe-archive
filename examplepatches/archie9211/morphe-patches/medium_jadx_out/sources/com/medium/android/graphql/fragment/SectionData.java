package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ0\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0011\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u0011\u0010\rJ\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0017\u001a\u0004\b\u0018\u0010\nR\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u001a\u0004\b\u0019\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001b\u0010\r¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/SectionData;", "Lg15;", "", "__typename", "name", "", "startIndex", "<init>", "(Ljava/lang/String;Ljava/lang/String;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()I", "copy", "(Ljava/lang/String;Ljava/lang/String;I)Lcom/medium/android/graphql/fragment/SectionData;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getName", "I", "getStartIndex", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SectionData implements g15 {
    private final String __typename;
    private final String name;
    private final int startIndex;

    public SectionData(String str, String str2, int i) {
        str.getClass();
        this.__typename = str;
        this.name = str2;
        this.startIndex = i;
    }

    public static /* synthetic */ SectionData copy$default(SectionData sectionData, String str, String str2, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = sectionData.__typename;
        }
        if ((i2 & 2) != 0) {
            str2 = sectionData.name;
        }
        if ((i2 & 4) != 0) {
            i = sectionData.startIndex;
        }
        return sectionData.copy(str, str2, i);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getStartIndex() {
        return this.startIndex;
    }

    public final SectionData copy(String __typename, String name, int startIndex) {
        __typename.getClass();
        return new SectionData(__typename, name, startIndex);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SectionData)) {
            return false;
        }
        SectionData sectionData = (SectionData) other;
        return g76.L(this.__typename, sectionData.__typename) && g76.L(this.name, sectionData.name) && this.startIndex == sectionData.startIndex;
    }

    public final String getName() {
        return this.name;
    }

    public final int getStartIndex() {
        return this.startIndex;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.name;
        return ((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + this.startIndex;
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.name;
        return ho2.H(y30.u("SectionData(__typename=", str, ", name=", str2, ", startIndex="), this.startIndex, ")");
    }
}
