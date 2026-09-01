package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputResetException;
import java.util.ArrayList;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w4d extends q28 implements vb9, m73, ub9 {
    public Object o;
    public Object p;
    public PointerInputEventHandler q;
    public enc r;
    public lb9 s = r4d.a;
    public final o78 t;
    public final o78 u;
    public final o78 v;
    public lb9 w;
    public long x;

    public w4d(Object obj, Object obj2, PointerInputEventHandler pointerInputEventHandler) {
        this.o = obj;
        this.p = obj2;
        this.q = pointerInputEventHandler;
        o78 o78Var = new o78(new u4d[16]);
        this.t = o78Var;
        this.u = o78Var;
        this.v = new o78(new u4d[16]);
        this.x = 0L;
    }

    @Override // defpackage.q28
    public final void A0() {
        K0();
    }

    @Override // defpackage.ub9
    public final void H() {
        lb9 lb9Var = this.w;
        if (lb9Var == null) {
            return;
        }
        List list = lb9Var.a;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (((rb9) list.get(i)).d) {
                ArrayList arrayList = new ArrayList(list.size());
                int size2 = list.size();
                for (int i2 = 0; i2 < size2; i2++) {
                    rb9 rb9Var = (rb9) list.get(i2);
                    long j = rb9Var.a;
                    long j2 = rb9Var.c;
                    long j3 = rb9Var.b;
                    float f = rb9Var.e;
                    boolean z = rb9Var.d;
                    arrayList.add(new rb9(j, j3, j2, false, f, j3, j2, z, z, rb9Var.i, 0L, 1.0f, 0L));
                }
                lb9 lb9Var2 = new lb9(arrayList, null);
                this.s = lb9Var2;
                J0(lb9Var2, mb9.Initial);
                J0(lb9Var2, mb9.Main);
                J0(lb9Var2, mb9.Final);
                this.w = null;
                return;
            }
        }
    }

    public final Object I0(b55 b55Var, n92 n92Var) {
        x51 x51Var = new x51(1, pwd.Q(n92Var));
        x51Var.s();
        u4d u4dVar = new u4d(this, x51Var);
        synchronized (this.u) {
            this.t.b(u4dVar);
            new knb(pwd.Q(pwd.F(b55Var, u4dVar, u4dVar)), tb2.COROUTINE_SUSPENDED).resumeWith(c1e.a);
        }
        x51Var.v(new fw8(8, u4dVar));
        return x51Var.q();
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
    }

    public final void J0(lb9 lb9Var, mb9 mb9Var) {
        x51 x51Var;
        x51 x51Var2;
        synchronized (this.u) {
            o78 o78Var = this.v;
            o78Var.d(o78Var.c, this.t);
        }
        try {
            int i = v4d.a[mb9Var.ordinal()];
            if (i == 1 || i == 2) {
                o78 o78Var2 = this.v;
                Object[] objArr = o78Var2.a;
                int i2 = o78Var2.c;
                for (int i3 = 0; i3 < i2; i3++) {
                    u4d u4dVar = (u4d) objArr[i3];
                    if (mb9Var == u4dVar.d && (x51Var = u4dVar.c) != null) {
                        u4dVar.c = null;
                        x51Var.resumeWith(lb9Var);
                    }
                }
            } else {
                if (i != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                o78 o78Var3 = this.v;
                int i4 = o78Var3.c - 1;
                Object[] objArr2 = o78Var3.a;
                if (i4 < objArr2.length) {
                    while (i4 >= 0) {
                        u4d u4dVar2 = (u4d) objArr2[i4];
                        if (mb9Var == u4dVar2.d && (x51Var2 = u4dVar2.c) != null) {
                            u4dVar2.c = null;
                            x51Var2.resumeWith(lb9Var);
                        }
                        i4--;
                    }
                }
            }
            this.v.i();
        } catch (Throwable th) {
            this.v.i();
            throw th;
        }
    }

    public final void K0() {
        enc encVar = this.r;
        if (encVar != null) {
            encVar.s(new PointerInputResetException("Pointer input was reset"));
            this.r = null;
        }
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / b();
    }

    @Override // defpackage.m73
    public final float U() {
        return flb.v0(this).y.U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    @Override // defpackage.m73
    public final float b() {
        return flb.v0(this).y.b();
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        throw null;
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        return false;
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    @Override // defpackage.ub9
    public final long n() {
        return iqd.a;
    }

    @Override // defpackage.ub9
    public final void o0() {
        K0();
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    @Override // defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        this.x = j;
        if (mb9Var == mb9.Initial) {
            this.s = lb9Var;
        }
        n92 n92Var = null;
        if (this.r == null) {
            this.r = vx0.c0(u0(), null, wb2.UNDISPATCHED, new xi7(this, n92Var, 23), 1);
        }
        J0(lb9Var, mb9Var);
        List list = lb9Var.a;
        int size = list.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                lb9Var = null;
                break;
            } else if (!mq7.x((rb9) list.get(i))) {
                break;
            } else {
                i++;
            }
        }
        this.w = lb9Var;
    }

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }

    @Override // defpackage.q28
    public final void z0() {
        K0();
    }

    @Override // defpackage.ub9
    public final void M() {
    }
}
