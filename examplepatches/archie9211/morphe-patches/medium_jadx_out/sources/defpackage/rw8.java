package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rw8 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ m45 d;

    public /* synthetic */ rw8(boolean z, m45 m45Var, m45 m45Var2, int i) {
        this.a = i;
        this.b = z;
        this.c = m45Var;
        this.d = m45Var2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.d;
        m45 m45Var2 = this.c;
        boolean z = this.b;
        switch (i) {
            case 0:
                if (!z) {
                    m45Var.invoke();
                } else {
                    m45Var2.invoke();
                }
                break;
            default:
                if (z && Build.VERSION.SDK_INT >= 33) {
                    m45Var2.invoke();
                } else if (Build.VERSION.SDK_INT >= 26) {
                    m45Var.invoke();
                }
                break;
        }
        return c1eVar;
    }
}
