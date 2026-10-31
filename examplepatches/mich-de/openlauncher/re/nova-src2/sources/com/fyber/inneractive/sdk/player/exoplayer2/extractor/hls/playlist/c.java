package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist;

/* loaded from: classes3.dex */
public final class c implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final String f29299a;

    /* renamed from: b, reason: collision with root package name */
    public final long f29300b;

    /* renamed from: c, reason: collision with root package name */
    public final int f29301c;

    /* renamed from: d, reason: collision with root package name */
    public final long f29302d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f29303e;

    /* renamed from: f, reason: collision with root package name */
    public final String f29304f;

    /* renamed from: g, reason: collision with root package name */
    public final String f29305g;

    /* renamed from: h, reason: collision with root package name */
    public final long f29306h;

    /* renamed from: i, reason: collision with root package name */
    public final long f29307i;

    public c(String str, long j11, int i5, long j12, boolean z11, String str2, String str3, long j13, long j14) {
        this.f29299a = str;
        this.f29300b = j11;
        this.f29301c = i5;
        this.f29302d = j12;
        this.f29303e = z11;
        this.f29304f = str2;
        this.f29305g = str3;
        this.f29306h = j13;
        this.f29307i = j14;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        Long l9 = (Long) obj;
        if (this.f29302d > l9.longValue()) {
            return 1;
        }
        return this.f29302d < l9.longValue() ? -1 : 0;
    }
}
