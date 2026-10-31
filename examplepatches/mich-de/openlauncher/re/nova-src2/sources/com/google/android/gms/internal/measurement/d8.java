package com.google.android.gms.internal.measurement;

import android.os.SystemClock;
import java.util.Objects;

/* loaded from: classes.dex */
public abstract class d8 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final long f32460a;

    /* renamed from: b, reason: collision with root package name */
    public final long f32461b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f32462c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ i8 f32463d;

    public d8(i8 i8Var, boolean z11) {
        Objects.requireNonNull(i8Var);
        this.f32463d = i8Var;
        this.f32460a = System.currentTimeMillis();
        this.f32461b = SystemClock.elapsedRealtime();
        this.f32462c = z11;
    }

    public abstract void a();

    public void b() {
    }

    @Override // java.lang.Runnable
    public final void run() {
        i8 i8Var = this.f32463d;
        if (i8Var.k()) {
            b();
            return;
        }
        try {
            a();
        } catch (Exception e3) {
            i8Var.h(e3, false, this.f32462c);
            b();
        }
    }
}
