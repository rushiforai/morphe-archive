package io.sentry.android.core;

import b.u4;
import java.util.Iterator;
import java.util.TimerTask;

/* loaded from: classes4.dex */
public final class l0 extends TimerTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66988a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f66989b;

    public /* synthetic */ l0(Object obj, int i5) {
        this.f66988a = i5;
        this.f66989b = obj;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public final void run() {
        switch (this.f66988a) {
            case 0:
                m0 m0Var = (m0) this.f66989b;
                io.sentry.b0 b0Var = m0Var.f66996g;
                if (m0Var.f66997h) {
                    b0Var.v();
                }
                b0Var.t().getReplayController().getClass();
                return;
            default:
                Iterator it = ((io.sentry.transport.m) this.f66989b).f67816d.iterator();
                if (it.hasNext()) {
                    throw u4.e(it);
                }
                return;
        }
    }
}
