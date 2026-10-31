package com.moloco.sdk.internal.services;

import android.os.SystemClock;
import kotlin.Deprecated;

/* loaded from: classes.dex */
public final class J implements I {

    /* renamed from: a, reason: collision with root package name */
    public static final int f37636a = 0;

    @Override // com.moloco.sdk.internal.services.I
    public long a() {
        return System.currentTimeMillis();
    }

    @Override // com.moloco.sdk.internal.services.I
    public long elapsedRealtime() {
        return SystemClock.elapsedRealtime();
    }

    @Override // com.moloco.sdk.internal.services.I
    @Deprecated
    public long invoke() {
        return System.currentTimeMillis();
    }
}
