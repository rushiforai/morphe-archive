package com.fyber.inneractive.sdk.player.ui;

/* loaded from: classes3.dex */
public final class k implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f30693a;

    public k(l lVar) {
        this.f30693a = lVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        l lVar = this.f30693a;
        int i5 = lVar.f30732k;
        if (i5 != 0) {
            int i11 = (lVar.f30731j / i5) + lVar.F;
            lVar.F = i11;
            lVar.a(i11);
        }
        l lVar2 = this.f30693a;
        if (lVar2.F < lVar2.G) {
            lVar2.postDelayed(lVar2.E, lVar2.f30733l);
            return;
        }
        lVar2.E = null;
        lVar2.F = 0;
        lVar2.G = 0;
    }
}
