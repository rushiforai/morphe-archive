package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.km4;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001B1\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0005¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u000eJ\u0010\u0010\u0010\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u000eJ@\u0010\u0011\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u000eJ\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u0018\u001a\u00020\u00032\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u001a\u0004\b\u001b\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\u000eR\u0017\u0010\u0007\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001c\u001a\u0004\b\u001e\u0010\u000eR\u0017\u0010\b\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\b\u0010\u001c\u001a\u0004\b\u001f\u0010\u000e¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/type/ReportRepostInput;", "", "Lzv8;", "", "alsoBlockUser", "", "reason", "targetPostId", "targetUserID", "<init>", "(Lzv8;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "component1", "()Lzv8;", "component2", "()Ljava/lang/String;", "component3", "component4", "copy", "(Lzv8;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/type/ReportRepostInput;", "toString", "", "hashCode", "()I", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getAlsoBlockUser", "Ljava/lang/String;", "getReason", "getTargetPostId", "getTargetUserID", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ReportRepostInput {
    private final zv8 alsoBlockUser;
    private final String reason;
    private final String targetPostId;
    private final String targetUserID;

    public ReportRepostInput(zv8 zv8Var, String str, String str2, String str3) {
        zv8Var.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        this.alsoBlockUser = zv8Var;
        this.reason = str;
        this.targetPostId = str2;
        this.targetUserID = str3;
    }

    public static /* synthetic */ ReportRepostInput copy$default(ReportRepostInput reportRepostInput, zv8 zv8Var, String str, String str2, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = reportRepostInput.alsoBlockUser;
        }
        if ((i & 2) != 0) {
            str = reportRepostInput.reason;
        }
        if ((i & 4) != 0) {
            str2 = reportRepostInput.targetPostId;
        }
        if ((i & 8) != 0) {
            str3 = reportRepostInput.targetUserID;
        }
        return reportRepostInput.copy(zv8Var, str, str2, str3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getAlsoBlockUser() {
        return this.alsoBlockUser;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getReason() {
        return this.reason;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getTargetPostId() {
        return this.targetPostId;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getTargetUserID() {
        return this.targetUserID;
    }

    public final ReportRepostInput copy(zv8 alsoBlockUser, String reason, String targetPostId, String targetUserID) {
        alsoBlockUser.getClass();
        reason.getClass();
        targetPostId.getClass();
        targetUserID.getClass();
        return new ReportRepostInput(alsoBlockUser, reason, targetPostId, targetUserID);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ReportRepostInput)) {
            return false;
        }
        ReportRepostInput reportRepostInput = (ReportRepostInput) other;
        return g76.L(this.alsoBlockUser, reportRepostInput.alsoBlockUser) && g76.L(this.reason, reportRepostInput.reason) && g76.L(this.targetPostId, reportRepostInput.targetPostId) && g76.L(this.targetUserID, reportRepostInput.targetUserID);
    }

    public final zv8 getAlsoBlockUser() {
        return this.alsoBlockUser;
    }

    public final String getReason() {
        return this.reason;
    }

    public final String getTargetPostId() {
        return this.targetPostId;
    }

    public final String getTargetUserID() {
        return this.targetUserID;
    }

    public final int hashCode() {
        return this.targetUserID.hashCode() + wgd.o(wgd.o(this.alsoBlockUser.hashCode() * 31, 31, this.reason), 31, this.targetPostId);
    }

    public final String toString() {
        zv8 zv8Var = this.alsoBlockUser;
        String str = this.reason;
        String str2 = this.targetPostId;
        String str3 = this.targetUserID;
        StringBuilder sb = new StringBuilder("ReportRepostInput(alsoBlockUser=");
        sb.append(zv8Var);
        sb.append(", reason=");
        sb.append(str);
        sb.append(", targetPostId=");
        return km4.C(sb, str2, ", targetUserID=", str3, ")");
    }

    public /* synthetic */ ReportRepostInput(zv8 zv8Var, String str, String str2, String str3, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var, str, str2, str3);
    }
}
