package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class a implements q {

    /* renamed from: a, reason: collision with root package name */
    public final long[] f29127a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f29128b;

    /* renamed from: c, reason: collision with root package name */
    public final long f29129c;

    public a(int[] iArr, long[] jArr, long[] jArr2, long[] jArr3) {
        this.f29127a = jArr;
        this.f29128b = jArr3;
        int length = iArr.length;
        if (length <= 0) {
            this.f29129c = 0L;
        } else {
            int i5 = length - 1;
            this.f29129c = jArr2[i5] + jArr3[i5];
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return this.f29129c;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        return this.f29127a[z.a(this.f29128b, j11, true)];
    }
}
