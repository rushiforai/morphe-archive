package io.sentry.android.core;

import android.os.Debug;
import io.sentry.a2;
import io.sentry.n1;

/* loaded from: classes4.dex */
public final class k implements io.sentry.l0 {
    @Override // io.sentry.l0
    public final void a() {
    }

    @Override // io.sentry.l0
    public final void b(a2 a2Var) {
        a2Var.f66739a = new n1(System.currentTimeMillis(), Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory(), Debug.getNativeHeapSize() - Debug.getNativeHeapFreeSize());
    }
}
