package defpackage;

import android.os.CancellationSignal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class m12 implements CancellationSignal.OnCancelListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ m12(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.os.CancellationSignal.OnCancelListener
    public final void onCancel() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((enc) obj).m(null);
                break;
            default:
                lid lidVar = (lid) obj;
                if (lidVar != null) {
                    kx6 kx6Var = lidVar.d;
                    if (kx6Var != null) {
                        kx6Var.e(bkd.b);
                    }
                    kx6 kx6Var2 = lidVar.d;
                    if (kx6Var2 != null) {
                        kx6Var2.f(bkd.b);
                    }
                }
                break;
        }
    }
}
