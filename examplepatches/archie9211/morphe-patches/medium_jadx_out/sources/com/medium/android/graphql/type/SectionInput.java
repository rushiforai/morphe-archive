package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ4\u0010\f\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0016\u001a\u0004\b\u0017\u0010\nR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0016\u001a\u0004\b\u0018\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/type/SectionInput;", "", "Lzv8;", "", "name", "", "startIndex", "<init>", "(Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "copy", "(Lzv8;Lzv8;)Lcom/medium/android/graphql/type/SectionInput;", "toString", "()Ljava/lang/String;", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getName", "getStartIndex", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SectionInput {
    private final zv8 name;
    private final zv8 startIndex;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SectionInput(zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2);
    }

    public static /* synthetic */ SectionInput copy$default(SectionInput sectionInput, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = sectionInput.name;
        }
        if ((i & 2) != 0) {
            zv8Var2 = sectionInput.startIndex;
        }
        return sectionInput.copy(zv8Var, zv8Var2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getStartIndex() {
        return this.startIndex;
    }

    public final SectionInput copy(zv8 name, zv8 startIndex) {
        name.getClass();
        startIndex.getClass();
        return new SectionInput(name, startIndex);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SectionInput)) {
            return false;
        }
        SectionInput sectionInput = (SectionInput) other;
        return g76.L(this.name, sectionInput.name) && g76.L(this.startIndex, sectionInput.startIndex);
    }

    public final zv8 getName() {
        return this.name;
    }

    public final zv8 getStartIndex() {
        return this.startIndex;
    }

    public final int hashCode() {
        return this.startIndex.hashCode() + (this.name.hashCode() * 31);
    }

    public final String toString() {
        return "SectionInput(name=" + this.name + ", startIndex=" + this.startIndex + ")";
    }

    public SectionInput(zv8 zv8Var, zv8 zv8Var2) {
        zv8Var.getClass();
        zv8Var2.getClass();
        this.name = zv8Var;
        this.startIndex = zv8Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SectionInput() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
