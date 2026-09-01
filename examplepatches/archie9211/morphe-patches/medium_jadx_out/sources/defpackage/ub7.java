package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ub7 implements upc {
    public final k49 a;
    public final k49 b;
    public final k49 c;
    public final k49 d;
    public final k49 e;
    public final k49 f;
    public final k49 g;
    public final j83 h;
    public final k49 i;
    public final k49 j;
    public final k49 k;
    public final k49 l;
    public final j83 m;
    public final z78 n;

    public ub7() {
        Boolean bool = Boolean.FALSE;
        this.a = qo7.u(bool);
        this.b = qo7.u(1);
        this.c = qo7.u(1);
        this.d = qo7.u(bool);
        this.e = qo7.u(null);
        this.f = qo7.u(Float.valueOf(1.0f));
        this.g = qo7.u(bool);
        this.h = bjc.b(new sb7(this, 1));
        this.i = qo7.u(null);
        Float fValueOf = Float.valueOf(0.0f);
        this.j = qo7.u(fValueOf);
        this.k = qo7.u(fValueOf);
        this.l = qo7.u(Long.MIN_VALUE);
        this.m = bjc.b(new sb7(this, 0));
        bjc.b(new sb7(this, 2));
        this.n = new z78();
    }

    public final ac7 c() {
        return (ac7) this.e.getValue();
    }

    public final int d() {
        return ((Number) this.b.getValue()).intValue();
    }

    public final float e() {
        return ((Number) this.k.getValue()).floatValue();
    }

    public final float f() {
        return ((Number) this.f.getValue()).floatValue();
    }

    public final boolean g(int i, long j) {
        bc7 bc7Var = (bc7) this.i.getValue();
        if (bc7Var == null) {
            return true;
        }
        k49 k49Var = this.l;
        long jLongValue = ((Number) k49Var.getValue()).longValue() == Long.MIN_VALUE ? 0L : j - ((Number) k49Var.getValue()).longValue();
        k49Var.setValue(Long.valueOf(j));
        ac7 ac7VarC = c();
        float fB = ac7VarC != null ? ac7VarC.b(bc7Var) : 0.0f;
        ac7 ac7VarC2 = c();
        float fA = ac7VarC2 != null ? ac7VarC2.a(bc7Var) : 1.0f;
        float fB2 = (jLongValue / 1000000) / bc7Var.b();
        j83 j83Var = this.h;
        float fFloatValue = ((Number) j83Var.getValue()).floatValue() * fB2;
        float fFloatValue2 = ((Number) j83Var.getValue()).floatValue();
        k49 k49Var2 = this.j;
        float fFloatValue3 = fFloatValue2 < 0.0f ? fB - (((Number) k49Var2.getValue()).floatValue() + fFloatValue) : (((Number) k49Var2.getValue()).floatValue() + fFloatValue) - fA;
        if (fB == fA) {
            j(fB);
            return false;
        }
        if (fFloatValue3 < 0.0f) {
            j(iq7.u(((Number) k49Var2.getValue()).floatValue(), fB, fA) + fFloatValue);
            return true;
        }
        float f = fA - fB;
        int i2 = (int) (fFloatValue3 / f);
        int i3 = i2 + 1;
        if (d() + i3 > i) {
            j(((Number) this.m.getValue()).floatValue());
            h(i);
            return false;
        }
        h(d() + i3);
        float f2 = fFloatValue3 - (i2 * f);
        j(((Number) j83Var.getValue()).floatValue() < 0.0f ? fA - f2 : fB + f2);
        return true;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return Float.valueOf(e());
    }

    public final void h(int i) {
        this.b.setValue(Integer.valueOf(i));
    }

    public final void i(boolean z) {
        this.a.setValue(Boolean.valueOf(z));
    }

    public final void j(float f) {
        bc7 bc7Var;
        this.j.setValue(Float.valueOf(f));
        if (((Boolean) this.g.getValue()).booleanValue() && (bc7Var = (bc7) this.i.getValue()) != null) {
            f -= f % (1.0f / bc7Var.n);
        }
        this.k.setValue(Float.valueOf(f));
    }
}
