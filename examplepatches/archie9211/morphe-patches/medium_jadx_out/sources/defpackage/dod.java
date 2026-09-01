package defpackage;

import android.graphics.Matrix;
import android.graphics.Path;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dod implements m3c {
    public final l78 a;
    public final m3c b;
    public final m3c c;
    public final br d = er.a();
    public final br e = er.a();
    public final br f = er.a();

    public dod(l78 l78Var, m3c m3cVar, m3c m3cVar2) {
        this.a = l78Var;
        this.b = m3cVar;
        this.c = m3cVar2;
    }

    @Override // defpackage.m3c
    public final er7 a(long j, ip6 ip6Var, m73 m73Var) {
        br brVar = this.d;
        brVar.f();
        br brVar2 = this.e;
        brVar2.f();
        br brVar3 = this.f;
        brVar3.f();
        er7 er7VarA = this.b.a(j, ip6Var, m73Var);
        er7 er7VarA2 = this.c.a(j, ip6Var, m73Var);
        if (er7VarA instanceof nw8) {
            b09.l(brVar, ((nw8) er7VarA).d);
        } else if (er7VarA instanceof pw8) {
            b09.n(brVar, ((pw8) er7VarA).d);
        } else {
            if (!(er7VarA instanceof ow8)) {
                ygf.a();
                return null;
            }
            b09.m(brVar, ((ow8) er7VarA).d);
        }
        if (er7VarA2 instanceof nw8) {
            b09.l(brVar3, ((nw8) er7VarA2).d);
        } else if (er7VarA2 instanceof pw8) {
            b09.n(brVar3, ((pw8) er7VarA2).d);
        } else {
            if (!(er7VarA2 instanceof ow8)) {
                ygf.a();
                return null;
            }
            b09.m(brVar3, ((ow8) er7VarA2).d);
        }
        float[] fArr = ((pk7) this.a.getValue()).a;
        Matrix matrix = brVar3.d;
        if (matrix == null) {
            matrix = new Matrix();
            brVar3.d = matrix;
        }
        t40.M(matrix, fArr);
        Path path = brVar3.a;
        Matrix matrix2 = brVar3.d;
        matrix2.getClass();
        path.transform(matrix2);
        brVar2.e(brVar, brVar3, 2);
        return new nw8(brVar2);
    }
}
