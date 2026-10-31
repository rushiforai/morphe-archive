package com.fyber.inneractive.sdk.web;

/* loaded from: classes3.dex */
public final class a1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b1 f31262a;

    public a1(b1 b1Var) {
        this.f31262a = b1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.f31262a.f31265a.evictAll();
        } catch (Throwable unused) {
        }
    }
}
