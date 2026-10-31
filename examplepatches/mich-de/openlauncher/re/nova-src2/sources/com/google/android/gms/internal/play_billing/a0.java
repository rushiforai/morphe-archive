package com.google.android.gms.internal.play_billing;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public final class a0 extends f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33347a;

    @Override // com.google.android.gms.internal.play_billing.f0
    public final long a() {
        switch (this.f33347a) {
            case 0:
                return SystemClock.elapsedRealtimeNanos();
            default:
                return SystemClock.elapsedRealtime() * 1000000;
        }
    }
}
