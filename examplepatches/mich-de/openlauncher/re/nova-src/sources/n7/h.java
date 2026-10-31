package n7;

import java.lang.reflect.InvocationHandler;
import java.util.Objects;
import org.chromium.support_lib_boundary.WebViewNavigationBoundaryInterface;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public WebViewNavigationBoundaryInterface f77921a;

    public static void a(InvocationHandler invocationHandler) {
        WebViewNavigationBoundaryInterface webViewNavigationBoundaryInterface = (WebViewNavigationBoundaryInterface) u90.b.i(WebViewNavigationBoundaryInterface.class, invocationHandler);
        Object orCreatePeer = webViewNavigationBoundaryInterface.getOrCreatePeer(new ab.e(webViewNavigationBoundaryInterface, 13));
        Objects.requireNonNull(orCreatePeer);
    }
}
