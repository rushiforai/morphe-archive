package s90;

import o9.d4;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes5.dex */
public final /* synthetic */ class w0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87052a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x0 f87053b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ UrlResponseInfo f87054c;

    public /* synthetic */ w0(x0 x0Var, UrlResponseInfo urlResponseInfo, int i5) {
        this.f87052a = i5;
        this.f87053b = x0Var;
        this.f87054c = urlResponseInfo;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f87052a) {
            case 0:
                UrlResponseInfo urlResponseInfo = this.f87054c;
                x0 x0Var = this.f87053b;
                a1 a1Var = x0Var.f87058d;
                try {
                    x0Var.f87055a.onCanceled(a1Var, urlResponseInfo);
                } catch (Exception e3) {
                    a1.a(a1Var, "onCanceled", e3);
                }
                x0Var.f87058d.d("maybeReportMetrics", new d4(x0Var, 7));
                a1Var.f86869s.f86964e.decrementAndGet();
                break;
            default:
                UrlResponseInfo urlResponseInfo2 = this.f87054c;
                x0 x0Var2 = this.f87053b;
                a1 a1Var2 = x0Var2.f87058d;
                try {
                    x0Var2.f87055a.onSucceeded(a1Var2, urlResponseInfo2);
                } catch (Exception e11) {
                    a1.a(a1Var2, "onSucceded", e11);
                }
                x0Var2.f87058d.d("maybeReportMetrics", new d4(x0Var2, 7));
                a1Var2.f86869s.f86964e.decrementAndGet();
                break;
        }
    }
}
