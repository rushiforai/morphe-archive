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
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ>\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00042\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\nR\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u001b\u0010\fR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001c\u0010\f¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/type/LogGateExposureInput;", "", "", "gateId", "Lzv8;", "postId", "publicationId", "<init>", "(Ljava/lang/String;Lzv8;Lzv8;)V", "component1", "()Ljava/lang/String;", "component2", "()Lzv8;", "component3", "copy", "(Ljava/lang/String;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/LogGateExposureInput;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getGateId", "Lzv8;", "getPostId", "getPublicationId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class LogGateExposureInput {
    private final String gateId;
    private final zv8 postId;
    private final zv8 publicationId;

    public LogGateExposureInput(String str, zv8 zv8Var, zv8 zv8Var2) {
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        this.gateId = str;
        this.postId = zv8Var;
        this.publicationId = zv8Var2;
    }

    public static /* synthetic */ LogGateExposureInput copy$default(LogGateExposureInput logGateExposureInput, String str, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = logGateExposureInput.gateId;
        }
        if ((i & 2) != 0) {
            zv8Var = logGateExposureInput.postId;
        }
        if ((i & 4) != 0) {
            zv8Var2 = logGateExposureInput.publicationId;
        }
        return logGateExposureInput.copy(str, zv8Var, zv8Var2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getGateId() {
        return this.gateId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getPublicationId() {
        return this.publicationId;
    }

    public final LogGateExposureInput copy(String gateId, zv8 postId, zv8 publicationId) {
        gateId.getClass();
        postId.getClass();
        publicationId.getClass();
        return new LogGateExposureInput(gateId, postId, publicationId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LogGateExposureInput)) {
            return false;
        }
        LogGateExposureInput logGateExposureInput = (LogGateExposureInput) other;
        return g76.L(this.gateId, logGateExposureInput.gateId) && g76.L(this.postId, logGateExposureInput.postId) && g76.L(this.publicationId, logGateExposureInput.publicationId);
    }

    public final String getGateId() {
        return this.gateId;
    }

    public final zv8 getPostId() {
        return this.postId;
    }

    public final zv8 getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return this.publicationId.hashCode() + lv8.h(this.postId, this.gateId.hashCode() * 31, 31);
    }

    public final String toString() {
        String str = this.gateId;
        zv8 zv8Var = this.postId;
        zv8 zv8Var2 = this.publicationId;
        StringBuilder sb = new StringBuilder("LogGateExposureInput(gateId=");
        sb.append(str);
        sb.append(", postId=");
        sb.append(zv8Var);
        sb.append(", publicationId=");
        return km4.B(sb, zv8Var2, ")");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ LogGateExposureInput(String str, zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 2;
        xv8 xv8Var = xv8.a;
        this(str, i2 != 0 ? xv8Var : zv8Var, (i & 4) != 0 ? xv8Var : zv8Var2);
    }
}
