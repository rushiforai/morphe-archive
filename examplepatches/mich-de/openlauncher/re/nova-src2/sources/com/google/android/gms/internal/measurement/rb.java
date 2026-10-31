package com.google.android.gms.internal.measurement;

import java.util.concurrent.ThreadFactory;

/* loaded from: classes3.dex */
public final /* synthetic */ class rb implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ rb f33033a = new rb();

    @Override // java.util.concurrent.ThreadFactory
    public final /* synthetic */ Thread newThread(Runnable runnable) {
        Object obj = ob.f32917j;
        return new Thread(runnable, "ProcessStablePhenotypeFlag");
    }
}
