package com.medium.android.graphql.type;

import com.medium.android.common.ui.Ezz.Plbho;
import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ,\u0010\r\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u000f\u0010\fJ\u0010\u0010\u0010\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0016\u001a\u0004\b\u0017\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0018\u001a\u0004\b\u0019\u0010\f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/type/LinkMetadataInput;", "", "Lzv8;", "", "httpStatus", "", "url", "<init>", "(Lzv8;Ljava/lang/String;)V", "component1", "()Lzv8;", "component2", "()Ljava/lang/String;", "copy", "(Lzv8;Ljava/lang/String;)Lcom/medium/android/graphql/type/LinkMetadataInput;", "toString", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getHttpStatus", "Ljava/lang/String;", "getUrl", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class LinkMetadataInput {
    private final zv8 httpStatus;
    private final String url;

    public LinkMetadataInput(zv8 zv8Var, String str) {
        zv8Var.getClass();
        str.getClass();
        this.httpStatus = zv8Var;
        this.url = str;
    }

    public static /* synthetic */ LinkMetadataInput copy$default(LinkMetadataInput linkMetadataInput, zv8 zv8Var, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = linkMetadataInput.httpStatus;
        }
        if ((i & 2) != 0) {
            str = linkMetadataInput.url;
        }
        return linkMetadataInput.copy(zv8Var, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getHttpStatus() {
        return this.httpStatus;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUrl() {
        return this.url;
    }

    public final LinkMetadataInput copy(zv8 httpStatus, String url) {
        httpStatus.getClass();
        url.getClass();
        return new LinkMetadataInput(httpStatus, url);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LinkMetadataInput)) {
            return false;
        }
        LinkMetadataInput linkMetadataInput = (LinkMetadataInput) other;
        return g76.L(this.httpStatus, linkMetadataInput.httpStatus) && g76.L(this.url, linkMetadataInput.url);
    }

    public final zv8 getHttpStatus() {
        return this.httpStatus;
    }

    public final String getUrl() {
        return this.url;
    }

    public final int hashCode() {
        return this.url.hashCode() + (this.httpStatus.hashCode() * 31);
    }

    public final String toString() {
        return Plbho.vSAiRXGblDEfc + this.httpStatus + ", url=" + this.url + ")";
    }

    public /* synthetic */ LinkMetadataInput(zv8 zv8Var, String str, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var, str);
    }
}
