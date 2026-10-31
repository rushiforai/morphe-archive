package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Iterator;

/* renamed from: com.facebook.ads.redexgen.X.iL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1925iL implements Runnable {
    public final /* synthetic */ C7S A00;
    public final /* synthetic */ ArrayList A01;

    public RunnableC1925iL(C7S c7s, ArrayList arrayList) {
        this.A00 = c7s;
        this.A01 = arrayList;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Iterator it = this.A01.iterator();
        while (it.hasNext()) {
            C1934iU c1934iU = (C1934iU) it.next();
            this.A00.A0e(c1934iU.A04, c1934iU.A00, c1934iU.A01, c1934iU.A02, c1934iU.A03);
        }
        this.A01.clear();
        this.A00.A05.remove(this.A01);
    }
}
