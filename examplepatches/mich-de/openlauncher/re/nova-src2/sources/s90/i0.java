package s90;

import android.content.Context;
import android.os.Trace;
import android.util.Log;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandlerFactory;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.ExperimentalBidirectionalStream;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.NetworkQualityRttListener;
import org.chromium.net.NetworkQualityThroughputListener;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;
import org.chromium.net.impl.ImplVersion;

/* loaded from: classes5.dex */
public final class i0 extends u {

    /* renamed from: a, reason: collision with root package name */
    public final String f86960a;

    /* renamed from: b, reason: collision with root package name */
    public final ThreadPoolExecutor f86961b;

    /* renamed from: c, reason: collision with root package name */
    public final int f86962c;

    /* renamed from: d, reason: collision with root package name */
    public final e0 f86963d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicInteger f86964e = new AtomicInteger();

    /* renamed from: f, reason: collision with root package name */
    public long f86965f = -1;

    /* renamed from: g, reason: collision with root package name */
    public final Context f86966g;

    public i0(j0 j0Var) {
        p90.a.a("JavaCronetEngine#JavaCronetEngine");
        try {
            Context context = j0Var.f87036b;
            this.f86966g = context;
            int iHashCode = hashCode();
            this.f86962c = iHashCode;
            this.f86960a = j0Var.f87040f;
            this.f86961b = new ThreadPoolExecutor(10, 10, 50L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new o80.c(2));
            e0 e0VarA = d0.a(context, a0.f86849d);
            this.f86963d = e0VarA;
            try {
                e0VarA.e(iHashCode, j0Var.c(), b());
            } catch (RuntimeException e3) {
                Log.e("i0", "Error while trying to log JavaCronetEngine creation: ", e3);
            }
            Log.w("i0", "using the fallback Cronet Engine implementation. Performance will suffer and many HTTP client features, including caching, will not work.");
            Trace.endSection();
        } finally {
        }
    }

    @Override // s90.u
    public final ExperimentalUrlRequest a(String str, UrlRequest.Callback callback, Executor executor, int i5, ArrayList arrayList, boolean z11, boolean z12, boolean z13, int i11, boolean z14, int i12, RequestFinishedInfo.Listener listener, long j11, String str2, ArrayList arrayList2, UploadDataProvider uploadDataProvider, Executor executor2) {
        if (j11 != -1) {
            this.f86965f = j11;
        }
        return new a1(this, callback, this.f86961b, executor, str, this.f86960a, z12, z13, i11, z14, i12, this.f86965f, str2, arrayList2, uploadDataProvider, executor2);
    }

    @Override // org.chromium.net.CronetEngine
    public final void addRequestFinishedListener(RequestFinishedInfo.Listener listener) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void addRttListener(NetworkQualityRttListener networkQualityRttListener) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void addThroughputListener(NetworkQualityThroughputListener networkQualityThroughputListener) {
    }

    public final c0 b() {
        return new c0(getVersionString().split("/")[1].split("@")[0]);
    }

    @Override // org.chromium.net.CronetEngine
    public final void bindToNetwork(long j11) {
        this.f86965f = j11;
    }

    @Override // org.chromium.net.CronetEngine
    public final void configureNetworkQualityEstimatorForTesting(boolean z11, boolean z12, boolean z13) {
    }

    @Override // org.chromium.net.CronetEngine
    public final URLStreamHandlerFactory createURLStreamHandlerFactory() {
        return new h0();
    }

    @Override // org.chromium.net.CronetEngine
    public final int getActiveRequestCount() {
        return this.f86964e.get();
    }

    @Override // org.chromium.net.CronetEngine
    public final int getDownstreamThroughputKbps() {
        return -1;
    }

    @Override // org.chromium.net.CronetEngine
    public final int getEffectiveConnectionType() {
        return 0;
    }

    @Override // org.chromium.net.CronetEngine
    public final byte[] getGlobalMetricsDeltas() {
        return new byte[0];
    }

    @Override // org.chromium.net.CronetEngine
    public final int getHttpRttMs() {
        return -1;
    }

    @Override // org.chromium.net.CronetEngine
    public final int getTransportRttMs() {
        return -1;
    }

    @Override // org.chromium.net.CronetEngine
    public final String getVersionString() {
        return b.c0.k("CronetHttpURLConnection/", ImplVersion.getCronetVersionWithLastChange());
    }

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final /* bridge */ /* synthetic */ BidirectionalStream.Builder newBidirectionalStreamBuilder(String str, BidirectionalStream.Callback callback, Executor executor) {
        newBidirectionalStreamBuilder(str, callback, executor);
        throw null;
    }

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final UrlRequest.Builder newUrlRequestBuilder(String str, UrlRequest.Callback callback, Executor executor) {
        return new e1(str, callback, executor, this);
    }

    @Override // org.chromium.net.CronetEngine
    public final URLConnection openConnection(URL url) {
        return url.openConnection();
    }

    @Override // org.chromium.net.CronetEngine
    public final void removeRequestFinishedListener(RequestFinishedInfo.Listener listener) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void removeRttListener(NetworkQualityRttListener networkQualityRttListener) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void removeThroughputListener(NetworkQualityThroughputListener networkQualityThroughputListener) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void shutdown() {
        this.f86961b.shutdown();
    }

    @Override // org.chromium.net.CronetEngine
    public final void startNetLogToDisk(String str, boolean z11, int i5) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void startNetLogToFile(String str, boolean z11) {
    }

    @Override // org.chromium.net.CronetEngine
    public final void stopNetLog() {
    }

    @Override // org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public final ExperimentalBidirectionalStream.Builder newBidirectionalStreamBuilder(String str, BidirectionalStream.Callback callback, Executor executor) {
        throw new UnsupportedOperationException("The bidirectional stream API is not supported by the Java implementation of Cronet Engine");
    }

    @Override // org.chromium.net.ExperimentalCronetEngine
    public final URLConnection openConnection(URL url, Proxy proxy) {
        return url.openConnection(proxy);
    }
}
