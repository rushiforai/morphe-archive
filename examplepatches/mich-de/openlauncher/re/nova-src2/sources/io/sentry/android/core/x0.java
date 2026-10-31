package io.sentry.android.core;

/* loaded from: classes4.dex */
public final class x0 implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final long f67087a;

    /* renamed from: b, reason: collision with root package name */
    public final long f67088b;

    /* renamed from: c, reason: collision with root package name */
    public final long f67089c;

    /* renamed from: d, reason: collision with root package name */
    public final long f67090d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f67091e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f67092f;

    /* renamed from: g, reason: collision with root package name */
    public final long f67093g;

    public x0(long j11) {
        this(j11, j11, 0L, 0L, false, false, 0L);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return Long.compare(this.f67088b, ((x0) obj).f67088b);
    }

    public x0(long j11, long j12, long j13, long j14, boolean z11, boolean z12, long j15) {
        this.f67087a = j11;
        this.f67088b = j12;
        this.f67089c = j13;
        this.f67090d = j14;
        this.f67091e = z11;
        this.f67092f = z12;
        this.f67093g = j15;
    }
}
