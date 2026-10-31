package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public abstract class v5 implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public final x5 f32268a;

    /* renamed from: b, reason: collision with root package name */
    public x5 f32269b;

    public v5(x5 x5Var) {
        this.f32268a = x5Var;
        if (x5Var.e()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.f32269b = (x5) x5Var.f(4);
    }

    public final x5 a() {
        x5 x5VarC = c();
        x5VarC.getClass();
        boolean zZzh = true;
        byte bByteValue = ((Byte) x5VarC.f(1)).byteValue();
        if (bByteValue != 1) {
            if (bByteValue == 0) {
                zZzh = false;
            } else {
                zZzh = q6.f32217c.a(x5VarC.getClass()).zzh(x5VarC);
                x5VarC.f(2);
            }
        }
        if (zZzh) {
            return x5VarC;
        }
        throw new zzso("Message was missing required fields.  (Lite runtime could not determine which fields were missing).");
    }

    public final x5 c() {
        if (!this.f32269b.e()) {
            return this.f32269b;
        }
        this.f32269b.j();
        return this.f32269b;
    }

    public final Object clone() {
        v5 v5Var = (v5) this.f32268a.f(5);
        v5Var.f32269b = c();
        return v5Var;
    }

    public final void d() {
        if (this.f32269b.e()) {
            return;
        }
        x5 x5Var = (x5) this.f32268a.f(4);
        q6.f32217c.a(x5Var.getClass()).zze(x5Var, this.f32269b);
        this.f32269b = x5Var;
    }
}
