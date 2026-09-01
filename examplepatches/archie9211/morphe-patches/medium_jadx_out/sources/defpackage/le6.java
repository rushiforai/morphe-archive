package defpackage;

import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class le6 implements m45 {
    public final /* synthetic */ int a;
    public final oe6 b;

    public /* synthetic */ le6(oe6 oe6Var, int i) {
        this.a = i;
        this.b = oe6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        oe6 oe6Var = this.b;
        switch (i) {
            case 0:
                List listQ = d46.Q(iy.a(oe6Var.a.e, "This member is not fully supported by Kotlin compiler, so it may be absent or have different signature in next major version", "", "WARNING"));
                return listQ.isEmpty() ? cd7.e : new ny(0, listQ);
            default:
                return oe6Var.a.e.e();
        }
    }
}
