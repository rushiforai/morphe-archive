package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;

/* loaded from: classes3.dex */
public final class x implements c {

    /* renamed from: d, reason: collision with root package name */
    public w f29086d;

    /* renamed from: g, reason: collision with root package name */
    public ByteBuffer f29089g;

    /* renamed from: h, reason: collision with root package name */
    public ShortBuffer f29090h;

    /* renamed from: i, reason: collision with root package name */
    public ByteBuffer f29091i;

    /* renamed from: j, reason: collision with root package name */
    public long f29092j;

    /* renamed from: k, reason: collision with root package name */
    public long f29093k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f29094l;

    /* renamed from: e, reason: collision with root package name */
    public float f29087e = 1.0f;

    /* renamed from: f, reason: collision with root package name */
    public float f29088f = 1.0f;

    /* renamed from: b, reason: collision with root package name */
    public int f29084b = -1;

    /* renamed from: c, reason: collision with root package name */
    public int f29085c = -1;

    public x() {
        ByteBuffer byteBuffer = c.f28982a;
        this.f29089g = byteBuffer;
        this.f29090h = byteBuffer.asShortBuffer();
        this.f29091i = byteBuffer;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean a(int i5, int i11, int i12) throws b {
        if (i12 != 2) {
            throw new b(i5, i11, i12);
        }
        if (this.f29085c == i5 && this.f29084b == i11) {
            return false;
        }
        this.f29085c = i5;
        this.f29084b = i11;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void b() {
        int i5;
        w wVar = this.f29086d;
        int i11 = wVar.f29076q;
        float f11 = wVar.o;
        float f12 = wVar.f29075p;
        int i12 = wVar.f29077r + ((int) ((((i11 / (f11 / f12)) + wVar.f29078s) / f12) + 0.5f));
        wVar.a((wVar.f29066e * 2) + i11);
        int i13 = 0;
        while (true) {
            i5 = wVar.f29066e * 2;
            int i14 = wVar.f29063b;
            if (i13 >= i5 * i14) {
                break;
            }
            wVar.f29069h[(i14 * i11) + i13] = 0;
            i13++;
        }
        wVar.f29076q = i5 + wVar.f29076q;
        wVar.a();
        if (wVar.f29077r > i12) {
            wVar.f29077r = i12;
        }
        wVar.f29076q = 0;
        wVar.f29079t = 0;
        wVar.f29078s = 0;
        this.f29094l = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean c() {
        if (!this.f29094l) {
            return false;
        }
        w wVar = this.f29086d;
        return wVar == null || wVar.f29077r == 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean d() {
        return Math.abs(this.f29087e - 1.0f) >= 0.01f || Math.abs(this.f29088f - 1.0f) >= 0.01f;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final int e() {
        return this.f29084b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void f() {
        this.f29086d = null;
        ByteBuffer byteBuffer = c.f28982a;
        this.f29089g = byteBuffer;
        this.f29090h = byteBuffer.asShortBuffer();
        this.f29091i = byteBuffer;
        this.f29084b = -1;
        this.f29085c = -1;
        this.f29092j = 0L;
        this.f29093k = 0L;
        this.f29094l = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void flush() {
        w wVar = new w(this.f29085c, this.f29084b);
        this.f29086d = wVar;
        wVar.o = this.f29087e;
        wVar.f29075p = this.f29088f;
        this.f29091i = c.f28982a;
        this.f29092j = 0L;
        this.f29093k = 0L;
        this.f29094l = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void a(ByteBuffer byteBuffer) {
        if (byteBuffer.hasRemaining()) {
            ShortBuffer shortBufferAsShortBuffer = byteBuffer.asShortBuffer();
            int iRemaining = byteBuffer.remaining();
            this.f29092j += iRemaining;
            w wVar = this.f29086d;
            wVar.getClass();
            int iRemaining2 = shortBufferAsShortBuffer.remaining();
            int i5 = wVar.f29063b;
            int i11 = iRemaining2 / i5;
            wVar.a(i11);
            shortBufferAsShortBuffer.get(wVar.f29069h, wVar.f29076q * wVar.f29063b, ((i5 * i11) * 2) / 2);
            wVar.f29076q += i11;
            wVar.a();
            byteBuffer.position(byteBuffer.position() + iRemaining);
        }
        int i12 = this.f29086d.f29077r * this.f29084b * 2;
        if (i12 > 0) {
            if (this.f29089g.capacity() < i12) {
                ByteBuffer byteBufferOrder = ByteBuffer.allocateDirect(i12).order(ByteOrder.nativeOrder());
                this.f29089g = byteBufferOrder;
                this.f29090h = byteBufferOrder.asShortBuffer();
            } else {
                this.f29089g.clear();
                this.f29090h.clear();
            }
            w wVar2 = this.f29086d;
            ShortBuffer shortBuffer = this.f29090h;
            wVar2.getClass();
            int iMin = Math.min(shortBuffer.remaining() / wVar2.f29063b, wVar2.f29077r);
            shortBuffer.put(wVar2.f29071j, 0, wVar2.f29063b * iMin);
            int i13 = wVar2.f29077r - iMin;
            wVar2.f29077r = i13;
            short[] sArr = wVar2.f29071j;
            int i14 = wVar2.f29063b;
            System.arraycopy(sArr, iMin * i14, sArr, 0, i13 * i14);
            this.f29093k += i12;
            this.f29089g.limit(i12);
            this.f29091i = this.f29089g;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final ByteBuffer a() {
        ByteBuffer byteBuffer = this.f29091i;
        this.f29091i = c.f28982a;
        return byteBuffer;
    }
}
