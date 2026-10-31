package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes3.dex */
public final class v implements c {

    /* renamed from: b, reason: collision with root package name */
    public int f29056b = -1;

    /* renamed from: c, reason: collision with root package name */
    public int f29057c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f29058d = 0;

    /* renamed from: e, reason: collision with root package name */
    public ByteBuffer f29059e;

    /* renamed from: f, reason: collision with root package name */
    public ByteBuffer f29060f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f29061g;

    public v() {
        ByteBuffer byteBuffer = c.f28982a;
        this.f29059e = byteBuffer;
        this.f29060f = byteBuffer;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean a(int i5, int i11, int i12) throws b {
        if (i12 != 3 && i12 != 2 && i12 != Integer.MIN_VALUE && i12 != 1073741824) {
            throw new b(i5, i11, i12);
        }
        if (this.f29056b == i5 && this.f29057c == i11 && this.f29058d == i12) {
            return false;
        }
        this.f29056b = i5;
        this.f29057c = i11;
        this.f29058d = i12;
        if (i12 != 2) {
            return true;
        }
        this.f29059e = c.f28982a;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void b() {
        this.f29061g = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean c() {
        return this.f29061g && this.f29060f == c.f28982a;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean d() {
        int i5 = this.f29058d;
        return (i5 == 0 || i5 == 2) ? false : true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final int e() {
        return this.f29057c;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void f() {
        ByteBuffer byteBuffer = c.f28982a;
        this.f29060f = byteBuffer;
        this.f29061g = false;
        this.f29059e = byteBuffer;
        this.f29056b = -1;
        this.f29057c = -1;
        this.f29058d = 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void flush() {
        this.f29060f = c.f28982a;
        this.f29061g = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0045  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0083 A[ADDED_TO_REGION, LOOP:2: B:25:0x0083->B:26:0x0085, LOOP_START, PHI: r0
      0x0083: PHI (r0v1 int) = (r0v0 int), (r0v2 int) binds: [B:16:0x0043, B:26:0x0085] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(ByteBuffer byteBuffer) {
        int i5;
        int i11;
        int iPosition = byteBuffer.position();
        int iLimit = byteBuffer.limit();
        int i12 = iLimit - iPosition;
        int i13 = this.f29058d;
        if (i13 == Integer.MIN_VALUE) {
            i12 /= 3;
        } else {
            if (i13 != 3) {
                if (i13 == 1073741824) {
                    i5 = i12 / 2;
                } else {
                    throw new IllegalStateException();
                }
            }
            if (this.f29059e.capacity() >= i5) {
                this.f29059e = ByteBuffer.allocateDirect(i5).order(ByteOrder.nativeOrder());
            } else {
                this.f29059e.clear();
            }
            i11 = this.f29058d;
            if (i11 != Integer.MIN_VALUE) {
                while (iPosition < iLimit) {
                    this.f29059e.put(byteBuffer.get(iPosition + 1));
                    this.f29059e.put(byteBuffer.get(iPosition + 2));
                    iPosition += 3;
                }
            } else if (i11 == 3) {
                while (iPosition < iLimit) {
                    this.f29059e.put((byte) 0);
                    this.f29059e.put((byte) ((byteBuffer.get(iPosition) & 255) - 128));
                    iPosition++;
                }
            } else {
                if (i11 != 1073741824) {
                    throw new IllegalStateException();
                }
                while (iPosition < iLimit) {
                    this.f29059e.put(byteBuffer.get(iPosition + 2));
                    this.f29059e.put(byteBuffer.get(iPosition + 3));
                    iPosition += 4;
                }
            }
            byteBuffer.position(byteBuffer.limit());
            this.f29059e.flip();
            this.f29060f = this.f29059e;
        }
        i5 = i12 * 2;
        if (this.f29059e.capacity() >= i5) {
        }
        i11 = this.f29058d;
        if (i11 != Integer.MIN_VALUE) {
        }
        byteBuffer.position(byteBuffer.limit());
        this.f29059e.flip();
        this.f29060f = this.f29059e;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final ByteBuffer a() {
        ByteBuffer byteBuffer = this.f29060f;
        this.f29060f = c.f28982a;
        return byteBuffer;
    }
}
