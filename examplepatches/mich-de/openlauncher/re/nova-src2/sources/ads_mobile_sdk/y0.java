package ads_mobile_sdk;

import b.x3;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: classes2.dex */
public final class y0 implements b.o9 {

    /* renamed from: a, reason: collision with root package name */
    public final Map f11894a;

    /* renamed from: b, reason: collision with root package name */
    public final x3 f11895b;

    /* renamed from: c, reason: collision with root package name */
    public final vi3 f11896c;

    /* renamed from: d, reason: collision with root package name */
    public final sh3 f11897d;

    /* renamed from: e, reason: collision with root package name */
    public final long f11898e;

    public y0(x3 x3Var, Map map, j7 j7Var, vi3 vi3Var) {
        this.f11894a = map;
        this.f11895b = x3Var;
        this.f11896c = vi3Var;
        this.f11897d = vi3Var.a(yk0.EVENT_ID_AD_ATTEST_SIGNALS_TASK);
        this.f11898e = j7Var.D();
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        pd pdVar;
        try {
            try {
                try {
                    this.f11897d.b();
                    ListenableFuture listenableFuture = (ListenableFuture) this.f11894a.get("gs");
                    if (listenableFuture != null && (pdVar = (pd) listenableFuture.get(this.f11898e, TimeUnit.MILLISECONDS)) != null) {
                        synchronized (this.f11895b) {
                            x3 x3Var = this.f11895b;
                            he heVarR = pdVar.r();
                            x3Var.b();
                            ((pd) x3Var.f1095b).a(heVarR);
                            x3 x3Var2 = this.f11895b;
                            long jO = pdVar.o();
                            x3Var2.b();
                            pd pdVar2 = (pd) x3Var2.f1095b;
                            pdVar2.bitField1_ |= 1048576;
                            pdVar2.gmscoreVersionSignal_ = jO;
                        }
                    }
                    return null;
                } catch (ClassCastException e3) {
                    this.f11897d.a(e3);
                    return null;
                } catch (TimeoutException unused) {
                    this.f11896c.b(yk0.EVENT_ID_AD_ATTEST_SIGNALS_TASK_TIMEOUT);
                    return null;
                }
            } catch (InterruptedException unused2) {
                Thread.currentThread().interrupt();
                return null;
            } catch (ExecutionException e11) {
                e = e11;
                Throwable cause = e.getCause();
                sh3 sh3Var = this.f11897d;
                if (cause != null) {
                    e = cause;
                }
                sh3Var.a(e);
                return null;
            }
        } finally {
            this.f11897d.a();
        }
    }
}
