package defpackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l52 {
    public int b;
    public boolean c;
    public final b72 d;
    public final k52 e;
    public l52 f;
    public gkc i;
    public HashSet a = null;
    public int g = 0;
    public int h = Integer.MIN_VALUE;

    public l52(b72 b72Var, k52 k52Var) {
        this.d = b72Var;
        this.e = k52Var;
    }

    public final void a(l52 l52Var, int i) {
        b(l52Var, i, Integer.MIN_VALUE, false);
    }

    public final boolean b(l52 l52Var, int i, int i2, boolean z) {
        if (l52Var == null) {
            j();
            return true;
        }
        if (!z && !i(l52Var)) {
            return false;
        }
        this.f = l52Var;
        if (l52Var.a == null) {
            l52Var.a = new HashSet();
        }
        HashSet hashSet = this.f.a;
        if (hashSet != null) {
            hashSet.add(this);
        }
        this.g = i;
        this.h = i2;
        return true;
    }

    public final void c(int i, j3f j3fVar, ArrayList arrayList) {
        HashSet hashSet = this.a;
        if (hashSet != null) {
            Iterator it2 = hashSet.iterator();
            while (it2.hasNext()) {
                rv8.A(((l52) it2.next()).d, i, arrayList, j3fVar);
            }
        }
    }

    public final int d() {
        if (this.c) {
            return this.b;
        }
        return 0;
    }

    public final int e() {
        l52 l52Var;
        if (this.d.i0 == 8) {
            return 0;
        }
        int i = this.h;
        return (i == Integer.MIN_VALUE || (l52Var = this.f) == null || l52Var.d.i0 != 8) ? this.g : i;
    }

    public final l52 f() {
        k52 k52Var = this.e;
        int iOrdinal = k52Var.ordinal();
        b72 b72Var = this.d;
        switch (iOrdinal) {
            case 0:
            case 5:
            case 6:
            case 7:
            case 8:
                return null;
            case 1:
                return b72Var.L;
            case 2:
                return b72Var.M;
            case 3:
                return b72Var.J;
            case 4:
                return b72Var.K;
            default:
                ay0.d(k52Var.name());
                return null;
        }
    }

    public final boolean g() {
        HashSet hashSet = this.a;
        if (hashSet == null) {
            return false;
        }
        Iterator it2 = hashSet.iterator();
        while (it2.hasNext()) {
            if (((l52) it2.next()).f().h()) {
                return true;
            }
        }
        return false;
    }

    public final boolean h() {
        return this.f != null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0070 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean i(defpackage.l52 r5) {
        /*
            r4 = this;
            r0 = 0
            if (r5 != 0) goto L5
            goto L72
        L5:
            b72 r1 = r5.d
            k52 r5 = r5.e
            k52 r2 = r4.e
            r3 = 1
            if (r5 != r2) goto L1d
            k52 r5 = defpackage.k52.BASELINE
            if (r2 != r5) goto L70
            boolean r5 = r1.F
            if (r5 == 0) goto L72
            b72 r4 = r4.d
            boolean r4 = r4.F
            if (r4 != 0) goto L70
            goto L72
        L1d:
            int r4 = r2.ordinal()
            switch(r4) {
                case 0: goto L72;
                case 1: goto L5a;
                case 2: goto L42;
                case 3: goto L5a;
                case 4: goto L42;
                case 5: goto L39;
                case 6: goto L2c;
                case 7: goto L72;
                case 8: goto L72;
                default: goto L24;
            }
        L24:
            java.lang.String r4 = r2.name()
            defpackage.ay0.d(r4)
            return r0
        L2c:
            k52 r4 = defpackage.k52.BASELINE
            if (r5 == r4) goto L72
            k52 r4 = defpackage.k52.CENTER_X
            if (r5 == r4) goto L72
            k52 r4 = defpackage.k52.CENTER_Y
            if (r5 == r4) goto L72
            goto L70
        L39:
            k52 r4 = defpackage.k52.LEFT
            if (r5 == r4) goto L72
            k52 r4 = defpackage.k52.RIGHT
            if (r5 != r4) goto L70
            goto L72
        L42:
            k52 r4 = defpackage.k52.TOP
            if (r5 == r4) goto L4d
            k52 r4 = defpackage.k52.BOTTOM
            if (r5 != r4) goto L4b
            goto L4d
        L4b:
            r4 = r0
            goto L4e
        L4d:
            r4 = r3
        L4e:
            boolean r1 = r1 instanceof defpackage.sh5
            if (r1 == 0) goto L59
            if (r4 != 0) goto L70
            k52 r4 = defpackage.k52.CENTER_Y
            if (r5 != r4) goto L72
            goto L70
        L59:
            return r4
        L5a:
            k52 r4 = defpackage.k52.LEFT
            if (r5 == r4) goto L65
            k52 r4 = defpackage.k52.RIGHT
            if (r5 != r4) goto L63
            goto L65
        L63:
            r4 = r0
            goto L66
        L65:
            r4 = r3
        L66:
            boolean r1 = r1 instanceof defpackage.sh5
            if (r1 == 0) goto L71
            if (r4 != 0) goto L70
            k52 r4 = defpackage.k52.CENTER_X
            if (r5 != r4) goto L72
        L70:
            return r3
        L71:
            return r4
        L72:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l52.i(l52):boolean");
    }

    public final void j() {
        HashSet hashSet;
        l52 l52Var = this.f;
        if (l52Var != null && (hashSet = l52Var.a) != null) {
            hashSet.remove(this);
            if (this.f.a.size() == 0) {
                this.f.a = null;
            }
        }
        this.a = null;
        this.f = null;
        this.g = 0;
        this.h = Integer.MIN_VALUE;
        this.c = false;
        this.b = 0;
    }

    public final void k() {
        gkc gkcVar = this.i;
        if (gkcVar == null) {
            this.i = new gkc(fkc.UNRESTRICTED);
        } else {
            gkcVar.c();
        }
    }

    public final void l(int i) {
        this.b = i;
        this.c = true;
    }

    public final String toString() {
        return this.d.j0 + ":" + this.e.toString();
    }
}
