package com.google.android.gms.internal.measurement;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public final class ch extends vk.b0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32444a;

    @Override // vk.b0
    public final long r() {
        switch (this.f32444a) {
            case 0:
                return SystemClock.elapsedRealtimeNanos();
            default:
                return SystemClock.elapsedRealtime() * 1000000;
        }
    }
}
