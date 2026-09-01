package defpackage;

import java.io.IOException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sp8 implements v31 {
    public final ybb a;
    public final Object b;
    public final Object[] c;
    public final u31 d;
    public final y92 e;
    public volatile boolean f;
    public cva g;
    public Throwable h;
    public boolean i;

    public sp8(ybb ybbVar, Object obj, Object[] objArr, u31 u31Var, y92 y92Var) {
        this.a = ybbVar;
        this.b = obj;
        this.c = objArr;
        this.d = u31Var;
        this.e = y92Var;
    }

    public final cva a() {
        pt5 pt5Var;
        qt5 qt5VarC;
        ybb ybbVar = this.a;
        to7[] to7VarArr = ybbVar.k;
        Object[] objArr = this.c;
        int length = objArr.length;
        if (length != to7VarArr.length) {
            ay0.e(ho2.H(ev6.C("Argument count (", length, ") doesn't match expected count ("), to7VarArr.length, ")"));
            return null;
        }
        ubb ubbVar = new ubb(ybbVar.d, ybbVar.c, ybbVar.e, ybbVar.f, ybbVar.g, ybbVar.h, ybbVar.i, ybbVar.j);
        if (ybbVar.l) {
            length--;
        }
        ArrayList arrayList = new ArrayList(length);
        for (int i = 0; i < length; i++) {
            arrayList.add(objArr[i]);
            to7VarArr[i].h(ubbVar, objArr[i]);
        }
        pt5 pt5Var2 = ubbVar.d;
        if (pt5Var2 != null) {
            qt5VarC = pt5Var2.c();
        } else {
            String str = ubbVar.c;
            qt5 qt5Var = ubbVar.b;
            qt5Var.getClass();
            str.getClass();
            try {
                pt5Var = new pt5();
                pt5Var.f(qt5Var, str);
            } catch (IllegalArgumentException unused) {
                pt5Var = null;
            }
            qt5VarC = pt5Var != null ? pt5Var.c() : null;
            if (qt5VarC == null) {
                StringBuilder sb = new StringBuilder("Malformed URL. Base: ");
                sb.append(qt5Var);
                ywb.l(sb, ", Relative: ", ubbVar.c);
                return null;
            }
        }
        sbb tbbVar = ubbVar.k;
        if (tbbVar == null) {
            n05 n05Var = ubbVar.j;
            if (n05Var != null) {
                tbbVar = new o05(n05Var.a, n05Var.b);
            } else {
                ku3 ku3Var = ubbVar.i;
                if (ku3Var != null) {
                    ArrayList arrayList2 = (ArrayList) ku3Var.d;
                    if (arrayList2.isEmpty()) {
                        ygf.f("Multipart body must have at least one part.");
                        return null;
                    }
                    tbbVar = new a68((h21) ku3Var.b, (fn7) ku3Var.c, ggf.j(arrayList2));
                } else if (ubbVar.h) {
                    qbb qbbVar = sbb.a;
                    egf.a(0L, 0L, 0L);
                    tbbVar = new rbb(null, 0, new byte[0]);
                }
            }
        }
        fn7 fn7Var = ubbVar.g;
        ru ruVar = ubbVar.f;
        if (fn7Var != null) {
            if (tbbVar != null) {
                tbbVar = new tbb(tbbVar, fn7Var);
            } else {
                ruVar.c("Content-Type", fn7Var.a);
            }
        }
        iq1 iq1Var = ubbVar.e;
        iq1Var.b = qt5VarC;
        ruVar.getClass();
        iq1Var.d = iq7.E(iq7.C(ruVar));
        iq1Var.J(ubbVar.a, tbbVar);
        iq1Var.f = ((ep7) iq1Var.f).y(n1b.a.b(w76.class), new w76(ybbVar.a, this.b, ybbVar.b, arrayList));
        return this.d.a(new kbb(iq1Var));
    }

    public final cva b() throws IOException {
        cva cvaVar = this.g;
        if (cvaVar != null) {
            return cvaVar;
        }
        Throwable th = this.h;
        if (th != null) {
            if (th instanceof IOException) {
                throw ((IOException) th);
            }
            if (th instanceof RuntimeException) {
                throw ((RuntimeException) th);
            }
            throw ((Error) th);
        }
        try {
            cva cvaVarA = a();
            this.g = cvaVarA;
            return cvaVarA;
        } catch (IOException | Error | RuntimeException e) {
            vv2.Y(e);
            this.h = e;
            throw e;
        }
    }

    public final zcb c(adb adbVar) throws IOException {
        fdb fdbVar = adbVar.g;
        ycb ycbVarM = adbVar.m();
        ycbVarM.g = new rp8(fdbVar.m(), fdbVar.f());
        adb adbVarA = ycbVarM.a();
        int i = adbVarA.d;
        if (i < 200 || i >= 300) {
            try {
                kz0 kz0Var = new kz0();
                fdbVar.v0().S(kz0Var);
                edb edbVar = new edb(fdbVar.m(), fdbVar.f(), kz0Var);
                if (adbVarA.q) {
                    throw new IllegalArgumentException("rawResponse should not be successful response");
                }
                return new zcb(adbVarA, null, edbVar);
            } finally {
                fdbVar.close();
            }
        }
        if (i == 204 || i == 205) {
            fdbVar.close();
            return zcb.b(null, adbVarA);
        }
        qp8 qp8Var = new qp8(fdbVar);
        try {
            return zcb.b(this.e.v(qp8Var), adbVarA);
        } catch (RuntimeException e) {
            IOException iOException = qp8Var.e;
            if (iOException == null) {
                throw e;
            }
            throw iOException;
        }
    }

    @Override // defpackage.v31
    public final void cancel() {
        cva cvaVar;
        this.f = true;
        synchronized (this) {
            cvaVar = this.g;
        }
        if (cvaVar != null) {
            cvaVar.cancel();
        }
    }

    @Override // defpackage.v31
    /* JADX INFO: renamed from: clone */
    public final v31 mo127clone() {
        return new sp8(this.a, this.b, this.c, this.d, this.e);
    }

    @Override // defpackage.v31
    public final void f(i41 i41Var) {
        cva cvaVar;
        Throwable th;
        synchronized (this) {
            try {
                if (this.i) {
                    throw new IllegalStateException("Already executed.");
                }
                this.i = true;
                cvaVar = this.g;
                th = this.h;
                if (cvaVar == null && th == null) {
                    try {
                        cva cvaVarA = a();
                        this.g = cvaVarA;
                        cvaVar = cvaVarA;
                    } catch (Throwable th2) {
                        th = th2;
                        vv2.Y(th);
                        this.h = th;
                    }
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        if (th != null) {
            i41Var.w(this, th);
            return;
        }
        if (this.f) {
            cvaVar.cancel();
        }
        cvaVar.c(new gg5(this, i41Var));
    }

    @Override // defpackage.v31
    public final boolean m() {
        boolean z = true;
        if (this.f) {
            return true;
        }
        synchronized (this) {
            try {
                cva cvaVar = this.g;
                if (cvaVar == null || !cvaVar.q) {
                    z = false;
                }
            } finally {
            }
        }
        return z;
    }

    @Override // defpackage.v31
    public final synchronized kbb p() {
        try {
        } catch (IOException e) {
            throw new RuntimeException("Unable to create request.", e);
        }
        return b().b;
    }

    public final Object clone() {
        return new sp8(this.a, this.b, this.c, this.d, this.e);
    }
}
