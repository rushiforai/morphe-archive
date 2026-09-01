package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class v58 {
    public final f78 a;

    public /* synthetic */ v58(f78 f78Var) {
        this.a = f78Var;
    }

    public static final Object a(f78 f78Var) {
        Object objG = f78Var.g(null);
        if (objG == null) {
            return null;
        }
        if (!(objG instanceof x68)) {
            f78Var.k(null);
            return objG;
        }
        x68 x68Var = (x68) objG;
        if (x68Var.h()) {
            ywb.h(Plbho.tinBQNHcirH);
            return null;
        }
        int i = x68Var.b - 1;
        Object objF = x68Var.f(i);
        x68Var.k(i);
        objF.getClass();
        if (x68Var.h()) {
            f78Var.k(null);
        }
        if (x68Var.b == 1) {
            f78Var.m(null, x68Var.e());
        }
        return objF;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.x68 b(defpackage.f78 r14) {
        /*
            boolean r0 = r14.i()
            if (r0 == 0) goto Lc
            x68 r14 = defpackage.pm8.b
            r14.getClass()
            return r14
        Lc:
            x68 r0 = new x68
            r0.<init>()
            java.lang.Object[] r1 = r14.c
            long[] r14 = r14.a
            int r2 = r14.length
            int r2 = r2 + (-2)
            if (r2 < 0) goto L61
            r3 = 0
            r4 = r3
        L1c:
            r5 = r14[r4]
            long r7 = ~r5
            r9 = 7
            long r7 = r7 << r9
            long r7 = r7 & r5
            r9 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r7 = r7 & r9
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L5c
            int r7 = r4 - r2
            int r7 = ~r7
            int r7 = r7 >>> 31
            r8 = 8
            int r7 = 8 - r7
            r9 = r3
        L36:
            if (r9 >= r7) goto L5a
            r10 = 255(0xff, double:1.26E-321)
            long r10 = r10 & r5
            r12 = 128(0x80, double:6.3E-322)
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 >= 0) goto L56
            int r10 = r4 << 3
            int r10 = r10 + r9
            r10 = r1[r10]
            boolean r11 = r10 instanceof defpackage.x68
            if (r11 == 0) goto L50
            x68 r10 = (defpackage.x68) r10
            r0.b(r10)
            goto L56
        L50:
            r10.getClass()
            r0.a(r10)
        L56:
            long r5 = r5 >> r8
            int r9 = r9 + 1
            goto L36
        L5a:
            if (r7 != r8) goto L61
        L5c:
            if (r4 == r2) goto L61
            int r4 = r4 + 1
            goto L1c
        L61:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v58.b(f78):x68");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof v58) {
            return this.a.equals(((v58) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "MultiValueMap(map=" + this.a + ')';
    }
}
