package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class br6 implements ht6 {
    public final ur6 a;

    public br6(ur6 ur6Var) {
        this.a = ur6Var;
    }

    @Override // defpackage.ht6
    public final int a() {
        return this.a.g().p;
    }

    @Override // defpackage.ht6
    public final int b() {
        return ((nr6) bu1.H0(this.a.g().m)).a;
    }

    @Override // defpackage.ht6
    public final int c() {
        int i;
        ur6 ur6Var = this.a;
        int i2 = 0;
        if (ur6Var.g().m.isEmpty()) {
            return 0;
        }
        mr6 mr6VarG = ur6Var.g();
        hw8 hw8Var = mr6VarG.q;
        hw8 hw8Var2 = hw8.Vertical;
        int iG = (int) (hw8Var == hw8Var2 ? mr6VarG.g() & 4294967295L : mr6VarG.g() >> 32);
        mr6 mr6VarG2 = ur6Var.g();
        hw8 hw8Var3 = mr6VarG2.q;
        List list = mr6VarG2.m;
        boolean z = hw8Var3 == hw8Var2;
        if (!list.isEmpty()) {
            int i3 = 0;
            int i4 = 0;
            int i5 = 0;
            while (i3 < list.size()) {
                nr6 nr6Var = (nr6) list.get(i3);
                int i6 = z ? nr6Var.u : nr6Var.v;
                if (i6 == -1) {
                    i3++;
                } else {
                    int iMax = 0;
                    while (i3 < list.size()) {
                        nr6 nr6Var2 = (nr6) list.get(i3);
                        if ((z ? nr6Var2.u : nr6Var2.v) != i6) {
                            break;
                        }
                        iMax = Math.max(iMax, (int) (z ? ((nr6) list.get(i3)).s & 4294967295L : ((nr6) list.get(i3)).s >> 32));
                        i3++;
                    }
                    i4 += iMax;
                    i5++;
                }
            }
            i2 = (i4 / i5) + mr6VarG2.s;
        }
        if (i2 != 0 && (i = iG / i2) >= 1) {
            return i;
        }
        return 1;
    }

    @Override // defpackage.ht6
    public final boolean d() {
        return !this.a.g().m.isEmpty();
    }

    @Override // defpackage.ht6
    public final int e() {
        return this.a.d.b.g();
    }
}
