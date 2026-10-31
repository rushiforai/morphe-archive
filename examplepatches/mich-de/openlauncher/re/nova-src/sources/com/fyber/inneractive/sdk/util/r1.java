package com.fyber.inneractive.sdk.util;

/* loaded from: classes.dex */
public final class r1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f31219a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t1 f31220b;

    public r1(t1 t1Var, String str) {
        this.f31220b = t1Var;
        this.f31219a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f31220b.f31230c.getSharedPreferences("fyber.ua", 0).edit().putString("ua", this.f31219a).apply();
    }
}
