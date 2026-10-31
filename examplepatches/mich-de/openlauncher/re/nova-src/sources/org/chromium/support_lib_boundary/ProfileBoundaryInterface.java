package org.chromium.support_lib_boundary;

import android.os.CancellationSignal;
import android.webkit.CookieManager;
import android.webkit.GeolocationPermissions;
import android.webkit.ServiceWorkerController;
import android.webkit.WebStorage;
import java.lang.reflect.InvocationHandler;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

/* loaded from: classes5.dex */
public interface ProfileBoundaryInterface {
    void addOriginMatchedHeader(String str, String str2, Set<String> set);

    void addQuicHints(Set<String> set);

    void clearAllOriginMatchedHeaders();

    @Deprecated
    void clearOriginMatchedHeader(String str);

    void clearOriginMatchedHeader(String str, String str2);

    void clearPrefetch(String str, Executor executor, InvocationHandler invocationHandler);

    CookieManager getCookieManager();

    GeolocationPermissions getGeoLocationPermissions();

    String getName();

    List<InvocationHandler> getOriginMatchedHeaders(String str, String str2);

    ServiceWorkerController getServiceWorkerController();

    WebStorage getWebStorage();

    boolean hasOriginMatchedHeader(String str);

    void preconnect(String str);

    void prefetchUrl(String str, CancellationSignal cancellationSignal, Executor executor, InvocationHandler invocationHandler);

    void prefetchUrl(String str, CancellationSignal cancellationSignal, Executor executor, InvocationHandler invocationHandler, InvocationHandler invocationHandler2);

    @Deprecated
    void setOriginMatchedHeader(String str, String str2, Set<String> set);

    void setSpeculativeLoadingConfig(InvocationHandler invocationHandler);

    void warmUpRendererProcess();
}
