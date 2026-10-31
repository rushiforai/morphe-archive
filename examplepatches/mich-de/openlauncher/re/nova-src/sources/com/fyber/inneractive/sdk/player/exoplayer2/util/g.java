package com.fyber.inneractive.sdk.player.exoplayer2.util;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public int f30439a;

    /* renamed from: b, reason: collision with root package name */
    public long[] f30440b = new long[32];

    public final void a(long j11) {
        int i5 = this.f30439a;
        long[] jArr = this.f30440b;
        if (i5 == jArr.length) {
            this.f30440b = Arrays.copyOf(jArr, i5 * 2);
        }
        long[] jArr2 = this.f30440b;
        int i11 = this.f30439a;
        this.f30439a = i11 + 1;
        jArr2[i11] = j11;
    }
}
