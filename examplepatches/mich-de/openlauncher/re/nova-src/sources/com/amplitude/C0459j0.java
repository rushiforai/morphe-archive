package com.amplitude;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.j0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0459j0 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c("sessionId")
    private final Long f20622a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("version")
    private final String f20623b;

    /* renamed from: c, reason: collision with root package name */
    @gn.c("androidVersion")
    private final int f20624c;

    /* renamed from: d, reason: collision with root package name */
    @gn.c("isComposeAvailable")
    private final boolean f20625d;

    /* renamed from: e, reason: collision with root package name */
    @gn.c("config")
    private final C0452i0 f20626e;

    /* renamed from: f, reason: collision with root package name */
    @gn.c("totalStorageSize")
    private final long f20627f;

    /* renamed from: g, reason: collision with root package name */
    @gn.c("percentOfQuota")
    private final double f20628g;

    /* renamed from: h, reason: collision with root package name */
    @gn.c("maxHeapSize")
    private final long f20629h;

    /* renamed from: i, reason: collision with root package name */
    @gn.c("availableHeapSize")
    private final long f20630i;

    /* renamed from: j, reason: collision with root package name */
    @gn.c("pendingEvents")
    private final long f20631j;

    /* renamed from: k, reason: collision with root package name */
    @gn.c("lastUploadTimestamp")
    private final Long f20632k;

    /* renamed from: l, reason: collision with root package name */
    @gn.c("failedUploadCount")
    private final int f20633l;

    /* renamed from: m, reason: collision with root package name */
    @gn.c("lastError")
    private final String f20634m;

    @gn.c("throttled")
    private final boolean n;

    @gn.c("bytesSentToday")
    private final int o;

    public C0459j0(Long l9, String version, int i5, boolean z11, C0452i0 config, long j11, double d5, long j12, long j13, long j14, Long l11, int i11, String str, boolean z12, int i12) {
        Intrinsics.g(version, "version");
        Intrinsics.g(config, "config");
        this.f20622a = l9;
        this.f20623b = version;
        this.f20624c = i5;
        this.f20625d = z11;
        this.f20626e = config;
        this.f20627f = j11;
        this.f20628g = d5;
        this.f20629h = j12;
        this.f20630i = j13;
        this.f20631j = j14;
        this.f20632k = l11;
        this.f20633l = i11;
        this.f20634m = str;
        this.n = z12;
        this.o = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0459j0)) {
            return false;
        }
        C0459j0 c0459j0 = (C0459j0) obj;
        return Intrinsics.b(this.f20622a, c0459j0.f20622a) && Intrinsics.b(this.f20623b, c0459j0.f20623b) && this.f20624c == c0459j0.f20624c && this.f20625d == c0459j0.f20625d && Intrinsics.b(this.f20626e, c0459j0.f20626e) && this.f20627f == c0459j0.f20627f && Double.compare(this.f20628g, c0459j0.f20628g) == 0 && this.f20629h == c0459j0.f20629h && this.f20630i == c0459j0.f20630i && this.f20631j == c0459j0.f20631j && Intrinsics.b(this.f20632k, c0459j0.f20632k) && this.f20633l == c0459j0.f20633l && Intrinsics.b(this.f20634m, c0459j0.f20634m) && this.n == c0459j0.n && this.o == c0459j0.o;
    }

    public final int hashCode() {
        Long l9 = this.f20622a;
        int iD = b.c0.d(b.c0.d(b.c0.d(c9.c(this.f20628g, b.c0.d((this.f20626e.hashCode() + c9.f(b.u4.a(this.f20624c, b.c0.e((l9 == null ? 0 : l9.hashCode()) * 31, 31, this.f20623b), 31), 31, this.f20625d)) * 31, 31, this.f20627f), 31), 31, this.f20629h), 31, this.f20630i), 31, this.f20631j);
        Long l11 = this.f20632k;
        int iA = b.u4.a(this.f20633l, (iD + (l11 == null ? 0 : l11.hashCode())) * 31, 31);
        String str = this.f20634m;
        return Integer.hashCode(this.o) + c9.f((iA + (str != null ? str.hashCode() : 0)) * 31, 31, this.n);
    }

    public final String toString() {
        Long l9 = this.f20622a;
        String str = this.f20623b;
        int i5 = this.f20624c;
        boolean z11 = this.f20625d;
        C0452i0 c0452i0 = this.f20626e;
        long j11 = this.f20627f;
        double d5 = this.f20628g;
        long j12 = this.f20629h;
        long j13 = this.f20630i;
        long j14 = this.f20631j;
        Long l11 = this.f20632k;
        int i11 = this.f20633l;
        String str2 = this.f20634m;
        boolean z12 = this.n;
        int i12 = this.o;
        StringBuilder sb2 = new StringBuilder("StateSnapshot(sessionId=");
        sb2.append(l9);
        sb2.append(", version=");
        sb2.append(str);
        sb2.append(", androidVersion=");
        sb2.append(i5);
        sb2.append(", isComposeAvailable=");
        sb2.append(z11);
        sb2.append(", config=");
        sb2.append(c0452i0);
        sb2.append(", totalStorageSize=");
        sb2.append(j11);
        sb2.append(", percentOfQuota=");
        sb2.append(d5);
        sb2.append(", maxHeapSize=");
        sb2.append(j12);
        b.c0.B(sb2, ", availableHeapSize=", j13, ", pendingEvents=");
        sb2.append(j14);
        sb2.append(", lastUploadTimestamp=");
        sb2.append(l11);
        sb2.append(", failedUploadCount=");
        sb2.append(i11);
        sb2.append(", lastError=");
        sb2.append(str2);
        sb2.append(", throttled=");
        sb2.append(z12);
        sb2.append(", bytesSentToday=");
        sb2.append(i12);
        sb2.append(")");
        return sb2.toString();
    }
}
