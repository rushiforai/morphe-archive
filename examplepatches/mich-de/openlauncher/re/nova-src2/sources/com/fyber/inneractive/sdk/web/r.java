package com.fyber.inneractive.sdk.web;

import android.content.Context;
import android.content.IntentFilter;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class r implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i0 f31371a;

    public r(i0 i0Var) {
        this.f31371a = i0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        i0 i0Var = this.f31371a;
        if (i0Var.V == null) {
            try {
                IAlog.a("%sregistering orientation broadcast receiver", IAlog.a(i0Var));
                this.f31371a.V = new e0(this.f31371a);
                if (com.fyber.inneractive.sdk.util.o.a(this.f31371a.f31304b) != null) {
                    i0 i0Var2 = this.f31371a;
                    e0 e0Var = i0Var2.V;
                    Context contextA = com.fyber.inneractive.sdk.util.o.a(i0Var2.f31304b);
                    i0 i0Var3 = e0Var.f31293c;
                    i0Var3.getClass();
                    IAlog.a("%sregister screen broadcast receiver", IAlog.a(i0Var3));
                    e0Var.f31291a = contextA;
                    contextA.registerReceiver(e0Var, new IntentFilter("android.intent.action.CONFIGURATION_CHANGED"));
                }
            } catch (Exception e3) {
                i0 i0Var4 = this.f31371a;
                i0Var4.getClass();
                IAlog.f("%sfailed registering orientation broadcast recevier", IAlog.a(i0Var4));
                if (IAlog.f31163a >= 3) {
                    e3.printStackTrace();
                }
            }
        }
    }
}
