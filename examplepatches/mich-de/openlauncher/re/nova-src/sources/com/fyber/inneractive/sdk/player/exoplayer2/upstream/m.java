package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.t f30376a = new com.fyber.inneractive.sdk.player.exoplayer2.util.t();

    /* renamed from: b, reason: collision with root package name */
    public int f30377b;

    /* renamed from: c, reason: collision with root package name */
    public long f30378c;

    /* renamed from: d, reason: collision with root package name */
    public long f30379d;

    /* renamed from: e, reason: collision with root package name */
    public long f30380e;

    /* renamed from: f, reason: collision with root package name */
    public long f30381f;

    public final synchronized void a() {
        com.fyber.inneractive.sdk.player.exoplayer2.util.s sVar;
        int i5;
        try {
            if (this.f30377b <= 0) {
                throw new IllegalStateException();
            }
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            int i11 = (int) (jElapsedRealtime - this.f30378c);
            long j11 = i11;
            this.f30380e += j11;
            long j12 = this.f30381f;
            long j13 = this.f30379d;
            this.f30381f = j12 + j13;
            if (i11 > 0) {
                float f11 = (8000 * j13) / j11;
                com.fyber.inneractive.sdk.player.exoplayer2.util.t tVar = this.f30376a;
                int iSqrt = (int) Math.sqrt(j13);
                if (tVar.f30477d != 1) {
                    Collections.sort(tVar.f30475b, com.fyber.inneractive.sdk.player.exoplayer2.util.t.f30472h);
                    tVar.f30477d = 1;
                }
                int i12 = tVar.f30480g;
                if (i12 > 0) {
                    com.fyber.inneractive.sdk.player.exoplayer2.util.s[] sVarArr = tVar.f30476c;
                    int i13 = i12 - 1;
                    tVar.f30480g = i13;
                    sVar = sVarArr[i13];
                } else {
                    sVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.s();
                }
                int i14 = tVar.f30478e;
                tVar.f30478e = i14 + 1;
                sVar.f30469a = i14;
                sVar.f30470b = iSqrt;
                sVar.f30471c = f11;
                tVar.f30475b.add(sVar);
                tVar.f30479f += iSqrt;
                while (true) {
                    int i15 = tVar.f30479f;
                    int i16 = tVar.f30474a;
                    i5 = 0;
                    if (i15 <= i16) {
                        break;
                    }
                    int i17 = i15 - i16;
                    com.fyber.inneractive.sdk.player.exoplayer2.util.s sVar2 = (com.fyber.inneractive.sdk.player.exoplayer2.util.s) tVar.f30475b.get(0);
                    int i18 = sVar2.f30470b;
                    if (i18 <= i17) {
                        tVar.f30479f -= i18;
                        tVar.f30475b.remove(0);
                        int i19 = tVar.f30480g;
                        if (i19 < 5) {
                            com.fyber.inneractive.sdk.player.exoplayer2.util.s[] sVarArr2 = tVar.f30476c;
                            tVar.f30480g = i19 + 1;
                            sVarArr2[i19] = sVar2;
                        }
                    } else {
                        sVar2.f30470b = i18 - i17;
                        tVar.f30479f -= i17;
                    }
                }
                if (this.f30380e >= 2000 || this.f30381f >= 524288) {
                    com.fyber.inneractive.sdk.player.exoplayer2.util.t tVar2 = this.f30376a;
                    if (tVar2.f30477d != 0) {
                        Collections.sort(tVar2.f30475b, com.fyber.inneractive.sdk.player.exoplayer2.util.t.f30473i);
                        tVar2.f30477d = 0;
                    }
                    float f12 = 0.5f * tVar2.f30479f;
                    int i21 = 0;
                    while (true) {
                        if (i5 < tVar2.f30475b.size()) {
                            i21 += ((com.fyber.inneractive.sdk.player.exoplayer2.util.s) tVar2.f30475b.get(i5)).f30470b;
                            if (i21 >= f12) {
                                break;
                            } else {
                                i5++;
                            }
                        } else if (!tVar2.f30475b.isEmpty()) {
                            ArrayList arrayList = tVar2.f30475b;
                            float f13 = ((com.fyber.inneractive.sdk.player.exoplayer2.util.s) arrayList.get(arrayList.size() - 1)).f30471c;
                        }
                    }
                }
            }
            int i22 = this.f30377b - 1;
            this.f30377b = i22;
            if (i22 > 0) {
                this.f30378c = jElapsedRealtime;
            }
            this.f30379d = 0L;
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
