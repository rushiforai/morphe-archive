package com.medium.android.graphql.type;

import defpackage.b09;
import defpackage.g76;
import defpackage.gy2;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\rJ\u0018\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0018\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0010JH\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00052\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001a\u001a\u00020\b2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\rR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001c\u001a\u0004\b\u001e\u0010\rR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b \u0010\u0010R\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00058\u0006¢\u0006\f\n\u0004\b\t\u0010\u001f\u001a\u0004\b!\u0010\u0010¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;", "", "", "startTime", "endTime", "Lzv8;", "", "interval", "", "missingAsZero", "<init>", "(JJLzv8;Lzv8;)V", "component1", "()J", "component2", "component3", "()Lzv8;", "component4", "copy", "(JJLzv8;Lzv8;)Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "equals", "(Ljava/lang/Object;)Z", "J", "getStartTime", "getEndTime", "Lzv8;", "getInterval", "getMissingAsZero", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserPostsAggregateStatsInput {
    private final long endTime;
    private final zv8 interval;
    private final zv8 missingAsZero;
    private final long startTime;

    public UserPostsAggregateStatsInput(long j, long j2, zv8 zv8Var, zv8 zv8Var2) {
        zv8Var.getClass();
        zv8Var2.getClass();
        this.startTime = j;
        this.endTime = j2;
        this.interval = zv8Var;
        this.missingAsZero = zv8Var2;
    }

    public static /* synthetic */ UserPostsAggregateStatsInput copy$default(UserPostsAggregateStatsInput userPostsAggregateStatsInput, long j, long j2, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            j = userPostsAggregateStatsInput.startTime;
        }
        long j3 = j;
        if ((i & 2) != 0) {
            j2 = userPostsAggregateStatsInput.endTime;
        }
        long j4 = j2;
        if ((i & 4) != 0) {
            zv8Var = userPostsAggregateStatsInput.interval;
        }
        zv8 zv8Var3 = zv8Var;
        if ((i & 8) != 0) {
            zv8Var2 = userPostsAggregateStatsInput.missingAsZero;
        }
        return userPostsAggregateStatsInput.copy(j3, j4, zv8Var3, zv8Var2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final long getStartTime() {
        return this.startTime;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final long getEndTime() {
        return this.endTime;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getInterval() {
        return this.interval;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getMissingAsZero() {
        return this.missingAsZero;
    }

    public final UserPostsAggregateStatsInput copy(long startTime, long endTime, zv8 interval, zv8 missingAsZero) {
        interval.getClass();
        missingAsZero.getClass();
        return new UserPostsAggregateStatsInput(startTime, endTime, interval, missingAsZero);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserPostsAggregateStatsInput)) {
            return false;
        }
        UserPostsAggregateStatsInput userPostsAggregateStatsInput = (UserPostsAggregateStatsInput) other;
        return this.startTime == userPostsAggregateStatsInput.startTime && this.endTime == userPostsAggregateStatsInput.endTime && g76.L(this.interval, userPostsAggregateStatsInput.interval) && g76.L(this.missingAsZero, userPostsAggregateStatsInput.missingAsZero);
    }

    public final long getEndTime() {
        return this.endTime;
    }

    public final zv8 getInterval() {
        return this.interval;
    }

    public final zv8 getMissingAsZero() {
        return this.missingAsZero;
    }

    public final long getStartTime() {
        return this.startTime;
    }

    public final int hashCode() {
        long j = this.startTime;
        long j2 = this.endTime;
        return this.missingAsZero.hashCode() + lv8.h(this.interval, ((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31, 31);
    }

    public final String toString() {
        long j = this.startTime;
        long j2 = this.endTime;
        zv8 zv8Var = this.interval;
        zv8 zv8Var2 = this.missingAsZero;
        StringBuilder sbD = b09.D("UserPostsAggregateStatsInput(startTime=", ", endTime=", j);
        sbD.append(j2);
        sbD.append(", interval=");
        sbD.append(zv8Var);
        sbD.append(", missingAsZero=");
        sbD.append(zv8Var2);
        sbD.append(")");
        return sbD.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ UserPostsAggregateStatsInput(long j, long j2, zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 4;
        xv8 xv8Var = xv8.a;
        this(j, j2, i2 != 0 ? xv8Var : zv8Var, (i & 8) != 0 ? xv8Var : zv8Var2);
    }
}
