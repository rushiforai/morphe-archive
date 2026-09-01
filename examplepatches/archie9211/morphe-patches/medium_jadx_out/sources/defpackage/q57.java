package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class q57 extends que {
    public static final i33 d = new i33(2);
    public final xkc b = new xkc(0);
    public boolean c = false;

    @Override // defpackage.que
    public final void d() {
        xkc xkcVar = this.b;
        int iE = xkcVar.e();
        for (int i = 0; i < iE; i++) {
            o57 o57Var = (o57) xkcVar.g(i);
            gkf gkfVar = o57Var.l;
            gkfVar.c();
            gkfVar.c = true;
            p57 p57Var = o57Var.n;
            if (p57Var != null) {
                o57Var.i(p57Var);
            }
            o57 o57Var2 = gkfVar.a;
            if (o57Var2 == null) {
                ygf.f("No listener register");
                return;
            }
            if (o57Var2 != o57Var) {
                ay0.e("Attempting to unregister the wrong listener");
                return;
            }
            gkfVar.a = null;
            if (p57Var != null) {
                boolean z = p57Var.b;
            }
            gkfVar.d = true;
            gkfVar.b = false;
            gkfVar.c = false;
            gkfVar.e = false;
        }
        int i2 = xkcVar.d;
        Object[] objArr = xkcVar.c;
        for (int i3 = 0; i3 < i2; i3++) {
            objArr[i3] = null;
        }
        xkcVar.d = 0;
        xkcVar.a = false;
    }
}
