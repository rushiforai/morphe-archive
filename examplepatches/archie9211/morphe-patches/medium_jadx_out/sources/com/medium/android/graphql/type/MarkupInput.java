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
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0086\b\u0018\u00002\u00020\u0001B\u0095\u0001\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0002\u0012\u0010\b\u0002\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002\u0012\u0006\u0010\u000b\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002\u0012\u0010\b\u0002\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u0018\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J\u0018\u0010\u0015\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0012J\u0018\u0010\u0016\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0012J\u0018\u0010\u0017\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0014J\u0018\u0010\u0019\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0012J\u0018\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u0012J\u0018\u0010\u001b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u0012J¢\u0001\u0010\u001c\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00022\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00022\u0010\b\u0002\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00022\b\b\u0002\u0010\u000b\u001a\u00020\u00032\u0010\b\u0002\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00022\u0010\b\u0002\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0002HÆ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b \u0010\u0014J\u001a\u0010#\u001a\u00020\"2\b\u0010!\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b#\u0010$R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b(\u0010\u0014R\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010%\u001a\u0004\b)\u0010\u0012R\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00028\u0006¢\u0006\f\n\u0004\b\t\u0010%\u001a\u0004\b*\u0010\u0012R\u001f\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00028\u0006¢\u0006\f\n\u0004\b\n\u0010%\u001a\u0004\b+\u0010\u0012R\u0017\u0010\u000b\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u000b\u0010'\u001a\u0004\b,\u0010\u0014R\u001f\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00028\u0006¢\u0006\f\n\u0004\b\f\u0010%\u001a\u0004\b-\u0010\u0012R\u001f\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\r\u0010%\u001a\u0004\b.\u0010\u0012R\u001f\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u0010%\u001a\u0004\b/\u0010\u0012¨\u00060"}, d2 = {"Lcom/medium/android/graphql/type/MarkupInput;", "", "Lzv8;", "", "anchorType", "end", "", "href", "Lcom/medium/android/graphql/type/LinkMetadataInput;", "linkMetadata", "rel", "start", "title", "type", "userId", "<init>", "(Lzv8;ILzv8;Lzv8;Lzv8;ILzv8;Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "()I", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "(Lzv8;ILzv8;Lzv8;Lzv8;ILzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/MarkupInput;", "toString", "()Ljava/lang/String;", "hashCode", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getAnchorType", "I", "getEnd", "getHref", "getLinkMetadata", "getRel", "getStart", "getTitle", "getType", "getUserId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MarkupInput {
    private final zv8 anchorType;
    private final int end;
    private final zv8 href;
    private final zv8 linkMetadata;
    private final zv8 rel;
    private final int start;
    private final zv8 title;
    private final zv8 type;
    private final zv8 userId;

    public MarkupInput(zv8 zv8Var, int i, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, int i2, zv8 zv8Var5, zv8 zv8Var6, zv8 zv8Var7) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        zv8Var4.getClass();
        zv8Var5.getClass();
        zv8Var6.getClass();
        zv8Var7.getClass();
        this.anchorType = zv8Var;
        this.end = i;
        this.href = zv8Var2;
        this.linkMetadata = zv8Var3;
        this.rel = zv8Var4;
        this.start = i2;
        this.title = zv8Var5;
        this.type = zv8Var6;
        this.userId = zv8Var7;
    }

    public static /* synthetic */ MarkupInput copy$default(MarkupInput markupInput, zv8 zv8Var, int i, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, int i2, zv8 zv8Var5, zv8 zv8Var6, zv8 zv8Var7, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            zv8Var = markupInput.anchorType;
        }
        if ((i3 & 2) != 0) {
            i = markupInput.end;
        }
        if ((i3 & 4) != 0) {
            zv8Var2 = markupInput.href;
        }
        if ((i3 & 8) != 0) {
            zv8Var3 = markupInput.linkMetadata;
        }
        if ((i3 & 16) != 0) {
            zv8Var4 = markupInput.rel;
        }
        if ((i3 & 32) != 0) {
            i2 = markupInput.start;
        }
        if ((i3 & 64) != 0) {
            zv8Var5 = markupInput.title;
        }
        if ((i3 & 128) != 0) {
            zv8Var6 = markupInput.type;
        }
        if ((i3 & 256) != 0) {
            zv8Var7 = markupInput.userId;
        }
        zv8 zv8Var8 = zv8Var6;
        zv8 zv8Var9 = zv8Var7;
        int i4 = i2;
        zv8 zv8Var10 = zv8Var5;
        zv8 zv8Var11 = zv8Var4;
        zv8 zv8Var12 = zv8Var2;
        return markupInput.copy(zv8Var, i, zv8Var12, zv8Var3, zv8Var11, i4, zv8Var10, zv8Var8, zv8Var9);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getAnchorType() {
        return this.anchorType;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getEnd() {
        return this.end;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getHref() {
        return this.href;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getLinkMetadata() {
        return this.linkMetadata;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getRel() {
        return this.rel;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final int getStart() {
        return this.start;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final zv8 getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final zv8 getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final zv8 getUserId() {
        return this.userId;
    }

    public final MarkupInput copy(zv8 anchorType, int end, zv8 href, zv8 linkMetadata, zv8 rel, int start, zv8 title, zv8 type, zv8 userId) {
        anchorType.getClass();
        href.getClass();
        linkMetadata.getClass();
        rel.getClass();
        title.getClass();
        type.getClass();
        userId.getClass();
        return new MarkupInput(anchorType, end, href, linkMetadata, rel, start, title, type, userId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MarkupInput)) {
            return false;
        }
        MarkupInput markupInput = (MarkupInput) other;
        return g76.L(this.anchorType, markupInput.anchorType) && this.end == markupInput.end && g76.L(this.href, markupInput.href) && g76.L(this.linkMetadata, markupInput.linkMetadata) && g76.L(this.rel, markupInput.rel) && this.start == markupInput.start && g76.L(this.title, markupInput.title) && g76.L(this.type, markupInput.type) && g76.L(this.userId, markupInput.userId);
    }

    public final zv8 getAnchorType() {
        return this.anchorType;
    }

    public final int getEnd() {
        return this.end;
    }

    public final zv8 getHref() {
        return this.href;
    }

    public final zv8 getLinkMetadata() {
        return this.linkMetadata;
    }

    public final zv8 getRel() {
        return this.rel;
    }

    public final int getStart() {
        return this.start;
    }

    public final zv8 getTitle() {
        return this.title;
    }

    public final zv8 getType() {
        return this.type;
    }

    public final zv8 getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + lv8.h(this.type, lv8.h(this.title, (lv8.h(this.rel, lv8.h(this.linkMetadata, lv8.h(this.href, ((this.anchorType.hashCode() * 31) + this.end) * 31, 31), 31), 31) + this.start) * 31, 31), 31);
    }

    public final String toString() {
        zv8 zv8Var = this.anchorType;
        int i = this.end;
        zv8 zv8Var2 = this.href;
        zv8 zv8Var3 = this.linkMetadata;
        zv8 zv8Var4 = this.rel;
        int i2 = this.start;
        zv8 zv8Var5 = this.title;
        zv8 zv8Var6 = this.type;
        zv8 zv8Var7 = this.userId;
        StringBuilder sb = new StringBuilder("MarkupInput(anchorType=");
        sb.append(zv8Var);
        sb.append(", end=");
        sb.append(i);
        sb.append(", href=");
        sb.append(zv8Var2);
        sb.append(", linkMetadata=");
        sb.append(zv8Var3);
        sb.append(", rel=");
        sb.append(zv8Var4);
        sb.append(", start=");
        sb.append(i2);
        sb.append(", title=");
        sb.append(zv8Var5);
        sb.append(", type=");
        sb.append(zv8Var6);
        sb.append(", userId=");
        return km4.B(sb, zv8Var7, ")");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ MarkupInput(zv8 zv8Var, int i, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, int i2, zv8 zv8Var5, zv8 zv8Var6, zv8 zv8Var7, int i3, gy2 gy2Var) {
        int i4 = i3 & 1;
        xv8 xv8Var = xv8.a;
        this(i4 != 0 ? xv8Var : zv8Var, i, (i3 & 4) != 0 ? xv8Var : zv8Var2, (i3 & 8) != 0 ? xv8Var : zv8Var3, (i3 & 16) != 0 ? xv8Var : zv8Var4, i2, (i3 & 64) != 0 ? xv8Var : zv8Var5, (i3 & 128) != 0 ? xv8Var : zv8Var6, (i3 & 256) != 0 ? xv8Var : zv8Var7);
    }
}
