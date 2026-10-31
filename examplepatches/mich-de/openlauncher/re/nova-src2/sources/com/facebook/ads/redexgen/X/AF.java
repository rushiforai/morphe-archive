package com.facebook.ads.redexgen.X;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: assets/audience_network/classes.dex */
public class AF implements InterfaceC1527bq {
    public final /* synthetic */ C06444o A00;
    public final /* synthetic */ CountDownLatch A01;
    public final /* synthetic */ AtomicReference A02;
    public final /* synthetic */ AtomicReference A03;

    public AF(C06444o c06444o, AtomicReference atomicReference, AtomicReference atomicReference2, CountDownLatch countDownLatch) {
        this.A00 = c06444o;
        this.A03 = atomicReference;
        this.A02 = atomicReference2;
        this.A01 = countDownLatch;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1527bq
    public final void AES(InterfaceC1533bw interfaceC1533bw) {
        C06444o.A06(interfaceC1533bw.A7d(), this.A03, this.A02);
        this.A01.countDown();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1527bq
    public final void AEs(Exception exc) {
        this.A02.set(exc);
        this.A01.countDown();
    }
}
