package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ij5 extends m3f {
    @Override // defpackage.t73
    public final void a(t73 t73Var) {
        bn0 bn0Var = (bn0) this.b;
        int i = bn0Var.t0;
        y73 y73Var = this.h;
        Iterator it2 = y73Var.l.iterator();
        int i2 = 0;
        int i3 = -1;
        while (it2.hasNext()) {
            int i4 = ((y73) it2.next()).g;
            if (i3 == -1 || i4 < i3) {
                i3 = i4;
            }
            if (i2 < i4) {
                i2 = i4;
            }
        }
        if (i == 0 || i == 2) {
            y73Var.d(i3 + bn0Var.v0);
        } else {
            y73Var.d(i2 + bn0Var.v0);
        }
    }

    @Override // defpackage.m3f
    public final void d() {
        b72 b72Var = this.b;
        if (b72Var instanceof bn0) {
            y73 y73Var = this.h;
            y73Var.b = true;
            ArrayList arrayList = y73Var.l;
            bn0 bn0Var = (bn0) b72Var;
            int i = bn0Var.t0;
            boolean z = bn0Var.u0;
            int i2 = 0;
            if (i == 0) {
                y73Var.e = x73.LEFT;
                while (i2 < bn0Var.s0) {
                    b72 b72Var2 = bn0Var.r0[i2];
                    if (z || b72Var2.i0 != 8) {
                        y73 y73Var2 = b72Var2.d.h;
                        y73Var2.k.add(y73Var);
                        arrayList.add(y73Var2);
                    }
                    i2++;
                }
                m(this.b.d.h);
                m(this.b.d.i);
                return;
            }
            if (i == 1) {
                y73Var.e = x73.RIGHT;
                while (i2 < bn0Var.s0) {
                    b72 b72Var3 = bn0Var.r0[i2];
                    if (z || b72Var3.i0 != 8) {
                        y73 y73Var3 = b72Var3.d.i;
                        y73Var3.k.add(y73Var);
                        arrayList.add(y73Var3);
                    }
                    i2++;
                }
                m(this.b.d.h);
                m(this.b.d.i);
                return;
            }
            if (i == 2) {
                y73Var.e = x73.TOP;
                while (i2 < bn0Var.s0) {
                    b72 b72Var4 = bn0Var.r0[i2];
                    if (z || b72Var4.i0 != 8) {
                        y73 y73Var4 = b72Var4.e.h;
                        y73Var4.k.add(y73Var);
                        arrayList.add(y73Var4);
                    }
                    i2++;
                }
                m(this.b.e.h);
                m(this.b.e.i);
                return;
            }
            if (i != 3) {
                return;
            }
            y73Var.e = x73.BOTTOM;
            while (i2 < bn0Var.s0) {
                b72 b72Var5 = bn0Var.r0[i2];
                if (z || b72Var5.i0 != 8) {
                    y73 y73Var5 = b72Var5.e.i;
                    y73Var5.k.add(y73Var);
                    arrayList.add(y73Var5);
                }
                i2++;
            }
            m(this.b.e.h);
            m(this.b.e.i);
        }
    }

    @Override // defpackage.m3f
    public final void e() {
        b72 b72Var = this.b;
        if (b72Var instanceof bn0) {
            int i = ((bn0) b72Var).t0;
            y73 y73Var = this.h;
            if (i == 0 || i == 1) {
                b72Var.a0 = y73Var.g;
            } else {
                b72Var.b0 = y73Var.g;
            }
        }
    }

    @Override // defpackage.m3f
    public final void f() {
        this.c = null;
        this.h.c();
    }

    @Override // defpackage.m3f
    public final boolean k() {
        return false;
    }

    public final void m(y73 y73Var) {
        y73 y73Var2 = this.h;
        y73Var2.k.add(y73Var);
        y73Var.l.add(y73Var2);
    }
}
