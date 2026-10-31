package com.google.android.gms.internal.measurement;

import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

/* loaded from: classes3.dex */
public final class pc {

    /* renamed from: c, reason: collision with root package name */
    public static final pc f32960c = new pc(mc.f32819b, jc.E());

    /* renamed from: a, reason: collision with root package name */
    public final mc f32961a;

    /* renamed from: b, reason: collision with root package name */
    public final jc f32962b;

    public pc(mc mcVar, jc jcVar) {
        mcVar.getClass();
        this.f32961a = mcVar;
        this.f32962b = jcVar;
    }

    public static pc a(y0 y0Var, boolean z11) throws zzaeh {
        mc mcVarA;
        int iC = y0Var.C();
        int i5 = 1;
        if (iC > 1) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(iC).length() + 44);
            sb2.append("Unsupported version: ");
            sb2.append(iC);
            sb2.append(". Current version is: 1");
            throw new zzaeh(sb2.toString());
        }
        y0Var.C();
        int iA = y0Var.a(y0Var.A());
        e1 e1Var = e1.f32488a;
        int i11 = p0.f32944a;
        jc jcVarD = jc.D(y0Var, e1.f32489b);
        y0Var.b(iA);
        kc kcVar = new kc();
        Inflater inflater = kcVar.f32732a;
        try {
            if (z11) {
                int iA2 = y0Var.a(y0Var.A());
                int iC2 = y0Var.c();
                try {
                    mcVarA = mc.a(y0.h(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT, new InflaterInputStream(new a60.b(kcVar, y0Var), inflater, iC2 < 0 ? 4096 : Math.min(iC2, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT))));
                    inflater.reset();
                    if (y0Var.c() != 0) {
                        throw new zzaeh("Unexpected bytes remaining after FlagsBlob parsing.");
                    }
                    y0Var.b(iA2);
                } finally {
                }
            } else {
                inflater.setInput(y0Var.z());
                try {
                    mcVarA = mc.a(y0.h(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT, new a60.b(kcVar, i5)));
                } finally {
                }
            }
            kcVar.close();
            return new pc(mcVarA, jcVarD);
        } finally {
            try {
                kcVar.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        }
    }
}
