package com.fyber.inneractive.sdk.network;

import java.lang.ref.WeakReference;

/* loaded from: classes.dex */
public final class n1 {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f28753a;

    /* renamed from: b, reason: collision with root package name */
    public final WeakReference f28754b;

    /* renamed from: c, reason: collision with root package name */
    public final int f28755c;

    /* renamed from: d, reason: collision with root package name */
    public final m1 f28756d = new m1(this);

    public n1(t0 t0Var, Thread thread, int i5) {
        this.f28754b = new WeakReference(t0Var);
        this.f28753a = new WeakReference(thread);
        this.f28755c = i5;
    }
}
