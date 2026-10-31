package s90;

import java.util.Date;
import org.chromium.net.RequestFinishedInfo;

/* loaded from: classes5.dex */
public final class f0 extends RequestFinishedInfo.Metrics {

    /* renamed from: a, reason: collision with root package name */
    public final long f86926a = -1;

    /* renamed from: b, reason: collision with root package name */
    public final long f86927b = -1;

    /* renamed from: c, reason: collision with root package name */
    public final long f86928c = -1;

    /* renamed from: d, reason: collision with root package name */
    public final long f86929d = -1;

    /* renamed from: e, reason: collision with root package name */
    public final long f86930e = -1;

    /* renamed from: f, reason: collision with root package name */
    public final long f86931f = -1;

    /* renamed from: g, reason: collision with root package name */
    public final long f86932g = -1;

    /* renamed from: h, reason: collision with root package name */
    public final long f86933h = -1;

    /* renamed from: i, reason: collision with root package name */
    public final long f86934i = -1;

    /* renamed from: j, reason: collision with root package name */
    public final long f86935j = -1;

    /* renamed from: k, reason: collision with root package name */
    public final long f86936k = -1;

    /* renamed from: l, reason: collision with root package name */
    public final long f86937l = -1;

    /* renamed from: m, reason: collision with root package name */
    public final long f86938m = -1;

    /* renamed from: p, reason: collision with root package name */
    public final Long f86939p = 0L;

    /* renamed from: q, reason: collision with root package name */
    public final Long f86940q = 0L;
    public final Long n = null;
    public final Long o = null;

    public static Date a(long j11) {
        if (j11 != -1) {
            return new Date(j11);
        }
        return null;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getConnectEnd() {
        return a(this.f86930e);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getConnectStart() {
        return a(this.f86929d);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getDnsEnd() {
        return a(this.f86928c);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getDnsStart() {
        return a(this.f86927b);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getPushEnd() {
        return a(this.f86936k);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getPushStart() {
        return a(this.f86935j);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Long getReceivedByteCount() {
        return this.f86940q;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getRequestEnd() {
        return a(this.f86938m);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getRequestStart() {
        return a(this.f86926a);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getResponseStart() {
        return a(this.f86937l);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getSendingEnd() {
        return a(this.f86934i);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getSendingStart() {
        return a(this.f86933h);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Long getSentByteCount() {
        return this.f86939p;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final boolean getSocketReused() {
        return false;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getSslEnd() {
        return a(this.f86932g);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Date getSslStart() {
        return a(this.f86931f);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Long getTotalTimeMs() {
        return this.o;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public final Long getTtfbMs() {
        return this.n;
    }
}
