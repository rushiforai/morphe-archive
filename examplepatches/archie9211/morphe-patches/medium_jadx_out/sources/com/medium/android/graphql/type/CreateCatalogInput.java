package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001B1\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u0018\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J@\u0010\u0014\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u000fJ\u0010\u0010\u0018\u001a\u00020\u0017HÖ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001e\u001a\u0004\b\u001f\u0010\rR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b!\u0010\u000fR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\"\u001a\u0004\b#\u0010\u0011R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010$\u001a\u0004\b%\u0010\u0013¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/type/CreateCatalogInput;", "", "Lzv8;", "", "description", "title", "Lcom/medium/android/graphql/type/CatalogType;", "type", "Lcom/medium/android/graphql/type/CatalogVisibility;", "visibility", "<init>", "(Lzv8;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogType;Lcom/medium/android/graphql/type/CatalogVisibility;)V", "component1", "()Lzv8;", "component2", "()Ljava/lang/String;", "component3", "()Lcom/medium/android/graphql/type/CatalogType;", "component4", "()Lcom/medium/android/graphql/type/CatalogVisibility;", "copy", "(Lzv8;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogType;Lcom/medium/android/graphql/type/CatalogVisibility;)Lcom/medium/android/graphql/type/CreateCatalogInput;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getDescription", "Ljava/lang/String;", "getTitle", "Lcom/medium/android/graphql/type/CatalogType;", "getType", "Lcom/medium/android/graphql/type/CatalogVisibility;", "getVisibility", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CreateCatalogInput {
    private final zv8 description;
    private final String title;
    private final CatalogType type;
    private final CatalogVisibility visibility;

    public CreateCatalogInput(zv8 zv8Var, String str, CatalogType catalogType, CatalogVisibility catalogVisibility) {
        zv8Var.getClass();
        str.getClass();
        catalogType.getClass();
        catalogVisibility.getClass();
        this.description = zv8Var;
        this.title = str;
        this.type = catalogType;
        this.visibility = catalogVisibility;
    }

    public static /* synthetic */ CreateCatalogInput copy$default(CreateCatalogInput createCatalogInput, zv8 zv8Var, String str, CatalogType catalogType, CatalogVisibility catalogVisibility, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = createCatalogInput.description;
        }
        if ((i & 2) != 0) {
            str = createCatalogInput.title;
        }
        if ((i & 4) != 0) {
            catalogType = createCatalogInput.type;
        }
        if ((i & 8) != 0) {
            catalogVisibility = createCatalogInput.visibility;
        }
        return createCatalogInput.copy(zv8Var, str, catalogType, catalogVisibility);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getDescription() {
        return this.description;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final CatalogType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final CatalogVisibility getVisibility() {
        return this.visibility;
    }

    public final CreateCatalogInput copy(zv8 description, String title, CatalogType type, CatalogVisibility visibility) {
        description.getClass();
        title.getClass();
        type.getClass();
        visibility.getClass();
        return new CreateCatalogInput(description, title, type, visibility);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateCatalogInput)) {
            return false;
        }
        CreateCatalogInput createCatalogInput = (CreateCatalogInput) other;
        return g76.L(this.description, createCatalogInput.description) && g76.L(this.title, createCatalogInput.title) && this.type == createCatalogInput.type && this.visibility == createCatalogInput.visibility;
    }

    public final zv8 getDescription() {
        return this.description;
    }

    public final String getTitle() {
        return this.title;
    }

    public final CatalogType getType() {
        return this.type;
    }

    public final CatalogVisibility getVisibility() {
        return this.visibility;
    }

    public final int hashCode() {
        return this.visibility.hashCode() + ((this.type.hashCode() + wgd.o(this.description.hashCode() * 31, 31, this.title)) * 31);
    }

    public final String toString() {
        return "CreateCatalogInput(description=" + this.description + ", title=" + this.title + ", type=" + this.type + ", visibility=" + this.visibility + ")";
    }

    public /* synthetic */ CreateCatalogInput(zv8 zv8Var, String str, CatalogType catalogType, CatalogVisibility catalogVisibility, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var, str, catalogType, catalogVisibility);
    }
}
