package defpackage;

import android.view.KeyEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yfc implements x45 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ hp1 c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ float e;
    public final /* synthetic */ m45 f;

    public yfc(boolean z, x45 x45Var, hp1 hp1Var, boolean z2, float f, m45 m45Var) {
        this.a = z;
        this.b = x45Var;
        this.c = hp1Var;
        this.d = z2;
        this.e = f;
        this.f = m45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        KeyEvent keyEvent = ((hk6) obj).a;
        hp1 hp1Var = this.c;
        float f = hp1Var.b;
        if (!this.a) {
            return Boolean.FALSE;
        }
        x45 x45Var = this.b;
        if (x45Var == null) {
            return Boolean.FALSE;
        }
        int iQ0 = nk7.q0(keyEvent);
        boolean z = false;
        if (iQ0 == 2) {
            float f2 = hp1Var.a;
            float fAbs = Math.abs(f - f2) / 100.0f;
            int i = this.d ? -1 : 1;
            long jM = rv8.m(keyEvent.getKeyCode());
            boolean zA = fk6.a(jM, fk6.d);
            float f3 = this.e;
            if (zA) {
                x45Var.invoke(iq7.y(Float.valueOf((i * fAbs) + f3), hp1Var));
            } else if (fk6.a(jM, fk6.e)) {
                x45Var.invoke(iq7.y(Float.valueOf(f3 - (i * fAbs)), hp1Var));
            } else if (fk6.a(jM, fk6.g)) {
                x45Var.invoke(iq7.y(Float.valueOf((i * fAbs) + f3), hp1Var));
            } else if (fk6.a(jM, fk6.f)) {
                x45Var.invoke(iq7.y(Float.valueOf(f3 - (i * fAbs)), hp1Var));
            } else if (fk6.a(jM, fk6.v)) {
                x45Var.invoke(Float.valueOf(f2));
            } else if (fk6.a(jM, fk6.w)) {
                x45Var.invoke(Float.valueOf(f));
            } else if (fk6.a(jM, fk6.C)) {
                x45Var.invoke(iq7.y(Float.valueOf(f3 - (iq7.v(10, 1, 10) * fAbs)), hp1Var));
            } else if (fk6.a(jM, fk6.D)) {
                x45Var.invoke(iq7.y(Float.valueOf((iq7.v(10, 1, 10) * fAbs) + f3), hp1Var));
            }
            z = true;
        } else if (iQ0 == 1) {
            long jM2 = rv8.m(keyEvent.getKeyCode());
            if (fk6.a(jM2, fk6.d) || fk6.a(jM2, fk6.e) || fk6.a(jM2, fk6.g) || fk6.a(jM2, fk6.f) || fk6.a(jM2, fk6.v) || fk6.a(jM2, fk6.w) || fk6.a(jM2, fk6.C) || fk6.a(jM2, fk6.D)) {
                m45 m45Var = this.f;
                if (m45Var != null) {
                    m45Var.invoke();
                }
                z = true;
            }
        }
        return Boolean.valueOf(z);
    }
}
