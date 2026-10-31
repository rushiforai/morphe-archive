package s90;

import android.util.Log;
import java.nio.ByteBuffer;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Objects;
import java.util.concurrent.Executor;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class e1 extends ExperimentalUrlRequest.Builder {

    /* renamed from: a, reason: collision with root package name */
    public final u f86910a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86911b;

    /* renamed from: c, reason: collision with root package name */
    public final UrlRequest.Callback f86912c;

    /* renamed from: d, reason: collision with root package name */
    public final Executor f86913d;

    /* renamed from: e, reason: collision with root package name */
    public String f86914e;

    /* renamed from: g, reason: collision with root package name */
    public boolean f86916g;

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f86918i;

    /* renamed from: j, reason: collision with root package name */
    public UploadDataProvider f86919j;

    /* renamed from: k, reason: collision with root package name */
    public Executor f86920k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f86921l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f86922m;
    public int n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public int f86923p;

    /* renamed from: q, reason: collision with root package name */
    public RequestFinishedInfo.Listener f86924q;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f86915f = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public int f86917h = 3;

    /* renamed from: r, reason: collision with root package name */
    public long f86925r = -1;

    public e1(String str, UrlRequest.Callback callback, Executor executor, u uVar) {
        Objects.requireNonNull(str, "URL is required.");
        this.f86911b = str;
        Objects.requireNonNull(callback, "Callback is required.");
        this.f86912c = callback;
        Objects.requireNonNull(executor, "Executor is required.");
        this.f86913d = executor;
        this.f86910a = uVar;
    }

    public final void a(String str, String str2) {
        Objects.requireNonNull(str, "Invalid header name.");
        Objects.requireNonNull(str2, "Invalid header value.");
        if (!"Accept-Encoding".equalsIgnoreCase(str)) {
            this.f86915f.add(new AbstractMap.SimpleEntry(str, str2));
        } else if (Log.isLoggable("e1", 3)) {
            new Exception();
        }
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final /* bridge */ /* synthetic */ ExperimentalUrlRequest.Builder addHeader(String str, String str2) {
        a(str, str2);
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder addRequestAnnotation(Object obj) {
        Objects.requireNonNull(obj, "Invalid metrics annotation.");
        if (this.f86918i == null) {
            this.f86918i = new ArrayList();
        }
        this.f86918i.add(obj);
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder allowDirectExecutor() {
        this.f86921l = true;
        return this;
    }

    @Override // org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder bindToNetwork(long j11) {
        this.f86925r = j11;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder disableCache() {
        this.f86916g = true;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder
    public final ExperimentalUrlRequest.Builder disableConnectionMigration() {
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final /* bridge */ /* synthetic */ UrlRequest.Builder setHttpMethod(String str) {
        setHttpMethod(str);
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setIdempotency(int i5) {
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setPriority(int i5) {
        this.f86917h = i5;
        return this;
    }

    @Override // org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder setRawCompressionDictionary(byte[] bArr, ByteBuffer byteBuffer, String str) {
        Objects.requireNonNull(bArr, "Hash is required");
        if (bArr.length != 32) {
            throw new IllegalArgumentException("SHA-256 hashes are supposed to be 32 bytes");
        }
        Objects.requireNonNull(byteBuffer, "Dictionary is required");
        if (!byteBuffer.isDirect()) {
            throw new IllegalArgumentException("byteBuffer must be a direct ByteBuffer.");
        }
        Objects.requireNonNull(str, "Dictionary ID cannot be null. If missing, pass an empty string");
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        this.f86924q = listener;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setTrafficStatsTag(int i5) {
        this.f86922m = true;
        this.n = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setTrafficStatsUid(int i5) {
        this.o = true;
        this.f86923p = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setUploadDataProvider(UploadDataProvider uploadDataProvider, Executor executor) {
        Objects.requireNonNull(uploadDataProvider, "Invalid UploadDataProvider.");
        this.f86919j = uploadDataProvider;
        Objects.requireNonNull(executor, "Invalid UploadDataProvider Executor.");
        this.f86920k = executor;
        if (this.f86914e == null) {
            this.f86914e = "POST";
        }
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final /* bridge */ /* synthetic */ UrlRequest.Builder addHeader(String str, String str2) {
        a(str, str2);
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder allowDirectExecutor() {
        this.f86921l = true;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest build() {
        int i5 = this.f86917h;
        ArrayList arrayList = this.f86918i;
        boolean z11 = this.f86916g;
        boolean z12 = this.f86921l;
        boolean z13 = this.f86922m;
        int i11 = this.n;
        boolean z14 = this.o;
        int i12 = this.f86923p;
        RequestFinishedInfo.Listener listener = this.f86924q;
        long j11 = this.f86925r;
        String str = this.f86914e;
        if (str == null) {
            str = "GET";
        }
        return this.f86910a.a(this.f86911b, this.f86912c, this.f86913d, i5, arrayList, z11, z12, z13, i11, z14, i12, listener, j11, str, this.f86915f, this.f86919j, this.f86920k);
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder disableCache() {
        this.f86916g = true;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final ExperimentalUrlRequest.Builder setHttpMethod(String str) {
        Objects.requireNonNull(str, "Method is required.");
        this.f86914e = str;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder setPriority(int i5) {
        this.f86917h = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder setRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        this.f86924q = listener;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder setTrafficStatsTag(int i5) {
        this.f86922m = true;
        this.n = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder setTrafficStatsUid(int i5) {
        this.o = true;
        this.f86923p = i5;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder addRequestAnnotation(Object obj) {
        Objects.requireNonNull(obj, "Invalid metrics annotation.");
        if (this.f86918i == null) {
            this.f86918i = new ArrayList();
        }
        this.f86918i.add(obj);
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public final UrlRequest.Builder setUploadDataProvider(UploadDataProvider uploadDataProvider, Executor executor) {
        Objects.requireNonNull(uploadDataProvider, "Invalid UploadDataProvider.");
        this.f86919j = uploadDataProvider;
        Objects.requireNonNull(executor, "Invalid UploadDataProvider Executor.");
        this.f86920k = executor;
        if (this.f86914e == null) {
            this.f86914e = "POST";
        }
        return this;
    }
}
