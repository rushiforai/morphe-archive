package com.fyber.inneractive.sdk.util;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class v0 extends BufferedInputStream {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AtomicInteger f31237a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v0(InputStream inputStream, AtomicInteger atomicInteger) {
        super(inputStream);
        this.f31237a = atomicInteger;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized int read(byte[] bArr, int i5, int i11) {
        int i12;
        i12 = super.read(bArr, i5, i11);
        if (i12 != -1) {
            this.f31237a.getAndAdd(i12);
        }
        return i12;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized void reset() {
        this.f31237a.set(0);
        super.reset();
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public final synchronized long skip(long j11) {
        long jSkip;
        jSkip = super.skip(j11);
        this.f31237a.addAndGet((int) jSkip);
        return jSkip;
    }
}
