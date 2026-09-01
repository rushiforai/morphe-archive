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
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B=\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002¢\u0006\u0004\b\b\u0010\tJ\u0018\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0018\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\u000bJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\u000bJF\u0010\u000e\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00022\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u0019\u0010\u000bR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0018\u001a\u0004\b\u001a\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u0018\u001a\u0004\b\u001b\u0010\u000b¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/type/ParagraphMetadataInput;", "", "Lzv8;", "", "id", "", "originalHeight", "originalWidth", "<init>", "(Lzv8;Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "component3", "copy", "(Lzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/ParagraphMetadataInput;", "toString", "()Ljava/lang/String;", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getId", "getOriginalHeight", "getOriginalWidth", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ParagraphMetadataInput {
    private final zv8 id;
    private final zv8 originalHeight;
    private final zv8 originalWidth;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ ParagraphMetadataInput(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3);
    }

    public static /* synthetic */ ParagraphMetadataInput copy$default(ParagraphMetadataInput paragraphMetadataInput, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = paragraphMetadataInput.id;
        }
        if ((i & 2) != 0) {
            zv8Var2 = paragraphMetadataInput.originalHeight;
        }
        if ((i & 4) != 0) {
            zv8Var3 = paragraphMetadataInput.originalWidth;
        }
        return paragraphMetadataInput.copy(zv8Var, zv8Var2, zv8Var3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getOriginalHeight() {
        return this.originalHeight;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getOriginalWidth() {
        return this.originalWidth;
    }

    public final ParagraphMetadataInput copy(zv8 id, zv8 originalHeight, zv8 originalWidth) {
        id.getClass();
        originalHeight.getClass();
        originalWidth.getClass();
        return new ParagraphMetadataInput(id, originalHeight, originalWidth);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ParagraphMetadataInput)) {
            return false;
        }
        ParagraphMetadataInput paragraphMetadataInput = (ParagraphMetadataInput) other;
        return g76.L(this.id, paragraphMetadataInput.id) && g76.L(this.originalHeight, paragraphMetadataInput.originalHeight) && g76.L(this.originalWidth, paragraphMetadataInput.originalWidth);
    }

    public final zv8 getId() {
        return this.id;
    }

    public final zv8 getOriginalHeight() {
        return this.originalHeight;
    }

    public final zv8 getOriginalWidth() {
        return this.originalWidth;
    }

    public final int hashCode() {
        return this.originalWidth.hashCode() + lv8.h(this.originalHeight, this.id.hashCode() * 31, 31);
    }

    public final String toString() {
        zv8 zv8Var = this.id;
        zv8 zv8Var2 = this.originalHeight;
        return km4.B(ka1.w("ParagraphMetadataInput(id=", zv8Var, ", originalHeight=", zv8Var2, ", originalWidth="), this.originalWidth, ")");
    }

    public ParagraphMetadataInput(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        this.id = zv8Var;
        this.originalHeight = zv8Var2;
        this.originalWidth = zv8Var3;
    }

    public ParagraphMetadataInput() {
        this(null, null, null, 7, null);
    }
}
