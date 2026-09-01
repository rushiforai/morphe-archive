package defpackage;

import org.chromium.net.impl.CallbackExceptionImpl;
import org.chromium.net.impl.CronetExceptionImpl;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ha6 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ na6 b;
    public final /* synthetic */ oa6 c;

    public /* synthetic */ ha6(na6 na6Var, oa6 oa6Var, int i) {
        this.a = i;
        this.b = na6Var;
        this.c = oa6Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        oa6 oa6Var = this.c;
        na6 na6Var = this.b;
        switch (i) {
            case 0:
                try {
                    oa6Var.run();
                } catch (Throwable th) {
                    na6Var.e0(new CronetExceptionImpl("System error", th));
                }
                break;
            case 1:
                try {
                    oa6Var.run();
                } catch (Throwable th2) {
                    na6Var.f0(new ga6(na6Var, 1), "enterUserErrorState");
                    na6Var.e0(new CallbackExceptionImpl("Exception received from UrlRequest.Callback", th2));
                    return;
                }
                break;
            default:
                try {
                    oa6Var.run();
                } catch (Throwable th3) {
                    na6Var.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", th3));
                    return;
                }
                break;
        }
    }
}
