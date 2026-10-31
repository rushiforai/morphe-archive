package n7;

import android.webkit.WebResourceError;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import org.chromium.support_lib_boundary.WebResourceErrorBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;

/* loaded from: classes2.dex */
public final class t extends m7.m {

    /* renamed from: a, reason: collision with root package name */
    public WebResourceError f77936a;

    /* renamed from: b, reason: collision with root package name */
    public final WebResourceErrorBoundaryInterface f77937b;

    public t(WebResourceError webResourceError) {
        this.f77936a = webResourceError;
    }

    @Override // m7.m
    public final CharSequence a() throws IllegalArgumentException {
        if (this.f77936a == null) {
            d dVar = x.f77964a;
            this.f77936a = (WebResourceError) ((WebkitToCompatConverterBoundaryInterface) dVar.f77914b).convertWebResourceError(Proxy.getInvocationHandler(this.f77937b));
        }
        return this.f77936a.getDescription();
    }

    @Override // m7.m
    public final int b() throws IllegalArgumentException {
        if (this.f77936a == null) {
            d dVar = x.f77964a;
            this.f77936a = (WebResourceError) ((WebkitToCompatConverterBoundaryInterface) dVar.f77914b).convertWebResourceError(Proxy.getInvocationHandler(this.f77937b));
        }
        return this.f77936a.getErrorCode();
    }

    public t(InvocationHandler invocationHandler) {
        this.f77937b = (WebResourceErrorBoundaryInterface) u90.b.i(WebResourceErrorBoundaryInterface.class, invocationHandler);
    }
}
