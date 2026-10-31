package s90;

import android.net.http.BidirectionalStream;
import android.net.http.HttpEngine;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Executor;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.ExperimentalBidirectionalStream;

/* loaded from: classes5.dex */
public final class t extends ExperimentalBidirectionalStream.Builder {

    /* renamed from: a, reason: collision with root package name */
    public final h f87015a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87016b;

    /* renamed from: c, reason: collision with root package name */
    public final BidirectionalStream.Callback f87017c;

    /* renamed from: d, reason: collision with root package name */
    public final Executor f87018d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f87019e = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public String f87020f = "POST";

    /* renamed from: g, reason: collision with root package name */
    public int f87021g = 3;

    /* renamed from: h, reason: collision with root package name */
    public boolean f87022h;

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f87023i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f87024j;

    /* renamed from: k, reason: collision with root package name */
    public int f87025k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f87026l;

    /* renamed from: m, reason: collision with root package name */
    public int f87027m;

    public t(String str, BidirectionalStream.Callback callback, Executor executor, h hVar) {
        Objects.requireNonNull(str, "URL is required.");
        this.f87016b = str;
        Objects.requireNonNull(callback, "Callback is required.");
        this.f87017c = callback;
        Objects.requireNonNull(executor, "Executor is required.");
        this.f87018d = executor;
        this.f87015a = hVar;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder addHeader(String str, String str2) {
        Objects.requireNonNull(str, "Invalid header name.");
        Objects.requireNonNull(str2, "Invalid header value.");
        this.f87019e.add(new AbstractMap.SimpleImmutableEntry(str, str2));
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final /* bridge */ /* synthetic */ BidirectionalStream.Builder addRequestAnnotation(Object obj) {
        addRequestAnnotation(obj);
        return this;
    }

    @Override // org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder bindToNetwork(long j11) {
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder delayRequestHeadersUntilFirstFlush(boolean z11) {
        this.f87022h = z11;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder setHttpMethod(String str) {
        Objects.requireNonNull(str, "Method is required.");
        this.f87020f = str;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder setPriority(int i5) {
        this.f87021g = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder setTrafficStatsTag(int i5) {
        this.f87024j = true;
        this.f87025k = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final BidirectionalStream.Builder setTrafficStatsUid(int i5) {
        this.f87026l = true;
        this.f87027m = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder addRequestAnnotation(Object obj) {
        Objects.requireNonNull(obj, "Invalid metrics annotation.");
        if (this.f87023i == null) {
            this.f87023i = new ArrayList();
        }
        this.f87023i.add(obj);
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream build() {
        String str = this.f87020f;
        int i5 = this.f87021g;
        boolean z11 = this.f87022h;
        ArrayList arrayList = this.f87023i;
        boolean z12 = this.f87024j;
        int i11 = this.f87025k;
        boolean z13 = this.f87026l;
        int i12 = this.f87027m;
        h hVar = this.f87015a;
        hVar.getClass();
        a aVar = new a(this.f87017c);
        HttpEngine httpEngine = hVar.f86957a;
        String str2 = this.f87016b;
        BidirectionalStream.Builder builderNewBidirectionalStreamBuilder = httpEngine.newBidirectionalStreamBuilder(str2, this.f87018d, aVar);
        builderNewBidirectionalStreamBuilder.setHttpMethod(str);
        Iterator it = this.f87019e.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            builderNewBidirectionalStreamBuilder.addHeader((String) entry.getKey(), (String) entry.getValue());
        }
        builderNewBidirectionalStreamBuilder.setPriority(i5);
        builderNewBidirectionalStreamBuilder.setDelayRequestHeadersUntilFirstFlushEnabled(z11);
        if (z12) {
            builderNewBidirectionalStreamBuilder.setTrafficStatsTag(i11);
        }
        if (z13) {
            builderNewBidirectionalStreamBuilder.setTrafficStatsUid(i12);
        }
        b bVar = new b(builderNewBidirectionalStreamBuilder.build(), hVar, str2, arrayList);
        aVar.f86845b = bVar;
        return bVar;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder delayRequestHeadersUntilFirstFlush(boolean z11) {
        this.f87022h = z11;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder setHttpMethod(String str) {
        Objects.requireNonNull(str, "Method is required.");
        this.f87020f = str;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder setPriority(int i5) {
        this.f87021g = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder setTrafficStatsTag(int i5) {
        this.f87024j = true;
        this.f87025k = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder setTrafficStatsUid(int i5) {
        this.f87026l = true;
        this.f87027m = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalBidirectionalStream.Builder, org.chromium.net.BidirectionalStream.Builder
    public final ExperimentalBidirectionalStream.Builder addHeader(String str, String str2) {
        Objects.requireNonNull(str, "Invalid header name.");
        Objects.requireNonNull(str2, "Invalid header value.");
        this.f87019e.add(new AbstractMap.SimpleImmutableEntry(str, str2));
        return this;
    }
}
