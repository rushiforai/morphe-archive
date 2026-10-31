package com.facebook.ads.redexgen.X;

import java.io.File;
import java.util.concurrent.Callable;

/* renamed from: com.facebook.ads.redexgen.X.dS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC1627dS implements Callable<Void> {
    public final File A00;
    public final /* synthetic */ NH A01;

    public CallableC1627dS(NH nh2, File file) {
        this.A01 = nh2;
        this.A00 = file;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.concurrent.Callable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final Void call() throws Exception {
        this.A01.A06(this.A00);
        return null;
    }
}
