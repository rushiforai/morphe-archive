package n7;

import android.webkit.SafeBrowsingResponse;
import b.k2;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import org.chromium.support_lib_boundary.SafeBrowsingResponseBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;

/* loaded from: classes2.dex */
public final class m extends m7.f {

    /* renamed from: a, reason: collision with root package name */
    public SafeBrowsingResponse f77925a;

    /* renamed from: b, reason: collision with root package name */
    public SafeBrowsingResponseBoundaryInterface f77926b;

    public m(SafeBrowsingResponse safeBrowsingResponse) {
        this.f77925a = safeBrowsingResponse;
    }

    @Override // m7.f
    public final void a() throws IllegalArgumentException {
        b bVar = w.f77944e;
        if (bVar.a()) {
            if (this.f77925a == null) {
                d dVar = x.f77964a;
                this.f77925a = k2.b(((WebkitToCompatConverterBoundaryInterface) dVar.f77914b).convertSafeBrowsingResponse(Proxy.getInvocationHandler(this.f77926b)));
            }
            this.f77925a.showInterstitial(true);
            return;
        }
        if (!bVar.b()) {
            throw w.a();
        }
        if (this.f77926b == null) {
            d dVar2 = x.f77964a;
            this.f77926b = (SafeBrowsingResponseBoundaryInterface) u90.b.i(SafeBrowsingResponseBoundaryInterface.class, ((WebkitToCompatConverterBoundaryInterface) dVar2.f77914b).convertSafeBrowsingResponse(this.f77925a));
        }
        this.f77926b.showInterstitial(true);
    }

    public m(InvocationHandler invocationHandler) {
        this.f77926b = (SafeBrowsingResponseBoundaryInterface) u90.b.i(SafeBrowsingResponseBoundaryInterface.class, invocationHandler);
    }
}
