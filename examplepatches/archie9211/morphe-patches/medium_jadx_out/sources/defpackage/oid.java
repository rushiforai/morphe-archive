package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oid implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m73 b;
    public final /* synthetic */ l78 c;

    public /* synthetic */ oid(m73 m73Var, l78 l78Var, int i) {
        this.a = i;
        this.b = m73Var;
        this.c = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        l78 l78Var = this.c;
        m73 m73Var = this.b;
        switch (i) {
            case 0:
                r00 r00Var = new r00(11, (m45) obj);
                oid oidVar = new oid(m73Var, l78Var, 1);
                if (qe7.a()) {
                    return qe7.a() ? new ne7(r00Var, oidVar, Build.VERSION.SDK_INT == 28 ? ep6.b : oa9.a) : o28.b;
                }
                ik4.k("Magnifier is only supported on API level 28 and higher.");
                return null;
            default:
                yj3 yj3Var = (yj3) obj;
                l78Var.setValue(new s46((((long) m73Var.i0(yj3.a(yj3Var.a))) & 4294967295L) | (((long) m73Var.i0(yj3.b(yj3Var.a))) << 32)));
                return c1e.a;
        }
    }
}
