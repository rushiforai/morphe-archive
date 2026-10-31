package n7;

import androidx.webkit.WebViewFeature;
import java.lang.reflect.InvocationHandler;
import org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface;

/* loaded from: classes2.dex */
public final class s implements WebViewNavigationClientBoundaryInterface {
    @Override // org.chromium.support_lib_boundary.FeatureFlagHolderBoundaryInterface
    public final String[] getSupportedFeatures() {
        return new String[]{WebViewFeature.NAVIGATION_CALLBACK_BASIC};
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onFirstContentfulPaint(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onNavigationCompleted(InvocationHandler invocationHandler) {
        h.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onNavigationRedirected(InvocationHandler invocationHandler) {
        h.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onNavigationStarted(InvocationHandler invocationHandler) {
        h.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onPageDOMContentLoadedEventFired(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onPageDeleted(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationClientBoundaryInterface
    public final void onPageLoadEventFired(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }
}
