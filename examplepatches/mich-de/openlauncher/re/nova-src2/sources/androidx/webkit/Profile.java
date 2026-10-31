package androidx.webkit;

import android.os.CancellationSignal;
import android.webkit.CookieManager;
import android.webkit.GeolocationPermissions;
import android.webkit.ServiceWorkerController;
import android.webkit.WebStorage;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.Executor;
import m7.a;
import m7.d;
import m7.h;
import m7.i;

/* loaded from: classes2.dex */
public interface Profile {
    default void addCustomHeader(a aVar) {
    }

    default void addQuicHints(Set<String> set) {
        throw new UnsupportedOperationException("Profile#addQuicHints is not implemented.");
    }

    default void clearAllCustomHeaders() {
    }

    void clearAllOriginMatchedHeaders();

    default void clearCustomHeader(String str) {
    }

    void clearOriginMatchedHeader(String str);

    void clearPrefetchAsync(String str, Executor executor, d dVar);

    CookieManager getCookieManager();

    default Set<a> getCustomHeaders() {
        return Collections.EMPTY_SET;
    }

    GeolocationPermissions getGeolocationPermissions();

    String getName();

    ServiceWorkerController getServiceWorkerController();

    WebStorage getWebStorage();

    default boolean hasCustomHeader(String str) {
        return false;
    }

    boolean hasOriginMatchedHeader(String str);

    default void preconnect(String str) {
        throw new UnsupportedOperationException("Profile#preconnect is not implemented.");
    }

    void prefetchUrlAsync(String str, CancellationSignal cancellationSignal, Executor executor, d dVar);

    void prefetchUrlAsync(String str, CancellationSignal cancellationSignal, Executor executor, i iVar, d dVar);

    void setOriginMatchedHeader(String str, String str2, Set<String> set);

    void setSpeculativeLoadingConfig(h hVar);

    void warmUpRendererProcess();

    default void clearCustomHeader(String str, String str2) {
    }

    default Set<a> getCustomHeaders(String str) {
        return Collections.EMPTY_SET;
    }

    default Set<a> getCustomHeaders(String str, String str2) {
        return Collections.EMPTY_SET;
    }
}
