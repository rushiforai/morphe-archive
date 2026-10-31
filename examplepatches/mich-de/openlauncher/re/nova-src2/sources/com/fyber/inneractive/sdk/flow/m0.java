package com.fyber.inneractive.sdk.flow;

import android.os.CountDownTimer;

/* loaded from: classes3.dex */
public final class m0 extends CountDownTimer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p0 f28182a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(p0 p0Var, long j11) {
        super(j11, 1000L);
        this.f28182a = p0Var;
    }

    @Override // android.os.CountDownTimer
    public final void onFinish() {
        m0 m0Var = this.f28182a.f28275w;
        if (m0Var != null) {
            m0Var.cancel();
        }
        this.f28182a.e(false);
    }

    @Override // android.os.CountDownTimer
    public final void onTick(long j11) {
        int i5 = ((int) j11) / 1000;
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28182a.f28265k;
        if (eVar != null) {
            eVar.updateCloseCountdown(i5);
        }
    }
}
