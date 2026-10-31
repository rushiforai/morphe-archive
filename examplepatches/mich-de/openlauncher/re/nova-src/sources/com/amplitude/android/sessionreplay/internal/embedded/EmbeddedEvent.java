package com.amplitude.android.sessionreplay.internal.embedded;

import com.google.gson.r;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0007\b\u0000\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003R\"\u0010\u0005\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\"\u0010\f\u001a\u00020\u000b8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\f\u0010\r\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\"\u0010\u0013\u001a\u00020\u00128\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018¨\u0006\u0019"}, d2 = {"Lcom/amplitude/android/sessionreplay/internal/embedded/EmbeddedEvent;", b.f42142b, "<init>", "()V", b.f42142b, TTConst.TRACK_TYPE, "I", "getType", "()I", "setType", "(I)V", "Lcom/google/gson/r;", "data", "Lcom/google/gson/r;", "getData", "()Lcom/google/gson/r;", "setData", "(Lcom/google/gson/r;)V", b.f42142b, "timestamp", "J", "getTimestamp", "()J", "setTimestamp", "(J)V", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class EmbeddedEvent {
    private long timestamp;
    private int type = -1;
    private r data = new r();

    public final r getData() {
        return this.data;
    }

    public final long getTimestamp() {
        return this.timestamp;
    }

    public final int getType() {
        return this.type;
    }

    public final void setData(r rVar) {
        Intrinsics.g(rVar, "<set-?>");
        this.data = rVar;
    }

    public final void setTimestamp(long j11) {
        this.timestamp = j11;
    }

    public final void setType(int i5) {
        this.type = i5;
    }
}
