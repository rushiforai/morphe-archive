package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B=\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0018\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\nJF\u0010\r\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u0019\u0010\nR\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0018\u001a\u0004\b\u001a\u0010\nR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0018\u001a\u0004\b\u001b\u0010\n¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/type/MixtapeMetadataInput;", "", "Lzv8;", "", "href", "mediaResourceId", "thumbnailImageId", "<init>", "(Lzv8;Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "component3", "copy", "(Lzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/MixtapeMetadataInput;", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getHref", "getMediaResourceId", "getThumbnailImageId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MixtapeMetadataInput {
    private final zv8 href;
    private final zv8 mediaResourceId;
    private final zv8 thumbnailImageId;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ MixtapeMetadataInput(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3);
    }

    public static /* synthetic */ MixtapeMetadataInput copy$default(MixtapeMetadataInput mixtapeMetadataInput, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = mixtapeMetadataInput.href;
        }
        if ((i & 2) != 0) {
            zv8Var2 = mixtapeMetadataInput.mediaResourceId;
        }
        if ((i & 4) != 0) {
            zv8Var3 = mixtapeMetadataInput.thumbnailImageId;
        }
        return mixtapeMetadataInput.copy(zv8Var, zv8Var2, zv8Var3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getHref() {
        return this.href;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getMediaResourceId() {
        return this.mediaResourceId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getThumbnailImageId() {
        return this.thumbnailImageId;
    }

    public final MixtapeMetadataInput copy(zv8 href, zv8 mediaResourceId, zv8 thumbnailImageId) {
        href.getClass();
        mediaResourceId.getClass();
        thumbnailImageId.getClass();
        return new MixtapeMetadataInput(href, mediaResourceId, thumbnailImageId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MixtapeMetadataInput)) {
            return false;
        }
        MixtapeMetadataInput mixtapeMetadataInput = (MixtapeMetadataInput) other;
        return g76.L(this.href, mixtapeMetadataInput.href) && g76.L(this.mediaResourceId, mixtapeMetadataInput.mediaResourceId) && g76.L(this.thumbnailImageId, mixtapeMetadataInput.thumbnailImageId);
    }

    public final zv8 getHref() {
        return this.href;
    }

    public final zv8 getMediaResourceId() {
        return this.mediaResourceId;
    }

    public final zv8 getThumbnailImageId() {
        return this.thumbnailImageId;
    }

    public final int hashCode() {
        return this.thumbnailImageId.hashCode() + lv8.h(this.mediaResourceId, this.href.hashCode() * 31, 31);
    }

    public final String toString() {
        zv8 zv8Var = this.href;
        zv8 zv8Var2 = this.mediaResourceId;
        return km4.B(ka1.w(AEVqIoD.azTfi, zv8Var, ", mediaResourceId=", zv8Var2, ", thumbnailImageId="), this.thumbnailImageId, ")");
    }

    public MixtapeMetadataInput(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        this.href = zv8Var;
        this.mediaResourceId = zv8Var2;
        this.thumbnailImageId = zv8Var3;
    }

    public MixtapeMetadataInput() {
        this(null, null, null, 7, null);
    }
}
