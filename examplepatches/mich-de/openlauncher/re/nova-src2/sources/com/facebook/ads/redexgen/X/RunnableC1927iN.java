package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Iterator;

/* renamed from: com.facebook.ads.redexgen.X.iN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1927iN implements Runnable {
    public final /* synthetic */ C7S A00;
    public final /* synthetic */ ArrayList A01;

    public RunnableC1927iN(C7S c7s, ArrayList arrayList) {
        this.A00 = c7s;
        this.A01 = arrayList;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Iterator it = this.A01.iterator();
        while (it.hasNext()) {
            AbstractC1978jE holder = (AbstractC1978jE) it.next();
            this.A00.A0d(holder);
        }
        this.A01.clear();
        this.A00.A01.remove(this.A01);
    }
}
