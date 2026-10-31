package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;

/* renamed from: com.facebook.ads.redexgen.X.ku, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC2081ku implements Callable<Boolean> {
    public final BlockingQueue<Boolean> A00 = new LinkedBlockingQueue();
    public final /* synthetic */ C2086kz A01;

    public CallableC2081ku(C2086kz c2086kz, C2082kv c2082kv) {
        this.A01 = c2086kz;
        new Handler(Looper.getMainLooper()).post(new C0961Hl(this, c2086kz, c2082kv));
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.concurrent.Callable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final Boolean call() throws Exception {
        return this.A00.take();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A03(C2082kv c2082kv) throws SecurityException {
        long jCurrentTimeMillis = System.currentTimeMillis();
        C1562cP c1562cPA06 = C1562cP.A06(this.A01.A04.A02());
        Uri uriA00 = AbstractC2351pP.A00(c2082kv.A08);
        long jA0Q = c2082kv.A00;
        if (jA0Q == -1) {
            jA0Q = C2203mv.A0Q(this.A01.A04);
        }
        c1562cPA06.A0I(uriA00, new C0960Hk(this, c2082kv, jA0Q, jCurrentTimeMillis), jA0Q);
    }
}
