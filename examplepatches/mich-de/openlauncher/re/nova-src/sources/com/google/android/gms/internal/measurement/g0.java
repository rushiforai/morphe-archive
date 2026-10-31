package com.google.android.gms.internal.measurement;

import java.io.Closeable;

/* loaded from: classes3.dex */
public final class g0 implements Closeable {

    /* renamed from: b, reason: collision with root package name */
    public static final b.a3 f32549b = new b.a3(3);

    /* renamed from: a, reason: collision with root package name */
    public int f32550a;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        int i5 = this.f32550a;
        if (i5 <= 0) {
            throw new AssertionError("Mismatched calls to RecursionDepth (possible error in core library)");
        }
        this.f32550a = i5 - 1;
    }
}
