package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ew1 implements ib2, Serializable {
    public final ib2 a;
    public final gb2 b;

    public ew1(gb2 gb2Var, ib2 ib2Var) {
        ib2Var.getClass();
        this.a = ib2Var;
        this.b = gb2Var;
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        int iA = a();
        ib2[] ib2VarArr = new ib2[iA];
        pya pyaVar = new pya();
        N(new ag1(ib2VarArr, 3, pyaVar), c1e.a);
        if (pyaVar.a == iA) {
            return new dw1(ib2VarArr);
        }
        ygf.f("Check failed.");
        return null;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(this.a.N(b55Var, obj), this.b);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        hb2Var.getClass();
        gb2 gb2Var = this.b;
        gb2 gb2VarO0 = gb2Var.o0(hb2Var);
        ib2 ib2Var = this.a;
        if (gb2VarO0 != null) {
            return ib2Var;
        }
        ib2 ib2VarT = ib2Var.T(hb2Var);
        return ib2VarT == ib2Var ? this : ib2VarT == zx3.a ? gb2Var : new ew1(gb2Var, ib2VarT);
    }

    public final int a() {
        int i = 2;
        while (true) {
            ib2 ib2Var = this.a;
            this = ib2Var instanceof ew1 ? (ew1) ib2Var : null;
            if (this == null) {
                return i;
            }
            i++;
        }
    }

    public final boolean equals(Object obj) {
        boolean zL;
        if (this == obj) {
            return true;
        }
        if (obj instanceof ew1) {
            ew1 ew1Var = (ew1) obj;
            if (ew1Var.a() == a()) {
                while (true) {
                    gb2 gb2Var = this.b;
                    if (!g76.L(ew1Var.o0(gb2Var.getKey()), gb2Var)) {
                        zL = false;
                        break;
                    }
                    ib2 ib2Var = this.a;
                    if (!(ib2Var instanceof ew1)) {
                        ib2Var.getClass();
                        gb2 gb2Var2 = (gb2) ib2Var;
                        zL = g76.L(ew1Var.o0(gb2Var2.getKey()), gb2Var2);
                        break;
                    }
                    this = (ew1) ib2Var;
                }
                if (zL) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.b.hashCode() + this.a.hashCode();
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        ib2Var.getClass();
        return ib2Var == zx3.a ? this : (ib2) ib2Var.N(new v02(16, (byte) 0), this);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        hb2Var.getClass();
        while (true) {
            gb2 gb2VarO0 = this.b.o0(hb2Var);
            if (gb2VarO0 != null) {
                return gb2VarO0;
            }
            ib2 ib2Var = this.a;
            if (!(ib2Var instanceof ew1)) {
                return ib2Var.o0(hb2Var);
            }
            this = (ew1) ib2Var;
        }
    }

    public final String toString() {
        return ev6.z(new StringBuilder("["), (String) N(new p02(7), ""), ']');
    }
}
