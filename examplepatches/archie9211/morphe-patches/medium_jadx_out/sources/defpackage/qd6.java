package defpackage;

import j$.util.Objects;
import java.io.IOException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qd6 extends yd6 {
    public static final pd6 r = new pd6();
    public static final zc6 s = new zc6("closed");
    public final ArrayList o;
    public String p;
    public dc6 q;

    public qd6() {
        super(r);
        this.o = new ArrayList();
        this.q = pc6.a;
    }

    @Override // defpackage.yd6
    public final void A0(String str) {
        if (str == null) {
            I0(pc6.a);
        } else {
            I0(new zc6(str));
        }
    }

    @Override // defpackage.yd6
    public final void D() {
        ArrayList arrayList = this.o;
        if (arrayList.isEmpty() || this.p != null) {
            lg8.d();
        } else if (H0() instanceof pb6) {
            arrayList.remove(arrayList.size() - 1);
        } else {
            lg8.d();
        }
    }

    @Override // defpackage.yd6
    public final void E0(boolean z) {
        I0(new zc6(Boolean.valueOf(z)));
    }

    public final dc6 G0() {
        ArrayList arrayList = this.o;
        if (arrayList.isEmpty()) {
            return this.q;
        }
        ik4.o("Expected one JSON element but was ", arrayList);
        return null;
    }

    public final dc6 H0() {
        return (dc6) y30.m(1, this.o);
    }

    @Override // defpackage.yd6
    public final void I() {
        ArrayList arrayList = this.o;
        if (arrayList.isEmpty() || this.p != null) {
            lg8.d();
        } else if (H0() instanceof uc6) {
            arrayList.remove(arrayList.size() - 1);
        } else {
            lg8.d();
        }
    }

    public final void I0(dc6 dc6Var) {
        if (this.p != null) {
            if (!(dc6Var instanceof pc6) || this.k) {
                ((uc6) H0()).p(this.p, dc6Var);
            }
            this.p = null;
            return;
        }
        if (this.o.isEmpty()) {
            this.q = dc6Var;
            return;
        }
        dc6 dc6VarH0 = H0();
        if (dc6VarH0 instanceof pb6) {
            ((pb6) dc6VarH0).p(dc6Var);
        } else {
            lg8.d();
        }
    }

    @Override // defpackage.yd6
    public final void L(String str) {
        Objects.requireNonNull(str, "name == null");
        if (this.o.isEmpty() || this.p != null) {
            ygf.f("Did not expect a name");
        } else if (H0() instanceof uc6) {
            this.p = str;
        } else {
            ygf.f("Please begin an object before writing a name.");
        }
    }

    @Override // defpackage.yd6
    public final yd6 Q() {
        I0(pc6.a);
        return this;
    }

    @Override // defpackage.yd6, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        ArrayList arrayList = this.o;
        if (arrayList.isEmpty()) {
            arrayList.add(s);
        } else {
            ik4.g("Incomplete document");
        }
    }

    @Override // defpackage.yd6
    public final void j0(double d) {
        if (this.h != euc.LENIENT && (Double.isNaN(d) || Double.isInfinite(d))) {
            rd6.c(d, "JSON forbids NaN and infinities: ");
        } else {
            I0(new zc6(Double.valueOf(d)));
        }
    }

    @Override // defpackage.yd6
    public final void m() {
        pb6 pb6Var = new pb6();
        I0(pb6Var);
        this.o.add(pb6Var);
    }

    @Override // defpackage.yd6
    public final void o0(long j) {
        I0(new zc6(Long.valueOf(j)));
    }

    @Override // defpackage.yd6
    public final void p() {
        uc6 uc6Var = new uc6();
        I0(uc6Var);
        this.o.add(uc6Var);
    }

    @Override // defpackage.yd6
    public final void p0(Boolean bool) {
        if (bool == null) {
            I0(pc6.a);
        } else {
            I0(new zc6(bool));
        }
    }

    @Override // defpackage.yd6
    public final void z0(Number number) {
        if (number == null) {
            I0(pc6.a);
            return;
        }
        if (this.h != euc.LENIENT) {
            double dDoubleValue = number.doubleValue();
            if (Double.isNaN(dDoubleValue) || Double.isInfinite(dDoubleValue)) {
                ik4.h("JSON forbids NaN and infinities: ", number);
                return;
            }
        }
        I0(new zc6(number));
    }

    @Override // defpackage.yd6, java.io.Flushable
    public final void flush() {
    }
}
