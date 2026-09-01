package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u000e\b\u0086\b\u0018\u00002\u00020\u0001Ba\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0002\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0002¢\u0006\u0004\b\f\u0010\rJ\u0018\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0018\u0010\u0010\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u000fJ\u0018\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u000fJ\u0018\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u000fJ\u0018\u0010\u0013\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u000fJj\u0010\u0014\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00022\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00022\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0002HÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u001aJ\u001a\u0010\u001c\u001a\u00020\n2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001e\u001a\u0004\b\u001f\u0010\u000fR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u001a\u0004\b \u0010\u000fR\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00028\u0006¢\u0006\f\n\u0004\b\b\u0010\u001e\u001a\u0004\b!\u0010\u000fR\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\t\u0010\u001e\u001a\u0004\b\"\u0010\u000fR\u001f\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u001e\u001a\u0004\b#\u0010\u000f¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/type/Delta;", "", "Lzv8;", "", "index", "Lcom/medium/android/graphql/type/ParagraphInput;", "paragraph", "Lcom/medium/android/graphql/type/SectionInput;", "section", "type", "", "verifySameName", "<init>", "(Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "component3", "component4", "component5", "copy", "(Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/Delta;", "", "toString", "()Ljava/lang/String;", "hashCode", "()I", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getIndex", "getParagraph", "getSection", "getType", "getVerifySameName", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class Delta {
    private final zv8 index;
    private final zv8 paragraph;
    private final zv8 section;
    private final zv8 type;
    private final zv8 verifySameName;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ Delta(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3, (i & 8) != 0 ? xv8Var : zv8Var4, (i & 16) != 0 ? xv8Var : zv8Var5);
    }

    public static /* synthetic */ Delta copy$default(Delta delta, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = delta.index;
        }
        if ((i & 2) != 0) {
            zv8Var2 = delta.paragraph;
        }
        if ((i & 4) != 0) {
            zv8Var3 = delta.section;
        }
        if ((i & 8) != 0) {
            zv8Var4 = delta.type;
        }
        if ((i & 16) != 0) {
            zv8Var5 = delta.verifySameName;
        }
        zv8 zv8Var6 = zv8Var5;
        zv8 zv8Var7 = zv8Var3;
        return delta.copy(zv8Var, zv8Var2, zv8Var7, zv8Var4, zv8Var6);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getIndex() {
        return this.index;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getParagraph() {
        return this.paragraph;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getSection() {
        return this.section;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getVerifySameName() {
        return this.verifySameName;
    }

    public final Delta copy(zv8 index, zv8 paragraph, zv8 section, zv8 type, zv8 verifySameName) {
        index.getClass();
        paragraph.getClass();
        section.getClass();
        type.getClass();
        verifySameName.getClass();
        return new Delta(index, paragraph, section, type, verifySameName);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Delta)) {
            return false;
        }
        Delta delta = (Delta) other;
        return g76.L(this.index, delta.index) && g76.L(this.paragraph, delta.paragraph) && g76.L(this.section, delta.section) && g76.L(this.type, delta.type) && g76.L(this.verifySameName, delta.verifySameName);
    }

    public final zv8 getIndex() {
        return this.index;
    }

    public final zv8 getParagraph() {
        return this.paragraph;
    }

    public final zv8 getSection() {
        return this.section;
    }

    public final zv8 getType() {
        return this.type;
    }

    public final zv8 getVerifySameName() {
        return this.verifySameName;
    }

    public final int hashCode() {
        return this.verifySameName.hashCode() + lv8.h(this.type, lv8.h(this.section, lv8.h(this.paragraph, this.index.hashCode() * 31, 31), 31), 31);
    }

    public final String toString() {
        zv8 zv8Var = this.index;
        zv8 zv8Var2 = this.paragraph;
        zv8 zv8Var3 = this.section;
        zv8 zv8Var4 = this.type;
        zv8 zv8Var5 = this.verifySameName;
        StringBuilder sbW = ka1.w("Delta(index=", zv8Var, ", paragraph=", zv8Var2, ", section=");
        sbW.append(zv8Var3);
        sbW.append(", type=");
        sbW.append(zv8Var4);
        sbW.append(", verifySameName=");
        return km4.B(sbW, zv8Var5, ")");
    }

    public Delta(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        zv8Var4.getClass();
        zv8Var5.getClass();
        this.index = zv8Var;
        this.paragraph = zv8Var2;
        this.section = zv8Var3;
        this.type = zv8Var4;
        this.verifySameName = zv8Var5;
    }

    public Delta() {
        this(null, null, null, null, null, 31, null);
    }
}
