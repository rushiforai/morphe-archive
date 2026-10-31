package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f31266a;

    public c(i1 i1Var) {
        this.f31266a = i1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAlog.e("Removing clicked state after timeout", new Object[0]);
        this.f31266a.i();
    }
}
