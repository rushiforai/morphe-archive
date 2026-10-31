package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mkv;

import com.fyber.inneractive.sdk.player.exoplayer2.util.n;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final n f29431a = new n(8);

    /* renamed from: b, reason: collision with root package name */
    public int f29432b;

    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        int i5 = 0;
        bVar.a(this.f29431a.f30461a, 0, 1, false);
        int i11 = this.f29431a.f30461a[0] & 255;
        if (i11 == 0) {
            return Long.MIN_VALUE;
        }
        int i12 = 128;
        int i13 = 0;
        while ((i11 & i12) == 0) {
            i12 >>= 1;
            i13++;
        }
        int i14 = i11 & (~i12);
        bVar.a(this.f29431a.f30461a, 1, i13, false);
        while (i5 < i13) {
            i5++;
            i14 = (this.f29431a.f30461a[i5] & 255) + (i14 << 8);
        }
        this.f29432b = i13 + 1 + this.f29432b;
        return i14;
    }
}
