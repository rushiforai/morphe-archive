package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import java.io.File;

/* loaded from: classes3.dex */
public abstract class g implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final String f30307a;

    /* renamed from: b, reason: collision with root package name */
    public final long f30308b;

    /* renamed from: c, reason: collision with root package name */
    public final long f30309c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f30310d;

    /* renamed from: e, reason: collision with root package name */
    public final File f30311e;

    /* renamed from: f, reason: collision with root package name */
    public final long f30312f;

    public g(String str, long j11, long j12, long j13, File file) {
        this.f30307a = str;
        this.f30308b = j11;
        this.f30309c = j12;
        this.f30310d = file != null;
        this.f30311e = file;
        this.f30312f = j13;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        g gVar = (g) obj;
        if (!this.f30307a.equals(gVar.f30307a)) {
            return this.f30307a.compareTo(gVar.f30307a);
        }
        long j11 = this.f30308b - gVar.f30308b;
        if (j11 == 0) {
            return 0;
        }
        return j11 < 0 ? -1 : 1;
    }
}
