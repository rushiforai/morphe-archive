package n7;

import java.lang.reflect.InvocationHandler;
import org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface;

/* loaded from: classes2.dex */
public final class i implements WebViewNavigationListenerBoundaryInterface {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f77922a = {"WEB_VIEW_NAVIGATION_LISTENER_V1"};

    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof i)) {
            return false;
        }
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.FeatureFlagHolderBoundaryInterface
    public final String[] getSupportedFeatures() {
        return f77922a;
    }

    public final int hashCode() {
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onFirstContentfulPaint(InvocationHandler invocationHandler, long j11) {
        j.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onNavigationCompleted(InvocationHandler invocationHandler) {
        h.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onNavigationRedirected(InvocationHandler invocationHandler) {
        h.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onNavigationStarted(InvocationHandler invocationHandler) {
        h.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onPageDOMContentLoadedEventFired(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onPageDeleted(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.WebViewNavigationListenerBoundaryInterface
    public final void onPageLoadEventFired(InvocationHandler invocationHandler) {
        j.a(invocationHandler);
        throw null;
    }
}
