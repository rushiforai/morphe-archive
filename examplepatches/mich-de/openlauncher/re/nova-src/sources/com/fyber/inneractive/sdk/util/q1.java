package com.fyber.inneractive.sdk.util;

/* loaded from: classes.dex */
public final class q1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t1 f31214a;

    public q1(t1 t1Var) {
        this.f31214a = t1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        t1 t1Var = this.f31214a;
        t1Var.getClass();
        r.f31215a.execute(new s1(t1Var));
    }
}
