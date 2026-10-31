package com.fyber.inneractive.sdk.player.exoplayer2.decoder;

import h6.c1;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public int f29111a;

    /* renamed from: c, reason: collision with root package name */
    public ByteBuffer f29113c;

    /* renamed from: d, reason: collision with root package name */
    public long f29114d;

    /* renamed from: b, reason: collision with root package name */
    public final b f29112b = new b();

    /* renamed from: e, reason: collision with root package name */
    public final int f29115e = 0;

    public final void a() {
        this.f29111a = 0;
        ByteBuffer byteBuffer = this.f29113c;
        if (byteBuffer != null) {
            byteBuffer.clear();
        }
    }

    public final boolean b(int i5) {
        return (this.f29111a & i5) == i5;
    }

    public final ByteBuffer a(int i5) {
        int i11 = this.f29115e;
        if (i11 == 1) {
            return ByteBuffer.allocate(i5);
        }
        if (i11 == 2) {
            return ByteBuffer.allocateDirect(i5);
        }
        ByteBuffer byteBuffer = this.f29113c;
        throw new IllegalStateException(c1.n(byteBuffer == null ? 0 : byteBuffer.capacity(), "Buffer too small (", " < ", i5, ")"));
    }
}
