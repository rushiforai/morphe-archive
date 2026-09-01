package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uz2 implements tk7 {
    public final /* synthetic */ int a;
    public final tk7 b;
    public final Enum c;
    public final Enum d;

    public /* synthetic */ uz2(tk7 tk7Var, Enum r2, Enum r3, int i) {
        this.a = i;
        this.b = tk7Var;
        this.c = r2;
        this.d = r3;
    }

    @Override // defpackage.tk7
    public final int L(int i) {
        switch (this.a) {
        }
        return this.b.L(i);
    }

    @Override // defpackage.tk7
    public final int a(int i) {
        switch (this.a) {
        }
        return this.b.a(i);
    }

    @Override // defpackage.tk7
    public final int k(int i) {
        switch (this.a) {
        }
        return this.b.k(i);
    }

    @Override // defpackage.tk7
    public final int n(int i) {
        switch (this.a) {
        }
        return this.b.n(i);
    }

    @Override // defpackage.tk7
    public final t99 s(long j) {
        switch (this.a) {
            case 0:
                d76 d76Var = (d76) this.d;
                d76 d76Var2 = d76.Width;
                z66 z66Var = (z66) this.c;
                tk7 tk7Var = this.b;
                if (d76Var == d76Var2) {
                    return new kl4(z66Var == z66.Max ? tk7Var.n(f72.g(j)) : tk7Var.k(f72.g(j)), f72.c(j) ? f72.g(j) : 32767, 0);
                }
                return new kl4(f72.d(j) ? f72.h(j) : 32767, z66Var == z66.Max ? tk7Var.a(f72.h(j)) : tk7Var.L(f72.h(j)), 0);
            case 1:
                kl7 kl7Var = (kl7) this.d;
                kl7 kl7Var2 = kl7.Width;
                jl7 jl7Var = (jl7) this.c;
                tk7 tk7Var2 = this.b;
                if (kl7Var == kl7Var2) {
                    return new kl4(jl7Var == jl7.Max ? tk7Var2.n(f72.g(j)) : tk7Var2.k(f72.g(j)), f72.c(j) ? f72.g(j) : 32767, 1);
                }
                return new kl4(f72.d(j) ? f72.h(j) : 32767, jl7Var == jl7.Max ? tk7Var2.a(f72.h(j)) : tk7Var2.L(f72.h(j)), 1);
            default:
                ih8 ih8Var = (ih8) this.d;
                ih8 ih8Var2 = ih8.Width;
                hh8 hh8Var = (hh8) this.c;
                tk7 tk7Var3 = this.b;
                if (ih8Var == ih8Var2) {
                    return new kl4(hh8Var == hh8.Max ? tk7Var3.n(f72.g(j)) : tk7Var3.k(f72.g(j)), f72.c(j) ? f72.g(j) : 32767, 2);
                }
                return new kl4(f72.d(j) ? f72.h(j) : 32767, hh8Var == hh8.Max ? tk7Var3.a(f72.h(j)) : tk7Var3.L(f72.h(j)), 2);
        }
    }

    @Override // defpackage.tk7
    public final Object w() {
        switch (this.a) {
        }
        return this.b.w();
    }
}
