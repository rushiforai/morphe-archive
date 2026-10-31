package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class s implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i0 f31379a;

    public s(i0 i0Var) {
        this.f31379a = i0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            i0 i0Var = this.f31379a;
            if (i0Var.V != null) {
                IAlog.a("%sunregistering orientation broadcast receiver", IAlog.a(i0Var));
                this.f31379a.V.a();
            }
        } catch (IllegalArgumentException e3) {
            if (e3.getMessage() != null && !e3.getMessage().contains("Receiver not registered")) {
                throw e3;
            }
        }
        this.f31379a.V = null;
    }
}
