package com.userleap.internal.data;

import defpackage.g76;
import defpackage.gy2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0005HÖ\u0001R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0014"}, d2 = {"Lcom/userleap/internal/data/ReplayStatus;", "", "state", "Lcom/userleap/internal/data/ReplayState;", "details", "", "(Lcom/userleap/internal/data/ReplayState;Ljava/lang/String;)V", "getDetails", "()Ljava/lang/String;", "getState", "()Lcom/userleap/internal/data/ReplayState;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final /* data */ class ReplayStatus {
    private final String details;
    private final ReplayState state;

    public ReplayStatus(ReplayState replayState, String str) {
        replayState.getClass();
        this.state = replayState;
        this.details = str;
    }

    public static /* synthetic */ ReplayStatus copy$default(ReplayStatus replayStatus, ReplayState replayState, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            replayState = replayStatus.state;
        }
        if ((i & 2) != 0) {
            str = replayStatus.details;
        }
        return replayStatus.copy(replayState, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final ReplayState getState() {
        return this.state;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getDetails() {
        return this.details;
    }

    public final ReplayStatus copy(ReplayState state, String details) {
        state.getClass();
        return new ReplayStatus(state, details);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ReplayStatus)) {
            return false;
        }
        ReplayStatus replayStatus = (ReplayStatus) other;
        return this.state == replayStatus.state && g76.L(this.details, replayStatus.details);
    }

    public final String getDetails() {
        return this.details;
    }

    public final ReplayState getState() {
        return this.state;
    }

    public int hashCode() {
        int iHashCode = this.state.hashCode() * 31;
        String str = this.details;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public String toString() {
        return "ReplayStatus(state=" + this.state + ", details=" + this.details + ")";
    }

    public /* synthetic */ ReplayStatus(ReplayState replayState, String str, int i, gy2 gy2Var) {
        this(replayState, (i & 2) != 0 ? null : str);
    }
}
