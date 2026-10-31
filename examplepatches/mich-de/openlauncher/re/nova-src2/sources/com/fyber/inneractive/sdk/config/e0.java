package com.fyber.inneractive.sdk.config;

import android.content.Context;

/* loaded from: classes.dex */
public final class e0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAConfigManager f27798a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f27799b;

    public e0(IAConfigManager iAConfigManager, Context context) {
        this.f27798a = iAConfigManager;
        this.f27799b = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            com.fyber.inneractive.sdk.util.r.f31216b.post(new d0(this));
        } catch (Throwable unused) {
        }
    }
}
