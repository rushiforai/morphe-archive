package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.q;
import com.fyber.inneractive.sdk.player.exoplayer2.source.w;
import com.fyber.inneractive.sdk.player.exoplayer2.source.z;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.b0;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.x;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.y;
import com.fyber.inneractive.sdk.player.exoplayer2.util.v;
import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes3.dex */
public final class n implements x, w, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j, com.fyber.inneractive.sdk.player.exoplayer2.extractor.f {

    /* renamed from: a, reason: collision with root package name */
    public final int f29260a;

    /* renamed from: b, reason: collision with root package name */
    public final i f29261b;

    /* renamed from: c, reason: collision with root package name */
    public final f f29262c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.b f29263d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.o f29264e;

    /* renamed from: f, reason: collision with root package name */
    public final int f29265f;

    /* renamed from: h, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.source.f f29267h;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public int f29273p;

    /* renamed from: q, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.o f29274q;

    /* renamed from: r, reason: collision with root package name */
    public int f29275r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f29276s;

    /* renamed from: t, reason: collision with root package name */
    public z f29277t;

    /* renamed from: u, reason: collision with root package name */
    public int f29278u;

    /* renamed from: v, reason: collision with root package name */
    public boolean[] f29279v;

    /* renamed from: w, reason: collision with root package name */
    public long f29280w;

    /* renamed from: x, reason: collision with root package name */
    public long f29281x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f29282y;

    /* renamed from: g, reason: collision with root package name */
    public final b0 f29266g = new b0("Loader:HlsSampleStreamWrapper");

    /* renamed from: i, reason: collision with root package name */
    public final d f29268i = new d();

    /* renamed from: j, reason: collision with root package name */
    public final SparseArray f29269j = new SparseArray();

    /* renamed from: k, reason: collision with root package name */
    public final LinkedList f29270k = new LinkedList();

    /* renamed from: l, reason: collision with root package name */
    public final m f29271l = new m(this);

    /* renamed from: m, reason: collision with root package name */
    public final Handler f29272m = new Handler();

    public n(int i5, i iVar, f fVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.b bVar, long j11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i11, com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar2) {
        this.f29260a = i5;
        this.f29261b = iVar;
        this.f29262c = fVar;
        this.f29263d = bVar;
        this.f29264e = oVar;
        this.f29265f = i11;
        this.f29267h = fVar2;
        this.f29280w = j11;
        this.f29281x = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.j
    public final void a(q qVar) {
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x028f  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0292  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0139  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.w
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(long j11) {
        int i5;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar;
        h hVar;
        int iMax;
        int size;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar2;
        int i11;
        boolean z11;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar;
        long j12;
        long j13;
        boolean z12;
        int i12;
        boolean z13;
        if (this.f29282y || this.f29266g.a()) {
            return false;
        }
        f fVar = this.f29262c;
        h hVar2 = this.f29270k.isEmpty() ? null : (h) this.f29270k.getLast();
        long j14 = this.f29281x;
        if (j14 == -9223372036854775807L) {
            j14 = j11;
        }
        d dVar = this.f29268i;
        int iA = hVar2 == null ? -1 : fVar.f29214f.a(hVar2.f30166c);
        fVar.f29219k = null;
        fVar.f29222p.d();
        com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar = fVar.f29222p;
        int i13 = bVar.f30258c[bVar.a()];
        boolean z14 = iA != i13;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar3 = fVar.f29212d[i13];
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.h hVar3 = (com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.h) fVar.f29213e.f29358d.get(aVar3);
        if (hVar3.f29347d == null) {
            aVar = aVar3;
        } else {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            h hVar4 = hVar2;
            boolean z15 = z14;
            long jMax = Math.max(30000L, com.fyber.inneractive.sdk.player.exoplayer2.b.a(hVar3.f29347d.o));
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.d dVar2 = hVar3.f29347d;
            if (!dVar2.f29316j && (i12 = dVar2.f29308b) != 2 && i12 != 1) {
                i5 = 2;
                aVar = aVar3;
                if (hVar3.f29348e + jMax > jElapsedRealtime) {
                }
                j13 = -9223372036854775807L;
                z12 = true;
                d dVar3 = this.f29268i;
                z13 = dVar3.f29206b;
                com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar4 = dVar3.f29205a;
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar5 = dVar3.f29207c;
                dVar3.f29205a = null;
                dVar3.f29206b = false;
                dVar3.f29207c = null;
                if (z13) {
                    this.f29282y = z12;
                    return z12;
                }
                if (aVar4 == null) {
                    if (aVar5 == null) {
                        return false;
                    }
                    ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.h) this.f29261b.f29238a.f29358d.get(aVar5)).b();
                    return false;
                }
                if (aVar4 instanceof h) {
                    this.f29281x = j13;
                    h hVar5 = (h) aVar4;
                    hVar5.D = this;
                    int i14 = hVar5.f29223j;
                    boolean z16 = hVar5.f29231t;
                    this.f29275r = i14;
                    for (int i15 = 0; i15 < this.f29269j.size(); i15++) {
                        ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i15)).f29184c.f29157r = i14;
                    }
                    if (z16) {
                        for (int i16 = 0; i16 < this.f29269j.size(); i16++) {
                            ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i16)).f29194m = z12;
                        }
                    }
                    this.f29270k.add(hVar5);
                }
                b0 b0Var = this.f29266g;
                int i17 = this.f29265f;
                b0Var.getClass();
                Looper looperMyLooper = Looper.myLooper();
                if (looperMyLooper == null) {
                    throw new IllegalStateException();
                }
                long jElapsedRealtime2 = SystemClock.elapsedRealtime();
                y yVar = new y(b0Var, looperMyLooper, aVar4, this, i17, jElapsedRealtime2);
                if (b0Var.f30275b != null) {
                    throw new IllegalStateException();
                }
                b0Var.f30275b = yVar;
                yVar.f30422e = null;
                b0Var.f30274a.execute(yVar);
                com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar2 = this.f29267h;
                com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar2 = aVar4.f30164a;
                int i18 = aVar4.f30165b;
                int i19 = this.f29260a;
                com.fyber.inneractive.sdk.player.exoplayer2.o oVar = aVar4.f30166c;
                int i21 = aVar4.f30167d;
                Object obj = aVar4.f30168e;
                long j15 = aVar4.f30169f;
                long j16 = aVar4.f30170g;
                if (fVar2.f30182b != null) {
                    fVar2.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.a(fVar2, kVar2, i18, i19, oVar, i21, obj, j15, j16, jElapsedRealtime2));
                }
                return z12;
            }
            i5 = 2;
            aVar = aVar3;
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.d dVarA = fVar.f29213e.a(aVar);
            if (hVar4 == null || z15) {
                hVar = hVar4;
                if (hVar != null) {
                    j14 = hVar.f30169f;
                }
                if (dVarA.f29316j || j14 <= dVarA.f29310d + dVarA.o) {
                    List list = dVarA.f29319m;
                    Long lValueOf = Long.valueOf(j14 - dVarA.f29310d);
                    boolean z17 = !fVar.f29213e.f29367m || hVar == null;
                    int i22 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
                    int iBinarySearch = Collections.binarySearch(list, lValueOf);
                    if (iBinarySearch < 0) {
                        iMax = -(iBinarySearch + i5);
                    } else {
                        while (true) {
                            int i23 = iBinarySearch - 1;
                            if (i23 < 0 || ((Comparable) list.get(i23)).compareTo(lValueOf) != 0) {
                                break;
                            }
                            iBinarySearch = i23;
                        }
                        iMax = iBinarySearch;
                    }
                    if (z17) {
                        iMax = Math.max(0, iMax);
                    }
                    int i24 = dVarA.f29313g;
                    size = iMax + i24;
                    if (size < i24 && hVar != null) {
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar6 = fVar.f29212d[iA];
                        dVarA = fVar.f29213e.a(aVar6);
                        size = hVar.f30172i + 1;
                        aVar2 = aVar6;
                    }
                    i11 = dVarA.f29313g;
                    if (size >= i11) {
                        fVar.f29218j = new com.fyber.inneractive.sdk.player.exoplayer2.source.g();
                        j13 = -9223372036854775807L;
                        z12 = true;
                        d dVar32 = this.f29268i;
                        z13 = dVar32.f29206b;
                        com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar42 = dVar32.f29205a;
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar52 = dVar32.f29207c;
                        dVar32.f29205a = null;
                        dVar32.f29206b = false;
                        dVar32.f29207c = null;
                        if (z13) {
                        }
                    } else {
                        int i25 = size - i11;
                        if (i25 < dVarA.f29319m.size()) {
                            z11 = true;
                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.c cVar = (com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.c) dVarA.f29319m.get(i25);
                            if (cVar.f29303e) {
                                Uri uriA = com.fyber.inneractive.sdk.player.exoplayer2.util.x.a(dVarA.f29320a, cVar.f29304f);
                                if (!uriA.equals(fVar.f29220l)) {
                                    dVar.f29205a = new c(fVar.f29210b, new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(uriA, 0L, 0L, -1L, null, 1), fVar.f29212d[iA].f29293b, fVar.f29222p.c(), fVar.f29222p.b(), fVar.f29217i, cVar.f29305g);
                                } else if (!com.fyber.inneractive.sdk.player.exoplayer2.util.z.a(cVar.f29305g, fVar.n)) {
                                    fVar.a(uriA, cVar.f29305g, fVar.f29221m);
                                }
                            } else {
                                fVar.f29220l = null;
                                fVar.f29221m = null;
                                fVar.n = null;
                                fVar.o = null;
                            }
                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.c cVar2 = dVarA.f29318l;
                            if (cVar2 != null) {
                                Uri uriA2 = com.fyber.inneractive.sdk.player.exoplayer2.util.x.a(dVarA.f29320a, cVar2.f29299a);
                                long j17 = cVar2.f29306h;
                                kVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(uriA2, j17, j17, cVar2.f29307i, null, 0);
                            } else {
                                kVar = null;
                            }
                            long j18 = dVarA.f29310d + cVar.f29302d;
                            int i26 = dVarA.f29312f + cVar.f29301c;
                            o oVar2 = fVar.f29211c;
                            v vVar = (v) oVar2.f29283a.get(i26);
                            if (vVar == null) {
                                j12 = j18;
                                vVar = new v(Long.MAX_VALUE);
                                oVar2.f29283a.put(i26, vVar);
                            } else {
                                j12 = j18;
                            }
                            v vVar2 = vVar;
                            Uri uriA3 = com.fyber.inneractive.sdk.player.exoplayer2.util.x.a(dVarA.f29320a, cVar.f29299a);
                            long j19 = cVar.f29306h;
                            com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(uriA3, j19, j19, cVar.f29307i, null, 0);
                            com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar6 = fVar.f29209a;
                            List list2 = fVar.f29215g;
                            int iC = fVar.f29222p.c();
                            Object objB = fVar.f29222p.b();
                            long j21 = j12 + cVar.f29300b;
                            boolean z18 = fVar.f29216h;
                            byte[] bArr = fVar.f29221m;
                            byte[] bArr2 = fVar.o;
                            j13 = -9223372036854775807L;
                            z12 = true;
                            dVar.f29205a = new h(hVar6, kVar3, kVar, aVar2, list2, iC, objB, j12, j21, size, i26, z18, vVar2, hVar, bArr, bArr2);
                            d dVar322 = this.f29268i;
                            z13 = dVar322.f29206b;
                            com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar422 = dVar322.f29205a;
                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar522 = dVar322.f29207c;
                            dVar322.f29205a = null;
                            dVar322.f29206b = false;
                            dVar322.f29207c = null;
                            if (z13) {
                            }
                        } else if (dVarA.f29316j) {
                            z11 = true;
                            dVar.f29206b = true;
                        } else {
                            z11 = true;
                            dVar.f29207c = aVar2;
                            fVar.f29219k = aVar2;
                        }
                        z12 = z11;
                        j13 = -9223372036854775807L;
                        d dVar3222 = this.f29268i;
                        z13 = dVar3222.f29206b;
                        com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar4222 = dVar3222.f29205a;
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar5222 = dVar3222.f29207c;
                        dVar3222.f29205a = null;
                        dVar3222.f29206b = false;
                        dVar3222.f29207c = null;
                        if (z13) {
                        }
                    }
                } else {
                    size = dVarA.f29313g + dVarA.f29319m.size();
                }
            } else {
                hVar = hVar4;
                size = hVar.f30172i + 1;
            }
            aVar2 = aVar;
            iA = i13;
            i11 = dVarA.f29313g;
            if (size >= i11) {
            }
        }
        dVar.f29207c = aVar;
        fVar.f29219k = aVar;
        j13 = -9223372036854775807L;
        z12 = true;
        d dVar32222 = this.f29268i;
        z13 = dVar32222.f29206b;
        com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar42222 = dVar32222.f29205a;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a aVar52222 = dVar32222.f29207c;
        dVar32222.f29205a = null;
        dVar32222.f29206b = false;
        dVar32222.f29207c = null;
        if (z13) {
        }
    }

    public final void c(long j11) {
        this.f29280w = j11;
        this.f29281x = j11;
        this.f29282y = false;
        this.f29270k.clear();
        if (this.f29266g.a()) {
            this.f29266g.f30275b.a(false);
            return;
        }
        int size = this.f29269j.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i5)).a(this.f29279v[i5]);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.f
    public final void e() {
        this.f29272m.post(this.f29271l);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.w
    public final long f() {
        long j11 = this.f29281x;
        if (j11 != -9223372036854775807L) {
            return j11;
        }
        if (this.f29282y) {
            return Long.MIN_VALUE;
        }
        return ((h) this.f29270k.getLast()).f30170g;
    }

    public final void h() {
        if (this.f29276s || this.o || !this.n) {
            return;
        }
        int size = this.f29269j.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i5)).e() == null) {
                return;
            }
        }
        int size2 = this.f29269j.size();
        int i11 = 0;
        char c11 = 0;
        int i12 = -1;
        while (true) {
            if (i11 >= size2) {
                break;
            }
            String str = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i11)).e().f30128f;
            char c12 = "video".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str)) ? (char) 3 : "audio".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str)) ? (char) 2 : "text".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str)) ? (char) 1 : (char) 0;
            if (c12 > c11) {
                i12 = i11;
                c11 = c12;
            } else if (c12 == c11 && i12 != -1) {
                i12 = -1;
            }
            i11++;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.source.y yVar = this.f29262c.f29214f;
        int i13 = yVar.f30244a;
        this.f29278u = -1;
        this.f29279v = new boolean[size2];
        com.fyber.inneractive.sdk.player.exoplayer2.source.y[] yVarArr = new com.fyber.inneractive.sdk.player.exoplayer2.source.y[size2];
        for (int i14 = 0; i14 < size2; i14++) {
            com.fyber.inneractive.sdk.player.exoplayer2.o oVarE = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i14)).e();
            if (i14 == i12) {
                com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr = new com.fyber.inneractive.sdk.player.exoplayer2.o[i13];
                for (int i15 = 0; i15 < i13; i15++) {
                    oVarArr[i15] = a(yVar.f30245b[i15], oVarE);
                }
                yVarArr[i14] = new com.fyber.inneractive.sdk.player.exoplayer2.source.y(oVarArr);
                this.f29278u = i14;
            } else {
                yVarArr[i14] = new com.fyber.inneractive.sdk.player.exoplayer2.source.y(a((c11 == 3 && "audio".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(oVarE.f30128f))) ? this.f29264e : null, oVarE));
            }
        }
        this.f29277t = new z(yVarArr);
        this.o = true;
        i iVar = this.f29261b;
        int i16 = iVar.f29248k - 1;
        iVar.f29248k = i16;
        if (i16 > 0) {
            return;
        }
        int i17 = 0;
        for (n nVar : iVar.n) {
            i17 += nVar.f29277t.f30248a;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.source.y[] yVarArr2 = new com.fyber.inneractive.sdk.player.exoplayer2.source.y[i17];
        int i18 = 0;
        for (n nVar2 : iVar.n) {
            int i19 = nVar2.f29277t.f30248a;
            int i21 = 0;
            while (i21 < i19) {
                yVarArr2[i18] = nVar2.f29277t.f30249b[i21];
                i21++;
                i18++;
            }
        }
        iVar.f29250m = new z(yVarArr2);
        ((com.fyber.inneractive.sdk.player.exoplayer2.l) iVar.f29247j).f30035f.obtainMessage(8, iVar).sendToTarget();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.z zVar, long j11, long j12, boolean z11) {
        com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar = (com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a) zVar;
        com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar = this.f29267h;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = aVar.f30164a;
        int i5 = aVar.f30165b;
        int i11 = this.f29260a;
        com.fyber.inneractive.sdk.player.exoplayer2.o oVar = aVar.f30166c;
        int i12 = aVar.f30167d;
        Object obj = aVar.f30168e;
        long j13 = aVar.f30169f;
        long j14 = aVar.f30170g;
        long jC = aVar.c();
        if (fVar.f30182b != null) {
            fVar.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.c(fVar, kVar, i5, i11, oVar, i12, obj, j13, j14, j11, j12, jC));
        }
        if (z11) {
            return;
        }
        int size = this.f29269j.size();
        for (int i13 = 0; i13 < size; i13++) {
            ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.valueAt(i13)).a(this.f29279v[i13]);
        }
        i iVar = this.f29261b;
        iVar.getClass();
        if (iVar.f29250m == null) {
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.l) iVar.f29247j;
        lVar.getClass();
        lVar.f30035f.obtainMessage(9, iVar).sendToTarget();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.z zVar, long j11, long j12) {
        com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar = (com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a) zVar;
        f fVar = this.f29262c;
        fVar.getClass();
        if (aVar instanceof c) {
            c cVar = (c) aVar;
            fVar.f29217i = cVar.f29200i;
            fVar.a(cVar.f30164a.f30365a, cVar.f29203l, cVar.f29204m);
        }
        com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar2 = this.f29267h;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = aVar.f30164a;
        int i5 = aVar.f30165b;
        int i11 = this.f29260a;
        com.fyber.inneractive.sdk.player.exoplayer2.o oVar = aVar.f30166c;
        int i12 = aVar.f30167d;
        Object obj = aVar.f30168e;
        long j13 = aVar.f30169f;
        long j14 = aVar.f30170g;
        long jC = aVar.c();
        if (fVar2.f30182b != null) {
            fVar2.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.b(fVar2, kVar, i5, i11, oVar, i12, obj, j13, j14, j11, j12, jC));
        }
        if (!this.o) {
            b(this.f29280w);
            return;
        }
        i iVar = this.f29261b;
        iVar.getClass();
        if (iVar.f29250m == null) {
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.l) iVar.f29247j;
        lVar.getClass();
        lVar.f30035f.obtainMessage(9, iVar).sendToTarget();
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x011b  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.z zVar, long j11, long j12, IOException iOException) {
        boolean z11;
        boolean z12;
        com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar;
        boolean zA;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.v vVar;
        int i5;
        com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a aVar = (com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a) zVar;
        boolean z13 = aVar instanceof h;
        boolean z14 = !z13 || aVar.c() == 0;
        f fVar2 = this.f29262c;
        if (z14) {
            com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar = fVar2.f29222p;
            int iA = fVar2.f29214f.a(aVar.f30166c);
            int i11 = 0;
            while (true) {
                if (i11 >= bVar.f30257b) {
                    i11 = -1;
                    break;
                }
                if (bVar.f30258c[i11] == iA) {
                    break;
                }
                i11++;
            }
            if ((iOException instanceof com.fyber.inneractive.sdk.player.exoplayer2.upstream.v) && ((i5 = (vVar = (com.fyber.inneractive.sdk.player.exoplayer2.upstream.v) iOException).f30415a) == 404 || i5 == 410)) {
                zA = bVar.a(i11);
                int i12 = vVar.f30415a;
                if (zA) {
                    StringBuilder sbA = l.a("Blacklisted: duration=60000, responseCode=", i12, ", format=");
                    sbA.append(bVar.f30259d[i11]);
                    Log.w("ChunkedTrackBlacklist", sbA.toString());
                } else {
                    StringBuilder sbA2 = l.a("Blacklisting failed (cannot blacklist last enabled track): responseCode=", i12, ", format=");
                    sbA2.append(bVar.f30259d[i11]);
                    Log.w("ChunkedTrackBlacklist", sbA2.toString());
                }
            } else {
                zA = false;
            }
            if (zA) {
                z11 = true;
            }
            if (z11) {
                z12 = false;
            } else {
                if (z13) {
                    if (((h) this.f29270k.removeLast()) == aVar) {
                        if (this.f29270k.isEmpty()) {
                            this.f29281x = this.f29280w;
                        }
                    } else {
                        throw new IllegalStateException();
                    }
                }
                z12 = true;
            }
            fVar = this.f29267h;
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = aVar.f30164a;
            int i13 = aVar.f30165b;
            int i14 = this.f29260a;
            com.fyber.inneractive.sdk.player.exoplayer2.o oVar = aVar.f30166c;
            int i15 = aVar.f30167d;
            Object obj = aVar.f30168e;
            long j13 = aVar.f30169f;
            long j14 = aVar.f30170g;
            long jC = aVar.c();
            if (fVar.f30182b != null) {
                fVar.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.d(fVar, kVar, i13, i14, oVar, i15, obj, j13, j14, j11, j12, jC, iOException, z12));
            }
            if (z12) {
                return 0;
            }
            if (!this.o) {
                b(this.f29280w);
                return 2;
            }
            i iVar = this.f29261b;
            iVar.getClass();
            if (iVar.f29250m == null) {
                return 2;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.l) iVar.f29247j;
            lVar.getClass();
            lVar.f30035f.obtainMessage(9, iVar).sendToTarget();
            return 2;
        }
        fVar2.getClass();
        z11 = false;
        if (z11) {
        }
        fVar = this.f29267h;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar2 = aVar.f30164a;
        int i132 = aVar.f30165b;
        int i142 = this.f29260a;
        com.fyber.inneractive.sdk.player.exoplayer2.o oVar2 = aVar.f30166c;
        int i152 = aVar.f30167d;
        Object obj2 = aVar.f30168e;
        long j132 = aVar.f30169f;
        long j142 = aVar.f30170g;
        long jC2 = aVar.c();
        if (fVar.f30182b != null) {
        }
        if (z12) {
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.j
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.g a(int i5, int i11) {
        if (this.f29269j.indexOfKey(i5) >= 0) {
            return (com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f29269j.get(i5);
        }
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVar = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.g(this.f29263d);
        gVar.n = this;
        gVar.f29184c.f29157r = this.f29275r;
        this.f29269j.put(i5, gVar);
        return gVar;
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.o a(com.fyber.inneractive.sdk.player.exoplayer2.o oVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar2) {
        String strA;
        if (oVar == null) {
            return oVar2;
        }
        int iC = com.fyber.inneractive.sdk.player.exoplayer2.util.i.c(oVar2.f30128f);
        if (iC == 1) {
            strA = a(oVar.f30125c, 1);
        } else {
            strA = iC == 2 ? a(oVar.f30125c, 2) : null;
        }
        return new com.fyber.inneractive.sdk.player.exoplayer2.o(oVar.f30123a, oVar2.f30127e, oVar2.f30128f, strA, oVar.f30124b, oVar2.f30129g, oVar.f30132j, oVar.f30133k, oVar2.f30134l, oVar2.f30135m, oVar2.n, oVar2.f30136p, oVar2.o, oVar2.f30137q, oVar2.f30138r, oVar2.f30139s, oVar2.f30140t, oVar2.f30141u, oVar2.f30142v, oVar.f30144x, oVar.f30145y, oVar2.f30146z, oVar2.f30143w, oVar2.f30130h, oVar2.f30131i, oVar2.f30126d);
    }

    public static String a(String str, int i5) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        String[] strArrSplit = str.split("(\\s*,\\s*)|(\\s*$)");
        StringBuilder sb2 = new StringBuilder();
        for (String str2 : strArrSplit) {
            if (i5 == com.fyber.inneractive.sdk.player.exoplayer2.util.i.c(com.fyber.inneractive.sdk.player.exoplayer2.util.i.a(str2))) {
                if (sb2.length() > 0) {
                    sb2.append(",");
                }
                sb2.append(str2);
            }
        }
        if (sb2.length() > 0) {
            return sb2.toString();
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.j
    public final void b() {
        this.n = true;
        this.f29272m.post(this.f29271l);
    }
}
