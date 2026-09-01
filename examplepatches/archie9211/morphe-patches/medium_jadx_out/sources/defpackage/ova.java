package defpackage;

import android.content.Context;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ova implements i56 {
    public final rx5 a;
    public final List b;
    public final int c;
    public final rx5 d;
    public final cfc e;
    public final z46 f;
    public final boolean g;

    public ova(rx5 rx5Var, List list, int i, rx5 rx5Var2, cfc cfcVar, z46 z46Var, boolean z) {
        this.a = rx5Var;
        this.b = list;
        this.c = i;
        this.d = rx5Var2;
        this.e = cfcVar;
        this.f = z46Var;
        this.g = z;
    }

    public static ova b(ova ovaVar, int i, rx5 rx5Var, int i2) {
        if ((i2 & 1) != 0) {
            i = ovaVar.c;
        }
        int i3 = i;
        if ((i2 & 2) != 0) {
            rx5Var = ovaVar.d;
        }
        cfc cfcVar = ovaVar.e;
        return new ova(ovaVar.a, ovaVar.b, i3, rx5Var, cfcVar, ovaVar.f, ovaVar.g);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.mva
            if (r0 == 0) goto L13
            r0 = r8
            mva r0 = (defpackage.mva) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            mva r0 = new mva
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L2a
            k56 r0 = r0.b
            defpackage.br7.v(r8)
            goto L51
        L2a:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L30:
            defpackage.br7.v(r8)
            java.util.List r8 = r7.b
            int r2 = r7.c
            java.lang.Object r8 = r8.get(r2)
            k56 r8 = (defpackage.k56) r8
            int r2 = r2 + r4
            r5 = 6
            ova r2 = b(r7, r2, r3, r5)
            r0.b = r8
            r0.e = r4
            java.lang.Object r0 = r8.intercept(r2, r0)
            if (r0 != r1) goto L4e
            return r1
        L4e:
            r6 = r0
            r0 = r8
            r8 = r6
        L51:
            xx5 r8 = (defpackage.xx5) r8
            rx5 r1 = r8.b()
            r7.a(r1, r0)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ova.c(p92):java.lang.Object");
    }

    public final ova d(rx5 rx5Var) {
        int i = this.c;
        if (i > 0) {
            a(rx5Var, (k56) this.b.get(i - 1));
        }
        return b(this, 0, rx5Var, 5);
    }

    public final void a(rx5 rx5Var, k56 k56Var) {
        Context context = rx5Var.a;
        rx5 rx5Var2 = this.a;
        if (context != rx5Var2.a) {
            z72.e("Interceptor '", k56Var, "' cannot modify the request's context.");
            return;
        }
        if (rx5Var.b == ql8.a) {
            z72.e("Interceptor '", k56Var, "' cannot set the request's data to null.");
        } else if (rx5Var.c != rx5Var2.c) {
            z72.e("Interceptor '", k56Var, pUlNWdybf.YRjULWCzsbO);
        } else {
            if (rx5Var.q == rx5Var2.q) {
                return;
            }
            z72.e("Interceptor '", k56Var, "' cannot modify the request's size resolver. Use `Interceptor.Chain.withSize` instead.");
        }
    }
}
