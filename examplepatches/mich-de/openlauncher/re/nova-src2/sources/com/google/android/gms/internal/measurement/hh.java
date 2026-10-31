package com.google.android.gms.internal.measurement;

import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes3.dex */
public final class hh extends xh {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f32616d = 0;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicLong f32617c = new AtomicLong(-1);

    static {
        new eh(1);
    }

    @Override // com.google.android.gms.internal.measurement.xh
    public final void a() {
        AtomicLong atomicLong = this.f32617c;
        atomicLong.set(Math.max(-atomicLong.get(), 0L));
    }
}
