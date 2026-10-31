package com.fyber.inneractive.sdk.player.exoplayer2.source;

/* loaded from: classes3.dex */
public final class i implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f30184a;

    public i(p pVar) {
        this.f30184a = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p pVar = this.f30184a;
        if (pVar.G || pVar.f30221s || pVar.f30219q == null || !pVar.f30220r) {
            return;
        }
        int size = pVar.o.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) pVar.o.valueAt(i5)).e() == null) {
                return;
            }
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.e eVar = pVar.f30215k;
        synchronized (eVar) {
            eVar.f30434a = false;
        }
        y[] yVarArr = new y[size];
        pVar.f30228z = new boolean[size];
        pVar.f30227y = new boolean[size];
        pVar.f30226x = pVar.f30219q.c();
        int i11 = 0;
        while (true) {
            boolean z11 = true;
            if (i11 >= size) {
                pVar.f30225w = new z(yVarArr);
                pVar.f30221s = true;
                t tVar = pVar.f30210f;
                long j11 = pVar.f30226x;
                tVar.a(new x(j11, j11, 0L, 0L, pVar.f30219q.a(), false), null);
                ((com.fyber.inneractive.sdk.player.exoplayer2.l) pVar.f30218p).f30035f.obtainMessage(8, pVar).sendToTarget();
                return;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.o oVarE = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) pVar.o.valueAt(i11)).e();
            yVarArr[i11] = new y(oVarE);
            String str = oVarE.f30128f;
            if (!"video".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str)) && !"audio".equals(com.fyber.inneractive.sdk.player.exoplayer2.util.i.b(str))) {
                z11 = false;
            }
            pVar.f30228z[i11] = z11;
            pVar.A = z11 | pVar.A;
            i11++;
        }
    }
}
