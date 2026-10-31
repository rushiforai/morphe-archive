package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class o0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f31363a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ v0 f31364b;

    public o0(v0 v0Var, String str) {
        this.f31364b = v0Var;
        this.f31363a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAlog.a("injecting JS: %s", this.f31363a);
        try {
            String str = this.f31363a;
            if (str != null) {
                com.fyber.inneractive.sdk.util.q0.a(this.f31364b.f31385a, str);
            }
        } catch (Exception unused) {
            IAlog.a("Failed to inject JS", new Object[0]);
        }
    }
}
