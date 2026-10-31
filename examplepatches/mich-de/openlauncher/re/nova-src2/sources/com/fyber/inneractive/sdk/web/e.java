package com.fyber.inneractive.sdk.web;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: c, reason: collision with root package name */
    public com.fyber.inneractive.sdk.util.e f31281c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.util.d f31282d;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f31285g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f31286h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ String f31287i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ String f31288j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ String f31289k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ i f31290l;

    /* renamed from: b, reason: collision with root package name */
    public Handler f31280b = null;

    /* renamed from: e, reason: collision with root package name */
    public final Object f31283e = new Object();

    /* renamed from: f, reason: collision with root package name */
    public boolean f31284f = false;

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f31279a = Executors.newSingleThreadExecutor(new com.fyber.inneractive.sdk.util.b());

    public e(i1 i1Var, String str, boolean z11, String str2, String str3, String str4) {
        this.f31290l = i1Var;
        this.f31285g = str;
        this.f31286h = z11;
        this.f31287i = str2;
        this.f31288j = str3;
        this.f31289k = str4;
    }

    public final Handler a() {
        if (this.f31280b == null) {
            synchronized (this.f31283e) {
                this.f31280b = new Handler(Looper.getMainLooper());
            }
        }
        return this.f31280b;
    }
}
