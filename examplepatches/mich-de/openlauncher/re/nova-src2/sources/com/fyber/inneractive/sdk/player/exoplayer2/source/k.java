package com.fyber.inneractive.sdk.player.exoplayer2.source;

/* loaded from: classes3.dex */
public final class k implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f30186a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30187b;

    public k(p pVar, n nVar) {
        this.f30187b = pVar;
        this.f30186a = nVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        n nVar = this.f30186a;
        if (nVar.f30202c != null) {
            nVar.f30202c = null;
        }
        int size = this.f30187b.o.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) this.f30187b.o.valueAt(i5)).b();
        }
    }
}
