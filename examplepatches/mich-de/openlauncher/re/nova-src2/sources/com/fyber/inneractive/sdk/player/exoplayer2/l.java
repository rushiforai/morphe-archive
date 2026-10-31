package com.fyber.inneractive.sdk.player.exoplayer2;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;
import android.util.Pair;
import com.fyber.inneractive.sdk.player.exoplayer2.audio.MediaCodecAudioRenderer;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class l implements Handler.Callback, com.fyber.inneractive.sdk.player.exoplayer2.source.r, com.fyber.inneractive.sdk.player.exoplayer2.source.t {
    public h A;
    public h B;
    public x C;

    /* renamed from: a, reason: collision with root package name */
    public final a[] f30030a;

    /* renamed from: b, reason: collision with root package name */
    public final a[] f30031b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.trackselection.i f30032c;

    /* renamed from: d, reason: collision with root package name */
    public final c f30033d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.u f30034e;

    /* renamed from: f, reason: collision with root package name */
    public final Handler f30035f;

    /* renamed from: g, reason: collision with root package name */
    public final HandlerThread f30036g;

    /* renamed from: h, reason: collision with root package name */
    public final Handler f30037h;

    /* renamed from: i, reason: collision with root package name */
    public final w f30038i;

    /* renamed from: j, reason: collision with root package name */
    public final v f30039j;

    /* renamed from: k, reason: collision with root package name */
    public i f30040k;

    /* renamed from: l, reason: collision with root package name */
    public s f30041l;

    /* renamed from: m, reason: collision with root package name */
    public a f30042m;
    public com.fyber.inneractive.sdk.player.exoplayer2.util.h n;
    public com.fyber.inneractive.sdk.player.exoplayer2.source.u o;

    /* renamed from: p, reason: collision with root package name */
    public a[] f30043p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f30044q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f30045r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f30046s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f30047t;

    /* renamed from: u, reason: collision with root package name */
    public int f30048u = 1;

    /* renamed from: v, reason: collision with root package name */
    public long f30049v;

    /* renamed from: w, reason: collision with root package name */
    public int f30050w;

    /* renamed from: x, reason: collision with root package name */
    public j f30051x;

    /* renamed from: y, reason: collision with root package name */
    public long f30052y;

    /* renamed from: z, reason: collision with root package name */
    public h f30053z;

    public l(a[] aVarArr, com.fyber.inneractive.sdk.player.exoplayer2.trackselection.d dVar, c cVar, boolean z11, f fVar, i iVar, g gVar) {
        this.f30030a = aVarArr;
        this.f30032c = dVar;
        this.f30033d = cVar;
        this.f30045r = z11;
        this.f30037h = fVar;
        this.f30040k = iVar;
        this.f30031b = new a[aVarArr.length];
        for (int i5 = 0; i5 < aVarArr.length; i5++) {
            a aVar = aVarArr[i5];
            aVar.getClass();
            this.f30031b[i5] = aVar;
        }
        this.f30034e = new com.fyber.inneractive.sdk.player.exoplayer2.util.u();
        this.f30043p = new a[0];
        this.f30038i = new w();
        this.f30039j = new v();
        this.f30041l = s.f30148d;
        HandlerThread handlerThread = new HandlerThread("ExoPlayerImplInternal:Handler", -16);
        this.f30036g = handlerThread;
        handlerThread.start();
        this.f30035f = new Handler(handlerThread.getLooper(), this);
    }

    public static void a(a aVar) {
        int i5 = aVar.f28971c;
        if (i5 == 2) {
            if (i5 != 2) {
                throw new IllegalStateException();
            }
            aVar.f28971c = 1;
            aVar.j();
        }
    }

    public final void b(boolean z11) {
        if (this.f30047t != z11) {
            this.f30047t = z11;
            this.f30037h.obtainMessage(2, z11 ? 1 : 0, 0).sendToTarget();
        }
    }

    public final void c(boolean z11) {
        this.f30046s = false;
        this.f30045r = z11;
        if (!z11) {
            g();
            h();
            a(false);
            return;
        }
        int i5 = this.f30048u;
        if (i5 != 3) {
            if (i5 == 2) {
                this.f30035f.sendEmptyMessage(2);
                return;
            }
            return;
        }
        this.f30046s = false;
        com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar = this.f30034e;
        if (!uVar.f30481a) {
            uVar.f30483c = SystemClock.elapsedRealtime();
            uVar.f30481a = true;
        }
        for (a aVar : this.f30043p) {
            if (aVar.f28971c != 1) {
                throw new IllegalStateException();
            }
            aVar.f28971c = 2;
            aVar.i();
        }
        this.f30035f.sendEmptyMessage(2);
    }

    public final synchronized void d() {
        if (this.f30044q) {
            return;
        }
        this.f30035f.sendEmptyMessage(6);
        while (!this.f30044q) {
            try {
                wait();
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
        }
        this.f30036g.quit();
    }

    public final void e() {
        a(true);
        this.f30033d.a(true);
        a(1);
        synchronized (this) {
            this.f30044q = true;
            notifyAll();
        }
    }

    public final void f() throws d {
        h hVar = this.B;
        if (hVar == null) {
            return;
        }
        boolean z11 = true;
        while (hVar != null && hVar.f30011i) {
            com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVarA = hVar.f30016p.a(hVar.o, hVar.f30003a.a());
            com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVar = hVar.f30019s;
            if (jVar != null) {
                for (int i5 = 0; i5 < jVarA.f30269b.f30265a; i5++) {
                    if (jVarA.a(jVar, i5)) {
                    }
                }
                if (hVar == this.A) {
                    z11 = false;
                }
                hVar = hVar.f30013k;
            }
            hVar.f30015m = jVarA;
            if (z11) {
                h hVar2 = this.A;
                h hVar3 = this.B;
                boolean z12 = hVar2 != hVar3;
                for (h hVar4 = hVar3.f30013k; hVar4 != null; hVar4 = hVar4.f30013k) {
                    hVar4.a();
                }
                h hVar5 = this.B;
                hVar5.f30013k = null;
                this.f30053z = hVar5;
                this.A = hVar5;
                boolean[] zArr = new boolean[this.f30030a.length];
                long jA = hVar5.a(this.f30040k.f30022c, z12, zArr);
                if (jA != this.f30040k.f30022c) {
                    this.f30040k.f30022c = jA;
                    a(jA);
                }
                boolean[] zArr2 = new boolean[this.f30030a.length];
                int i11 = 0;
                int i12 = 0;
                while (true) {
                    a[] aVarArr = this.f30030a;
                    if (i11 >= aVarArr.length) {
                        break;
                    }
                    a aVar = aVarArr[i11];
                    boolean z13 = aVar.f28971c != 0;
                    zArr2[i11] = z13;
                    com.fyber.inneractive.sdk.player.exoplayer2.source.v vVar = this.B.f30005c[i11];
                    if (vVar != null) {
                        i12++;
                    }
                    if (z13) {
                        if (vVar != aVar.f28972d) {
                            if (aVar == this.f30042m) {
                                if (vVar == null) {
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar = this.f30034e;
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.h hVar6 = this.n;
                                    uVar.getClass();
                                    uVar.a(hVar6.b());
                                    uVar.f30484d = hVar6.a();
                                }
                                this.n = null;
                                this.f30042m = null;
                            }
                            a(aVar);
                            aVar.c();
                        } else if (zArr[i11]) {
                            long j11 = this.f30052y;
                            aVar.f28975g = false;
                            aVar.f28974f = false;
                            aVar.a(false, j11);
                        }
                    }
                    i11++;
                }
                this.f30037h.obtainMessage(3, hVar.f30015m).sendToTarget();
                a(zArr2, i12);
            } else {
                this.f30053z = hVar;
                for (h hVar7 = hVar.f30013k; hVar7 != null; hVar7 = hVar7.f30013k) {
                    hVar7.a();
                }
                h hVar8 = this.f30053z;
                hVar8.f30013k = null;
                if (hVar8.f30011i) {
                    long j12 = hVar8.f30009g;
                    long jMax = Math.max(j12, Math.abs(this.f30052y - (hVar8.f30007e - j12)));
                    h hVar9 = this.f30053z;
                    hVar9.a(jMax, false, new boolean[hVar9.n.length]);
                }
            }
            b();
            h();
            this.f30035f.sendEmptyMessage(2);
            return;
        }
    }

    public final void g() {
        com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar = this.f30034e;
        if (uVar.f30481a) {
            uVar.a(uVar.b());
            uVar.f30481a = false;
        }
        for (a aVar : this.f30043p) {
            a(aVar);
        }
    }

    public final void h() {
        h hVar = this.B;
        if (hVar == null) {
            return;
        }
        long jG = hVar.f30003a.g();
        if (jG != -9223372036854775807L) {
            a(jG);
        } else {
            a aVar = this.f30042m;
            if (aVar == null || aVar.e()) {
                this.f30052y = this.f30034e.b();
            } else {
                long jB = this.n.b();
                this.f30052y = jB;
                this.f30034e.a(jB);
            }
            h hVar2 = this.B;
            jG = Math.abs(this.f30052y - (hVar2.f30007e - hVar2.f30009g));
        }
        this.f30040k.f30022c = jG;
        this.f30049v = SystemClock.elapsedRealtime() * 1000;
        long jC = this.f30043p.length == 0 ? Long.MIN_VALUE : this.B.f30003a.c();
        i iVar = this.f30040k;
        if (jC == Long.MIN_VALUE) {
            long j11 = this.C.a(this.B.f30008f, this.f30039j, false).f30500d;
        }
        iVar.getClass();
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        try {
            switch (message.what) {
                case 0:
                    a((com.fyber.inneractive.sdk.player.exoplayer2.source.u) message.obj, message.arg1 != 0);
                    return true;
                case 1:
                    c(message.arg1 != 0);
                    return true;
                case 2:
                    a();
                    return true;
                case 3:
                    b((j) message.obj);
                    return true;
                case 4:
                    a((s) message.obj);
                    return true;
                case 5:
                    a(true);
                    this.f30033d.a(true);
                    a(1);
                    return true;
                case 6:
                    e();
                    return true;
                case 7:
                    a((Pair) message.obj);
                    return true;
                case 8:
                    a((com.fyber.inneractive.sdk.player.exoplayer2.source.s) message.obj);
                    return true;
                case 9:
                    com.fyber.inneractive.sdk.player.exoplayer2.source.s sVar = (com.fyber.inneractive.sdk.player.exoplayer2.source.s) message.obj;
                    h hVar = this.f30053z;
                    if (hVar != null && hVar.f30003a == sVar) {
                        b();
                    }
                    return true;
                case 10:
                    f();
                    return true;
                case 11:
                    a((e[]) message.obj);
                    return true;
                default:
                    return false;
            }
        } catch (d e3) {
            Log.e("ExoPlayerImplInternal", "Renderer error.", e3);
            this.f30037h.obtainMessage(8, e3).sendToTarget();
            a(true);
            this.f30033d.a(true);
            a(1);
            return true;
        } catch (IOException e11) {
            Log.e("ExoPlayerImplInternal", "Source error.", e11);
            this.f30037h.obtainMessage(8, new d(e11)).sendToTarget();
            a(true);
            this.f30033d.a(true);
            a(1);
            return true;
        } catch (RuntimeException e12) {
            Log.e("ExoPlayerImplInternal", "Internal runtime error.", e12);
            this.f30037h.obtainMessage(8, new d(e12)).sendToTarget();
            a(true);
            this.f30033d.a(true);
            a(1);
            return true;
        }
    }

    public final void b(j jVar) {
        if (this.C == null) {
            this.f30050w++;
            this.f30051x = jVar;
            return;
        }
        Pair pairA = a(jVar);
        if (pairA == null) {
            i iVar = new i(0, 0L);
            this.f30040k = iVar;
            this.f30037h.obtainMessage(4, 1, 0, iVar).sendToTarget();
            this.f30040k = new i(0, -9223372036854775807L);
            a(4);
            a(false);
            return;
        }
        int i5 = jVar.f30025c == -9223372036854775807L ? 1 : 0;
        int iIntValue = ((Integer) pairA.first).intValue();
        long jLongValue = ((Long) pairA.second).longValue();
        try {
            i iVar2 = this.f30040k;
            if (iIntValue == iVar2.f30020a && jLongValue / 1000 == iVar2.f30022c / 1000) {
                return;
            }
            long jA = a(iIntValue, jLongValue);
            int i11 = i5 | (jLongValue == jA ? 0 : 1);
            i iVar3 = new i(iIntValue, jA);
            this.f30040k = iVar3;
            this.f30037h.obtainMessage(4, i11, 0, iVar3).sendToTarget();
        } finally {
            i iVar4 = new i(iIntValue, jLongValue);
            this.f30040k = iVar4;
            this.f30037h.obtainMessage(4, i5, 0, iVar4).sendToTarget();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.t
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.source.x xVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.g gVar) {
        this.f30035f.obtainMessage(7, Pair.create(xVar, gVar)).sendToTarget();
    }

    public final void a(int i5) {
        if (this.f30048u != i5) {
            this.f30048u = i5;
            this.f30037h.obtainMessage(1, i5, 0).sendToTarget();
        }
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.source.u uVar, boolean z11) {
        this.f30037h.sendEmptyMessage(0);
        a(true);
        this.f30033d.a(false);
        if (z11) {
            this.f30040k = new i(0, -9223372036854775807L);
        }
        this.o = uVar;
        uVar.a(this);
        a(2);
        this.f30035f.sendEmptyMessage(2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:195:0x03a3  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x03a6  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x03ca  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x03d1  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x0434  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x0447  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x044f  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x045e  */
    /* JADX WARN: Removed duplicated region for block: B:260:0x0464  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x018a A[LOOP:3: B:75:0x018a->B:79:0x019a, LOOP_START] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() throws d {
        h hVar;
        int i5;
        long j11;
        boolean z11;
        h hVar2;
        h hVar3;
        long j12;
        long j13;
        long j14;
        h hVar4;
        h hVar5;
        int i11;
        h hVar6;
        int i12;
        long jC;
        long j15;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        long j16 = 0;
        long j17 = -9223372036854775807L;
        if (this.C == null) {
            this.o.a();
            j11 = Long.MIN_VALUE;
        } else {
            h hVar7 = this.f30053z;
            if (hVar7 == null) {
                i5 = this.f30040k.f30020a;
            } else {
                int i13 = hVar7.f30008f;
                if (!hVar7.f30010h && hVar7.f30011i && ((!hVar7.f30012j || hVar7.f30003a.c() == Long.MIN_VALUE) && this.C.a(i13, this.f30039j, false).f30500d != -9223372036854775807L && ((hVar = this.B) == null || i13 - hVar.f30008f != 100))) {
                    i5 = this.f30053z.f30008f + 1;
                }
                j11 = Long.MIN_VALUE;
                z11 = true;
                hVar2 = this.f30053z;
                if (hVar2 == null && (!hVar2.f30011i || (hVar2.f30012j && hVar2.f30003a.c() != j11))) {
                    h hVar8 = this.f30053z;
                    if (hVar8 != null && hVar8.f30014l) {
                        b();
                    }
                } else {
                    b(false);
                }
                if (this.B != null) {
                    while (true) {
                        h hVar9 = this.B;
                        hVar3 = this.A;
                        if (hVar9 == hVar3 || this.f30052y < hVar9.f30013k.f30007e) {
                            break;
                        }
                        hVar9.a();
                        a(this.B.f30013k);
                        h hVar10 = this.B;
                        this.f30040k = new i(hVar10.f30008f, hVar10.f30009g);
                        h();
                        this.f30037h.obtainMessage(5, this.f30040k).sendToTarget();
                    }
                    if (hVar3.f30010h) {
                        int i14 = 0;
                        while (true) {
                            a[] aVarArr = this.f30030a;
                            if (i14 >= aVarArr.length) {
                                break;
                            }
                            a aVar = aVarArr[i14];
                            com.fyber.inneractive.sdk.player.exoplayer2.source.v vVar = this.A.f30005c[i14];
                            if (vVar != null && aVar.f28972d == vVar && aVar.f28974f) {
                                aVar.f28975g = z11;
                            }
                            i14++;
                        }
                    } else {
                        int i15 = 0;
                        while (true) {
                            a[] aVarArr2 = this.f30030a;
                            if (i15 < aVarArr2.length) {
                                a aVar2 = aVarArr2[i15];
                                com.fyber.inneractive.sdk.player.exoplayer2.source.v vVar2 = this.A.f30005c[i15];
                                if (aVar2.f28972d != vVar2 || (vVar2 != null && !aVar2.f28974f)) {
                                    break;
                                } else {
                                    i15++;
                                }
                            } else {
                                h hVar11 = this.A;
                                h hVar12 = hVar11.f30013k;
                                if (hVar12 != null && hVar12.f30011i) {
                                    com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVar = hVar11.f30015m;
                                    this.A = hVar12;
                                    com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVar2 = hVar12.f30015m;
                                    Object[] objArr = hVar12.f30003a.g() != -9223372036854775807L ? z11 ? 1 : 0 : false;
                                    int i16 = 0;
                                    while (true) {
                                        a[] aVarArr3 = this.f30030a;
                                        if (i16 >= aVarArr3.length) {
                                            break;
                                        }
                                        a aVar3 = aVarArr3[i16];
                                        if (jVar.f30269b.f30266b[i16] != null) {
                                            if (objArr != false) {
                                                aVar3.f28975g = z11;
                                            } else if (!aVar3.f28975g) {
                                                com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar = jVar2.f30269b.f30266b[i16];
                                                t tVar = jVar.f30271d[i16];
                                                j12 = j16;
                                                t tVar2 = jVar2.f30271d[i16];
                                                if (bVar != null && tVar2.equals(tVar)) {
                                                    int length = bVar.f30258c.length;
                                                    o[] oVarArr = new o[length];
                                                    int i17 = 0;
                                                    while (i17 < length) {
                                                        oVarArr[i17] = bVar.f30259d[i17];
                                                        i17++;
                                                        j17 = j17;
                                                    }
                                                    j13 = j17;
                                                    h hVar13 = this.A;
                                                    com.fyber.inneractive.sdk.player.exoplayer2.source.v vVar3 = hVar13.f30005c[i16];
                                                    long j18 = hVar13.f30007e - hVar13.f30009g;
                                                    if (!aVar3.f28975g) {
                                                        aVar3.f28972d = vVar3;
                                                        aVar3.f28974f = false;
                                                        aVar3.f28973e = j18;
                                                        aVar3.a(oVarArr);
                                                    } else {
                                                        throw new IllegalStateException();
                                                    }
                                                } else {
                                                    j13 = j17;
                                                    aVar3.f28975g = z11;
                                                }
                                            }
                                            j12 = j16;
                                            j13 = j17;
                                        } else {
                                            j12 = j16;
                                            j13 = j17;
                                        }
                                        i16++;
                                        j16 = j12;
                                        j17 = j13;
                                        z11 = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (i5 >= this.C.a()) {
                this.o.a();
                j11 = Long.MIN_VALUE;
                z11 = true;
                hVar2 = this.f30053z;
                if (hVar2 == null) {
                    b(false);
                    if (this.B != null) {
                    }
                }
            } else {
                if (this.f30053z == null) {
                    j14 = this.f30040k.f30022c;
                    j11 = Long.MIN_VALUE;
                } else {
                    int i18 = this.C.a(i5, this.f30039j, false).f30499c;
                    if (i5 != this.C.a(i18, this.f30038i, 0L).f30573c) {
                        j11 = Long.MIN_VALUE;
                        j14 = 0;
                    } else {
                        h hVar14 = this.f30053z;
                        j11 = Long.MIN_VALUE;
                        z11 = true;
                        Pair pairA = a(this.C, i18, -9223372036854775807L, Math.max(0L, ((hVar14.f30007e - hVar14.f30009g) + this.C.a(hVar14.f30008f, this.f30039j, false).f30500d) - this.f30052y));
                        if (pairA != null) {
                            int iIntValue = ((Integer) pairA.first).intValue();
                            long jLongValue = ((Long) pairA.second).longValue();
                            i5 = iIntValue;
                            j14 = jLongValue;
                            h hVar15 = this.f30053z;
                            long j19 = hVar15 != null ? j14 + 60000000 : (hVar15.f30007e - hVar15.f30009g) + this.C.a(hVar15.f30008f, this.f30039j, false).f30500d;
                            this.C.a(i5, this.f30039j, z11);
                            h hVar16 = new h(this.f30030a, this.f30031b, j19, this.f30032c, this.f30033d, this.o, this.f30039j.f30498b, i5, (i5 == this.C.a() - (z11 ? 1 : 0) || this.C.a(this.f30039j.f30499c, this.f30038i, 0L).f30572b) ? false : z11 ? 1 : 0, j14);
                            hVar4 = this.f30053z;
                            if (hVar4 != null) {
                                hVar4.f30013k = hVar16;
                            }
                            this.f30053z = hVar16;
                            hVar16.f30003a.a(this);
                            b(z11);
                        }
                        hVar2 = this.f30053z;
                        if (hVar2 == null) {
                        }
                    }
                }
                z11 = true;
                h hVar152 = this.f30053z;
                long j192 = hVar152 != null ? j14 + 60000000 : (hVar152.f30007e - hVar152.f30009g) + this.C.a(hVar152.f30008f, this.f30039j, false).f30500d;
                this.C.a(i5, this.f30039j, z11);
                if (i5 == this.C.a() - (z11 ? 1 : 0)) {
                    h hVar162 = new h(this.f30030a, this.f30031b, j192, this.f30032c, this.f30033d, this.o, this.f30039j.f30498b, i5, (i5 == this.C.a() - (z11 ? 1 : 0) || this.C.a(this.f30039j.f30499c, this.f30038i, 0L).f30572b) ? false : z11 ? 1 : 0, j14);
                    hVar4 = this.f30053z;
                    if (hVar4 != null) {
                    }
                    this.f30053z = hVar162;
                    hVar162.f30003a.a(this);
                    b(z11);
                    hVar2 = this.f30053z;
                    if (hVar2 == null) {
                    }
                }
            }
        }
        long j21 = j16;
        long j22 = j17;
        if (this.B == null) {
            c();
            a(jElapsedRealtime, 10L);
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.w.a("doSomeWork");
        h();
        com.fyber.inneractive.sdk.player.exoplayer2.source.s sVar = this.B.f30003a;
        long j23 = this.f30040k.f30022c;
        sVar.getClass();
        boolean z12 = true;
        boolean z13 = true;
        for (a aVar4 : this.f30043p) {
            aVar4.a(this.f30052y, this.f30049v);
            z13 = z13 && aVar4.e();
            boolean z14 = aVar4.f() || aVar4.e();
            if (!z14) {
                aVar4.f28972d.a();
            }
            z12 = z12 && z14;
        }
        if (!z12) {
            c();
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.h hVar17 = this.n;
        if (hVar17 != null) {
            s sVarA = hVar17.a();
            if (!sVarA.equals(this.f30041l)) {
                this.f30041l = sVarA;
                com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar = this.f30034e;
                com.fyber.inneractive.sdk.player.exoplayer2.util.h hVar18 = this.n;
                uVar.getClass();
                uVar.a(hVar18.b());
                uVar.f30484d = hVar18.a();
                this.f30037h.obtainMessage(7, sVarA).sendToTarget();
            }
        }
        long j24 = this.C.a(this.B.f30008f, this.f30039j, false).f30500d;
        if (z13 && ((j24 == j22 || j24 <= this.f30040k.f30022c) && this.B.f30010h)) {
            a(4);
            g();
        } else {
            int i19 = this.f30048u;
            if (i19 == 2) {
                if (this.f30043p.length > 0) {
                    if (z12) {
                        boolean z15 = this.f30046s;
                        h hVar19 = this.f30053z;
                        if (!hVar19.f30011i) {
                            jC = hVar19.f30009g;
                        } else {
                            jC = hVar19.f30003a.c();
                        }
                        if (jC == j11) {
                            h hVar20 = this.f30053z;
                            if (!hVar20.f30010h) {
                                jC = this.C.a(hVar20.f30008f, this.f30039j, false).f30500d;
                                c cVar = this.f30033d;
                                h hVar21 = this.f30053z;
                                long jAbs = jC - Math.abs(this.f30052y - (hVar21.f30007e - hVar21.f30009g));
                                j15 = !z15 ? cVar.f29101e : cVar.f29100d;
                                if (j15 > j21 || jAbs >= j15) {
                                }
                            }
                            a(3);
                            if (this.f30045r) {
                                this.f30046s = false;
                                com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar2 = this.f30034e;
                                if (uVar2.f30481a) {
                                    i12 = 1;
                                } else {
                                    uVar2.f30483c = SystemClock.elapsedRealtime();
                                    i12 = 1;
                                    uVar2.f30481a = true;
                                }
                                for (a aVar5 : this.f30043p) {
                                    if (aVar5.f28971c == i12) {
                                        aVar5.f28971c = 2;
                                        aVar5.i();
                                    } else {
                                        throw new IllegalStateException();
                                    }
                                }
                            }
                        } else {
                            c cVar2 = this.f30033d;
                            h hVar212 = this.f30053z;
                            long jAbs2 = jC - Math.abs(this.f30052y - (hVar212.f30007e - hVar212.f30009g));
                            if (!z15) {
                            }
                            if (j15 > j21) {
                                a(3);
                                if (this.f30045r) {
                                }
                            } else {
                                a(3);
                                if (this.f30045r) {
                                }
                            }
                        }
                    }
                } else if (j24 == j22 || this.f30040k.f30022c < j24 || ((hVar6 = this.B.f30013k) != null && hVar6.f30011i)) {
                }
                if (this.f30048u == i11) {
                    for (a aVar6 : this.f30043p) {
                        aVar6.f28972d.a();
                    }
                }
                if ((!this.f30045r && this.f30048u == 3) || this.f30048u == 2) {
                    a(jElapsedRealtime, 10L);
                } else if (this.f30043p.length != 0) {
                    a(jElapsedRealtime, 1000L);
                } else {
                    this.f30035f.removeMessages(2);
                }
                com.fyber.inneractive.sdk.player.exoplayer2.util.w.a();
            }
            if (i19 == 3) {
                if (!(this.f30043p.length > 0 ? z12 : j24 == j22 || this.f30040k.f30022c < j24 || ((hVar5 = this.B.f30013k) != null && hVar5.f30011i))) {
                    this.f30046s = this.f30045r;
                    i11 = 2;
                    a(2);
                    g();
                }
            }
            if (this.f30048u == i11) {
            }
            if (!this.f30045r) {
                if (this.f30043p.length != 0) {
                }
            } else if (this.f30043p.length != 0) {
            }
            com.fyber.inneractive.sdk.player.exoplayer2.util.w.a();
            i11 = 2;
            if (this.f30048u == i11) {
            }
            if (!this.f30045r) {
            }
            com.fyber.inneractive.sdk.player.exoplayer2.util.w.a();
        }
        i11 = 2;
        if (this.f30048u == i11) {
        }
        if (!this.f30045r) {
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.w.a();
    }

    public final void c() {
        h hVar = this.f30053z;
        if (hVar == null || hVar.f30011i) {
            return;
        }
        h hVar2 = this.A;
        if (hVar2 == null || hVar2.f30013k == hVar) {
            for (a aVar : this.f30043p) {
                if (!aVar.f28974f) {
                    return;
                }
            }
            this.f30053z.f30003a.d();
        }
    }

    public final void b() {
        int i5;
        h hVar = this.f30053z;
        long jF = !hVar.f30011i ? 0L : hVar.f30003a.f();
        if (jF == Long.MIN_VALUE) {
            b(false);
            return;
        }
        h hVar2 = this.f30053z;
        long jAbs = Math.abs(this.f30052y - (hVar2.f30007e - hVar2.f30009g));
        long j11 = jF - jAbs;
        c cVar = this.f30033d;
        char c11 = j11 > cVar.f29099c ? (char) 0 : j11 < cVar.f29098b ? (char) 2 : (char) 1;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.l lVar = cVar.f29097a;
        synchronized (lVar) {
            i5 = lVar.f30373c * SQLiteDatabase.OPEN_FULLMUTEX;
        }
        boolean z11 = c11 == 2 || (c11 == 1 && cVar.f29103g && !(i5 >= cVar.f29102f));
        cVar.f29103g = z11;
        b(z11);
        if (z11) {
            h hVar3 = this.f30053z;
            hVar3.f30014l = false;
            hVar3.f30003a.b(jAbs);
            return;
        }
        this.f30053z.f30014l = true;
    }

    public final void a(long j11, long j12) {
        this.f30035f.removeMessages(2);
        long jElapsedRealtime = (j11 + j12) - SystemClock.elapsedRealtime();
        if (jElapsedRealtime <= 0) {
            this.f30035f.sendEmptyMessage(2);
        } else {
            this.f30035f.sendEmptyMessageDelayed(2, jElapsedRealtime);
        }
    }

    public final long a(int i5, long j11) throws d {
        h hVar;
        g();
        this.f30046s = false;
        a(2);
        h hVar2 = this.B;
        if (hVar2 == null) {
            h hVar3 = this.f30053z;
            if (hVar3 != null) {
                hVar3.a();
            }
            hVar = null;
        } else {
            hVar = null;
            while (hVar2 != null) {
                if (hVar2.f30008f == i5 && hVar2.f30011i) {
                    hVar = hVar2;
                } else {
                    hVar2.a();
                }
                hVar2 = hVar2.f30013k;
            }
        }
        h hVar4 = this.B;
        if (hVar4 != hVar || hVar4 != this.A) {
            for (a aVar : this.f30043p) {
                aVar.c();
            }
            this.f30043p = new a[0];
            this.n = null;
            this.f30042m = null;
            this.B = null;
        }
        if (hVar != null) {
            hVar.f30013k = null;
            this.f30053z = hVar;
            this.A = hVar;
            a(hVar);
            h hVar5 = this.B;
            if (hVar5.f30012j) {
                j11 = hVar5.f30003a.a(j11);
            }
            a(j11);
            b();
        } else {
            this.f30053z = null;
            this.A = null;
            this.B = null;
            a(j11);
        }
        this.f30035f.sendEmptyMessage(2);
        return j11;
    }

    public final void a(long j11) {
        h hVar = this.B;
        long j12 = hVar == null ? j11 + 60000000 : j11 + (hVar.f30007e - hVar.f30009g);
        this.f30052y = j12;
        this.f30034e.a(j12);
        for (a aVar : this.f30043p) {
            long j13 = this.f30052y;
            aVar.f28975g = false;
            aVar.f28974f = false;
            aVar.a(false, j13);
        }
    }

    public final void a(s sVar) {
        s sVarA;
        com.fyber.inneractive.sdk.player.exoplayer2.util.h hVar = this.n;
        if (hVar != null) {
            sVarA = hVar.a(sVar);
        } else {
            sVarA = this.f30034e.a(sVar);
        }
        this.f30041l = sVarA;
        this.f30037h.obtainMessage(7, sVarA).sendToTarget();
    }

    public final void a(boolean z11) {
        this.f30035f.removeMessages(2);
        this.f30046s = false;
        com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar = this.f30034e;
        if (uVar.f30481a) {
            uVar.a(uVar.b());
            uVar.f30481a = false;
        }
        this.n = null;
        this.f30042m = null;
        this.f30052y = 60000000L;
        for (a aVar : this.f30043p) {
            try {
                a(aVar);
                aVar.c();
            } catch (d | RuntimeException e3) {
                Log.e("ExoPlayerImplInternal", "Stop failed.", e3);
            }
        }
        this.f30043p = new a[0];
        h hVar = this.B;
        if (hVar == null) {
            hVar = this.f30053z;
        }
        while (hVar != null) {
            hVar.a();
            hVar = hVar.f30013k;
        }
        this.f30053z = null;
        this.A = null;
        this.B = null;
        b(false);
        if (z11) {
            com.fyber.inneractive.sdk.player.exoplayer2.source.u uVar2 = this.o;
            if (uVar2 != null) {
                uVar2.b();
                this.o = null;
            }
            this.C = null;
        }
    }

    public final void a(e[] eVarArr) {
        try {
            for (e eVar : eVarArr) {
                eVar.f29124a.a(eVar.f29125b, eVar.f29126c);
            }
            if (this.o != null) {
                this.f30035f.sendEmptyMessage(2);
            }
            synchronized (this) {
                notifyAll();
            }
        } catch (Throwable th2) {
            synchronized (this) {
                notifyAll();
                throw th2;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x00c9  */
    /* JADX WARN: Type inference failed for: r9v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r9v7 */
    /* JADX WARN: Type inference failed for: r9v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Pair pair) {
        boolean z11;
        int i5;
        ?? r92;
        x xVar = this.C;
        x xVar2 = (x) pair.first;
        this.C = xVar2;
        Object obj = pair.second;
        if (xVar != null) {
            z11 = false;
            i5 = z11 ? 1 : 0;
            r92 = z11;
        } else if (this.f30050w > 0) {
            Pair pairA = a(this.f30051x);
            int i11 = this.f30050w;
            this.f30050w = 0;
            this.f30051x = null;
            if (pairA == null) {
                i iVar = new i(0, 0L);
                this.f30040k = iVar;
                this.f30037h.obtainMessage(6, new k(this.C, obj, iVar, i11)).sendToTarget();
                this.f30040k = new i(0, -9223372036854775807L);
                a(4);
                a(false);
                return;
            }
            this.f30040k = new i(((Integer) pairA.first).intValue(), ((Long) pairA.second).longValue());
            r92 = 0;
            i5 = i11;
        } else {
            if (this.f30040k.f30021b == -9223372036854775807L) {
                if (xVar2.c()) {
                    i iVar2 = new i(0, 0L);
                    this.f30040k = iVar2;
                    this.f30037h.obtainMessage(6, new k(this.C, obj, iVar2, 0)).sendToTarget();
                    this.f30040k = new i(0, -9223372036854775807L);
                    a(4);
                    a(false);
                    return;
                }
                z11 = false;
                Pair pairA2 = a(this.C, 0, -9223372036854775807L, 0L);
                this.f30040k = new i(((Integer) pairA2.first).intValue(), ((Long) pairA2.second).longValue());
            }
            i5 = z11 ? 1 : 0;
            r92 = z11;
        }
        h hVar = this.B;
        if (hVar == null) {
            hVar = this.f30053z;
        }
        if (hVar == null) {
            this.f30037h.obtainMessage(6, new k(this.C, obj, this.f30040k, i5)).sendToTarget();
            return;
        }
        int iA = this.C.a(hVar.f30004b);
        if (iA == -1) {
            int i12 = hVar.f30008f;
            x xVar3 = this.C;
            int iA2 = -1;
            while (iA2 == -1 && i12 < xVar.a() - 1) {
                i12++;
                iA2 = xVar3.a(xVar.a(i12, this.f30039j, true).f30498b);
            }
            if (iA2 == -1) {
                i iVar3 = new i(r92, 0L);
                this.f30040k = iVar3;
                this.f30037h.obtainMessage(6, new k(this.C, obj, iVar3, i5)).sendToTarget();
                this.f30040k = new i(r92, -9223372036854775807L);
                a(4);
                a((boolean) r92);
                return;
            }
            int i13 = this.C.a(iA2, this.f30039j, (boolean) r92).f30499c;
            h hVar2 = hVar;
            Pair pairA3 = a(this.C, 0, -9223372036854775807L, 0L);
            int iIntValue = ((Integer) pairA3.first).intValue();
            long jLongValue = ((Long) pairA3.second).longValue();
            this.C.a(iIntValue, this.f30039j, true);
            Object obj2 = this.f30039j.f30498b;
            hVar2.f30008f = -1;
            while (true) {
                hVar2 = hVar2.f30013k;
                if (hVar2 != null) {
                    hVar2.f30008f = hVar2.f30004b.equals(obj2) ? iIntValue : -1;
                } else {
                    i iVar4 = new i(iIntValue, a(iIntValue, jLongValue));
                    this.f30040k = iVar4;
                    this.f30037h.obtainMessage(6, new k(this.C, obj, iVar4, i5)).sendToTarget();
                    return;
                }
            }
        } else {
            h hVar3 = hVar;
            this.C.a(iA, this.f30039j, (boolean) r92);
            boolean z12 = (iA != this.C.a() - 1 || this.C.a(this.f30039j.f30499c, this.f30038i, 0L).f30572b) ? r92 : true;
            hVar3.f30008f = iA;
            hVar3.f30010h = z12;
            boolean z13 = hVar3 == this.A ? true : r92;
            i iVar5 = this.f30040k;
            if (iA != iVar5.f30020a) {
                i iVar6 = new i(iA, iVar5.f30021b);
                iVar6.f30022c = iVar5.f30022c;
                this.f30040k = iVar6;
            }
            int i14 = iA;
            boolean z14 = z13;
            h hVar4 = hVar3;
            while (true) {
                h hVar5 = hVar4.f30013k;
                if (hVar5 == null) {
                    break;
                }
                i14++;
                this.C.a(i14, this.f30039j, true);
                boolean z15 = (i14 != this.C.a() - 1 || this.C.a(this.f30039j.f30499c, this.f30038i, 0L).f30572b) ? r92 : true;
                if (hVar5.f30004b.equals(this.f30039j.f30498b)) {
                    hVar5.f30008f = i14;
                    hVar5.f30010h = z15;
                    hVar4 = hVar5;
                    z14 |= hVar5 == this.A ? true : r92;
                } else if (!z14) {
                    int i15 = this.B.f30008f;
                    this.f30040k = new i(i15, a(i15, this.f30040k.f30022c));
                } else {
                    this.f30053z = hVar4;
                    hVar4.f30013k = null;
                    while (hVar5 != null) {
                        hVar5.a();
                        hVar5 = hVar5.f30013k;
                    }
                }
            }
            this.f30037h.obtainMessage(6, new k(this.C, obj, this.f30040k, i5)).sendToTarget();
        }
    }

    public final Pair a(j jVar) {
        x xVar = jVar.f30023a;
        if (xVar.c()) {
            xVar = this.C;
        }
        x xVar2 = xVar;
        try {
            Pair pairA = a(xVar2, jVar.f30024b, jVar.f30025c, 0L);
            x xVar3 = this.C;
            if (xVar3 == xVar2) {
                return pairA;
            }
            int iA = xVar3.a(xVar2.a(((Integer) pairA.first).intValue(), this.f30039j, true).f30498b);
            if (iA != -1) {
                return Pair.create(Integer.valueOf(iA), (Long) pairA.second);
            }
            int iIntValue = ((Integer) pairA.first).intValue();
            x xVar4 = this.C;
            int iA2 = -1;
            while (iA2 == -1 && iIntValue < xVar2.a() - 1) {
                iIntValue++;
                iA2 = xVar4.a(xVar2.a(iIntValue, this.f30039j, true).f30498b);
            }
            if (iA2 == -1) {
                return null;
            }
            int i5 = this.C.a(iA2, this.f30039j, false).f30499c;
            return a(this.C, 0, -9223372036854775807L, 0L);
        } catch (IndexOutOfBoundsException unused) {
            throw new q();
        }
    }

    public final Pair a(x xVar, int i5, long j11, long j12) {
        int iB = xVar.b();
        if (i5 >= 0 && i5 < iB) {
            xVar.a(i5, this.f30038i, j12);
            if (j11 == -9223372036854775807L) {
                j11 = this.f30038i.f30575e;
                if (j11 == -9223372036854775807L) {
                    return null;
                }
            }
            w wVar = this.f30038i;
            int i11 = wVar.f30573c;
            long j13 = wVar.f30577g + j11;
            long j14 = xVar.a(i11, this.f30039j, false).f30500d;
            while (j14 != -9223372036854775807L && j13 >= j14 && i11 < this.f30038i.f30574d) {
                j13 -= j14;
                i11++;
                j14 = xVar.a(i11, this.f30039j, false).f30500d;
            }
            return Pair.create(Integer.valueOf(i11), Long.valueOf(j13));
        }
        throw new IndexOutOfBoundsException();
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.source.s sVar) throws d {
        com.fyber.inneractive.sdk.player.exoplayer2.source.s sVar2;
        h hVar = this.f30053z;
        if (hVar == null || (sVar2 = hVar.f30003a) != sVar) {
            return;
        }
        hVar.f30011i = true;
        com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVarA = hVar.f30016p.a(hVar.o, sVar2.a());
        com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVar = hVar.f30019s;
        if (jVar != null) {
            for (int i5 = 0; i5 < jVarA.f30269b.f30265a; i5++) {
                if (!jVarA.a(jVar, i5)) {
                    hVar.f30015m = jVarA;
                    break;
                }
            }
        } else {
            hVar.f30015m = jVarA;
            break;
        }
        hVar.f30009g = hVar.a(hVar.f30009g, false, new boolean[hVar.n.length]);
        if (this.B == null) {
            h hVar2 = this.f30053z;
            this.A = hVar2;
            a(hVar2.f30009g);
            a(this.A);
        }
        b();
    }

    public final void a(h hVar) throws d {
        if (this.B == hVar) {
            return;
        }
        boolean[] zArr = new boolean[this.f30030a.length];
        int i5 = 0;
        int i11 = 0;
        while (true) {
            a[] aVarArr = this.f30030a;
            if (i5 < aVarArr.length) {
                a aVar = aVarArr[i5];
                boolean z11 = aVar.f28971c != 0;
                zArr[i5] = z11;
                com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar = hVar.f30015m.f30269b.f30266b[i5];
                if (bVar != null) {
                    i11++;
                }
                if (z11 && (bVar == null || (aVar.f28975g && aVar.f28972d == this.B.f30005c[i5]))) {
                    if (aVar == this.f30042m) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.u uVar = this.f30034e;
                        com.fyber.inneractive.sdk.player.exoplayer2.util.h hVar2 = this.n;
                        uVar.getClass();
                        uVar.a(hVar2.b());
                        uVar.f30484d = hVar2.a();
                        this.n = null;
                        this.f30042m = null;
                    }
                    a(aVar);
                    aVar.c();
                }
                i5++;
            } else {
                this.B = hVar;
                this.f30037h.obtainMessage(3, hVar.f30015m).sendToTarget();
                a(zArr, i11);
                return;
            }
        }
    }

    public final void a(boolean[] zArr, int i5) throws d {
        int i11;
        this.f30043p = new a[i5];
        int i12 = 0;
        int i13 = 0;
        while (true) {
            a[] aVarArr = this.f30030a;
            if (i12 >= aVarArr.length) {
                return;
            }
            a aVar = aVarArr[i12];
            com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVar = this.B.f30015m;
            com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar = jVar.f30269b.f30266b[i12];
            if (bVar != null) {
                int i14 = i13 + 1;
                this.f30043p[i13] = aVar;
                if (aVar.f28971c == 0) {
                    t tVar = jVar.f30271d[i12];
                    boolean z11 = this.f30045r && this.f30048u == 3;
                    boolean z12 = !zArr[i12] && z11;
                    int length = bVar.f30258c.length;
                    o[] oVarArr = new o[length];
                    for (int i15 = 0; i15 < length; i15++) {
                        oVarArr[i15] = bVar.f30259d[i15];
                    }
                    h hVar = this.B;
                    com.fyber.inneractive.sdk.player.exoplayer2.source.v vVar = hVar.f30005c[i12];
                    long j11 = this.f30052y;
                    i11 = i12;
                    long j12 = hVar.f30007e - hVar.f30009g;
                    if (aVar.f28971c == 0) {
                        aVar.f28970b = tVar;
                        aVar.f28971c = 1;
                        aVar.h();
                        if (!aVar.f28975g) {
                            aVar.f28972d = vVar;
                            aVar.f28974f = false;
                            aVar.f28973e = j12;
                            aVar.a(oVarArr);
                            aVar.a(z12, j11);
                            com.fyber.inneractive.sdk.player.exoplayer2.util.h hVarD = aVar.d();
                            if (hVarD != null) {
                                if (this.n == null) {
                                    this.n = hVarD;
                                    this.f30042m = aVar;
                                    ((MediaCodecAudioRenderer) hVarD).Q.a(this.f30041l);
                                } else {
                                    throw new d(new IllegalStateException("Multiple renderer media clocks enabled."));
                                }
                            }
                            if (z11) {
                                if (aVar.f28971c == 1) {
                                    aVar.f28971c = 2;
                                    aVar.i();
                                } else {
                                    throw new IllegalStateException();
                                }
                            }
                        } else {
                            throw new IllegalStateException();
                        }
                    } else {
                        throw new IllegalStateException();
                    }
                } else {
                    i11 = i12;
                }
                i13 = i14;
            } else {
                i11 = i12;
            }
            i12 = i11 + 1;
        }
    }
}
