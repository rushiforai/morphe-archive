package com.amplitude;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.i0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0452i0 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c("sampleRate")
    private final double f20610a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("maskLevel")
    private final String f20611b;

    /* renamed from: c, reason: collision with root package name */
    @gn.c("lowMemoryMode")
    private final boolean f20612c;

    /* renamed from: d, reason: collision with root package name */
    @gn.c("maxStorageBytes")
    private final long f20613d;

    /* renamed from: e, reason: collision with root package name */
    @gn.c("maxBandwidthBytes")
    private final int f20614e;

    public C0452i0(double d5, String maskLevel, boolean z11, long j11, int i5) {
        Intrinsics.g(maskLevel, "maskLevel");
        this.f20610a = d5;
        this.f20611b = maskLevel;
        this.f20612c = z11;
        this.f20613d = j11;
        this.f20614e = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0452i0)) {
            return false;
        }
        C0452i0 c0452i0 = (C0452i0) obj;
        return Double.compare(this.f20610a, c0452i0.f20610a) == 0 && Intrinsics.b(this.f20611b, c0452i0.f20611b) && this.f20612c == c0452i0.f20612c && this.f20613d == c0452i0.f20613d && this.f20614e == c0452i0.f20614e;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f20614e) + b.c0.d(c9.f(b.c0.e(Double.hashCode(this.f20610a) * 31, 31, this.f20611b), 31, this.f20612c), 31, this.f20613d);
    }

    public final String toString() {
        return "DiagnosticsConfig(sampleRate=" + this.f20610a + ", maskLevel=" + this.f20611b + ", lowMemoryMode=" + this.f20612c + ", maxStorageBytes=" + this.f20613d + ", maxBandwidthBytes=" + this.f20614e + ")";
    }
}
