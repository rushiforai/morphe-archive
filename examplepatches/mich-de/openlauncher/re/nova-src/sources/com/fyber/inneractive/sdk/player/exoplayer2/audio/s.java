package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class s implements c {

    /* renamed from: b, reason: collision with root package name */
    public int f29044b;

    /* renamed from: c, reason: collision with root package name */
    public int f29045c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f29046d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29047e;

    /* renamed from: f, reason: collision with root package name */
    public int[] f29048f;

    /* renamed from: g, reason: collision with root package name */
    public ByteBuffer f29049g;

    /* renamed from: h, reason: collision with root package name */
    public ByteBuffer f29050h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f29051i;

    public s() {
        ByteBuffer byteBuffer = c.f28982a;
        this.f29049g = byteBuffer;
        this.f29050h = byteBuffer;
        this.f29044b = -1;
        this.f29045c = -1;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean a(int i5, int i11, int i12) throws b {
        boolean zEquals = Arrays.equals(this.f29046d, this.f29048f);
        boolean z11 = !zEquals;
        int[] iArr = this.f29046d;
        this.f29048f = iArr;
        if (iArr == null) {
            this.f29047e = false;
            return z11;
        }
        if (i12 != 2) {
            throw new b(i5, i11, i12);
        }
        if (zEquals && this.f29045c == i5 && this.f29044b == i11) {
            return false;
        }
        this.f29045c = i5;
        this.f29044b = i11;
        this.f29047e = i11 != iArr.length;
        int i13 = 0;
        while (true) {
            int[] iArr2 = this.f29048f;
            if (i13 >= iArr2.length) {
                return true;
            }
            int i14 = iArr2[i13];
            if (i14 >= i11) {
                throw new b(i5, i11, i12);
            }
            this.f29047e = (i14 != i13) | this.f29047e;
            i13++;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void b() {
        this.f29051i = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean c() {
        return this.f29051i && this.f29050h == c.f28982a;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final boolean d() {
        return this.f29047e;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final int e() {
        int[] iArr = this.f29048f;
        return iArr == null ? this.f29044b : iArr.length;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void f() {
        ByteBuffer byteBuffer = c.f28982a;
        this.f29050h = byteBuffer;
        this.f29051i = false;
        this.f29049g = byteBuffer;
        this.f29044b = -1;
        this.f29045c = -1;
        this.f29048f = null;
        this.f29047e = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void flush() {
        this.f29050h = c.f28982a;
        this.f29051i = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final void a(ByteBuffer byteBuffer) {
        int iPosition = byteBuffer.position();
        int iLimit = byteBuffer.limit();
        int length = ((iLimit - iPosition) / (this.f29044b * 2)) * this.f29048f.length * 2;
        if (this.f29049g.capacity() < length) {
            this.f29049g = ByteBuffer.allocateDirect(length).order(ByteOrder.nativeOrder());
        } else {
            this.f29049g.clear();
        }
        while (iPosition < iLimit) {
            for (int i5 : this.f29048f) {
                this.f29049g.putShort(byteBuffer.getShort((i5 * 2) + iPosition));
            }
            iPosition += this.f29044b * 2;
        }
        byteBuffer.position(iLimit);
        this.f29049g.flip();
        this.f29050h = this.f29049g;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.c
    public final ByteBuffer a() {
        ByteBuffer byteBuffer = this.f29050h;
        this.f29050h = c.f28982a;
        return byteBuffer;
    }
}
