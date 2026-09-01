package defpackage;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ky1 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xy1 b;

    public /* synthetic */ ky1(xy1 xy1Var, int i) {
        this.a = i;
        this.b = xy1Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        xy1 xy1Var = this.b;
        switch (i) {
            case 0:
                xy1Var.reportFullyDrawn();
                return c1e.a;
            case 1:
                return xy1.k(xy1Var);
            case 2:
                df3 df3Var = new df3();
                xy1Var.getNavigationEventDispatcher().b(df3Var);
                return df3Var;
            case 3:
                return new ipb(xy1Var.getApplication(), xy1Var, xy1Var.getIntent() != null ? xy1Var.getIntent().getExtras() : null);
            default:
                iq8 iq8Var = new iq8(new jy1(xy1Var, 1));
                if (Build.VERSION.SDK_INT >= 33) {
                    if (g76.L(Looper.myLooper(), Looper.getMainLooper())) {
                        xy1Var.getLifecycle().a(new ly1(iq8Var, 0, xy1Var));
                    } else {
                        new Handler(Looper.getMainLooper()).post(new ho(xy1Var, 10, iq8Var));
                    }
                }
                return iq8Var;
        }
    }
}
