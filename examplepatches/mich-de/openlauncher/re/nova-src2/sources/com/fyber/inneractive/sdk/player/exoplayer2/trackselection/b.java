package com.fyber.inneractive.sdk.player.exoplayer2.trackselection;

import android.os.SystemClock;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.source.y;
import java.util.Arrays;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public final y f30256a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30257b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f30258c;

    /* renamed from: d, reason: collision with root package name */
    public final o[] f30259d;

    /* renamed from: e, reason: collision with root package name */
    public final long[] f30260e;

    /* renamed from: f, reason: collision with root package name */
    public int f30261f;

    public b(y yVar, int... iArr) {
        if (iArr.length <= 0) {
            throw new IllegalStateException();
        }
        yVar.getClass();
        this.f30256a = yVar;
        int length = iArr.length;
        this.f30257b = length;
        this.f30259d = new o[length];
        int i5 = 0;
        for (int i11 = 0; i11 < iArr.length; i11++) {
            this.f30259d[i11] = yVar.f30245b[iArr[i11]];
        }
        Arrays.sort(this.f30259d, new a());
        this.f30258c = new int[this.f30257b];
        while (true) {
            int i12 = this.f30257b;
            if (i5 >= i12) {
                this.f30260e = new long[i12];
                return;
            } else {
                this.f30258c[i5] = yVar.a(this.f30259d[i5]);
                i5++;
            }
        }
    }

    public abstract int a();

    public final boolean a(int i5) {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        boolean z11 = this.f30260e[i5] > jElapsedRealtime;
        int i11 = 0;
        while (i11 < this.f30257b && !z11) {
            z11 = i11 != i5 && this.f30260e[i11] <= jElapsedRealtime;
            i11++;
        }
        if (!z11) {
            return false;
        }
        long[] jArr = this.f30260e;
        jArr[i5] = Math.max(jArr[i5], jElapsedRealtime + 60000);
        return true;
    }

    public abstract Object b();

    public abstract int c();

    public abstract void d();

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            b bVar = (b) obj;
            if (this.f30256a == bVar.f30256a && Arrays.equals(this.f30258c, bVar.f30258c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f30261f == 0) {
            this.f30261f = Arrays.hashCode(this.f30258c) + (System.identityHashCode(this.f30256a) * 31);
        }
        return this.f30261f;
    }
}
