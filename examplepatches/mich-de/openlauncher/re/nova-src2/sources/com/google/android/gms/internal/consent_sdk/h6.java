package com.google.android.gms.internal.consent_sdk;

import android.app.Application;
import java.nio.charset.Charset;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class h6 implements uk.d, uk.c, l7, l6 {

    /* renamed from: c, reason: collision with root package name */
    public static final o4 f32087c = new o4(27);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32088a;

    /* renamed from: b, reason: collision with root package name */
    public Object f32089b;

    public /* synthetic */ h6(Object obj, int i5) {
        this.f32088a = i5;
        this.f32089b = obj;
    }

    public static h6 d() {
        return new h6(new o4(new o4(23)), 5);
    }

    @Override // uk.c
    public void a(ex.a aVar) {
        ((ox.r) this.f32089b).a(aVar);
    }

    @Override // uk.d
    public void b(m mVar) {
        ((AtomicReference) this.f32089b).set(mVar);
    }

    public m c() {
        return (m) ((h6) this.f32089b).zzb();
    }

    public m0 e(String str) {
        return new m0(this, str);
    }

    public void f(int i5, Object obj, t6 t6Var) {
        o5 o5Var = (o5) this.f32089b;
        i5 i5Var = (i5) obj;
        o5Var.n0(i5, 2);
        o5Var.p0(i5Var.b(t6Var));
        t6Var.c(i5Var, this);
    }

    @Override // com.google.android.gms.internal.consent_sdk.l6
    public s6 zzb(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            l6 l6Var = ((l6[]) this.f32089b)[i5];
            if (l6Var.zzc(cls)) {
                return l6Var.zzb(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }

    @Override // com.google.android.gms.internal.consent_sdk.l6
    public boolean zzc(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            if (((l6[]) this.f32089b)[i5].zzc(cls)) {
                return true;
            }
        }
        return false;
    }

    public h6(int i5) {
        this.f32088a = i5;
        switch (i5) {
            case 8:
                break;
            default:
                int i11 = k5.f32121a;
                h6 h6Var = new h6(new l6[]{o4.f32195v, f32087c}, 7);
                Charset charset = b6.f31997a;
                this.f32089b = h6Var;
                break;
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public Object zzb() {
        switch (this.f32088a) {
            case 4:
                return new t((Application) ((m7) this.f32089b).zzb());
            default:
                k7 k7Var = (k7) this.f32089b;
                if (k7Var != null) {
                    return k7Var.zzb();
                }
                throw new IllegalStateException();
        }
    }

    public h6(d dVar, q qVar) {
        this.f32088a = 1;
        k7 k7VarA = k7.a(new h6((vm.c) dVar.f32027b, 4));
        if (qVar != null) {
            vm.c cVar = new vm.c(qVar, 8);
            h6 h6Var = new h6(8);
            this.f32089b = h6Var;
            vm.c cVar2 = (vm.c) dVar.f32027b;
            k7 k7Var = (k7) dVar.f32031f;
            g gVar = (g) dVar.f32034i;
            k7 k7Var2 = (k7) dVar.f32028c;
            k7 k7VarA2 = k7.a(new bn.d1(cVar2, (k7) dVar.f32029d, k7VarA, k7Var2, cVar, new e(k7VarA, new bn.i(cVar2, k7VarA, k7Var, gVar, h6Var, k7Var2)), (k7) dVar.f32032g));
            if (((k7) h6Var.f32089b) == null) {
                h6Var.f32089b = k7VarA2;
                return;
            }
            throw new IllegalStateException();
        }
        throw new NullPointerException("instance cannot be null");
    }

    public h6(o5 o5Var) {
        this.f32088a = 6;
        Charset charset = b6.f31997a;
        this.f32089b = o5Var;
        o5Var.f32199d = this;
    }
}
