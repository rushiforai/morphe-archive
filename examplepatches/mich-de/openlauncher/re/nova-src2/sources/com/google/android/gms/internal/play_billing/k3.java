package com.google.android.gms.internal.play_billing;

import java.nio.charset.Charset;

/* loaded from: classes3.dex */
public final class k3 implements o3 {

    /* renamed from: b, reason: collision with root package name */
    public static final u2 f33439b = new u2(3);

    /* renamed from: a, reason: collision with root package name */
    public final Object f33440a;

    public k3(o3... o3VarArr) {
        this.f33440a = o3VarArr;
    }

    public void a(int i5, Object obj, x3 x3Var) {
        n2 n2Var = (n2) this.f33440a;
        g2 g2Var = (g2) obj;
        n2Var.y0(i5, 2);
        n2Var.A0(g2Var.c(x3Var));
        x3Var.c(g2Var, this);
    }

    @Override // com.google.android.gms.internal.play_billing.o3
    public w3 zzb(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            o3 o3Var = ((o3[]) this.f33440a)[i5];
            if (o3Var.zzc(cls)) {
                return o3Var.zzb(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }

    @Override // com.google.android.gms.internal.play_billing.o3
    public boolean zzc(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            if (((o3[]) this.f33440a)[i5].zzc(cls)) {
                return true;
            }
        }
        return false;
    }

    public k3() {
        int i5 = i2.f33421a;
        k3 k3Var = new k3(u2.f33551b, f33439b);
        Charset charset = e3.f33385a;
        this.f33440a = k3Var;
    }

    public k3(n2 n2Var) {
        Charset charset = e3.f33385a;
        this.f33440a = n2Var;
        n2Var.f33459c = this;
    }
}
