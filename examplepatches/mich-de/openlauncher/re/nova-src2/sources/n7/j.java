package n7;

import java.lang.reflect.InvocationHandler;
import java.util.Objects;
import org.chromium.support_lib_boundary.WebViewPageBoundaryInterface;

/* loaded from: classes2.dex */
public final class j {
    private final WebViewPageBoundaryInterface mPageBoundaryInterface;

    public j(WebViewPageBoundaryInterface webViewPageBoundaryInterface) {
        this.mPageBoundaryInterface = webViewPageBoundaryInterface;
    }

    public static void a(InvocationHandler invocationHandler) {
        WebViewPageBoundaryInterface webViewPageBoundaryInterface = (WebViewPageBoundaryInterface) u90.b.i(WebViewPageBoundaryInterface.class, invocationHandler);
        Object orCreatePeer = webViewPageBoundaryInterface.getOrCreatePeer(new ab.e(webViewPageBoundaryInterface, 14));
        Objects.requireNonNull(orCreatePeer);
    }
}
