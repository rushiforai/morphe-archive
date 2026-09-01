package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class n89 extends l89 {
    public final m89 d;
    public Object e;
    public boolean f;
    public int g;

    public n89(m89 m89Var, atd[] atdVarArr) {
        super(m89Var.b, atdVarArr);
        this.d = m89Var;
        this.g = m89Var.d;
    }

    public final void c(int i, zsd zsdVar, Object obj, int i2) {
        int i3 = i2 * 5;
        atd[] atdVarArr = this.a;
        if (i3 <= 30) {
            int iB = 1 << er7.B(i, i3);
            if (zsdVar.h(iB)) {
                atdVarArr[i2].a(Integer.bitCount(zsdVar.a) * 2, zsdVar.f(iB), zsdVar.d);
                this.b = i2;
                return;
            }
            int iT = zsdVar.t(iB);
            zsd zsdVarS = zsdVar.s(iT);
            atdVarArr[i2].a(Integer.bitCount(zsdVar.a) * 2, iT, zsdVar.d);
            c(i, zsdVarS, obj, i2 + 1);
            return;
        }
        atd atdVar = atdVarArr[i2];
        Object[] objArr = zsdVar.d;
        atdVar.a(objArr.length, 0, objArr);
        while (true) {
            atd atdVar2 = atdVarArr[i2];
            if (g76.L(atdVar2.a[atdVar2.c], obj)) {
                this.b = i2;
                return;
            } else {
                atdVarArr[i2].c += 2;
            }
        }
    }

    @Override // defpackage.l89, java.util.Iterator
    public final Object next() {
        if (this.d.d != this.g) {
            z10.g();
            return null;
        }
        if (!this.c) {
            ywb.n();
            return null;
        }
        atd atdVar = this.a[this.b];
        this.e = atdVar.a[atdVar.c];
        this.f = true;
        return super.next();
    }

    @Override // defpackage.l89, java.util.Iterator
    public final void remove() {
        if (!this.f) {
            lg8.d();
            return;
        }
        boolean z = this.c;
        m89 m89Var = this.d;
        if (!z) {
            pwd.y(m89Var).remove(this.e);
        } else {
            if (!z) {
                ywb.n();
                return;
            }
            atd atdVar = this.a[this.b];
            Object obj = atdVar.a[atdVar.c];
            pwd.y(m89Var).remove(this.e);
            c(obj != null ? obj.hashCode() : 0, m89Var.b, obj, 0);
        }
        this.e = null;
        this.f = false;
        this.g = m89Var.d;
    }
}
