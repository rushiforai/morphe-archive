package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001B7\u0012\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\u0006¢\u0006\u0004\b\u000b\u0010\fJ\u001e\u0010\r\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0010JF\u0010\u0014\u001a\u00020\u00002\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0010J\u0010\u0010\u0017\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0012J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR%\u0010\u0005\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001c\u001a\u0004\b\u001d\u0010\u000eR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001e\u001a\u0004\b\u001f\u0010\u0010R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010 \u001a\u0004\b!\u0010\u0012R\u0017\u0010\n\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\n\u0010\u001e\u001a\u0004\b\"\u0010\u0010¨\u0006#"}, d2 = {"Lcom/medium/android/graphql/type/UserActivitiesConnectionInput;", "", "Lzv8;", "", "Lcom/medium/android/graphql/type/ProfileActivityType;", "activityTypes", "", "after", "", "first", "userId", "<init>", "(Lzv8;Ljava/lang/String;ILjava/lang/String;)V", "component1", "()Lzv8;", "component2", "()Ljava/lang/String;", "component3", "()I", "component4", "copy", "(Lzv8;Ljava/lang/String;ILjava/lang/String;)Lcom/medium/android/graphql/type/UserActivitiesConnectionInput;", "toString", "hashCode", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getActivityTypes", "Ljava/lang/String;", "getAfter", "I", "getFirst", "getUserId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserActivitiesConnectionInput {
    private final zv8 activityTypes;
    private final String after;
    private final int first;
    private final String userId;

    public UserActivitiesConnectionInput(zv8 zv8Var, String str, int i, String str2) {
        zv8Var.getClass();
        str.getClass();
        str2.getClass();
        this.activityTypes = zv8Var;
        this.after = str;
        this.first = i;
        this.userId = str2;
    }

    public static /* synthetic */ UserActivitiesConnectionInput copy$default(UserActivitiesConnectionInput userActivitiesConnectionInput, zv8 zv8Var, String str, int i, String str2, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            zv8Var = userActivitiesConnectionInput.activityTypes;
        }
        if ((i2 & 2) != 0) {
            str = userActivitiesConnectionInput.after;
        }
        if ((i2 & 4) != 0) {
            i = userActivitiesConnectionInput.first;
        }
        if ((i2 & 8) != 0) {
            str2 = userActivitiesConnectionInput.userId;
        }
        return userActivitiesConnectionInput.copy(zv8Var, str, i, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getActivityTypes() {
        return this.activityTypes;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getAfter() {
        return this.after;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final UserActivitiesConnectionInput copy(zv8 activityTypes, String after, int first, String userId) {
        activityTypes.getClass();
        after.getClass();
        userId.getClass();
        return new UserActivitiesConnectionInput(activityTypes, after, first, userId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserActivitiesConnectionInput)) {
            return false;
        }
        UserActivitiesConnectionInput userActivitiesConnectionInput = (UserActivitiesConnectionInput) other;
        return g76.L(this.activityTypes, userActivitiesConnectionInput.activityTypes) && g76.L(this.after, userActivitiesConnectionInput.after) && this.first == userActivitiesConnectionInput.first && g76.L(this.userId, userActivitiesConnectionInput.userId);
    }

    public final zv8 getActivityTypes() {
        return this.activityTypes;
    }

    public final String getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + ((wgd.o(this.activityTypes.hashCode() * 31, 31, this.after) + this.first) * 31);
    }

    public final String toString() {
        return "UserActivitiesConnectionInput(activityTypes=" + this.activityTypes + ", after=" + this.after + ", first=" + this.first + ", userId=" + this.userId + ")";
    }

    public /* synthetic */ UserActivitiesConnectionInput(zv8 zv8Var, String str, int i, String str2, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? xv8.a : zv8Var, str, i, str2);
    }
}
