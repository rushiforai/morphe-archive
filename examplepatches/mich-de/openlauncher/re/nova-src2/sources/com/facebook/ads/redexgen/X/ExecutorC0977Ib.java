package com.facebook.ads.redexgen.X;

import android.os.Handler;
import java.util.concurrent.Executor;

/* renamed from: com.facebook.ads.redexgen.X.Ib, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final /* synthetic */ class ExecutorC0977Ib implements Executor {
    public final /* synthetic */ Handler A00;

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        this.A00.post(runnable);
    }
}
