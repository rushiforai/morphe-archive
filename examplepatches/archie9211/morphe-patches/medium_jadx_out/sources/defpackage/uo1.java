package defpackage;

import android.view.KeyEvent;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class uo1 extends r0 {
    public rb9 M;
    public y06 N;

    @Override // defpackage.r0, defpackage.ub9
    public final void H() {
        super.H();
        Y0(false);
    }

    @Override // defpackage.r0
    public final boolean V0(KeyEvent keyEvent) {
        return false;
    }

    @Override // defpackage.r0
    public final void W0(KeyEvent keyEvent) {
        this.w.invoke();
    }

    public final void Y0(boolean z) {
        if (z) {
            this.N = null;
        } else {
            this.M = null;
        }
        P0(z);
    }

    @Override // defpackage.g16
    public final void a0() {
        Y0(true);
    }

    @Override // defpackage.g16
    public final void w(xp xpVar, mb9 mb9Var) {
        ArrayList arrayList = (ArrayList) xpVar.c;
        T0();
        if (this.v && this.A == null) {
            i85 i85Var = new i85(this);
            I0(i85Var);
            this.A = i85Var;
        }
        if (mb9Var != mb9.Main) {
            if (mb9Var != mb9.Final || this.N == null) {
                return;
            }
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                y06 y06Var = (y06) arrayList.get(i);
                if (y06Var.i && y06Var != this.N) {
                    Y0(true);
                    return;
                }
            }
            return;
        }
        if (this.N == null) {
            int size2 = arrayList.size();
            for (int i2 = 0; i2 < size2; i2++) {
                if (t40.C((y06) arrayList.get(i2))) {
                    y06 y06Var2 = (y06) arrayList.get(0);
                    y06Var2.i = true;
                    this.N = y06Var2;
                    if (this.v) {
                        R0(y06Var2);
                        return;
                    }
                    return;
                }
            }
            return;
        }
        int size3 = arrayList.size();
        for (int i3 = 0; i3 < size3; i3++) {
            y06 y06Var3 = (y06) arrayList.get(i3);
            if (y06Var3.i || !y06Var3.h || y06Var3.d) {
                float fG = ((zte) bo.K(this, z22.u)).g();
                int size4 = arrayList.size();
                for (int i4 = 0; i4 < size4; i4++) {
                    y06 y06Var4 = (y06) arrayList.get(i4);
                    long j = y06Var4.c;
                    y06 y06Var5 = this.N;
                    y06Var5.getClass();
                    boolean z = Math.abs(ip8.c(ip8.d(j, y06Var5.c))) > fG;
                    if (y06Var4.i || z) {
                        Y0(true);
                        return;
                    }
                }
                return;
            }
        }
        ((y06) arrayList.get(0)).i = true;
        if (this.v) {
            y06 y06Var6 = this.N;
            y06Var6.getClass();
            Q0(y06Var6.c, true);
            this.w.invoke();
        }
        this.N = null;
    }

    @Override // defpackage.r0, defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        super.y(lb9Var, mb9Var, j);
        if (mb9Var != mb9.Main) {
            if (mb9Var != mb9.Final || this.M == null) {
                return;
            }
            List list = lb9Var.a;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                rb9 rb9Var = (rb9) list.get(i);
                if (rb9Var.b() && rb9Var != this.M) {
                    Y0(false);
                    return;
                }
            }
            return;
        }
        if (this.M == null) {
            if (qfd.e(lb9Var, true)) {
                rb9 rb9Var2 = (rb9) lb9Var.a.get(0);
                rb9Var2.a();
                this.M = rb9Var2;
                if (this.v) {
                    S0(rb9Var2);
                    return;
                }
                return;
            }
            return;
        }
        List list2 = lb9Var.a;
        int size2 = list2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            if (!mq7.w((rb9) list2.get(i2))) {
                long jO0 = O0(j);
                int size3 = list2.size();
                for (int i3 = 0; i3 < size3; i3++) {
                    rb9 rb9Var3 = (rb9) list2.get(i3);
                    if (rb9Var3.b() || mq7.C(rb9Var3, j, jO0)) {
                        Y0(false);
                        return;
                    }
                }
                return;
            }
        }
        ((rb9) list2.get(0)).a();
        if (this.v) {
            rb9 rb9Var4 = this.M;
            rb9Var4.getClass();
            Q0(rb9Var4.c, false);
            this.w.invoke();
        }
        this.M = null;
    }
}
