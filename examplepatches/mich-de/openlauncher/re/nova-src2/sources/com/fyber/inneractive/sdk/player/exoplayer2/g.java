package com.fyber.inneractive.sdk.player.exoplayer2;

import android.os.Looper;
import android.util.Log;
import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.trackselection.i f29986a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.trackselection.h f29987b;

    /* renamed from: c, reason: collision with root package name */
    public final f f29988c;

    /* renamed from: d, reason: collision with root package name */
    public final l f29989d;

    /* renamed from: e, reason: collision with root package name */
    public final CopyOnWriteArraySet f29990e;

    /* renamed from: f, reason: collision with root package name */
    public final w f29991f;

    /* renamed from: g, reason: collision with root package name */
    public final v f29992g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f29993h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f29994i;

    /* renamed from: j, reason: collision with root package name */
    public int f29995j;

    /* renamed from: k, reason: collision with root package name */
    public int f29996k;

    /* renamed from: l, reason: collision with root package name */
    public int f29997l;

    /* renamed from: m, reason: collision with root package name */
    public x f29998m;
    public Object n;
    public com.fyber.inneractive.sdk.player.exoplayer2.trackselection.h o;

    /* renamed from: p, reason: collision with root package name */
    public s f29999p;

    /* renamed from: q, reason: collision with root package name */
    public i f30000q;

    /* renamed from: r, reason: collision with root package name */
    public int f30001r;

    /* renamed from: s, reason: collision with root package name */
    public long f30002s;

    public g(a[] aVarArr, com.fyber.inneractive.sdk.player.exoplayer2.trackselection.d dVar, c cVar) {
        Log.i("ExoPlayerImpl", "Init ExoPlayerLib/2.4.4 [" + z.f30493e + "]");
        if (aVarArr.length <= 0) {
            throw new IllegalStateException();
        }
        this.f29986a = dVar;
        this.f29994i = false;
        this.f29995j = 1;
        this.f29990e = new CopyOnWriteArraySet();
        com.fyber.inneractive.sdk.player.exoplayer2.trackselection.h hVar = new com.fyber.inneractive.sdk.player.exoplayer2.trackselection.h(new com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b[aVarArr.length]);
        this.f29987b = hVar;
        this.f29998m = x.f30578a;
        this.f29991f = new w();
        this.f29992g = new v();
        int i5 = com.fyber.inneractive.sdk.player.exoplayer2.source.z.f30247d;
        this.o = hVar;
        this.f29999p = s.f30148d;
        f fVar = new f(this, Looper.myLooper() != null ? Looper.myLooper() : Looper.getMainLooper());
        this.f29988c = fVar;
        i iVar = new i(0, 0L);
        this.f30000q = iVar;
        this.f29989d = new l(aVarArr, dVar, cVar, this.f29994i, fVar, iVar, this);
    }

    public final void a(boolean z11) {
        if (this.f29994i != z11) {
            this.f29994i = z11;
            this.f29989d.f30035f.obtainMessage(1, z11 ? 1 : 0, 0).sendToTarget();
            Iterator it = this.f29990e.iterator();
            while (it.hasNext()) {
                ((b0) it.next()).a(this.f29995j, z11);
            }
        }
    }

    public final void a(int i5, long j11) {
        long j12;
        if (i5 >= 0 && (this.f29998m.c() || i5 < this.f29998m.b())) {
            this.f29996k++;
            this.f30001r = i5;
            if (this.f29998m.c()) {
                j12 = 1000;
            } else {
                this.f29998m.a(i5, this.f29991f, 0L);
                long j13 = j11 == -9223372036854775807L ? this.f29991f.f30575e : j11;
                w wVar = this.f29991f;
                int i11 = wVar.f30573c;
                long j14 = wVar.f30577g;
                int i12 = b.f29095a;
                long j15 = (j13 == -9223372036854775807L ? -9223372036854775807L : j13 * 1000) + j14;
                j12 = 1000;
                long j16 = this.f29998m.a(i11, this.f29992g, false).f30500d;
                while (j16 != -9223372036854775807L && j15 >= j16 && i11 < this.f29991f.f30574d) {
                    j15 -= j16;
                    i11++;
                    j16 = this.f29998m.a(i11, this.f29992g, false).f30500d;
                }
            }
            if (j11 == -9223372036854775807L) {
                this.f30002s = 0L;
                this.f29989d.f30035f.obtainMessage(3, new j(this.f29998m, i5, -9223372036854775807L)).sendToTarget();
                return;
            }
            this.f30002s = j11;
            l lVar = this.f29989d;
            x xVar = this.f29998m;
            int i13 = b.f29095a;
            lVar.f30035f.obtainMessage(3, new j(xVar, i5, j11 != -9223372036854775807L ? j11 * j12 : -9223372036854775807L)).sendToTarget();
            Iterator it = this.f29990e.iterator();
            while (it.hasNext()) {
                ((b0) it.next()).getClass();
            }
            return;
        }
        throw new q();
    }

    public final void a(e... eVarArr) {
        l lVar = this.f29989d;
        if (lVar.f30044q) {
            Log.w("ExoPlayerImplInternal", "Ignoring messages sent after release.");
        } else {
            lVar.f30035f.obtainMessage(11, eVarArr).sendToTarget();
        }
    }

    public final int a() {
        if (!this.f29998m.c() && this.f29996k <= 0) {
            return this.f29998m.a(this.f30000q.f30020a, this.f29992g, false).f30499c;
        }
        return this.f30001r;
    }
}
