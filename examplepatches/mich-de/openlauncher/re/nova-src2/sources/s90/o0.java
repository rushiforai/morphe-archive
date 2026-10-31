package s90;

import org.chromium.net.impl.CallbackExceptionImpl;
import org.chromium.net.impl.CronetExceptionImpl;

/* loaded from: classes5.dex */
public final /* synthetic */ class o0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86991a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a1 f86992b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b1 f86993c;

    public /* synthetic */ o0(a1 a1Var, b1 b1Var, int i5) {
        this.f86991a = i5;
        this.f86992b = a1Var;
        this.f86993c = b1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f86991a) {
            case 0:
                try {
                    this.f86993c.mo109run();
                    break;
                } catch (Throwable th2) {
                    this.f86992b.c(new CallbackExceptionImpl("Exception received from UploadDataProvider", th2));
                    return;
                }
            case 1:
                try {
                    this.f86993c.mo109run();
                    break;
                } catch (Throwable th3) {
                    a1 a1Var = this.f86992b;
                    a1Var.d("enterUserErrorState", new q0(a1Var, 1));
                    a1Var.c(new CallbackExceptionImpl("Exception received from UrlRequest.Callback", th3));
                    return;
                }
            default:
                b1 b1Var = this.f86993c;
                a1 a1Var2 = this.f86992b;
                a1Var2.getClass();
                try {
                    b1Var.mo109run();
                    break;
                } catch (Throwable th4) {
                    a1Var2.c(new CronetExceptionImpl("System error", th4));
                }
        }
    }
}
