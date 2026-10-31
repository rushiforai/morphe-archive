package com.fyber.inneractive.sdk.player.exoplayer2;

import android.util.Log;
import com.fyber.inneractive.sdk.player.exoplayer2.source.z;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.source.s f30003a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f30004b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.source.v[] f30005c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean[] f30006d;

    /* renamed from: e, reason: collision with root package name */
    public final long f30007e;

    /* renamed from: f, reason: collision with root package name */
    public int f30008f;

    /* renamed from: g, reason: collision with root package name */
    public long f30009g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30010h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f30011i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f30012j;

    /* renamed from: k, reason: collision with root package name */
    public h f30013k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f30014l;

    /* renamed from: m, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j f30015m;
    public final a[] n;
    public final a[] o;

    /* renamed from: p, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.trackselection.i f30016p;

    /* renamed from: q, reason: collision with root package name */
    public final c f30017q;

    /* renamed from: r, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.source.u f30018r;

    /* renamed from: s, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j f30019s;

    public h(a[] aVarArr, a[] aVarArr2, long j11, com.fyber.inneractive.sdk.player.exoplayer2.trackselection.i iVar, c cVar, com.fyber.inneractive.sdk.player.exoplayer2.source.u uVar, Object obj, int i5, boolean z11, long j12) {
        this.n = aVarArr;
        this.o = aVarArr2;
        this.f30007e = j11;
        this.f30016p = iVar;
        this.f30017q = cVar;
        this.f30018r = uVar;
        obj.getClass();
        this.f30004b = obj;
        this.f30008f = i5;
        this.f30010h = z11;
        this.f30009g = j12;
        this.f30005c = new com.fyber.inneractive.sdk.player.exoplayer2.source.v[aVarArr.length];
        this.f30006d = new boolean[aVarArr.length];
        this.f30003a = uVar.a(i5, cVar.f29097a, j12);
    }

    public final long a(long j11, boolean z11, boolean[] zArr) {
        int i5;
        com.fyber.inneractive.sdk.player.exoplayer2.trackselection.h hVar = this.f30015m.f30269b;
        int i11 = 0;
        while (true) {
            boolean z12 = true;
            if (i11 >= hVar.f30265a) {
                break;
            }
            boolean[] zArr2 = this.f30006d;
            if (z11 || !this.f30015m.a(this.f30019s, i11)) {
                z12 = false;
            }
            zArr2[i11] = z12;
            i11++;
        }
        long jA = this.f30003a.a((com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b[]) hVar.f30266b.clone(), this.f30006d, this.f30005c, zArr, j11);
        this.f30019s = this.f30015m;
        this.f30012j = false;
        int i12 = 0;
        while (true) {
            com.fyber.inneractive.sdk.player.exoplayer2.source.v[] vVarArr = this.f30005c;
            if (i12 >= vVarArr.length) {
                c cVar = this.f30017q;
                a[] aVarArr = this.n;
                z zVar = this.f30015m.f30268a;
                cVar.f29102f = 0;
                for (int i13 = 0; i13 < aVarArr.length; i13++) {
                    if (hVar.f30266b[i13] != null) {
                        int i14 = cVar.f29102f;
                        int i15 = aVarArr[i13].f28969a;
                        int i16 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
                        if (i15 == 0) {
                            i5 = 16777216;
                        } else if (i15 == 1) {
                            i5 = 3538944;
                        } else if (i15 == 2) {
                            i5 = 13107200;
                        } else {
                            if (i15 != 3 && i15 != 4) {
                                throw new IllegalStateException();
                            }
                            i5 = SQLiteDatabase.OPEN_SHAREDCACHE;
                        }
                        cVar.f29102f = i14 + i5;
                    }
                }
                cVar.f29097a.a(cVar.f29102f);
                return jA;
            }
            if (vVarArr[i12] != null) {
                if (hVar.f30266b[i12] == null) {
                    throw new IllegalStateException();
                }
                this.f30012j = true;
            } else if (hVar.f30266b[i12] != null) {
                throw new IllegalStateException();
            }
            i12++;
        }
    }

    public final void a() {
        try {
            this.f30018r.a(this.f30003a);
        } catch (RuntimeException e3) {
            Log.e("ExoPlayerImplInternal", "Period release failed.", e3);
        }
    }
}
