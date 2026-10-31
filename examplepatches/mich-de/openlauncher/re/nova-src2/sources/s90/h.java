package s90;

import android.net.Network;
import android.net.http.HttpEngine;
import android.net.http.UrlRequest;
import android.util.Log;
import java.io.IOException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandlerFactory;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Executor;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.ExperimentalBidirectionalStream;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class h extends u {

    /* renamed from: c, reason: collision with root package name */
    public static boolean f86955c;

    /* renamed from: d, reason: collision with root package name */
    public static boolean f86956d;

    /* renamed from: a, reason: collision with root package name */
    public final HttpEngine f86957a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f86958b = Collections.synchronizedMap(new HashMap());

    public h(HttpEngine httpEngine) {
        this.f86957a = httpEngine;
    }

    @Override // s90.u
    public final ExperimentalUrlRequest a(String str, UrlRequest.Callback callback, Executor executor, int i5, ArrayList arrayList, boolean z11, boolean z12, boolean z13, int i11, boolean z14, int i12, RequestFinishedInfo.Listener listener, long j11, String str2, ArrayList arrayList2, UploadDataProvider uploadDataProvider, Executor executor2) {
        p pVar = new p(callback);
        UrlRequest.Builder builderNewUrlRequestBuilder = this.f86957a.newUrlRequestBuilder(str, executor, pVar);
        builderNewUrlRequestBuilder.setPriority(i5);
        if (z11) {
            builderNewUrlRequestBuilder.setCacheDisabled(z11);
        }
        if (z12) {
            builderNewUrlRequestBuilder.setDirectExecutorAllowed(z12);
        }
        if (z13) {
            builderNewUrlRequestBuilder.setTrafficStatsTag(i11);
        }
        if (z14) {
            builderNewUrlRequestBuilder.setTrafficStatsTag(i12);
        }
        builderNewUrlRequestBuilder.bindToNetwork(j11 == -1 ? null : Network.fromNetworkHandle(j11));
        builderNewUrlRequestBuilder.setHttpMethod(str2);
        Iterator it = arrayList2.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            builderNewUrlRequestBuilder.addHeader((String) entry.getKey(), (String) entry.getValue());
        }
        if (uploadDataProvider != null) {
            builderNewUrlRequestBuilder.setUploadDataProvider(new n(uploadDataProvider), executor2);
        }
        r rVar = new r(builderNewUrlRequestBuilder.build(), this, str, arrayList, listener);
        pVar.f86995b = rVar;
        return rVar;
    }

    @Override // org.chromium.net.CronetEngine
    public final void addRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        this.f86958b.put(listener, new h1(listener));
    }

    @Override // org.chromium.net.CronetEngine
    public final void bindToNetwork(long j11) {
        this.f86957a.bindToNetwork(j11 == -1 ? null : Network.fromNetworkHandle(j11));
    }

    @Override // org.chromium.net.CronetEngine
    public final URLStreamHandlerFactory createURLStreamHandlerFactory() {
        return this.f86957a.createUrlStreamHandlerFactory();
    }

    @Override // org.chromium.net.CronetEngine
    public final byte[] getGlobalMetricsDeltas() {
        if (!f86956d) {
            Log.i("HttpEngineWrapper", "GlobalMetricsDelta is unsupported when HttpEngineNativeProvider is used. An empty protobuf is returned.");
            f86956d = true;
        }
        return new byte[0];
    }

    @Override // org.chromium.net.CronetEngine
    public final String getVersionString() {
        return HttpEngine.getVersionString();
    }

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final BidirectionalStream.Builder newBidirectionalStreamBuilder(String str, BidirectionalStream.Callback callback, Executor executor) {
        return new t(str, callback, executor, this);
    }

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final UrlRequest.Builder newUrlRequestBuilder(String str, UrlRequest.Callback callback, Executor executor) {
        return new e1(str, callback, executor, this);
    }

    @Override // org.chromium.net.CronetEngine
    public final URLConnection openConnection(URL url) {
        return (URLConnection) d0.b(new q10.d(1, this, url), IOException.class);
    }

    @Override // org.chromium.net.CronetEngine
    public final void removeRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        this.f86958b.remove(listener);
    }

    @Override // org.chromium.net.CronetEngine
    public final void shutdown() {
        this.f86957a.shutdown();
    }

    @Override // org.chromium.net.CronetEngine
    public final void startNetLogToFile(String str, boolean z11) {
        if (f86955c) {
            return;
        }
        Log.i("HttpEngineWrapper", "Netlog is unsupported when HttpEngineNativeProvider is used.");
        f86955c = true;
    }

    @Override // org.chromium.net.CronetEngine
    public final void stopNetLog() {
    }

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final ExperimentalBidirectionalStream.Builder newBidirectionalStreamBuilder(String str, BidirectionalStream.Callback callback, Executor executor) {
        return new t(str, callback, executor, this);
    }

    @Override // org.chromium.net.ExperimentalCronetEngine
    public final URLConnection openConnection(URL url, Proxy proxy) {
        if (proxy.type() != Proxy.Type.DIRECT) {
            throw new UnsupportedOperationException();
        }
        String protocol = url.getProtocol();
        if ("http".equals(protocol) || "https".equals(protocol)) {
            return openConnection(url);
        }
        throw new UnsupportedOperationException(b.c0.k("Unexpected protocol:", protocol));
    }
}
