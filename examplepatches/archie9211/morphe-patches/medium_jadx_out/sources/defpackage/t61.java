package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t61 {
    public final float a;
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final float f;

    public t61(float f, float f2, float f3, float f4, float f5, float f6) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
        this.e = f5;
        this.f = f6;
    }

    public final upc a(boolean z, m68 m68Var, x12 x12Var, int i) {
        ou ouVar;
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-1763481333);
        float f = this.a;
        uob uobVar = w12.a;
        if (m68Var == null) {
            p65Var.Y(167751211);
            Object objM = p65Var.M();
            Object obj = objM;
            if (objM == uobVar) {
                k49 k49VarU = qo7.u(new vj3(f));
                p65Var.j0(k49VarU);
                obj = k49VarU;
            }
            l78 l78Var = (l78) obj;
            p65Var.p(false);
            p65Var.p(false);
            return l78Var;
        }
        p65Var.Y(167824247);
        p65Var.p(false);
        Object objM2 = p65Var.M();
        Object obj2 = objM2;
        if (objM2 == uobVar) {
            ejc ejcVar = new ejc();
            p65Var.j0(ejcVar);
            obj2 = ejcVar;
        }
        ejc ejcVar2 = (ejc) obj2;
        int i2 = 1;
        boolean z2 = (((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var.f(m68Var)) || (i & 48) == 32;
        Object objM3 = p65Var.M();
        n92 n92Var = null;
        Object obj3 = objM3;
        if (z2 || objM3 == uobVar) {
            k11 k11Var = new k11(m68Var, ejcVar2, n92Var, i2);
            p65Var.j0(k11Var);
            obj3 = k11Var;
        }
        kyd.k(p65Var, (b55) obj3, m68Var);
        c56 c56Var = (c56) bu1.I0(ejcVar2);
        if (!z) {
            f = this.f;
        } else if (c56Var instanceof h0a) {
            f = this.b;
        } else if (c56Var instanceof sr5) {
            f = this.d;
        } else if (c56Var instanceof gr4) {
            f = this.c;
        } else if (c56Var instanceof gl3) {
            f = this.e;
        }
        Object objM4 = p65Var.M();
        Object obj4 = objM4;
        if (objM4 == uobVar) {
            ou ouVar2 = new ou(new vj3(f), d46.k, null, 12);
            p65Var.j0(ouVar2);
            obj4 = ouVar2;
        }
        ou ouVar3 = (ou) obj4;
        vj3 vj3Var = new vj3(f);
        int i3 = (p65Var.h(ouVar3) ? 1 : 0) | (p65Var.c(f) ? 1 : 0) | (((((i & 14) ^ 6) <= 4 || !p65Var.g(z)) && (i & 6) != 4) ? 0 : 1);
        if ((((i & 896) ^ 384) <= 256 || !p65Var.f(this)) && (i & 384) != 256) {
            i2 = 0;
        }
        int i4 = i3 | i2 | (p65Var.h(c56Var) ? 1 : 0);
        Object objM5 = p65Var.M();
        if (i4 != 0 || objM5 == uobVar) {
            ouVar = ouVar3;
            s61 s61Var = new s61(ouVar, f, z, this, c56Var, (n92) null);
            p65Var.j0(s61Var);
            objM5 = s61Var;
        } else {
            ouVar = ouVar3;
        }
        kyd.k(p65Var, (b55) objM5, vj3Var);
        xw xwVar = ouVar.c;
        p65Var.p(false);
        return xwVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof t61)) {
            return false;
        }
        t61 t61Var = (t61) obj;
        return vj3.b(this.a, t61Var.a) && vj3.b(this.b, t61Var.b) && vj3.b(this.c, t61Var.c) && vj3.b(this.d, t61Var.d) && vj3.b(this.f, t61Var.f);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.f) + km4.p(this.d, km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31), 31);
    }
}
