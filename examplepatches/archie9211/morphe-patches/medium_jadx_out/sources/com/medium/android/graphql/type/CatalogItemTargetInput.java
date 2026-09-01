package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0010\u0010\u000e\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ>\u0010\u0010\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00022\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001b\u001a\u0004\b\u001c\u0010\fR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001b\u001a\u0004\b\u001d\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\u001e\u001a\u0004\b\u001f\u0010\u000f¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/type/CatalogItemTargetInput;", "", "Lzv8;", "", "id", "Lcom/medium/android/graphql/type/ParagraphInput;", "paragraph", "Lcom/medium/android/graphql/type/CatalogItemType;", "type", "<init>", "(Lzv8;Lzv8;Lcom/medium/android/graphql/type/CatalogItemType;)V", "component1", "()Lzv8;", "component2", "component3", "()Lcom/medium/android/graphql/type/CatalogItemType;", "copy", "(Lzv8;Lzv8;Lcom/medium/android/graphql/type/CatalogItemType;)Lcom/medium/android/graphql/type/CatalogItemTargetInput;", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getId", "getParagraph", "Lcom/medium/android/graphql/type/CatalogItemType;", "getType", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogItemTargetInput {
    private final zv8 id;
    private final zv8 paragraph;
    private final CatalogItemType type;

    public CatalogItemTargetInput(zv8 zv8Var, zv8 zv8Var2, CatalogItemType catalogItemType) {
        zv8Var.getClass();
        zv8Var2.getClass();
        catalogItemType.getClass();
        this.id = zv8Var;
        this.paragraph = zv8Var2;
        this.type = catalogItemType;
    }

    public static /* synthetic */ CatalogItemTargetInput copy$default(CatalogItemTargetInput catalogItemTargetInput, zv8 zv8Var, zv8 zv8Var2, CatalogItemType catalogItemType, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = catalogItemTargetInput.id;
        }
        if ((i & 2) != 0) {
            zv8Var2 = catalogItemTargetInput.paragraph;
        }
        if ((i & 4) != 0) {
            catalogItemType = catalogItemTargetInput.type;
        }
        return catalogItemTargetInput.copy(zv8Var, zv8Var2, catalogItemType);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getParagraph() {
        return this.paragraph;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final CatalogItemType getType() {
        return this.type;
    }

    public final CatalogItemTargetInput copy(zv8 id, zv8 paragraph, CatalogItemType type) {
        id.getClass();
        paragraph.getClass();
        type.getClass();
        return new CatalogItemTargetInput(id, paragraph, type);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogItemTargetInput)) {
            return false;
        }
        CatalogItemTargetInput catalogItemTargetInput = (CatalogItemTargetInput) other;
        return g76.L(this.id, catalogItemTargetInput.id) && g76.L(this.paragraph, catalogItemTargetInput.paragraph) && this.type == catalogItemTargetInput.type;
    }

    public final zv8 getId() {
        return this.id;
    }

    public final zv8 getParagraph() {
        return this.paragraph;
    }

    public final CatalogItemType getType() {
        return this.type;
    }

    public final int hashCode() {
        return this.type.hashCode() + lv8.h(this.paragraph, this.id.hashCode() * 31, 31);
    }

    public final String toString() {
        zv8 zv8Var = this.id;
        zv8 zv8Var2 = this.paragraph;
        CatalogItemType catalogItemType = this.type;
        StringBuilder sbW = ka1.w("CatalogItemTargetInput(id=", zv8Var, ", paragraph=", zv8Var2, ", type=");
        sbW.append(catalogItemType);
        sbW.append(")");
        return sbW.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ CatalogItemTargetInput(zv8 zv8Var, zv8 zv8Var2, CatalogItemType catalogItemType, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, catalogItemType);
    }
}
