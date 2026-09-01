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
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001BE\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0018\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\fJ\u0010\u0010\u000f\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010JP\u0010\u0011\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u0018\u001a\u00020\u00032\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u001a\u0004\b\u0004\u0010\fR\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u0005\u0010\fR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001b\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\u001c\u001a\u0004\b\u001d\u0010\u0010¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;", "", "Lzv8;", "", "isDistributable", "isResponsePublishedToProfile", "notifyEmailSubscribers", "", "postId", "<init>", "(Lzv8;Lzv8;Lzv8;Ljava/lang/String;)V", "component1", "()Lzv8;", "component2", "component3", "component4", "()Ljava/lang/String;", "copy", "(Lzv8;Lzv8;Lzv8;Ljava/lang/String;)Lcom/medium/android/graphql/type/SetPostDistributionSettingsInput;", "toString", "", "hashCode", "()I", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getNotifyEmailSubscribers", "Ljava/lang/String;", "getPostId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostDistributionSettingsInput {
    private final zv8 isDistributable;
    private final zv8 isResponsePublishedToProfile;
    private final zv8 notifyEmailSubscribers;
    private final String postId;

    public SetPostDistributionSettingsInput(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, String str) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        str.getClass();
        this.isDistributable = zv8Var;
        this.isResponsePublishedToProfile = zv8Var2;
        this.notifyEmailSubscribers = zv8Var3;
        this.postId = str;
    }

    public static /* synthetic */ SetPostDistributionSettingsInput copy$default(SetPostDistributionSettingsInput setPostDistributionSettingsInput, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = setPostDistributionSettingsInput.isDistributable;
        }
        if ((i & 2) != 0) {
            zv8Var2 = setPostDistributionSettingsInput.isResponsePublishedToProfile;
        }
        if ((i & 4) != 0) {
            zv8Var3 = setPostDistributionSettingsInput.notifyEmailSubscribers;
        }
        if ((i & 8) != 0) {
            str = setPostDistributionSettingsInput.postId;
        }
        return setPostDistributionSettingsInput.copy(zv8Var, zv8Var2, zv8Var3, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getIsDistributable() {
        return this.isDistributable;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getIsResponsePublishedToProfile() {
        return this.isResponsePublishedToProfile;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getNotifyEmailSubscribers() {
        return this.notifyEmailSubscribers;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final SetPostDistributionSettingsInput copy(zv8 isDistributable, zv8 isResponsePublishedToProfile, zv8 notifyEmailSubscribers, String postId) {
        isDistributable.getClass();
        isResponsePublishedToProfile.getClass();
        notifyEmailSubscribers.getClass();
        postId.getClass();
        return new SetPostDistributionSettingsInput(isDistributable, isResponsePublishedToProfile, notifyEmailSubscribers, postId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SetPostDistributionSettingsInput)) {
            return false;
        }
        SetPostDistributionSettingsInput setPostDistributionSettingsInput = (SetPostDistributionSettingsInput) other;
        return g76.L(this.isDistributable, setPostDistributionSettingsInput.isDistributable) && g76.L(this.isResponsePublishedToProfile, setPostDistributionSettingsInput.isResponsePublishedToProfile) && g76.L(this.notifyEmailSubscribers, setPostDistributionSettingsInput.notifyEmailSubscribers) && g76.L(this.postId, setPostDistributionSettingsInput.postId);
    }

    public final zv8 getNotifyEmailSubscribers() {
        return this.notifyEmailSubscribers;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode() + lv8.h(this.notifyEmailSubscribers, lv8.h(this.isResponsePublishedToProfile, this.isDistributable.hashCode() * 31, 31), 31);
    }

    public final zv8 isDistributable() {
        return this.isDistributable;
    }

    public final zv8 isResponsePublishedToProfile() {
        return this.isResponsePublishedToProfile;
    }

    public final String toString() {
        zv8 zv8Var = this.isDistributable;
        zv8 zv8Var2 = this.isResponsePublishedToProfile;
        zv8 zv8Var3 = this.notifyEmailSubscribers;
        String str = this.postId;
        StringBuilder sbW = ka1.w("SetPostDistributionSettingsInput(isDistributable=", zv8Var, ", isResponsePublishedToProfile=", zv8Var2, ", notifyEmailSubscribers=");
        sbW.append(zv8Var3);
        sbW.append(", postId=");
        sbW.append(str);
        sbW.append(")");
        return sbW.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SetPostDistributionSettingsInput(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, String str, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3, str);
    }
}
