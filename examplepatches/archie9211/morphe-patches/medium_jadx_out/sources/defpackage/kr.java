package defpackage;

import android.view.View;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kr implements sb2 {
    public final View a;
    public final zid b;
    public final sb2 c;
    public final AtomicReference d = new AtomicReference(null);

    public kr(View view, zid zidVar, sb2 sb2Var) {
        this.a = view;
        this.b = zidVar;
        this.c = sb2Var;
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        return this.c.Q();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.tb2 a(defpackage.lx6 r11, defpackage.p92 r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof defpackage.hr
            if (r0 == 0) goto L13
            r0 = r12
            hr r0 = (defpackage.hr) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            hr r0 = new hr
            r0.<init>(r10, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 == r4) goto L2a
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r3
        L2a:
            defpackage.br7.v(r12)
            goto L51
        L2e:
            defpackage.br7.v(r12)
            jr r5 = new jr
            r12 = 0
            r5.<init>(r11, r12, r10)
            j0 r7 = new j0
            r11 = 18
            r8 = 0
            r7.<init>(r10, r8, r11)
            r0.d = r4
            rna r4 = new rna
            r9 = 14
            java.util.concurrent.atomic.AtomicReference r6 = r10.d
            r4.<init>(r5, r6, r7, r8, r9)
            java.lang.Object r10 = defpackage.o7f.s(r4, r0)
            if (r10 != r1) goto L51
            return r1
        L51:
            defpackage.z72.b()
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kr.a(lx6, p92):tb2");
    }
}
