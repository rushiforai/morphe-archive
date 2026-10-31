package com.fyber.inneractive.sdk.protobuf;

import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final b0 f30775a;

    public c0(b0 b0Var) {
        Charset charset = l1.f30847a;
        if (b0Var == null) {
            throw new NullPointerException("output");
        }
        this.f30775a = b0Var;
        b0Var.f30770a = this;
    }

    public final void a(int i5, float f11) {
        b0 b0Var = this.f30775a;
        b0Var.getClass();
        b0Var.a(i5, Float.floatToRawIntBits(f11));
    }

    public final void a(int i5, double d5) {
        b0 b0Var = this.f30775a;
        b0Var.getClass();
        b0Var.a(i5, Double.doubleToRawLongBits(d5));
    }

    public final void a(int i5, int i11) {
        this.f30775a.d(i5, b0.d(i11));
    }

    public final void a(int i5, long j11) {
        this.f30775a.b(i5, b0.b(j11));
    }

    public final void a(int i5, Object obj, t2 t2Var) {
        b0 b0Var = this.f30775a;
        b0Var.c(i5, 3);
        t2Var.a(obj, b0Var.f30770a);
        b0Var.c(i5, 4);
    }
}
