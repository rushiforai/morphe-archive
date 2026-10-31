package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist;

import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class d extends e {

    /* renamed from: b, reason: collision with root package name */
    public final int f29308b;

    /* renamed from: c, reason: collision with root package name */
    public final long f29309c;

    /* renamed from: d, reason: collision with root package name */
    public final long f29310d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f29311e;

    /* renamed from: f, reason: collision with root package name */
    public final int f29312f;

    /* renamed from: g, reason: collision with root package name */
    public final int f29313g;

    /* renamed from: h, reason: collision with root package name */
    public final int f29314h;

    /* renamed from: i, reason: collision with root package name */
    public final long f29315i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f29316j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f29317k;

    /* renamed from: l, reason: collision with root package name */
    public final c f29318l;

    /* renamed from: m, reason: collision with root package name */
    public final List f29319m;
    public final List n;
    public final long o;

    public d(int i5, String str, long j11, long j12, boolean z11, int i11, int i12, int i13, long j13, boolean z12, boolean z13, c cVar, List list, List list2) {
        super(str);
        this.f29308b = i5;
        this.f29310d = j12;
        this.f29311e = z11;
        this.f29312f = i11;
        this.f29313g = i12;
        this.f29314h = i13;
        this.f29315i = j13;
        this.f29316j = z12;
        this.f29317k = z13;
        this.f29318l = cVar;
        this.f29319m = Collections.unmodifiableList(list);
        if (list.isEmpty()) {
            this.o = 0L;
        } else {
            c cVar2 = (c) a2.c.e(1, list);
            this.o = cVar2.f29302d + cVar2.f29300b;
        }
        if (j11 == -9223372036854775807L) {
            j11 = -9223372036854775807L;
        } else if (j11 < 0) {
            j11 += this.o;
        }
        this.f29309c = j11;
        this.n = Collections.unmodifiableList(list2);
    }
}
