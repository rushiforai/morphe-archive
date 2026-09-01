package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fv6 implements xrb {
    public final /* synthetic */ int a;
    public final /* synthetic */ xrb b;
    public final /* synthetic */ nsb c;

    public /* synthetic */ fv6(xrb xrbVar, nsb nsbVar, int i) {
        this.a = i;
        this.c = nsbVar;
        this.b = xrbVar;
    }

    @Override // defpackage.xrb
    public final float a(float f) {
        switch (this.a) {
        }
        return this.b.a(f);
    }

    public final int b(int i) {
        Object obj;
        int i2 = this.a;
        nsb nsbVar = this.c;
        switch (i2) {
            case 0:
                kv6 kv6Var = (kv6) nsbVar;
                cv6 cv6VarJ = kv6Var.j();
                if (cv6VarJ.k.isEmpty()) {
                    return 0;
                }
                int iH = kv6Var.h();
                if (i > e() || iH > i) {
                    return ((i - kv6Var.h()) * g76.i0(cv6VarJ)) - kv6Var.i();
                }
                List list = cv6VarJ.k;
                int size = list.size();
                int i3 = 0;
                while (true) {
                    if (i3 < size) {
                        obj = list.get(i3);
                        if (((dv6) obj).a != i) {
                            i3++;
                        }
                    } else {
                        obj = null;
                    }
                }
                dv6 dv6Var = (dv6) obj;
                if (dv6Var != null) {
                    return dv6Var.o;
                }
                return 0;
            default:
                gz8 gz8Var = (gz8) nsbVar;
                return (int) (iq7.w(ok7.z(gz8Var) + ((long) nk7.w0(((gz8Var.q() * (i - gz8Var.k())) - (gz8Var.l() * gz8Var.q())) + 0.0f)), gz8Var.h, gz8Var.g) - ok7.z(gz8Var));
        }
    }

    public final int c() {
        int i = this.a;
        nsb nsbVar = this.c;
        switch (i) {
            case 0:
                return ((kv6) nsbVar).h();
            default:
                return ((gz8) nsbVar).e;
        }
    }

    public final int d() {
        int i = this.a;
        nsb nsbVar = this.c;
        switch (i) {
            case 0:
                return ((kv6) nsbVar).i();
            default:
                return ((gz8) nsbVar).f;
        }
    }

    public final int e() {
        int i = this.a;
        nsb nsbVar = this.c;
        switch (i) {
            case 0:
                dv6 dv6Var = (dv6) bu1.I0(((kv6) nsbVar).j().k);
                if (dv6Var != null) {
                    return dv6Var.a;
                }
                return 0;
            default:
                return ((el7) bu1.H0(((gz8) nsbVar).n().a)).a;
        }
    }

    public final void f(int i, int i2) {
        int i3 = this.a;
        nsb nsbVar = this.c;
        switch (i3) {
            case 0:
                ((kv6) nsbVar).m(i, i2);
                break;
            default:
                gz8 gz8Var = (gz8) nsbVar;
                float fQ = gz8Var.q();
                gz8Var.u(fQ != 0.0f ? i2 / fQ : 0.0f, i, true);
                break;
        }
    }
}
