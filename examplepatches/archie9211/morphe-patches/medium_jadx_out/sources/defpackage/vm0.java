package defpackage;

import android.os.SystemClock;
import android.view.MotionEvent;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vm0 extends q28 implements sp6, xl3, xxb, ub9, t28, m49, fp6, od5, cr4, rr4, ur4, nx8, h01 {
    public p28 o;

    @Override // defpackage.q28
    public final void A0() {
        if (!this.n) {
            b26.b("unInitializeModifier called on unattached node");
        }
        if ((this.c & 8) != 0) {
            ((mn) flb.w0(this)).C();
        }
    }

    @Override // defpackage.rr4
    public final void C(pr4 pr4Var) {
        p28 p28Var = this.o;
        b26.b("applyFocusProperties called on wrong node");
        p28Var.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.cr4
    public final void F(zr4 zr4Var) {
        p28 p28Var = this.o;
        b26.b("onFocusEvent called on wrong node");
        p28Var.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.ub9
    public final void H() {
        p28 p28Var = this.o;
        p28Var.getClass();
        n0c n0cVar = ((yb9) p28Var).e;
        wb9 wb9Var = (wb9) n0cVar.c;
        yb9 yb9Var = (yb9) n0cVar.e;
        if (wb9Var == wb9.Dispatching) {
            long jUptimeMillis = SystemClock.uptimeMillis();
            xb9 xb9Var = new xb9(yb9Var, 0);
            MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
            motionEventObtain.setSource(0);
            xb9Var.invoke(motionEventObtain);
            motionEventObtain.recycle();
            n0cVar.c = wb9.Unknown;
            yb9Var.d = false;
            n0cVar.d = null;
        }
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final void I0(boolean z) {
        if (!this.n) {
            b26.b("initializeModifier called on unattached node");
        }
        p28 p28Var = this.o;
        if ((this.c & 4) != 0 && !z) {
            flb.t0(this, 2).V0();
        }
        if ((this.c & 2) != 0) {
            ffd ffdVar = (ffd) flb.v0(this).F.f;
            ffdVar.getClass();
            if (ffdVar.o) {
                eh8 eh8Var = this.h;
                eh8Var.getClass();
                ((up6) eh8Var).r1(this);
                lx8 lx8Var = eh8Var.L;
                if (lx8Var != null) {
                    ((rf5) lx8Var).c();
                }
            }
            if (!z) {
                flb.t0(this, 2).V0();
                flb.v0(this).E();
            }
        }
        if (p28Var instanceof sr6) {
            sr6 sr6Var = (sr6) p28Var;
            aq6 aq6VarV0 = flb.v0(this);
            switch (sr6Var.b) {
                case 0:
                    ((ur6) sr6Var.c).j = aq6VarV0;
                    break;
                case 1:
                    ((kv6) sr6Var.c).l = aq6VarV0;
                    break;
                case 2:
                    ((pw6) sr6Var.c).h = aq6VarV0;
                    break;
                default:
                    ((gz8) sr6Var.c).y.setValue(aq6VarV0);
                    break;
            }
        }
        int i = this.c;
        if ((i & 16) != 0 && (p28Var instanceof yb9)) {
            ((yb9) p28Var).e.b = this.h;
        }
        if ((i & 8) != 0) {
            ((mn) flb.w0(this)).C();
        }
    }

    @Override // defpackage.xl3
    public final void L() {
        wgf.y(this);
    }

    @Override // defpackage.ub9
    public final void M() {
        p28 p28Var = this.o;
        p28Var.getClass();
        ((yb9) p28Var).e.getClass();
    }

    @Override // defpackage.t28
    public final uob T() {
        return uob.c;
    }

    @Override // defpackage.od5
    public final void X(eh8 eh8Var) {
        this.o.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        p28 p28Var = this.o;
        p28Var.getClass();
        return ((qp6) p28Var).a(fb7Var, tk7Var, i);
    }

    @Override // defpackage.h01
    public final m73 b() {
        return flb.v0(this).y;
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        p28 p28Var = this.o;
        p28Var.getClass();
        return ((qp6) p28Var).c(bl7Var, tk7Var, j);
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        p28 p28Var = this.o;
        p28Var.getClass();
        return ((qp6) p28Var).d(fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        p28 p28Var = this.o;
        p28Var.getClass();
        return ((qp6) p28Var).e(fb7Var, tk7Var, i);
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        p28 p28Var = this.o;
        p28Var.getClass();
        throw null;
    }

    @Override // defpackage.h01
    public final long f() {
        return nk7.C0(flb.t0(this, 128).c);
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        p28 p28Var = this.o;
        p28Var.getClass();
        return ((qp6) p28Var).g(fb7Var, tk7Var, i);
    }

    @Override // defpackage.h01
    public final ip6 getLayoutDirection() {
        return flb.v0(this).z;
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        p28 p28Var = this.o;
        p28Var.getClass();
        ((yb9) p28Var).e.getClass();
        return true;
    }

    @Override // defpackage.ub9
    public final long n() {
        return iqd.a;
    }

    @Override // defpackage.ub9
    public final void o0() {
        H();
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        p28 p28Var = this.o;
        p28Var.getClass();
        txb txbVarJ = ((vxb) p28Var).j();
        jybVar.getClass();
        txb txbVar = (txb) jybVar;
        f78 f78Var = txbVar.a;
        if (txbVarJ.c) {
            txbVar.c = true;
        }
        if (txbVarJ.d) {
            txbVar.d = true;
        }
        f78 f78Var2 = txbVarJ.a;
        Object[] objArr = f78Var2.b;
        Object[] objArr2 = f78Var2.c;
        long[] jArr = f78Var2.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        Object obj = objArr[i4];
                        Object obj2 = objArr2[i4];
                        iyb iybVar = (iyb) obj;
                        if (!f78Var.b(iybVar)) {
                            f78Var.m(iybVar, obj2);
                        } else if (obj2 instanceof i4) {
                            Object objG = f78Var.g(iybVar);
                            objG.getClass();
                            i4 i4Var = (i4) objG;
                            String str = i4Var.a;
                            if (str == null) {
                                str = ((i4) obj2).a;
                            }
                            j55 j55Var = i4Var.b;
                            if (j55Var == null) {
                                j55Var = ((i4) obj2).b;
                            }
                            f78Var.m(iybVar, new i4(str, j55Var));
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.nx8
    public final boolean t() {
        return this.n;
    }

    public final String toString() {
        return this.o.toString();
    }

    @Override // defpackage.m49
    public final Object v(m73 m73Var, Object obj) {
        p28 p28Var = this.o;
        p28Var.getClass();
        return ((l49) p28Var).i();
    }

    @Override // defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        boolean z;
        boolean z2;
        boolean z3;
        p28 p28Var = this.o;
        p28Var.getClass();
        n0c n0cVar = ((yb9) p28Var).e;
        yb9 yb9Var = (yb9) n0cVar.e;
        List list = lb9Var.a;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            rb9 rb9Var = (rb9) list.get(i);
            if (mq7.v(rb9Var) || mq7.x(rb9Var)) {
                z = false;
                break;
            }
        }
        z = true;
        if (!z) {
            z2 = false;
            break;
        }
        int size2 = list.size();
        for (int i2 = 0; i2 < size2; i2++) {
            if (((rb9) list.get(i2)).b()) {
                z2 = false;
                break;
            }
        }
        z2 = true;
        if (yb9Var.d) {
            z3 = true;
        } else {
            int size3 = list.size();
            int i3 = 0;
            while (true) {
                if (i3 < size3) {
                    rb9 rb9Var2 = (rb9) list.get(i3);
                    if (mq7.v(rb9Var2) || mq7.x(rb9Var2)) {
                        break;
                    } else {
                        i3++;
                    }
                } else if (z2) {
                    break;
                } else {
                    z3 = false;
                }
            }
            z3 = true;
        }
        if (((wb9) n0cVar.c) != wb9.NotDispatching) {
            if (mb9Var == mb9.Initial && z3) {
                n0cVar.d = lb9Var;
                n0cVar.x(lb9Var, !z || yb9Var.d);
            }
            if (mb9Var == mb9.Main && z && lb9Var == ((lb9) n0cVar.d) && yb9Var.d) {
                int size4 = list.size();
                for (int i4 = 0; i4 < size4; i4++) {
                    ((rb9) list.get(i4)).a();
                }
            }
            if (mb9Var == mb9.Final && !z3 && lb9Var != ((lb9) n0cVar.d)) {
                n0cVar.x(lb9Var, true);
            }
        }
        if (mb9Var == mb9.Final) {
            int size5 = list.size();
            int i5 = 0;
            while (true) {
                if (i5 >= size5) {
                    n0cVar.c = wb9.Unknown;
                    ((yb9) n0cVar.e).d = false;
                    n0cVar.d = null;
                    break;
                } else if (!mq7.x((rb9) list.get(i5))) {
                    break;
                } else {
                    i5++;
                }
            }
            if (lb9Var == ((lb9) n0cVar.d) && z) {
                int size6 = list.size();
                int i6 = 0;
                while (true) {
                    if (i6 >= size6) {
                        break;
                    }
                    if (!((rb9) list.get(i6)).b()) {
                        i6++;
                    } else if (!yb9Var.d) {
                        n0cVar.h0(lb9Var);
                        return;
                    }
                }
                int size7 = list.size();
                for (int i7 = 0; i7 < size7; i7++) {
                    ((rb9) list.get(i7)).a();
                }
            }
        }
    }

    @Override // defpackage.q28
    public final void y0() {
        I0(true);
    }

    @Override // defpackage.q28
    public final void z0() {
        if (this.o instanceof yb9) {
            H();
        }
    }

    @Override // defpackage.fp6
    public final void l(hp6 hp6Var) {
    }

    @Override // defpackage.fl7
    public final void p(long j) {
    }
}
