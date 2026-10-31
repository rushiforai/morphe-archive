package io.sentry;

import java.util.TimerTask;

/* loaded from: classes4.dex */
public final class d4 extends TimerTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67194a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f4 f67195b;

    public /* synthetic */ d4(f4 f4Var, int i5) {
        this.f67194a = i5;
        this.f67195b = f4Var;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public final void run() {
        switch (this.f67194a) {
            case 0:
                f4 f4Var = this.f67195b;
                m4 m4VarH = f4Var.h();
                if (m4VarH == null) {
                    m4VarH = m4.OK;
                }
                f4Var.q(m4VarH, null);
                f4Var.f67234k.set(false);
                break;
            default:
                f4 f4Var2 = this.f67195b;
                m4 m4VarH2 = f4Var2.h();
                if (m4VarH2 == null) {
                    m4VarH2 = m4.DEADLINE_EXCEEDED;
                }
                f4Var2.b(m4VarH2, f4Var2.f67239r.f67768e != null, null);
                f4Var2.f67235l.set(false);
                break;
        }
    }
}
