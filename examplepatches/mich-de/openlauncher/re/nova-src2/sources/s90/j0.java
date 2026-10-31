package s90;

import android.util.Base64;
import java.io.File;
import java.net.IDN;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;
import org.chromium.net.CronetEngine;
import org.chromium.net.ExperimentalCronetEngine;
import org.chromium.net.ICronetEngineBuilder;
import org.chromium.net.ProxyOptions;

/* loaded from: classes5.dex */
public final class j0 extends v {

    /* renamed from: p, reason: collision with root package name */
    public static final AtomicLong f86968p = new AtomicLong(0);

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder addPublicKeyPins(String str, Set set, boolean z11, Date date) {
        Objects.requireNonNull(str, "The hostname cannot be null.");
        Objects.requireNonNull(set, "The set of SHA256 pins cannot be null.");
        Objects.requireNonNull(date, "The pin expiration date cannot be null.");
        if (v.n.matcher(str).matches()) {
            throw new IllegalArgumentException(b.c0.l("Hostname ", str, " is illegal. A hostname should not consist of digits and/or dots only."));
        }
        if (str.length() > 255) {
            throw new IllegalArgumentException(b.c0.l("Hostname ", str, " is too long. The name of the host does not comply with RFC 1122 and RFC 1123."));
        }
        try {
            IDN.toASCII(str, 2);
            HashMap map = new HashMap();
            Iterator it = set.iterator();
            while (it.hasNext()) {
                byte[] bArr = (byte[]) it.next();
                if (bArr == null || bArr.length != 32) {
                    throw new IllegalArgumentException("Public key pin is invalid");
                }
                map.put(Base64.encodeToString(bArr, 0), bArr);
            }
            this.f87038d.add(new br.a(23));
            return this;
        } catch (IllegalArgumentException unused) {
            throw new IllegalArgumentException(b.c0.l("Hostname ", str, " is illegal. The name of the host does not comply with RFC 1122 and RFC 1123."));
        }
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder addQuicHint(String str, int i5, int i11) {
        if (str.contains("/")) {
            throw new IllegalArgumentException("Illegal QUIC Hint Host: ".concat(str));
        }
        this.f87037c.add(new br.c());
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ExperimentalCronetEngine build() {
        if (this.f87040f == null) {
            this.f87040f = getDefaultUserAgent();
        }
        return new i0(this);
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableBrotli(boolean z11) {
        this.f87044j = z11;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableHttp2(boolean z11) {
        this.f87043i = z11;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final /* bridge */ /* synthetic */ ICronetEngineBuilder enableHttpCache(int i5, long j11) {
        a(i5);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableNetworkQualityEstimator(boolean z11) {
        this.f87047m = z11;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enablePublicKeyPinningBypassForLocalTrustAnchors(boolean z11) {
        this.f87039e = z11;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableQuic(boolean z11) {
        this.f87042h = z11;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder enableSdch(boolean z11) {
        return this;
    }

    @Override // s90.v, org.chromium.net.ICronetEngineBuilder
    public final long getLogCronetInitializationRef() {
        long jA = this.f87035a.a();
        AtomicLong atomicLong = f86968p;
        atomicLong.compareAndSet(0L, jA);
        return atomicLong.get();
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setExperimentalOptions(String str) {
        this.f87046l = str;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setLibraryLoader(CronetEngine.Builder.LibraryLoader libraryLoader) {
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setProxyOptions(ProxyOptions proxyOptions) {
        if (proxyOptions != null) {
            if (e0.b() < 38) {
                throw new AssertionError(b.c0.i(e0.b(), "This should have not been created: the Cronet API being used has an ApiLevel of ", ", but setProxyOptions was added in ApiLevel 38"));
            }
            if (proxyOptions.getProxyList().isEmpty()) {
                throw new AssertionError("The list of proxies should never be empty, this is checked in the API layer");
            }
        }
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setStoragePath(String str) {
        if (!new File(str).isDirectory()) {
            throw new IllegalArgumentException("Storage path must be set to existing directory");
        }
        this.f87041g = str;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setThreadPriority(int i5) {
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final ICronetEngineBuilder setUserAgent(String str) {
        this.f87040f = str;
        return this;
    }
}
