package defpackage;

import android.window.OnBackInvokedCallback;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xy implements OnBackInvokedCallback {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ xy(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public final void onBackInvoked() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                m45 m45Var = (m45) obj;
                if (m45Var != null) {
                    m45Var.invoke();
                }
                break;
            case 1:
                ((f20) obj).D();
                break;
            case 2:
                ((mj7) obj).a();
                break;
            case 3:
                ((bq8) obj).a();
                break;
            default:
                ((Runnable) obj).run();
                break;
        }
    }
}
