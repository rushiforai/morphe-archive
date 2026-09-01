package defpackage;

import android.graphics.Path;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k59 extends zpe {
    public ez0 b;
    public float c = 1.0f;
    public List d;
    public float e;
    public float f;
    public ez0 g;
    public int h;
    public int i;
    public float j;
    public float k;
    public float l;
    public float m;
    public boolean n;
    public boolean o;
    public boolean p;
    public uuc q;
    public final br r;
    public br s;
    public br t;
    public final vq6 u;

    public k59() {
        int i = fre.a;
        this.d = ey3.a;
        this.e = 1.0f;
        this.h = 0;
        this.i = 0;
        this.j = 4.0f;
        this.l = 1.0f;
        this.n = true;
        this.o = true;
        br brVarA = er.a();
        this.r = brVarA;
        this.s = brVarA;
        this.u = vx0.d0(yw6.NONE, b18.e);
    }

    @Override // defpackage.zpe
    public final void a(zl3 zl3Var) {
        zl3 zl3Var2;
        uuc uucVar;
        if (this.n) {
            yo7.w(this.d, this.r);
            e();
        } else if (this.p) {
            e();
        }
        this.n = false;
        this.p = false;
        ez0 ez0Var = this.b;
        if (ez0Var != null) {
            zl3Var2 = zl3Var;
            ho2.o(zl3Var2, this.s, ez0Var, this.c, null, 56);
        } else {
            zl3Var2 = zl3Var;
        }
        ez0 ez0Var2 = this.g;
        if (ez0Var2 != null) {
            uuc uucVar2 = this.q;
            if (this.o || uucVar2 == null) {
                uuc uucVar3 = new uuc(this.f, this.j, this.h, this.i, 16);
                this.q = uucVar3;
                this.o = false;
                uucVar = uucVar3;
            } else {
                uucVar = uucVar2;
            }
            ho2.o(zl3Var2, this.s, ez0Var2, this.e, uucVar, 48);
        }
    }

    public final void e() {
        float f = this.k;
        br brVar = this.r;
        if (f == 0.0f && this.l == 1.0f) {
            this.s = brVar;
            return;
        }
        br brVar2 = this.s;
        if (brVar2 != brVar) {
            int i = brVar2.a.getFillType() == Path.FillType.EVEN_ODD ? 1 : 0;
            this.s.a.rewind();
            this.s.g(i);
        } else {
            this.s = er.a();
        }
        vq6 vq6Var = this.u;
        ((cr) vq6Var.getValue()).a.setPath(brVar.a, false);
        float length = ((cr) vq6Var.getValue()).a.getLength();
        float f2 = this.k;
        float f3 = this.m;
        float f4 = ((f2 + f3) % 1.0f) * length;
        float f5 = ((this.l + f3) % 1.0f) * length;
        if (f4 <= f5) {
            ((cr) vq6Var.getValue()).a(f4, f5, this.s);
            return;
        }
        br brVarA = this.t;
        if (brVarA == null) {
            brVarA = er.a();
            this.t = brVarA;
        }
        brVarA.f();
        ((cr) vq6Var.getValue()).a(f4, length, brVarA);
        b09.l(this.s, brVarA);
        brVarA.f();
        ((cr) vq6Var.getValue()).a(0.0f, f5, brVarA);
        b09.l(this.s, brVarA);
    }

    public final String toString() {
        return this.r.toString();
    }
}
